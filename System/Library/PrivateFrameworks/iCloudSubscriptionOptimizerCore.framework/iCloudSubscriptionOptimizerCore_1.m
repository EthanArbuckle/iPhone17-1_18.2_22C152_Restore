uint64_t assignWithCopy for NewOfferResponse(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  int *v18;
  uint64_t (*v19)(char *, uint64_t, int *);
  char *v20;
  int v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  void (*v34)(char *, void, uint64_t, int *);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int *v59;

  v6 = sub_2372A4780();
  v57 = *(void *)(v6 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 24);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = *(_WORD *)(v10 + 8);
  *(void *)v9 = *(void *)v10;
  *(_WORD *)(v9 + 8) = v11;
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  LOBYTE(v11) = *(unsigned char *)(v14 + 8);
  *(void *)v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = v11;
  v58 = a2;
  v59 = a3;
  v15 = a3[7];
  v16 = (char *)(a1 + v15);
  v17 = (char *)(a2 + v15);
  v18 = (int *)type metadata accessor for QuotaServerState(0);
  v56 = *((void *)v18 - 1);
  v19 = *(uint64_t (**)(char *, uint64_t, int *))(v56 + 48);
  v20 = v16;
  LODWORD(v16) = v19(v16, 1, v18);
  v21 = v19(v17, 1, v18);
  if (!v16)
  {
    if (!v21)
    {
      v7((uint64_t)v20, (uint64_t)v17, v6);
      v44 = v18[5];
      v45 = &v20[v44];
      v46 = &v17[v44];
      *(void *)v45 = *(void *)v46;
      *((void *)v45 + 1) = *((void *)v46 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v47 = v18[6];
      v48 = &v20[v47];
      v49 = &v17[v47];
      *(void *)v48 = *(void *)v49;
      *((void *)v48 + 1) = *((void *)v49 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v50 = v18[7];
      v51 = &v20[v50];
      v52 = &v17[v50];
      *(void *)v51 = *(void *)v52;
      *((void *)v51 + 1) = *((void *)v52 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v53 = v18[8];
      v54 = &v20[v53];
      v55 = &v17[v53];
      *(void *)v54 = *(void *)v55;
      *((void *)v54 + 1) = *((void *)v55 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_23723CDC0((uint64_t)v20, type metadata accessor for QuotaServerState);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
    memcpy(v20, v17, *(void *)(*(void *)(v35 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v20, v17, v6);
  v22 = v18[5];
  v23 = &v20[v22];
  v24 = &v17[v22];
  *(void *)v23 = *(void *)v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  v25 = v18[6];
  v26 = &v20[v25];
  v27 = &v17[v25];
  *(void *)v26 = *(void *)v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  v28 = v18[7];
  v29 = &v20[v28];
  v30 = &v17[v28];
  *(void *)v29 = *(void *)v30;
  *((void *)v29 + 1) = *((void *)v30 + 1);
  v31 = v18[8];
  v32 = &v20[v31];
  v33 = &v17[v31];
  *(void *)v32 = *(void *)v33;
  *((void *)v32 + 1) = *((void *)v33 + 1);
  v34 = *(void (**)(char *, void, uint64_t, int *))(v56 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v34(v20, 0, 1, v18);
LABEL_7:
  v36 = v59[8];
  v37 = a1 + v36;
  v38 = (uint64_t *)(v58 + v36);
  v39 = *v38;
  *(unsigned char *)(v37 + 8) = *((unsigned char *)v38 + 8);
  *(void *)v37 = v39;
  v40 = v59[9];
  v41 = (void *)(a1 + v40);
  v42 = (void *)(v58 + v40);
  *v41 = *v42;
  v41[1] = v42[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for NewOfferResponse(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = a1 + v8;
  uint64_t v11 = a2 + v8;
  *(void *)uint64_t v10 = *(void *)v11;
  *(_WORD *)(v10 + 8) = *(_WORD *)(v11 + 8);
  uint64_t v12 = a1 + v9;
  uint64_t v13 = a2 + v9;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  uint64_t v14 = a3[7];
  v15 = (char *)(a1 + v14);
  v16 = (char *)(a2 + v14);
  v17 = (int *)type metadata accessor for QuotaServerState(0);
  uint64_t v18 = *((void *)v17 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v15, (uint64_t)v16, v6);
    *(_OWORD *)&v15[v17[5]] = *(_OWORD *)&v16[v17[5]];
    *(_OWORD *)&v15[v17[6]] = *(_OWORD *)&v16[v17[6]];
    *(_OWORD *)&v15[v17[7]] = *(_OWORD *)&v16[v17[7]];
    *(_OWORD *)&v15[v17[8]] = *(_OWORD *)&v16[v17[8]];
    (*(void (**)(char *, void, uint64_t, int *))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v20 = a3[8];
  uint64_t v21 = a3[9];
  uint64_t v22 = a1 + v20;
  uint64_t v23 = a2 + v20;
  *(void *)uint64_t v22 = *(void *)v23;
  *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
  *(_OWORD *)(a1 + v21) = *(_OWORD *)(a2 + v21);
  return a1;
}

uint64_t assignWithTake for NewOfferResponse(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v51 = *(void *)(v6 - 8);
  v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 40);
  v52(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(_WORD *)(v9 + 8) = *(_WORD *)(v10 + 8);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  v54 = a3;
  uint64_t v13 = a3[7];
  uint64_t v14 = (char *)(a1 + v13);
  uint64_t v53 = a2;
  v15 = (char *)(a2 + v13);
  v16 = (int *)type metadata accessor for QuotaServerState(0);
  uint64_t v17 = *((void *)v16 - 1);
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t, int *))(v17 + 48);
  int v19 = v18(v14, 1, v16);
  int v20 = v18(v15, 1, v16);
  if (!v19)
  {
    if (!v20)
    {
      v52((uint64_t)v14, (uint64_t)v15, v6);
      uint64_t v31 = v16[5];
      v32 = &v14[v31];
      v33 = &v15[v31];
      uint64_t v35 = *(void *)v33;
      uint64_t v34 = *((void *)v33 + 1);
      *(void *)v32 = v35;
      *((void *)v32 + 1) = v34;
      swift_bridgeObjectRelease();
      uint64_t v36 = v16[6];
      v37 = &v14[v36];
      v38 = &v15[v36];
      uint64_t v40 = *(void *)v38;
      uint64_t v39 = *((void *)v38 + 1);
      *(void *)v37 = v40;
      *((void *)v37 + 1) = v39;
      swift_bridgeObjectRelease();
      uint64_t v41 = v16[7];
      v42 = &v14[v41];
      v43 = &v15[v41];
      uint64_t v45 = *(void *)v43;
      uint64_t v44 = *((void *)v43 + 1);
      *(void *)v42 = v45;
      *((void *)v42 + 1) = v44;
      swift_bridgeObjectRelease();
      uint64_t v46 = v16[8];
      v47 = &v14[v46];
      v48 = &v15[v46];
      uint64_t v50 = *(void *)v48;
      uint64_t v49 = *((void *)v48 + 1);
      *(void *)v47 = v50;
      *((void *)v47 + 1) = v49;
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_23723CDC0((uint64_t)v14, type metadata accessor for QuotaServerState);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
    memcpy(v14, v15, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v14, v15, v6);
  *(_OWORD *)&v14[v16[5]] = *(_OWORD *)&v15[v16[5]];
  *(_OWORD *)&v14[v16[6]] = *(_OWORD *)&v15[v16[6]];
  *(_OWORD *)&v14[v16[7]] = *(_OWORD *)&v15[v16[7]];
  *(_OWORD *)&v14[v16[8]] = *(_OWORD *)&v15[v16[8]];
  (*(void (**)(char *, void, uint64_t, int *))(v17 + 56))(v14, 0, 1, v16);
LABEL_7:
  uint64_t v22 = v54[8];
  uint64_t v23 = v54[9];
  uint64_t v24 = a1 + v22;
  uint64_t v25 = v53 + v22;
  *(void *)uint64_t v24 = *(void *)v25;
  *(unsigned char *)(v24 + 8) = *(unsigned char *)(v25 + 8);
  v26 = (void *)(a1 + v23);
  v27 = (uint64_t *)(v53 + v23);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  void *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NewOfferResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23727F5F4);
}

uint64_t sub_23727F5F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 28);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 36) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for NewOfferResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23727F730);
}

uint64_t sub_23727F730(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_2372A4780();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 36) + 8) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 28);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23727F848()
{
  sub_2372A4780();
  if (v0 <= 0x3F)
  {
    sub_23727E6E0(319, &qword_26AECE098, (void (*)(uint64_t))type metadata accessor for QuotaServerState);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for PingRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0_0);
}

uint64_t storeEnumTagSinglePayload for PingRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0_0);
}

uint64_t getEnumTagSinglePayload for PingResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0_1);
}

uint64_t storeEnumTagSinglePayload for PingResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0_1);
}

uint64_t *initializeBufferWithCopyOfBuffer for FeaturesRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2372A4780();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 28);
    uint64_t v14 = (char *)v7 + v13;
    int v15 = (char *)a2 + v13;
    *(void *)uint64_t v14 = *(void *)v15;
    v14[8] = v15[8];
  }
  return v7;
}

void *initializeWithCopy for FeaturesRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2372A4780();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  return a1;
}

void *assignWithCopy for FeaturesRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  char v13 = v12[8];
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v13;
  return a1;
}

_OWORD *initializeWithTake for FeaturesRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v12[8];
  return a1;
}

void *assignWithTake for FeaturesRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v12[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for FeaturesRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_32Tm);
}

uint64_t storeEnumTagSinglePayload for FeaturesRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_33Tm);
}

uint64_t sub_23727FE04()
{
  return sub_237288F38();
}

uint64_t *initializeBufferWithCopyOfBuffer for FeatureDetails(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    char v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *char v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for FeatureDetails(uint64_t a1)
{
  uint64_t v2 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FeatureDetails(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  char v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FeatureDetails(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for FeatureDetails(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for FeatureDetails(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 24);
  char v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *char v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FeatureDetails(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0_2);
}

uint64_t storeEnumTagSinglePayload for FeatureDetails(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0_2);
}

uint64_t sub_23728024C()
{
  return sub_237286AB4();
}

uint64_t *initializeBufferWithCopyOfBuffer for FeaturesResponse(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2372A4780();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (char *)v7 + v13;
    uint64_t v15 = (char *)a2 + v13;
    *(void *)uint64_t v14 = *(void *)v15;
    v14[8] = v15[8];
  }
  return v7;
}

void *initializeWithCopy for FeaturesResponse(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  return a1;
}

void *assignWithCopy for FeaturesResponse(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  char v13 = v12[8];
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v13;
  return a1;
}

void *initializeWithTake for FeaturesResponse(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v12[8];
  return a1;
}

void *assignWithTake for FeaturesResponse(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v12[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for FeaturesResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_14Tm_0);
}

uint64_t storeEnumTagSinglePayload for FeaturesResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_15Tm_0);
}

uint64_t sub_237280674()
{
  uint64_t result = sub_2372A4780();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for GetStateRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_41Tm);
}

uint64_t storeEnumTagSinglePayload for GetStateRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_42Tm);
}

uint64_t *initializeBufferWithCopyOfBuffer for GetStateResponse(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for DaemonState(0);
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      v8((uint64_t *)v10, (uint64_t *)v11, v7);
      *(void *)&v10[*(int *)(v12 + 20)] = *(void *)&v11[*(int *)(v12 + 20)];
      uint64_t v16 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
      swift_retain();
      v16(v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for GetStateResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2372A4780();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = type metadata accessor for DaemonState(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    v5(v6, v4);
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for GetStateResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for DaemonState(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    *(void *)&v9[*(int *)(v11 + 20)] = *(void *)&v10[*(int *)(v11 + 20)];
    uint64_t v14 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
    swift_retain();
    v14(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for GetStateResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v19 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 24);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v20 = a1;
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for DaemonState(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      v7((uint64_t)v9, (uint64_t)v10, v6);
      *(void *)&v9[*(int *)(v11 + 20)] = *(void *)&v10[*(int *)(v11 + 20)];
      swift_retain();
      swift_release();
      return v20;
    }
    sub_23723CDC0((uint64_t)v9, type metadata accessor for DaemonState);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
    memcpy(v9, v10, *(void *)(*(void *)(v17 - 8) + 64));
    return v20;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v9, v10, v6);
  *(void *)&v9[*(int *)(v11 + 20)] = *(void *)&v10[*(int *)(v11 + 20)];
  uint64_t v16 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
  swift_retain();
  v16(v9, 0, 1, v11);
  return v20;
}

uint64_t initializeWithTake for GetStateResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for DaemonState(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    *(void *)&v9[*(int *)(v11 + 20)] = *(void *)&v10[*(int *)(v11 + 20)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithTake for GetStateResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v18 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 40);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v19 = a1;
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for DaemonState(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      v7((uint64_t)v9, (uint64_t)v10, v6);
      *(void *)&v9[*(int *)(v11 + 20)] = *(void *)&v10[*(int *)(v11 + 20)];
      swift_release();
      return v19;
    }
    sub_23723CDC0((uint64_t)v9, type metadata accessor for DaemonState);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    return v19;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v9, v10, v6);
  *(void *)&v9[*(int *)(v11 + 20)] = *(void *)&v10[*(int *)(v11 + 20)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return v19;
}

uint64_t getEnumTagSinglePayload for GetStateResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237281128);
}

uint64_t sub_237281128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_44Tm(a1, a2, a3, &qword_2689083A0);
}

uint64_t storeEnumTagSinglePayload for GetStateResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237281148);
}

uint64_t sub_237281148(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_45Tm(a1, a2, a3, a4, &qword_2689083A0);
}

void sub_237281154(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void *initializeBufferWithCopyOfBuffer for DataRequest(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (void *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    *(void *)uint64_t v10 = *(void *)v11;
    v10[8] = v11[8];
    uint64_t v12 = (char *)a1 + v9;
    uint64_t v13 = (char *)a2 + v9;
    *(void *)uint64_t v12 = *(void *)v13;
    v12[8] = v13[8];
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    uint64_t v16 = (char *)a1 + v14;
    uint64_t v17 = (char *)a2 + v14;
    *(void *)uint64_t v16 = *(void *)v17;
    v16[8] = v17[8];
    *((unsigned char *)a1 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v18 = a3[9];
    uint64_t v19 = a3[10];
    uint64_t v20 = (char *)a1 + v18;
    uint64_t v21 = (char *)a2 + v18;
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
    *((unsigned char *)a1 + v19) = *((unsigned char *)a2 + v19);
    *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  }
  return a1;
}

uint64_t initializeWithCopy for DataRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  uint64_t v13 = a3[7];
  uint64_t v14 = a3[8];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  *(unsigned char *)(a1 + v18) = *(unsigned char *)(a2 + v18);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithCopy for DataRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  *(unsigned char *)(v8 + 8) = *((unsigned char *)v9 + 8);
  *(void *)uint64_t v8 = v10;
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  LOBYTE(v10) = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = v10;
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  LOBYTE(v10) = *(unsigned char *)(v16 + 8);
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = v10;
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v20 = *v19;
  *(unsigned char *)(v18 + 8) = *((unsigned char *)v19 + 8);
  *(void *)uint64_t v18 = v20;
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t initializeWithTake for DataRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  uint64_t v13 = a3[7];
  uint64_t v14 = a3[8];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  *(unsigned char *)(a1 + v18) = *(unsigned char *)(a2 + v18);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithTake for DataRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  uint64_t v13 = a3[7];
  uint64_t v14 = a3[8];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  *(unsigned char *)(a1 + v18) = *(unsigned char *)(a2 + v18);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t getEnumTagSinglePayload for DataRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2372816BC);
}

uint64_t sub_2372816BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 32));
    if (v10 >= 2) {
      int v11 = ((v10 + 2147483646) & 0x7FFFFFFF) - 1;
    }
    else {
      int v11 = -2;
    }
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for DataRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2372817AC);
}

uint64_t sub_2372817AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2372A4780();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 32)) = a2 + 2;
  }
  return result;
}

uint64_t sub_237281868()
{
  uint64_t result = sub_2372A4780();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for DataResponse(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    unsigned int v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2372A4780();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[8];
    *((unsigned char *)v7 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *((unsigned char *)v7 + v13) = *((unsigned char *)a2 + v13);
  }
  return v7;
}

void *initializeWithCopy for DataResponse(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2372A4780();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *((unsigned char *)a1 + v12) = *((unsigned char *)a2 + v12);
  return a1;
}

void *assignWithCopy for DataResponse(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  return a1;
}

_OWORD *initializeWithTake for DataResponse(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
  return a1;
}

void *assignWithTake for DataResponse(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for DataResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_32Tm_0);
}

uint64_t storeEnumTagSinglePayload for DataResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_33Tm_0);
}

uint64_t sub_237281D40()
{
  uint64_t result = sub_2372A4780();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NotificationPendingRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_41Tm_0);
}

uint64_t storeEnumTagSinglePayload for NotificationPendingRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_42Tm_0);
}

void *initializeBufferWithCopyOfBuffer for NotificationPendingResponse(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(void *)uint64_t v9 = *(void *)v10;
    v9[8] = v10[8];
  }
  return a1;
}

uint64_t initializeWithCopy for NotificationPendingResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  return a1;
}

uint64_t assignWithCopy for NotificationPendingResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 8);
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = v10;
  return a1;
}

uint64_t initializeWithTake for NotificationPendingResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  return a1;
}

uint64_t assignWithTake for NotificationPendingResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotificationPendingResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_56Tm);
}

uint64_t storeEnumTagSinglePayload for NotificationPendingResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_57Tm);
}

uint64_t sub_237282180()
{
  return sub_237286AB4();
}

uint64_t *initializeBufferWithCopyOfBuffer for NotificationStateWriteRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8((char *)a1, (char *)a2, v7);
    uint64_t v9 = *(int *)(a3 + 20);
    char v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = (int *)type metadata accessor for NotificationState(0);
    uint64_t v13 = *((void *)v12 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v77 = v13;
      v8(v10, v11, v7);
      uint64_t v16 = v12[5];
      uint64_t v17 = &v10[v16];
      uint64_t v18 = &v11[v16];
      *(void *)uint64_t v17 = *(void *)v18;
      v17[8] = v18[8];
      uint64_t v19 = v12[6];
      uint64_t v20 = &v10[v19];
      uint64_t v21 = v8;
      uint64_t v22 = &v11[v19];
      uint64_t v23 = (int *)type metadata accessor for LitmusInfo(0);
      uint64_t v24 = *((void *)v23 - 1);
      v76 = v21;
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v24 + 48))(v22, 1, v23))
      {
        uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
        memcpy(v20, v22, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        v21(v20, v22, v7);
        uint64_t v26 = v23[5];
        v27 = &v20[v26];
        uint64_t v28 = &v22[v26];
        *(_DWORD *)v27 = *(_DWORD *)v28;
        v27[4] = v28[4];
        uint64_t v29 = v23[6];
        v30 = &v20[v29];
        uint64_t v31 = &v22[v29];
        *(_DWORD *)v30 = *(_DWORD *)v31;
        v30[4] = v31[4];
        uint64_t v32 = v23[7];
        v33 = &v20[v32];
        uint64_t v34 = &v22[v32];
        *(_DWORD *)v33 = *(_DWORD *)v34;
        v33[4] = v34[4];
        uint64_t v35 = v23[8];
        uint64_t v36 = &v20[v35];
        v37 = &v22[v35];
        *(void *)uint64_t v36 = *(void *)v37;
        *((_WORD *)v36 + 4) = *((_WORD *)v37 + 4);
        (*(void (**)(char *, void, uint64_t, int *))(v24 + 56))(v20, 0, 1, v23);
      }
      uint64_t v38 = v12[7];
      uint64_t v39 = &v10[v38];
      uint64_t v40 = &v11[v38];
      *(void *)uint64_t v39 = *(void *)v40;
      v39[8] = v40[8];
      uint64_t v41 = v12[8];
      v42 = &v10[v41];
      v43 = &v11[v41];
      v42[8] = v43[8];
      *(void *)v42 = *(void *)v43;
      uint64_t v44 = v12[9];
      uint64_t v45 = &v10[v44];
      uint64_t v46 = &v11[v44];
      v47 = (int *)type metadata accessor for QuotaServerState(0);
      uint64_t v48 = *((void *)v47 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v48 + 48))(v46, 1, v47))
      {
        uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
        memcpy(v45, v46, *(void *)(*(void *)(v49 - 8) + 64));
      }
      else
      {
        v76(v45, v46, v7);
        uint64_t v50 = v47[5];
        uint64_t v51 = &v45[v50];
        v52 = &v46[v50];
        uint64_t v53 = *((void *)v52 + 1);
        *(void *)uint64_t v51 = *(void *)v52;
        *((void *)v51 + 1) = v53;
        uint64_t v54 = v47[6];
        v55 = &v45[v54];
        v56 = &v46[v54];
        uint64_t v57 = *((void *)v56 + 1);
        *(void *)v55 = *(void *)v56;
        *((void *)v55 + 1) = v57;
        uint64_t v58 = v47[7];
        v59 = &v45[v58];
        v60 = &v46[v58];
        uint64_t v61 = *((void *)v60 + 1);
        *(void *)v59 = *(void *)v60;
        *((void *)v59 + 1) = v61;
        uint64_t v62 = v47[8];
        v63 = &v45[v62];
        v64 = &v46[v62];
        uint64_t v65 = *((void *)v64 + 1);
        *(void *)v63 = *(void *)v64;
        *((void *)v63 + 1) = v65;
        v66 = *(void (**)(char *, void, uint64_t, int *))(v48 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v66(v45, 0, 1, v47);
      }
      uint64_t v67 = v12[10];
      v68 = &v10[v67];
      v69 = &v11[v67];
      uint64_t v70 = *((void *)v69 + 1);
      *(void *)v68 = *(void *)v69;
      *((void *)v68 + 1) = v70;
      uint64_t v71 = v12[11];
      v72 = &v10[v71];
      v73 = &v11[v71];
      v72[8] = v73[8];
      *(void *)v72 = *(void *)v73;
      v74 = *(void (**)(char *, void, uint64_t, int *))(v77 + 56);
      swift_bridgeObjectRetain();
      v74(v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for NotificationStateWriteRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2372A4780();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = type metadata accessor for NotificationState(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    v5(v6, v4);
    uint64_t v9 = v6 + *(int *)(v7 + 24);
    uint64_t v10 = type metadata accessor for LitmusInfo(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10)) {
      v5(v9, v4);
    }
    uint64_t v11 = v6 + *(int *)(v7 + 36);
    uint64_t v12 = type metadata accessor for QuotaServerState(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v11, 1, v12))
    {
      v5(v11, v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for NotificationStateWriteRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = (int *)type metadata accessor for NotificationState(0);
  uint64_t v12 = *((void *)v11 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v73 = v12;
    uint64_t v74 = a1;
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v14 = v11[5];
    uint64_t v15 = &v9[v14];
    uint64_t v16 = &v10[v14];
    *(void *)uint64_t v15 = *(void *)v16;
    v15[8] = v16[8];
    uint64_t v17 = v11[6];
    uint64_t v18 = &v9[v17];
    uint64_t v19 = &v10[v17];
    uint64_t v20 = (int *)type metadata accessor for LitmusInfo(0);
    uint64_t v21 = *((void *)v20 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
      memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      v7((uint64_t)v18, (uint64_t)v19, v6);
      uint64_t v23 = v20[5];
      uint64_t v24 = &v18[v23];
      uint64_t v25 = &v19[v23];
      *(_DWORD *)uint64_t v24 = *(_DWORD *)v25;
      v24[4] = v25[4];
      uint64_t v26 = v20[6];
      v27 = &v18[v26];
      uint64_t v28 = &v19[v26];
      *(_DWORD *)v27 = *(_DWORD *)v28;
      v27[4] = v28[4];
      uint64_t v29 = v20[7];
      v30 = &v18[v29];
      uint64_t v31 = &v19[v29];
      *(_DWORD *)v30 = *(_DWORD *)v31;
      v30[4] = v31[4];
      uint64_t v32 = v20[8];
      v33 = &v18[v32];
      uint64_t v34 = &v19[v32];
      *(void *)v33 = *(void *)v34;
      *((_WORD *)v33 + 4) = *((_WORD *)v34 + 4);
      (*(void (**)(char *, void, uint64_t, int *))(v21 + 56))(v18, 0, 1, v20);
    }
    uint64_t v35 = v11[7];
    uint64_t v36 = &v9[v35];
    v37 = &v10[v35];
    *(void *)uint64_t v36 = *(void *)v37;
    v36[8] = v37[8];
    uint64_t v38 = v11[8];
    uint64_t v39 = &v9[v38];
    uint64_t v40 = &v10[v38];
    v39[8] = v40[8];
    *(void *)uint64_t v39 = *(void *)v40;
    uint64_t v41 = v11[9];
    v42 = &v9[v41];
    v43 = &v10[v41];
    uint64_t v44 = (int *)type metadata accessor for QuotaServerState(0);
    uint64_t v45 = *((void *)v44 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v45 + 48))(v43, 1, v44))
    {
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
      memcpy(v42, v43, *(void *)(*(void *)(v46 - 8) + 64));
    }
    else
    {
      v7((uint64_t)v42, (uint64_t)v43, v6);
      uint64_t v47 = v44[5];
      uint64_t v48 = &v42[v47];
      uint64_t v49 = &v43[v47];
      uint64_t v50 = *((void *)v49 + 1);
      *(void *)uint64_t v48 = *(void *)v49;
      *((void *)v48 + 1) = v50;
      uint64_t v51 = v44[6];
      v52 = &v42[v51];
      uint64_t v53 = &v43[v51];
      uint64_t v54 = *((void *)v53 + 1);
      *(void *)v52 = *(void *)v53;
      *((void *)v52 + 1) = v54;
      uint64_t v55 = v44[7];
      v56 = &v42[v55];
      uint64_t v57 = &v43[v55];
      uint64_t v58 = *((void *)v57 + 1);
      *(void *)v56 = *(void *)v57;
      *((void *)v56 + 1) = v58;
      uint64_t v59 = v44[8];
      v60 = &v42[v59];
      uint64_t v61 = &v43[v59];
      uint64_t v62 = *((void *)v61 + 1);
      *(void *)v60 = *(void *)v61;
      *((void *)v60 + 1) = v62;
      v63 = *(void (**)(char *, void, uint64_t, int *))(v45 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v63(v42, 0, 1, v44);
    }
    uint64_t v64 = v11[10];
    uint64_t v65 = &v9[v64];
    v66 = &v10[v64];
    uint64_t v67 = *((void *)v66 + 1);
    *(void *)uint64_t v65 = *(void *)v66;
    *((void *)v65 + 1) = v67;
    uint64_t v68 = v11[11];
    v69 = &v9[v68];
    uint64_t v70 = &v10[v68];
    v69[8] = v70[8];
    *(void *)v69 = *(void *)v70;
    uint64_t v71 = *(void (**)(char *, void, uint64_t, int *))(v73 + 56);
    swift_bridgeObjectRetain();
    v71(v9, 0, 1, v11);
    return v74;
  }
  return a1;
}

uint64_t assignWithCopy for NotificationStateWriteRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v178 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v178 + 24);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v179 = a1;
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = (int *)type metadata accessor for NotificationState(0);
  uint64_t v12 = *((void *)v11 - 1);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, int *))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (v15)
    {
      sub_23723CDC0((uint64_t)v9, type metadata accessor for NotificationState);
      goto LABEL_7;
    }
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v28 = v11[5];
    uint64_t v29 = &v9[v28];
    v30 = &v10[v28];
    char v31 = v30[8];
    *(void *)uint64_t v29 = *(void *)v30;
    v29[8] = v31;
    uint64_t v32 = v11[6];
    v33 = &v9[v32];
    uint64_t v34 = &v10[v32];
    uint64_t v35 = (int *)type metadata accessor for LitmusInfo(0);
    uint64_t v174 = *((void *)v35 - 1);
    uint64_t v36 = *(uint64_t (**)(char *, uint64_t, int *))(v174 + 48);
    uint64_t v176 = (uint64_t)v33;
    LODWORD(v33) = v36(v33, 1, v35);
    int v37 = v36(v34, 1, v35);
    v173 = (void (*)(uint64_t, char *, uint64_t))v7;
    if (v33)
    {
      if (v37)
      {
        size_t v38 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40) - 8) + 64);
        uint64_t v39 = (void *)v176;
LABEL_18:
        memcpy(v39, v34, v38);
        goto LABEL_21;
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v178 + 16))(v176, v34, v6);
      uint64_t v91 = v35[5];
      uint64_t v92 = v176 + v91;
      v93 = &v34[v91];
      char v94 = v93[4];
      *(_DWORD *)uint64_t v92 = *(_DWORD *)v93;
      *(unsigned char *)(v92 + 4) = v94;
      uint64_t v95 = v35[6];
      uint64_t v96 = v176 + v95;
      v97 = &v34[v95];
      char v98 = v97[4];
      *(_DWORD *)uint64_t v96 = *(_DWORD *)v97;
      *(unsigned char *)(v96 + 4) = v98;
      uint64_t v99 = v35[7];
      uint64_t v100 = v176 + v99;
      v101 = &v34[v99];
      char v102 = v101[4];
      *(_DWORD *)uint64_t v100 = *(_DWORD *)v101;
      *(unsigned char *)(v100 + 4) = v102;
      uint64_t v103 = v35[8];
      uint64_t v104 = v176 + v103;
      v105 = &v34[v103];
      __int16 v106 = *((_WORD *)v105 + 4);
      *(void *)uint64_t v104 = *(void *)v105;
      *(_WORD *)(v104 + 8) = v106;
      (*(void (**)(uint64_t, void, uint64_t, int *))(v174 + 56))(v176, 0, 1, v35);
    }
    else
    {
      if (v37)
      {
        sub_23723CDC0(v176, type metadata accessor for LitmusInfo);
        size_t v38 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40) - 8) + 64);
        uint64_t v39 = (void *)v176;
        goto LABEL_18;
      }
      v7(v176, (uint64_t)v34, v6);
      uint64_t v107 = v35[5];
      uint64_t v108 = v176 + v107;
      v109 = &v34[v107];
      char v110 = v109[4];
      *(_DWORD *)uint64_t v108 = *(_DWORD *)v109;
      *(unsigned char *)(v108 + 4) = v110;
      uint64_t v111 = v35[6];
      uint64_t v112 = v176 + v111;
      v113 = &v34[v111];
      char v114 = v113[4];
      *(_DWORD *)uint64_t v112 = *(_DWORD *)v113;
      *(unsigned char *)(v112 + 4) = v114;
      uint64_t v115 = v35[7];
      uint64_t v116 = v176 + v115;
      v117 = &v34[v115];
      char v118 = v117[4];
      *(_DWORD *)uint64_t v116 = *(_DWORD *)v117;
      *(unsigned char *)(v116 + 4) = v118;
      uint64_t v119 = v35[8];
      uint64_t v120 = v176 + v119;
      v121 = &v34[v119];
      __int16 v122 = *((_WORD *)v121 + 4);
      *(void *)uint64_t v120 = *(void *)v121;
      *(_WORD *)(v120 + 8) = v122;
    }
LABEL_21:
    uint64_t v123 = v11[7];
    v124 = &v9[v123];
    v125 = &v10[v123];
    uint64_t v126 = *(void *)v125;
    v124[8] = v125[8];
    *(void *)v124 = v126;
    uint64_t v127 = v11[8];
    v128 = &v9[v127];
    v129 = &v10[v127];
    uint64_t v130 = *(void *)v129;
    v128[8] = v129[8];
    *(void *)v128 = v130;
    uint64_t v131 = v11[9];
    v132 = &v9[v131];
    v133 = &v10[v131];
    v134 = (int *)type metadata accessor for QuotaServerState(0);
    uint64_t v135 = *((void *)v134 - 1);
    v136 = *(uint64_t (**)(char *, uint64_t, int *))(v135 + 48);
    uint64_t v177 = (uint64_t)v132;
    LODWORD(v132) = v136(v132, 1, v134);
    int v137 = v136(v133, 1, v134);
    if (v132)
    {
      if (!v137)
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v178 + 16))(v177, v133, v6);
        uint64_t v140 = v134[5];
        v141 = (void *)(v177 + v140);
        v142 = &v133[v140];
        void *v141 = *(void *)v142;
        v141[1] = *((void *)v142 + 1);
        uint64_t v143 = v134[6];
        v144 = (void *)(v177 + v143);
        v145 = &v133[v143];
        void *v144 = *(void *)v145;
        v144[1] = *((void *)v145 + 1);
        uint64_t v146 = v134[7];
        v147 = (void *)(v177 + v146);
        v148 = &v133[v146];
        void *v147 = *(void *)v148;
        v147[1] = *((void *)v148 + 1);
        uint64_t v149 = v134[8];
        v150 = (void *)(v177 + v149);
        v151 = &v133[v149];
        void *v150 = *(void *)v151;
        v150[1] = *((void *)v151 + 1);
        v152 = *(void (**)(uint64_t, void, uint64_t, int *))(v135 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v152(v177, 0, 1, v134);
        goto LABEL_29;
      }
      size_t v138 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090) - 8) + 64);
      v139 = (void *)v177;
    }
    else
    {
      if (!v137)
      {
        v173(v177, v133, v6);
        uint64_t v153 = v134[5];
        v154 = (void *)(v177 + v153);
        v155 = &v133[v153];
        void *v154 = *(void *)v155;
        v154[1] = *((void *)v155 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v156 = v134[6];
        v157 = (void *)(v177 + v156);
        v158 = &v133[v156];
        void *v157 = *(void *)v158;
        v157[1] = *((void *)v158 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v159 = v134[7];
        v160 = (void *)(v177 + v159);
        v161 = &v133[v159];
        void *v160 = *(void *)v161;
        v160[1] = *((void *)v161 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v162 = v134[8];
        v163 = (void *)(v177 + v162);
        v164 = &v133[v162];
        void *v163 = *(void *)v164;
        v163[1] = *((void *)v164 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
      sub_23723CDC0(v177, type metadata accessor for QuotaServerState);
      size_t v138 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090) - 8) + 64);
      v139 = (void *)v177;
    }
    memcpy(v139, v133, v138);
LABEL_29:
    uint64_t v165 = v11[10];
    v166 = &v9[v165];
    v167 = &v10[v165];
    *(void *)v166 = *(void *)v167;
    *((void *)v166 + 1) = *((void *)v167 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v168 = v11[11];
    v169 = &v9[v168];
    v170 = &v10[v168];
    uint64_t v171 = *(void *)v170;
    v169[8] = v170[8];
    *(void *)v169 = v171;
    return v179;
  }
  if (v15)
  {
LABEL_7:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
    memcpy(v9, v10, *(void *)(*(void *)(v27 - 8) + 64));
    return v179;
  }
  v175 = *(void (**)(char *, char *, uint64_t))(v178 + 16);
  v175(v9, v10, v6);
  uint64_t v16 = v11[5];
  uint64_t v17 = &v9[v16];
  uint64_t v18 = &v10[v16];
  char v19 = v18[8];
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v19;
  uint64_t v20 = v11[6];
  uint64_t v21 = &v9[v20];
  uint64_t v22 = &v10[v20];
  uint64_t v23 = (int *)type metadata accessor for LitmusInfo(0);
  uint64_t v24 = *((void *)v23 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v24 + 48))(v22, 1, v23))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
    uint64_t v26 = v175;
  }
  else
  {
    v175(v21, v22, v6);
    uint64_t v26 = v175;
    uint64_t v40 = v23[5];
    uint64_t v41 = &v21[v40];
    v42 = &v22[v40];
    char v43 = v42[4];
    *(_DWORD *)uint64_t v41 = *(_DWORD *)v42;
    v41[4] = v43;
    uint64_t v44 = v23[6];
    uint64_t v45 = &v21[v44];
    uint64_t v46 = &v22[v44];
    char v47 = v46[4];
    *(_DWORD *)uint64_t v45 = *(_DWORD *)v46;
    v45[4] = v47;
    uint64_t v48 = v23[7];
    uint64_t v49 = &v21[v48];
    uint64_t v50 = &v22[v48];
    char v51 = v50[4];
    *(_DWORD *)uint64_t v49 = *(_DWORD *)v50;
    v49[4] = v51;
    uint64_t v52 = v23[8];
    uint64_t v53 = &v21[v52];
    uint64_t v54 = &v22[v52];
    __int16 v55 = *((_WORD *)v54 + 4);
    *(void *)uint64_t v53 = *(void *)v54;
    *((_WORD *)v53 + 4) = v55;
    (*(void (**)(char *, void, uint64_t, int *))(v24 + 56))(v21, 0, 1, v23);
  }
  uint64_t v56 = v11[7];
  uint64_t v57 = &v9[v56];
  uint64_t v58 = &v10[v56];
  uint64_t v59 = *(void *)v58;
  v57[8] = v58[8];
  *(void *)uint64_t v57 = v59;
  uint64_t v60 = v11[8];
  uint64_t v61 = &v9[v60];
  uint64_t v62 = &v10[v60];
  uint64_t v63 = *(void *)v62;
  v61[8] = v62[8];
  *(void *)uint64_t v61 = v63;
  uint64_t v64 = v11[9];
  uint64_t v65 = &v9[v64];
  v66 = &v10[v64];
  uint64_t v67 = (int *)type metadata accessor for QuotaServerState(0);
  uint64_t v68 = *((void *)v67 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v68 + 48))(v66, 1, v67))
  {
    uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
    memcpy(v65, v66, *(void *)(*(void *)(v69 - 8) + 64));
  }
  else
  {
    v26(v65, v66, v6);
    uint64_t v70 = v67[5];
    uint64_t v71 = &v65[v70];
    v72 = &v66[v70];
    *(void *)uint64_t v71 = *(void *)v72;
    *((void *)v71 + 1) = *((void *)v72 + 1);
    uint64_t v73 = v67[6];
    uint64_t v74 = &v65[v73];
    v75 = &v66[v73];
    *(void *)uint64_t v74 = *(void *)v75;
    *((void *)v74 + 1) = *((void *)v75 + 1);
    uint64_t v76 = v67[7];
    uint64_t v77 = &v65[v76];
    v78 = &v66[v76];
    *(void *)uint64_t v77 = *(void *)v78;
    *((void *)v77 + 1) = *((void *)v78 + 1);
    uint64_t v79 = v67[8];
    v80 = &v65[v79];
    v81 = &v66[v79];
    *(void *)v80 = *(void *)v81;
    *((void *)v80 + 1) = *((void *)v81 + 1);
    v82 = *(void (**)(char *, void, uint64_t, int *))(v68 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v82(v65, 0, 1, v67);
  }
  uint64_t v83 = v11[10];
  v84 = &v9[v83];
  v85 = &v10[v83];
  *(void *)v84 = *(void *)v85;
  *((void *)v84 + 1) = *((void *)v85 + 1);
  uint64_t v86 = v11[11];
  v87 = &v9[v86];
  v88 = &v10[v86];
  uint64_t v89 = *(void *)v88;
  v87[8] = v88[8];
  *(void *)v87 = v89;
  v90 = *(void (**)(char *, void, uint64_t, int *))(v12 + 56);
  swift_bridgeObjectRetain();
  v90(v9, 0, 1, v11);
  return v179;
}

uint64_t initializeWithTake for NotificationStateWriteRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = (int *)type metadata accessor for NotificationState(0);
  uint64_t v12 = *((void *)v11 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v53 = a1;
    uint64_t v54 = v12;
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v14 = v11[5];
    int v15 = &v9[v14];
    uint64_t v16 = &v10[v14];
    *(void *)int v15 = *(void *)v16;
    v15[8] = v16[8];
    uint64_t v17 = v11[6];
    uint64_t v18 = &v9[v17];
    char v19 = v7;
    uint64_t v20 = &v10[v17];
    uint64_t v21 = (int *)type metadata accessor for LitmusInfo(0);
    uint64_t v22 = *((void *)v21 - 1);
    uint64_t v52 = (void (*)(char *, char *, uint64_t))v19;
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v22 + 48))(v20, 1, v21))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
      memcpy(v18, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      v19((uint64_t)v18, (uint64_t)v20, v6);
      uint64_t v24 = v21[5];
      uint64_t v25 = &v18[v24];
      uint64_t v26 = &v20[v24];
      *(_DWORD *)uint64_t v25 = *(_DWORD *)v26;
      v25[4] = v26[4];
      uint64_t v27 = v21[6];
      uint64_t v28 = &v18[v27];
      uint64_t v29 = &v20[v27];
      *(_DWORD *)uint64_t v28 = *(_DWORD *)v29;
      v28[4] = v29[4];
      uint64_t v30 = v21[7];
      char v31 = &v18[v30];
      uint64_t v32 = &v20[v30];
      *(_DWORD *)char v31 = *(_DWORD *)v32;
      v31[4] = v32[4];
      uint64_t v33 = v21[8];
      uint64_t v34 = &v18[v33];
      uint64_t v35 = &v20[v33];
      *(void *)uint64_t v34 = *(void *)v35;
      *((_WORD *)v34 + 4) = *((_WORD *)v35 + 4);
      (*(void (**)(char *, void, uint64_t, int *))(v22 + 56))(v18, 0, 1, v21);
    }
    uint64_t v36 = v11[7];
    int v37 = &v9[v36];
    size_t v38 = &v10[v36];
    *(void *)int v37 = *(void *)v38;
    v37[8] = v38[8];
    uint64_t v39 = v11[8];
    uint64_t v40 = &v9[v39];
    uint64_t v41 = &v10[v39];
    v40[8] = v41[8];
    *(void *)uint64_t v40 = *(void *)v41;
    uint64_t v42 = v11[9];
    char v43 = &v9[v42];
    uint64_t v44 = &v10[v42];
    uint64_t v45 = (int *)type metadata accessor for QuotaServerState(0);
    uint64_t v46 = *((void *)v45 - 1);
    a1 = v53;
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v46 + 48))(v44, 1, v45))
    {
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
      memcpy(v43, v44, *(void *)(*(void *)(v47 - 8) + 64));
    }
    else
    {
      v52(v43, v44, v6);
      *(_OWORD *)&v43[v45[5]] = *(_OWORD *)&v44[v45[5]];
      *(_OWORD *)&v43[v45[6]] = *(_OWORD *)&v44[v45[6]];
      *(_OWORD *)&v43[v45[7]] = *(_OWORD *)&v44[v45[7]];
      *(_OWORD *)&v43[v45[8]] = *(_OWORD *)&v44[v45[8]];
      (*(void (**)(char *, void, uint64_t, int *))(v46 + 56))(v43, 0, 1, v45);
    }
    *(_OWORD *)&v9[v11[10]] = *(_OWORD *)&v10[v11[10]];
    uint64_t v48 = v11[11];
    uint64_t v49 = &v9[v48];
    uint64_t v50 = &v10[v48];
    v49[8] = v50[8];
    *(void *)uint64_t v49 = *(void *)v50;
    (*(void (**)(char *, void, uint64_t, int *))(v54 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithTake for NotificationStateWriteRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v137 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v137 + 40);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v138 = a1;
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = (int *)type metadata accessor for NotificationState(0);
  uint64_t v12 = *((void *)v11 - 1);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, int *))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (v15)
    {
      sub_23723CDC0((uint64_t)v9, type metadata accessor for NotificationState);
      goto LABEL_7;
    }
    v134 = (void (*)(uint64_t, char *, uint64_t))v7;
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v27 = v11[5];
    uint64_t v28 = &v9[v27];
    uint64_t v29 = &v10[v27];
    *(void *)uint64_t v28 = *(void *)v29;
    v28[8] = v29[8];
    uint64_t v30 = v11[6];
    char v31 = &v9[v30];
    uint64_t v32 = &v10[v30];
    uint64_t v33 = (int *)type metadata accessor for LitmusInfo(0);
    uint64_t v132 = *((void *)v33 - 1);
    uint64_t v34 = *(uint64_t (**)(char *, uint64_t, int *))(v132 + 48);
    uint64_t v135 = (uint64_t)v31;
    LODWORD(v31) = v34(v31, 1, v33);
    int v35 = v34(v32, 1, v33);
    if (v31)
    {
      if (v35)
      {
        size_t v36 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40) - 8) + 64);
        int v37 = (void *)v135;
LABEL_18:
        memcpy(v37, v32, v36);
        goto LABEL_21;
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v137 + 32))(v135, v32, v6);
      uint64_t v65 = v33[5];
      uint64_t v66 = v135 + v65;
      uint64_t v67 = &v32[v65];
      *(_DWORD *)uint64_t v66 = *(_DWORD *)v67;
      *(unsigned char *)(v66 + 4) = v67[4];
      uint64_t v68 = v33[6];
      uint64_t v69 = v135 + v68;
      uint64_t v70 = &v32[v68];
      *(_DWORD *)uint64_t v69 = *(_DWORD *)v70;
      *(unsigned char *)(v69 + 4) = v70[4];
      uint64_t v71 = v33[7];
      uint64_t v72 = v135 + v71;
      uint64_t v73 = &v32[v71];
      *(_DWORD *)uint64_t v72 = *(_DWORD *)v73;
      *(unsigned char *)(v72 + 4) = v73[4];
      uint64_t v74 = v33[8];
      uint64_t v75 = v135 + v74;
      uint64_t v76 = &v32[v74];
      *(void *)uint64_t v75 = *(void *)v76;
      *(_WORD *)(v75 + 8) = *((_WORD *)v76 + 4);
      (*(void (**)(uint64_t, void, uint64_t, int *))(v132 + 56))(v135, 0, 1, v33);
    }
    else
    {
      if (v35)
      {
        sub_23723CDC0(v135, type metadata accessor for LitmusInfo);
        size_t v36 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40) - 8) + 64);
        int v37 = (void *)v135;
        goto LABEL_18;
      }
      v134(v135, v32, v6);
      uint64_t v77 = v33[5];
      uint64_t v78 = v135 + v77;
      uint64_t v79 = &v32[v77];
      *(_DWORD *)uint64_t v78 = *(_DWORD *)v79;
      *(unsigned char *)(v78 + 4) = v79[4];
      uint64_t v80 = v33[6];
      uint64_t v81 = v135 + v80;
      v82 = &v32[v80];
      *(_DWORD *)uint64_t v81 = *(_DWORD *)v82;
      *(unsigned char *)(v81 + 4) = v82[4];
      uint64_t v83 = v33[7];
      uint64_t v84 = v135 + v83;
      v85 = &v32[v83];
      *(_DWORD *)uint64_t v84 = *(_DWORD *)v85;
      *(unsigned char *)(v84 + 4) = v85[4];
      uint64_t v86 = v33[8];
      uint64_t v87 = v135 + v86;
      v88 = &v32[v86];
      *(void *)uint64_t v87 = *(void *)v88;
      *(_WORD *)(v87 + 8) = *((_WORD *)v88 + 4);
    }
LABEL_21:
    uint64_t v89 = v11[7];
    v90 = &v9[v89];
    uint64_t v91 = &v10[v89];
    *(void *)v90 = *(void *)v91;
    v90[8] = v91[8];
    uint64_t v92 = v11[8];
    v93 = &v9[v92];
    char v94 = &v10[v92];
    v93[8] = v94[8];
    *(void *)v93 = *(void *)v94;
    uint64_t v95 = v11[9];
    uint64_t v96 = &v9[v95];
    v97 = &v10[v95];
    char v98 = (int *)type metadata accessor for QuotaServerState(0);
    uint64_t v133 = *((void *)v98 - 1);
    uint64_t v99 = *(uint64_t (**)(char *, uint64_t, int *))(v133 + 48);
    uint64_t v136 = (uint64_t)v96;
    LODWORD(v96) = v99(v96, 1, v98);
    int v100 = v99(v97, 1, v98);
    if (v96)
    {
      if (!v100)
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v137 + 32))(v136, v97, v6);
        *(_OWORD *)(v136 + v98[5]) = *(_OWORD *)&v97[v98[5]];
        *(_OWORD *)(v136 + v98[6]) = *(_OWORD *)&v97[v98[6]];
        *(_OWORD *)(v136 + v98[7]) = *(_OWORD *)&v97[v98[7]];
        *(_OWORD *)(v136 + v98[8]) = *(_OWORD *)&v97[v98[8]];
        (*(void (**)(uint64_t, void, uint64_t, int *))(v133 + 56))(v136, 0, 1, v98);
        goto LABEL_29;
      }
      size_t v101 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090) - 8) + 64);
      char v102 = (void *)v136;
    }
    else
    {
      if (!v100)
      {
        v134(v136, v97, v6);
        uint64_t v103 = v98[5];
        uint64_t v104 = (void *)(v136 + v103);
        v105 = &v97[v103];
        uint64_t v107 = *(void *)v105;
        uint64_t v106 = *((void *)v105 + 1);
        *uint64_t v104 = v107;
        v104[1] = v106;
        swift_bridgeObjectRelease();
        uint64_t v108 = v98[6];
        v109 = (void *)(v136 + v108);
        char v110 = &v97[v108];
        uint64_t v112 = *(void *)v110;
        uint64_t v111 = *((void *)v110 + 1);
        void *v109 = v112;
        v109[1] = v111;
        swift_bridgeObjectRelease();
        uint64_t v113 = v98[7];
        char v114 = (void *)(v136 + v113);
        uint64_t v115 = &v97[v113];
        uint64_t v117 = *(void *)v115;
        uint64_t v116 = *((void *)v115 + 1);
        *char v114 = v117;
        v114[1] = v116;
        swift_bridgeObjectRelease();
        uint64_t v118 = v98[8];
        uint64_t v119 = (void *)(v136 + v118);
        uint64_t v120 = &v97[v118];
        uint64_t v122 = *(void *)v120;
        uint64_t v121 = *((void *)v120 + 1);
        *uint64_t v119 = v122;
        v119[1] = v121;
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
      sub_23723CDC0(v136, type metadata accessor for QuotaServerState);
      size_t v101 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090) - 8) + 64);
      char v102 = (void *)v136;
    }
    memcpy(v102, v97, v101);
LABEL_29:
    uint64_t v123 = v11[10];
    v124 = &v9[v123];
    v125 = &v10[v123];
    uint64_t v127 = *(void *)v125;
    uint64_t v126 = *((void *)v125 + 1);
    *(void *)v124 = v127;
    *((void *)v124 + 1) = v126;
    swift_bridgeObjectRelease();
    uint64_t v128 = v11[11];
    v129 = &v9[v128];
    uint64_t v130 = &v10[v128];
    *(void *)v129 = *(void *)v130;
    v129[8] = v130[8];
    return v138;
  }
  if (v15)
  {
LABEL_7:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
    memcpy(v9, v10, *(void *)(*(void *)(v26 - 8) + 64));
    return v138;
  }
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v137 + 32);
  v16(v9, v10, v6);
  uint64_t v17 = v11[5];
  uint64_t v18 = &v9[v17];
  char v19 = &v10[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = v11[6];
  uint64_t v21 = &v9[v20];
  uint64_t v22 = &v10[v20];
  uint64_t v23 = (int *)type metadata accessor for LitmusInfo(0);
  uint64_t v24 = *((void *)v23 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v24 + 48))(v22, 1, v23))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    v16(v21, v22, v6);
    uint64_t v38 = v23[5];
    uint64_t v39 = &v21[v38];
    uint64_t v40 = &v22[v38];
    *(_DWORD *)uint64_t v39 = *(_DWORD *)v40;
    v39[4] = v40[4];
    uint64_t v41 = v23[6];
    uint64_t v42 = &v21[v41];
    char v43 = &v22[v41];
    *(_DWORD *)uint64_t v42 = *(_DWORD *)v43;
    v42[4] = v43[4];
    uint64_t v44 = v23[7];
    uint64_t v45 = &v21[v44];
    uint64_t v46 = &v22[v44];
    *(_DWORD *)uint64_t v45 = *(_DWORD *)v46;
    v45[4] = v46[4];
    uint64_t v47 = v23[8];
    uint64_t v48 = &v21[v47];
    uint64_t v49 = &v22[v47];
    *(void *)uint64_t v48 = *(void *)v49;
    *((_WORD *)v48 + 4) = *((_WORD *)v49 + 4);
    (*(void (**)(char *, void, uint64_t, int *))(v24 + 56))(v21, 0, 1, v23);
  }
  uint64_t v50 = v11[7];
  char v51 = &v9[v50];
  uint64_t v52 = &v10[v50];
  *(void *)char v51 = *(void *)v52;
  v51[8] = v52[8];
  uint64_t v53 = v11[8];
  uint64_t v54 = &v9[v53];
  __int16 v55 = &v10[v53];
  v54[8] = v55[8];
  *(void *)uint64_t v54 = *(void *)v55;
  uint64_t v56 = v11[9];
  uint64_t v57 = &v9[v56];
  uint64_t v58 = &v10[v56];
  uint64_t v59 = (int *)type metadata accessor for QuotaServerState(0);
  uint64_t v60 = *((void *)v59 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v60 + 48))(v58, 1, v59))
  {
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
    memcpy(v57, v58, *(void *)(*(void *)(v61 - 8) + 64));
  }
  else
  {
    v16(v57, v58, v6);
    *(_OWORD *)&v57[v59[5]] = *(_OWORD *)&v58[v59[5]];
    *(_OWORD *)&v57[v59[6]] = *(_OWORD *)&v58[v59[6]];
    *(_OWORD *)&v57[v59[7]] = *(_OWORD *)&v58[v59[7]];
    *(_OWORD *)&v57[v59[8]] = *(_OWORD *)&v58[v59[8]];
    (*(void (**)(char *, void, uint64_t, int *))(v60 + 56))(v57, 0, 1, v59);
  }
  *(_OWORD *)&v9[v11[10]] = *(_OWORD *)&v10[v11[10]];
  uint64_t v62 = v11[11];
  uint64_t v63 = &v9[v62];
  uint64_t v64 = &v10[v62];
  v63[8] = v64[8];
  *(void *)uint64_t v63 = *(void *)v64;
  (*(void (**)(char *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  return v138;
}

uint64_t getEnumTagSinglePayload for NotificationStateWriteRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237284620);
}

uint64_t sub_237284620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_44Tm(a1, a2, a3, &qword_26AECBF80);
}

uint64_t storeEnumTagSinglePayload for NotificationStateWriteRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237284640);
}

uint64_t sub_237284640(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_45Tm(a1, a2, a3, a4, &qword_26AECBF80);
}

void sub_23728464C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t getEnumTagSinglePayload for NotificationStateWriteResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_41Tm_1);
}

uint64_t storeEnumTagSinglePayload for NotificationStateWriteResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_42Tm_1);
}

uint64_t getEnumTagSinglePayload for SetCliActivityRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_1);
}

uint64_t storeEnumTagSinglePayload for SetCliActivityRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_1);
}

uint64_t sub_2372846E4()
{
  return sub_237286AB4();
}

uint64_t *initializeBufferWithCopyOfBuffer for SetCliActivityResponse(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = (int *)type metadata accessor for CliActivityState(0);
    uint64_t v13 = *((void *)v12 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      v8((uint64_t *)v10, (uint64_t *)v11, v7);
      uint64_t v16 = v12[5];
      uint64_t v17 = &v10[v16];
      uint64_t v18 = &v11[v16];
      uint64_t v19 = *((void *)v18 + 1);
      *(void *)uint64_t v17 = *(void *)v18;
      *((void *)v17 + 1) = v19;
      uint64_t v20 = v12[6];
      uint64_t v21 = &v10[v20];
      uint64_t v22 = &v11[v20];
      *(void *)uint64_t v21 = *(void *)v22;
      v21[8] = v22[8];
      uint64_t v23 = v12[7];
      uint64_t v24 = &v10[v23];
      uint64_t v25 = &v11[v23];
      *(void *)uint64_t v24 = *(void *)v25;
      v24[8] = v25[8];
      uint64_t v26 = *(void (**)(char *, void, uint64_t, int *))(v13 + 56);
      swift_bridgeObjectRetain();
      v26(v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for SetCliActivityResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2372A4780();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = type metadata accessor for CliActivityState(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    v5(v6, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for SetCliActivityResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = (int *)type metadata accessor for CliActivityState(0);
  uint64_t v12 = *((void *)v11 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v14 = v11[5];
    uint64_t v15 = &v9[v14];
    uint64_t v16 = &v10[v14];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    uint64_t v18 = v11[6];
    uint64_t v19 = &v9[v18];
    uint64_t v20 = &v10[v18];
    *(void *)uint64_t v19 = *(void *)v20;
    v19[8] = v20[8];
    uint64_t v21 = v11[7];
    uint64_t v22 = &v9[v21];
    uint64_t v23 = &v10[v21];
    *(void *)uint64_t v22 = *(void *)v23;
    v22[8] = v23[8];
    uint64_t v24 = *(void (**)(char *, void, uint64_t, int *))(v12 + 56);
    swift_bridgeObjectRetain();
    v24(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for SetCliActivityResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 24);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v42 = a1;
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = (int *)type metadata accessor for CliActivityState(0);
  uint64_t v12 = *((void *)v11 - 1);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, int *))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      v7((uint64_t)v9, (uint64_t)v10, v6);
      uint64_t v30 = v11[5];
      char v31 = &v9[v30];
      uint64_t v32 = &v10[v30];
      *(void *)char v31 = *(void *)v32;
      *((void *)v31 + 1) = *((void *)v32 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v33 = v11[6];
      uint64_t v34 = &v9[v33];
      int v35 = &v10[v33];
      uint64_t v36 = *(void *)v35;
      v34[8] = v35[8];
      *(void *)uint64_t v34 = v36;
      uint64_t v37 = v11[7];
      uint64_t v38 = &v9[v37];
      uint64_t v39 = &v10[v37];
      uint64_t v40 = *(void *)v39;
      v38[8] = v39[8];
      *(void *)uint64_t v38 = v40;
      return v42;
    }
    sub_23723CDC0((uint64_t)v9, type metadata accessor for CliActivityState);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
    memcpy(v9, v10, *(void *)(*(void *)(v28 - 8) + 64));
    return v42;
  }
  (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v9, v10, v6);
  uint64_t v16 = v11[5];
  uint64_t v17 = &v9[v16];
  uint64_t v18 = &v10[v16];
  *(void *)uint64_t v17 = *(void *)v18;
  *((void *)v17 + 1) = *((void *)v18 + 1);
  uint64_t v19 = v11[6];
  uint64_t v20 = &v9[v19];
  uint64_t v21 = &v10[v19];
  char v22 = v21[8];
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v22;
  uint64_t v23 = v11[7];
  uint64_t v24 = &v9[v23];
  uint64_t v25 = &v10[v23];
  char v26 = v25[8];
  *(void *)uint64_t v24 = *(void *)v25;
  v24[8] = v26;
  uint64_t v27 = *(void (**)(char *, void, uint64_t, int *))(v12 + 56);
  swift_bridgeObjectRetain();
  v27(v9, 0, 1, v11);
  return v42;
}

uint64_t initializeWithTake for SetCliActivityResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = (int *)type metadata accessor for CliActivityState(0);
  uint64_t v12 = *((void *)v11 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    *(_OWORD *)&v9[v11[5]] = *(_OWORD *)&v10[v11[5]];
    uint64_t v14 = v11[6];
    int v15 = &v9[v14];
    uint64_t v16 = &v10[v14];
    *(void *)int v15 = *(void *)v16;
    v15[8] = v16[8];
    uint64_t v17 = v11[7];
    uint64_t v18 = &v9[v17];
    uint64_t v19 = &v10[v17];
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    (*(void (**)(char *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithTake for SetCliActivityResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 40);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v36 = a1;
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = (int *)type metadata accessor for CliActivityState(0);
  uint64_t v12 = *((void *)v11 - 1);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, int *))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      v7((uint64_t)v9, (uint64_t)v10, v6);
      uint64_t v24 = v11[5];
      uint64_t v25 = &v9[v24];
      char v26 = &v10[v24];
      uint64_t v28 = *(void *)v26;
      uint64_t v27 = *((void *)v26 + 1);
      *(void *)uint64_t v25 = v28;
      *((void *)v25 + 1) = v27;
      swift_bridgeObjectRelease();
      uint64_t v29 = v11[6];
      uint64_t v30 = &v9[v29];
      char v31 = &v10[v29];
      *(void *)uint64_t v30 = *(void *)v31;
      v30[8] = v31[8];
      uint64_t v32 = v11[7];
      uint64_t v33 = &v9[v32];
      uint64_t v34 = &v10[v32];
      v33[8] = v34[8];
      *(void *)uint64_t v33 = *(void *)v34;
      return v36;
    }
    sub_23723CDC0((uint64_t)v9, type metadata accessor for CliActivityState);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
    memcpy(v9, v10, *(void *)(*(void *)(v22 - 8) + 64));
    return v36;
  }
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v9, v10, v6);
  *(_OWORD *)&v9[v11[5]] = *(_OWORD *)&v10[v11[5]];
  uint64_t v16 = v11[6];
  uint64_t v17 = &v9[v16];
  uint64_t v18 = &v10[v16];
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v18[8];
  uint64_t v19 = v11[7];
  uint64_t v20 = &v9[v19];
  uint64_t v21 = &v10[v19];
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  (*(void (**)(char *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  return v36;
}

uint64_t getEnumTagSinglePayload for SetCliActivityResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237285280);
}

uint64_t sub_237285280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_44Tm(a1, a2, a3, &qword_26AECBF78);
}

uint64_t storeEnumTagSinglePayload for SetCliActivityResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2372852A0);
}

uint64_t sub_2372852A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_45Tm(a1, a2, a3, a4, &qword_26AECBF78);
}

void sub_2372852AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t getEnumTagSinglePayload for MobileAssetDownloadRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_41Tm_2);
}

uint64_t storeEnumTagSinglePayload for MobileAssetDownloadRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_42Tm_2);
}

uint64_t sub_237285310()
{
  return sub_2372898D0();
}

uint64_t *_s31iCloudSubscriptionOptimizerCore26MobileAssetDownloadRequestVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(void *)uint64_t v9 = *(void *)v10;
    v9[8] = v10[8];
  }
  return a1;
}

uint64_t _s31iCloudSubscriptionOptimizerCore26MobileAssetDownloadRequestVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  return a1;
}

uint64_t _s31iCloudSubscriptionOptimizerCore26MobileAssetDownloadRequestVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 8);
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = v10;
  return a1;
}

uint64_t _s31iCloudSubscriptionOptimizerCore26MobileAssetDownloadRequestVwtk_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  return a1;
}

uint64_t _s31iCloudSubscriptionOptimizerCore26MobileAssetDownloadRequestVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MobileAssetDownloadResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_41Tm_3);
}

uint64_t storeEnumTagSinglePayload for MobileAssetDownloadResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_42Tm_3);
}

uint64_t getEnumTagSinglePayload for MobileAssetGetVersionRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_41Tm_4);
}

uint64_t storeEnumTagSinglePayload for MobileAssetGetVersionRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_42Tm_4);
}

uint64_t getEnumTagSinglePayload for MobileAssetGetVersionResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0_3);
}

uint64_t storeEnumTagSinglePayload for MobileAssetGetVersionResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0_3);
}

void *initializeBufferWithCopyOfBuffer for DisplayDelayedOfferRequest(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    char v10 = (void *)((char *)a1 + v8);
    uint64_t v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *char v10 = *v11;
    v10[1] = v12;
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t initializeWithCopy for DisplayDelayedOfferRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  char v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DisplayDelayedOfferRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for DisplayDelayedOfferRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for DisplayDelayedOfferRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for DisplayDelayedOfferRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0_4);
}

uint64_t storeEnumTagSinglePayload for DisplayDelayedOfferRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0_4);
}

uint64_t sub_237285A1C()
{
  return sub_237286AB4();
}

uint64_t getEnumTagSinglePayload for DisplayDelayedOfferResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_41Tm_5);
}

uint64_t storeEnumTagSinglePayload for DisplayDelayedOfferResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_42Tm_5);
}

uint64_t getEnumTagSinglePayload for ActivityStatusRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_41Tm_6);
}

uint64_t storeEnumTagSinglePayload for ActivityStatusRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_42Tm_6);
}

uint64_t getEnumTagSinglePayload for ActivityStatusResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_14Tm_1);
}

uint64_t storeEnumTagSinglePayload for ActivityStatusResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_15Tm_1);
}

char *initializeBufferWithCopyOfBuffer for ActivityStatusResponse.Activity(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    uint64_t v8 = (void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    uint64_t v33 = *v8;
    (*v8)(a1, (char *)a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = &a1[v9];
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *(void *)uint64_t v11 = *v12;
    *((void *)v11 + 1) = v13;
    int v14 = &a1[v10];
    int v15 = (char *)a2 + v10;
    *((_WORD *)v14 + 4) = *((_WORD *)v15 + 4);
    *(void *)int v14 = *(void *)v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = &a1[v16];
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = type metadata accessor for ActivityStatusResponse.Activity.Criteria(0);
    uint64_t v20 = *(void *)(v19 - 8);
    uint64_t v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
    swift_bridgeObjectRetain();
    if (v21(v18, 1, v19))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A8);
      memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      v33(v17, v18, v7);
      uint64_t v24 = *(int *)(v19 + 20);
      uint64_t v25 = &v17[v24];
      char v26 = &v18[v24];
      *(void *)uint64_t v25 = *(void *)v26;
      v25[8] = v26[8];
      uint64_t v27 = *(int *)(v19 + 24);
      uint64_t v28 = &v17[v27];
      uint64_t v29 = &v18[v27];
      uint64_t v30 = *((void *)v29 + 1);
      *(void *)uint64_t v28 = *(void *)v29;
      *((void *)v28 + 1) = v30;
      char v31 = *(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56);
      swift_bridgeObjectRetain();
      v31(v17, 0, 1, v19);
    }
  }
  return a1;
}

uint64_t destroy for ActivityStatusResponse.Activity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2372A4780();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = type metadata accessor for ActivityStatusResponse.Activity.Criteria(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    v5(v6, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ActivityStatusResponse.Activity(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  char v31 = *v7;
  (*v7)(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = (void *)(a1 + v8);
  uint64_t v11 = (void *)(a2 + v8);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = a1 + v9;
  uint64_t v14 = a2 + v9;
  *(_WORD *)(v13 + 8) = *(_WORD *)(v14 + 8);
  *(void *)uint64_t v13 = *(void *)v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)(a1 + v15);
  uint64_t v17 = (char *)(a2 + v15);
  uint64_t v18 = type metadata accessor for ActivityStatusResponse.Activity.Criteria(0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain();
  if (v20(v17, 1, v18))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A8);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    v31((uint64_t)v16, (uint64_t)v17, v6);
    uint64_t v22 = *(int *)(v18 + 20);
    uint64_t v23 = &v16[v22];
    uint64_t v24 = &v17[v22];
    *(void *)uint64_t v23 = *(void *)v24;
    v23[8] = v24[8];
    uint64_t v25 = *(int *)(v18 + 24);
    char v26 = &v16[v25];
    uint64_t v27 = &v17[v25];
    uint64_t v28 = *((void *)v27 + 1);
    *(void *)char v26 = *(void *)v27;
    *((void *)v26 + 1) = v28;
    uint64_t v29 = *(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56);
    swift_bridgeObjectRetain();
    v29(v16, 0, 1, v18);
  }
  return a1;
}

uint64_t assignWithCopy for ActivityStatusResponse.Activity(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v39 = *(void *)(v6 - 8);
  uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 24);
  v40(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v13 = *v12;
  *(_WORD *)(v11 + 8) = *((_WORD *)v12 + 4);
  *(void *)uint64_t v11 = v13;
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  uint64_t v17 = type metadata accessor for ActivityStatusResponse.Activity.Criteria(0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  if (!v20)
  {
    if (!v21)
    {
      v40((uint64_t)v15, (uint64_t)v16, v6);
      uint64_t v32 = *(int *)(v17 + 20);
      uint64_t v33 = &v15[v32];
      uint64_t v34 = &v16[v32];
      char v35 = v34[8];
      *(void *)uint64_t v33 = *(void *)v34;
      v33[8] = v35;
      uint64_t v36 = *(int *)(v17 + 24);
      uint64_t v37 = &v15[v36];
      uint64_t v38 = &v16[v36];
      *(void *)uint64_t v37 = *(void *)v38;
      *((void *)v37 + 1) = *((void *)v38 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_23723CDC0((uint64_t)v15, type metadata accessor for ActivityStatusResponse.Activity.Criteria);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A8);
    memcpy(v15, v16, *(void *)(*(void *)(v30 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v15, v16, v6);
  uint64_t v22 = *(int *)(v17 + 20);
  uint64_t v23 = &v15[v22];
  uint64_t v24 = &v16[v22];
  char v25 = v24[8];
  *(void *)uint64_t v23 = *(void *)v24;
  v23[8] = v25;
  uint64_t v26 = *(int *)(v17 + 24);
  uint64_t v27 = &v15[v26];
  uint64_t v28 = &v16[v26];
  *(void *)uint64_t v27 = *(void *)v28;
  *((void *)v27 + 1) = *((void *)v28 + 1);
  uint64_t v29 = *(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56);
  swift_bridgeObjectRetain();
  v29(v15, 0, 1, v17);
  return a1;
}

uint64_t initializeWithTake for ActivityStatusResponse.Activity(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_WORD *)(v9 + 8) = *(_WORD *)(v10 + 8);
  *(void *)uint64_t v9 = *(void *)v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)(a1 + v11);
  uint64_t v13 = (char *)(a2 + v11);
  uint64_t v14 = type metadata accessor for ActivityStatusResponse.Activity.Criteria(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A8);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v12, (uint64_t)v13, v6);
    uint64_t v17 = *(int *)(v14 + 20);
    uint64_t v18 = &v12[v17];
    uint64_t v19 = &v13[v17];
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    *(_OWORD *)&v12[*(int *)(v14 + 24)] = *(_OWORD *)&v13[*(int *)(v14 + 24)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t assignWithTake for ActivityStatusResponse.Activity(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v36 = *(void *)(v6 - 8);
  uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 40);
  v37(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  *(_WORD *)(v14 + 8) = *(_WORD *)(v15 + 8);
  uint64_t v16 = (char *)(a1 + v13);
  uint64_t v17 = (char *)(a2 + v13);
  uint64_t v18 = type metadata accessor for ActivityStatusResponse.Activity.Criteria(0);
  uint64_t v19 = *(void *)(v18 - 8);
  int v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (!v21)
  {
    if (!v22)
    {
      v37((uint64_t)v16, (uint64_t)v17, v6);
      uint64_t v28 = *(int *)(v18 + 20);
      uint64_t v29 = &v16[v28];
      uint64_t v30 = &v17[v28];
      *(void *)uint64_t v29 = *(void *)v30;
      v29[8] = v30[8];
      uint64_t v31 = *(int *)(v18 + 24);
      uint64_t v32 = &v16[v31];
      uint64_t v33 = &v17[v31];
      uint64_t v35 = *(void *)v33;
      uint64_t v34 = *((void *)v33 + 1);
      *(void *)uint64_t v32 = v35;
      *((void *)v32 + 1) = v34;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_23723CDC0((uint64_t)v16, type metadata accessor for ActivityStatusResponse.Activity.Criteria);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A8);
    memcpy(v16, v17, *(void *)(*(void *)(v26 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v16, v17, v6);
  uint64_t v23 = *(int *)(v18 + 20);
  uint64_t v24 = &v16[v23];
  char v25 = &v17[v23];
  *(void *)uint64_t v24 = *(void *)v25;
  v24[8] = v25[8];
  *(_OWORD *)&v16[*(int *)(v18 + 24)] = *(_OWORD *)&v17[*(int *)(v18 + 24)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityStatusResponse.Activity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2372866F4);
}

uint64_t sub_2372866F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 2147483646)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A8);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a3 + 28);
    return v13(v15, a2, v14);
  }
}

uint64_t storeEnumTagSinglePayload for ActivityStatusResponse.Activity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237286848);
}

uint64_t sub_237286848(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2372A4780();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 2147483646)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A8);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_23728697C()
{
  sub_2372A4780();
  if (v0 <= 0x3F)
  {
    sub_23727E6E0(319, &qword_268908950, (void (*)(uint64_t))type metadata accessor for ActivityStatusResponse.Activity.Criteria);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

ValueMetadata *type metadata accessor for ActivityStatusResponse.Activity.Status()
{
  return &type metadata for ActivityStatusResponse.Activity.Status;
}

uint64_t getEnumTagSinglePayload for ActivityStatusResponse.Activity.Criteria(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_2);
}

uint64_t storeEnumTagSinglePayload for ActivityStatusResponse.Activity.Criteria(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_2);
}

uint64_t sub_237286AB4()
{
  uint64_t result = sub_2372A4780();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ActivityClearRequest(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t initializeWithCopy for ActivityClearRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithCopy for ActivityClearRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t initializeWithTake for ActivityClearRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for ActivityClearRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityClearRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237286E8C);
}

uint64_t __swift_get_extra_inhabitant_index_56Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      int v11 = ((v10 + 2147483646) & 0x7FFFFFFF) - 1;
    }
    else {
      int v11 = -2;
    }
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ActivityClearRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237286F80);
}

uint64_t __swift_store_extra_inhabitant_index_57Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2372A4780();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  }
  return result;
}

uint64_t sub_237287040()
{
  return sub_2372874D8();
}

uint64_t getEnumTagSinglePayload for ActivityClearResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_41Tm_7);
}

uint64_t storeEnumTagSinglePayload for ActivityClearResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_42Tm_7);
}

uint64_t *initializeBufferWithCopyOfBuffer for GetBiomeStreamRequest(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    unsigned int v10 = (char *)a1 + v8;
    int v11 = (char *)a2 + v8;
    *(void *)unsigned int v10 = *(void *)v11;
    v10[8] = v11[8];
    uint64_t v12 = (char *)a1 + v9;
    uint64_t v13 = (char *)a2 + v9;
    *(void *)uint64_t v12 = *(void *)v13;
    v12[8] = v13[8];
    uint64_t v14 = a3[7];
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    *(void *)uint64_t v15 = *(void *)v16;
    *((_WORD *)v15 + 4) = *((_WORD *)v16 + 4);
  }
  return a1;
}

uint64_t initializeWithCopy for GetBiomeStreamRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(void *)uint64_t v14 = *(void *)v15;
  *(_WORD *)(v14 + 8) = *(_WORD *)(v15 + 8);
  return a1;
}

uint64_t assignWithCopy for GetBiomeStreamRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 8);
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = v10;
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  char v14 = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  __int16 v18 = *(_WORD *)(v17 + 8);
  *(void *)uint64_t v16 = *(void *)v17;
  *(_WORD *)(v16 + 8) = v18;
  return a1;
}

uint64_t initializeWithTake for GetBiomeStreamRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(void *)uint64_t v14 = *(void *)v15;
  *(_WORD *)(v14 + 8) = *(_WORD *)(v15 + 8);
  return a1;
}

uint64_t assignWithTake for GetBiomeStreamRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(void *)uint64_t v14 = *(void *)v15;
  *(_WORD *)(v14 + 8) = *(_WORD *)(v15 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetBiomeStreamRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_41Tm_8);
}

uint64_t storeEnumTagSinglePayload for GetBiomeStreamRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_42Tm_8);
}

uint64_t sub_2372874C4()
{
  return sub_2372874D8();
}

uint64_t sub_2372874D8()
{
  uint64_t result = sub_2372A4780();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for GetBiomeStreamRequest.StreamType()
{
  return &type metadata for GetBiomeStreamRequest.StreamType;
}

uint64_t getEnumTagSinglePayload for GetBiomeStreamResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_14Tm_2);
}

uint64_t storeEnumTagSinglePayload for GetBiomeStreamResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_15Tm_2);
}

uint64_t getEnumTagSinglePayload for ActivityHistoryRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_41Tm_9);
}

uint64_t storeEnumTagSinglePayload for ActivityHistoryRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_42Tm_9);
}

char *initializeBufferWithCopyOfBuffer for ActivityHistoryResponse(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, (char *)a2, v7);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = type metadata accessor for SystemActivityHistory_File(0);
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      *(void *)uint64_t v10 = *v11;
      uint64_t v16 = *(int *)(v12 + 20);
      uint64_t v17 = &v10[v16];
      __int16 v18 = (char *)v11 + v16;
      swift_bridgeObjectRetain();
      v8(v17, v18, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for ActivityHistoryResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2372A4780();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v9(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for SystemActivityHistory_File(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = v5 + *(int *)(v6 + 20);
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v8, v4);
  }
  return result;
}

uint64_t initializeWithCopy for ActivityHistoryResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for SystemActivityHistory_File(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    *uint64_t v9 = *v10;
    uint64_t v14 = *(int *)(v11 + 20);
    uint64_t v15 = (char *)v9 + v14;
    uint64_t v16 = (char *)v10 + v14;
    swift_bridgeObjectRetain();
    v7((uint64_t)v15, (uint64_t)v16, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for ActivityHistoryResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v22 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 24);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v23 = a1;
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for SystemActivityHistory_File(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      *uint64_t v9 = *v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v7((uint64_t)v9 + *(int *)(v11 + 20), (uint64_t)v10 + *(int *)(v11 + 20), v6);
      return v23;
    }
    sub_23723CDC0((uint64_t)v9, type metadata accessor for SystemActivityHistory_File);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
    memcpy(v9, v10, *(void *)(*(void *)(v20 - 8) + 64));
    return v23;
  }
  *uint64_t v9 = *v10;
  uint64_t v16 = *(int *)(v11 + 20);
  uint64_t v17 = (char *)v9 + v16;
  __int16 v18 = (char *)v10 + v16;
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  swift_bridgeObjectRetain();
  v19(v17, v18, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return v23;
}

char *initializeWithTake for ActivityHistoryResponse(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = type metadata accessor for SystemActivityHistory_File(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    *(void *)uint64_t v9 = *(void *)v10;
    v7(&v9[*(int *)(v11 + 20)], &v10[*(int *)(v11 + 20)], v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithTake for ActivityHistoryResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v18 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 40);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v19 = a1;
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for SystemActivityHistory_File(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      *uint64_t v9 = *v10;
      swift_bridgeObjectRelease();
      v7((uint64_t)v9 + *(int *)(v11 + 20), (uint64_t)v10 + *(int *)(v11 + 20), v6);
      return v19;
    }
    sub_23723CDC0((uint64_t)v9, type metadata accessor for SystemActivityHistory_File);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    return v19;
  }
  *uint64_t v9 = *v10;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))((char *)v9 + *(int *)(v11 + 20), (char *)v10 + *(int *)(v11 + 20), v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return v19;
}

uint64_t getEnumTagSinglePayload for ActivityHistoryResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237287FDC);
}

uint64_t sub_237287FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_44Tm(a1, a2, a3, &qword_2689083B0);
}

uint64_t __swift_get_extra_inhabitant_index_44Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8 = sub_2372A4780();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a2)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    return v10(a1, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(a4);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a3 + 20);
    return v13(v15, a2, v14);
  }
}

uint64_t storeEnumTagSinglePayload for ActivityHistoryResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2372880F8);
}

uint64_t sub_2372880F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_45Tm(a1, a2, a3, a4, &qword_2689083B0);
}

uint64_t __swift_store_extra_inhabitant_index_45Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10 = sub_2372A4780();
  uint64_t v11 = *(void *)(v10 - 8);
  if (*(_DWORD *)(v11 + 84) == a3)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
    return v12(a1, a2, a2, v10);
  }
  else
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    uint64_t v16 = v14;
    uint64_t v17 = a1 + *(int *)(a4 + 20);
    return v15(v17, a2, a2, v16);
  }
}

void sub_237288218(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_237288238(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, void (*a5)(uint64_t))
{
  sub_2372A4780();
  if (v7 <= 0x3F)
  {
    sub_23727E6E0(319, a4, a5);
    if (v8 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void *initializeBufferWithCopyOfBuffer for ShadowEvaluationRequest(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    unint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2372A4780();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (char *)v7 + v13;
    uint64_t v16 = (char *)a2 + v13;
    *(void *)uint64_t v15 = *(void *)v16;
    v15[8] = v16[8];
    uint64_t v17 = (char *)v7 + v14;
    uint64_t v18 = (char *)a2 + v14;
    *(void *)uint64_t v17 = *(void *)v18;
    v17[8] = v18[8];
    uint64_t v19 = a3[8];
    uint64_t v20 = a3[9];
    int v21 = (char *)v7 + v19;
    uint64_t v22 = (char *)a2 + v19;
    *(void *)int v21 = *(void *)v22;
    v21[8] = v22[8];
    *((unsigned char *)v7 + v20) = *((unsigned char *)a2 + v20);
    uint64_t v23 = a3[10];
    uint64_t v24 = a3[11];
    char v25 = (char *)v7 + v23;
    uint64_t v26 = (char *)a2 + v23;
    *(void *)char v25 = *(void *)v26;
    v25[8] = v26[8];
    *((unsigned char *)v7 + v24) = *((unsigned char *)a2 + v24);
  }
  return v7;
}

void *initializeWithCopy for ShadowEvaluationRequest(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  uint64_t v15 = (char *)a1 + v12;
  uint64_t v16 = (char *)a2 + v12;
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = (char *)a1 + v17;
  uint64_t v20 = (char *)a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  v19[8] = v20[8];
  *((unsigned char *)a1 + v18) = *((unsigned char *)a2 + v18);
  uint64_t v21 = a3[10];
  uint64_t v22 = a3[11];
  uint64_t v23 = (char *)a1 + v21;
  uint64_t v24 = (char *)a2 + v21;
  *(void *)uint64_t v23 = *(void *)v24;
  v23[8] = v24[8];
  *((unsigned char *)a1 + v22) = *((unsigned char *)a2 + v22);
  return a1;
}

void *assignWithCopy for ShadowEvaluationRequest(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = *(void *)v12;
  v11[8] = v12[8];
  *(void *)uint64_t v11 = v13;
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  LOBYTE(v13) = v16[8];
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v13;
  uint64_t v17 = a3[8];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  LOBYTE(v13) = v19[8];
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v13;
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  uint64_t v20 = a3[10];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = *(void *)v22;
  v21[8] = v22[8];
  *(void *)uint64_t v21 = v23;
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  return a1;
}

void *initializeWithTake for ShadowEvaluationRequest(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  uint64_t v13 = (char *)a2 + v10;
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = (char *)a1 + v11;
  uint64_t v15 = (char *)a2 + v11;
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  *((unsigned char *)a1 + v17) = *((unsigned char *)a2 + v17);
  uint64_t v20 = a3[10];
  uint64_t v21 = a3[11];
  uint64_t v22 = (char *)a1 + v20;
  uint64_t v23 = (char *)a2 + v20;
  *(void *)uint64_t v22 = *(void *)v23;
  v22[8] = v23[8];
  *((unsigned char *)a1 + v21) = *((unsigned char *)a2 + v21);
  return a1;
}

void *assignWithTake for ShadowEvaluationRequest(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  uint64_t v13 = (char *)a2 + v10;
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = (char *)a1 + v11;
  uint64_t v15 = (char *)a2 + v11;
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  *((unsigned char *)a1 + v17) = *((unsigned char *)a2 + v17);
  uint64_t v20 = a3[10];
  uint64_t v21 = a3[11];
  uint64_t v22 = (char *)a1 + v20;
  uint64_t v23 = (char *)a2 + v20;
  *(void *)uint64_t v22 = *(void *)v23;
  v22[8] = v23[8];
  *((unsigned char *)a1 + v21) = *((unsigned char *)a2 + v21);
  return a1;
}

uint64_t getEnumTagSinglePayload for ShadowEvaluationRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_14Tm_3);
}

uint64_t storeEnumTagSinglePayload for ShadowEvaluationRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_15Tm_3);
}

uint64_t sub_237288918()
{
  uint64_t result = sub_2372A4780();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ShadowEvaluationResponse(void *a1, void *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    unint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2372A4780();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    *((unsigned char *)v7 + *(int *)(a3 + 28)) = *((unsigned char *)a2 + *(int *)(a3 + 28));
  }
  return v7;
}

void *initializeWithCopy for ShadowEvaluationResponse(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2372A4780();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *((unsigned char *)a1 + *(int *)(a3 + 28)) = *((unsigned char *)a2 + *(int *)(a3 + 28));
  return a1;
}

void *assignWithCopy for ShadowEvaluationResponse(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 28)) = *((unsigned char *)a2 + *(int *)(a3 + 28));
  return a1;
}

_OWORD *initializeWithTake for ShadowEvaluationResponse(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 28)) = *((unsigned char *)a2 + *(int *)(a3 + 28));
  return a1;
}

void *assignWithTake for ShadowEvaluationResponse(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 28)) = *((unsigned char *)a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t getEnumTagSinglePayload for ShadowEvaluationResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237288DB8);
}

uint64_t __swift_get_extra_inhabitant_index_32Tm(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_2372A4780();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ShadowEvaluationResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237288E80);
}

void *__swift_store_extra_inhabitant_index_33Tm(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_237288F2C()
{
  return sub_237288F38();
}

uint64_t sub_237288F38()
{
  uint64_t result = sub_2372A4780();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DeleteDaemonStateRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(void *)uint64_t v9 = *(void *)v10;
    *((_WORD *)v9 + 4) = *((_WORD *)v10 + 4);
  }
  return a1;
}

uint64_t initializeWithCopy for DeleteDaemonStateRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(_WORD *)(v8 + 8) = *(_WORD *)(v9 + 8);
  return a1;
}

uint64_t assignWithCopy for DeleteDaemonStateRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  __int16 v10 = *(_WORD *)(v9 + 8);
  *(void *)uint64_t v8 = *(void *)v9;
  *(_WORD *)(v8 + 8) = v10;
  return a1;
}

uint64_t initializeWithTake for DeleteDaemonStateRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(_WORD *)(v8 + 8) = *(_WORD *)(v9 + 8);
  return a1;
}

uint64_t assignWithTake for DeleteDaemonStateRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(_WORD *)(v8 + 8) = *(_WORD *)(v9 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeleteDaemonStateRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2372892F8);
}

uint64_t __swift_get_extra_inhabitant_index_41Tm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2372A4780();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DeleteDaemonStateRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23728937C);
}

uint64_t __swift_store_extra_inhabitant_index_42Tm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2372A4780();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_2372893F0()
{
  return sub_2372898D0();
}

ValueMetadata *type metadata accessor for DeleteDaemonStateRequest.StateCategory()
{
  return &type metadata for DeleteDaemonStateRequest.StateCategory;
}

uint64_t *_s31iCloudSubscriptionOptimizerCore13ErrorResponseVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2372A4780();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    __int16 v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s31iCloudSubscriptionOptimizerCore13ErrorResponseVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s31iCloudSubscriptionOptimizerCore13ErrorResponseVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s31iCloudSubscriptionOptimizerCore13ErrorResponseVwtk_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s31iCloudSubscriptionOptimizerCore13ErrorResponseVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DeleteDaemonStateResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237289724);
}

uint64_t __swift_get_extra_inhabitant_indexTm_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for DeleteDaemonStateResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23728980C);
}

uint64_t __swift_store_extra_inhabitant_indexTm_0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2372A4780();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t sub_2372898D0()
{
  uint64_t result = sub_2372A4780();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SubscriptionClientRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for SubscriptionClientRequest.OneOf_Type(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECC870);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v16 = sub_2372A4780();
          uint64_t v17 = (void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v16 - 8) + 16);
          v214 = *v17;
          (*v17)(a1, a2, v16);
          uint64_t v18 = type metadata accessor for NewOfferRequest(0);
          uint64_t v19 = *(int *)(v18 + 20);
          uint64_t v20 = (char *)a1 + v19;
          uint64_t v21 = (char *)a2 + v19;
          *(void *)uint64_t v20 = *(void *)v21;
          v20[8] = v21[8];
          uint64_t v22 = *(int *)(v18 + 24);
          __dst = (char *)a1 + v22;
          uint64_t v222 = v18;
          uint64_t v23 = (char *)a2 + v22;
          uint64_t v24 = (int *)type metadata accessor for LitmusInfo(0);
          uint64_t v25 = *((void *)v24 - 1);
          uint64_t v212 = v16;
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v25 + 48))(v23, 1, v24))
          {
            uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
            memcpy(__dst, v23, *(void *)(*(void *)(v26 - 8) + 64));
          }
          else
          {
            v214((uint64_t *)__dst, (uint64_t *)v23, v16);
            uint64_t v109 = v24[5];
            char v110 = &__dst[v109];
            uint64_t v111 = &v23[v109];
            *(_DWORD *)char v110 = *(_DWORD *)v111;
            v110[4] = v111[4];
            uint64_t v112 = v24[6];
            uint64_t v113 = &__dst[v112];
            char v114 = &v23[v112];
            *(_DWORD *)uint64_t v113 = *(_DWORD *)v114;
            v113[4] = v114[4];
            uint64_t v115 = v24[7];
            uint64_t v116 = &__dst[v115];
            uint64_t v117 = &v23[v115];
            *(_DWORD *)uint64_t v116 = *(_DWORD *)v117;
            v116[4] = v117[4];
            uint64_t v118 = v24[8];
            uint64_t v119 = &__dst[v118];
            uint64_t v120 = &v23[v118];
            *(void *)uint64_t v119 = *(void *)v120;
            *((_WORD *)v119 + 4) = *((_WORD *)v120 + 4);
            (*(void (**)(char *, void, uint64_t, int *))(v25 + 56))(__dst, 0, 1, v24);
          }
          uint64_t v121 = *(int *)(v222 + 28);
          uint64_t v122 = (char *)a1 + v121;
          uint64_t v123 = (char *)a2 + v121;
          *(void *)uint64_t v122 = *(void *)v123;
          v122[8] = v123[8];
          uint64_t v124 = *(int *)(v222 + 32);
          v125 = (char *)a1 + v124;
          uint64_t v126 = (char *)a2 + v124;
          uint64_t v127 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v128 = *((void *)v127 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v128 + 48))(v126, 1, v127))
          {
            uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v125, v126, *(void *)(*(void *)(v129 - 8) + 64));
          }
          else
          {
            v214((uint64_t *)v125, (uint64_t *)v126, v212);
            uint64_t v139 = v127[5];
            uint64_t v140 = &v125[v139];
            v141 = &v126[v139];
            uint64_t v142 = *((void *)v141 + 1);
            *(void *)uint64_t v140 = *(void *)v141;
            *((void *)v140 + 1) = v142;
            uint64_t v143 = v127[6];
            v144 = &v125[v143];
            v145 = &v126[v143];
            __dstc = (void *)*((void *)v145 + 1);
            *(void *)v144 = *(void *)v145;
            *((void *)v144 + 1) = __dstc;
            uint64_t v146 = v127[7];
            v147 = &v125[v146];
            v148 = &v126[v146];
            uint64_t v149 = *((void *)v148 + 1);
            *(void *)v147 = *(void *)v148;
            *((void *)v147 + 1) = v149;
            uint64_t v150 = v127[8];
            v151 = &v125[v150];
            v152 = &v126[v150];
            uint64_t v153 = *((void *)v152 + 1);
            *(void *)v151 = *(void *)v152;
            *((void *)v151 + 1) = v153;
            v154 = *(void (**)(char *, void, uint64_t, int *))(v128 + 56);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v154(v125, 0, 1, v127);
          }
          break;
        case 2u:
          uint64_t v27 = a2[1];
          *a1 = *a2;
          a1[1] = v27;
          uint64_t v28 = type metadata accessor for FeaturesRequest(0);
          uint64_t v29 = *(int *)(v28 + 24);
          __dsta = (char *)a2 + v29;
          v223 = (char *)a1 + v29;
          uint64_t v30 = sub_2372A4780();
          v215 = *(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v215(v223, __dsta, v30);
          uint64_t v31 = *(int *)(v28 + 28);
          uint64_t v32 = (char *)a1 + v31;
          uint64_t v33 = (char *)a2 + v31;
          *(void *)uint64_t v32 = *(void *)v33;
          v32[8] = v33[8];
          break;
        case 3u:
        case 5u:
        case 8u:
        case 0xCu:
        case 0xFu:
          uint64_t v104 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v104 - 8) + 16))(a1, a2, v104);
          break;
        case 4u:
          uint64_t v34 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v34 - 8) + 16))(a1, a2, v34);
          uint64_t v35 = (int *)type metadata accessor for DataRequest(0);
          uint64_t v36 = v35[5];
          uint64_t v37 = (char *)a1 + v36;
          uint64_t v38 = (char *)a2 + v36;
          *(void *)uint64_t v37 = *(void *)v38;
          v37[8] = v38[8];
          uint64_t v39 = v35[6];
          uint64_t v40 = (char *)a1 + v39;
          uint64_t v41 = (char *)a2 + v39;
          *(void *)uint64_t v40 = *(void *)v41;
          v40[8] = v41[8];
          uint64_t v42 = v35[7];
          char v43 = (char *)a1 + v42;
          uint64_t v44 = (char *)a2 + v42;
          v43[8] = v44[8];
          *(void *)char v43 = *(void *)v44;
          *((unsigned char *)a1 + v35[8]) = *((unsigned char *)a2 + v35[8]);
          uint64_t v45 = v35[9];
          uint64_t v46 = (char *)a1 + v45;
          uint64_t v47 = (char *)a2 + v45;
          *(void *)uint64_t v46 = *(void *)v47;
          v46[8] = v47[8];
          *((unsigned char *)a1 + v35[10]) = *((unsigned char *)a2 + v35[10]);
          *((unsigned char *)a1 + v35[11]) = *((unsigned char *)a2 + v35[11]);
          break;
        case 6u:
          uint64_t v48 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v48 - 8) + 16))(a1, a2, v48);
          uint64_t v49 = type metadata accessor for SetCliActivityRequest(0);
          uint64_t v50 = *(int *)(v49 + 20);
          char v51 = (char *)a1 + v50;
          uint64_t v52 = (char *)a2 + v50;
          *(void *)char v51 = *(void *)v52;
          v51[8] = v52[8];
          uint64_t v53 = *(int *)(v49 + 24);
          uint64_t v54 = (uint64_t *)((char *)a1 + v53);
          __int16 v55 = (uint64_t *)((char *)a2 + v53);
          uint64_t v56 = v55[1];
          void *v54 = *v55;
          v54[1] = v56;
          swift_bridgeObjectRetain();
          break;
        case 7u:
          uint64_t v57 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v57 - 8) + 16))(a1, a2, v57);
          uint64_t v58 = type metadata accessor for DisplayDelayedOfferRequest(0);
          uint64_t v59 = *(int *)(v58 + 20);
          uint64_t v60 = (uint64_t *)((char *)a1 + v59);
          uint64_t v61 = (uint64_t *)((char *)a2 + v59);
          uint64_t v63 = *v61;
          uint64_t v62 = v61[1];
          void *v60 = v63;
          v60[1] = v62;
          *((unsigned char *)a1 + *(int *)(v58 + 24)) = *((unsigned char *)a2 + *(int *)(v58 + 24));
          swift_bridgeObjectRetain();
          break;
        case 9u:
          uint64_t v64 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v64 - 8) + 16))(a1, a2, v64);
          uint64_t v65 = (int *)type metadata accessor for ActivityClearRequest(0);
          *((unsigned char *)a1 + v65[5]) = *((unsigned char *)a2 + v65[5]);
          *((unsigned char *)a1 + v65[6]) = *((unsigned char *)a2 + v65[6]);
          *((unsigned char *)a1 + v65[7]) = *((unsigned char *)a2 + v65[7]);
          break;
        case 0xAu:
          uint64_t v66 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v66 - 8) + 16))(a1, a2, v66);
          BiomeStreamRequest = (int *)type metadata accessor for GetBiomeStreamRequest(0);
          uint64_t v68 = BiomeStreamRequest[5];
          uint64_t v69 = (char *)a1 + v68;
          uint64_t v70 = (char *)a2 + v68;
          *(void *)uint64_t v69 = *(void *)v70;
          v69[8] = v70[8];
          uint64_t v71 = BiomeStreamRequest[6];
          uint64_t v72 = (char *)a1 + v71;
          uint64_t v73 = (char *)a2 + v71;
          *(void *)uint64_t v72 = *(void *)v73;
          v72[8] = v73[8];
          uint64_t v74 = BiomeStreamRequest[7];
          uint64_t v75 = (char *)a1 + v74;
          uint64_t v76 = (char *)a2 + v74;
          *(void *)uint64_t v75 = *(void *)v76;
          *((_WORD *)v75 + 4) = *((_WORD *)v76 + 4);
          break;
        case 0xBu:
          uint64_t v77 = sub_2372A4780();
          v224 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v77 - 8) + 16);
          v224(a1, a2, v77);
          uint64_t v78 = *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
          uint64_t v79 = (char *)a1 + v78;
          uint64_t v80 = (char *)a2 + v78;
          uint64_t v81 = type metadata accessor for NotificationState(0);
          uint64_t v82 = *(void *)(v81 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48))(v80, 1, v81))
          {
            uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
            memcpy(v79, v80, *(void *)(*(void *)(v83 - 8) + 64));
          }
          else
          {
            uint64_t v213 = v82;
            v224((uint64_t *)v79, (uint64_t *)v80, v77);
            uint64_t v130 = *(int *)(v81 + 20);
            uint64_t v131 = &v79[v130];
            uint64_t v132 = &v80[v130];
            *(void *)uint64_t v131 = *(void *)v132;
            v131[8] = v132[8];
            v208 = (int *)v81;
            v210 = v80;
            uint64_t v133 = *(int *)(v81 + 24);
            v216 = v79;
            v134 = &v79[v133];
            uint64_t v135 = &v80[v133];
            uint64_t v136 = (int *)type metadata accessor for LitmusInfo(0);
            uint64_t v137 = *((void *)v136 - 1);
            uint64_t v206 = v77;
            if ((*(unsigned int (**)(char *, uint64_t, int *))(v137 + 48))(v135, 1, v136))
            {
              uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
              memcpy(v134, v135, *(void *)(*(void *)(v138 - 8) + 64));
            }
            else
            {
              v224((uint64_t *)v134, (uint64_t *)v135, v77);
              uint64_t v155 = v136[5];
              uint64_t v156 = &v134[v155];
              v157 = &v135[v155];
              *(_DWORD *)uint64_t v156 = *(_DWORD *)v157;
              v156[4] = v157[4];
              uint64_t v158 = v136[6];
              uint64_t v159 = &v134[v158];
              v160 = &v135[v158];
              *(_DWORD *)uint64_t v159 = *(_DWORD *)v160;
              v159[4] = v160[4];
              uint64_t v161 = v136[7];
              uint64_t v162 = &v134[v161];
              v163 = &v135[v161];
              *(_DWORD *)uint64_t v162 = *(_DWORD *)v163;
              v162[4] = v163[4];
              uint64_t v164 = v136[8];
              uint64_t v165 = &v134[v164];
              v166 = &v135[v164];
              *(void *)uint64_t v165 = *(void *)v166;
              *((_WORD *)v165 + 4) = *((_WORD *)v166 + 4);
              (*(void (**)(char *, void, uint64_t, int *))(v137 + 56))(v134, 0, 1, v136);
            }
            uint64_t v168 = v208;
            v167 = v210;
            uint64_t v169 = v208[7];
            v170 = &v216[v169];
            uint64_t v171 = &v210[v169];
            *(void *)v170 = *(void *)v171;
            v170[8] = v171[8];
            uint64_t v172 = v208[8];
            v173 = &v216[v172];
            uint64_t v174 = &v210[v172];
            v173[8] = v174[8];
            *(void *)v173 = *(void *)v174;
            uint64_t v175 = v208[9];
            uint64_t v176 = &v216[v175];
            uint64_t v177 = &v210[v175];
            uint64_t v178 = (int *)type metadata accessor for QuotaServerState(0);
            uint64_t v211 = *((void *)v178 - 1);
            if ((*(unsigned int (**)(char *, uint64_t, int *))(v211 + 48))(v177, 1, v178))
            {
              uint64_t v179 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
              memcpy(v176, v177, *(void *)(*(void *)(v179 - 8) + 64));
            }
            else
            {
              v224((uint64_t *)v176, (uint64_t *)v177, v206);
              uint64_t v180 = v178[5];
              v181 = &v176[v180];
              v182 = &v177[v180];
              uint64_t v183 = *((void *)v182 + 1);
              *(void *)v181 = *(void *)v182;
              *((void *)v181 + 1) = v183;
              uint64_t v184 = v178[6];
              v185 = &v176[v184];
              v186 = &v177[v184];
              __dstd = (void *)*((void *)v186 + 1);
              *(void *)v185 = *(void *)v186;
              *((void *)v185 + 1) = __dstd;
              uint64_t v187 = v178[7];
              v188 = &v176[v187];
              v189 = &v177[v187];
              uint64_t v209 = *((void *)v189 + 1);
              *(void *)v188 = *(void *)v189;
              *((void *)v188 + 1) = v209;
              uint64_t v190 = v178[8];
              v191 = &v176[v190];
              v192 = &v177[v190];
              uint64_t v207 = *((void *)v192 + 1);
              *(void *)v191 = *(void *)v192;
              *((void *)v191 + 1) = v207;
              v226 = *(void (**)(char *, void, uint64_t, int *))(v211 + 56);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v226(v176, 0, 1, v178);
            }
            uint64_t v193 = v168[10];
            v194 = &v216[v193];
            v195 = &v167[v193];
            uint64_t v196 = *((void *)v195 + 1);
            *(void *)v194 = *(void *)v195;
            *((void *)v194 + 1) = v196;
            uint64_t v197 = v168[11];
            v198 = &v216[v197];
            v199 = &v167[v197];
            v198[8] = v199[8];
            *(void *)v198 = *(void *)v199;
            v200 = *(void (**)(char *, void, uint64_t, int *))(v213 + 56);
            swift_bridgeObjectRetain();
            v200(v216, 0, 1, v168);
          }
          break;
        case 0xDu:
          uint64_t v84 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v84 - 8) + 16))(a1, a2, v84);
          uint64_t v85 = *(int *)(type metadata accessor for MobileAssetDownloadRequest(0) + 20);
          uint64_t v86 = (char *)a1 + v85;
          uint64_t v87 = (char *)a2 + v85;
          *(void *)uint64_t v86 = *(void *)v87;
          v86[8] = v87[8];
          break;
        case 0xEu:
          *a1 = *a2;
          v88 = (int *)type metadata accessor for ShadowEvaluationRequest(0);
          uint64_t v89 = v88[5];
          __dstb = (char *)a2 + v89;
          v225 = (char *)a1 + v89;
          uint64_t v90 = sub_2372A4780();
          uint64_t v91 = *(void (**)(char *, char *, uint64_t))(*(void *)(v90 - 8) + 16);
          swift_bridgeObjectRetain();
          v91(v225, __dstb, v90);
          uint64_t v92 = v88[6];
          v93 = (char *)a1 + v92;
          char v94 = (char *)a2 + v92;
          *(void *)v93 = *(void *)v94;
          v93[8] = v94[8];
          uint64_t v95 = v88[7];
          uint64_t v96 = (char *)a1 + v95;
          v97 = (char *)a2 + v95;
          *(void *)uint64_t v96 = *(void *)v97;
          v96[8] = v97[8];
          uint64_t v98 = v88[8];
          uint64_t v99 = (char *)a1 + v98;
          int v100 = (char *)a2 + v98;
          *(void *)uint64_t v99 = *(void *)v100;
          v99[8] = v100[8];
          *((unsigned char *)a1 + v88[9]) = *((unsigned char *)a2 + v88[9]);
          uint64_t v101 = v88[10];
          char v102 = (char *)a1 + v101;
          uint64_t v103 = (char *)a2 + v101;
          *(void *)char v102 = *(void *)v103;
          v102[8] = v103[8];
          *((unsigned char *)a1 + v88[11]) = *((unsigned char *)a2 + v88[11]);
          break;
        case 0x10u:
          uint64_t v105 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v105 - 8) + 16))(a1, a2, v105);
          uint64_t v106 = *(int *)(type metadata accessor for DeleteDaemonStateRequest(0) + 20);
          uint64_t v107 = (char *)a1 + v106;
          uint64_t v108 = (char *)a2 + v106;
          *(void *)uint64_t v107 = *(void *)v108;
          *((_WORD *)v107 + 4) = *((_WORD *)v108 + 4);
          break;
        default:
          uint64_t v11 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
          uint64_t v12 = *(int *)(type metadata accessor for PingRequest(0) + 20);
          uint64_t v13 = (uint64_t *)((char *)a1 + v12);
          uint64_t v14 = (uint64_t *)((char *)a2 + v12);
          uint64_t v15 = v14[1];
          *uint64_t v13 = *v14;
          v13[1] = v15;
          swift_bridgeObjectRetain();
          break;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v201 = *(int *)(a3 + 20);
    v202 = (char *)a1 + v201;
    v203 = (char *)a2 + v201;
    uint64_t v204 = sub_2372A4780();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v204 - 8) + 16))(v202, v203, v204);
  }
  return a1;
}

uint64_t destroy for SubscriptionClientRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SubscriptionClientRequest.OneOf_Type(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v6 = sub_2372A4780();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
        type metadata accessor for PingRequest(0);
        goto LABEL_12;
      case 1u:
        uint64_t v7 = sub_2372A4780();
        uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
        v8(a1, v7);
        uint64_t v9 = type metadata accessor for NewOfferRequest(0);
        uint64_t v10 = a1 + *(int *)(v9 + 24);
        uint64_t v11 = type metadata accessor for LitmusInfo(0);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11)) {
          v8(v10, v7);
        }
        uint64_t v12 = a1 + *(int *)(v9 + 32);
        uint64_t v13 = type metadata accessor for QuotaServerState(0);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v12, 1, v13)) {
          break;
        }
        v8(v12, v7);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_12;
      case 2u:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v14 = *(int *)(type metadata accessor for FeaturesRequest(0) + 24);
        goto LABEL_23;
      case 3u:
      case 4u:
      case 5u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xCu:
      case 0xDu:
      case 0xFu:
      case 0x10u:
        uint64_t v5 = sub_2372A4780();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
        break;
      case 6u:
        uint64_t v15 = sub_2372A4780();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a1, v15);
        type metadata accessor for SetCliActivityRequest(0);
        goto LABEL_12;
      case 7u:
        uint64_t v16 = sub_2372A4780();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
        type metadata accessor for DisplayDelayedOfferRequest(0);
        goto LABEL_12;
      case 0xBu:
        uint64_t v21 = sub_2372A4780();
        uint64_t v22 = *(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8);
        v22(a1, v21);
        uint64_t v23 = a1 + *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
        uint64_t v24 = type metadata accessor for NotificationState(0);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48))(v23, 1, v24)) {
          break;
        }
        v22(v23, v21);
        uint64_t v25 = v23 + *(int *)(v24 + 24);
        uint64_t v26 = type metadata accessor for LitmusInfo(0);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 48))(v25, 1, v26)) {
          v22(v25, v21);
        }
        uint64_t v27 = v23 + *(int *)(v24 + 36);
        uint64_t v28 = type metadata accessor for QuotaServerState(0);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 48))(v27, 1, v28))
        {
          v22(v27, v21);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
LABEL_12:
        swift_bridgeObjectRelease();
        break;
      case 0xEu:
        swift_bridgeObjectRelease();
        uint64_t v14 = *(int *)(type metadata accessor for ShadowEvaluationRequest(0) + 20);
LABEL_23:
        uint64_t v29 = a1 + v14;
        uint64_t v30 = sub_2372A4780();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v30 - 8) + 8))(v29, v30);
        break;
      default:
        break;
    }
  }
  uint64_t v17 = a1 + *(int *)(a2 + 20);
  uint64_t v18 = sub_2372A4780();
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8);
  return v19(v17, v18);
}

void *initializeWithCopy for SubscriptionClientRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubscriptionClientRequest.OneOf_Type(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECC870);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v14 = sub_2372A4780();
        uint64_t v15 = (void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
        uint64_t v212 = *v15;
        (*v15)((char *)a1, (char *)a2, v14);
        uint64_t v16 = type metadata accessor for NewOfferRequest(0);
        uint64_t v17 = *(int *)(v16 + 20);
        uint64_t v18 = (char *)a1 + v17;
        uint64_t v19 = (char *)a2 + v17;
        *(void *)uint64_t v18 = *(void *)v19;
        v18[8] = v19[8];
        uint64_t v20 = *(int *)(v16 + 24);
        __dst = (char *)a1 + v20;
        uint64_t v220 = v16;
        uint64_t v21 = (char *)a2 + v20;
        uint64_t v22 = (int *)type metadata accessor for LitmusInfo(0);
        uint64_t v23 = *((void *)v22 - 1);
        uint64_t v210 = v14;
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v23 + 48))(v21, 1, v22))
        {
          uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
          memcpy(__dst, v21, *(void *)(*(void *)(v24 - 8) + 64));
        }
        else
        {
          v212(__dst, v21, v14);
          uint64_t v107 = v22[5];
          uint64_t v108 = &__dst[v107];
          uint64_t v109 = &v21[v107];
          *(_DWORD *)uint64_t v108 = *(_DWORD *)v109;
          v108[4] = v109[4];
          uint64_t v110 = v22[6];
          uint64_t v111 = &__dst[v110];
          uint64_t v112 = &v21[v110];
          *(_DWORD *)uint64_t v111 = *(_DWORD *)v112;
          v111[4] = v112[4];
          uint64_t v113 = v22[7];
          char v114 = &__dst[v113];
          uint64_t v115 = &v21[v113];
          *(_DWORD *)char v114 = *(_DWORD *)v115;
          v114[4] = v115[4];
          uint64_t v116 = v22[8];
          uint64_t v117 = &__dst[v116];
          uint64_t v118 = &v21[v116];
          *(void *)uint64_t v117 = *(void *)v118;
          *((_WORD *)v117 + 4) = *((_WORD *)v118 + 4);
          (*(void (**)(char *, void, uint64_t, int *))(v23 + 56))(__dst, 0, 1, v22);
        }
        uint64_t v119 = *(int *)(v220 + 28);
        uint64_t v120 = (char *)a1 + v119;
        uint64_t v121 = (char *)a2 + v119;
        *(void *)uint64_t v120 = *(void *)v121;
        v120[8] = v121[8];
        uint64_t v122 = *(int *)(v220 + 32);
        uint64_t v123 = (char *)a1 + v122;
        uint64_t v124 = (char *)a2 + v122;
        v125 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v126 = *((void *)v125 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v126 + 48))(v124, 1, v125))
        {
          uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v123, v124, *(void *)(*(void *)(v127 - 8) + 64));
        }
        else
        {
          v212(v123, v124, v210);
          uint64_t v137 = v125[5];
          uint64_t v138 = &v123[v137];
          uint64_t v139 = &v124[v137];
          uint64_t v140 = *((void *)v139 + 1);
          *(void *)uint64_t v138 = *(void *)v139;
          *((void *)v138 + 1) = v140;
          uint64_t v141 = v125[6];
          uint64_t v142 = &v123[v141];
          uint64_t v143 = &v124[v141];
          __dstc = (void *)*((void *)v143 + 1);
          *(void *)uint64_t v142 = *(void *)v143;
          *((void *)v142 + 1) = __dstc;
          uint64_t v144 = v125[7];
          v145 = &v123[v144];
          uint64_t v146 = &v124[v144];
          uint64_t v147 = *((void *)v146 + 1);
          *(void *)v145 = *(void *)v146;
          *((void *)v145 + 1) = v147;
          uint64_t v148 = v125[8];
          uint64_t v149 = &v123[v148];
          uint64_t v150 = &v124[v148];
          uint64_t v151 = *((void *)v150 + 1);
          *(void *)uint64_t v149 = *(void *)v150;
          *((void *)v149 + 1) = v151;
          v152 = *(void (**)(char *, void, uint64_t, int *))(v126 + 56);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v152(v123, 0, 1, v125);
        }
        break;
      case 2u:
        uint64_t v25 = a2[1];
        *a1 = *a2;
        a1[1] = v25;
        uint64_t v26 = type metadata accessor for FeaturesRequest(0);
        uint64_t v27 = *(int *)(v26 + 24);
        __dsta = (char *)a2 + v27;
        v221 = (char *)a1 + v27;
        uint64_t v28 = sub_2372A4780();
        uint64_t v213 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v213(v221, __dsta, v28);
        uint64_t v29 = *(int *)(v26 + 28);
        uint64_t v30 = (char *)a1 + v29;
        uint64_t v31 = (char *)a2 + v29;
        *(void *)uint64_t v30 = *(void *)v31;
        v30[8] = v31[8];
        break;
      case 3u:
      case 5u:
      case 8u:
      case 0xCu:
      case 0xFu:
        uint64_t v102 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v102 - 8) + 16))(a1, a2, v102);
        break;
      case 4u:
        uint64_t v32 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v32 - 8) + 16))(a1, a2, v32);
        uint64_t v33 = (int *)type metadata accessor for DataRequest(0);
        uint64_t v34 = v33[5];
        uint64_t v35 = (char *)a1 + v34;
        uint64_t v36 = (char *)a2 + v34;
        *(void *)uint64_t v35 = *(void *)v36;
        v35[8] = v36[8];
        uint64_t v37 = v33[6];
        uint64_t v38 = (char *)a1 + v37;
        uint64_t v39 = (char *)a2 + v37;
        *(void *)uint64_t v38 = *(void *)v39;
        v38[8] = v39[8];
        uint64_t v40 = v33[7];
        uint64_t v41 = (char *)a1 + v40;
        uint64_t v42 = (char *)a2 + v40;
        v41[8] = v42[8];
        *(void *)uint64_t v41 = *(void *)v42;
        *((unsigned char *)a1 + v33[8]) = *((unsigned char *)a2 + v33[8]);
        uint64_t v43 = v33[9];
        uint64_t v44 = (char *)a1 + v43;
        uint64_t v45 = (char *)a2 + v43;
        *(void *)uint64_t v44 = *(void *)v45;
        v44[8] = v45[8];
        *((unsigned char *)a1 + v33[10]) = *((unsigned char *)a2 + v33[10]);
        *((unsigned char *)a1 + v33[11]) = *((unsigned char *)a2 + v33[11]);
        break;
      case 6u:
        uint64_t v46 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v46 - 8) + 16))(a1, a2, v46);
        uint64_t v47 = type metadata accessor for SetCliActivityRequest(0);
        uint64_t v48 = *(int *)(v47 + 20);
        uint64_t v49 = (char *)a1 + v48;
        uint64_t v50 = (char *)a2 + v48;
        *(void *)uint64_t v49 = *(void *)v50;
        v49[8] = v50[8];
        uint64_t v51 = *(int *)(v47 + 24);
        uint64_t v52 = (void *)((char *)a1 + v51);
        uint64_t v53 = (void *)((char *)a2 + v51);
        uint64_t v54 = v53[1];
        void *v52 = *v53;
        v52[1] = v54;
        swift_bridgeObjectRetain();
        break;
      case 7u:
        uint64_t v55 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v55 - 8) + 16))(a1, a2, v55);
        uint64_t v56 = type metadata accessor for DisplayDelayedOfferRequest(0);
        uint64_t v57 = *(int *)(v56 + 20);
        uint64_t v58 = (void *)((char *)a1 + v57);
        uint64_t v59 = (void *)((char *)a2 + v57);
        uint64_t v61 = *v59;
        uint64_t v60 = v59[1];
        *uint64_t v58 = v61;
        v58[1] = v60;
        *((unsigned char *)a1 + *(int *)(v56 + 24)) = *((unsigned char *)a2 + *(int *)(v56 + 24));
        swift_bridgeObjectRetain();
        break;
      case 9u:
        uint64_t v62 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v62 - 8) + 16))(a1, a2, v62);
        uint64_t v63 = (int *)type metadata accessor for ActivityClearRequest(0);
        *((unsigned char *)a1 + v63[5]) = *((unsigned char *)a2 + v63[5]);
        *((unsigned char *)a1 + v63[6]) = *((unsigned char *)a2 + v63[6]);
        *((unsigned char *)a1 + v63[7]) = *((unsigned char *)a2 + v63[7]);
        break;
      case 0xAu:
        uint64_t v64 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v64 - 8) + 16))(a1, a2, v64);
        BiomeStreamRequest = (int *)type metadata accessor for GetBiomeStreamRequest(0);
        uint64_t v66 = BiomeStreamRequest[5];
        uint64_t v67 = (char *)a1 + v66;
        uint64_t v68 = (char *)a2 + v66;
        *(void *)uint64_t v67 = *(void *)v68;
        v67[8] = v68[8];
        uint64_t v69 = BiomeStreamRequest[6];
        uint64_t v70 = (char *)a1 + v69;
        uint64_t v71 = (char *)a2 + v69;
        *(void *)uint64_t v70 = *(void *)v71;
        v70[8] = v71[8];
        uint64_t v72 = BiomeStreamRequest[7];
        uint64_t v73 = (char *)a1 + v72;
        uint64_t v74 = (char *)a2 + v72;
        *(void *)uint64_t v73 = *(void *)v74;
        *((_WORD *)v73 + 4) = *((_WORD *)v74 + 4);
        break;
      case 0xBu:
        uint64_t v75 = sub_2372A4780();
        uint64_t v222 = *(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 16);
        v222((char *)a1, (char *)a2, v75);
        uint64_t v76 = *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
        uint64_t v77 = (char *)a1 + v76;
        uint64_t v78 = (char *)a2 + v76;
        uint64_t v79 = type metadata accessor for NotificationState(0);
        uint64_t v80 = *(void *)(v79 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v80 + 48))(v78, 1, v79))
        {
          uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
          memcpy(v77, v78, *(void *)(*(void *)(v81 - 8) + 64));
        }
        else
        {
          uint64_t v211 = v80;
          v222(v77, v78, v75);
          uint64_t v128 = *(int *)(v79 + 20);
          uint64_t v129 = &v77[v128];
          uint64_t v130 = &v78[v128];
          *(void *)uint64_t v129 = *(void *)v130;
          v129[8] = v130[8];
          uint64_t v206 = (int *)v79;
          v208 = v78;
          uint64_t v131 = *(int *)(v79 + 24);
          v214 = v77;
          uint64_t v132 = &v77[v131];
          uint64_t v133 = &v78[v131];
          v134 = (int *)type metadata accessor for LitmusInfo(0);
          uint64_t v135 = *((void *)v134 - 1);
          uint64_t v204 = v75;
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v135 + 48))(v133, 1, v134))
          {
            uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
            memcpy(v132, v133, *(void *)(*(void *)(v136 - 8) + 64));
          }
          else
          {
            v222(v132, v133, v75);
            uint64_t v153 = v134[5];
            v154 = &v132[v153];
            uint64_t v155 = &v133[v153];
            *(_DWORD *)v154 = *(_DWORD *)v155;
            v154[4] = v155[4];
            uint64_t v156 = v134[6];
            v157 = &v132[v156];
            uint64_t v158 = &v133[v156];
            *(_DWORD *)v157 = *(_DWORD *)v158;
            v157[4] = v158[4];
            uint64_t v159 = v134[7];
            v160 = &v132[v159];
            uint64_t v161 = &v133[v159];
            *(_DWORD *)v160 = *(_DWORD *)v161;
            v160[4] = v161[4];
            uint64_t v162 = v134[8];
            v163 = &v132[v162];
            uint64_t v164 = &v133[v162];
            *(void *)v163 = *(void *)v164;
            *((_WORD *)v163 + 4) = *((_WORD *)v164 + 4);
            (*(void (**)(char *, void, uint64_t, int *))(v135 + 56))(v132, 0, 1, v134);
          }
          v166 = v206;
          uint64_t v165 = v208;
          uint64_t v167 = v206[7];
          uint64_t v168 = &v214[v167];
          uint64_t v169 = &v208[v167];
          *(void *)uint64_t v168 = *(void *)v169;
          v168[8] = v169[8];
          uint64_t v170 = v206[8];
          uint64_t v171 = &v214[v170];
          uint64_t v172 = &v208[v170];
          v171[8] = v172[8];
          *(void *)uint64_t v171 = *(void *)v172;
          uint64_t v173 = v206[9];
          uint64_t v174 = &v214[v173];
          uint64_t v175 = &v208[v173];
          uint64_t v176 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v209 = *((void *)v176 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v209 + 48))(v175, 1, v176))
          {
            uint64_t v177 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v174, v175, *(void *)(*(void *)(v177 - 8) + 64));
          }
          else
          {
            v222(v174, v175, v204);
            uint64_t v178 = v176[5];
            uint64_t v179 = &v174[v178];
            uint64_t v180 = &v175[v178];
            uint64_t v181 = *((void *)v180 + 1);
            *(void *)uint64_t v179 = *(void *)v180;
            *((void *)v179 + 1) = v181;
            uint64_t v182 = v176[6];
            uint64_t v183 = &v174[v182];
            uint64_t v184 = &v175[v182];
            __dstd = (void *)*((void *)v184 + 1);
            *(void *)uint64_t v183 = *(void *)v184;
            *((void *)v183 + 1) = __dstd;
            uint64_t v185 = v176[7];
            v186 = &v174[v185];
            uint64_t v187 = &v175[v185];
            uint64_t v207 = *((void *)v187 + 1);
            *(void *)v186 = *(void *)v187;
            *((void *)v186 + 1) = v207;
            uint64_t v188 = v176[8];
            v189 = &v174[v188];
            uint64_t v190 = &v175[v188];
            uint64_t v205 = *((void *)v190 + 1);
            *(void *)v189 = *(void *)v190;
            *((void *)v189 + 1) = v205;
            v224 = *(void (**)(char *, void, uint64_t, int *))(v209 + 56);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v224(v174, 0, 1, v176);
          }
          uint64_t v191 = v166[10];
          v192 = &v214[v191];
          uint64_t v193 = &v165[v191];
          uint64_t v194 = *((void *)v193 + 1);
          *(void *)v192 = *(void *)v193;
          *((void *)v192 + 1) = v194;
          uint64_t v195 = v166[11];
          uint64_t v196 = &v214[v195];
          uint64_t v197 = &v165[v195];
          v196[8] = v197[8];
          *(void *)uint64_t v196 = *(void *)v197;
          v198 = *(void (**)(char *, void, uint64_t, int *))(v211 + 56);
          swift_bridgeObjectRetain();
          v198(v214, 0, 1, v166);
        }
        break;
      case 0xDu:
        uint64_t v82 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v82 - 8) + 16))(a1, a2, v82);
        uint64_t v83 = *(int *)(type metadata accessor for MobileAssetDownloadRequest(0) + 20);
        uint64_t v84 = (char *)a1 + v83;
        uint64_t v85 = (char *)a2 + v83;
        *(void *)uint64_t v84 = *(void *)v85;
        v84[8] = v85[8];
        break;
      case 0xEu:
        *a1 = *a2;
        uint64_t v86 = (int *)type metadata accessor for ShadowEvaluationRequest(0);
        uint64_t v87 = v86[5];
        __dstb = (char *)a2 + v87;
        v223 = (char *)a1 + v87;
        uint64_t v88 = sub_2372A4780();
        uint64_t v89 = *(void (**)(char *, char *, uint64_t))(*(void *)(v88 - 8) + 16);
        swift_bridgeObjectRetain();
        v89(v223, __dstb, v88);
        uint64_t v90 = v86[6];
        uint64_t v91 = (char *)a1 + v90;
        uint64_t v92 = (char *)a2 + v90;
        *(void *)uint64_t v91 = *(void *)v92;
        v91[8] = v92[8];
        uint64_t v93 = v86[7];
        char v94 = (char *)a1 + v93;
        uint64_t v95 = (char *)a2 + v93;
        *(void *)char v94 = *(void *)v95;
        v94[8] = v95[8];
        uint64_t v96 = v86[8];
        v97 = (char *)a1 + v96;
        uint64_t v98 = (char *)a2 + v96;
        *(void *)v97 = *(void *)v98;
        v97[8] = v98[8];
        *((unsigned char *)a1 + v86[9]) = *((unsigned char *)a2 + v86[9]);
        uint64_t v99 = v86[10];
        int v100 = (char *)a1 + v99;
        uint64_t v101 = (char *)a2 + v99;
        *(void *)int v100 = *(void *)v101;
        v100[8] = v101[8];
        *((unsigned char *)a1 + v86[11]) = *((unsigned char *)a2 + v86[11]);
        break;
      case 0x10u:
        uint64_t v103 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v103 - 8) + 16))(a1, a2, v103);
        uint64_t v104 = *(int *)(type metadata accessor for DeleteDaemonStateRequest(0) + 20);
        uint64_t v105 = (char *)a1 + v104;
        uint64_t v106 = (char *)a2 + v104;
        *(void *)uint64_t v105 = *(void *)v106;
        *((_WORD *)v105 + 4) = *((_WORD *)v106 + 4);
        break;
      default:
        uint64_t v9 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        uint64_t v10 = *(int *)(type metadata accessor for PingRequest(0) + 20);
        uint64_t v11 = (void *)((char *)a1 + v10);
        uint64_t v12 = (void *)((char *)a2 + v10);
        uint64_t v13 = v12[1];
        *uint64_t v11 = *v12;
        v11[1] = v13;
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v199 = *(int *)(a3 + 20);
  v200 = (char *)a1 + v199;
  uint64_t v201 = (char *)a2 + v199;
  uint64_t v202 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v202 - 8) + 16))(v200, v201, v202);
  return a1;
}

char *assignWithCopy for SubscriptionClientRequest(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubscriptionClientRequest.OneOf_Type(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v20 = sub_2372A4780();
          uint64_t v21 = (void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
          v440 = *v21;
          (*v21)(a1, a2, v20);
          uint64_t v22 = type metadata accessor for NewOfferRequest(0);
          uint64_t v23 = *(int *)(v22 + 20);
          uint64_t v24 = &a1[v23];
          uint64_t v25 = &a2[v23];
          char v26 = v25[8];
          *(void *)uint64_t v24 = *(void *)v25;
          v24[8] = v26;
          uint64_t v27 = *(int *)(v22 + 24);
          __dst = &a1[v27];
          uint64_t v450 = v22;
          uint64_t v28 = &a2[v27];
          uint64_t v29 = (int *)type metadata accessor for LitmusInfo(0);
          uint64_t v30 = *((void *)v29 - 1);
          uint64_t v436 = v20;
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v30 + 48))(v28, 1, v29))
          {
            uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
            memcpy(__dst, v28, *(void *)(*(void *)(v31 - 8) + 64));
          }
          else
          {
            v440(__dst, v28, v20);
            uint64_t v229 = v29[5];
            v230 = &__dst[v229];
            v231 = &v28[v229];
            char v232 = v231[4];
            *(_DWORD *)v230 = *(_DWORD *)v231;
            v230[4] = v232;
            uint64_t v233 = v29[6];
            v234 = &__dst[v233];
            v235 = &v28[v233];
            char v236 = v235[4];
            *(_DWORD *)v234 = *(_DWORD *)v235;
            v234[4] = v236;
            uint64_t v237 = v29[7];
            v238 = &__dst[v237];
            v239 = &v28[v237];
            char v240 = v239[4];
            *(_DWORD *)v238 = *(_DWORD *)v239;
            v238[4] = v240;
            uint64_t v241 = v29[8];
            v242 = &__dst[v241];
            v243 = &v28[v241];
            __int16 v244 = *((_WORD *)v243 + 4);
            *(void *)v242 = *(void *)v243;
            *((_WORD *)v242 + 4) = v244;
            (*(void (**)(char *, void, uint64_t, int *))(v30 + 56))(__dst, 0, 1, v29);
          }
          uint64_t v245 = *(int *)(v450 + 28);
          v246 = &a1[v245];
          v247 = &a2[v245];
          uint64_t v248 = *(void *)v247;
          v246[8] = v247[8];
          *(void *)v246 = v248;
          uint64_t v249 = *(int *)(v450 + 32);
          v250 = &a1[v249];
          v251 = &a2[v249];
          v252 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v253 = *((void *)v252 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v253 + 48))(v251, 1, v252))
          {
            uint64_t v254 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v250, v251, *(void *)(*(void *)(v254 - 8) + 64));
          }
          else
          {
            v440(v250, v251, v436);
            uint64_t v265 = v252[5];
            v266 = &v250[v265];
            v267 = &v251[v265];
            *(void *)v266 = *(void *)v267;
            *((void *)v266 + 1) = *((void *)v267 + 1);
            uint64_t v268 = v252[6];
            v269 = &v250[v268];
            v270 = &v251[v268];
            *(void *)v269 = *(void *)v270;
            *((void *)v269 + 1) = *((void *)v270 + 1);
            uint64_t v271 = v252[7];
            v272 = &v250[v271];
            v273 = &v251[v271];
            *(void *)v272 = *(void *)v273;
            *((void *)v272 + 1) = *((void *)v273 + 1);
            uint64_t v274 = v252[8];
            v275 = &v250[v274];
            v276 = &v251[v274];
            *(void *)v275 = *(void *)v276;
            *((void *)v275 + 1) = *((void *)v276 + 1);
            v277 = *(void (**)(char *, void, uint64_t, int *))(v253 + 56);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v277(v250, 0, 1, v252);
          }
          break;
        case 2u:
          *(void *)a1 = *(void *)a2;
          *((void *)a1 + 1) = *((void *)a2 + 1);
          uint64_t v32 = type metadata accessor for FeaturesRequest(0);
          uint64_t v33 = *(int *)(v32 + 24);
          __dstc = &a2[v33];
          v451 = &a1[v33];
          uint64_t v34 = sub_2372A4780();
          v441 = *(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v441(v451, __dstc, v34);
          uint64_t v35 = *(int *)(v32 + 28);
          uint64_t v36 = &a1[v35];
          uint64_t v37 = &a2[v35];
          char v38 = v37[8];
          *(void *)uint64_t v36 = *(void *)v37;
          v36[8] = v38;
          break;
        case 3u:
        case 5u:
        case 8u:
        case 0xCu:
        case 0xFu:
          uint64_t v117 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v117 - 8) + 16))(a1, a2, v117);
          break;
        case 4u:
          uint64_t v39 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(a1, a2, v39);
          uint64_t v40 = (int *)type metadata accessor for DataRequest(0);
          uint64_t v41 = v40[5];
          uint64_t v42 = &a1[v41];
          uint64_t v43 = &a2[v41];
          char v44 = v43[8];
          *(void *)uint64_t v42 = *(void *)v43;
          v42[8] = v44;
          uint64_t v45 = v40[6];
          uint64_t v46 = &a1[v45];
          uint64_t v47 = &a2[v45];
          char v48 = v47[8];
          *(void *)uint64_t v46 = *(void *)v47;
          v46[8] = v48;
          uint64_t v49 = v40[7];
          uint64_t v50 = &a1[v49];
          uint64_t v51 = &a2[v49];
          char v52 = v51[8];
          *(void *)uint64_t v50 = *(void *)v51;
          v50[8] = v52;
          a1[v40[8]] = a2[v40[8]];
          uint64_t v53 = v40[9];
          uint64_t v54 = &a1[v53];
          uint64_t v55 = &a2[v53];
          char v56 = v55[8];
          *(void *)uint64_t v54 = *(void *)v55;
          v54[8] = v56;
          a1[v40[10]] = a2[v40[10]];
          a1[v40[11]] = a2[v40[11]];
          break;
        case 6u:
          uint64_t v57 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16))(a1, a2, v57);
          uint64_t v58 = type metadata accessor for SetCliActivityRequest(0);
          uint64_t v59 = *(int *)(v58 + 20);
          uint64_t v60 = &a1[v59];
          uint64_t v61 = &a2[v59];
          char v62 = v61[8];
          *(void *)uint64_t v60 = *(void *)v61;
          v60[8] = v62;
          uint64_t v63 = *(int *)(v58 + 24);
          uint64_t v64 = &a1[v63];
          uint64_t v65 = &a2[v63];
          *(void *)uint64_t v64 = *(void *)v65;
          *((void *)v64 + 1) = *((void *)v65 + 1);
          swift_bridgeObjectRetain();
          break;
        case 7u:
          uint64_t v66 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 16))(a1, a2, v66);
          uint64_t v67 = type metadata accessor for DisplayDelayedOfferRequest(0);
          uint64_t v68 = *(int *)(v67 + 20);
          uint64_t v69 = &a1[v68];
          uint64_t v70 = &a2[v68];
          *(void *)uint64_t v69 = *(void *)v70;
          *((void *)v69 + 1) = *((void *)v70 + 1);
          a1[*(int *)(v67 + 24)] = a2[*(int *)(v67 + 24)];
          swift_bridgeObjectRetain();
          break;
        case 9u:
          uint64_t v71 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 16))(a1, a2, v71);
          uint64_t v72 = (int *)type metadata accessor for ActivityClearRequest(0);
          a1[v72[5]] = a2[v72[5]];
          a1[v72[6]] = a2[v72[6]];
          a1[v72[7]] = a2[v72[7]];
          break;
        case 0xAu:
          uint64_t v73 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 16))(a1, a2, v73);
          BiomeStreamRequest = (int *)type metadata accessor for GetBiomeStreamRequest(0);
          uint64_t v75 = BiomeStreamRequest[5];
          uint64_t v76 = &a1[v75];
          uint64_t v77 = &a2[v75];
          char v78 = v77[8];
          *(void *)uint64_t v76 = *(void *)v77;
          v76[8] = v78;
          uint64_t v79 = BiomeStreamRequest[6];
          uint64_t v80 = &a1[v79];
          uint64_t v81 = &a2[v79];
          char v82 = v81[8];
          *(void *)uint64_t v80 = *(void *)v81;
          v80[8] = v82;
          uint64_t v83 = BiomeStreamRequest[7];
          uint64_t v84 = &a1[v83];
          uint64_t v85 = &a2[v83];
          __int16 v86 = *((_WORD *)v85 + 4);
          *(void *)uint64_t v84 = *(void *)v85;
          *((_WORD *)v84 + 4) = v86;
          break;
        case 0xBu:
          uint64_t v87 = sub_2372A4780();
          v452 = *(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 16);
          v452(a1, a2, v87);
          uint64_t v88 = *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
          uint64_t v89 = &a1[v88];
          uint64_t v90 = &a2[v88];
          uint64_t v91 = type metadata accessor for NotificationState(0);
          uint64_t v92 = *(void *)(v91 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v92 + 48))(v90, 1, v91))
          {
            uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
            memcpy(v89, v90, *(void *)(*(void *)(v93 - 8) + 64));
          }
          else
          {
            uint64_t v438 = v92;
            v452(v89, v90, v87);
            uint64_t v255 = *(int *)(v91 + 20);
            v256 = &v89[v255];
            v257 = &v90[v255];
            char v258 = v257[8];
            *(void *)v256 = *(void *)v257;
            v256[8] = v258;
            v433 = (int *)v91;
            v434 = v90;
            uint64_t v259 = *(int *)(v91 + 24);
            v442 = v89;
            v260 = &v89[v259];
            v261 = &v90[v259];
            v262 = (int *)type metadata accessor for LitmusInfo(0);
            uint64_t v263 = *((void *)v262 - 1);
            if ((*(unsigned int (**)(char *, uint64_t, int *))(v263 + 48))(v261, 1, v262))
            {
              uint64_t v264 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
              memcpy(v260, v261, *(void *)(*(void *)(v264 - 8) + 64));
            }
            else
            {
              v452(v260, v261, v87);
              uint64_t v314 = v262[5];
              v315 = &v260[v314];
              v316 = &v261[v314];
              char v317 = v316[4];
              *(_DWORD *)v315 = *(_DWORD *)v316;
              v315[4] = v317;
              uint64_t v318 = v262[6];
              v319 = &v260[v318];
              v320 = &v261[v318];
              char v321 = v320[4];
              *(_DWORD *)v319 = *(_DWORD *)v320;
              v319[4] = v321;
              uint64_t v322 = v262[7];
              v323 = &v260[v322];
              v324 = &v261[v322];
              char v325 = v324[4];
              *(_DWORD *)v323 = *(_DWORD *)v324;
              v323[4] = v325;
              uint64_t v326 = v262[8];
              v327 = &v260[v326];
              v328 = &v261[v326];
              __int16 v329 = *((_WORD *)v328 + 4);
              *(void *)v327 = *(void *)v328;
              *((_WORD *)v327 + 4) = v329;
              (*(void (**)(char *, void, uint64_t, int *))(v263 + 56))(v260, 0, 1, v262);
            }
            uint64_t v330 = v433[7];
            v331 = &v442[v330];
            v332 = &v434[v330];
            uint64_t v333 = *(void *)v332;
            v331[8] = v332[8];
            *(void *)v331 = v333;
            uint64_t v334 = v433[8];
            v335 = &v442[v334];
            v336 = &v434[v334];
            uint64_t v337 = *(void *)v336;
            v335[8] = v336[8];
            *(void *)v335 = v337;
            uint64_t v338 = v433[9];
            v339 = &v442[v338];
            v340 = &v434[v338];
            v341 = (int *)type metadata accessor for QuotaServerState(0);
            uint64_t v431 = *((void *)v341 - 1);
            if ((*(unsigned int (**)(char *, uint64_t, int *))(v431 + 48))(v340, 1, v341))
            {
              uint64_t v342 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
              memcpy(v339, v340, *(void *)(*(void *)(v342 - 8) + 64));
            }
            else
            {
              v452(v339, v340, v87);
              uint64_t v356 = v341[5];
              v357 = &v339[v356];
              v358 = &v340[v356];
              *(void *)v357 = *(void *)v358;
              *((void *)v357 + 1) = *((void *)v358 + 1);
              uint64_t v359 = v341[6];
              v360 = &v339[v359];
              v361 = &v340[v359];
              *(void *)v360 = *(void *)v361;
              *((void *)v360 + 1) = *((void *)v361 + 1);
              uint64_t v362 = v341[7];
              v363 = &v339[v362];
              v364 = &v340[v362];
              *(void *)v363 = *(void *)v364;
              *((void *)v363 + 1) = *((void *)v364 + 1);
              uint64_t v365 = v341[8];
              v366 = &v339[v365];
              v367 = &v340[v365];
              *(void *)v366 = *(void *)v367;
              *((void *)v366 + 1) = *((void *)v367 + 1);
              v457 = *(void (**)(char *, void, uint64_t, int *))(v431 + 56);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v457(v339, 0, 1, v341);
            }
            uint64_t v368 = v433[10];
            v369 = &v442[v368];
            v370 = &v434[v368];
            *(void *)v369 = *(void *)v370;
            *((void *)v369 + 1) = *((void *)v370 + 1);
            uint64_t v371 = v433[11];
            v372 = &v442[v371];
            v373 = &v434[v371];
            uint64_t v374 = *(void *)v373;
            v372[8] = v373[8];
            *(void *)v372 = v374;
            v375 = *(void (**)(char *, void, uint64_t, int *))(v438 + 56);
            swift_bridgeObjectRetain();
            v375(v442, 0, 1, v433);
          }
          break;
        case 0xDu:
          uint64_t v94 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v94 - 8) + 16))(a1, a2, v94);
          uint64_t v95 = *(int *)(type metadata accessor for MobileAssetDownloadRequest(0) + 20);
          uint64_t v96 = &a1[v95];
          v97 = &a2[v95];
          char v98 = v97[8];
          *(void *)uint64_t v96 = *(void *)v97;
          v96[8] = v98;
          break;
        case 0xEu:
          *(void *)a1 = *(void *)a2;
          uint64_t v99 = (int *)type metadata accessor for ShadowEvaluationRequest(0);
          uint64_t v100 = v99[5];
          __dstd = &a2[v100];
          v453 = &a1[v100];
          uint64_t v101 = sub_2372A4780();
          uint64_t v102 = *(void (**)(char *, char *, uint64_t))(*(void *)(v101 - 8) + 16);
          swift_bridgeObjectRetain();
          v102(v453, __dstd, v101);
          uint64_t v103 = v99[6];
          uint64_t v104 = &a1[v103];
          uint64_t v105 = &a2[v103];
          uint64_t v106 = *(void *)v105;
          v104[8] = v105[8];
          *(void *)uint64_t v104 = v106;
          uint64_t v107 = v99[7];
          uint64_t v108 = &a1[v107];
          uint64_t v109 = &a2[v107];
          LOBYTE(v106) = v109[8];
          *(void *)uint64_t v108 = *(void *)v109;
          v108[8] = v106;
          uint64_t v110 = v99[8];
          uint64_t v111 = &a1[v110];
          uint64_t v112 = &a2[v110];
          LOBYTE(v106) = v112[8];
          *(void *)uint64_t v111 = *(void *)v112;
          v111[8] = v106;
          a1[v99[9]] = a2[v99[9]];
          uint64_t v113 = v99[10];
          char v114 = &a1[v113];
          uint64_t v115 = &a2[v113];
          uint64_t v116 = *(void *)v115;
          v114[8] = v115[8];
          *(void *)char v114 = v116;
          a1[v99[11]] = a2[v99[11]];
          break;
        case 0x10u:
          uint64_t v118 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v118 - 8) + 16))(a1, a2, v118);
          uint64_t v119 = *(int *)(type metadata accessor for DeleteDaemonStateRequest(0) + 20);
          uint64_t v120 = &a1[v119];
          uint64_t v121 = &a2[v119];
          __int16 v122 = *((_WORD *)v121 + 4);
          *(void *)uint64_t v120 = *(void *)v121;
          *((_WORD *)v120 + 4) = v122;
          break;
        default:
          uint64_t v11 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
          uint64_t v12 = *(int *)(type metadata accessor for PingRequest(0) + 20);
          uint64_t v13 = &a1[v12];
          uint64_t v14 = &a2[v12];
          *(void *)uint64_t v13 = *(void *)v14;
          *((void *)v13 + 1) = *((void *)v14 + 1);
          swift_bridgeObjectRetain();
          break;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_58;
    }
LABEL_7:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECC870);
    memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_58;
  }
  if (v10)
  {
    sub_23723CDC0((uint64_t)a1, type metadata accessor for SubscriptionClientRequest.OneOf_Type);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_23723CDC0((uint64_t)a1, type metadata accessor for SubscriptionClientRequest.OneOf_Type);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v123 = sub_2372A4780();
        uint64_t v124 = *(void (**)(char *, char *, uint64_t))(*(void *)(v123 - 8) + 16);
        v124(a1, a2, v123);
        v125 = (int *)type metadata accessor for NewOfferRequest(0);
        uint64_t v126 = v125[5];
        uint64_t v127 = &a1[v126];
        uint64_t v128 = &a2[v126];
        char v129 = v128[8];
        *(void *)uint64_t v127 = *(void *)v128;
        v127[8] = v129;
        uint64_t v130 = v125[6];
        __dsta = &a1[v130];
        uint64_t v131 = &a2[v130];
        uint64_t v132 = (int *)type metadata accessor for LitmusInfo(0);
        uint64_t v133 = *((void *)v132 - 1);
        uint64_t v437 = v123;
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v133 + 48))(v131, 1, v132))
        {
          uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
          memcpy(__dsta, v131, *(void *)(*(void *)(v134 - 8) + 64));
        }
        else
        {
          v124(__dsta, v131, v123);
          uint64_t v278 = v132[5];
          v279 = &__dsta[v278];
          v280 = &v131[v278];
          char v281 = v280[4];
          *(_DWORD *)v279 = *(_DWORD *)v280;
          v279[4] = v281;
          uint64_t v282 = v132[6];
          v283 = &__dsta[v282];
          v284 = &v131[v282];
          char v285 = v284[4];
          *(_DWORD *)v283 = *(_DWORD *)v284;
          v283[4] = v285;
          uint64_t v286 = v132[7];
          v287 = &__dsta[v286];
          v288 = &v131[v286];
          char v289 = v288[4];
          *(_DWORD *)v287 = *(_DWORD *)v288;
          v287[4] = v289;
          uint64_t v290 = v132[8];
          v291 = &__dsta[v290];
          v292 = &v131[v290];
          __int16 v293 = *((_WORD *)v292 + 4);
          *(void *)v291 = *(void *)v292;
          *((_WORD *)v291 + 4) = v293;
          (*(void (**)(char *, void, uint64_t, int *))(v133 + 56))(__dsta, 0, 1, v132);
        }
        uint64_t v294 = v125[7];
        v295 = &a1[v294];
        v296 = &a2[v294];
        uint64_t v297 = *(void *)v296;
        v295[8] = v296[8];
        *(void *)v295 = v297;
        uint64_t v298 = v125[8];
        v299 = &a1[v298];
        v300 = &a2[v298];
        v301 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v302 = *((void *)v301 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v302 + 48))(v300, 1, v301))
        {
          uint64_t v303 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v299, v300, *(void *)(*(void *)(v303 - 8) + 64));
        }
        else
        {
          v124(v299, v300, v437);
          uint64_t v343 = v301[5];
          v344 = &v299[v343];
          v345 = &v300[v343];
          *(void *)v344 = *(void *)v345;
          *((void *)v344 + 1) = *((void *)v345 + 1);
          uint64_t v346 = v301[6];
          v347 = &v299[v346];
          v348 = &v300[v346];
          *(void *)v347 = *(void *)v348;
          *((void *)v347 + 1) = *((void *)v348 + 1);
          uint64_t v349 = v301[7];
          v350 = &v299[v349];
          v351 = &v300[v349];
          *(void *)v350 = *(void *)v351;
          *((void *)v350 + 1) = *((void *)v351 + 1);
          uint64_t v352 = v301[8];
          v353 = &v299[v352];
          v354 = &v300[v352];
          *(void *)v353 = *(void *)v354;
          *((void *)v353 + 1) = *((void *)v354 + 1);
          v355 = *(void (**)(char *, void, uint64_t, int *))(v302 + 56);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v355(v299, 0, 1, v301);
        }
        goto LABEL_54;
      case 2u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        uint64_t v135 = type metadata accessor for FeaturesRequest(0);
        uint64_t v136 = *(int *)(v135 + 24);
        __dste = &a2[v136];
        v454 = &a1[v136];
        uint64_t v137 = sub_2372A4780();
        uint64_t v138 = *(void (**)(char *, char *, uint64_t))(*(void *)(v137 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v138(v454, __dste, v137);
        uint64_t v139 = *(int *)(v135 + 28);
        uint64_t v140 = &a1[v139];
        uint64_t v141 = &a2[v139];
        char v142 = v141[8];
        *(void *)uint64_t v140 = *(void *)v141;
        v140[8] = v142;
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
      case 5u:
      case 8u:
      case 0xCu:
      case 0xFu:
        uint64_t v223 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v223 - 8) + 16))(a1, a2, v223);
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v143 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v143 - 8) + 16))(a1, a2, v143);
        uint64_t v144 = (int *)type metadata accessor for DataRequest(0);
        uint64_t v145 = v144[5];
        uint64_t v146 = &a1[v145];
        uint64_t v147 = &a2[v145];
        char v148 = v147[8];
        *(void *)uint64_t v146 = *(void *)v147;
        v146[8] = v148;
        uint64_t v149 = v144[6];
        uint64_t v150 = &a1[v149];
        uint64_t v151 = &a2[v149];
        char v152 = v151[8];
        *(void *)uint64_t v150 = *(void *)v151;
        v150[8] = v152;
        uint64_t v153 = v144[7];
        v154 = &a1[v153];
        uint64_t v155 = &a2[v153];
        char v156 = v155[8];
        *(void *)v154 = *(void *)v155;
        v154[8] = v156;
        a1[v144[8]] = a2[v144[8]];
        uint64_t v157 = v144[9];
        uint64_t v158 = &a1[v157];
        uint64_t v159 = &a2[v157];
        char v160 = v159[8];
        *(void *)uint64_t v158 = *(void *)v159;
        v158[8] = v160;
        a1[v144[10]] = a2[v144[10]];
        a1[v144[11]] = a2[v144[11]];
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        uint64_t v161 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v161 - 8) + 16))(a1, a2, v161);
        uint64_t v162 = type metadata accessor for SetCliActivityRequest(0);
        uint64_t v163 = *(int *)(v162 + 20);
        uint64_t v164 = &a1[v163];
        uint64_t v165 = &a2[v163];
        char v166 = v165[8];
        *(void *)uint64_t v164 = *(void *)v165;
        v164[8] = v166;
        uint64_t v167 = *(int *)(v162 + 24);
        uint64_t v168 = &a1[v167];
        uint64_t v169 = &a2[v167];
        *(void *)uint64_t v168 = *(void *)v169;
        *((void *)v168 + 1) = *((void *)v169 + 1);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        uint64_t v170 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v170 - 8) + 16))(a1, a2, v170);
        uint64_t v171 = type metadata accessor for DisplayDelayedOfferRequest(0);
        uint64_t v172 = *(int *)(v171 + 20);
        uint64_t v173 = &a1[v172];
        uint64_t v174 = &a2[v172];
        *(void *)uint64_t v173 = *(void *)v174;
        *((void *)v173 + 1) = *((void *)v174 + 1);
        a1[*(int *)(v171 + 24)] = a2[*(int *)(v171 + 24)];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 9u:
        uint64_t v175 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v175 - 8) + 16))(a1, a2, v175);
        uint64_t v176 = (int *)type metadata accessor for ActivityClearRequest(0);
        a1[v176[5]] = a2[v176[5]];
        a1[v176[6]] = a2[v176[6]];
        a1[v176[7]] = a2[v176[7]];
        swift_storeEnumTagMultiPayload();
        break;
      case 0xAu:
        uint64_t v177 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v177 - 8) + 16))(a1, a2, v177);
        uint64_t v178 = (int *)type metadata accessor for GetBiomeStreamRequest(0);
        uint64_t v179 = v178[5];
        uint64_t v180 = &a1[v179];
        uint64_t v181 = &a2[v179];
        char v182 = v181[8];
        *(void *)uint64_t v180 = *(void *)v181;
        v180[8] = v182;
        uint64_t v183 = v178[6];
        uint64_t v184 = &a1[v183];
        uint64_t v185 = &a2[v183];
        char v186 = v185[8];
        *(void *)uint64_t v184 = *(void *)v185;
        v184[8] = v186;
        uint64_t v187 = v178[7];
        uint64_t v188 = &a1[v187];
        v189 = &a2[v187];
        __int16 v190 = *((_WORD *)v189 + 4);
        *(void *)uint64_t v188 = *(void *)v189;
        *((_WORD *)v188 + 4) = v190;
        swift_storeEnumTagMultiPayload();
        break;
      case 0xBu:
        uint64_t v191 = sub_2372A4780();
        v192 = *(void (**)(char *, char *))(*(void *)(v191 - 8) + 16);
        uint64_t v455 = v191;
        v192(a1, a2);
        uint64_t v193 = *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
        uint64_t v194 = &a1[v193];
        uint64_t v195 = &a2[v193];
        uint64_t v196 = type metadata accessor for NotificationState(0);
        uint64_t v197 = *(void *)(v196 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v197 + 48))(v195, 1, v196))
        {
          uint64_t v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
          memcpy(v194, v195, *(void *)(*(void *)(v198 - 8) + 64));
        }
        else
        {
          uint64_t v443 = v197;
          ((void (*)(char *, char *, uint64_t))v192)(v194, v195, v455);
          uint64_t v304 = *(int *)(v196 + 20);
          v305 = &v194[v304];
          v306 = &v195[v304];
          char v307 = v306[8];
          *(void *)v305 = *(void *)v306;
          v305[8] = v307;
          __dstb = (int *)v196;
          uint64_t v308 = *(int *)(v196 + 24);
          v435 = (void (*)(char *, char *, uint64_t))v192;
          v439 = v194;
          v309 = &v194[v308];
          v310 = &v195[v308];
          v311 = (int *)type metadata accessor for LitmusInfo(0);
          uint64_t v312 = *((void *)v311 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v312 + 48))(v310, 1, v311))
          {
            uint64_t v313 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
            memcpy(v309, v310, *(void *)(*(void *)(v313 - 8) + 64));
          }
          else
          {
            v435(v309, v310, v455);
            uint64_t v381 = v311[5];
            v382 = &v309[v381];
            v383 = &v310[v381];
            char v384 = v383[4];
            *(_DWORD *)v382 = *(_DWORD *)v383;
            v382[4] = v384;
            uint64_t v385 = v311[6];
            v386 = &v309[v385];
            v387 = &v310[v385];
            char v388 = v387[4];
            *(_DWORD *)v386 = *(_DWORD *)v387;
            v386[4] = v388;
            uint64_t v389 = v311[7];
            v390 = &v309[v389];
            v391 = &v310[v389];
            char v392 = v391[4];
            *(_DWORD *)v390 = *(_DWORD *)v391;
            v390[4] = v392;
            uint64_t v393 = v311[8];
            v394 = &v309[v393];
            v395 = &v310[v393];
            __int16 v396 = *((_WORD *)v395 + 4);
            *(void *)v394 = *(void *)v395;
            *((_WORD *)v394 + 4) = v396;
            (*(void (**)(char *, void, uint64_t, int *))(v312 + 56))(v309, 0, 1, v311);
          }
          v397 = __dstb;
          uint64_t v398 = __dstb[7];
          v399 = &v439[v398];
          v400 = &v195[v398];
          uint64_t v401 = *(void *)v400;
          v399[8] = v400[8];
          *(void *)v399 = v401;
          uint64_t v402 = __dstb[8];
          v403 = &v439[v402];
          v404 = &v195[v402];
          uint64_t v405 = *(void *)v404;
          v403[8] = v404[8];
          *(void *)v403 = v405;
          uint64_t v406 = __dstb[9];
          v407 = &v439[v406];
          v408 = &v195[v406];
          v409 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v432 = *((void *)v409 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v432 + 48))(v408, 1, v409))
          {
            uint64_t v410 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v407, v408, *(void *)(*(void *)(v410 - 8) + 64));
          }
          else
          {
            v435(v407, v408, v455);
            uint64_t v411 = v409[5];
            v412 = &v407[v411];
            v413 = &v408[v411];
            *(void *)v412 = *(void *)v413;
            *((void *)v412 + 1) = *((void *)v413 + 1);
            uint64_t v414 = v409[6];
            v415 = &v407[v414];
            v416 = &v408[v414];
            *(void *)v415 = *(void *)v416;
            *((void *)v415 + 1) = *((void *)v416 + 1);
            uint64_t v417 = v409[7];
            v418 = &v407[v417];
            v419 = &v408[v417];
            *(void *)v418 = *(void *)v419;
            *((void *)v418 + 1) = *((void *)v419 + 1);
            uint64_t v420 = v409[8];
            v421 = &v407[v420];
            v422 = &v408[v420];
            *(void *)v421 = *(void *)v422;
            *((void *)v421 + 1) = *((void *)v422 + 1);
            v458 = *(void (**)(char *, void, uint64_t, int *))(v432 + 56);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v397 = __dstb;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v458(v407, 0, 1, v409);
          }
          uint64_t v423 = v397[10];
          v424 = &v439[v423];
          v425 = &v195[v423];
          *(void *)v424 = *(void *)v425;
          *((void *)v424 + 1) = *((void *)v425 + 1);
          uint64_t v426 = v397[11];
          v427 = &v439[v426];
          v428 = &v195[v426];
          uint64_t v429 = *(void *)v428;
          v427[8] = v428[8];
          *(void *)v427 = v429;
          v430 = *(void (**)(char *, void, uint64_t, int *))(v443 + 56);
          swift_bridgeObjectRetain();
          v430(v439, 0, 1, v397);
        }
LABEL_54:
        swift_storeEnumTagMultiPayload();
        break;
      case 0xDu:
        uint64_t v199 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v199 - 8) + 16))(a1, a2, v199);
        uint64_t v200 = *(int *)(type metadata accessor for MobileAssetDownloadRequest(0) + 20);
        uint64_t v201 = &a1[v200];
        uint64_t v202 = &a2[v200];
        char v203 = v202[8];
        *(void *)uint64_t v201 = *(void *)v202;
        v201[8] = v203;
        swift_storeEnumTagMultiPayload();
        break;
      case 0xEu:
        *(void *)a1 = *(void *)a2;
        uint64_t v204 = (int *)type metadata accessor for ShadowEvaluationRequest(0);
        uint64_t v205 = v204[5];
        v456 = &a1[v205];
        uint64_t v206 = &a2[v205];
        uint64_t v207 = sub_2372A4780();
        v208 = *(void (**)(char *, char *, uint64_t))(*(void *)(v207 - 8) + 16);
        swift_bridgeObjectRetain();
        v208(v456, v206, v207);
        uint64_t v209 = v204[6];
        uint64_t v210 = &a1[v209];
        uint64_t v211 = &a2[v209];
        uint64_t v212 = *(void *)v211;
        v210[8] = v211[8];
        *(void *)uint64_t v210 = v212;
        uint64_t v213 = v204[7];
        v214 = &a1[v213];
        v215 = &a2[v213];
        LOBYTE(v212) = v215[8];
        *(void *)v214 = *(void *)v215;
        v214[8] = v212;
        uint64_t v216 = v204[8];
        v217 = &a1[v216];
        v218 = &a2[v216];
        LOBYTE(v212) = v218[8];
        *(void *)v217 = *(void *)v218;
        v217[8] = v212;
        a1[v204[9]] = a2[v204[9]];
        uint64_t v219 = v204[10];
        uint64_t v220 = &a1[v219];
        v221 = &a2[v219];
        uint64_t v222 = *(void *)v221;
        v220[8] = v221[8];
        *(void *)uint64_t v220 = v222;
        a1[v204[11]] = a2[v204[11]];
        swift_storeEnumTagMultiPayload();
        break;
      case 0x10u:
        uint64_t v224 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v224 - 8) + 16))(a1, a2, v224);
        uint64_t v225 = *(int *)(type metadata accessor for DeleteDaemonStateRequest(0) + 20);
        v226 = &a1[v225];
        v227 = &a2[v225];
        __int16 v228 = *((_WORD *)v227 + 4);
        *(void *)v226 = *(void *)v227;
        *((_WORD *)v226 + 4) = v228;
        swift_storeEnumTagMultiPayload();
        break;
      default:
        uint64_t v16 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
        uint64_t v17 = *(int *)(type metadata accessor for PingRequest(0) + 20);
        uint64_t v18 = &a1[v17];
        uint64_t v19 = &a2[v17];
        *(void *)uint64_t v18 = *(void *)v19;
        *((void *)v18 + 1) = *((void *)v19 + 1);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
LABEL_58:
  uint64_t v376 = *(int *)(a3 + 20);
  v377 = &a1[v376];
  v378 = &a2[v376];
  uint64_t v379 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v379 - 8) + 24))(v377, v378, v379);
  return a1;
}

_OWORD *initializeWithTake for SubscriptionClientRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubscriptionClientRequest.OneOf_Type(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECC870);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v11 = sub_2372A4780();
        uint64_t v12 = (void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32);
        char v166 = *v12;
        (*v12)((char *)a1, (char *)a2, v11);
        uint64_t v13 = type metadata accessor for NewOfferRequest(0);
        uint64_t v14 = *(int *)(v13 + 20);
        uint64_t v15 = (char *)a1 + v14;
        uint64_t v16 = (char *)a2 + v14;
        *(void *)uint64_t v15 = *(void *)v16;
        v15[8] = v16[8];
        uint64_t v17 = *(int *)(v13 + 24);
        __dst = (char *)a1 + v17;
        uint64_t v169 = v13;
        uint64_t v18 = (char *)a2 + v17;
        uint64_t v19 = (int *)type metadata accessor for LitmusInfo(0);
        uint64_t v20 = *((void *)v19 - 1);
        uint64_t v163 = (void *)v11;
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v20 + 48))(v18, 1, v19))
        {
          uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
          memcpy(__dst, v18, *(void *)(*(void *)(v21 - 8) + 64));
        }
        else
        {
          v166(__dst, v18, v11);
          uint64_t v97 = v19[5];
          char v98 = &__dst[v97];
          uint64_t v99 = &v18[v97];
          *(_DWORD *)char v98 = *(_DWORD *)v99;
          v98[4] = v99[4];
          uint64_t v100 = v19[6];
          uint64_t v101 = &__dst[v100];
          uint64_t v102 = &v18[v100];
          *(_DWORD *)uint64_t v101 = *(_DWORD *)v102;
          v101[4] = v102[4];
          uint64_t v103 = v19[7];
          uint64_t v104 = &__dst[v103];
          uint64_t v105 = &v18[v103];
          *(_DWORD *)uint64_t v104 = *(_DWORD *)v105;
          v104[4] = v105[4];
          uint64_t v106 = v19[8];
          uint64_t v107 = &__dst[v106];
          uint64_t v108 = &v18[v106];
          *(void *)uint64_t v107 = *(void *)v108;
          *((_WORD *)v107 + 4) = *((_WORD *)v108 + 4);
          (*(void (**)(char *, void, uint64_t, int *))(v20 + 56))(__dst, 0, 1, v19);
        }
        uint64_t v109 = *(int *)(v169 + 28);
        uint64_t v110 = (char *)a1 + v109;
        uint64_t v111 = (char *)a2 + v109;
        *(void *)uint64_t v110 = *(void *)v111;
        v110[8] = v111[8];
        uint64_t v112 = *(int *)(v169 + 32);
        uint64_t v113 = (char *)a1 + v112;
        char v114 = (char *)a2 + v112;
        uint64_t v115 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v116 = *((void *)v115 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v116 + 48))(v114, 1, v115))
        {
          uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v113, v114, *(void *)(*(void *)(v117 - 8) + 64));
        }
        else
        {
          v166(v113, v114, (uint64_t)v163);
          *(_OWORD *)&v113[v115[5]] = *(_OWORD *)&v114[v115[5]];
          *(_OWORD *)&v113[v115[6]] = *(_OWORD *)&v114[v115[6]];
          *(_OWORD *)&v113[v115[7]] = *(_OWORD *)&v114[v115[7]];
          *(_OWORD *)&v113[v115[8]] = *(_OWORD *)&v114[v115[8]];
          (*(void (**)(char *, void, uint64_t, int *))(v116 + 56))(v113, 0, 1, v115);
        }
        break;
      case 2u:
        *a1 = *a2;
        uint64_t v22 = type metadata accessor for FeaturesRequest(0);
        uint64_t v23 = *(int *)(v22 + 24);
        uint64_t v24 = (char *)a1 + v23;
        uint64_t v25 = (char *)a2 + v23;
        uint64_t v26 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
        uint64_t v27 = *(int *)(v22 + 28);
        uint64_t v28 = (char *)a1 + v27;
        uint64_t v29 = (char *)a2 + v27;
        *(void *)uint64_t v28 = *(void *)v29;
        v28[8] = v29[8];
        break;
      case 3u:
      case 5u:
      case 8u:
      case 0xCu:
      case 0xFu:
        uint64_t v92 = sub_2372A4780();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v92 - 8) + 32))(a1, a2, v92);
        break;
      case 4u:
        uint64_t v30 = sub_2372A4780();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v30 - 8) + 32))(a1, a2, v30);
        uint64_t v31 = (int *)type metadata accessor for DataRequest(0);
        uint64_t v32 = v31[5];
        uint64_t v33 = (char *)a1 + v32;
        uint64_t v34 = (char *)a2 + v32;
        *(void *)uint64_t v33 = *(void *)v34;
        v33[8] = v34[8];
        uint64_t v35 = v31[6];
        uint64_t v36 = (char *)a1 + v35;
        uint64_t v37 = (char *)a2 + v35;
        *(void *)uint64_t v36 = *(void *)v37;
        v36[8] = v37[8];
        uint64_t v38 = v31[7];
        uint64_t v39 = (char *)a1 + v38;
        uint64_t v40 = (char *)a2 + v38;
        v39[8] = v40[8];
        *(void *)uint64_t v39 = *(void *)v40;
        *((unsigned char *)a1 + v31[8]) = *((unsigned char *)a2 + v31[8]);
        uint64_t v41 = v31[9];
        uint64_t v42 = (char *)a1 + v41;
        uint64_t v43 = (char *)a2 + v41;
        *(void *)uint64_t v42 = *(void *)v43;
        v42[8] = v43[8];
        *((unsigned char *)a1 + v31[10]) = *((unsigned char *)a2 + v31[10]);
        *((unsigned char *)a1 + v31[11]) = *((unsigned char *)a2 + v31[11]);
        break;
      case 6u:
        uint64_t v44 = sub_2372A4780();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v44 - 8) + 32))(a1, a2, v44);
        uint64_t v45 = type metadata accessor for SetCliActivityRequest(0);
        uint64_t v46 = *(int *)(v45 + 20);
        uint64_t v47 = (char *)a1 + v46;
        char v48 = (char *)a2 + v46;
        *(void *)uint64_t v47 = *(void *)v48;
        v47[8] = v48[8];
        *(_OWORD *)((char *)a1 + *(int *)(v45 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v45 + 24));
        break;
      case 7u:
        uint64_t v49 = sub_2372A4780();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v49 - 8) + 32))(a1, a2, v49);
        uint64_t v50 = type metadata accessor for DisplayDelayedOfferRequest(0);
        *(_OWORD *)((char *)a1 + *(int *)(v50 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v50 + 20));
        *((unsigned char *)a1 + *(int *)(v50 + 24)) = *((unsigned char *)a2 + *(int *)(v50 + 24));
        break;
      case 9u:
        uint64_t v51 = sub_2372A4780();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v51 - 8) + 32))(a1, a2, v51);
        char v52 = (int *)type metadata accessor for ActivityClearRequest(0);
        *((unsigned char *)a1 + v52[5]) = *((unsigned char *)a2 + v52[5]);
        *((unsigned char *)a1 + v52[6]) = *((unsigned char *)a2 + v52[6]);
        *((unsigned char *)a1 + v52[7]) = *((unsigned char *)a2 + v52[7]);
        break;
      case 0xAu:
        uint64_t v53 = sub_2372A4780();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v53 - 8) + 32))(a1, a2, v53);
        BiomeStreamRequest = (int *)type metadata accessor for GetBiomeStreamRequest(0);
        uint64_t v55 = BiomeStreamRequest[5];
        char v56 = (char *)a1 + v55;
        uint64_t v57 = (char *)a2 + v55;
        *(void *)char v56 = *(void *)v57;
        v56[8] = v57[8];
        uint64_t v58 = BiomeStreamRequest[6];
        uint64_t v59 = (char *)a1 + v58;
        uint64_t v60 = (char *)a2 + v58;
        *(void *)uint64_t v59 = *(void *)v60;
        v59[8] = v60[8];
        uint64_t v61 = BiomeStreamRequest[7];
        char v62 = (char *)a1 + v61;
        uint64_t v63 = (char *)a2 + v61;
        *(void *)char v62 = *(void *)v63;
        *((_WORD *)v62 + 4) = *((_WORD *)v63 + 4);
        break;
      case 0xBu:
        uint64_t v64 = sub_2372A4780();
        uint64_t v170 = *(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 32);
        v170((char *)a1, (char *)a2, v64);
        uint64_t v65 = *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
        uint64_t v66 = (char *)a1 + v65;
        uint64_t v67 = (char *)a2 + v65;
        uint64_t v68 = type metadata accessor for NotificationState(0);
        uint64_t v69 = *(void *)(v68 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48))(v67, 1, v68))
        {
          uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
          memcpy(v66, v67, *(void *)(*(void *)(v70 - 8) + 64));
        }
        else
        {
          uint64_t v167 = v69;
          v170(v66, v67, v64);
          uint64_t v118 = *(int *)(v68 + 20);
          uint64_t v119 = &v66[v118];
          uint64_t v120 = &v67[v118];
          *(void *)uint64_t v119 = *(void *)v120;
          v119[8] = v120[8];
          uint64_t v161 = (int *)v68;
          uint64_t v164 = v66;
          uint64_t v121 = *(int *)(v68 + 24);
          __int16 v122 = &v66[v121];
          uint64_t v123 = &v67[v121];
          uint64_t v124 = v64;
          v125 = (int *)type metadata accessor for LitmusInfo(0);
          uint64_t v159 = *((void *)v125 - 1);
          uint64_t v160 = v124;
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v159 + 48))(v123, 1, v125))
          {
            uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
            memcpy(v122, v123, *(void *)(*(void *)(v126 - 8) + 64));
          }
          else
          {
            v170(v122, v123, v124);
            uint64_t v127 = v125[5];
            uint64_t v128 = &v122[v127];
            char v129 = &v123[v127];
            *(_DWORD *)uint64_t v128 = *(_DWORD *)v129;
            v128[4] = v129[4];
            uint64_t v130 = v125[6];
            uint64_t v131 = &v122[v130];
            uint64_t v132 = &v123[v130];
            *(_DWORD *)uint64_t v131 = *(_DWORD *)v132;
            v131[4] = v132[4];
            uint64_t v133 = v125[7];
            uint64_t v134 = &v122[v133];
            uint64_t v135 = &v123[v133];
            *(_DWORD *)uint64_t v134 = *(_DWORD *)v135;
            v134[4] = v135[4];
            uint64_t v136 = v125[8];
            uint64_t v137 = &v122[v136];
            uint64_t v138 = &v123[v136];
            *(void *)uint64_t v137 = *(void *)v138;
            *((_WORD *)v137 + 4) = *((_WORD *)v138 + 4);
            (*(void (**)(char *, void, uint64_t, int *))(v159 + 56))(v122, 0, 1, v125);
          }
          uint64_t v140 = v161;
          uint64_t v139 = v164;
          uint64_t v141 = v161[7];
          char v142 = &v164[v141];
          uint64_t v143 = &v67[v141];
          *(void *)char v142 = *(void *)v143;
          v142[8] = v143[8];
          uint64_t v144 = v161[8];
          uint64_t v145 = &v164[v144];
          uint64_t v146 = &v67[v144];
          v145[8] = v146[8];
          *(void *)uint64_t v145 = *(void *)v146;
          uint64_t v147 = v161[9];
          uint64_t v165 = &v164[v147];
          char v148 = &v67[v147];
          uint64_t v149 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v162 = *((void *)v149 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v162 + 48))(v148, 1, v149))
          {
            uint64_t v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v165, v148, *(void *)(*(void *)(v150 - 8) + 64));
          }
          else
          {
            v170(v165, v148, v160);
            *(_OWORD *)&v165[v149[5]] = *(_OWORD *)&v148[v149[5]];
            *(_OWORD *)&v165[v149[6]] = *(_OWORD *)&v148[v149[6]];
            *(_OWORD *)&v165[v149[7]] = *(_OWORD *)&v148[v149[7]];
            *(_OWORD *)&v165[v149[8]] = *(_OWORD *)&v148[v149[8]];
            (*(void (**)(char *, void, uint64_t, int *))(v162 + 56))(v165, 0, 1, v149);
          }
          *(_OWORD *)&v139[v140[10]] = *(_OWORD *)&v67[v140[10]];
          uint64_t v151 = v140[11];
          char v152 = &v139[v151];
          uint64_t v153 = &v67[v151];
          v152[8] = v153[8];
          *(void *)char v152 = *(void *)v153;
          (*(void (**)(char *, void, uint64_t, int *))(v167 + 56))(v139, 0, 1, v140);
        }
        break;
      case 0xDu:
        uint64_t v71 = sub_2372A4780();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v71 - 8) + 32))(a1, a2, v71);
        uint64_t v72 = *(int *)(type metadata accessor for MobileAssetDownloadRequest(0) + 20);
        uint64_t v73 = (char *)a1 + v72;
        uint64_t v74 = (char *)a2 + v72;
        *(void *)uint64_t v73 = *(void *)v74;
        v73[8] = v74[8];
        break;
      case 0xEu:
        *(void *)a1 = *(void *)a2;
        uint64_t v75 = (int *)type metadata accessor for ShadowEvaluationRequest(0);
        uint64_t v76 = v75[5];
        uint64_t v77 = (char *)a1 + v76;
        char v78 = (char *)a2 + v76;
        uint64_t v79 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 32))(v77, v78, v79);
        uint64_t v80 = v75[6];
        uint64_t v81 = (char *)a1 + v80;
        char v82 = (char *)a2 + v80;
        *(void *)uint64_t v81 = *(void *)v82;
        v81[8] = v82[8];
        uint64_t v83 = v75[7];
        uint64_t v84 = (char *)a1 + v83;
        uint64_t v85 = (char *)a2 + v83;
        *(void *)uint64_t v84 = *(void *)v85;
        v84[8] = v85[8];
        uint64_t v86 = v75[8];
        uint64_t v87 = (char *)a1 + v86;
        uint64_t v88 = (char *)a2 + v86;
        *(void *)uint64_t v87 = *(void *)v88;
        v87[8] = v88[8];
        *((unsigned char *)a1 + v75[9]) = *((unsigned char *)a2 + v75[9]);
        uint64_t v89 = v75[10];
        uint64_t v90 = (char *)a1 + v89;
        uint64_t v91 = (char *)a2 + v89;
        *(void *)uint64_t v90 = *(void *)v91;
        v90[8] = v91[8];
        *((unsigned char *)a1 + v75[11]) = *((unsigned char *)a2 + v75[11]);
        break;
      case 0x10u:
        uint64_t v93 = sub_2372A4780();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v93 - 8) + 32))(a1, a2, v93);
        uint64_t v94 = *(int *)(type metadata accessor for DeleteDaemonStateRequest(0) + 20);
        uint64_t v95 = (char *)a1 + v94;
        uint64_t v96 = (char *)a2 + v94;
        *(void *)uint64_t v95 = *(void *)v96;
        *((_WORD *)v95 + 4) = *((_WORD *)v96 + 4);
        break;
      default:
        uint64_t v9 = sub_2372A4780();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
        uint64_t v10 = type metadata accessor for PingRequest(0);
        *(_OWORD *)((char *)a1 + *(int *)(v10 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v10 + 20));
        break;
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v154 = *(int *)(a3 + 20);
  uint64_t v155 = (char *)a1 + v154;
  char v156 = (char *)a2 + v154;
  uint64_t v157 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v157 - 8) + 32))(v155, v156, v157);
  return a1;
}

char *assignWithTake for SubscriptionClientRequest(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubscriptionClientRequest.OneOf_Type(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v16 = sub_2372A4780();
          uint64_t v17 = (void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32);
          v320 = *v17;
          (*v17)(a1, a2, v16);
          uint64_t v18 = type metadata accessor for NewOfferRequest(0);
          uint64_t v19 = *(int *)(v18 + 20);
          uint64_t v20 = &a1[v19];
          uint64_t v21 = &a2[v19];
          *(void *)uint64_t v20 = *(void *)v21;
          v20[8] = v21[8];
          uint64_t v22 = *(int *)(v18 + 24);
          __dst = &a1[v22];
          uint64_t v326 = v18;
          uint64_t v23 = &a2[v22];
          uint64_t v24 = (int *)type metadata accessor for LitmusInfo(0);
          uint64_t v25 = *((void *)v24 - 1);
          uint64_t v316 = v16;
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v25 + 48))(v23, 1, v24))
          {
            uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
            memcpy(__dst, v23, *(void *)(*(void *)(v26 - 8) + 64));
          }
          else
          {
            v320(__dst, v23, v16);
            uint64_t v189 = v24[5];
            __int16 v190 = &__dst[v189];
            uint64_t v191 = &v23[v189];
            *(_DWORD *)__int16 v190 = *(_DWORD *)v191;
            v190[4] = v191[4];
            uint64_t v192 = v24[6];
            uint64_t v193 = &__dst[v192];
            uint64_t v194 = &v23[v192];
            *(_DWORD *)uint64_t v193 = *(_DWORD *)v194;
            v193[4] = v194[4];
            uint64_t v195 = v24[7];
            uint64_t v196 = &__dst[v195];
            uint64_t v197 = &v23[v195];
            *(_DWORD *)uint64_t v196 = *(_DWORD *)v197;
            v196[4] = v197[4];
            uint64_t v198 = v24[8];
            uint64_t v199 = &__dst[v198];
            uint64_t v200 = &v23[v198];
            *(void *)uint64_t v199 = *(void *)v200;
            *((_WORD *)v199 + 4) = *((_WORD *)v200 + 4);
            (*(void (**)(char *, void, uint64_t, int *))(v25 + 56))(__dst, 0, 1, v24);
          }
          uint64_t v201 = *(int *)(v326 + 28);
          uint64_t v202 = &a1[v201];
          char v203 = &a2[v201];
          *(void *)uint64_t v202 = *(void *)v203;
          v202[8] = v203[8];
          uint64_t v204 = *(int *)(v326 + 32);
          uint64_t v205 = &a1[v204];
          uint64_t v206 = &a2[v204];
          uint64_t v207 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v208 = *((void *)v207 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v208 + 48))(v206, 1, v207))
          {
            uint64_t v209 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v205, v206, *(void *)(*(void *)(v209 - 8) + 64));
          }
          else
          {
            v320(v205, v206, v316);
            *(_OWORD *)&v205[v207[5]] = *(_OWORD *)&v206[v207[5]];
            *(_OWORD *)&v205[v207[6]] = *(_OWORD *)&v206[v207[6]];
            *(_OWORD *)&v205[v207[7]] = *(_OWORD *)&v206[v207[7]];
            *(_OWORD *)&v205[v207[8]] = *(_OWORD *)&v206[v207[8]];
            (*(void (**)(char *, void, uint64_t, int *))(v208 + 56))(v205, 0, 1, v207);
          }
          break;
        case 2u:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          uint64_t v27 = type metadata accessor for FeaturesRequest(0);
          uint64_t v28 = *(int *)(v27 + 24);
          uint64_t v29 = &a1[v28];
          uint64_t v30 = &a2[v28];
          uint64_t v31 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32))(v29, v30, v31);
          uint64_t v32 = *(int *)(v27 + 28);
          uint64_t v33 = &a1[v32];
          uint64_t v34 = &a2[v32];
          *(void *)uint64_t v33 = *(void *)v34;
          v33[8] = v34[8];
          break;
        case 3u:
        case 5u:
        case 8u:
        case 0xCu:
        case 0xFu:
          uint64_t v97 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v97 - 8) + 32))(a1, a2, v97);
          break;
        case 4u:
          uint64_t v35 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32))(a1, a2, v35);
          uint64_t v36 = (int *)type metadata accessor for DataRequest(0);
          uint64_t v37 = v36[5];
          uint64_t v38 = &a1[v37];
          uint64_t v39 = &a2[v37];
          *(void *)uint64_t v38 = *(void *)v39;
          v38[8] = v39[8];
          uint64_t v40 = v36[6];
          uint64_t v41 = &a1[v40];
          uint64_t v42 = &a2[v40];
          *(void *)uint64_t v41 = *(void *)v42;
          v41[8] = v42[8];
          uint64_t v43 = v36[7];
          uint64_t v44 = &a1[v43];
          uint64_t v45 = &a2[v43];
          v44[8] = v45[8];
          *(void *)uint64_t v44 = *(void *)v45;
          a1[v36[8]] = a2[v36[8]];
          uint64_t v46 = v36[9];
          uint64_t v47 = &a1[v46];
          char v48 = &a2[v46];
          *(void *)uint64_t v47 = *(void *)v48;
          v47[8] = v48[8];
          a1[v36[10]] = a2[v36[10]];
          a1[v36[11]] = a2[v36[11]];
          break;
        case 6u:
          uint64_t v49 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 32))(a1, a2, v49);
          uint64_t v50 = type metadata accessor for SetCliActivityRequest(0);
          uint64_t v51 = *(int *)(v50 + 20);
          char v52 = &a1[v51];
          uint64_t v53 = &a2[v51];
          *(void *)char v52 = *(void *)v53;
          v52[8] = v53[8];
          *(_OWORD *)&a1[*(int *)(v50 + 24)] = *(_OWORD *)&a2[*(int *)(v50 + 24)];
          break;
        case 7u:
          uint64_t v54 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 32))(a1, a2, v54);
          uint64_t v55 = type metadata accessor for DisplayDelayedOfferRequest(0);
          *(_OWORD *)&a1[*(int *)(v55 + 20)] = *(_OWORD *)&a2[*(int *)(v55 + 20)];
          a1[*(int *)(v55 + 24)] = a2[*(int *)(v55 + 24)];
          break;
        case 9u:
          uint64_t v56 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 32))(a1, a2, v56);
          uint64_t v57 = (int *)type metadata accessor for ActivityClearRequest(0);
          a1[v57[5]] = a2[v57[5]];
          a1[v57[6]] = a2[v57[6]];
          a1[v57[7]] = a2[v57[7]];
          break;
        case 0xAu:
          uint64_t v58 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 32))(a1, a2, v58);
          BiomeStreamRequest = (int *)type metadata accessor for GetBiomeStreamRequest(0);
          uint64_t v60 = BiomeStreamRequest[5];
          uint64_t v61 = &a1[v60];
          char v62 = &a2[v60];
          *(void *)uint64_t v61 = *(void *)v62;
          v61[8] = v62[8];
          uint64_t v63 = BiomeStreamRequest[6];
          uint64_t v64 = &a1[v63];
          uint64_t v65 = &a2[v63];
          *(void *)uint64_t v64 = *(void *)v65;
          v64[8] = v65[8];
          uint64_t v66 = BiomeStreamRequest[7];
          uint64_t v67 = &a1[v66];
          uint64_t v68 = &a2[v66];
          *(void *)uint64_t v67 = *(void *)v68;
          *((_WORD *)v67 + 4) = *((_WORD *)v68 + 4);
          break;
        case 0xBu:
          uint64_t v69 = sub_2372A4780();
          v327 = *(void (**)(char *, char *, uint64_t))(*(void *)(v69 - 8) + 32);
          v327(a1, a2, v69);
          uint64_t v70 = *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
          uint64_t v71 = &a1[v70];
          uint64_t v72 = &a2[v70];
          uint64_t v73 = type metadata accessor for NotificationState(0);
          uint64_t v74 = *(void *)(v73 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v74 + 48))(v72, 1, v73))
          {
            uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
            memcpy(v71, v72, *(void *)(*(void *)(v75 - 8) + 64));
          }
          else
          {
            uint64_t v318 = v74;
            v327(v71, v72, v69);
            uint64_t v210 = *(int *)(v73 + 20);
            uint64_t v211 = &v71[v210];
            uint64_t v212 = &v72[v210];
            *(void *)uint64_t v211 = *(void *)v212;
            v211[8] = v212[8];
            uint64_t v312 = (int *)v73;
            uint64_t v314 = v71;
            uint64_t v213 = *(int *)(v73 + 24);
            v214 = &v71[v213];
            char v321 = v72;
            v215 = &v72[v213];
            uint64_t v216 = v69;
            v217 = (int *)type metadata accessor for LitmusInfo(0);
            uint64_t v218 = *((void *)v217 - 1);
            if ((*(unsigned int (**)(char *, uint64_t, int *))(v218 + 48))(v215, 1, v217))
            {
              uint64_t v219 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
              memcpy(v214, v215, *(void *)(*(void *)(v219 - 8) + 64));
            }
            else
            {
              v327(v214, v215, v216);
              uint64_t v251 = v217[5];
              v252 = &v214[v251];
              uint64_t v253 = &v215[v251];
              *(_DWORD *)v252 = *(_DWORD *)v253;
              v252[4] = v253[4];
              uint64_t v254 = v217[6];
              uint64_t v255 = &v214[v254];
              v256 = &v215[v254];
              *(_DWORD *)uint64_t v255 = *(_DWORD *)v256;
              v255[4] = v256[4];
              uint64_t v257 = v217[7];
              char v258 = &v214[v257];
              uint64_t v259 = &v215[v257];
              *(_DWORD *)char v258 = *(_DWORD *)v259;
              v258[4] = v259[4];
              uint64_t v260 = v217[8];
              v261 = &v214[v260];
              v262 = &v215[v260];
              *(void *)v261 = *(void *)v262;
              *((_WORD *)v261 + 4) = *((_WORD *)v262 + 4);
              (*(void (**)(char *, void, uint64_t, int *))(v218 + 56))(v214, 0, 1, v217);
            }
            uint64_t v263 = v312[7];
            uint64_t v264 = &v314[v263];
            uint64_t v265 = v321;
            v266 = &v321[v263];
            *(void *)uint64_t v264 = *(void *)v266;
            v264[8] = v266[8];
            uint64_t v267 = v312[8];
            uint64_t v268 = &v314[v267];
            v269 = &v321[v267];
            v268[8] = v269[8];
            *(void *)uint64_t v268 = *(void *)v269;
            uint64_t v270 = v312[9];
            v311 = &v314[v270];
            uint64_t v271 = &v321[v270];
            v272 = (int *)type metadata accessor for QuotaServerState(0);
            uint64_t v308 = *((void *)v272 - 1);
            if ((*(unsigned int (**)(char *, uint64_t, int *))(v308 + 48))(v271, 1, v272))
            {
              uint64_t v273 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
              memcpy(v311, v271, *(void *)(*(void *)(v273 - 8) + 64));
            }
            else
            {
              v327(v311, v271, v216);
              *(_OWORD *)&v311[v272[5]] = *(_OWORD *)&v271[v272[5]];
              *(_OWORD *)&v311[v272[6]] = *(_OWORD *)&v271[v272[6]];
              *(_OWORD *)&v311[v272[7]] = *(_OWORD *)&v271[v272[7]];
              *(_OWORD *)&v311[v272[8]] = *(_OWORD *)&v271[v272[8]];
              uint64_t v265 = v321;
              (*(void (**)(char *, void, uint64_t, int *))(v308 + 56))(v311, 0, 1, v272);
            }
            *(_OWORD *)&v314[v312[10]] = *(_OWORD *)&v265[v312[10]];
            uint64_t v274 = v312[11];
            v275 = &v314[v274];
            v276 = &v265[v274];
            v275[8] = v276[8];
            *(void *)v275 = *(void *)v276;
            (*(void (**)(char *, void, uint64_t, int *))(v318 + 56))(v314, 0, 1, v312);
          }
          break;
        case 0xDu:
          uint64_t v76 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 32))(a1, a2, v76);
          uint64_t v77 = *(int *)(type metadata accessor for MobileAssetDownloadRequest(0) + 20);
          char v78 = &a1[v77];
          uint64_t v79 = &a2[v77];
          *(void *)char v78 = *(void *)v79;
          v78[8] = v79[8];
          break;
        case 0xEu:
          *(void *)a1 = *(void *)a2;
          uint64_t v80 = (int *)type metadata accessor for ShadowEvaluationRequest(0);
          uint64_t v81 = v80[5];
          char v82 = &a1[v81];
          uint64_t v83 = &a2[v81];
          uint64_t v84 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v84 - 8) + 32))(v82, v83, v84);
          uint64_t v85 = v80[6];
          uint64_t v86 = &a1[v85];
          uint64_t v87 = &a2[v85];
          *(void *)uint64_t v86 = *(void *)v87;
          v86[8] = v87[8];
          uint64_t v88 = v80[7];
          uint64_t v89 = &a1[v88];
          uint64_t v90 = &a2[v88];
          *(void *)uint64_t v89 = *(void *)v90;
          v89[8] = v90[8];
          uint64_t v91 = v80[8];
          uint64_t v92 = &a1[v91];
          uint64_t v93 = &a2[v91];
          *(void *)uint64_t v92 = *(void *)v93;
          v92[8] = v93[8];
          a1[v80[9]] = a2[v80[9]];
          uint64_t v94 = v80[10];
          uint64_t v95 = &a1[v94];
          uint64_t v96 = &a2[v94];
          *(void *)uint64_t v95 = *(void *)v96;
          v95[8] = v96[8];
          a1[v80[11]] = a2[v80[11]];
          break;
        case 0x10u:
          uint64_t v98 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v98 - 8) + 32))(a1, a2, v98);
          uint64_t v99 = *(int *)(type metadata accessor for DeleteDaemonStateRequest(0) + 20);
          uint64_t v100 = &a1[v99];
          uint64_t v101 = &a2[v99];
          *(void *)uint64_t v100 = *(void *)v101;
          *((_WORD *)v100 + 4) = *((_WORD *)v101 + 4);
          break;
        default:
          uint64_t v11 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
          uint64_t v12 = type metadata accessor for PingRequest(0);
          *(_OWORD *)&a1[*(int *)(v12 + 20)] = *(_OWORD *)&a2[*(int *)(v12 + 20)];
          break;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_58;
    }
LABEL_7:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECC870);
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_58;
  }
  if (v10)
  {
    sub_23723CDC0((uint64_t)a1, type metadata accessor for SubscriptionClientRequest.OneOf_Type);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_23723CDC0((uint64_t)a1, type metadata accessor for SubscriptionClientRequest.OneOf_Type);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v102 = sub_2372A4780();
        uint64_t v103 = *(void (**)(char *, char *, uint64_t))(*(void *)(v102 - 8) + 32);
        v103(a1, a2, v102);
        uint64_t v104 = (int *)type metadata accessor for NewOfferRequest(0);
        uint64_t v105 = v104[5];
        uint64_t v106 = &a1[v105];
        uint64_t v107 = &a2[v105];
        *(void *)uint64_t v106 = *(void *)v107;
        v106[8] = v107[8];
        uint64_t v108 = v104[6];
        __dsta = &a1[v108];
        uint64_t v109 = &a2[v108];
        uint64_t v110 = (int *)type metadata accessor for LitmusInfo(0);
        uint64_t v111 = *((void *)v110 - 1);
        uint64_t v317 = v102;
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v111 + 48))(v109, 1, v110))
        {
          uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
          memcpy(__dsta, v109, *(void *)(*(void *)(v112 - 8) + 64));
        }
        else
        {
          v103(__dsta, v109, v102);
          uint64_t v220 = v110[5];
          v221 = &__dsta[v220];
          uint64_t v222 = &v109[v220];
          *(_DWORD *)v221 = *(_DWORD *)v222;
          v221[4] = v222[4];
          uint64_t v223 = v110[6];
          uint64_t v224 = &__dsta[v223];
          uint64_t v225 = &v109[v223];
          *(_DWORD *)uint64_t v224 = *(_DWORD *)v225;
          v224[4] = v225[4];
          uint64_t v226 = v110[7];
          v227 = &__dsta[v226];
          __int16 v228 = &v109[v226];
          *(_DWORD *)v227 = *(_DWORD *)v228;
          v227[4] = v228[4];
          uint64_t v229 = v110[8];
          v230 = &__dsta[v229];
          v231 = &v109[v229];
          *(void *)v230 = *(void *)v231;
          *((_WORD *)v230 + 4) = *((_WORD *)v231 + 4);
          (*(void (**)(char *, void, uint64_t, int *))(v111 + 56))(__dsta, 0, 1, v110);
        }
        uint64_t v232 = v104[7];
        uint64_t v233 = &a1[v232];
        v234 = &a2[v232];
        *(void *)uint64_t v233 = *(void *)v234;
        v233[8] = v234[8];
        uint64_t v235 = v104[8];
        char v236 = &a1[v235];
        uint64_t v237 = &a2[v235];
        v238 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v239 = *((void *)v238 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v239 + 48))(v237, 1, v238))
        {
          uint64_t v240 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v236, v237, *(void *)(*(void *)(v240 - 8) + 64));
        }
        else
        {
          v103(v236, v237, v317);
          *(_OWORD *)&v236[v238[5]] = *(_OWORD *)&v237[v238[5]];
          *(_OWORD *)&v236[v238[6]] = *(_OWORD *)&v237[v238[6]];
          *(_OWORD *)&v236[v238[7]] = *(_OWORD *)&v237[v238[7]];
          *(_OWORD *)&v236[v238[8]] = *(_OWORD *)&v237[v238[8]];
          (*(void (**)(char *, void, uint64_t, int *))(v239 + 56))(v236, 0, 1, v238);
        }
        goto LABEL_54;
      case 2u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v113 = type metadata accessor for FeaturesRequest(0);
        uint64_t v114 = *(int *)(v113 + 24);
        uint64_t v115 = &a1[v114];
        uint64_t v116 = &a2[v114];
        uint64_t v117 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v117 - 8) + 32))(v115, v116, v117);
        uint64_t v118 = *(int *)(v113 + 28);
        uint64_t v119 = &a1[v118];
        uint64_t v120 = &a2[v118];
        *(void *)uint64_t v119 = *(void *)v120;
        v119[8] = v120[8];
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
      case 5u:
      case 8u:
      case 0xCu:
      case 0xFu:
        uint64_t v184 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v184 - 8) + 32))(a1, a2, v184);
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v121 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v121 - 8) + 32))(a1, a2, v121);
        __int16 v122 = (int *)type metadata accessor for DataRequest(0);
        uint64_t v123 = v122[5];
        uint64_t v124 = &a1[v123];
        v125 = &a2[v123];
        *(void *)uint64_t v124 = *(void *)v125;
        v124[8] = v125[8];
        uint64_t v126 = v122[6];
        uint64_t v127 = &a1[v126];
        uint64_t v128 = &a2[v126];
        *(void *)uint64_t v127 = *(void *)v128;
        v127[8] = v128[8];
        uint64_t v129 = v122[7];
        uint64_t v130 = &a1[v129];
        uint64_t v131 = &a2[v129];
        v130[8] = v131[8];
        *(void *)uint64_t v130 = *(void *)v131;
        a1[v122[8]] = a2[v122[8]];
        uint64_t v132 = v122[9];
        uint64_t v133 = &a1[v132];
        uint64_t v134 = &a2[v132];
        *(void *)uint64_t v133 = *(void *)v134;
        v133[8] = v134[8];
        a1[v122[10]] = a2[v122[10]];
        a1[v122[11]] = a2[v122[11]];
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        uint64_t v135 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v135 - 8) + 32))(a1, a2, v135);
        uint64_t v136 = type metadata accessor for SetCliActivityRequest(0);
        uint64_t v137 = *(int *)(v136 + 20);
        uint64_t v138 = &a1[v137];
        uint64_t v139 = &a2[v137];
        *(void *)uint64_t v138 = *(void *)v139;
        v138[8] = v139[8];
        *(_OWORD *)&a1[*(int *)(v136 + 24)] = *(_OWORD *)&a2[*(int *)(v136 + 24)];
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        uint64_t v140 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v140 - 8) + 32))(a1, a2, v140);
        uint64_t v141 = type metadata accessor for DisplayDelayedOfferRequest(0);
        *(_OWORD *)&a1[*(int *)(v141 + 20)] = *(_OWORD *)&a2[*(int *)(v141 + 20)];
        a1[*(int *)(v141 + 24)] = a2[*(int *)(v141 + 24)];
        swift_storeEnumTagMultiPayload();
        break;
      case 9u:
        uint64_t v142 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v142 - 8) + 32))(a1, a2, v142);
        uint64_t v143 = (int *)type metadata accessor for ActivityClearRequest(0);
        a1[v143[5]] = a2[v143[5]];
        a1[v143[6]] = a2[v143[6]];
        a1[v143[7]] = a2[v143[7]];
        swift_storeEnumTagMultiPayload();
        break;
      case 0xAu:
        uint64_t v144 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v144 - 8) + 32))(a1, a2, v144);
        uint64_t v145 = (int *)type metadata accessor for GetBiomeStreamRequest(0);
        uint64_t v146 = v145[5];
        uint64_t v147 = &a1[v146];
        char v148 = &a2[v146];
        *(void *)uint64_t v147 = *(void *)v148;
        v147[8] = v148[8];
        uint64_t v149 = v145[6];
        uint64_t v150 = &a1[v149];
        uint64_t v151 = &a2[v149];
        *(void *)uint64_t v150 = *(void *)v151;
        v150[8] = v151[8];
        uint64_t v152 = v145[7];
        uint64_t v153 = &a1[v152];
        uint64_t v154 = &a2[v152];
        *(void *)uint64_t v153 = *(void *)v154;
        *((_WORD *)v153 + 4) = *((_WORD *)v154 + 4);
        swift_storeEnumTagMultiPayload();
        break;
      case 0xBu:
        uint64_t v155 = sub_2372A4780();
        char v156 = *(void (**)(char *, char *, uint64_t))(*(void *)(v155 - 8) + 32);
        v156(a1, a2, v155);
        uint64_t v157 = *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
        uint64_t v158 = &a1[v157];
        uint64_t v159 = &a2[v157];
        uint64_t v160 = type metadata accessor for NotificationState(0);
        uint64_t v161 = *(unsigned int (***)(const void *, uint64_t, uint64_t))(v160 - 8);
        if (v161[6](v159, 1, v160))
        {
          uint64_t v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
          memcpy(v158, v159, *(void *)(*(void *)(v162 - 8) + 64));
        }
        else
        {
          __dstb = v161;
          v156(v158, v159, v155);
          uint64_t v241 = *(int *)(v160 + 20);
          v242 = &v158[v241];
          v243 = &v159[v241];
          *(void *)v242 = *(void *)v243;
          v242[8] = v243[8];
          v319 = (int *)v160;
          uint64_t v322 = v158;
          uint64_t v244 = *(int *)(v160 + 24);
          uint64_t v245 = &v158[v244];
          v310 = v156;
          v246 = &v159[v244];
          uint64_t v247 = v155;
          uint64_t v248 = (int *)type metadata accessor for LitmusInfo(0);
          uint64_t v249 = *((void *)v248 - 1);
          uint64_t v309 = v247;
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v249 + 48))(v246, 1, v248))
          {
            uint64_t v250 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
            memcpy(v245, v246, *(void *)(*(void *)(v250 - 8) + 64));
          }
          else
          {
            v310(v245, v246, v247);
            uint64_t v282 = v248[5];
            v283 = &v245[v282];
            v284 = &v246[v282];
            *(_DWORD *)v283 = *(_DWORD *)v284;
            v283[4] = v284[4];
            uint64_t v285 = v248[6];
            uint64_t v286 = &v245[v285];
            v287 = &v246[v285];
            *(_DWORD *)uint64_t v286 = *(_DWORD *)v287;
            v286[4] = v287[4];
            uint64_t v288 = v248[7];
            char v289 = &v245[v288];
            uint64_t v290 = &v246[v288];
            *(_DWORD *)char v289 = *(_DWORD *)v290;
            v289[4] = v290[4];
            uint64_t v291 = v248[8];
            v292 = &v245[v291];
            __int16 v293 = &v246[v291];
            *(void *)v292 = *(void *)v293;
            *((_WORD *)v292 + 4) = *((_WORD *)v293 + 4);
            (*(void (**)(char *, void, uint64_t, int *))(v249 + 56))(v245, 0, 1, v248);
          }
          uint64_t v294 = v319[7];
          v295 = &v322[v294];
          v296 = &v159[v294];
          *(void *)v295 = *(void *)v296;
          v295[8] = v296[8];
          uint64_t v297 = v319[8];
          uint64_t v298 = &v322[v297];
          v299 = &v159[v297];
          v298[8] = v299[8];
          *(void *)uint64_t v298 = *(void *)v299;
          uint64_t v300 = v319[9];
          uint64_t v313 = &v322[v300];
          v315 = v159;
          v301 = &v159[v300];
          uint64_t v302 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v303 = *((void *)v302 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v303 + 48))(v301, 1, v302))
          {
            uint64_t v304 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v313, v301, *(void *)(*(void *)(v304 - 8) + 64));
          }
          else
          {
            v310(v313, v301, v309);
            *(_OWORD *)&v313[v302[5]] = *(_OWORD *)&v301[v302[5]];
            *(_OWORD *)&v313[v302[6]] = *(_OWORD *)&v301[v302[6]];
            *(_OWORD *)&v313[v302[7]] = *(_OWORD *)&v301[v302[7]];
            *(_OWORD *)&v313[v302[8]] = *(_OWORD *)&v301[v302[8]];
            (*(void (**)(char *, void, uint64_t, int *))(v303 + 56))(v313, 0, 1, v302);
          }
          *(_OWORD *)&v322[v319[10]] = *(_OWORD *)&v315[v319[10]];
          uint64_t v305 = v319[11];
          v306 = &v322[v305];
          char v307 = &v315[v305];
          v306[8] = v307[8];
          *(void *)v306 = *(void *)v307;
          ((void (*)(char *, void, uint64_t, int *))__dstb[7])(v322, 0, 1, v319);
        }
LABEL_54:
        swift_storeEnumTagMultiPayload();
        break;
      case 0xDu:
        uint64_t v163 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v163 - 8) + 32))(a1, a2, v163);
        uint64_t v164 = *(int *)(type metadata accessor for MobileAssetDownloadRequest(0) + 20);
        uint64_t v165 = &a1[v164];
        char v166 = &a2[v164];
        *(void *)uint64_t v165 = *(void *)v166;
        v165[8] = v166[8];
        swift_storeEnumTagMultiPayload();
        break;
      case 0xEu:
        *(void *)a1 = *(void *)a2;
        uint64_t v167 = (int *)type metadata accessor for ShadowEvaluationRequest(0);
        uint64_t v168 = v167[5];
        uint64_t v169 = &a1[v168];
        uint64_t v170 = &a2[v168];
        uint64_t v171 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v171 - 8) + 32))(v169, v170, v171);
        uint64_t v172 = v167[6];
        uint64_t v173 = &a1[v172];
        uint64_t v174 = &a2[v172];
        *(void *)uint64_t v173 = *(void *)v174;
        v173[8] = v174[8];
        uint64_t v175 = v167[7];
        uint64_t v176 = &a1[v175];
        uint64_t v177 = &a2[v175];
        *(void *)uint64_t v176 = *(void *)v177;
        v176[8] = v177[8];
        uint64_t v178 = v167[8];
        uint64_t v179 = &a1[v178];
        uint64_t v180 = &a2[v178];
        *(void *)uint64_t v179 = *(void *)v180;
        v179[8] = v180[8];
        a1[v167[9]] = a2[v167[9]];
        uint64_t v181 = v167[10];
        char v182 = &a1[v181];
        uint64_t v183 = &a2[v181];
        *(void *)char v182 = *(void *)v183;
        v182[8] = v183[8];
        a1[v167[11]] = a2[v167[11]];
        swift_storeEnumTagMultiPayload();
        break;
      case 0x10u:
        uint64_t v185 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v185 - 8) + 32))(a1, a2, v185);
        uint64_t v186 = *(int *)(type metadata accessor for DeleteDaemonStateRequest(0) + 20);
        uint64_t v187 = &a1[v186];
        uint64_t v188 = &a2[v186];
        *(void *)uint64_t v187 = *(void *)v188;
        *((_WORD *)v187 + 4) = *((_WORD *)v188 + 4);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        uint64_t v14 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2, v14);
        uint64_t v15 = type metadata accessor for PingRequest(0);
        *(_OWORD *)&a1[*(int *)(v15 + 20)] = *(_OWORD *)&a2[*(int *)(v15 + 20)];
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
LABEL_58:
  uint64_t v277 = *(int *)(a3 + 20);
  uint64_t v278 = &a1[v277];
  v279 = &a2[v277];
  uint64_t v280 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v280 - 8) + 40))(v278, v279, v280);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionClientRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2372912CC);
}

uint64_t sub_2372912CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_147Tm(a1, a2, a3, &qword_26AECC870);
}

uint64_t storeEnumTagSinglePayload for SubscriptionClientRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2372912EC);
}

uint64_t sub_2372912EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_148Tm(a1, a2, a3, a4, &qword_26AECC870);
}

void sub_2372912F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

char *initializeBufferWithCopyOfBuffer for SubscriptionClientRequest.OneOf_Type(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v12 = sub_2372A4780();
        uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
        v13(a1, a2, v12);
        uint64_t v14 = (int *)type metadata accessor for NewOfferRequest(0);
        uint64_t v15 = v14[5];
        uint64_t v16 = &a1[v15];
        uint64_t v17 = &a2[v15];
        *(void *)uint64_t v16 = *(void *)v17;
        v16[8] = v17[8];
        uint64_t v18 = v14[6];
        uint64_t v19 = &a1[v18];
        uint64_t v20 = &a2[v18];
        uint64_t v21 = (int *)type metadata accessor for LitmusInfo(0);
        uint64_t v22 = *((void *)v21 - 1);
        uint64_t v206 = v12;
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v22 + 48))(v20, 1, v21))
        {
          uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
          memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
        }
        else
        {
          v13(v19, v20, v12);
          uint64_t v111 = v21[5];
          uint64_t v112 = &v19[v111];
          uint64_t v113 = &v20[v111];
          *(_DWORD *)uint64_t v112 = *(_DWORD *)v113;
          v112[4] = v113[4];
          uint64_t v114 = v21[6];
          uint64_t v115 = &v19[v114];
          uint64_t v116 = &v20[v114];
          *(_DWORD *)uint64_t v115 = *(_DWORD *)v116;
          v115[4] = v116[4];
          uint64_t v117 = v21[7];
          uint64_t v118 = &v19[v117];
          uint64_t v119 = &v20[v117];
          *(_DWORD *)uint64_t v118 = *(_DWORD *)v119;
          v118[4] = v119[4];
          uint64_t v120 = v21[8];
          uint64_t v121 = &v19[v120];
          __int16 v122 = &v20[v120];
          *(void *)uint64_t v121 = *(void *)v122;
          *((_WORD *)v121 + 4) = *((_WORD *)v122 + 4);
          (*(void (**)(char *, void, uint64_t, int *))(v22 + 56))(v19, 0, 1, v21);
        }
        uint64_t v123 = v14[7];
        uint64_t v124 = &a1[v123];
        v125 = &a2[v123];
        *(void *)uint64_t v124 = *(void *)v125;
        v124[8] = v125[8];
        uint64_t v126 = v14[8];
        uint64_t v127 = &a1[v126];
        uint64_t v128 = &a2[v126];
        uint64_t v129 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v130 = *((void *)v129 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v130 + 48))(v128, 1, v129))
        {
          uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v127, v128, *(void *)(*(void *)(v131 - 8) + 64));
        }
        else
        {
          v13(v127, v128, v206);
          uint64_t v140 = v129[5];
          uint64_t v141 = &v127[v140];
          uint64_t v142 = &v128[v140];
          uint64_t v143 = *((void *)v142 + 1);
          *(void *)uint64_t v141 = *(void *)v142;
          *((void *)v141 + 1) = v143;
          uint64_t v144 = v129[6];
          uint64_t v145 = &v127[v144];
          uint64_t v146 = &v128[v144];
          uint64_t v147 = *((void *)v146 + 1);
          *(void *)uint64_t v145 = *(void *)v146;
          *((void *)v145 + 1) = v147;
          uint64_t v148 = v129[7];
          uint64_t v149 = &v127[v148];
          uint64_t v150 = &v128[v148];
          uint64_t v151 = *((void *)v150 + 1);
          *(void *)uint64_t v149 = *(void *)v150;
          *((void *)v149 + 1) = v151;
          uint64_t v152 = v129[8];
          uint64_t v153 = &v127[v152];
          uint64_t v154 = &v128[v152];
          uint64_t v155 = *((void *)v154 + 1);
          *(void *)uint64_t v153 = *(void *)v154;
          *((void *)v153 + 1) = v155;
          char v156 = *(void (**)(char *, void, uint64_t, int *))(v130 + 56);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v156(v127, 0, 1, v129);
        }
        break;
      case 2u:
        uint64_t v24 = *((void *)a2 + 1);
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = v24;
        uint64_t v25 = type metadata accessor for FeaturesRequest(0);
        uint64_t v26 = *(int *)(v25 + 24);
        uint64_t v210 = &a1[v26];
        uint64_t v27 = &a2[v26];
        uint64_t v28 = sub_2372A4780();
        uint64_t v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v29(v210, v27, v28);
        uint64_t v30 = *(int *)(v25 + 28);
        uint64_t v31 = &a1[v30];
        uint64_t v32 = &a2[v30];
        *(void *)uint64_t v31 = *(void *)v32;
        v31[8] = v32[8];
        break;
      case 3u:
      case 5u:
      case 8u:
      case 0xCu:
      case 0xFu:
        uint64_t v106 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v106 - 8) + 16))(a1, a2, v106);
        break;
      case 4u:
        uint64_t v33 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(a1, a2, v33);
        uint64_t v34 = (int *)type metadata accessor for DataRequest(0);
        uint64_t v35 = v34[5];
        uint64_t v36 = &a1[v35];
        uint64_t v37 = &a2[v35];
        *(void *)uint64_t v36 = *(void *)v37;
        v36[8] = v37[8];
        uint64_t v38 = v34[6];
        uint64_t v39 = &a1[v38];
        uint64_t v40 = &a2[v38];
        *(void *)uint64_t v39 = *(void *)v40;
        v39[8] = v40[8];
        uint64_t v41 = v34[7];
        uint64_t v42 = &a1[v41];
        uint64_t v43 = &a2[v41];
        v42[8] = v43[8];
        *(void *)uint64_t v42 = *(void *)v43;
        a1[v34[8]] = a2[v34[8]];
        uint64_t v44 = v34[9];
        uint64_t v45 = &a1[v44];
        uint64_t v46 = &a2[v44];
        *(void *)uint64_t v45 = *(void *)v46;
        v45[8] = v46[8];
        a1[v34[10]] = a2[v34[10]];
        a1[v34[11]] = a2[v34[11]];
        break;
      case 6u:
        uint64_t v47 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 16))(a1, a2, v47);
        uint64_t v48 = type metadata accessor for SetCliActivityRequest(0);
        uint64_t v49 = *(int *)(v48 + 20);
        uint64_t v50 = &a1[v49];
        uint64_t v51 = &a2[v49];
        *(void *)uint64_t v50 = *(void *)v51;
        v50[8] = v51[8];
        uint64_t v52 = *(int *)(v48 + 24);
        uint64_t v53 = &a1[v52];
        uint64_t v54 = &a2[v52];
        uint64_t v55 = *((void *)v54 + 1);
        *(void *)uint64_t v53 = *(void *)v54;
        *((void *)v53 + 1) = v55;
        swift_bridgeObjectRetain();
        break;
      case 7u:
        uint64_t v56 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16))(a1, a2, v56);
        uint64_t v57 = type metadata accessor for DisplayDelayedOfferRequest(0);
        uint64_t v58 = *(int *)(v57 + 20);
        uint64_t v59 = &a1[v58];
        uint64_t v60 = (uint64_t *)&a2[v58];
        uint64_t v62 = *v60;
        uint64_t v61 = v60[1];
        *(void *)uint64_t v59 = v62;
        *((void *)v59 + 1) = v61;
        a1[*(int *)(v57 + 24)] = a2[*(int *)(v57 + 24)];
        swift_bridgeObjectRetain();
        break;
      case 9u:
        uint64_t v63 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 16))(a1, a2, v63);
        uint64_t v64 = (int *)type metadata accessor for ActivityClearRequest(0);
        a1[v64[5]] = a2[v64[5]];
        a1[v64[6]] = a2[v64[6]];
        a1[v64[7]] = a2[v64[7]];
        break;
      case 0xAu:
        uint64_t v65 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v65 - 8) + 16))(a1, a2, v65);
        BiomeStreamRequest = (int *)type metadata accessor for GetBiomeStreamRequest(0);
        uint64_t v67 = BiomeStreamRequest[5];
        uint64_t v68 = &a1[v67];
        uint64_t v69 = &a2[v67];
        *(void *)uint64_t v68 = *(void *)v69;
        v68[8] = v69[8];
        uint64_t v70 = BiomeStreamRequest[6];
        uint64_t v71 = &a1[v70];
        uint64_t v72 = &a2[v70];
        *(void *)uint64_t v71 = *(void *)v72;
        v71[8] = v72[8];
        uint64_t v73 = BiomeStreamRequest[7];
        uint64_t v74 = &a1[v73];
        uint64_t v75 = &a2[v73];
        *(void *)uint64_t v74 = *(void *)v75;
        *((_WORD *)v74 + 4) = *((_WORD *)v75 + 4);
        break;
      case 0xBu:
        uint64_t v76 = sub_2372A4780();
        uint64_t v77 = *(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 16);
        v77(a1, a2, v76);
        uint64_t v78 = *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
        uint64_t v79 = &a1[v78];
        uint64_t v80 = &a2[v78];
        uint64_t v81 = (int *)type metadata accessor for NotificationState(0);
        uint64_t v82 = *((void *)v81 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v82 + 48))(v80, 1, v81))
        {
          uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
          memcpy(v79, v80, *(void *)(*(void *)(v83 - 8) + 64));
        }
        else
        {
          uint64_t v211 = v82;
          v77(v79, v80, v76);
          uint64_t v132 = v81[5];
          uint64_t v133 = &v79[v132];
          uint64_t v134 = &v80[v132];
          *(void *)uint64_t v133 = *(void *)v134;
          v133[8] = v134[8];
          uint64_t v135 = v81[6];
          uint64_t v207 = v77;
          __dst = &v79[v135];
          uint64_t v136 = &v80[v135];
          uint64_t v137 = (int *)type metadata accessor for LitmusInfo(0);
          uint64_t v138 = *((void *)v137 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v138 + 48))(v136, 1, v137))
          {
            uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
            memcpy(__dst, v136, *(void *)(*(void *)(v139 - 8) + 64));
          }
          else
          {
            v207(__dst, v136, v76);
            uint64_t v157 = v137[5];
            uint64_t v158 = &__dst[v157];
            uint64_t v159 = &v136[v157];
            *(_DWORD *)uint64_t v158 = *(_DWORD *)v159;
            v158[4] = v159[4];
            uint64_t v160 = v137[6];
            uint64_t v161 = &__dst[v160];
            uint64_t v162 = &v136[v160];
            *(_DWORD *)uint64_t v161 = *(_DWORD *)v162;
            v161[4] = v162[4];
            uint64_t v163 = v137[7];
            uint64_t v164 = &__dst[v163];
            uint64_t v165 = &v136[v163];
            *(_DWORD *)uint64_t v164 = *(_DWORD *)v165;
            v164[4] = v165[4];
            uint64_t v166 = v137[8];
            uint64_t v167 = &__dst[v166];
            uint64_t v168 = &v136[v166];
            *(void *)uint64_t v167 = *(void *)v168;
            *((_WORD *)v167 + 4) = *((_WORD *)v168 + 4);
            (*(void (**)(char *, void, uint64_t, int *))(v138 + 56))(__dst, 0, 1, v137);
          }
          uint64_t v169 = v81[7];
          uint64_t v170 = &v79[v169];
          uint64_t v171 = &v80[v169];
          *(void *)uint64_t v170 = *(void *)v171;
          v170[8] = v171[8];
          uint64_t v172 = v81[8];
          uint64_t v173 = &v79[v172];
          uint64_t v174 = &v80[v172];
          v173[8] = v174[8];
          *(void *)uint64_t v173 = *(void *)v174;
          uint64_t v175 = v81[9];
          uint64_t v176 = &v79[v175];
          uint64_t v177 = &v80[v175];
          uint64_t v178 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v179 = *((void *)v178 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v179 + 48))(v177, 1, v178))
          {
            uint64_t v180 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v176, v177, *(void *)(*(void *)(v180 - 8) + 64));
          }
          else
          {
            v207(v176, v177, v76);
            uint64_t v181 = v178[5];
            char v182 = &v176[v181];
            uint64_t v183 = &v177[v181];
            uint64_t v184 = *((void *)v183 + 1);
            *(void *)char v182 = *(void *)v183;
            *((void *)v182 + 1) = v184;
            uint64_t v185 = v178[6];
            uint64_t v186 = &v176[v185];
            uint64_t v187 = &v177[v185];
            uint64_t v208 = *((void *)v187 + 1);
            *(void *)uint64_t v186 = *(void *)v187;
            *((void *)v186 + 1) = v208;
            uint64_t v188 = v178[7];
            uint64_t v189 = &v176[v188];
            __int16 v190 = &v177[v188];
            uint64_t v191 = *((void *)v190 + 1);
            *(void *)uint64_t v189 = *(void *)v190;
            *((void *)v189 + 1) = v191;
            uint64_t v192 = v178[8];
            uint64_t v193 = &v176[v192];
            uint64_t v194 = &v177[v192];
            uint64_t v195 = *((void *)v194 + 1);
            *(void *)uint64_t v193 = *(void *)v194;
            *((void *)v193 + 1) = v195;
            uint64_t v196 = *(void (**)(char *, void, uint64_t, int *))(v179 + 56);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v196(v176, 0, 1, v178);
          }
          uint64_t v197 = v81[10];
          uint64_t v198 = &v79[v197];
          uint64_t v199 = &v80[v197];
          uint64_t v200 = *((void *)v199 + 1);
          *(void *)uint64_t v198 = *(void *)v199;
          *((void *)v198 + 1) = v200;
          uint64_t v201 = v81[11];
          uint64_t v202 = &v79[v201];
          char v203 = &v80[v201];
          v202[8] = v203[8];
          *(void *)uint64_t v202 = *(void *)v203;
          uint64_t v204 = *(void (**)(char *, void, uint64_t, int *))(v211 + 56);
          swift_bridgeObjectRetain();
          v204(v79, 0, 1, v81);
        }
        break;
      case 0xDu:
        uint64_t v84 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v84 - 8) + 16))(a1, a2, v84);
        uint64_t v85 = *(int *)(type metadata accessor for MobileAssetDownloadRequest(0) + 20);
        uint64_t v86 = &a1[v85];
        uint64_t v87 = &a2[v85];
        *(void *)uint64_t v86 = *(void *)v87;
        v86[8] = v87[8];
        break;
      case 0xEu:
        *(void *)a1 = *(void *)a2;
        uint64_t v88 = (int *)type metadata accessor for ShadowEvaluationRequest(0);
        uint64_t v89 = v88[5];
        uint64_t v90 = &a1[v89];
        uint64_t v91 = &a2[v89];
        uint64_t v92 = sub_2372A4780();
        uint64_t v93 = *(void (**)(char *, char *, uint64_t))(*(void *)(v92 - 8) + 16);
        swift_bridgeObjectRetain();
        v93(v90, v91, v92);
        uint64_t v94 = v88[6];
        uint64_t v95 = &a1[v94];
        uint64_t v96 = &a2[v94];
        *(void *)uint64_t v95 = *(void *)v96;
        v95[8] = v96[8];
        uint64_t v97 = v88[7];
        uint64_t v98 = &a1[v97];
        uint64_t v99 = &a2[v97];
        *(void *)uint64_t v98 = *(void *)v99;
        v98[8] = v99[8];
        uint64_t v100 = v88[8];
        uint64_t v101 = &a1[v100];
        uint64_t v102 = &a2[v100];
        *(void *)uint64_t v101 = *(void *)v102;
        v101[8] = v102[8];
        a1[v88[9]] = a2[v88[9]];
        uint64_t v103 = v88[10];
        uint64_t v104 = &a1[v103];
        uint64_t v105 = &a2[v103];
        *(void *)uint64_t v104 = *(void *)v105;
        v104[8] = v105[8];
        a1[v88[11]] = a2[v88[11]];
        break;
      case 0x10u:
        uint64_t v107 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v107 - 8) + 16))(a1, a2, v107);
        uint64_t v108 = *(int *)(type metadata accessor for DeleteDaemonStateRequest(0) + 20);
        uint64_t v109 = &a1[v108];
        uint64_t v110 = &a2[v108];
        *(void *)uint64_t v109 = *(void *)v110;
        *((_WORD *)v109 + 4) = *((_WORD *)v110 + 4);
        break;
      default:
        uint64_t v6 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        uint64_t v7 = *(int *)(type metadata accessor for PingRequest(0) + 20);
        uint64_t v8 = &a1[v7];
        int v9 = &a2[v7];
        uint64_t v10 = *((void *)v9 + 1);
        *(void *)uint64_t v8 = *(void *)v9;
        *((void *)v8 + 1) = v10;
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SubscriptionClientRequest.OneOf_Type(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v5 = sub_2372A4780();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
      type metadata accessor for PingRequest(0);
      goto LABEL_13;
    case 1:
      uint64_t v6 = sub_2372A4780();
      uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
      v7(a1, v6);
      uint64_t v8 = type metadata accessor for NewOfferRequest(0);
      uint64_t v9 = a1 + *(int *)(v8 + 24);
      uint64_t v10 = type metadata accessor for LitmusInfo(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10)) {
        v7(v9, v6);
      }
      uint64_t v11 = a1 + *(int *)(v8 + 32);
      uint64_t v12 = type metadata accessor for QuotaServerState(0);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v11, 1, v12);
      if (result) {
        return result;
      }
      v7(v11, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_13;
    case 2:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = *(int *)(type metadata accessor for FeaturesRequest(0) + 24);
      goto LABEL_19;
    case 3:
    case 4:
    case 5:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 15:
    case 16:
      goto LABEL_2;
    case 6:
      uint64_t v14 = sub_2372A4780();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
      type metadata accessor for SetCliActivityRequest(0);
      goto LABEL_13;
    case 7:
      uint64_t v15 = sub_2372A4780();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a1, v15);
      type metadata accessor for DisplayDelayedOfferRequest(0);
      goto LABEL_13;
    case 11:
      uint64_t v16 = sub_2372A4780();
      uint64_t v17 = *(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8);
      v17(a1, v16);
      uint64_t v18 = a1 + *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
      uint64_t v19 = type metadata accessor for NotificationState(0);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v18, 1, v19);
      if (result) {
        return result;
      }
      v17(v18, v16);
      uint64_t v20 = v18 + *(int *)(v19 + 24);
      uint64_t v21 = type metadata accessor for LitmusInfo(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48))(v20, 1, v21)) {
        v17(v20, v16);
      }
      uint64_t v22 = v18 + *(int *)(v19 + 36);
      uint64_t v23 = type metadata accessor for QuotaServerState(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48))(v22, 1, v23))
      {
        v17(v22, v16);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
LABEL_13:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 14:
      swift_bridgeObjectRelease();
      uint64_t v13 = *(int *)(type metadata accessor for ShadowEvaluationRequest(0) + 20);
LABEL_19:
      a1 += v13;
LABEL_2:
      uint64_t v3 = sub_2372A4780();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

char *initializeWithCopy for SubscriptionClientRequest.OneOf_Type(char *a1, char *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v9 = sub_2372A4780();
      uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
      v10(a1, a2, v9);
      uint64_t v11 = (int *)type metadata accessor for NewOfferRequest(0);
      uint64_t v12 = v11[5];
      uint64_t v13 = &a1[v12];
      uint64_t v14 = &a2[v12];
      *(void *)uint64_t v13 = *(void *)v14;
      v13[8] = v14[8];
      uint64_t v15 = v11[6];
      uint64_t v16 = &a1[v15];
      uint64_t v17 = &a2[v15];
      uint64_t v18 = (int *)type metadata accessor for LitmusInfo(0);
      uint64_t v19 = *((void *)v18 - 1);
      uint64_t v203 = v9;
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v19 + 48))(v17, 1, v18))
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
        memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        v10(v16, v17, v9);
        uint64_t v108 = v18[5];
        uint64_t v109 = &v16[v108];
        uint64_t v110 = &v17[v108];
        *(_DWORD *)uint64_t v109 = *(_DWORD *)v110;
        v109[4] = v110[4];
        uint64_t v111 = v18[6];
        uint64_t v112 = &v16[v111];
        uint64_t v113 = &v17[v111];
        *(_DWORD *)uint64_t v112 = *(_DWORD *)v113;
        v112[4] = v113[4];
        uint64_t v114 = v18[7];
        uint64_t v115 = &v16[v114];
        uint64_t v116 = &v17[v114];
        *(_DWORD *)uint64_t v115 = *(_DWORD *)v116;
        v115[4] = v116[4];
        uint64_t v117 = v18[8];
        uint64_t v118 = &v16[v117];
        uint64_t v119 = &v17[v117];
        *(void *)uint64_t v118 = *(void *)v119;
        *((_WORD *)v118 + 4) = *((_WORD *)v119 + 4);
        (*(void (**)(char *, void, uint64_t, int *))(v19 + 56))(v16, 0, 1, v18);
      }
      uint64_t v120 = v11[7];
      uint64_t v121 = &a1[v120];
      __int16 v122 = &a2[v120];
      *(void *)uint64_t v121 = *(void *)v122;
      v121[8] = v122[8];
      uint64_t v123 = v11[8];
      uint64_t v124 = &a1[v123];
      v125 = &a2[v123];
      uint64_t v126 = (int *)type metadata accessor for QuotaServerState(0);
      uint64_t v127 = *((void *)v126 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v127 + 48))(v125, 1, v126))
      {
        uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
        memcpy(v124, v125, *(void *)(*(void *)(v128 - 8) + 64));
      }
      else
      {
        v10(v124, v125, v203);
        uint64_t v137 = v126[5];
        uint64_t v138 = &v124[v137];
        uint64_t v139 = &v125[v137];
        uint64_t v140 = *((void *)v139 + 1);
        *(void *)uint64_t v138 = *(void *)v139;
        *((void *)v138 + 1) = v140;
        uint64_t v141 = v126[6];
        uint64_t v142 = &v124[v141];
        uint64_t v143 = &v125[v141];
        uint64_t v144 = *((void *)v143 + 1);
        *(void *)uint64_t v142 = *(void *)v143;
        *((void *)v142 + 1) = v144;
        uint64_t v145 = v126[7];
        uint64_t v146 = &v124[v145];
        uint64_t v147 = &v125[v145];
        uint64_t v148 = *((void *)v147 + 1);
        *(void *)uint64_t v146 = *(void *)v147;
        *((void *)v146 + 1) = v148;
        uint64_t v149 = v126[8];
        uint64_t v150 = &v124[v149];
        uint64_t v151 = &v125[v149];
        uint64_t v152 = *((void *)v151 + 1);
        *(void *)uint64_t v150 = *(void *)v151;
        *((void *)v150 + 1) = v152;
        uint64_t v153 = *(void (**)(char *, void, uint64_t, int *))(v127 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v153(v124, 0, 1, v126);
      }
      break;
    case 2u:
      uint64_t v21 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v21;
      uint64_t v22 = type metadata accessor for FeaturesRequest(0);
      uint64_t v23 = *(int *)(v22 + 24);
      uint64_t v207 = &a1[v23];
      uint64_t v24 = &a2[v23];
      uint64_t v25 = sub_2372A4780();
      uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v26(v207, v24, v25);
      uint64_t v27 = *(int *)(v22 + 28);
      uint64_t v28 = &a1[v27];
      uint64_t v29 = &a2[v27];
      *(void *)uint64_t v28 = *(void *)v29;
      v28[8] = v29[8];
      break;
    case 3u:
    case 5u:
    case 8u:
    case 0xCu:
    case 0xFu:
      uint64_t v103 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v103 - 8) + 16))(a1, a2, v103);
      break;
    case 4u:
      uint64_t v30 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(a1, a2, v30);
      uint64_t v31 = (int *)type metadata accessor for DataRequest(0);
      uint64_t v32 = v31[5];
      uint64_t v33 = &a1[v32];
      uint64_t v34 = &a2[v32];
      *(void *)uint64_t v33 = *(void *)v34;
      v33[8] = v34[8];
      uint64_t v35 = v31[6];
      uint64_t v36 = &a1[v35];
      uint64_t v37 = &a2[v35];
      *(void *)uint64_t v36 = *(void *)v37;
      v36[8] = v37[8];
      uint64_t v38 = v31[7];
      uint64_t v39 = &a1[v38];
      uint64_t v40 = &a2[v38];
      v39[8] = v40[8];
      *(void *)uint64_t v39 = *(void *)v40;
      a1[v31[8]] = a2[v31[8]];
      uint64_t v41 = v31[9];
      uint64_t v42 = &a1[v41];
      uint64_t v43 = &a2[v41];
      *(void *)uint64_t v42 = *(void *)v43;
      v42[8] = v43[8];
      a1[v31[10]] = a2[v31[10]];
      a1[v31[11]] = a2[v31[11]];
      break;
    case 6u:
      uint64_t v44 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16))(a1, a2, v44);
      uint64_t v45 = type metadata accessor for SetCliActivityRequest(0);
      uint64_t v46 = *(int *)(v45 + 20);
      uint64_t v47 = &a1[v46];
      uint64_t v48 = &a2[v46];
      *(void *)uint64_t v47 = *(void *)v48;
      v47[8] = v48[8];
      uint64_t v49 = *(int *)(v45 + 24);
      uint64_t v50 = &a1[v49];
      uint64_t v51 = &a2[v49];
      uint64_t v52 = *((void *)v51 + 1);
      *(void *)uint64_t v50 = *(void *)v51;
      *((void *)v50 + 1) = v52;
      swift_bridgeObjectRetain();
      break;
    case 7u:
      uint64_t v53 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 16))(a1, a2, v53);
      uint64_t v54 = type metadata accessor for DisplayDelayedOfferRequest(0);
      uint64_t v55 = *(int *)(v54 + 20);
      uint64_t v56 = &a1[v55];
      uint64_t v57 = (uint64_t *)&a2[v55];
      uint64_t v59 = *v57;
      uint64_t v58 = v57[1];
      *(void *)uint64_t v56 = v59;
      *((void *)v56 + 1) = v58;
      a1[*(int *)(v54 + 24)] = a2[*(int *)(v54 + 24)];
      swift_bridgeObjectRetain();
      break;
    case 9u:
      uint64_t v60 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 16))(a1, a2, v60);
      uint64_t v61 = (int *)type metadata accessor for ActivityClearRequest(0);
      a1[v61[5]] = a2[v61[5]];
      a1[v61[6]] = a2[v61[6]];
      a1[v61[7]] = a2[v61[7]];
      break;
    case 0xAu:
      uint64_t v62 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 16))(a1, a2, v62);
      BiomeStreamRequest = (int *)type metadata accessor for GetBiomeStreamRequest(0);
      uint64_t v64 = BiomeStreamRequest[5];
      uint64_t v65 = &a1[v64];
      uint64_t v66 = &a2[v64];
      *(void *)uint64_t v65 = *(void *)v66;
      v65[8] = v66[8];
      uint64_t v67 = BiomeStreamRequest[6];
      uint64_t v68 = &a1[v67];
      uint64_t v69 = &a2[v67];
      *(void *)uint64_t v68 = *(void *)v69;
      v68[8] = v69[8];
      uint64_t v70 = BiomeStreamRequest[7];
      uint64_t v71 = &a1[v70];
      uint64_t v72 = &a2[v70];
      *(void *)uint64_t v71 = *(void *)v72;
      *((_WORD *)v71 + 4) = *((_WORD *)v72 + 4);
      break;
    case 0xBu:
      uint64_t v73 = sub_2372A4780();
      uint64_t v74 = *(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 16);
      v74(a1, a2, v73);
      uint64_t v75 = *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
      uint64_t v76 = &a1[v75];
      uint64_t v77 = &a2[v75];
      uint64_t v78 = (int *)type metadata accessor for NotificationState(0);
      uint64_t v79 = *((void *)v78 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v79 + 48))(v77, 1, v78))
      {
        uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
        memcpy(v76, v77, *(void *)(*(void *)(v80 - 8) + 64));
      }
      else
      {
        uint64_t v208 = v79;
        v74(v76, v77, v73);
        uint64_t v129 = v78[5];
        uint64_t v130 = &v76[v129];
        uint64_t v131 = &v77[v129];
        *(void *)uint64_t v130 = *(void *)v131;
        v130[8] = v131[8];
        uint64_t v132 = v78[6];
        uint64_t v204 = v74;
        __dst = &v76[v132];
        uint64_t v133 = &v77[v132];
        uint64_t v134 = (int *)type metadata accessor for LitmusInfo(0);
        uint64_t v135 = *((void *)v134 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v135 + 48))(v133, 1, v134))
        {
          uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
          memcpy(__dst, v133, *(void *)(*(void *)(v136 - 8) + 64));
        }
        else
        {
          v204(__dst, v133, v73);
          uint64_t v154 = v134[5];
          uint64_t v155 = &__dst[v154];
          char v156 = &v133[v154];
          *(_DWORD *)uint64_t v155 = *(_DWORD *)v156;
          v155[4] = v156[4];
          uint64_t v157 = v134[6];
          uint64_t v158 = &__dst[v157];
          uint64_t v159 = &v133[v157];
          *(_DWORD *)uint64_t v158 = *(_DWORD *)v159;
          v158[4] = v159[4];
          uint64_t v160 = v134[7];
          uint64_t v161 = &__dst[v160];
          uint64_t v162 = &v133[v160];
          *(_DWORD *)uint64_t v161 = *(_DWORD *)v162;
          v161[4] = v162[4];
          uint64_t v163 = v134[8];
          uint64_t v164 = &__dst[v163];
          uint64_t v165 = &v133[v163];
          *(void *)uint64_t v164 = *(void *)v165;
          *((_WORD *)v164 + 4) = *((_WORD *)v165 + 4);
          (*(void (**)(char *, void, uint64_t, int *))(v135 + 56))(__dst, 0, 1, v134);
        }
        uint64_t v166 = v78[7];
        uint64_t v167 = &v76[v166];
        uint64_t v168 = &v77[v166];
        *(void *)uint64_t v167 = *(void *)v168;
        v167[8] = v168[8];
        uint64_t v169 = v78[8];
        uint64_t v170 = &v76[v169];
        uint64_t v171 = &v77[v169];
        v170[8] = v171[8];
        *(void *)uint64_t v170 = *(void *)v171;
        uint64_t v172 = v78[9];
        uint64_t v173 = &v76[v172];
        uint64_t v174 = &v77[v172];
        uint64_t v175 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v176 = *((void *)v175 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v176 + 48))(v174, 1, v175))
        {
          uint64_t v177 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v173, v174, *(void *)(*(void *)(v177 - 8) + 64));
        }
        else
        {
          v204(v173, v174, v73);
          uint64_t v178 = v175[5];
          uint64_t v179 = &v173[v178];
          uint64_t v180 = &v174[v178];
          uint64_t v181 = *((void *)v180 + 1);
          *(void *)uint64_t v179 = *(void *)v180;
          *((void *)v179 + 1) = v181;
          uint64_t v182 = v175[6];
          uint64_t v183 = &v173[v182];
          uint64_t v184 = &v174[v182];
          uint64_t v205 = *((void *)v184 + 1);
          *(void *)uint64_t v183 = *(void *)v184;
          *((void *)v183 + 1) = v205;
          uint64_t v185 = v175[7];
          uint64_t v186 = &v173[v185];
          uint64_t v187 = &v174[v185];
          uint64_t v188 = *((void *)v187 + 1);
          *(void *)uint64_t v186 = *(void *)v187;
          *((void *)v186 + 1) = v188;
          uint64_t v189 = v175[8];
          __int16 v190 = &v173[v189];
          uint64_t v191 = &v174[v189];
          uint64_t v192 = *((void *)v191 + 1);
          *(void *)__int16 v190 = *(void *)v191;
          *((void *)v190 + 1) = v192;
          uint64_t v193 = *(void (**)(char *, void, uint64_t, int *))(v176 + 56);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v193(v173, 0, 1, v175);
        }
        uint64_t v194 = v78[10];
        uint64_t v195 = &v76[v194];
        uint64_t v196 = &v77[v194];
        uint64_t v197 = *((void *)v196 + 1);
        *(void *)uint64_t v195 = *(void *)v196;
        *((void *)v195 + 1) = v197;
        uint64_t v198 = v78[11];
        uint64_t v199 = &v76[v198];
        uint64_t v200 = &v77[v198];
        v199[8] = v200[8];
        *(void *)uint64_t v199 = *(void *)v200;
        uint64_t v201 = *(void (**)(char *, void, uint64_t, int *))(v208 + 56);
        swift_bridgeObjectRetain();
        v201(v76, 0, 1, v78);
      }
      break;
    case 0xDu:
      uint64_t v81 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v81 - 8) + 16))(a1, a2, v81);
      uint64_t v82 = *(int *)(type metadata accessor for MobileAssetDownloadRequest(0) + 20);
      uint64_t v83 = &a1[v82];
      uint64_t v84 = &a2[v82];
      *(void *)uint64_t v83 = *(void *)v84;
      v83[8] = v84[8];
      break;
    case 0xEu:
      *(void *)a1 = *(void *)a2;
      uint64_t v85 = (int *)type metadata accessor for ShadowEvaluationRequest(0);
      uint64_t v86 = v85[5];
      uint64_t v87 = &a1[v86];
      uint64_t v88 = &a2[v86];
      uint64_t v89 = sub_2372A4780();
      uint64_t v90 = *(void (**)(char *, char *, uint64_t))(*(void *)(v89 - 8) + 16);
      swift_bridgeObjectRetain();
      v90(v87, v88, v89);
      uint64_t v91 = v85[6];
      uint64_t v92 = &a1[v91];
      uint64_t v93 = &a2[v91];
      *(void *)uint64_t v92 = *(void *)v93;
      v92[8] = v93[8];
      uint64_t v94 = v85[7];
      uint64_t v95 = &a1[v94];
      uint64_t v96 = &a2[v94];
      *(void *)uint64_t v95 = *(void *)v96;
      v95[8] = v96[8];
      uint64_t v97 = v85[8];
      uint64_t v98 = &a1[v97];
      uint64_t v99 = &a2[v97];
      *(void *)uint64_t v98 = *(void *)v99;
      v98[8] = v99[8];
      a1[v85[9]] = a2[v85[9]];
      uint64_t v100 = v85[10];
      uint64_t v101 = &a1[v100];
      uint64_t v102 = &a2[v100];
      *(void *)uint64_t v101 = *(void *)v102;
      v101[8] = v102[8];
      a1[v85[11]] = a2[v85[11]];
      break;
    case 0x10u:
      uint64_t v104 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v104 - 8) + 16))(a1, a2, v104);
      uint64_t v105 = *(int *)(type metadata accessor for DeleteDaemonStateRequest(0) + 20);
      uint64_t v106 = &a1[v105];
      uint64_t v107 = &a2[v105];
      *(void *)uint64_t v106 = *(void *)v107;
      *((_WORD *)v106 + 4) = *((_WORD *)v107 + 4);
      break;
    default:
      uint64_t v4 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = *(int *)(type metadata accessor for PingRequest(0) + 20);
      uint64_t v6 = &a1[v5];
      uint64_t v7 = &a2[v5];
      uint64_t v8 = *((void *)v7 + 1);
      *(void *)uint64_t v6 = *(void *)v7;
      *((void *)v6 + 1) = v8;
      swift_bridgeObjectRetain();
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *assignWithCopy for SubscriptionClientRequest.OneOf_Type(char *a1, char *a2)
{
  if (a1 != a2)
  {
    sub_23723CDC0((uint64_t)a1, type metadata accessor for SubscriptionClientRequest.OneOf_Type);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v8 = sub_2372A4780();
        uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
        v9(a1, a2, v8);
        uint64_t v10 = (int *)type metadata accessor for NewOfferRequest(0);
        uint64_t v11 = v10[5];
        uint64_t v12 = &a1[v11];
        uint64_t v13 = &a2[v11];
        char v14 = v13[8];
        *(void *)uint64_t v12 = *(void *)v13;
        v12[8] = v14;
        uint64_t v15 = v10[6];
        uint64_t v16 = &a1[v15];
        uint64_t v17 = &a2[v15];
        uint64_t v18 = (int *)type metadata accessor for LitmusInfo(0);
        uint64_t v19 = *((void *)v18 - 1);
        uint64_t v217 = v8;
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v19 + 48))(v17, 1, v18))
        {
          uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
          memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
        }
        else
        {
          v9(v16, v17, v8);
          uint64_t v117 = v18[5];
          uint64_t v118 = &v16[v117];
          uint64_t v119 = &v17[v117];
          char v120 = v119[4];
          *(_DWORD *)uint64_t v118 = *(_DWORD *)v119;
          v118[4] = v120;
          uint64_t v121 = v18[6];
          __int16 v122 = &v16[v121];
          uint64_t v123 = &v17[v121];
          char v124 = v123[4];
          *(_DWORD *)__int16 v122 = *(_DWORD *)v123;
          v122[4] = v124;
          uint64_t v125 = v18[7];
          uint64_t v126 = &v16[v125];
          uint64_t v127 = &v17[v125];
          char v128 = v127[4];
          *(_DWORD *)uint64_t v126 = *(_DWORD *)v127;
          v126[4] = v128;
          uint64_t v129 = v18[8];
          uint64_t v130 = &v16[v129];
          uint64_t v131 = &v17[v129];
          __int16 v132 = *((_WORD *)v131 + 4);
          *(void *)uint64_t v130 = *(void *)v131;
          *((_WORD *)v130 + 4) = v132;
          (*(void (**)(char *, void, uint64_t, int *))(v19 + 56))(v16, 0, 1, v18);
        }
        uint64_t v133 = v10[7];
        uint64_t v134 = &a1[v133];
        uint64_t v135 = &a2[v133];
        uint64_t v136 = *(void *)v135;
        v134[8] = v135[8];
        *(void *)uint64_t v134 = v136;
        uint64_t v137 = v10[8];
        uint64_t v138 = &a1[v137];
        uint64_t v139 = &a2[v137];
        uint64_t v140 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v141 = *((void *)v140 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v141 + 48))(v139, 1, v140))
        {
          uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v138, v139, *(void *)(*(void *)(v142 - 8) + 64));
        }
        else
        {
          v9(v138, v139, v217);
          uint64_t v152 = v140[5];
          uint64_t v153 = &v138[v152];
          uint64_t v154 = &v139[v152];
          *(void *)uint64_t v153 = *(void *)v154;
          *((void *)v153 + 1) = *((void *)v154 + 1);
          uint64_t v155 = v140[6];
          char v156 = &v138[v155];
          uint64_t v157 = &v139[v155];
          *(void *)char v156 = *(void *)v157;
          *((void *)v156 + 1) = *((void *)v157 + 1);
          uint64_t v158 = v140[7];
          uint64_t v159 = &v138[v158];
          uint64_t v160 = &v139[v158];
          *(void *)uint64_t v159 = *(void *)v160;
          *((void *)v159 + 1) = *((void *)v160 + 1);
          uint64_t v161 = v140[8];
          uint64_t v162 = &v138[v161];
          uint64_t v163 = &v139[v161];
          *(void *)uint64_t v162 = *(void *)v163;
          *((void *)v162 + 1) = *((void *)v163 + 1);
          uint64_t v164 = *(void (**)(char *, void, uint64_t, int *))(v141 + 56);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v164(v138, 0, 1, v140);
        }
        break;
      case 2u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        uint64_t v21 = type metadata accessor for FeaturesRequest(0);
        uint64_t v22 = *(int *)(v21 + 24);
        __dsta = &a1[v22];
        uint64_t v23 = &a2[v22];
        uint64_t v24 = sub_2372A4780();
        uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v25(__dsta, v23, v24);
        uint64_t v26 = *(int *)(v21 + 28);
        uint64_t v27 = &a1[v26];
        uint64_t v28 = &a2[v26];
        char v29 = v28[8];
        *(void *)uint64_t v27 = *(void *)v28;
        v27[8] = v29;
        break;
      case 3u:
      case 5u:
      case 8u:
      case 0xCu:
      case 0xFu:
        uint64_t v111 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v111 - 8) + 16))(a1, a2, v111);
        break;
      case 4u:
        uint64_t v30 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(a1, a2, v30);
        uint64_t v31 = (int *)type metadata accessor for DataRequest(0);
        uint64_t v32 = v31[5];
        uint64_t v33 = &a1[v32];
        uint64_t v34 = &a2[v32];
        char v35 = v34[8];
        *(void *)uint64_t v33 = *(void *)v34;
        v33[8] = v35;
        uint64_t v36 = v31[6];
        uint64_t v37 = &a1[v36];
        uint64_t v38 = &a2[v36];
        char v39 = v38[8];
        *(void *)uint64_t v37 = *(void *)v38;
        v37[8] = v39;
        uint64_t v40 = v31[7];
        uint64_t v41 = &a1[v40];
        uint64_t v42 = &a2[v40];
        char v43 = v42[8];
        *(void *)uint64_t v41 = *(void *)v42;
        v41[8] = v43;
        a1[v31[8]] = a2[v31[8]];
        uint64_t v44 = v31[9];
        uint64_t v45 = &a1[v44];
        uint64_t v46 = &a2[v44];
        char v47 = v46[8];
        *(void *)uint64_t v45 = *(void *)v46;
        v45[8] = v47;
        a1[v31[10]] = a2[v31[10]];
        a1[v31[11]] = a2[v31[11]];
        break;
      case 6u:
        uint64_t v48 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(a1, a2, v48);
        uint64_t v49 = type metadata accessor for SetCliActivityRequest(0);
        uint64_t v50 = *(int *)(v49 + 20);
        uint64_t v51 = &a1[v50];
        uint64_t v52 = &a2[v50];
        char v53 = v52[8];
        *(void *)uint64_t v51 = *(void *)v52;
        v51[8] = v53;
        uint64_t v54 = *(int *)(v49 + 24);
        uint64_t v55 = &a1[v54];
        uint64_t v56 = &a2[v54];
        *(void *)uint64_t v55 = *(void *)v56;
        *((void *)v55 + 1) = *((void *)v56 + 1);
        swift_bridgeObjectRetain();
        break;
      case 7u:
        uint64_t v57 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16))(a1, a2, v57);
        uint64_t v58 = type metadata accessor for DisplayDelayedOfferRequest(0);
        uint64_t v59 = *(int *)(v58 + 20);
        uint64_t v60 = &a1[v59];
        uint64_t v61 = &a2[v59];
        *(void *)uint64_t v60 = *(void *)v61;
        *((void *)v60 + 1) = *((void *)v61 + 1);
        a1[*(int *)(v58 + 24)] = a2[*(int *)(v58 + 24)];
        swift_bridgeObjectRetain();
        break;
      case 9u:
        uint64_t v62 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 16))(a1, a2, v62);
        uint64_t v63 = (int *)type metadata accessor for ActivityClearRequest(0);
        a1[v63[5]] = a2[v63[5]];
        a1[v63[6]] = a2[v63[6]];
        a1[v63[7]] = a2[v63[7]];
        break;
      case 0xAu:
        uint64_t v64 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 16))(a1, a2, v64);
        BiomeStreamRequest = (int *)type metadata accessor for GetBiomeStreamRequest(0);
        uint64_t v66 = BiomeStreamRequest[5];
        uint64_t v67 = &a1[v66];
        uint64_t v68 = &a2[v66];
        char v69 = v68[8];
        *(void *)uint64_t v67 = *(void *)v68;
        v67[8] = v69;
        uint64_t v70 = BiomeStreamRequest[6];
        uint64_t v71 = &a1[v70];
        uint64_t v72 = &a2[v70];
        char v73 = v72[8];
        *(void *)uint64_t v71 = *(void *)v72;
        v71[8] = v73;
        uint64_t v74 = BiomeStreamRequest[7];
        uint64_t v75 = &a1[v74];
        uint64_t v76 = &a2[v74];
        __int16 v77 = *((_WORD *)v76 + 4);
        *(void *)uint64_t v75 = *(void *)v76;
        *((_WORD *)v75 + 4) = v77;
        break;
      case 0xBu:
        uint64_t v78 = sub_2372A4780();
        uint64_t v79 = *(void (**)(char *, char *, uint64_t))(*(void *)(v78 - 8) + 16);
        v79(a1, a2, v78);
        uint64_t v80 = *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
        uint64_t v81 = &a1[v80];
        uint64_t v82 = &a2[v80];
        uint64_t v83 = (int *)type metadata accessor for NotificationState(0);
        uint64_t v84 = *((void *)v83 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v84 + 48))(v82, 1, v83))
        {
          uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
          memcpy(v81, v82, *(void *)(*(void *)(v85 - 8) + 64));
        }
        else
        {
          uint64_t v219 = v84;
          v79(v81, v82, v78);
          uint64_t v143 = v83[5];
          uint64_t v144 = &v81[v143];
          uint64_t v145 = &v82[v143];
          char v146 = v145[8];
          *(void *)uint64_t v144 = *(void *)v145;
          v144[8] = v146;
          uint64_t v147 = v83[6];
          __dst = &v81[v147];
          uint64_t v218 = v79;
          uint64_t v148 = &v82[v147];
          uint64_t v149 = (int *)type metadata accessor for LitmusInfo(0);
          uint64_t v150 = *((void *)v149 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v150 + 48))(v148, 1, v149))
          {
            uint64_t v151 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
            memcpy(__dst, v148, *(void *)(*(void *)(v151 - 8) + 64));
          }
          else
          {
            v218(__dst, v148, v78);
            uint64_t v165 = v149[5];
            uint64_t v166 = &__dst[v165];
            uint64_t v167 = &v148[v165];
            char v168 = v167[4];
            *(_DWORD *)uint64_t v166 = *(_DWORD *)v167;
            v166[4] = v168;
            uint64_t v169 = v149[6];
            uint64_t v170 = &__dst[v169];
            uint64_t v171 = &v148[v169];
            char v172 = v171[4];
            *(_DWORD *)uint64_t v170 = *(_DWORD *)v171;
            v170[4] = v172;
            uint64_t v173 = v149[7];
            uint64_t v174 = &__dst[v173];
            uint64_t v175 = &v148[v173];
            char v176 = v175[4];
            *(_DWORD *)uint64_t v174 = *(_DWORD *)v175;
            v174[4] = v176;
            uint64_t v177 = v149[8];
            uint64_t v178 = &__dst[v177];
            uint64_t v179 = &v148[v177];
            __int16 v180 = *((_WORD *)v179 + 4);
            *(void *)uint64_t v178 = *(void *)v179;
            *((_WORD *)v178 + 4) = v180;
            (*(void (**)(char *, void, uint64_t, int *))(v150 + 56))(__dst, 0, 1, v149);
          }
          uint64_t v181 = v83[7];
          uint64_t v182 = &v81[v181];
          uint64_t v183 = &v82[v181];
          uint64_t v184 = *(void *)v183;
          v182[8] = v183[8];
          *(void *)uint64_t v182 = v184;
          uint64_t v185 = v83[8];
          uint64_t v186 = &v81[v185];
          uint64_t v187 = &v82[v185];
          uint64_t v188 = *(void *)v187;
          v186[8] = v187[8];
          *(void *)uint64_t v186 = v188;
          uint64_t v189 = v83[9];
          __int16 v190 = &v81[v189];
          uint64_t v191 = &v82[v189];
          uint64_t v192 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v193 = *((void *)v192 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v193 + 48))(v191, 1, v192))
          {
            uint64_t v194 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v190, v191, *(void *)(*(void *)(v194 - 8) + 64));
          }
          else
          {
            v218(v190, v191, v78);
            uint64_t v195 = v192[5];
            uint64_t v196 = &v190[v195];
            uint64_t v197 = &v191[v195];
            *(void *)uint64_t v196 = *(void *)v197;
            *((void *)v196 + 1) = *((void *)v197 + 1);
            uint64_t v198 = v192[6];
            uint64_t v199 = &v190[v198];
            uint64_t v200 = &v191[v198];
            *(void *)uint64_t v199 = *(void *)v200;
            *((void *)v199 + 1) = *((void *)v200 + 1);
            uint64_t v201 = v192[7];
            uint64_t v202 = &v190[v201];
            uint64_t v203 = &v191[v201];
            *(void *)uint64_t v202 = *(void *)v203;
            *((void *)v202 + 1) = *((void *)v203 + 1);
            uint64_t v204 = v192[8];
            uint64_t v205 = &v190[v204];
            uint64_t v206 = &v191[v204];
            *(void *)uint64_t v205 = *(void *)v206;
            *((void *)v205 + 1) = *((void *)v206 + 1);
            uint64_t v207 = *(void (**)(char *, void, uint64_t, int *))(v193 + 56);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v207(v190, 0, 1, v192);
          }
          uint64_t v208 = v83[10];
          uint64_t v209 = &v81[v208];
          uint64_t v210 = &v82[v208];
          *(void *)uint64_t v209 = *(void *)v210;
          *((void *)v209 + 1) = *((void *)v210 + 1);
          uint64_t v211 = v83[11];
          uint64_t v212 = &v81[v211];
          uint64_t v213 = &v82[v211];
          uint64_t v214 = *(void *)v213;
          v212[8] = v213[8];
          *(void *)uint64_t v212 = v214;
          v215 = *(void (**)(char *, void, uint64_t, int *))(v219 + 56);
          swift_bridgeObjectRetain();
          v215(v81, 0, 1, v83);
        }
        break;
      case 0xDu:
        uint64_t v86 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v86 - 8) + 16))(a1, a2, v86);
        uint64_t v87 = *(int *)(type metadata accessor for MobileAssetDownloadRequest(0) + 20);
        uint64_t v88 = &a1[v87];
        uint64_t v89 = &a2[v87];
        char v90 = v89[8];
        *(void *)uint64_t v88 = *(void *)v89;
        v88[8] = v90;
        break;
      case 0xEu:
        *(void *)a1 = *(void *)a2;
        uint64_t v91 = (int *)type metadata accessor for ShadowEvaluationRequest(0);
        uint64_t v92 = v91[5];
        uint64_t v93 = &a1[v92];
        uint64_t v94 = &a2[v92];
        uint64_t v95 = sub_2372A4780();
        uint64_t v96 = *(void (**)(char *, char *, uint64_t))(*(void *)(v95 - 8) + 16);
        swift_bridgeObjectRetain();
        v96(v93, v94, v95);
        uint64_t v97 = v91[6];
        uint64_t v98 = &a1[v97];
        uint64_t v99 = &a2[v97];
        uint64_t v100 = *(void *)v99;
        v98[8] = v99[8];
        *(void *)uint64_t v98 = v100;
        uint64_t v101 = v91[7];
        uint64_t v102 = &a1[v101];
        uint64_t v103 = &a2[v101];
        LOBYTE(v100) = v103[8];
        *(void *)uint64_t v102 = *(void *)v103;
        v102[8] = v100;
        uint64_t v104 = v91[8];
        uint64_t v105 = &a1[v104];
        uint64_t v106 = &a2[v104];
        LOBYTE(v100) = v106[8];
        *(void *)uint64_t v105 = *(void *)v106;
        v105[8] = v100;
        a1[v91[9]] = a2[v91[9]];
        uint64_t v107 = v91[10];
        uint64_t v108 = &a1[v107];
        uint64_t v109 = &a2[v107];
        uint64_t v110 = *(void *)v109;
        v108[8] = v109[8];
        *(void *)uint64_t v108 = v110;
        a1[v91[11]] = a2[v91[11]];
        break;
      case 0x10u:
        uint64_t v112 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v112 - 8) + 16))(a1, a2, v112);
        uint64_t v113 = *(int *)(type metadata accessor for DeleteDaemonStateRequest(0) + 20);
        uint64_t v114 = &a1[v113];
        uint64_t v115 = &a2[v113];
        __int16 v116 = *((_WORD *)v115 + 4);
        *(void *)uint64_t v114 = *(void *)v115;
        *((_WORD *)v114 + 4) = v116;
        break;
      default:
        uint64_t v4 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        uint64_t v5 = *(int *)(type metadata accessor for PingRequest(0) + 20);
        uint64_t v6 = &a1[v5];
        uint64_t v7 = &a2[v5];
        *(void *)uint64_t v6 = *(void *)v7;
        *((void *)v6 + 1) = *((void *)v7 + 1);
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for SubscriptionClientRequest.OneOf_Type(char *a1, char *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v6 = sub_2372A4780();
      uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32);
      v7(a1, a2, v6);
      uint64_t v8 = (int *)type metadata accessor for NewOfferRequest(0);
      uint64_t v9 = v8[5];
      uint64_t v10 = &a1[v9];
      uint64_t v11 = &a2[v9];
      *(void *)uint64_t v10 = *(void *)v11;
      v10[8] = v11[8];
      uint64_t v12 = v8[6];
      uint64_t v13 = &a1[v12];
      char v14 = &a2[v12];
      uint64_t v15 = (int *)type metadata accessor for LitmusInfo(0);
      uint64_t v16 = *((void *)v15 - 1);
      uint64_t v151 = v6;
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v16 + 48))(v14, 1, v15))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
        memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        v7(v13, v14, v6);
        uint64_t v94 = v15[5];
        uint64_t v95 = &v13[v94];
        uint64_t v96 = &v14[v94];
        *(_DWORD *)uint64_t v95 = *(_DWORD *)v96;
        v95[4] = v96[4];
        uint64_t v97 = v15[6];
        uint64_t v98 = &v13[v97];
        uint64_t v99 = &v14[v97];
        *(_DWORD *)uint64_t v98 = *(_DWORD *)v99;
        v98[4] = v99[4];
        uint64_t v100 = v15[7];
        uint64_t v101 = &v13[v100];
        uint64_t v102 = &v14[v100];
        *(_DWORD *)uint64_t v101 = *(_DWORD *)v102;
        v101[4] = v102[4];
        uint64_t v103 = v15[8];
        uint64_t v104 = &v13[v103];
        uint64_t v105 = &v14[v103];
        *(void *)uint64_t v104 = *(void *)v105;
        *((_WORD *)v104 + 4) = *((_WORD *)v105 + 4);
        (*(void (**)(char *, void, uint64_t, int *))(v16 + 56))(v13, 0, 1, v15);
      }
      uint64_t v106 = v8[7];
      uint64_t v107 = &a1[v106];
      uint64_t v108 = &a2[v106];
      *(void *)uint64_t v107 = *(void *)v108;
      v107[8] = v108[8];
      uint64_t v109 = v8[8];
      uint64_t v110 = &a1[v109];
      uint64_t v111 = &a2[v109];
      uint64_t v112 = (int *)type metadata accessor for QuotaServerState(0);
      uint64_t v113 = *((void *)v112 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v113 + 48))(v111, 1, v112))
      {
        uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
        memcpy(v110, v111, *(void *)(*(void *)(v114 - 8) + 64));
      }
      else
      {
        v7(v110, v111, v151);
        *(_OWORD *)&v110[v112[5]] = *(_OWORD *)&v111[v112[5]];
        *(_OWORD *)&v110[v112[6]] = *(_OWORD *)&v111[v112[6]];
        *(_OWORD *)&v110[v112[7]] = *(_OWORD *)&v111[v112[7]];
        *(_OWORD *)&v110[v112[8]] = *(_OWORD *)&v111[v112[8]];
        (*(void (**)(char *, void, uint64_t, int *))(v113 + 56))(v110, 0, 1, v112);
      }
      break;
    case 2u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v18 = type metadata accessor for FeaturesRequest(0);
      uint64_t v19 = *(int *)(v18 + 24);
      uint64_t v20 = &a1[v19];
      uint64_t v21 = &a2[v19];
      uint64_t v22 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
      uint64_t v23 = *(int *)(v18 + 28);
      uint64_t v24 = &a1[v23];
      uint64_t v25 = &a2[v23];
      *(void *)uint64_t v24 = *(void *)v25;
      v24[8] = v25[8];
      break;
    case 3u:
    case 5u:
    case 8u:
    case 0xCu:
    case 0xFu:
      uint64_t v89 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v89 - 8) + 32))(a1, a2, v89);
      break;
    case 4u:
      uint64_t v26 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(a1, a2, v26);
      uint64_t v27 = (int *)type metadata accessor for DataRequest(0);
      uint64_t v28 = v27[5];
      char v29 = &a1[v28];
      uint64_t v30 = &a2[v28];
      *(void *)char v29 = *(void *)v30;
      v29[8] = v30[8];
      uint64_t v31 = v27[6];
      uint64_t v32 = &a1[v31];
      uint64_t v33 = &a2[v31];
      *(void *)uint64_t v32 = *(void *)v33;
      v32[8] = v33[8];
      uint64_t v34 = v27[7];
      char v35 = &a1[v34];
      uint64_t v36 = &a2[v34];
      v35[8] = v36[8];
      *(void *)char v35 = *(void *)v36;
      a1[v27[8]] = a2[v27[8]];
      uint64_t v37 = v27[9];
      uint64_t v38 = &a1[v37];
      char v39 = &a2[v37];
      *(void *)uint64_t v38 = *(void *)v39;
      v38[8] = v39[8];
      a1[v27[10]] = a2[v27[10]];
      a1[v27[11]] = a2[v27[11]];
      break;
    case 6u:
      uint64_t v40 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 32))(a1, a2, v40);
      uint64_t v41 = type metadata accessor for SetCliActivityRequest(0);
      uint64_t v42 = *(int *)(v41 + 20);
      char v43 = &a1[v42];
      uint64_t v44 = &a2[v42];
      *(void *)char v43 = *(void *)v44;
      v43[8] = v44[8];
      *(_OWORD *)&a1[*(int *)(v41 + 24)] = *(_OWORD *)&a2[*(int *)(v41 + 24)];
      break;
    case 7u:
      uint64_t v45 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 32))(a1, a2, v45);
      uint64_t v46 = type metadata accessor for DisplayDelayedOfferRequest(0);
      *(_OWORD *)&a1[*(int *)(v46 + 20)] = *(_OWORD *)&a2[*(int *)(v46 + 20)];
      a1[*(int *)(v46 + 24)] = a2[*(int *)(v46 + 24)];
      break;
    case 9u:
      uint64_t v47 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(a1, a2, v47);
      uint64_t v48 = (int *)type metadata accessor for ActivityClearRequest(0);
      a1[v48[5]] = a2[v48[5]];
      a1[v48[6]] = a2[v48[6]];
      a1[v48[7]] = a2[v48[7]];
      break;
    case 0xAu:
      uint64_t v49 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 32))(a1, a2, v49);
      BiomeStreamRequest = (int *)type metadata accessor for GetBiomeStreamRequest(0);
      uint64_t v51 = BiomeStreamRequest[5];
      uint64_t v52 = &a1[v51];
      char v53 = &a2[v51];
      *(void *)uint64_t v52 = *(void *)v53;
      v52[8] = v53[8];
      uint64_t v54 = BiomeStreamRequest[6];
      uint64_t v55 = &a1[v54];
      uint64_t v56 = &a2[v54];
      *(void *)uint64_t v55 = *(void *)v56;
      v55[8] = v56[8];
      uint64_t v57 = BiomeStreamRequest[7];
      uint64_t v58 = &a1[v57];
      uint64_t v59 = &a2[v57];
      *(void *)uint64_t v58 = *(void *)v59;
      *((_WORD *)v58 + 4) = *((_WORD *)v59 + 4);
      break;
    case 0xBu:
      uint64_t v60 = sub_2372A4780();
      uint64_t v61 = *(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 32);
      v61(a1, a2, v60);
      uint64_t v62 = *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
      uint64_t v63 = &a1[v62];
      uint64_t v64 = &a2[v62];
      uint64_t v65 = (int *)type metadata accessor for NotificationState(0);
      uint64_t v66 = *((void *)v65 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v66 + 48))(v64, 1, v65))
      {
        uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
        memcpy(v63, v64, *(void *)(*(void *)(v67 - 8) + 64));
      }
      else
      {
        uint64_t v154 = v66;
        v61(v63, v64, v60);
        uint64_t v115 = v65[5];
        __int16 v116 = &v63[v115];
        uint64_t v117 = &v64[v115];
        *(void *)__int16 v116 = *(void *)v117;
        v116[8] = v117[8];
        uint64_t v118 = v65[6];
        uint64_t v152 = v61;
        __dst = &v63[v118];
        uint64_t v119 = &v64[v118];
        char v120 = (int *)type metadata accessor for LitmusInfo(0);
        uint64_t v121 = *((void *)v120 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v121 + 48))(v119, 1, v120))
        {
          uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
          memcpy(__dst, v119, *(void *)(*(void *)(v122 - 8) + 64));
        }
        else
        {
          v152(__dst, v119, v60);
          uint64_t v123 = v120[5];
          char v124 = &__dst[v123];
          uint64_t v125 = &v119[v123];
          *(_DWORD *)char v124 = *(_DWORD *)v125;
          v124[4] = v125[4];
          uint64_t v126 = v120[6];
          uint64_t v127 = &__dst[v126];
          char v128 = &v119[v126];
          *(_DWORD *)uint64_t v127 = *(_DWORD *)v128;
          v127[4] = v128[4];
          uint64_t v129 = v120[7];
          uint64_t v130 = &__dst[v129];
          uint64_t v131 = &v119[v129];
          *(_DWORD *)uint64_t v130 = *(_DWORD *)v131;
          v130[4] = v131[4];
          uint64_t v132 = v120[8];
          uint64_t v133 = &__dst[v132];
          uint64_t v134 = &v119[v132];
          *(void *)uint64_t v133 = *(void *)v134;
          *((_WORD *)v133 + 4) = *((_WORD *)v134 + 4);
          (*(void (**)(char *, void, uint64_t, int *))(v121 + 56))(__dst, 0, 1, v120);
        }
        uint64_t v135 = v65[7];
        uint64_t v136 = &v63[v135];
        uint64_t v137 = &v64[v135];
        *(void *)uint64_t v136 = *(void *)v137;
        v136[8] = v137[8];
        uint64_t v138 = v65[8];
        uint64_t v139 = &v63[v138];
        uint64_t v140 = &v64[v138];
        v139[8] = v140[8];
        *(void *)uint64_t v139 = *(void *)v140;
        uint64_t v141 = v65[9];
        uint64_t v142 = &v63[v141];
        uint64_t v143 = &v64[v141];
        uint64_t v144 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v145 = *((void *)v144 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v145 + 48))(v143, 1, v144))
        {
          uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v142, v143, *(void *)(*(void *)(v146 - 8) + 64));
        }
        else
        {
          v152(v142, v143, v60);
          *(_OWORD *)&v142[v144[5]] = *(_OWORD *)&v143[v144[5]];
          *(_OWORD *)&v142[v144[6]] = *(_OWORD *)&v143[v144[6]];
          *(_OWORD *)&v142[v144[7]] = *(_OWORD *)&v143[v144[7]];
          *(_OWORD *)&v142[v144[8]] = *(_OWORD *)&v143[v144[8]];
          (*(void (**)(char *, void, uint64_t, int *))(v145 + 56))(v142, 0, 1, v144);
        }
        *(_OWORD *)&v63[v65[10]] = *(_OWORD *)&v64[v65[10]];
        uint64_t v147 = v65[11];
        uint64_t v148 = &v63[v147];
        uint64_t v149 = &v64[v147];
        v148[8] = v149[8];
        *(void *)uint64_t v148 = *(void *)v149;
        (*(void (**)(char *, void, uint64_t, int *))(v154 + 56))(v63, 0, 1, v65);
      }
      break;
    case 0xDu:
      uint64_t v68 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 32))(a1, a2, v68);
      uint64_t v69 = *(int *)(type metadata accessor for MobileAssetDownloadRequest(0) + 20);
      uint64_t v70 = &a1[v69];
      uint64_t v71 = &a2[v69];
      *(void *)uint64_t v70 = *(void *)v71;
      v70[8] = v71[8];
      break;
    case 0xEu:
      *(void *)a1 = *(void *)a2;
      uint64_t v72 = (int *)type metadata accessor for ShadowEvaluationRequest(0);
      uint64_t v73 = v72[5];
      uint64_t v74 = &a1[v73];
      uint64_t v75 = &a2[v73];
      uint64_t v76 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 32))(v74, v75, v76);
      uint64_t v77 = v72[6];
      uint64_t v78 = &a1[v77];
      uint64_t v79 = &a2[v77];
      *(void *)uint64_t v78 = *(void *)v79;
      v78[8] = v79[8];
      uint64_t v80 = v72[7];
      uint64_t v81 = &a1[v80];
      uint64_t v82 = &a2[v80];
      *(void *)uint64_t v81 = *(void *)v82;
      v81[8] = v82[8];
      uint64_t v83 = v72[8];
      uint64_t v84 = &a1[v83];
      uint64_t v85 = &a2[v83];
      *(void *)uint64_t v84 = *(void *)v85;
      v84[8] = v85[8];
      a1[v72[9]] = a2[v72[9]];
      uint64_t v86 = v72[10];
      uint64_t v87 = &a1[v86];
      uint64_t v88 = &a2[v86];
      *(void *)uint64_t v87 = *(void *)v88;
      v87[8] = v88[8];
      a1[v72[11]] = a2[v72[11]];
      break;
    case 0x10u:
      uint64_t v90 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v90 - 8) + 32))(a1, a2, v90);
      uint64_t v91 = *(int *)(type metadata accessor for DeleteDaemonStateRequest(0) + 20);
      uint64_t v92 = &a1[v91];
      uint64_t v93 = &a2[v91];
      *(void *)uint64_t v92 = *(void *)v93;
      *((_WORD *)v92 + 4) = *((_WORD *)v93 + 4);
      break;
    default:
      uint64_t v4 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
      uint64_t v5 = type metadata accessor for PingRequest(0);
      *(_OWORD *)&a1[*(int *)(v5 + 20)] = *(_OWORD *)&a2[*(int *)(v5 + 20)];
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *assignWithTake for SubscriptionClientRequest.OneOf_Type(char *a1, char *a2)
{
  if (a1 != a2)
  {
    sub_23723CDC0((uint64_t)a1, type metadata accessor for SubscriptionClientRequest.OneOf_Type);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v6 = sub_2372A4780();
        uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32);
        v7(a1, a2, v6);
        uint64_t v8 = (int *)type metadata accessor for NewOfferRequest(0);
        uint64_t v9 = v8[5];
        uint64_t v10 = &a1[v9];
        uint64_t v11 = &a2[v9];
        *(void *)uint64_t v10 = *(void *)v11;
        v10[8] = v11[8];
        uint64_t v12 = v8[6];
        uint64_t v13 = &a1[v12];
        char v14 = &a2[v12];
        uint64_t v15 = (int *)type metadata accessor for LitmusInfo(0);
        uint64_t v16 = *((void *)v15 - 1);
        uint64_t v151 = v6;
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v16 + 48))(v14, 1, v15))
        {
          uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
          memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
        }
        else
        {
          v7(v13, v14, v6);
          uint64_t v94 = v15[5];
          uint64_t v95 = &v13[v94];
          uint64_t v96 = &v14[v94];
          *(_DWORD *)uint64_t v95 = *(_DWORD *)v96;
          v95[4] = v96[4];
          uint64_t v97 = v15[6];
          uint64_t v98 = &v13[v97];
          uint64_t v99 = &v14[v97];
          *(_DWORD *)uint64_t v98 = *(_DWORD *)v99;
          v98[4] = v99[4];
          uint64_t v100 = v15[7];
          uint64_t v101 = &v13[v100];
          uint64_t v102 = &v14[v100];
          *(_DWORD *)uint64_t v101 = *(_DWORD *)v102;
          v101[4] = v102[4];
          uint64_t v103 = v15[8];
          uint64_t v104 = &v13[v103];
          uint64_t v105 = &v14[v103];
          *(void *)uint64_t v104 = *(void *)v105;
          *((_WORD *)v104 + 4) = *((_WORD *)v105 + 4);
          (*(void (**)(char *, void, uint64_t, int *))(v16 + 56))(v13, 0, 1, v15);
        }
        uint64_t v106 = v8[7];
        uint64_t v107 = &a1[v106];
        uint64_t v108 = &a2[v106];
        *(void *)uint64_t v107 = *(void *)v108;
        v107[8] = v108[8];
        uint64_t v109 = v8[8];
        uint64_t v110 = &a1[v109];
        uint64_t v111 = &a2[v109];
        uint64_t v112 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v113 = *((void *)v112 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v113 + 48))(v111, 1, v112))
        {
          uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v110, v111, *(void *)(*(void *)(v114 - 8) + 64));
        }
        else
        {
          v7(v110, v111, v151);
          *(_OWORD *)&v110[v112[5]] = *(_OWORD *)&v111[v112[5]];
          *(_OWORD *)&v110[v112[6]] = *(_OWORD *)&v111[v112[6]];
          *(_OWORD *)&v110[v112[7]] = *(_OWORD *)&v111[v112[7]];
          *(_OWORD *)&v110[v112[8]] = *(_OWORD *)&v111[v112[8]];
          (*(void (**)(char *, void, uint64_t, int *))(v113 + 56))(v110, 0, 1, v112);
        }
        break;
      case 2u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v18 = type metadata accessor for FeaturesRequest(0);
        uint64_t v19 = *(int *)(v18 + 24);
        uint64_t v20 = &a1[v19];
        uint64_t v21 = &a2[v19];
        uint64_t v22 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
        uint64_t v23 = *(int *)(v18 + 28);
        uint64_t v24 = &a1[v23];
        uint64_t v25 = &a2[v23];
        *(void *)uint64_t v24 = *(void *)v25;
        v24[8] = v25[8];
        break;
      case 3u:
      case 5u:
      case 8u:
      case 0xCu:
      case 0xFu:
        uint64_t v89 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v89 - 8) + 32))(a1, a2, v89);
        break;
      case 4u:
        uint64_t v26 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(a1, a2, v26);
        uint64_t v27 = (int *)type metadata accessor for DataRequest(0);
        uint64_t v28 = v27[5];
        char v29 = &a1[v28];
        uint64_t v30 = &a2[v28];
        *(void *)char v29 = *(void *)v30;
        v29[8] = v30[8];
        uint64_t v31 = v27[6];
        uint64_t v32 = &a1[v31];
        uint64_t v33 = &a2[v31];
        *(void *)uint64_t v32 = *(void *)v33;
        v32[8] = v33[8];
        uint64_t v34 = v27[7];
        char v35 = &a1[v34];
        uint64_t v36 = &a2[v34];
        v35[8] = v36[8];
        *(void *)char v35 = *(void *)v36;
        a1[v27[8]] = a2[v27[8]];
        uint64_t v37 = v27[9];
        uint64_t v38 = &a1[v37];
        char v39 = &a2[v37];
        *(void *)uint64_t v38 = *(void *)v39;
        v38[8] = v39[8];
        a1[v27[10]] = a2[v27[10]];
        a1[v27[11]] = a2[v27[11]];
        break;
      case 6u:
        uint64_t v40 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 32))(a1, a2, v40);
        uint64_t v41 = type metadata accessor for SetCliActivityRequest(0);
        uint64_t v42 = *(int *)(v41 + 20);
        char v43 = &a1[v42];
        uint64_t v44 = &a2[v42];
        *(void *)char v43 = *(void *)v44;
        v43[8] = v44[8];
        *(_OWORD *)&a1[*(int *)(v41 + 24)] = *(_OWORD *)&a2[*(int *)(v41 + 24)];
        break;
      case 7u:
        uint64_t v45 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 32))(a1, a2, v45);
        uint64_t v46 = type metadata accessor for DisplayDelayedOfferRequest(0);
        *(_OWORD *)&a1[*(int *)(v46 + 20)] = *(_OWORD *)&a2[*(int *)(v46 + 20)];
        a1[*(int *)(v46 + 24)] = a2[*(int *)(v46 + 24)];
        break;
      case 9u:
        uint64_t v47 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(a1, a2, v47);
        uint64_t v48 = (int *)type metadata accessor for ActivityClearRequest(0);
        a1[v48[5]] = a2[v48[5]];
        a1[v48[6]] = a2[v48[6]];
        a1[v48[7]] = a2[v48[7]];
        break;
      case 0xAu:
        uint64_t v49 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 32))(a1, a2, v49);
        BiomeStreamRequest = (int *)type metadata accessor for GetBiomeStreamRequest(0);
        uint64_t v51 = BiomeStreamRequest[5];
        uint64_t v52 = &a1[v51];
        char v53 = &a2[v51];
        *(void *)uint64_t v52 = *(void *)v53;
        v52[8] = v53[8];
        uint64_t v54 = BiomeStreamRequest[6];
        uint64_t v55 = &a1[v54];
        uint64_t v56 = &a2[v54];
        *(void *)uint64_t v55 = *(void *)v56;
        v55[8] = v56[8];
        uint64_t v57 = BiomeStreamRequest[7];
        uint64_t v58 = &a1[v57];
        uint64_t v59 = &a2[v57];
        *(void *)uint64_t v58 = *(void *)v59;
        *((_WORD *)v58 + 4) = *((_WORD *)v59 + 4);
        break;
      case 0xBu:
        uint64_t v60 = sub_2372A4780();
        uint64_t v61 = *(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 32);
        v61(a1, a2, v60);
        uint64_t v62 = *(int *)(type metadata accessor for NotificationStateWriteRequest(0) + 20);
        uint64_t v63 = &a1[v62];
        uint64_t v64 = &a2[v62];
        uint64_t v65 = (int *)type metadata accessor for NotificationState(0);
        uint64_t v66 = *((void *)v65 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v66 + 48))(v64, 1, v65))
        {
          uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF80);
          memcpy(v63, v64, *(void *)(*(void *)(v67 - 8) + 64));
        }
        else
        {
          uint64_t v153 = v66;
          v61(v63, v64, v60);
          uint64_t v115 = v65[5];
          __int16 v116 = &v63[v115];
          uint64_t v117 = &v64[v115];
          *(void *)__int16 v116 = *(void *)v117;
          v116[8] = v117[8];
          uint64_t v118 = v65[6];
          __dst = &v63[v118];
          uint64_t v152 = v61;
          uint64_t v119 = &v64[v118];
          char v120 = (int *)type metadata accessor for LitmusInfo(0);
          uint64_t v121 = *((void *)v120 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v121 + 48))(v119, 1, v120))
          {
            uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBD40);
            memcpy(__dst, v119, *(void *)(*(void *)(v122 - 8) + 64));
          }
          else
          {
            v152(__dst, v119, v60);
            uint64_t v123 = v120[5];
            char v124 = &__dst[v123];
            uint64_t v125 = &v119[v123];
            *(_DWORD *)char v124 = *(_DWORD *)v125;
            v124[4] = v125[4];
            uint64_t v126 = v120[6];
            uint64_t v127 = &__dst[v126];
            char v128 = &v119[v126];
            *(_DWORD *)uint64_t v127 = *(_DWORD *)v128;
            v127[4] = v128[4];
            uint64_t v129 = v120[7];
            uint64_t v130 = &__dst[v129];
            uint64_t v131 = &v119[v129];
            *(_DWORD *)uint64_t v130 = *(_DWORD *)v131;
            v130[4] = v131[4];
            uint64_t v132 = v120[8];
            uint64_t v133 = &__dst[v132];
            uint64_t v134 = &v119[v132];
            *(void *)uint64_t v133 = *(void *)v134;
            *((_WORD *)v133 + 4) = *((_WORD *)v134 + 4);
            (*(void (**)(char *, void, uint64_t, int *))(v121 + 56))(__dst, 0, 1, v120);
          }
          uint64_t v135 = v65[7];
          uint64_t v136 = &v63[v135];
          uint64_t v137 = &v64[v135];
          *(void *)uint64_t v136 = *(void *)v137;
          v136[8] = v137[8];
          uint64_t v138 = v65[8];
          uint64_t v139 = &v63[v138];
          uint64_t v140 = &v64[v138];
          v139[8] = v140[8];
          *(void *)uint64_t v139 = *(void *)v140;
          uint64_t v141 = v65[9];
          uint64_t v142 = &v63[v141];
          uint64_t v143 = &v64[v141];
          uint64_t v144 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v145 = *((void *)v144 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v145 + 48))(v143, 1, v144))
          {
            uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v142, v143, *(void *)(*(void *)(v146 - 8) + 64));
          }
          else
          {
            v152(v142, v143, v60);
            *(_OWORD *)&v142[v144[5]] = *(_OWORD *)&v143[v144[5]];
            *(_OWORD *)&v142[v144[6]] = *(_OWORD *)&v143[v144[6]];
            *(_OWORD *)&v142[v144[7]] = *(_OWORD *)&v143[v144[7]];
            *(_OWORD *)&v142[v144[8]] = *(_OWORD *)&v143[v144[8]];
            (*(void (**)(char *, void, uint64_t, int *))(v145 + 56))(v142, 0, 1, v144);
          }
          *(_OWORD *)&v63[v65[10]] = *(_OWORD *)&v64[v65[10]];
          uint64_t v147 = v65[11];
          uint64_t v148 = &v63[v147];
          uint64_t v149 = &v64[v147];
          v148[8] = v149[8];
          *(void *)uint64_t v148 = *(void *)v149;
          (*(void (**)(char *, void, uint64_t, int *))(v153 + 56))(v63, 0, 1, v65);
        }
        break;
      case 0xDu:
        uint64_t v68 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 32))(a1, a2, v68);
        uint64_t v69 = *(int *)(type metadata accessor for MobileAssetDownloadRequest(0) + 20);
        uint64_t v70 = &a1[v69];
        uint64_t v71 = &a2[v69];
        *(void *)uint64_t v70 = *(void *)v71;
        v70[8] = v71[8];
        break;
      case 0xEu:
        *(void *)a1 = *(void *)a2;
        uint64_t v72 = (int *)type metadata accessor for ShadowEvaluationRequest(0);
        uint64_t v73 = v72[5];
        uint64_t v74 = &a1[v73];
        uint64_t v75 = &a2[v73];
        uint64_t v76 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 32))(v74, v75, v76);
        uint64_t v77 = v72[6];
        uint64_t v78 = &a1[v77];
        uint64_t v79 = &a2[v77];
        *(void *)uint64_t v78 = *(void *)v79;
        v78[8] = v79[8];
        uint64_t v80 = v72[7];
        uint64_t v81 = &a1[v80];
        uint64_t v82 = &a2[v80];
        *(void *)uint64_t v81 = *(void *)v82;
        v81[8] = v82[8];
        uint64_t v83 = v72[8];
        uint64_t v84 = &a1[v83];
        uint64_t v85 = &a2[v83];
        *(void *)uint64_t v84 = *(void *)v85;
        v84[8] = v85[8];
        a1[v72[9]] = a2[v72[9]];
        uint64_t v86 = v72[10];
        uint64_t v87 = &a1[v86];
        uint64_t v88 = &a2[v86];
        *(void *)uint64_t v87 = *(void *)v88;
        v87[8] = v88[8];
        a1[v72[11]] = a2[v72[11]];
        break;
      case 0x10u:
        uint64_t v90 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v90 - 8) + 32))(a1, a2, v90);
        uint64_t v91 = *(int *)(type metadata accessor for DeleteDaemonStateRequest(0) + 20);
        uint64_t v92 = &a1[v91];
        uint64_t v93 = &a2[v91];
        *(void *)uint64_t v92 = *(void *)v93;
        *((_WORD *)v92 + 4) = *((_WORD *)v93 + 4);
        break;
      default:
        uint64_t v4 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
        uint64_t v5 = type metadata accessor for PingRequest(0);
        *(_OWORD *)&a1[*(int *)(v5 + 20)] = *(_OWORD *)&a2[*(int *)(v5 + 20)];
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_237296638()
{
  uint64_t result = type metadata accessor for PingRequest(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for NewOfferRequest(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for FeaturesRequest(319);
      if (v3 <= 0x3F)
      {
        uint64_t result = sub_2372A4780();
        if (v4 <= 0x3F)
        {
          uint64_t result = type metadata accessor for DataRequest(319);
          if (v5 <= 0x3F)
          {
            uint64_t result = type metadata accessor for SetCliActivityRequest(319);
            if (v6 <= 0x3F)
            {
              uint64_t result = type metadata accessor for DisplayDelayedOfferRequest(319);
              if (v7 <= 0x3F)
              {
                uint64_t result = type metadata accessor for ActivityClearRequest(319);
                if (v8 <= 0x3F)
                {
                  uint64_t result = type metadata accessor for GetBiomeStreamRequest(319);
                  if (v9 <= 0x3F)
                  {
                    uint64_t result = type metadata accessor for NotificationStateWriteRequest(319);
                    if (v10 <= 0x3F)
                    {
                      uint64_t result = type metadata accessor for MobileAssetDownloadRequest(319);
                      if (v11 <= 0x3F)
                      {
                        uint64_t result = type metadata accessor for ShadowEvaluationRequest(319);
                        if (v12 <= 0x3F)
                        {
                          uint64_t result = type metadata accessor for DeleteDaemonStateRequest(319);
                          if (v13 <= 0x3F)
                          {
                            swift_initEnumMetadataMultiPayload();
                            return 0;
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
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SubscriptionClientResponse(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for SubscriptionClientResponse.OneOf_Type(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECC9C8);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v16 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
          uint64_t v17 = *(int *)(type metadata accessor for PingResponse(0) + 20);
          uint64_t v18 = (uint64_t *)((char *)a1 + v17);
          uint64_t v19 = (uint64_t *)((char *)a2 + v17);
          uint64_t v20 = v19[1];
          *uint64_t v18 = *v19;
          v18[1] = v20;
          swift_bridgeObjectRetain();
          break;
        case 2u:
          uint64_t v21 = sub_2372A4780();
          uint64_t v142 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v21 - 8) + 16);
          v142(a1, a2, v21);
          uint64_t v22 = (int *)type metadata accessor for NewOfferResponse(0);
          uint64_t v23 = v22[5];
          uint64_t v24 = (char *)a1 + v23;
          uint64_t v25 = (char *)a2 + v23;
          *(void *)uint64_t v24 = *(void *)v25;
          *((_WORD *)v24 + 4) = *((_WORD *)v25 + 4);
          uint64_t v26 = v22[6];
          uint64_t v27 = (char *)a1 + v26;
          uint64_t v28 = (char *)a2 + v26;
          *(void *)uint64_t v27 = *(void *)v28;
          v27[8] = v28[8];
          uint64_t v29 = v22[7];
          uint64_t v30 = (char *)a1 + v29;
          uint64_t v31 = (char *)a2 + v29;
          uint64_t v32 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v147 = *((void *)v32 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v147 + 48))(v31, 1, v32))
          {
            uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
          }
          else
          {
            v142((uint64_t *)v30, (uint64_t *)v31, v21);
            uint64_t v98 = v32[5];
            uint64_t v99 = &v30[v98];
            uint64_t v100 = &v31[v98];
            uint64_t v101 = *((void *)v100 + 1);
            *(void *)uint64_t v99 = *(void *)v100;
            *((void *)v99 + 1) = v101;
            uint64_t v102 = v32[6];
            uint64_t v103 = &v30[v102];
            uint64_t v104 = &v31[v102];
            uint64_t v146 = *((void *)v104 + 1);
            *(void *)uint64_t v103 = *(void *)v104;
            *((void *)v103 + 1) = v146;
            uint64_t v105 = v32[7];
            uint64_t v106 = &v30[v105];
            uint64_t v107 = &v31[v105];
            uint64_t v140 = *((void *)v107 + 1);
            *(void *)uint64_t v106 = *(void *)v107;
            *((void *)v106 + 1) = v140;
            uint64_t v108 = v32[8];
            uint64_t v109 = &v30[v108];
            uint64_t v110 = &v31[v108];
            uint64_t v111 = *((void *)v110 + 1);
            *(void *)uint64_t v109 = *(void *)v110;
            *((void *)v109 + 1) = v111;
            char v156 = *(void (**)(char *, void, uint64_t, int *))(v147 + 56);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v156(v30, 0, 1, v32);
          }
          uint64_t v112 = v22[8];
          uint64_t v113 = (char *)a1 + v112;
          uint64_t v114 = (char *)a2 + v112;
          *(void *)uint64_t v113 = *(void *)v114;
          v113[8] = v114[8];
          uint64_t v115 = v22[9];
          __int16 v116 = (uint64_t *)((char *)a1 + v115);
          uint64_t v117 = (uint64_t *)((char *)a2 + v115);
          uint64_t v118 = v117[1];
          *__int16 v116 = *v117;
          v116[1] = v118;
          swift_bridgeObjectRetain();
          break;
        case 3u:
          *a1 = *a2;
          uint64_t v34 = type metadata accessor for FeaturesResponse(0);
          uint64_t v35 = *(int *)(v34 + 20);
          uint64_t v143 = (char *)a2 + v35;
          uint64_t v148 = (char *)a1 + v35;
          uint64_t v36 = sub_2372A4780();
          uint64_t v37 = *(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16);
          swift_bridgeObjectRetain();
          v37(v148, v143, v36);
          uint64_t v38 = *(int *)(v34 + 24);
          char v39 = (char *)a1 + v38;
          uint64_t v40 = (char *)a2 + v38;
          *(void *)char v39 = *(void *)v40;
          v39[8] = v40[8];
          break;
        case 4u:
          uint64_t v41 = sub_2372A4780();
          uint64_t v149 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v41 - 8) + 16);
          v149(a1, a2, v41);
          uint64_t v42 = *(int *)(type metadata accessor for GetStateResponse(0) + 20);
          char v43 = (char *)a1 + v42;
          uint64_t v44 = (char *)a2 + v42;
          uint64_t v45 = type metadata accessor for DaemonState(0);
          uint64_t v46 = *(void *)(v45 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45))
          {
            uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
            memcpy(v43, v44, *(void *)(*(void *)(v47 - 8) + 64));
          }
          else
          {
            v149((uint64_t *)v43, (uint64_t *)v44, v41);
            *(void *)&v43[*(int *)(v45 + 20)] = *(void *)&v44[*(int *)(v45 + 20)];
            uint64_t v119 = *(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56);
            swift_retain();
            v119(v43, 0, 1, v45);
          }
          break;
        case 5u:
          uint64_t v48 = a2[1];
          *a1 = *a2;
          a1[1] = v48;
          uint64_t v49 = (int *)type metadata accessor for DataResponse(0);
          uint64_t v50 = v49[6];
          uint64_t v144 = (char *)a2 + v50;
          uint64_t v150 = (char *)a1 + v50;
          uint64_t v51 = sub_2372A4780();
          uint64_t v138 = *(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v138(v150, v144, v51);
          *((unsigned char *)a1 + v49[7]) = *((unsigned char *)a2 + v49[7]);
          *((unsigned char *)a1 + v49[8]) = *((unsigned char *)a2 + v49[8]);
          break;
        case 6u:
          uint64_t v52 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v52 - 8) + 16))(a1, a2, v52);
          uint64_t v53 = type metadata accessor for NotificationPendingResponse(0);
          *((unsigned char *)a1 + *(int *)(v53 + 20)) = *((unsigned char *)a2 + *(int *)(v53 + 20));
          uint64_t v54 = *(int *)(v53 + 24);
          uint64_t v55 = (char *)a1 + v54;
          uint64_t v56 = (char *)a2 + v54;
          v55[8] = v56[8];
          *(void *)uint64_t v55 = *(void *)v56;
          break;
        case 7u:
          uint64_t v57 = sub_2372A4780();
          uint64_t v151 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v57 - 8) + 16);
          v151(a1, a2, v57);
          uint64_t v58 = *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
          uint64_t v59 = (char *)a1 + v58;
          uint64_t v60 = (char *)a2 + v58;
          uint64_t v61 = (int *)type metadata accessor for CliActivityState(0);
          uint64_t v62 = *((void *)v61 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v62 + 48))(v60, 1, v61))
          {
            uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
            memcpy(v59, v60, *(void *)(*(void *)(v63 - 8) + 64));
          }
          else
          {
            v151((uint64_t *)v59, (uint64_t *)v60, v57);
            uint64_t v120 = v61[5];
            uint64_t v121 = &v59[v120];
            uint64_t v122 = &v60[v120];
            uint64_t v123 = *((void *)v122 + 1);
            *(void *)uint64_t v121 = *(void *)v122;
            *((void *)v121 + 1) = v123;
            uint64_t v124 = v61[6];
            uint64_t v125 = &v59[v124];
            uint64_t v126 = &v60[v124];
            *(void *)uint64_t v125 = *(void *)v126;
            v125[8] = v126[8];
            uint64_t v127 = v61[7];
            char v128 = &v59[v127];
            uint64_t v129 = &v60[v127];
            *(void *)char v128 = *(void *)v129;
            v128[8] = v129[8];
            uint64_t v130 = *(void (**)(char *, void, uint64_t, int *))(v62 + 56);
            swift_bridgeObjectRetain();
            v130(v59, 0, 1, v61);
          }
          break;
        case 8u:
        case 0xAu:
        case 0xCu:
          uint64_t v72 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v72 - 8) + 16))(a1, a2, v72);
          break;
        case 9u:
          *a1 = *a2;
          uint64_t v64 = *(int *)(type metadata accessor for ActivityStatusResponse(0) + 20);
          uint64_t v65 = (char *)a1 + v64;
          uint64_t v152 = (char *)a2 + v64;
          uint64_t v66 = sub_2372A4780();
          uint64_t v67 = *(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 16);
          swift_bridgeObjectRetain();
          v67(v65, v152, v66);
          break;
        case 0xBu:
          *a1 = *a2;
          uint64_t v68 = *(int *)(type metadata accessor for GetBiomeStreamResponse(0) + 20);
          uint64_t v69 = (char *)a1 + v68;
          uint64_t v153 = (char *)a2 + v68;
          uint64_t v70 = sub_2372A4780();
          uint64_t v71 = *(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 16);
          swift_bridgeObjectRetain();
          v71(v69, v153, v70);
          break;
        case 0xDu:
          uint64_t v73 = sub_2372A4780();
          uint64_t v154 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v73 - 8) + 16);
          v154(a1, a2, v73);
          uint64_t v74 = *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
          uint64_t v75 = (uint64_t *)((char *)a1 + v74);
          uint64_t v76 = (uint64_t *)((char *)a2 + v74);
          uint64_t v77 = type metadata accessor for SystemActivityHistory_File(0);
          uint64_t v78 = *(void *)(v77 - 8);
          if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v78 + 48))(v76, 1, v77))
          {
            uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
            memcpy(v75, v76, *(void *)(*(void *)(v79 - 8) + 64));
          }
          else
          {
            void *v75 = *v76;
            uint64_t v131 = *(int *)(v77 + 20);
            uint64_t v141 = (char *)v75 + v131;
            uint64_t v132 = (char *)v76 + v131;
            swift_bridgeObjectRetain();
            v154((uint64_t *)v141, (uint64_t *)v132, v73);
            (*(void (**)(void *, void, uint64_t, uint64_t))(v78 + 56))(v75, 0, 1, v77);
          }
          break;
        case 0xEu:
          uint64_t v80 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v80 - 8) + 16))(a1, a2, v80);
          uint64_t v81 = *(int *)(type metadata accessor for MobileAssetDownloadResponse(0) + 20);
          uint64_t v82 = (char *)a1 + v81;
          uint64_t v83 = (char *)a2 + v81;
          *(void *)uint64_t v82 = *(void *)v83;
          v82[8] = v83[8];
          break;
        case 0xFu:
          uint64_t v84 = a2[1];
          *a1 = *a2;
          a1[1] = v84;
          uint64_t v85 = type metadata accessor for ShadowEvaluationResponse(0);
          uint64_t v86 = *(int *)(v85 + 24);
          uint64_t v145 = (char *)a2 + v86;
          uint64_t v155 = (char *)a1 + v86;
          uint64_t v87 = sub_2372A4780();
          uint64_t v139 = *(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v139(v155, v145, v87);
          *((unsigned char *)a1 + *(int *)(v85 + 28)) = *((unsigned char *)a2 + *(int *)(v85 + 28));
          break;
        case 0x10u:
          uint64_t v88 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v88 - 8) + 16))(a1, a2, v88);
          uint64_t v89 = *(int *)(type metadata accessor for MobileAssetGetVersionResponse(0) + 20);
          uint64_t v90 = (uint64_t *)((char *)a1 + v89);
          uint64_t v91 = (uint64_t *)((char *)a2 + v89);
          uint64_t v92 = v91[1];
          void *v90 = *v91;
          v90[1] = v92;
          swift_bridgeObjectRetain();
          break;
        case 0x11u:
          uint64_t v93 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v93 - 8) + 16))(a1, a2, v93);
          uint64_t v94 = *(int *)(type metadata accessor for DeleteDaemonStateResponse(0) + 20);
          uint64_t v95 = (uint64_t *)((char *)a1 + v94);
          uint64_t v96 = (uint64_t *)((char *)a2 + v94);
          uint64_t v97 = v96[1];
          *uint64_t v95 = *v96;
          v95[1] = v97;
          swift_bridgeObjectRetain();
          break;
        default:
          uint64_t v11 = sub_2372A4780();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
          uint64_t v12 = *(int *)(type metadata accessor for ErrorResponse(0) + 20);
          unint64_t v13 = (uint64_t *)((char *)a1 + v12);
          char v14 = (uint64_t *)((char *)a2 + v12);
          uint64_t v15 = v14[1];
          *unint64_t v13 = *v14;
          v13[1] = v15;
          swift_bridgeObjectRetain();
          break;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v133 = *(int *)(a3 + 20);
    uint64_t v134 = (char *)a1 + v133;
    uint64_t v135 = (char *)a2 + v133;
    uint64_t v136 = sub_2372A4780();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v136 - 8) + 16))(v134, v135, v136);
  }
  return a1;
}

uint64_t destroy for SubscriptionClientResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SubscriptionClientResponse.OneOf_Type(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v10 = sub_2372A4780();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
        type metadata accessor for ErrorResponse(0);
        goto LABEL_28;
      case 1u:
        uint64_t v11 = sub_2372A4780();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
        type metadata accessor for PingResponse(0);
        goto LABEL_28;
      case 2u:
        uint64_t v12 = sub_2372A4780();
        unint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
        v13(a1, v12);
        uint64_t v14 = a1 + *(int *)(type metadata accessor for NewOfferResponse(0) + 28);
        uint64_t v15 = type metadata accessor for QuotaServerState(0);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v14, 1, v15))
        {
          v13(v14, v12);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        goto LABEL_28;
      case 3u:
        swift_bridgeObjectRelease();
        uint64_t BiomeStreamResponse = type metadata accessor for FeaturesResponse(0);
        goto LABEL_20;
      case 4u:
        uint64_t v17 = sub_2372A4780();
        uint64_t v18 = *(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8);
        v18(a1, v17);
        uint64_t v19 = a1 + *(int *)(type metadata accessor for GetStateResponse(0) + 20);
        uint64_t v20 = type metadata accessor for DaemonState(0);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v19, 1, v20))
        {
          v18(v19, v17);
          swift_release();
        }
        break;
      case 5u:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v21 = type metadata accessor for DataResponse(0);
        goto LABEL_24;
      case 6u:
      case 8u:
      case 0xAu:
      case 0xCu:
      case 0xEu:
        uint64_t v9 = sub_2372A4780();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
        break;
      case 7u:
        uint64_t v22 = sub_2372A4780();
        uint64_t v23 = *(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8);
        v23(a1, v22);
        uint64_t v24 = a1 + *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
        uint64_t v25 = type metadata accessor for CliActivityState(0);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48))(v24, 1, v25)) {
          break;
        }
        v23(v24, v22);
        goto LABEL_28;
      case 9u:
        swift_bridgeObjectRelease();
        uint64_t BiomeStreamResponse = type metadata accessor for ActivityStatusResponse(0);
        goto LABEL_20;
      case 0xBu:
        swift_bridgeObjectRelease();
        uint64_t BiomeStreamResponse = type metadata accessor for GetBiomeStreamResponse(0);
LABEL_20:
        uint64_t v26 = *(int *)(BiomeStreamResponse + 20);
        goto LABEL_25;
      case 0xDu:
        uint64_t v27 = sub_2372A4780();
        uint64_t v28 = *(void (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8);
        v28(a1, v27);
        uint64_t v29 = a1 + *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
        uint64_t v30 = type metadata accessor for SystemActivityHistory_File(0);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 48))(v29, 1, v30))
        {
          swift_bridgeObjectRelease();
          v28(v29 + *(int *)(v30 + 20), v27);
        }
        break;
      case 0xFu:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v21 = type metadata accessor for ShadowEvaluationResponse(0);
LABEL_24:
        uint64_t v26 = *(int *)(v21 + 24);
LABEL_25:
        uint64_t v31 = a1 + v26;
        uint64_t v32 = sub_2372A4780();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v32 - 8) + 8))(v31, v32);
        break;
      case 0x10u:
        uint64_t v33 = sub_2372A4780();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8))(a1, v33);
        type metadata accessor for MobileAssetGetVersionResponse(0);
        goto LABEL_28;
      case 0x11u:
        uint64_t v34 = sub_2372A4780();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 8))(a1, v34);
        type metadata accessor for DeleteDaemonStateResponse(0);
LABEL_28:
        swift_bridgeObjectRelease();
        break;
      default:
        break;
    }
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_2372A4780();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

void *initializeWithCopy for SubscriptionClientResponse(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubscriptionClientResponse.OneOf_Type(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECC9C8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v14 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
        uint64_t v15 = *(int *)(type metadata accessor for PingResponse(0) + 20);
        uint64_t v16 = (void *)((char *)a1 + v15);
        uint64_t v17 = (void *)((char *)a2 + v15);
        uint64_t v18 = v17[1];
        void *v16 = *v17;
        v16[1] = v18;
        swift_bridgeObjectRetain();
        break;
      case 2u:
        uint64_t v19 = sub_2372A4780();
        uint64_t v140 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
        v140((char *)a1, (char *)a2, v19);
        uint64_t v20 = (int *)type metadata accessor for NewOfferResponse(0);
        uint64_t v21 = v20[5];
        uint64_t v22 = (char *)a1 + v21;
        uint64_t v23 = (char *)a2 + v21;
        *(void *)uint64_t v22 = *(void *)v23;
        *((_WORD *)v22 + 4) = *((_WORD *)v23 + 4);
        uint64_t v24 = v20[6];
        uint64_t v25 = (char *)a1 + v24;
        uint64_t v26 = (char *)a2 + v24;
        *(void *)uint64_t v25 = *(void *)v26;
        v25[8] = v26[8];
        uint64_t v27 = v20[7];
        uint64_t v28 = (char *)a1 + v27;
        uint64_t v29 = (char *)a2 + v27;
        uint64_t v30 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v145 = *((void *)v30 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v145 + 48))(v29, 1, v30))
        {
          uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v28, v29, *(void *)(*(void *)(v31 - 8) + 64));
        }
        else
        {
          v140(v28, v29, v19);
          uint64_t v96 = v30[5];
          uint64_t v97 = &v28[v96];
          uint64_t v98 = &v29[v96];
          uint64_t v99 = *((void *)v98 + 1);
          *(void *)uint64_t v97 = *(void *)v98;
          *((void *)v97 + 1) = v99;
          uint64_t v100 = v30[6];
          uint64_t v101 = &v28[v100];
          uint64_t v102 = &v29[v100];
          uint64_t v144 = *((void *)v102 + 1);
          *(void *)uint64_t v101 = *(void *)v102;
          *((void *)v101 + 1) = v144;
          uint64_t v103 = v30[7];
          uint64_t v104 = &v28[v103];
          uint64_t v105 = &v29[v103];
          uint64_t v138 = *((void *)v105 + 1);
          *(void *)uint64_t v104 = *(void *)v105;
          *((void *)v104 + 1) = v138;
          uint64_t v106 = v30[8];
          uint64_t v107 = &v28[v106];
          uint64_t v108 = &v29[v106];
          uint64_t v109 = *((void *)v108 + 1);
          *(void *)uint64_t v107 = *(void *)v108;
          *((void *)v107 + 1) = v109;
          uint64_t v154 = *(void (**)(char *, void, uint64_t, int *))(v145 + 56);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v154(v28, 0, 1, v30);
        }
        uint64_t v110 = v20[8];
        uint64_t v111 = (char *)a1 + v110;
        uint64_t v112 = (char *)a2 + v110;
        *(void *)uint64_t v111 = *(void *)v112;
        v111[8] = v112[8];
        uint64_t v113 = v20[9];
        uint64_t v114 = (void *)((char *)a1 + v113);
        uint64_t v115 = (void *)((char *)a2 + v113);
        uint64_t v116 = v115[1];
        *uint64_t v114 = *v115;
        v114[1] = v116;
        swift_bridgeObjectRetain();
        break;
      case 3u:
        *a1 = *a2;
        uint64_t v32 = type metadata accessor for FeaturesResponse(0);
        uint64_t v33 = *(int *)(v32 + 20);
        uint64_t v141 = (char *)a2 + v33;
        uint64_t v146 = (char *)a1 + v33;
        uint64_t v34 = sub_2372A4780();
        uint64_t v35 = *(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16);
        swift_bridgeObjectRetain();
        v35(v146, v141, v34);
        uint64_t v36 = *(int *)(v32 + 24);
        uint64_t v37 = (char *)a1 + v36;
        uint64_t v38 = (char *)a2 + v36;
        *(void *)uint64_t v37 = *(void *)v38;
        v37[8] = v38[8];
        break;
      case 4u:
        uint64_t v39 = sub_2372A4780();
        uint64_t v147 = *(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16);
        v147((char *)a1, (char *)a2, v39);
        uint64_t v40 = *(int *)(type metadata accessor for GetStateResponse(0) + 20);
        uint64_t v41 = (char *)a1 + v40;
        uint64_t v42 = (char *)a2 + v40;
        uint64_t v43 = type metadata accessor for DaemonState(0);
        uint64_t v44 = *(void *)(v43 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v42, 1, v43))
        {
          uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
          memcpy(v41, v42, *(void *)(*(void *)(v45 - 8) + 64));
        }
        else
        {
          v147(v41, v42, v39);
          *(void *)&v41[*(int *)(v43 + 20)] = *(void *)&v42[*(int *)(v43 + 20)];
          uint64_t v117 = *(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56);
          swift_retain();
          v117(v41, 0, 1, v43);
        }
        break;
      case 5u:
        uint64_t v46 = a2[1];
        *a1 = *a2;
        a1[1] = v46;
        uint64_t v47 = (int *)type metadata accessor for DataResponse(0);
        uint64_t v48 = v47[6];
        uint64_t v142 = (char *)a2 + v48;
        uint64_t v148 = (char *)a1 + v48;
        uint64_t v49 = sub_2372A4780();
        uint64_t v136 = *(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v136(v148, v142, v49);
        *((unsigned char *)a1 + v47[7]) = *((unsigned char *)a2 + v47[7]);
        *((unsigned char *)a1 + v47[8]) = *((unsigned char *)a2 + v47[8]);
        break;
      case 6u:
        uint64_t v50 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v50 - 8) + 16))(a1, a2, v50);
        uint64_t v51 = type metadata accessor for NotificationPendingResponse(0);
        *((unsigned char *)a1 + *(int *)(v51 + 20)) = *((unsigned char *)a2 + *(int *)(v51 + 20));
        uint64_t v52 = *(int *)(v51 + 24);
        uint64_t v53 = (char *)a1 + v52;
        uint64_t v54 = (char *)a2 + v52;
        v53[8] = v54[8];
        *(void *)uint64_t v53 = *(void *)v54;
        break;
      case 7u:
        uint64_t v55 = sub_2372A4780();
        uint64_t v149 = *(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 16);
        v149((char *)a1, (char *)a2, v55);
        uint64_t v56 = *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
        uint64_t v57 = (char *)a1 + v56;
        uint64_t v58 = (char *)a2 + v56;
        uint64_t v59 = (int *)type metadata accessor for CliActivityState(0);
        uint64_t v60 = *((void *)v59 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v60 + 48))(v58, 1, v59))
        {
          uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
          memcpy(v57, v58, *(void *)(*(void *)(v61 - 8) + 64));
        }
        else
        {
          v149(v57, v58, v55);
          uint64_t v118 = v59[5];
          uint64_t v119 = &v57[v118];
          uint64_t v120 = &v58[v118];
          uint64_t v121 = *((void *)v120 + 1);
          *(void *)uint64_t v119 = *(void *)v120;
          *((void *)v119 + 1) = v121;
          uint64_t v122 = v59[6];
          uint64_t v123 = &v57[v122];
          uint64_t v124 = &v58[v122];
          *(void *)uint64_t v123 = *(void *)v124;
          v123[8] = v124[8];
          uint64_t v125 = v59[7];
          uint64_t v126 = &v57[v125];
          uint64_t v127 = &v58[v125];
          *(void *)uint64_t v126 = *(void *)v127;
          v126[8] = v127[8];
          char v128 = *(void (**)(char *, void, uint64_t, int *))(v60 + 56);
          swift_bridgeObjectRetain();
          v128(v57, 0, 1, v59);
        }
        break;
      case 8u:
      case 0xAu:
      case 0xCu:
        uint64_t v70 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v70 - 8) + 16))(a1, a2, v70);
        break;
      case 9u:
        *a1 = *a2;
        uint64_t v62 = *(int *)(type metadata accessor for ActivityStatusResponse(0) + 20);
        uint64_t v63 = (char *)a1 + v62;
        uint64_t v150 = (char *)a2 + v62;
        uint64_t v64 = sub_2372A4780();
        uint64_t v65 = *(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 16);
        swift_bridgeObjectRetain();
        v65(v63, v150, v64);
        break;
      case 0xBu:
        *a1 = *a2;
        uint64_t v66 = *(int *)(type metadata accessor for GetBiomeStreamResponse(0) + 20);
        uint64_t v67 = (char *)a1 + v66;
        uint64_t v151 = (char *)a2 + v66;
        uint64_t v68 = sub_2372A4780();
        uint64_t v69 = *(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 16);
        swift_bridgeObjectRetain();
        v69(v67, v151, v68);
        break;
      case 0xDu:
        uint64_t v71 = sub_2372A4780();
        uint64_t v152 = *(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 16);
        v152((char *)a1, (char *)a2, v71);
        uint64_t v72 = *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
        uint64_t v73 = (void *)((char *)a1 + v72);
        uint64_t v74 = (void *)((char *)a2 + v72);
        uint64_t v75 = type metadata accessor for SystemActivityHistory_File(0);
        uint64_t v76 = *(void *)(v75 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v76 + 48))(v74, 1, v75))
        {
          uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
          memcpy(v73, v74, *(void *)(*(void *)(v77 - 8) + 64));
        }
        else
        {
          void *v73 = *v74;
          uint64_t v129 = *(int *)(v75 + 20);
          uint64_t v139 = (char *)v73 + v129;
          uint64_t v130 = (char *)v74 + v129;
          swift_bridgeObjectRetain();
          v152(v139, v130, v71);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v76 + 56))(v73, 0, 1, v75);
        }
        break;
      case 0xEu:
        uint64_t v78 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v78 - 8) + 16))(a1, a2, v78);
        uint64_t v79 = *(int *)(type metadata accessor for MobileAssetDownloadResponse(0) + 20);
        uint64_t v80 = (char *)a1 + v79;
        uint64_t v81 = (char *)a2 + v79;
        *(void *)uint64_t v80 = *(void *)v81;
        v80[8] = v81[8];
        break;
      case 0xFu:
        uint64_t v82 = a2[1];
        *a1 = *a2;
        a1[1] = v82;
        uint64_t v83 = type metadata accessor for ShadowEvaluationResponse(0);
        uint64_t v84 = *(int *)(v83 + 24);
        uint64_t v143 = (char *)a2 + v84;
        uint64_t v153 = (char *)a1 + v84;
        uint64_t v85 = sub_2372A4780();
        uint64_t v137 = *(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v137(v153, v143, v85);
        *((unsigned char *)a1 + *(int *)(v83 + 28)) = *((unsigned char *)a2 + *(int *)(v83 + 28));
        break;
      case 0x10u:
        uint64_t v86 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v86 - 8) + 16))(a1, a2, v86);
        uint64_t v87 = *(int *)(type metadata accessor for MobileAssetGetVersionResponse(0) + 20);
        uint64_t v88 = (void *)((char *)a1 + v87);
        uint64_t v89 = (void *)((char *)a2 + v87);
        uint64_t v90 = v89[1];
        void *v88 = *v89;
        v88[1] = v90;
        swift_bridgeObjectRetain();
        break;
      case 0x11u:
        uint64_t v91 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v91 - 8) + 16))(a1, a2, v91);
        uint64_t v92 = *(int *)(type metadata accessor for DeleteDaemonStateResponse(0) + 20);
        uint64_t v93 = (void *)((char *)a1 + v92);
        uint64_t v94 = (void *)((char *)a2 + v92);
        uint64_t v95 = v94[1];
        void *v93 = *v94;
        v93[1] = v95;
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v9 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        uint64_t v10 = *(int *)(type metadata accessor for ErrorResponse(0) + 20);
        uint64_t v11 = (void *)((char *)a1 + v10);
        uint64_t v12 = (void *)((char *)a2 + v10);
        uint64_t v13 = v12[1];
        *uint64_t v11 = *v12;
        v11[1] = v13;
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v131 = *(int *)(a3 + 20);
  uint64_t v132 = (char *)a1 + v131;
  uint64_t v133 = (char *)a2 + v131;
  uint64_t v134 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v134 - 8) + 16))(v132, v133, v134);
  return a1;
}

char *assignWithCopy for SubscriptionClientResponse(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubscriptionClientResponse.OneOf_Type(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v20 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(a1, a2, v20);
          uint64_t v21 = *(int *)(type metadata accessor for PingResponse(0) + 20);
          uint64_t v22 = &a1[v21];
          uint64_t v23 = &a2[v21];
          *(void *)uint64_t v22 = *(void *)v23;
          *((void *)v22 + 1) = *((void *)v23 + 1);
          swift_bridgeObjectRetain();
          break;
        case 2u:
          uint64_t v24 = sub_2372A4780();
          uint64_t v268 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
          v268(a1, a2, v24);
          uint64_t v25 = (int *)type metadata accessor for NewOfferResponse(0);
          uint64_t v26 = v25[5];
          uint64_t v27 = &a1[v26];
          uint64_t v28 = &a2[v26];
          __int16 v29 = *((_WORD *)v28 + 4);
          *(void *)uint64_t v27 = *(void *)v28;
          *((_WORD *)v27 + 4) = v29;
          uint64_t v30 = v25[6];
          uint64_t v31 = &a1[v30];
          uint64_t v32 = &a2[v30];
          LOBYTE(v29) = v32[8];
          *(void *)uint64_t v31 = *(void *)v32;
          v31[8] = v29;
          uint64_t v33 = v25[7];
          uint64_t v34 = &a1[v33];
          uint64_t v35 = &a2[v33];
          uint64_t v36 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v275 = *((void *)v36 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v275 + 48))(v35, 1, v36))
          {
            uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64));
          }
          else
          {
            v268(v34, v35, v24);
            uint64_t v191 = v36[5];
            uint64_t v192 = &v34[v191];
            uint64_t v193 = &v35[v191];
            *(void *)uint64_t v192 = *(void *)v193;
            *((void *)v192 + 1) = *((void *)v193 + 1);
            uint64_t v194 = v36[6];
            uint64_t v195 = &v34[v194];
            uint64_t v196 = &v35[v194];
            *(void *)uint64_t v195 = *(void *)v196;
            *((void *)v195 + 1) = *((void *)v196 + 1);
            uint64_t v197 = v36[7];
            uint64_t v198 = &v34[v197];
            uint64_t v199 = &v35[v197];
            *(void *)uint64_t v198 = *(void *)v199;
            *((void *)v198 + 1) = *((void *)v199 + 1);
            uint64_t v200 = v36[8];
            uint64_t v201 = &v34[v200];
            uint64_t v202 = &v35[v200];
            *(void *)uint64_t v201 = *(void *)v202;
            *((void *)v201 + 1) = *((void *)v202 + 1);
            uint64_t v291 = *(void (**)(char *, void, uint64_t, int *))(v275 + 56);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v291(v34, 0, 1, v36);
          }
          uint64_t v203 = v25[8];
          uint64_t v204 = &a1[v203];
          uint64_t v205 = &a2[v203];
          uint64_t v206 = *(void *)v205;
          v204[8] = v205[8];
          *(void *)uint64_t v204 = v206;
          uint64_t v207 = v25[9];
          uint64_t v208 = &a1[v207];
          uint64_t v209 = &a2[v207];
          *(void *)uint64_t v208 = *(void *)v209;
          *((void *)v208 + 1) = *((void *)v209 + 1);
          swift_bridgeObjectRetain();
          break;
        case 3u:
          *(void *)a1 = *(void *)a2;
          uint64_t v38 = type metadata accessor for FeaturesResponse(0);
          uint64_t v39 = *(int *)(v38 + 20);
          v269 = &a2[v39];
          v276 = &a1[v39];
          uint64_t v40 = sub_2372A4780();
          uint64_t v41 = *(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16);
          swift_bridgeObjectRetain();
          v41(v276, v269, v40);
          uint64_t v42 = *(int *)(v38 + 24);
          uint64_t v43 = &a1[v42];
          uint64_t v44 = &a2[v42];
          char v45 = v44[8];
          *(void *)uint64_t v43 = *(void *)v44;
          v43[8] = v45;
          break;
        case 4u:
          uint64_t v46 = sub_2372A4780();
          uint64_t v277 = *(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16);
          v277(a1, a2, v46);
          uint64_t v47 = *(int *)(type metadata accessor for GetStateResponse(0) + 20);
          uint64_t v48 = &a1[v47];
          uint64_t v49 = &a2[v47];
          uint64_t v50 = type metadata accessor for DaemonState(0);
          uint64_t v51 = *(void *)(v50 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v49, 1, v50))
          {
            uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
            memcpy(v48, v49, *(void *)(*(void *)(v52 - 8) + 64));
          }
          else
          {
            v277(v48, v49, v46);
            *(void *)&v48[*(int *)(v50 + 20)] = *(void *)&v49[*(int *)(v50 + 20)];
            uint64_t v210 = *(void (**)(char *, void, uint64_t, uint64_t))(v51 + 56);
            swift_retain();
            v210(v48, 0, 1, v50);
          }
          break;
        case 5u:
          *(void *)a1 = *(void *)a2;
          *((void *)a1 + 1) = *((void *)a2 + 1);
          uint64_t v53 = (int *)type metadata accessor for DataResponse(0);
          uint64_t v54 = v53[6];
          uint64_t v270 = &a2[v54];
          uint64_t v278 = &a1[v54];
          uint64_t v55 = sub_2372A4780();
          uint64_t v265 = *(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v265(v278, v270, v55);
          a1[v53[7]] = a2[v53[7]];
          a1[v53[8]] = a2[v53[8]];
          break;
        case 6u:
          uint64_t v56 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16))(a1, a2, v56);
          uint64_t v57 = type metadata accessor for NotificationPendingResponse(0);
          a1[*(int *)(v57 + 20)] = a2[*(int *)(v57 + 20)];
          uint64_t v58 = *(int *)(v57 + 24);
          uint64_t v59 = &a1[v58];
          uint64_t v60 = &a2[v58];
          char v61 = v60[8];
          *(void *)uint64_t v59 = *(void *)v60;
          v59[8] = v61;
          break;
        case 7u:
          uint64_t v62 = sub_2372A4780();
          v279 = *(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 16);
          v279(a1, a2, v62);
          uint64_t v63 = *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
          uint64_t v64 = &a1[v63];
          uint64_t v65 = &a2[v63];
          uint64_t v66 = (int *)type metadata accessor for CliActivityState(0);
          uint64_t v67 = *((void *)v66 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v67 + 48))(v65, 1, v66))
          {
            uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
            memcpy(v64, v65, *(void *)(*(void *)(v68 - 8) + 64));
          }
          else
          {
            v279(v64, v65, v62);
            uint64_t v211 = v66[5];
            uint64_t v212 = &v64[v211];
            uint64_t v213 = &v65[v211];
            *(void *)uint64_t v212 = *(void *)v213;
            *((void *)v212 + 1) = *((void *)v213 + 1);
            uint64_t v214 = v66[6];
            v215 = &v64[v214];
            uint64_t v216 = &v65[v214];
            char v217 = v216[8];
            *(void *)v215 = *(void *)v216;
            v215[8] = v217;
            uint64_t v218 = v66[7];
            uint64_t v219 = &v64[v218];
            uint64_t v220 = &v65[v218];
            char v221 = v220[8];
            *(void *)uint64_t v219 = *(void *)v220;
            v219[8] = v221;
            uint64_t v222 = *(void (**)(char *, void, uint64_t, int *))(v67 + 56);
            swift_bridgeObjectRetain();
            v222(v64, 0, 1, v66);
          }
          break;
        case 8u:
        case 0xAu:
        case 0xCu:
          uint64_t v77 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v77 - 8) + 16))(a1, a2, v77);
          break;
        case 9u:
          *(void *)a1 = *(void *)a2;
          uint64_t v69 = *(int *)(type metadata accessor for ActivityStatusResponse(0) + 20);
          uint64_t v70 = &a1[v69];
          uint64_t v280 = &a2[v69];
          uint64_t v71 = sub_2372A4780();
          uint64_t v72 = *(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 16);
          swift_bridgeObjectRetain();
          v72(v70, v280, v71);
          break;
        case 0xBu:
          *(void *)a1 = *(void *)a2;
          uint64_t v73 = *(int *)(type metadata accessor for GetBiomeStreamResponse(0) + 20);
          uint64_t v74 = &a1[v73];
          char v281 = &a2[v73];
          uint64_t v75 = sub_2372A4780();
          uint64_t v76 = *(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 16);
          swift_bridgeObjectRetain();
          v76(v74, v281, v75);
          break;
        case 0xDu:
          uint64_t v78 = sub_2372A4780();
          uint64_t v282 = *(void (**)(char *, char *, uint64_t))(*(void *)(v78 - 8) + 16);
          v282(a1, a2, v78);
          uint64_t v79 = *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
          uint64_t v80 = &a1[v79];
          uint64_t v81 = &a2[v79];
          uint64_t v82 = type metadata accessor for SystemActivityHistory_File(0);
          uint64_t v83 = *(void *)(v82 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v83 + 48))(v81, 1, v82))
          {
            uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
            memcpy(v80, v81, *(void *)(*(void *)(v84 - 8) + 64));
          }
          else
          {
            *(void *)uint64_t v80 = *(void *)v81;
            uint64_t v223 = *(int *)(v82 + 20);
            uint64_t v267 = &v80[v223];
            uint64_t v224 = &v81[v223];
            swift_bridgeObjectRetain();
            v282(v267, v224, v78);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v83 + 56))(v80, 0, 1, v82);
          }
          break;
        case 0xEu:
          uint64_t v85 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 16))(a1, a2, v85);
          uint64_t v86 = *(int *)(type metadata accessor for MobileAssetDownloadResponse(0) + 20);
          uint64_t v87 = &a1[v86];
          uint64_t v88 = &a2[v86];
          char v89 = v88[8];
          *(void *)uint64_t v87 = *(void *)v88;
          v87[8] = v89;
          break;
        case 0xFu:
          *(void *)a1 = *(void *)a2;
          *((void *)a1 + 1) = *((void *)a2 + 1);
          uint64_t v90 = type metadata accessor for ShadowEvaluationResponse(0);
          uint64_t v91 = *(int *)(v90 + 24);
          uint64_t v271 = &a2[v91];
          v283 = &a1[v91];
          uint64_t v92 = sub_2372A4780();
          v266 = *(void (**)(char *, char *, uint64_t))(*(void *)(v92 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v266(v283, v271, v92);
          a1[*(int *)(v90 + 28)] = a2[*(int *)(v90 + 28)];
          break;
        case 0x10u:
          uint64_t v93 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v93 - 8) + 16))(a1, a2, v93);
          uint64_t v94 = *(int *)(type metadata accessor for MobileAssetGetVersionResponse(0) + 20);
          uint64_t v95 = &a1[v94];
          uint64_t v96 = &a2[v94];
          *(void *)uint64_t v95 = *(void *)v96;
          *((void *)v95 + 1) = *((void *)v96 + 1);
          swift_bridgeObjectRetain();
          break;
        case 0x11u:
          uint64_t v97 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v97 - 8) + 16))(a1, a2, v97);
          uint64_t v98 = *(int *)(type metadata accessor for DeleteDaemonStateResponse(0) + 20);
          uint64_t v99 = &a1[v98];
          uint64_t v100 = &a2[v98];
          *(void *)uint64_t v99 = *(void *)v100;
          *((void *)v99 + 1) = *((void *)v100 + 1);
          swift_bridgeObjectRetain();
          break;
        default:
          uint64_t v11 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
          uint64_t v12 = *(int *)(type metadata accessor for ErrorResponse(0) + 20);
          uint64_t v13 = &a1[v12];
          uint64_t v14 = &a2[v12];
          *(void *)uint64_t v13 = *(void *)v14;
          *((void *)v13 + 1) = *((void *)v14 + 1);
          swift_bridgeObjectRetain();
          break;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_55;
    }
LABEL_7:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECC9C8);
    memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_55;
  }
  if (v10)
  {
    sub_23723CDC0((uint64_t)a1, type metadata accessor for SubscriptionClientResponse.OneOf_Type);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_23723CDC0((uint64_t)a1, type metadata accessor for SubscriptionClientResponse.OneOf_Type);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v101 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v101 - 8) + 16))(a1, a2, v101);
        uint64_t v102 = *(int *)(type metadata accessor for PingResponse(0) + 20);
        uint64_t v103 = &a1[v102];
        uint64_t v104 = &a2[v102];
        *(void *)uint64_t v103 = *(void *)v104;
        *((void *)v103 + 1) = *((void *)v104 + 1);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v105 = sub_2372A4780();
        v284 = *(void (**)(char *, char *, uint64_t))(*(void *)(v105 - 8) + 16);
        v284(a1, a2, v105);
        uint64_t v106 = (int *)type metadata accessor for NewOfferResponse(0);
        uint64_t v107 = v106[5];
        uint64_t v108 = &a1[v107];
        uint64_t v109 = &a2[v107];
        __int16 v110 = *((_WORD *)v109 + 4);
        *(void *)uint64_t v108 = *(void *)v109;
        *((_WORD *)v108 + 4) = v110;
        uint64_t v111 = v106[6];
        uint64_t v112 = &a1[v111];
        uint64_t v113 = &a2[v111];
        LOBYTE(v110) = v113[8];
        *(void *)uint64_t v112 = *(void *)v113;
        v112[8] = v110;
        uint64_t v114 = v106[7];
        uint64_t v115 = &a1[v114];
        uint64_t v116 = &a2[v114];
        uint64_t v117 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v118 = *((void *)v117 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v118 + 48))(v116, 1, v117))
        {
          uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v115, v116, *(void *)(*(void *)(v119 - 8) + 64));
        }
        else
        {
          v284(v115, v116, v105);
          uint64_t v230 = v117[5];
          v231 = &v115[v230];
          uint64_t v232 = &v116[v230];
          *(void *)v231 = *(void *)v232;
          *((void *)v231 + 1) = *((void *)v232 + 1);
          uint64_t v233 = v117[6];
          v234 = &v115[v233];
          uint64_t v235 = &v116[v233];
          *(void *)v234 = *(void *)v235;
          *((void *)v234 + 1) = *((void *)v235 + 1);
          uint64_t v236 = v117[7];
          uint64_t v237 = &v115[v236];
          v238 = &v116[v236];
          *(void *)uint64_t v237 = *(void *)v238;
          *((void *)v237 + 1) = *((void *)v238 + 1);
          uint64_t v239 = v117[8];
          uint64_t v240 = &v115[v239];
          uint64_t v241 = &v116[v239];
          *(void *)uint64_t v240 = *(void *)v241;
          *((void *)v240 + 1) = *((void *)v241 + 1);
          v242 = *(void (**)(char *, void, uint64_t, int *))(v118 + 56);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v242(v115, 0, 1, v117);
        }
        uint64_t v243 = v106[8];
        uint64_t v244 = &a1[v243];
        uint64_t v245 = &a2[v243];
        uint64_t v246 = *(void *)v245;
        v244[8] = v245[8];
        *(void *)uint64_t v244 = v246;
        uint64_t v247 = v106[9];
        uint64_t v248 = &a1[v247];
        uint64_t v249 = &a2[v247];
        *(void *)uint64_t v248 = *(void *)v249;
        *((void *)v248 + 1) = *((void *)v249 + 1);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        *(void *)a1 = *(void *)a2;
        uint64_t v120 = type metadata accessor for FeaturesResponse(0);
        uint64_t v121 = *(int *)(v120 + 20);
        uint64_t v285 = &a1[v121];
        uint64_t v122 = &a2[v121];
        uint64_t v123 = sub_2372A4780();
        uint64_t v124 = *(void (**)(char *, char *, uint64_t))(*(void *)(v123 - 8) + 16);
        swift_bridgeObjectRetain();
        v124(v285, v122, v123);
        uint64_t v125 = *(int *)(v120 + 24);
        uint64_t v126 = &a1[v125];
        uint64_t v127 = &a2[v125];
        char v128 = v127[8];
        *(void *)uint64_t v126 = *(void *)v127;
        v126[8] = v128;
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v129 = sub_2372A4780();
        uint64_t v130 = (void (**)(char *, char *, uint64_t))(*(void *)(v129 - 8) + 16);
        uint64_t v286 = *v130;
        (*v130)(a1, a2, v129);
        uint64_t v131 = *(int *)(type metadata accessor for GetStateResponse(0) + 20);
        uint64_t v132 = &a1[v131];
        uint64_t v133 = &a2[v131];
        uint64_t v134 = type metadata accessor for DaemonState(0);
        uint64_t v135 = *(void *)(v134 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v135 + 48))(v133, 1, v134))
        {
          uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
          memcpy(v132, v133, *(void *)(*(void *)(v136 - 8) + 64));
        }
        else
        {
          v286(v132, v133, v129);
          *(void *)&v132[*(int *)(v134 + 20)] = *(void *)&v133[*(int *)(v134 + 20)];
          uint64_t v250 = *(void (**)(char *, void, uint64_t, uint64_t))(v135 + 56);
          swift_retain();
          v250(v132, 0, 1, v134);
        }
        goto LABEL_61;
      case 5u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        uint64_t v137 = (int *)type metadata accessor for DataResponse(0);
        uint64_t v138 = v137[6];
        v272 = &a2[v138];
        v287 = &a1[v138];
        uint64_t v139 = sub_2372A4780();
        uint64_t v140 = *(void (**)(char *, char *, uint64_t))(*(void *)(v139 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v140(v287, v272, v139);
        a1[v137[7]] = a2[v137[7]];
        a1[v137[8]] = a2[v137[8]];
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        uint64_t v141 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v141 - 8) + 16))(a1, a2, v141);
        uint64_t v142 = type metadata accessor for NotificationPendingResponse(0);
        a1[*(int *)(v142 + 20)] = a2[*(int *)(v142 + 20)];
        uint64_t v143 = *(int *)(v142 + 24);
        uint64_t v144 = &a1[v143];
        uint64_t v145 = &a2[v143];
        char v146 = v145[8];
        *(void *)uint64_t v144 = *(void *)v145;
        v144[8] = v146;
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        uint64_t v147 = sub_2372A4780();
        uint64_t v148 = (void (**)(char *, char *, uint64_t))(*(void *)(v147 - 8) + 16);
        uint64_t v288 = *v148;
        (*v148)(a1, a2, v147);
        uint64_t v149 = *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
        uint64_t v150 = &a1[v149];
        uint64_t v151 = &a2[v149];
        uint64_t v152 = (int *)type metadata accessor for CliActivityState(0);
        uint64_t v153 = *((void *)v152 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v153 + 48))(v151, 1, v152))
        {
          uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
          memcpy(v150, v151, *(void *)(*(void *)(v154 - 8) + 64));
        }
        else
        {
          v288(v150, v151, v147);
          uint64_t v251 = v152[5];
          v252 = &v150[v251];
          uint64_t v253 = &v151[v251];
          *(void *)v252 = *(void *)v253;
          *((void *)v252 + 1) = *((void *)v253 + 1);
          uint64_t v254 = v152[6];
          uint64_t v255 = &v150[v254];
          v256 = &v151[v254];
          char v257 = v256[8];
          *(void *)uint64_t v255 = *(void *)v256;
          v255[8] = v257;
          uint64_t v258 = v152[7];
          uint64_t v259 = &v150[v258];
          uint64_t v260 = &v151[v258];
          char v261 = v260[8];
          *(void *)uint64_t v259 = *(void *)v260;
          v259[8] = v261;
          v262 = *(void (**)(char *, void, uint64_t, int *))(v153 + 56);
          swift_bridgeObjectRetain();
          v262(v150, 0, 1, v152);
        }
        goto LABEL_61;
      case 8u:
      case 0xAu:
      case 0xCu:
        uint64_t v165 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v165 - 8) + 16))(a1, a2, v165);
        swift_storeEnumTagMultiPayload();
        break;
      case 9u:
        *(void *)a1 = *(void *)a2;
        uint64_t v155 = *(int *)(type metadata accessor for ActivityStatusResponse(0) + 20);
        char v156 = &a1[v155];
        uint64_t v157 = &a2[v155];
        uint64_t v158 = sub_2372A4780();
        uint64_t v159 = *(void (**)(char *, char *, uint64_t))(*(void *)(v158 - 8) + 16);
        swift_bridgeObjectRetain();
        v159(v156, v157, v158);
        swift_storeEnumTagMultiPayload();
        break;
      case 0xBu:
        *(void *)a1 = *(void *)a2;
        uint64_t v160 = *(int *)(type metadata accessor for GetBiomeStreamResponse(0) + 20);
        uint64_t v161 = &a1[v160];
        uint64_t v162 = &a2[v160];
        uint64_t v163 = sub_2372A4780();
        uint64_t v164 = *(void (**)(char *, char *, uint64_t))(*(void *)(v163 - 8) + 16);
        swift_bridgeObjectRetain();
        v164(v161, v162, v163);
        swift_storeEnumTagMultiPayload();
        break;
      case 0xDu:
        uint64_t v166 = sub_2372A4780();
        uint64_t v167 = (void (**)(char *, char *, uint64_t))(*(void *)(v166 - 8) + 16);
        char v289 = *v167;
        (*v167)(a1, a2, v166);
        uint64_t v168 = *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
        uint64_t v169 = &a1[v168];
        uint64_t v170 = &a2[v168];
        uint64_t v171 = type metadata accessor for SystemActivityHistory_File(0);
        uint64_t v172 = *(void *)(v171 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v172 + 48))(v170, 1, v171))
        {
          uint64_t v173 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
          memcpy(v169, v170, *(void *)(*(void *)(v173 - 8) + 64));
        }
        else
        {
          *(void *)uint64_t v169 = *(void *)v170;
          uint64_t v263 = *(int *)(v171 + 20);
          uint64_t v274 = &v169[v263];
          uint64_t v264 = &v170[v263];
          swift_bridgeObjectRetain();
          v289(v274, v264, v166);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v172 + 56))(v169, 0, 1, v171);
        }
LABEL_61:
        swift_storeEnumTagMultiPayload();
        break;
      case 0xEu:
        uint64_t v174 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v174 - 8) + 16))(a1, a2, v174);
        uint64_t v175 = *(int *)(type metadata accessor for MobileAssetDownloadResponse(0) + 20);
        char v176 = &a1[v175];
        uint64_t v177 = &a2[v175];
        char v178 = v177[8];
        *(void *)char v176 = *(void *)v177;
        v176[8] = v178;
        swift_storeEnumTagMultiPayload();
        break;
      case 0xFu:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        uint64_t v179 = type metadata accessor for ShadowEvaluationResponse(0);
        uint64_t v180 = *(int *)(v179 + 24);
        uint64_t v273 = &a2[v180];
        uint64_t v290 = &a1[v180];
        uint64_t v181 = sub_2372A4780();
        uint64_t v182 = *(void (**)(char *, char *, uint64_t))(*(void *)(v181 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v182(v290, v273, v181);
        a1[*(int *)(v179 + 28)] = a2[*(int *)(v179 + 28)];
        swift_storeEnumTagMultiPayload();
        break;
      case 0x10u:
        uint64_t v183 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v183 - 8) + 16))(a1, a2, v183);
        uint64_t v184 = *(int *)(type metadata accessor for MobileAssetGetVersionResponse(0) + 20);
        uint64_t v185 = &a1[v184];
        uint64_t v186 = &a2[v184];
        *(void *)uint64_t v185 = *(void *)v186;
        *((void *)v185 + 1) = *((void *)v186 + 1);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 0x11u:
        uint64_t v187 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v187 - 8) + 16))(a1, a2, v187);
        uint64_t v188 = *(int *)(type metadata accessor for DeleteDaemonStateResponse(0) + 20);
        uint64_t v189 = &a1[v188];
        __int16 v190 = &a2[v188];
        *(void *)uint64_t v189 = *(void *)v190;
        *((void *)v189 + 1) = *((void *)v190 + 1);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        uint64_t v16 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
        uint64_t v17 = *(int *)(type metadata accessor for ErrorResponse(0) + 20);
        uint64_t v18 = &a1[v17];
        uint64_t v19 = &a2[v17];
        *(void *)uint64_t v18 = *(void *)v19;
        *((void *)v18 + 1) = *((void *)v19 + 1);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
LABEL_55:
  uint64_t v225 = *(int *)(a3 + 20);
  uint64_t v226 = &a1[v225];
  v227 = &a2[v225];
  uint64_t v228 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v228 - 8) + 24))(v226, v227, v228);
  return a1;
}

void *initializeWithTake for SubscriptionClientResponse(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubscriptionClientResponse.OneOf_Type(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECC9C8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v11 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
        uint64_t v12 = type metadata accessor for PingResponse(0);
        *(_OWORD *)((char *)a1 + *(int *)(v12 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v12 + 20));
        break;
      case 2u:
        uint64_t v13 = sub_2372A4780();
        uint64_t v102 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32);
        uint64_t v103 = v13;
        ((void (*)(void *, void *))v102)(a1, a2);
        uint64_t v14 = (int *)type metadata accessor for NewOfferResponse(0);
        uint64_t v15 = v14[5];
        uint64_t v16 = (char *)a1 + v15;
        uint64_t v17 = (char *)a2 + v15;
        *(void *)uint64_t v16 = *(void *)v17;
        *((_WORD *)v16 + 4) = *((_WORD *)v17 + 4);
        uint64_t v18 = v14[6];
        uint64_t v19 = (char *)a1 + v18;
        uint64_t v20 = (char *)a2 + v18;
        *(void *)uint64_t v19 = *(void *)v20;
        v19[8] = v20[8];
        uint64_t v21 = v14[7];
        uint64_t v22 = (char *)a1 + v21;
        uint64_t v23 = (char *)a2 + v21;
        uint64_t v24 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v25 = *((void *)v24 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v25 + 48))(v23, 1, v24))
        {
          uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
        }
        else
        {
          v102(v22, v23, v103);
          *(_OWORD *)&v22[v24[5]] = *(_OWORD *)&v23[v24[5]];
          *(_OWORD *)&v22[v24[6]] = *(_OWORD *)&v23[v24[6]];
          *(_OWORD *)&v22[v24[7]] = *(_OWORD *)&v23[v24[7]];
          *(_OWORD *)&v22[v24[8]] = *(_OWORD *)&v23[v24[8]];
          (*(void (**)(char *, void, uint64_t, int *))(v25 + 56))(v22, 0, 1, v24);
        }
        uint64_t v88 = v14[8];
        char v89 = (char *)a1 + v88;
        uint64_t v90 = (char *)a2 + v88;
        *(void *)char v89 = *(void *)v90;
        v89[8] = v90[8];
        *(_OWORD *)((char *)a1 + v14[9]) = *(_OWORD *)((char *)a2 + v14[9]);
        break;
      case 3u:
        *a1 = *a2;
        uint64_t v27 = type metadata accessor for FeaturesResponse(0);
        uint64_t v28 = *(int *)(v27 + 20);
        __int16 v29 = (char *)a1 + v28;
        uint64_t v30 = (char *)a2 + v28;
        uint64_t v31 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32))(v29, v30, v31);
        uint64_t v32 = *(int *)(v27 + 24);
        uint64_t v33 = (char *)a1 + v32;
        uint64_t v34 = (char *)a2 + v32;
        *(void *)uint64_t v33 = *(void *)v34;
        v33[8] = v34[8];
        break;
      case 4u:
        uint64_t v35 = sub_2372A4780();
        uint64_t v104 = *(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32);
        v104((char *)a1, (char *)a2, v35);
        uint64_t v36 = *(int *)(type metadata accessor for GetStateResponse(0) + 20);
        uint64_t v37 = (char *)a1 + v36;
        uint64_t v38 = (char *)a2 + v36;
        uint64_t v39 = type metadata accessor for DaemonState(0);
        uint64_t v40 = *(void *)(v39 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
        {
          uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
          memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
        }
        else
        {
          v104(v37, v38, v35);
          *(void *)&v37[*(int *)(v39 + 20)] = *(void *)&v38[*(int *)(v39 + 20)];
          (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
        }
        break;
      case 5u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v42 = (int *)type metadata accessor for DataResponse(0);
        uint64_t v43 = v42[6];
        uint64_t v44 = (char *)a1 + v43;
        char v45 = (char *)a2 + v43;
        uint64_t v46 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v44, v45, v46);
        *((unsigned char *)a1 + v42[7]) = *((unsigned char *)a2 + v42[7]);
        *((unsigned char *)a1 + v42[8]) = *((unsigned char *)a2 + v42[8]);
        break;
      case 6u:
        uint64_t v47 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v47 - 8) + 32))(a1, a2, v47);
        uint64_t v48 = type metadata accessor for NotificationPendingResponse(0);
        *((unsigned char *)a1 + *(int *)(v48 + 20)) = *((unsigned char *)a2 + *(int *)(v48 + 20));
        uint64_t v49 = *(int *)(v48 + 24);
        uint64_t v50 = (char *)a1 + v49;
        uint64_t v51 = (char *)a2 + v49;
        v50[8] = v51[8];
        *(void *)uint64_t v50 = *(void *)v51;
        break;
      case 7u:
        uint64_t v52 = sub_2372A4780();
        uint64_t v105 = *(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 32);
        v105((char *)a1, (char *)a2, v52);
        uint64_t v53 = *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
        uint64_t v54 = (char *)a1 + v53;
        uint64_t v55 = (char *)a2 + v53;
        uint64_t v56 = (int *)type metadata accessor for CliActivityState(0);
        uint64_t v57 = *((void *)v56 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v57 + 48))(v55, 1, v56))
        {
          uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
          memcpy(v54, v55, *(void *)(*(void *)(v58 - 8) + 64));
        }
        else
        {
          v105(v54, v55, v52);
          *(_OWORD *)&v54[v56[5]] = *(_OWORD *)&v55[v56[5]];
          uint64_t v91 = v56[6];
          uint64_t v92 = &v54[v91];
          uint64_t v93 = &v55[v91];
          *(void *)uint64_t v92 = *(void *)v93;
          v92[8] = v93[8];
          uint64_t v94 = v56[7];
          uint64_t v95 = &v54[v94];
          uint64_t v96 = &v55[v94];
          *(void *)uint64_t v95 = *(void *)v96;
          v95[8] = v96[8];
          (*(void (**)(char *, void, uint64_t, int *))(v57 + 56))(v54, 0, 1, v56);
        }
        break;
      case 8u:
      case 0xAu:
      case 0xCu:
        uint64_t v67 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v67 - 8) + 32))(a1, a2, v67);
        break;
      case 9u:
        *a1 = *a2;
        uint64_t v59 = *(int *)(type metadata accessor for ActivityStatusResponse(0) + 20);
        uint64_t v60 = (char *)a1 + v59;
        char v61 = (char *)a2 + v59;
        uint64_t v62 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 32))(v60, v61, v62);
        break;
      case 0xBu:
        *a1 = *a2;
        uint64_t v63 = *(int *)(type metadata accessor for GetBiomeStreamResponse(0) + 20);
        uint64_t v64 = (char *)a1 + v63;
        uint64_t v65 = (char *)a2 + v63;
        uint64_t v66 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32))(v64, v65, v66);
        break;
      case 0xDu:
        uint64_t v68 = sub_2372A4780();
        uint64_t v106 = *(void (**)(void *, void *, uint64_t))(*(void *)(v68 - 8) + 32);
        v106(a1, a2, v68);
        uint64_t v69 = *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
        uint64_t v70 = (void *)((char *)a1 + v69);
        uint64_t v71 = (void *)((char *)a2 + v69);
        uint64_t v72 = type metadata accessor for SystemActivityHistory_File(0);
        uint64_t v73 = *(void *)(v72 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v73 + 48))(v71, 1, v72))
        {
          uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
          memcpy(v70, v71, *(void *)(*(void *)(v74 - 8) + 64));
        }
        else
        {
          *uint64_t v70 = *v71;
          v106((void *)((char *)v70 + *(int *)(v72 + 20)), (void *)((char *)v71 + *(int *)(v72 + 20)), v68);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v73 + 56))(v70, 0, 1, v72);
        }
        break;
      case 0xEu:
        uint64_t v75 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v75 - 8) + 32))(a1, a2, v75);
        uint64_t v76 = *(int *)(type metadata accessor for MobileAssetDownloadResponse(0) + 20);
        uint64_t v77 = (char *)a1 + v76;
        uint64_t v78 = (char *)a2 + v76;
        *(void *)uint64_t v77 = *(void *)v78;
        v77[8] = v78[8];
        break;
      case 0xFu:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v79 = type metadata accessor for ShadowEvaluationResponse(0);
        uint64_t v80 = *(int *)(v79 + 24);
        uint64_t v81 = (char *)a1 + v80;
        uint64_t v82 = (char *)a2 + v80;
        uint64_t v83 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 32))(v81, v82, v83);
        *((unsigned char *)a1 + *(int *)(v79 + 28)) = *((unsigned char *)a2 + *(int *)(v79 + 28));
        break;
      case 0x10u:
        uint64_t v84 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v84 - 8) + 32))(a1, a2, v84);
        uint64_t VersionResponse = type metadata accessor for MobileAssetGetVersionResponse(0);
        *(_OWORD *)((char *)a1 + *(int *)(VersionResponse + 20)) = *(_OWORD *)((char *)a2
                                                                             + *(int *)(VersionResponse + 20));
        break;
      case 0x11u:
        uint64_t v86 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v86 - 8) + 32))(a1, a2, v86);
        uint64_t v87 = type metadata accessor for DeleteDaemonStateResponse(0);
        *(_OWORD *)((char *)a1 + *(int *)(v87 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v87 + 20));
        break;
      default:
        uint64_t v9 = sub_2372A4780();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
        uint64_t v10 = type metadata accessor for ErrorResponse(0);
        *(_OWORD *)((char *)a1 + *(int *)(v10 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v10 + 20));
        break;
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v97 = *(int *)(a3 + 20);
  uint64_t v98 = (char *)a1 + v97;
  uint64_t v99 = (char *)a2 + v97;
  uint64_t v100 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v100 - 8) + 32))(v98, v99, v100);
  return a1;
}

char *assignWithTake for SubscriptionClientResponse(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubscriptionClientResponse.OneOf_Type(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v16 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(a1, a2, v16);
          uint64_t v17 = type metadata accessor for PingResponse(0);
          *(_OWORD *)&a1[*(int *)(v17 + 20)] = *(_OWORD *)&a2[*(int *)(v17 + 20)];
          break;
        case 2u:
          uint64_t v18 = sub_2372A4780();
          uint64_t v196 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32);
          uint64_t v197 = v18;
          ((void (*)(char *, char *))v196)(a1, a2);
          uint64_t v19 = (int *)type metadata accessor for NewOfferResponse(0);
          uint64_t v20 = v19[5];
          uint64_t v21 = &a1[v20];
          uint64_t v22 = &a2[v20];
          *(void *)uint64_t v21 = *(void *)v22;
          *((_WORD *)v21 + 4) = *((_WORD *)v22 + 4);
          uint64_t v23 = v19[6];
          uint64_t v24 = &a1[v23];
          uint64_t v25 = &a2[v23];
          *(void *)uint64_t v24 = *(void *)v25;
          v24[8] = v25[8];
          uint64_t v26 = v19[7];
          uint64_t v27 = &a1[v26];
          uint64_t v28 = &a2[v26];
          __int16 v29 = (int *)type metadata accessor for QuotaServerState(0);
          uint64_t v30 = *((void *)v29 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v30 + 48))(v28, 1, v29))
          {
            uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
            memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
          }
          else
          {
            v196(v27, v28, v197);
            *(_OWORD *)&v27[v29[5]] = *(_OWORD *)&v28[v29[5]];
            *(_OWORD *)&v27[v29[6]] = *(_OWORD *)&v28[v29[6]];
            *(_OWORD *)&v27[v29[7]] = *(_OWORD *)&v28[v29[7]];
            *(_OWORD *)&v27[v29[8]] = *(_OWORD *)&v28[v29[8]];
            (*(void (**)(char *, void, uint64_t, int *))(v30 + 56))(v27, 0, 1, v29);
          }
          uint64_t v173 = v19[8];
          uint64_t v174 = &a1[v173];
          uint64_t v175 = &a2[v173];
          *(void *)uint64_t v174 = *(void *)v175;
          v174[8] = v175[8];
          *(_OWORD *)&a1[v19[9]] = *(_OWORD *)&a2[v19[9]];
          break;
        case 3u:
          *(void *)a1 = *(void *)a2;
          uint64_t v32 = type metadata accessor for FeaturesResponse(0);
          uint64_t v33 = *(int *)(v32 + 20);
          uint64_t v34 = &a1[v33];
          uint64_t v35 = &a2[v33];
          uint64_t v36 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
          uint64_t v37 = *(int *)(v32 + 24);
          uint64_t v38 = &a1[v37];
          uint64_t v39 = &a2[v37];
          *(void *)uint64_t v38 = *(void *)v39;
          v38[8] = v39[8];
          break;
        case 4u:
          uint64_t v40 = sub_2372A4780();
          uint64_t v198 = *(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 32);
          v198(a1, a2, v40);
          uint64_t v41 = *(int *)(type metadata accessor for GetStateResponse(0) + 20);
          uint64_t v42 = &a1[v41];
          uint64_t v43 = &a2[v41];
          uint64_t v44 = type metadata accessor for DaemonState(0);
          uint64_t v45 = *(void *)(v44 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v43, 1, v44))
          {
            uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
            memcpy(v42, v43, *(void *)(*(void *)(v46 - 8) + 64));
          }
          else
          {
            v198(v42, v43, v40);
            *(void *)&v42[*(int *)(v44 + 20)] = *(void *)&v43[*(int *)(v44 + 20)];
            (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v42, 0, 1, v44);
          }
          break;
        case 5u:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          uint64_t v47 = (int *)type metadata accessor for DataResponse(0);
          uint64_t v48 = v47[6];
          uint64_t v49 = &a1[v48];
          uint64_t v50 = &a2[v48];
          uint64_t v51 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 32))(v49, v50, v51);
          a1[v47[7]] = a2[v47[7]];
          a1[v47[8]] = a2[v47[8]];
          break;
        case 6u:
          uint64_t v52 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 32))(a1, a2, v52);
          uint64_t v53 = type metadata accessor for NotificationPendingResponse(0);
          a1[*(int *)(v53 + 20)] = a2[*(int *)(v53 + 20)];
          uint64_t v54 = *(int *)(v53 + 24);
          uint64_t v55 = &a1[v54];
          uint64_t v56 = &a2[v54];
          v55[8] = v56[8];
          *(void *)uint64_t v55 = *(void *)v56;
          break;
        case 7u:
          uint64_t v57 = sub_2372A4780();
          uint64_t v199 = *(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 32);
          v199(a1, a2, v57);
          uint64_t v58 = *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
          uint64_t v59 = &a1[v58];
          uint64_t v60 = &a2[v58];
          char v61 = (int *)type metadata accessor for CliActivityState(0);
          uint64_t v62 = *((void *)v61 - 1);
          if ((*(unsigned int (**)(char *, uint64_t, int *))(v62 + 48))(v60, 1, v61))
          {
            uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
            memcpy(v59, v60, *(void *)(*(void *)(v63 - 8) + 64));
          }
          else
          {
            v199(v59, v60, v57);
            *(_OWORD *)&v59[v61[5]] = *(_OWORD *)&v60[v61[5]];
            uint64_t v176 = v61[6];
            uint64_t v177 = &v59[v176];
            char v178 = &v60[v176];
            *(void *)uint64_t v177 = *(void *)v178;
            v177[8] = v178[8];
            uint64_t v179 = v61[7];
            uint64_t v180 = &v59[v179];
            uint64_t v181 = &v60[v179];
            *(void *)uint64_t v180 = *(void *)v181;
            v180[8] = v181[8];
            (*(void (**)(char *, void, uint64_t, int *))(v62 + 56))(v59, 0, 1, v61);
          }
          break;
        case 8u:
        case 0xAu:
        case 0xCu:
          uint64_t v72 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 32))(a1, a2, v72);
          break;
        case 9u:
          *(void *)a1 = *(void *)a2;
          uint64_t v64 = *(int *)(type metadata accessor for ActivityStatusResponse(0) + 20);
          uint64_t v65 = &a1[v64];
          uint64_t v66 = &a2[v64];
          uint64_t v67 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 32))(v65, v66, v67);
          break;
        case 0xBu:
          *(void *)a1 = *(void *)a2;
          uint64_t v68 = *(int *)(type metadata accessor for GetBiomeStreamResponse(0) + 20);
          uint64_t v69 = &a1[v68];
          uint64_t v70 = &a2[v68];
          uint64_t v71 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 32))(v69, v70, v71);
          break;
        case 0xDu:
          uint64_t v73 = sub_2372A4780();
          uint64_t v200 = *(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 32);
          v200(a1, a2, v73);
          uint64_t v74 = *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
          uint64_t v75 = &a1[v74];
          uint64_t v76 = &a2[v74];
          uint64_t v77 = type metadata accessor for SystemActivityHistory_File(0);
          uint64_t v78 = *(void *)(v77 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v78 + 48))(v76, 1, v77))
          {
            uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
            memcpy(v75, v76, *(void *)(*(void *)(v79 - 8) + 64));
          }
          else
          {
            *(void *)uint64_t v75 = *(void *)v76;
            v200(&v75[*(int *)(v77 + 20)], &v76[*(int *)(v77 + 20)], v73);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v78 + 56))(v75, 0, 1, v77);
          }
          break;
        case 0xEu:
          uint64_t v80 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v80 - 8) + 32))(a1, a2, v80);
          uint64_t v81 = *(int *)(type metadata accessor for MobileAssetDownloadResponse(0) + 20);
          uint64_t v82 = &a1[v81];
          uint64_t v83 = &a2[v81];
          *(void *)uint64_t v82 = *(void *)v83;
          v82[8] = v83[8];
          break;
        case 0xFu:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          uint64_t v84 = type metadata accessor for ShadowEvaluationResponse(0);
          uint64_t v85 = *(int *)(v84 + 24);
          uint64_t v86 = &a1[v85];
          uint64_t v87 = &a2[v85];
          uint64_t v88 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v88 - 8) + 32))(v86, v87, v88);
          a1[*(int *)(v84 + 28)] = a2[*(int *)(v84 + 28)];
          break;
        case 0x10u:
          uint64_t v89 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v89 - 8) + 32))(a1, a2, v89);
          uint64_t VersionResponse = type metadata accessor for MobileAssetGetVersionResponse(0);
          *(_OWORD *)&a1[*(int *)(VersionResponse + 20)] = *(_OWORD *)&a2[*(int *)(VersionResponse + 20)];
          break;
        case 0x11u:
          uint64_t v91 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v91 - 8) + 32))(a1, a2, v91);
          uint64_t v92 = type metadata accessor for DeleteDaemonStateResponse(0);
          *(_OWORD *)&a1[*(int *)(v92 + 20)] = *(_OWORD *)&a2[*(int *)(v92 + 20)];
          break;
        default:
          uint64_t v11 = sub_2372A4780();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
          uint64_t v12 = type metadata accessor for ErrorResponse(0);
          *(_OWORD *)&a1[*(int *)(v12 + 20)] = *(_OWORD *)&a2[*(int *)(v12 + 20)];
          break;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_55;
    }
LABEL_7:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECC9C8);
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_55;
  }
  if (v10)
  {
    sub_23723CDC0((uint64_t)a1, type metadata accessor for SubscriptionClientResponse.OneOf_Type);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_23723CDC0((uint64_t)a1, type metadata accessor for SubscriptionClientResponse.OneOf_Type);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v93 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v93 - 8) + 32))(a1, a2, v93);
        uint64_t v94 = type metadata accessor for PingResponse(0);
        *(_OWORD *)&a1[*(int *)(v94 + 20)] = *(_OWORD *)&a2[*(int *)(v94 + 20)];
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v95 = sub_2372A4780();
        uint64_t v201 = *(void (**)(char *, char *, uint64_t))(*(void *)(v95 - 8) + 32);
        v201(a1, a2, v95);
        uint64_t v96 = (int *)type metadata accessor for NewOfferResponse(0);
        uint64_t v97 = v96[5];
        uint64_t v98 = &a1[v97];
        uint64_t v99 = &a2[v97];
        *(void *)uint64_t v98 = *(void *)v99;
        *((_WORD *)v98 + 4) = *((_WORD *)v99 + 4);
        uint64_t v100 = v96[6];
        uint64_t v101 = &a1[v100];
        uint64_t v102 = &a2[v100];
        *(void *)uint64_t v101 = *(void *)v102;
        v101[8] = v102[8];
        uint64_t v103 = v96[7];
        uint64_t v104 = &a1[v103];
        uint64_t v105 = &a2[v103];
        uint64_t v106 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v107 = *((void *)v106 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v107 + 48))(v105, 1, v106))
        {
          uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v104, v105, *(void *)(*(void *)(v108 - 8) + 64));
        }
        else
        {
          v201(v104, v105, v95);
          *(_OWORD *)&v104[v106[5]] = *(_OWORD *)&v105[v106[5]];
          *(_OWORD *)&v104[v106[6]] = *(_OWORD *)&v105[v106[6]];
          *(_OWORD *)&v104[v106[7]] = *(_OWORD *)&v105[v106[7]];
          *(_OWORD *)&v104[v106[8]] = *(_OWORD *)&v105[v106[8]];
          (*(void (**)(char *, void, uint64_t, int *))(v107 + 56))(v104, 0, 1, v106);
        }
        uint64_t v187 = v96[8];
        uint64_t v188 = &a1[v187];
        uint64_t v189 = &a2[v187];
        *(void *)uint64_t v188 = *(void *)v189;
        v188[8] = v189[8];
        *(_OWORD *)&a1[v96[9]] = *(_OWORD *)&a2[v96[9]];
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        *(void *)a1 = *(void *)a2;
        uint64_t v109 = type metadata accessor for FeaturesResponse(0);
        uint64_t v110 = *(int *)(v109 + 20);
        uint64_t v111 = &a1[v110];
        uint64_t v112 = &a2[v110];
        uint64_t v113 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v113 - 8) + 32))(v111, v112, v113);
        uint64_t v114 = *(int *)(v109 + 24);
        uint64_t v115 = &a1[v114];
        uint64_t v116 = &a2[v114];
        *(void *)uint64_t v115 = *(void *)v116;
        v115[8] = v116[8];
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v117 = sub_2372A4780();
        uint64_t v118 = (void (**)(char *, char *, uint64_t))(*(void *)(v117 - 8) + 32);
        uint64_t v202 = *v118;
        (*v118)(a1, a2, v117);
        uint64_t v119 = *(int *)(type metadata accessor for GetStateResponse(0) + 20);
        uint64_t v120 = &a1[v119];
        uint64_t v121 = &a2[v119];
        uint64_t v122 = type metadata accessor for DaemonState(0);
        uint64_t v123 = *(void *)(v122 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v123 + 48))(v121, 1, v122))
        {
          uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
          memcpy(v120, v121, *(void *)(*(void *)(v124 - 8) + 64));
        }
        else
        {
          v202(v120, v121, v117);
          *(void *)&v120[*(int *)(v122 + 20)] = *(void *)&v121[*(int *)(v122 + 20)];
          (*(void (**)(char *, void, uint64_t, uint64_t))(v123 + 56))(v120, 0, 1, v122);
        }
        goto LABEL_61;
      case 5u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v125 = (int *)type metadata accessor for DataResponse(0);
        uint64_t v126 = v125[6];
        uint64_t v127 = &a1[v126];
        char v128 = &a2[v126];
        uint64_t v129 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v129 - 8) + 32))(v127, v128, v129);
        a1[v125[7]] = a2[v125[7]];
        a1[v125[8]] = a2[v125[8]];
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        uint64_t v130 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v130 - 8) + 32))(a1, a2, v130);
        uint64_t v131 = type metadata accessor for NotificationPendingResponse(0);
        a1[*(int *)(v131 + 20)] = a2[*(int *)(v131 + 20)];
        uint64_t v132 = *(int *)(v131 + 24);
        uint64_t v133 = &a1[v132];
        uint64_t v134 = &a2[v132];
        v133[8] = v134[8];
        *(void *)uint64_t v133 = *(void *)v134;
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        uint64_t v135 = sub_2372A4780();
        uint64_t v136 = (void (**)(char *, char *, uint64_t))(*(void *)(v135 - 8) + 32);
        uint64_t v203 = *v136;
        (*v136)(a1, a2, v135);
        uint64_t v137 = *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
        uint64_t v138 = &a1[v137];
        uint64_t v139 = &a2[v137];
        uint64_t v140 = (int *)type metadata accessor for CliActivityState(0);
        uint64_t v141 = *((void *)v140 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v141 + 48))(v139, 1, v140))
        {
          uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
          memcpy(v138, v139, *(void *)(*(void *)(v142 - 8) + 64));
        }
        else
        {
          v203(v138, v139, v135);
          *(_OWORD *)&v138[v140[5]] = *(_OWORD *)&v139[v140[5]];
          uint64_t v190 = v140[6];
          uint64_t v191 = &v138[v190];
          uint64_t v192 = &v139[v190];
          *(void *)uint64_t v191 = *(void *)v192;
          v191[8] = v192[8];
          uint64_t v193 = v140[7];
          uint64_t v194 = &v138[v193];
          uint64_t v195 = &v139[v193];
          *(void *)uint64_t v194 = *(void *)v195;
          v194[8] = v195[8];
          (*(void (**)(char *, void, uint64_t, int *))(v141 + 56))(v138, 0, 1, v140);
        }
        goto LABEL_61;
      case 8u:
      case 0xAu:
      case 0xCu:
        uint64_t v151 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v151 - 8) + 32))(a1, a2, v151);
        swift_storeEnumTagMultiPayload();
        break;
      case 9u:
        *(void *)a1 = *(void *)a2;
        uint64_t v143 = *(int *)(type metadata accessor for ActivityStatusResponse(0) + 20);
        uint64_t v144 = &a1[v143];
        uint64_t v145 = &a2[v143];
        uint64_t v146 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v146 - 8) + 32))(v144, v145, v146);
        swift_storeEnumTagMultiPayload();
        break;
      case 0xBu:
        *(void *)a1 = *(void *)a2;
        uint64_t v147 = *(int *)(type metadata accessor for GetBiomeStreamResponse(0) + 20);
        uint64_t v148 = &a1[v147];
        uint64_t v149 = &a2[v147];
        uint64_t v150 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v150 - 8) + 32))(v148, v149, v150);
        swift_storeEnumTagMultiPayload();
        break;
      case 0xDu:
        uint64_t v152 = sub_2372A4780();
        uint64_t v153 = (void (**)(char *, char *, uint64_t))(*(void *)(v152 - 8) + 32);
        uint64_t v204 = *v153;
        (*v153)(a1, a2, v152);
        uint64_t v154 = *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
        uint64_t v155 = &a1[v154];
        char v156 = &a2[v154];
        uint64_t v157 = type metadata accessor for SystemActivityHistory_File(0);
        uint64_t v158 = *(void *)(v157 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v158 + 48))(v156, 1, v157))
        {
          uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
          memcpy(v155, v156, *(void *)(*(void *)(v159 - 8) + 64));
        }
        else
        {
          *(void *)uint64_t v155 = *(void *)v156;
          v204(&v155[*(int *)(v157 + 20)], &v156[*(int *)(v157 + 20)], v152);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v158 + 56))(v155, 0, 1, v157);
        }
LABEL_61:
        swift_storeEnumTagMultiPayload();
        break;
      case 0xEu:
        uint64_t v160 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v160 - 8) + 32))(a1, a2, v160);
        uint64_t v161 = *(int *)(type metadata accessor for MobileAssetDownloadResponse(0) + 20);
        uint64_t v162 = &a1[v161];
        uint64_t v163 = &a2[v161];
        *(void *)uint64_t v162 = *(void *)v163;
        v162[8] = v163[8];
        swift_storeEnumTagMultiPayload();
        break;
      case 0xFu:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v164 = type metadata accessor for ShadowEvaluationResponse(0);
        uint64_t v165 = *(int *)(v164 + 24);
        uint64_t v166 = &a1[v165];
        uint64_t v167 = &a2[v165];
        uint64_t v168 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v168 - 8) + 32))(v166, v167, v168);
        a1[*(int *)(v164 + 28)] = a2[*(int *)(v164 + 28)];
        swift_storeEnumTagMultiPayload();
        break;
      case 0x10u:
        uint64_t v169 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v169 - 8) + 32))(a1, a2, v169);
        uint64_t v170 = type metadata accessor for MobileAssetGetVersionResponse(0);
        *(_OWORD *)&a1[*(int *)(v170 + 20)] = *(_OWORD *)&a2[*(int *)(v170 + 20)];
        swift_storeEnumTagMultiPayload();
        break;
      case 0x11u:
        uint64_t v171 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v171 - 8) + 32))(a1, a2, v171);
        uint64_t v172 = type metadata accessor for DeleteDaemonStateResponse(0);
        *(_OWORD *)&a1[*(int *)(v172 + 20)] = *(_OWORD *)&a2[*(int *)(v172 + 20)];
        swift_storeEnumTagMultiPayload();
        break;
      default:
        uint64_t v14 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2, v14);
        uint64_t v15 = type metadata accessor for ErrorResponse(0);
        *(_OWORD *)&a1[*(int *)(v15 + 20)] = *(_OWORD *)&a2[*(int *)(v15 + 20)];
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
LABEL_55:
  uint64_t v182 = *(int *)(a3 + 20);
  uint64_t v183 = &a1[v182];
  uint64_t v184 = &a2[v182];
  uint64_t v185 = sub_2372A4780();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v185 - 8) + 40))(v183, v184, v185);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionClientResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23729CFF4);
}

uint64_t sub_23729CFF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_147Tm(a1, a2, a3, &qword_26AECC9C8);
}

uint64_t __swift_get_extra_inhabitant_index_147Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v8 = *(void *)(v7 - 8);
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v9(a1, a2, v7);
  }
  else
  {
    uint64_t v11 = sub_2372A4780();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 20);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for SubscriptionClientResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23729D10C);
}

uint64_t sub_23729D10C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_148Tm(a1, a2, a3, a4, &qword_26AECC9C8);
}

uint64_t __swift_store_extra_inhabitant_index_148Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == a3)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v11(a1, a2, a2, v9);
  }
  else
  {
    uint64_t v13 = sub_2372A4780();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + *(int *)(a4 + 20);
    return v14(v16, a2, a2, v15);
  }
}

void sub_23729D21C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_23729D23C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, void (*a5)(uint64_t))
{
  sub_23727E6E0(319, a4, a5);
  if (v5 <= 0x3F)
  {
    sub_2372A4780();
    if (v6 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

char *initializeBufferWithCopyOfBuffer for SubscriptionClientResponse.OneOf_Type(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v12 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        uint64_t v13 = *(int *)(type metadata accessor for PingResponse(0) + 20);
        uint64_t v14 = &a1[v13];
        uint64_t v15 = &a2[v13];
        uint64_t v16 = *((void *)v15 + 1);
        *(void *)uint64_t v14 = *(void *)v15;
        *((void *)v14 + 1) = v16;
        swift_bridgeObjectRetain();
        break;
      case 2u:
        uint64_t v17 = sub_2372A4780();
        uint64_t v18 = (void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
        uint64_t v147 = *v18;
        (*v18)(a1, a2, v17);
        uint64_t v19 = (int *)type metadata accessor for NewOfferResponse(0);
        uint64_t v20 = v19[5];
        uint64_t v21 = &a1[v20];
        uint64_t v22 = &a2[v20];
        *(void *)uint64_t v21 = *(void *)v22;
        *((_WORD *)v21 + 4) = *((_WORD *)v22 + 4);
        uint64_t v23 = v19[6];
        uint64_t v24 = &a1[v23];
        uint64_t v25 = &a2[v23];
        *(void *)uint64_t v24 = *(void *)v25;
        v24[8] = v25[8];
        uint64_t v26 = v19[7];
        uint64_t v27 = &a1[v26];
        uint64_t v28 = &a2[v26];
        __int16 v29 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v30 = *((void *)v29 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v30 + 48))(v28, 1, v29))
        {
          uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
        }
        else
        {
          v147(v27, v28, v17);
          uint64_t v107 = v29[5];
          uint64_t v108 = &v27[v107];
          uint64_t v109 = &v28[v107];
          uint64_t v110 = *((void *)v109 + 1);
          *(void *)uint64_t v108 = *(void *)v109;
          *((void *)v108 + 1) = v110;
          uint64_t v111 = v29[6];
          uint64_t v112 = &v27[v111];
          uint64_t v113 = &v28[v111];
          uint64_t v114 = *((void *)v113 + 1);
          *(void *)uint64_t v112 = *(void *)v113;
          *((void *)v112 + 1) = v114;
          uint64_t v115 = v29[7];
          uint64_t v116 = &v27[v115];
          uint64_t v117 = &v28[v115];
          uint64_t v118 = *((void *)v117 + 1);
          *(void *)uint64_t v116 = *(void *)v117;
          *((void *)v116 + 1) = v118;
          uint64_t v119 = v29[8];
          uint64_t v120 = &v27[v119];
          uint64_t v121 = &v28[v119];
          uint64_t v122 = *((void *)v121 + 1);
          *(void *)uint64_t v120 = *(void *)v121;
          *((void *)v120 + 1) = v122;
          uint64_t v123 = *(void (**)(char *, void, uint64_t, int *))(v30 + 56);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v123(v27, 0, 1, v29);
        }
        uint64_t v124 = v19[8];
        uint64_t v125 = &a1[v124];
        uint64_t v126 = &a2[v124];
        *(void *)uint64_t v125 = *(void *)v126;
        v125[8] = v126[8];
        uint64_t v127 = v19[9];
        char v128 = &a1[v127];
        uint64_t v129 = &a2[v127];
        uint64_t v130 = *((void *)v129 + 1);
        *(void *)char v128 = *(void *)v129;
        *((void *)v128 + 1) = v130;
        swift_bridgeObjectRetain();
        break;
      case 3u:
        *(void *)a1 = *(void *)a2;
        uint64_t v32 = type metadata accessor for FeaturesResponse(0);
        uint64_t v33 = *(int *)(v32 + 20);
        uint64_t v34 = &a1[v33];
        uint64_t v35 = &a2[v33];
        uint64_t v36 = sub_2372A4780();
        uint64_t v37 = *(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16);
        swift_bridgeObjectRetain();
        v37(v34, v35, v36);
        uint64_t v38 = *(int *)(v32 + 24);
        uint64_t v39 = &a1[v38];
        uint64_t v40 = &a2[v38];
        *(void *)uint64_t v39 = *(void *)v40;
        v39[8] = v40[8];
        break;
      case 4u:
        uint64_t v41 = sub_2372A4780();
        uint64_t v42 = *(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16);
        v42(a1, a2, v41);
        uint64_t v43 = *(int *)(type metadata accessor for GetStateResponse(0) + 20);
        uint64_t v44 = &a1[v43];
        uint64_t v45 = &a2[v43];
        uint64_t v46 = type metadata accessor for DaemonState(0);
        uint64_t v47 = *(void *)(v46 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46))
        {
          uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
          memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
        }
        else
        {
          v42(v44, v45, v41);
          *(void *)&v44[*(int *)(v46 + 20)] = *(void *)&v45[*(int *)(v46 + 20)];
          uint64_t v131 = *(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56);
          swift_retain();
          v131(v44, 0, 1, v46);
        }
        break;
      case 5u:
        uint64_t v49 = *((void *)a2 + 1);
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = v49;
        uint64_t v50 = (int *)type metadata accessor for DataResponse(0);
        uint64_t v51 = v50[6];
        uint64_t v148 = &a1[v51];
        uint64_t v52 = &a2[v51];
        uint64_t v53 = sub_2372A4780();
        uint64_t v54 = *(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v54(v148, v52, v53);
        a1[v50[7]] = a2[v50[7]];
        a1[v50[8]] = a2[v50[8]];
        break;
      case 6u:
        uint64_t v55 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 16))(a1, a2, v55);
        uint64_t v56 = type metadata accessor for NotificationPendingResponse(0);
        a1[*(int *)(v56 + 20)] = a2[*(int *)(v56 + 20)];
        uint64_t v57 = *(int *)(v56 + 24);
        uint64_t v58 = &a1[v57];
        uint64_t v59 = &a2[v57];
        v58[8] = v59[8];
        *(void *)uint64_t v58 = *(void *)v59;
        break;
      case 7u:
        uint64_t v60 = sub_2372A4780();
        char v61 = *(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 16);
        v61(a1, a2, v60);
        uint64_t v62 = *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
        uint64_t v63 = &a1[v62];
        uint64_t v64 = &a2[v62];
        uint64_t v65 = (int *)type metadata accessor for CliActivityState(0);
        uint64_t v66 = *((void *)v65 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v66 + 48))(v64, 1, v65))
        {
          uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
          memcpy(v63, v64, *(void *)(*(void *)(v67 - 8) + 64));
        }
        else
        {
          v61(v63, v64, v60);
          uint64_t v132 = v65[5];
          uint64_t v133 = &v63[v132];
          uint64_t v134 = &v64[v132];
          uint64_t v135 = *((void *)v134 + 1);
          *(void *)uint64_t v133 = *(void *)v134;
          *((void *)v133 + 1) = v135;
          uint64_t v136 = v65[6];
          uint64_t v137 = &v63[v136];
          uint64_t v138 = &v64[v136];
          *(void *)uint64_t v137 = *(void *)v138;
          v137[8] = v138[8];
          uint64_t v139 = v65[7];
          uint64_t v140 = &v63[v139];
          uint64_t v141 = &v64[v139];
          *(void *)uint64_t v140 = *(void *)v141;
          v140[8] = v141[8];
          uint64_t v142 = *(void (**)(char *, void, uint64_t, int *))(v66 + 56);
          swift_bridgeObjectRetain();
          v142(v63, 0, 1, v65);
        }
        break;
      case 8u:
      case 0xAu:
      case 0xCu:
        uint64_t v78 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v78 - 8) + 16))(a1, a2, v78);
        break;
      case 9u:
        *(void *)a1 = *(void *)a2;
        uint64_t v68 = *(int *)(type metadata accessor for ActivityStatusResponse(0) + 20);
        uint64_t v69 = &a1[v68];
        uint64_t v70 = &a2[v68];
        uint64_t v71 = sub_2372A4780();
        uint64_t v72 = *(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 16);
        swift_bridgeObjectRetain();
        v72(v69, v70, v71);
        break;
      case 0xBu:
        *(void *)a1 = *(void *)a2;
        uint64_t v73 = *(int *)(type metadata accessor for GetBiomeStreamResponse(0) + 20);
        uint64_t v74 = &a1[v73];
        uint64_t v75 = &a2[v73];
        uint64_t v76 = sub_2372A4780();
        uint64_t v77 = *(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 16);
        swift_bridgeObjectRetain();
        v77(v74, v75, v76);
        break;
      case 0xDu:
        uint64_t v79 = sub_2372A4780();
        uint64_t v80 = *(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 16);
        v80(a1, a2, v79);
        uint64_t v81 = *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
        uint64_t v82 = &a1[v81];
        uint64_t v83 = &a2[v81];
        uint64_t v84 = type metadata accessor for SystemActivityHistory_File(0);
        uint64_t v85 = *(void *)(v84 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v85 + 48))(v83, 1, v84))
        {
          uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
          memcpy(v82, v83, *(void *)(*(void *)(v86 - 8) + 64));
        }
        else
        {
          *(void *)uint64_t v82 = *(void *)v83;
          uint64_t v143 = *(int *)(v84 + 20);
          uint64_t v144 = &v82[v143];
          uint64_t v145 = &v83[v143];
          swift_bridgeObjectRetain();
          v80(v144, v145, v79);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v85 + 56))(v82, 0, 1, v84);
        }
        break;
      case 0xEu:
        uint64_t v87 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 16))(a1, a2, v87);
        uint64_t v88 = *(int *)(type metadata accessor for MobileAssetDownloadResponse(0) + 20);
        uint64_t v89 = &a1[v88];
        uint64_t v90 = &a2[v88];
        *(void *)uint64_t v89 = *(void *)v90;
        v89[8] = v90[8];
        break;
      case 0xFu:
        uint64_t v91 = *((void *)a2 + 1);
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = v91;
        uint64_t v92 = type metadata accessor for ShadowEvaluationResponse(0);
        uint64_t v93 = *(int *)(v92 + 24);
        uint64_t v149 = &a1[v93];
        uint64_t v94 = &a2[v93];
        uint64_t v95 = sub_2372A4780();
        uint64_t v96 = *(void (**)(char *, char *, uint64_t))(*(void *)(v95 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v96(v149, v94, v95);
        a1[*(int *)(v92 + 28)] = a2[*(int *)(v92 + 28)];
        break;
      case 0x10u:
        uint64_t v97 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v97 - 8) + 16))(a1, a2, v97);
        uint64_t v98 = *(int *)(type metadata accessor for MobileAssetGetVersionResponse(0) + 20);
        uint64_t v99 = &a1[v98];
        uint64_t v100 = &a2[v98];
        uint64_t v101 = *((void *)v100 + 1);
        *(void *)uint64_t v99 = *(void *)v100;
        *((void *)v99 + 1) = v101;
        swift_bridgeObjectRetain();
        break;
      case 0x11u:
        uint64_t v102 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v102 - 8) + 16))(a1, a2, v102);
        uint64_t v103 = *(int *)(type metadata accessor for DeleteDaemonStateResponse(0) + 20);
        uint64_t v104 = &a1[v103];
        uint64_t v105 = &a2[v103];
        uint64_t v106 = *((void *)v105 + 1);
        *(void *)uint64_t v104 = *(void *)v105;
        *((void *)v104 + 1) = v106;
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v6 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        uint64_t v7 = *(int *)(type metadata accessor for ErrorResponse(0) + 20);
        uint64_t v8 = &a1[v7];
        uint64_t v9 = &a2[v7];
        uint64_t v10 = *((void *)v9 + 1);
        *(void *)uint64_t v8 = *(void *)v9;
        *((void *)v8 + 1) = v10;
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SubscriptionClientResponse.OneOf_Type(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = sub_2372A4780();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
      type metadata accessor for ErrorResponse(0);
      goto LABEL_29;
    case 1:
      uint64_t v4 = sub_2372A4780();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
      type metadata accessor for PingResponse(0);
      goto LABEL_29;
    case 2:
      uint64_t v5 = sub_2372A4780();
      uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
      v6(a1, v5);
      uint64_t v7 = a1 + *(int *)(type metadata accessor for NewOfferResponse(0) + 28);
      uint64_t v8 = type metadata accessor for QuotaServerState(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8))
      {
        v6(v7, v5);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      goto LABEL_29;
    case 3:
      swift_bridgeObjectRelease();
      uint64_t BiomeStreamResponse = type metadata accessor for FeaturesResponse(0);
      goto LABEL_17;
    case 4:
      uint64_t v10 = sub_2372A4780();
      uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
      v11(a1, v10);
      uint64_t v12 = a1 + *(int *)(type metadata accessor for GetStateResponse(0) + 20);
      uint64_t v13 = type metadata accessor for DaemonState(0);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v12, 1, v13);
      if (!result)
      {
        v11(v12, v10);
        return swift_release();
      }
      return result;
    case 5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = type metadata accessor for DataResponse(0);
      goto LABEL_21;
    case 6:
    case 8:
    case 10:
    case 12:
    case 14:
      goto LABEL_23;
    case 7:
      uint64_t v15 = sub_2372A4780();
      uint64_t v16 = *(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8);
      v16(a1, v15);
      uint64_t v17 = a1 + *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
      uint64_t v18 = type metadata accessor for CliActivityState(0);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v17, 1, v18);
      if (result) {
        return result;
      }
      v16(v17, v15);
      goto LABEL_29;
    case 9:
      swift_bridgeObjectRelease();
      uint64_t BiomeStreamResponse = type metadata accessor for ActivityStatusResponse(0);
      goto LABEL_17;
    case 11:
      swift_bridgeObjectRelease();
      uint64_t BiomeStreamResponse = type metadata accessor for GetBiomeStreamResponse(0);
LABEL_17:
      uint64_t v19 = *(int *)(BiomeStreamResponse + 20);
      goto LABEL_22;
    case 13:
      uint64_t v20 = sub_2372A4780();
      __int16 v29 = *(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8);
      v29(a1, v20);
      uint64_t v21 = a1 + *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
      uint64_t v22 = type metadata accessor for SystemActivityHistory_File(0);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v21, 1, v22);
      if (result) {
        return result;
      }
      swift_bridgeObjectRelease();
      uint64_t v26 = v21 + *(int *)(v22 + 20);
      uint64_t v25 = v20;
      uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t))v29;
      goto LABEL_24;
    case 15:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = type metadata accessor for ShadowEvaluationResponse(0);
LABEL_21:
      uint64_t v19 = *(int *)(v14 + 24);
LABEL_22:
      a1 += v19;
LABEL_23:
      uint64_t v23 = sub_2372A4780();
      uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8);
      uint64_t v25 = v23;
      uint64_t v26 = a1;
LABEL_24:
      return v24(v26, v25);
    case 16:
      uint64_t v27 = sub_2372A4780();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8))(a1, v27);
      type metadata accessor for MobileAssetGetVersionResponse(0);
      goto LABEL_29;
    case 17:
      uint64_t v28 = sub_2372A4780();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8))(a1, v28);
      type metadata accessor for DeleteDaemonStateResponse(0);
LABEL_29:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

char *initializeWithCopy for SubscriptionClientResponse.OneOf_Type(char *a1, char *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v9 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      uint64_t v10 = *(int *)(type metadata accessor for PingResponse(0) + 20);
      uint64_t v11 = &a1[v10];
      uint64_t v12 = &a2[v10];
      uint64_t v13 = *((void *)v12 + 1);
      *(void *)uint64_t v11 = *(void *)v12;
      *((void *)v11 + 1) = v13;
      swift_bridgeObjectRetain();
      break;
    case 2u:
      uint64_t v14 = sub_2372A4780();
      uint64_t v15 = (void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
      uint64_t v144 = *v15;
      (*v15)(a1, a2, v14);
      uint64_t v16 = (int *)type metadata accessor for NewOfferResponse(0);
      uint64_t v17 = v16[5];
      uint64_t v18 = &a1[v17];
      uint64_t v19 = &a2[v17];
      *(void *)uint64_t v18 = *(void *)v19;
      *((_WORD *)v18 + 4) = *((_WORD *)v19 + 4);
      uint64_t v20 = v16[6];
      uint64_t v21 = &a1[v20];
      uint64_t v22 = &a2[v20];
      *(void *)uint64_t v21 = *(void *)v22;
      v21[8] = v22[8];
      uint64_t v23 = v16[7];
      uint64_t v24 = &a1[v23];
      uint64_t v25 = &a2[v23];
      uint64_t v26 = (int *)type metadata accessor for QuotaServerState(0);
      uint64_t v27 = *((void *)v26 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v27 + 48))(v25, 1, v26))
      {
        uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
        memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
      }
      else
      {
        v144(v24, v25, v14);
        uint64_t v104 = v26[5];
        uint64_t v105 = &v24[v104];
        uint64_t v106 = &v25[v104];
        uint64_t v107 = *((void *)v106 + 1);
        *(void *)uint64_t v105 = *(void *)v106;
        *((void *)v105 + 1) = v107;
        uint64_t v108 = v26[6];
        uint64_t v109 = &v24[v108];
        uint64_t v110 = &v25[v108];
        uint64_t v111 = *((void *)v110 + 1);
        *(void *)uint64_t v109 = *(void *)v110;
        *((void *)v109 + 1) = v111;
        uint64_t v112 = v26[7];
        uint64_t v113 = &v24[v112];
        uint64_t v114 = &v25[v112];
        uint64_t v115 = *((void *)v114 + 1);
        *(void *)uint64_t v113 = *(void *)v114;
        *((void *)v113 + 1) = v115;
        uint64_t v116 = v26[8];
        uint64_t v117 = &v24[v116];
        uint64_t v118 = &v25[v116];
        uint64_t v119 = *((void *)v118 + 1);
        *(void *)uint64_t v117 = *(void *)v118;
        *((void *)v117 + 1) = v119;
        uint64_t v120 = *(void (**)(char *, void, uint64_t, int *))(v27 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v120(v24, 0, 1, v26);
      }
      uint64_t v121 = v16[8];
      uint64_t v122 = &a1[v121];
      uint64_t v123 = &a2[v121];
      *(void *)uint64_t v122 = *(void *)v123;
      v122[8] = v123[8];
      uint64_t v124 = v16[9];
      uint64_t v125 = &a1[v124];
      uint64_t v126 = &a2[v124];
      uint64_t v127 = *((void *)v126 + 1);
      *(void *)uint64_t v125 = *(void *)v126;
      *((void *)v125 + 1) = v127;
      swift_bridgeObjectRetain();
      break;
    case 3u:
      *(void *)a1 = *(void *)a2;
      uint64_t v29 = type metadata accessor for FeaturesResponse(0);
      uint64_t v30 = *(int *)(v29 + 20);
      uint64_t v31 = &a1[v30];
      uint64_t v32 = &a2[v30];
      uint64_t v33 = sub_2372A4780();
      uint64_t v34 = *(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16);
      swift_bridgeObjectRetain();
      v34(v31, v32, v33);
      uint64_t v35 = *(int *)(v29 + 24);
      uint64_t v36 = &a1[v35];
      uint64_t v37 = &a2[v35];
      *(void *)uint64_t v36 = *(void *)v37;
      v36[8] = v37[8];
      break;
    case 4u:
      uint64_t v38 = sub_2372A4780();
      uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16);
      v39(a1, a2, v38);
      uint64_t v40 = *(int *)(type metadata accessor for GetStateResponse(0) + 20);
      uint64_t v41 = &a1[v40];
      uint64_t v42 = &a2[v40];
      uint64_t v43 = type metadata accessor for DaemonState(0);
      uint64_t v44 = *(void *)(v43 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v42, 1, v43))
      {
        uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
        memcpy(v41, v42, *(void *)(*(void *)(v45 - 8) + 64));
      }
      else
      {
        v39(v41, v42, v38);
        *(void *)&v41[*(int *)(v43 + 20)] = *(void *)&v42[*(int *)(v43 + 20)];
        char v128 = *(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56);
        swift_retain();
        v128(v41, 0, 1, v43);
      }
      break;
    case 5u:
      uint64_t v46 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v46;
      uint64_t v47 = (int *)type metadata accessor for DataResponse(0);
      uint64_t v48 = v47[6];
      uint64_t v145 = &a1[v48];
      uint64_t v49 = &a2[v48];
      uint64_t v50 = sub_2372A4780();
      uint64_t v51 = *(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v51(v145, v49, v50);
      a1[v47[7]] = a2[v47[7]];
      a1[v47[8]] = a2[v47[8]];
      break;
    case 6u:
      uint64_t v52 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 16))(a1, a2, v52);
      uint64_t v53 = type metadata accessor for NotificationPendingResponse(0);
      a1[*(int *)(v53 + 20)] = a2[*(int *)(v53 + 20)];
      uint64_t v54 = *(int *)(v53 + 24);
      uint64_t v55 = &a1[v54];
      uint64_t v56 = &a2[v54];
      v55[8] = v56[8];
      *(void *)uint64_t v55 = *(void *)v56;
      break;
    case 7u:
      uint64_t v57 = sub_2372A4780();
      uint64_t v58 = *(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16);
      v58(a1, a2, v57);
      uint64_t v59 = *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
      uint64_t v60 = &a1[v59];
      char v61 = &a2[v59];
      uint64_t v62 = (int *)type metadata accessor for CliActivityState(0);
      uint64_t v63 = *((void *)v62 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v63 + 48))(v61, 1, v62))
      {
        uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
        memcpy(v60, v61, *(void *)(*(void *)(v64 - 8) + 64));
      }
      else
      {
        v58(v60, v61, v57);
        uint64_t v129 = v62[5];
        uint64_t v130 = &v60[v129];
        uint64_t v131 = &v61[v129];
        uint64_t v132 = *((void *)v131 + 1);
        *(void *)uint64_t v130 = *(void *)v131;
        *((void *)v130 + 1) = v132;
        uint64_t v133 = v62[6];
        uint64_t v134 = &v60[v133];
        uint64_t v135 = &v61[v133];
        *(void *)uint64_t v134 = *(void *)v135;
        v134[8] = v135[8];
        uint64_t v136 = v62[7];
        uint64_t v137 = &v60[v136];
        uint64_t v138 = &v61[v136];
        *(void *)uint64_t v137 = *(void *)v138;
        v137[8] = v138[8];
        uint64_t v139 = *(void (**)(char *, void, uint64_t, int *))(v63 + 56);
        swift_bridgeObjectRetain();
        v139(v60, 0, 1, v62);
      }
      break;
    case 8u:
    case 0xAu:
    case 0xCu:
      uint64_t v75 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 16))(a1, a2, v75);
      break;
    case 9u:
      *(void *)a1 = *(void *)a2;
      uint64_t v65 = *(int *)(type metadata accessor for ActivityStatusResponse(0) + 20);
      uint64_t v66 = &a1[v65];
      uint64_t v67 = &a2[v65];
      uint64_t v68 = sub_2372A4780();
      uint64_t v69 = *(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 16);
      swift_bridgeObjectRetain();
      v69(v66, v67, v68);
      break;
    case 0xBu:
      *(void *)a1 = *(void *)a2;
      uint64_t v70 = *(int *)(type metadata accessor for GetBiomeStreamResponse(0) + 20);
      uint64_t v71 = &a1[v70];
      uint64_t v72 = &a2[v70];
      uint64_t v73 = sub_2372A4780();
      uint64_t v74 = *(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 16);
      swift_bridgeObjectRetain();
      v74(v71, v72, v73);
      break;
    case 0xDu:
      uint64_t v76 = sub_2372A4780();
      uint64_t v77 = *(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 16);
      v77(a1, a2, v76);
      uint64_t v78 = *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
      uint64_t v79 = &a1[v78];
      uint64_t v80 = &a2[v78];
      uint64_t v81 = type metadata accessor for SystemActivityHistory_File(0);
      uint64_t v82 = *(void *)(v81 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48))(v80, 1, v81))
      {
        uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
        memcpy(v79, v80, *(void *)(*(void *)(v83 - 8) + 64));
      }
      else
      {
        *(void *)uint64_t v79 = *(void *)v80;
        uint64_t v140 = *(int *)(v81 + 20);
        uint64_t v141 = &v79[v140];
        uint64_t v142 = &v80[v140];
        swift_bridgeObjectRetain();
        v77(v141, v142, v76);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v82 + 56))(v79, 0, 1, v81);
      }
      break;
    case 0xEu:
      uint64_t v84 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v84 - 8) + 16))(a1, a2, v84);
      uint64_t v85 = *(int *)(type metadata accessor for MobileAssetDownloadResponse(0) + 20);
      uint64_t v86 = &a1[v85];
      uint64_t v87 = &a2[v85];
      *(void *)uint64_t v86 = *(void *)v87;
      v86[8] = v87[8];
      break;
    case 0xFu:
      uint64_t v88 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v88;
      uint64_t v89 = type metadata accessor for ShadowEvaluationResponse(0);
      uint64_t v90 = *(int *)(v89 + 24);
      uint64_t v146 = &a1[v90];
      uint64_t v91 = &a2[v90];
      uint64_t v92 = sub_2372A4780();
      uint64_t v93 = *(void (**)(char *, char *, uint64_t))(*(void *)(v92 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v93(v146, v91, v92);
      a1[*(int *)(v89 + 28)] = a2[*(int *)(v89 + 28)];
      break;
    case 0x10u:
      uint64_t v94 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v94 - 8) + 16))(a1, a2, v94);
      uint64_t v95 = *(int *)(type metadata accessor for MobileAssetGetVersionResponse(0) + 20);
      uint64_t v96 = &a1[v95];
      uint64_t v97 = &a2[v95];
      uint64_t v98 = *((void *)v97 + 1);
      *(void *)uint64_t v96 = *(void *)v97;
      *((void *)v96 + 1) = v98;
      swift_bridgeObjectRetain();
      break;
    case 0x11u:
      uint64_t v99 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v99 - 8) + 16))(a1, a2, v99);
      uint64_t v100 = *(int *)(type metadata accessor for DeleteDaemonStateResponse(0) + 20);
      uint64_t v101 = &a1[v100];
      uint64_t v102 = &a2[v100];
      uint64_t v103 = *((void *)v102 + 1);
      *(void *)uint64_t v101 = *(void *)v102;
      *((void *)v101 + 1) = v103;
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v4 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = *(int *)(type metadata accessor for ErrorResponse(0) + 20);
      uint64_t v6 = &a1[v5];
      uint64_t v7 = &a2[v5];
      uint64_t v8 = *((void *)v7 + 1);
      *(void *)uint64_t v6 = *(void *)v7;
      *((void *)v6 + 1) = v8;
      swift_bridgeObjectRetain();
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *assignWithCopy for SubscriptionClientResponse.OneOf_Type(char *a1, char *a2)
{
  if (a1 != a2)
  {
    sub_23723CDC0((uint64_t)a1, type metadata accessor for SubscriptionClientResponse.OneOf_Type);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v8 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        uint64_t v9 = *(int *)(type metadata accessor for PingResponse(0) + 20);
        uint64_t v10 = &a1[v9];
        uint64_t v11 = &a2[v9];
        *(void *)uint64_t v10 = *(void *)v11;
        *((void *)v10 + 1) = *((void *)v11 + 1);
        swift_bridgeObjectRetain();
        break;
      case 2u:
        uint64_t v12 = sub_2372A4780();
        uint64_t v13 = (void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
        uint64_t v139 = *v13;
        (*v13)(a1, a2, v12);
        uint64_t v14 = (int *)type metadata accessor for NewOfferResponse(0);
        uint64_t v15 = v14[5];
        uint64_t v16 = &a1[v15];
        uint64_t v17 = &a2[v15];
        __int16 v18 = *((_WORD *)v17 + 4);
        *(void *)uint64_t v16 = *(void *)v17;
        *((_WORD *)v16 + 4) = v18;
        uint64_t v19 = v14[6];
        uint64_t v20 = &a1[v19];
        uint64_t v21 = &a2[v19];
        LOBYTE(v18) = v21[8];
        *(void *)uint64_t v20 = *(void *)v21;
        v20[8] = v18;
        uint64_t v22 = v14[7];
        uint64_t v23 = &a1[v22];
        uint64_t v24 = &a2[v22];
        uint64_t v25 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v26 = *((void *)v25 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v26 + 48))(v24, 1, v25))
        {
          uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
        }
        else
        {
          v139(v23, v24, v12);
          uint64_t v102 = v25[5];
          uint64_t v103 = &v23[v102];
          uint64_t v104 = &v24[v102];
          *(void *)uint64_t v103 = *(void *)v104;
          *((void *)v103 + 1) = *((void *)v104 + 1);
          uint64_t v105 = v25[6];
          uint64_t v106 = &v23[v105];
          uint64_t v107 = &v24[v105];
          *(void *)uint64_t v106 = *(void *)v107;
          *((void *)v106 + 1) = *((void *)v107 + 1);
          uint64_t v108 = v25[7];
          uint64_t v109 = &v23[v108];
          uint64_t v110 = &v24[v108];
          *(void *)uint64_t v109 = *(void *)v110;
          *((void *)v109 + 1) = *((void *)v110 + 1);
          uint64_t v111 = v25[8];
          uint64_t v112 = &v23[v111];
          uint64_t v113 = &v24[v111];
          *(void *)uint64_t v112 = *(void *)v113;
          *((void *)v112 + 1) = *((void *)v113 + 1);
          uint64_t v114 = *(void (**)(char *, void, uint64_t, int *))(v26 + 56);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v114(v23, 0, 1, v25);
        }
        uint64_t v115 = v14[8];
        uint64_t v116 = &a1[v115];
        uint64_t v117 = &a2[v115];
        uint64_t v118 = *(void *)v117;
        v116[8] = v117[8];
        *(void *)uint64_t v116 = v118;
        uint64_t v119 = v14[9];
        uint64_t v120 = &a1[v119];
        uint64_t v121 = &a2[v119];
        *(void *)uint64_t v120 = *(void *)v121;
        *((void *)v120 + 1) = *((void *)v121 + 1);
        swift_bridgeObjectRetain();
        break;
      case 3u:
        *(void *)a1 = *(void *)a2;
        uint64_t v28 = type metadata accessor for FeaturesResponse(0);
        uint64_t v29 = *(int *)(v28 + 20);
        uint64_t v30 = &a1[v29];
        uint64_t v31 = &a2[v29];
        uint64_t v32 = sub_2372A4780();
        uint64_t v33 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16);
        swift_bridgeObjectRetain();
        v33(v30, v31, v32);
        uint64_t v34 = *(int *)(v28 + 24);
        uint64_t v35 = &a1[v34];
        uint64_t v36 = &a2[v34];
        char v37 = v36[8];
        *(void *)uint64_t v35 = *(void *)v36;
        v35[8] = v37;
        break;
      case 4u:
        uint64_t v38 = sub_2372A4780();
        uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16);
        v39(a1, a2, v38);
        uint64_t v40 = *(int *)(type metadata accessor for GetStateResponse(0) + 20);
        uint64_t v41 = &a1[v40];
        uint64_t v42 = &a2[v40];
        uint64_t v43 = type metadata accessor for DaemonState(0);
        uint64_t v44 = *(void *)(v43 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v42, 1, v43))
        {
          uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
          memcpy(v41, v42, *(void *)(*(void *)(v45 - 8) + 64));
        }
        else
        {
          v39(v41, v42, v38);
          *(void *)&v41[*(int *)(v43 + 20)] = *(void *)&v42[*(int *)(v43 + 20)];
          uint64_t v122 = *(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56);
          swift_retain();
          v122(v41, 0, 1, v43);
        }
        break;
      case 5u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        uint64_t v46 = (int *)type metadata accessor for DataResponse(0);
        uint64_t v47 = v46[6];
        uint64_t v140 = &a1[v47];
        uint64_t v48 = &a2[v47];
        uint64_t v49 = sub_2372A4780();
        uint64_t v50 = *(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v50(v140, v48, v49);
        a1[v46[7]] = a2[v46[7]];
        a1[v46[8]] = a2[v46[8]];
        break;
      case 6u:
        uint64_t v51 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(a1, a2, v51);
        uint64_t v52 = type metadata accessor for NotificationPendingResponse(0);
        a1[*(int *)(v52 + 20)] = a2[*(int *)(v52 + 20)];
        uint64_t v53 = *(int *)(v52 + 24);
        uint64_t v54 = &a1[v53];
        uint64_t v55 = &a2[v53];
        char v56 = v55[8];
        *(void *)uint64_t v54 = *(void *)v55;
        v54[8] = v56;
        break;
      case 7u:
        uint64_t v57 = sub_2372A4780();
        uint64_t v58 = *(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16);
        v58(a1, a2, v57);
        uint64_t v59 = *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
        uint64_t v60 = &a1[v59];
        char v61 = &a2[v59];
        uint64_t v62 = (int *)type metadata accessor for CliActivityState(0);
        uint64_t v63 = *((void *)v62 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v63 + 48))(v61, 1, v62))
        {
          uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
          memcpy(v60, v61, *(void *)(*(void *)(v64 - 8) + 64));
        }
        else
        {
          v58(v60, v61, v57);
          uint64_t v123 = v62[5];
          uint64_t v124 = &v60[v123];
          uint64_t v125 = &v61[v123];
          *(void *)uint64_t v124 = *(void *)v125;
          *((void *)v124 + 1) = *((void *)v125 + 1);
          uint64_t v126 = v62[6];
          uint64_t v127 = &v60[v126];
          char v128 = &v61[v126];
          char v129 = v128[8];
          *(void *)uint64_t v127 = *(void *)v128;
          v127[8] = v129;
          uint64_t v130 = v62[7];
          uint64_t v131 = &v60[v130];
          uint64_t v132 = &v61[v130];
          char v133 = v132[8];
          *(void *)uint64_t v131 = *(void *)v132;
          v131[8] = v133;
          uint64_t v134 = *(void (**)(char *, void, uint64_t, int *))(v63 + 56);
          swift_bridgeObjectRetain();
          v134(v60, 0, 1, v62);
        }
        break;
      case 8u:
      case 0xAu:
      case 0xCu:
        uint64_t v75 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 16))(a1, a2, v75);
        break;
      case 9u:
        *(void *)a1 = *(void *)a2;
        uint64_t v65 = *(int *)(type metadata accessor for ActivityStatusResponse(0) + 20);
        uint64_t v66 = &a1[v65];
        uint64_t v67 = &a2[v65];
        uint64_t v68 = sub_2372A4780();
        uint64_t v69 = *(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 16);
        swift_bridgeObjectRetain();
        v69(v66, v67, v68);
        break;
      case 0xBu:
        *(void *)a1 = *(void *)a2;
        uint64_t v70 = *(int *)(type metadata accessor for GetBiomeStreamResponse(0) + 20);
        uint64_t v71 = &a1[v70];
        uint64_t v72 = &a2[v70];
        uint64_t v73 = sub_2372A4780();
        uint64_t v74 = *(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 16);
        swift_bridgeObjectRetain();
        v74(v71, v72, v73);
        break;
      case 0xDu:
        uint64_t v76 = sub_2372A4780();
        uint64_t v77 = *(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 16);
        v77(a1, a2, v76);
        uint64_t v78 = *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
        uint64_t v79 = &a1[v78];
        uint64_t v80 = &a2[v78];
        uint64_t v81 = type metadata accessor for SystemActivityHistory_File(0);
        uint64_t v82 = *(void *)(v81 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48))(v80, 1, v81))
        {
          uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
          memcpy(v79, v80, *(void *)(*(void *)(v83 - 8) + 64));
        }
        else
        {
          *(void *)uint64_t v79 = *(void *)v80;
          uint64_t v135 = *(int *)(v81 + 20);
          uint64_t v136 = &v79[v135];
          uint64_t v137 = &v80[v135];
          swift_bridgeObjectRetain();
          v77(v136, v137, v76);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v82 + 56))(v79, 0, 1, v81);
        }
        break;
      case 0xEu:
        uint64_t v84 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v84 - 8) + 16))(a1, a2, v84);
        uint64_t v85 = *(int *)(type metadata accessor for MobileAssetDownloadResponse(0) + 20);
        uint64_t v86 = &a1[v85];
        uint64_t v87 = &a2[v85];
        char v88 = v87[8];
        *(void *)uint64_t v86 = *(void *)v87;
        v86[8] = v88;
        break;
      case 0xFu:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        uint64_t v89 = type metadata accessor for ShadowEvaluationResponse(0);
        uint64_t v90 = *(int *)(v89 + 24);
        uint64_t v141 = &a1[v90];
        uint64_t v91 = &a2[v90];
        uint64_t v92 = sub_2372A4780();
        uint64_t v93 = *(void (**)(char *, char *, uint64_t))(*(void *)(v92 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v93(v141, v91, v92);
        a1[*(int *)(v89 + 28)] = a2[*(int *)(v89 + 28)];
        break;
      case 0x10u:
        uint64_t v94 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v94 - 8) + 16))(a1, a2, v94);
        uint64_t v95 = *(int *)(type metadata accessor for MobileAssetGetVersionResponse(0) + 20);
        uint64_t v96 = &a1[v95];
        uint64_t v97 = &a2[v95];
        *(void *)uint64_t v96 = *(void *)v97;
        *((void *)v96 + 1) = *((void *)v97 + 1);
        swift_bridgeObjectRetain();
        break;
      case 0x11u:
        uint64_t v98 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v98 - 8) + 16))(a1, a2, v98);
        uint64_t v99 = *(int *)(type metadata accessor for DeleteDaemonStateResponse(0) + 20);
        uint64_t v100 = &a1[v99];
        uint64_t v101 = &a2[v99];
        *(void *)uint64_t v100 = *(void *)v101;
        *((void *)v100 + 1) = *((void *)v101 + 1);
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v4 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        uint64_t v5 = *(int *)(type metadata accessor for ErrorResponse(0) + 20);
        uint64_t v6 = &a1[v5];
        uint64_t v7 = &a2[v5];
        *(void *)uint64_t v6 = *(void *)v7;
        *((void *)v6 + 1) = *((void *)v7 + 1);
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for SubscriptionClientResponse.OneOf_Type(char *a1, char *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v6 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = type metadata accessor for PingResponse(0);
      *(_OWORD *)&a1[*(int *)(v7 + 20)] = *(_OWORD *)&a2[*(int *)(v7 + 20)];
      break;
    case 2u:
      uint64_t v8 = sub_2372A4780();
      uint64_t v9 = (void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32);
      uint64_t v97 = *v9;
      (*v9)(a1, a2, v8);
      uint64_t v10 = (int *)type metadata accessor for NewOfferResponse(0);
      uint64_t v11 = v10[5];
      uint64_t v12 = &a1[v11];
      uint64_t v13 = &a2[v11];
      *(void *)uint64_t v12 = *(void *)v13;
      *((_WORD *)v12 + 4) = *((_WORD *)v13 + 4);
      uint64_t v14 = v10[6];
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      *(void *)uint64_t v15 = *(void *)v16;
      v15[8] = v16[8];
      uint64_t v17 = v10[7];
      __int16 v18 = &a1[v17];
      uint64_t v19 = &a2[v17];
      uint64_t v20 = (int *)type metadata accessor for QuotaServerState(0);
      uint64_t v21 = *((void *)v20 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v21 + 48))(v19, 1, v20))
      {
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
        memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        v97(v18, v19, v8);
        *(_OWORD *)&v18[v20[5]] = *(_OWORD *)&v19[v20[5]];
        *(_OWORD *)&v18[v20[6]] = *(_OWORD *)&v19[v20[6]];
        *(_OWORD *)&v18[v20[7]] = *(_OWORD *)&v19[v20[7]];
        *(_OWORD *)&v18[v20[8]] = *(_OWORD *)&v19[v20[8]];
        (*(void (**)(char *, void, uint64_t, int *))(v21 + 56))(v18, 0, 1, v20);
      }
      uint64_t v87 = v10[8];
      char v88 = &a1[v87];
      uint64_t v89 = &a2[v87];
      *(void *)char v88 = *(void *)v89;
      v88[8] = v89[8];
      *(_OWORD *)&a1[v10[9]] = *(_OWORD *)&a2[v10[9]];
      break;
    case 3u:
      *(void *)a1 = *(void *)a2;
      uint64_t v23 = type metadata accessor for FeaturesResponse(0);
      uint64_t v24 = *(int *)(v23 + 20);
      uint64_t v25 = &a1[v24];
      uint64_t v26 = &a2[v24];
      uint64_t v27 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
      uint64_t v28 = *(int *)(v23 + 24);
      uint64_t v29 = &a1[v28];
      uint64_t v30 = &a2[v28];
      *(void *)uint64_t v29 = *(void *)v30;
      v29[8] = v30[8];
      break;
    case 4u:
      uint64_t v31 = sub_2372A4780();
      uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32);
      v32(a1, a2, v31);
      uint64_t v33 = *(int *)(type metadata accessor for GetStateResponse(0) + 20);
      uint64_t v34 = &a1[v33];
      uint64_t v35 = &a2[v33];
      uint64_t v36 = type metadata accessor for DaemonState(0);
      uint64_t v37 = *(void *)(v36 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
      {
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
        memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
      }
      else
      {
        v32(v34, v35, v31);
        *(void *)&v34[*(int *)(v36 + 20)] = *(void *)&v35[*(int *)(v36 + 20)];
        (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
      }
      break;
    case 5u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v39 = (int *)type metadata accessor for DataResponse(0);
      uint64_t v40 = v39[6];
      uint64_t v41 = &a1[v40];
      uint64_t v42 = &a2[v40];
      uint64_t v43 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 32))(v41, v42, v43);
      a1[v39[7]] = a2[v39[7]];
      a1[v39[8]] = a2[v39[8]];
      break;
    case 6u:
      uint64_t v44 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32))(a1, a2, v44);
      uint64_t v45 = type metadata accessor for NotificationPendingResponse(0);
      a1[*(int *)(v45 + 20)] = a2[*(int *)(v45 + 20)];
      uint64_t v46 = *(int *)(v45 + 24);
      uint64_t v47 = &a1[v46];
      uint64_t v48 = &a2[v46];
      v47[8] = v48[8];
      *(void *)uint64_t v47 = *(void *)v48;
      break;
    case 7u:
      uint64_t v49 = sub_2372A4780();
      uint64_t v50 = *(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 32);
      v50(a1, a2, v49);
      uint64_t v51 = *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
      uint64_t v52 = &a1[v51];
      uint64_t v53 = &a2[v51];
      uint64_t v54 = (int *)type metadata accessor for CliActivityState(0);
      uint64_t v55 = *((void *)v54 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v55 + 48))(v53, 1, v54))
      {
        uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
        memcpy(v52, v53, *(void *)(*(void *)(v56 - 8) + 64));
      }
      else
      {
        v50(v52, v53, v49);
        *(_OWORD *)&v52[v54[5]] = *(_OWORD *)&v53[v54[5]];
        uint64_t v90 = v54[6];
        uint64_t v91 = &v52[v90];
        uint64_t v92 = &v53[v90];
        *(void *)uint64_t v91 = *(void *)v92;
        v91[8] = v92[8];
        uint64_t v93 = v54[7];
        uint64_t v94 = &v52[v93];
        uint64_t v95 = &v53[v93];
        *(void *)uint64_t v94 = *(void *)v95;
        v94[8] = v95[8];
        (*(void (**)(char *, void, uint64_t, int *))(v55 + 56))(v52, 0, 1, v54);
      }
      break;
    case 8u:
    case 0xAu:
    case 0xCu:
      uint64_t v65 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v65 - 8) + 32))(a1, a2, v65);
      break;
    case 9u:
      *(void *)a1 = *(void *)a2;
      uint64_t v57 = *(int *)(type metadata accessor for ActivityStatusResponse(0) + 20);
      uint64_t v58 = &a1[v57];
      uint64_t v59 = &a2[v57];
      uint64_t v60 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 32))(v58, v59, v60);
      break;
    case 0xBu:
      *(void *)a1 = *(void *)a2;
      uint64_t v61 = *(int *)(type metadata accessor for GetBiomeStreamResponse(0) + 20);
      uint64_t v62 = &a1[v61];
      uint64_t v63 = &a2[v61];
      uint64_t v64 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 32))(v62, v63, v64);
      break;
    case 0xDu:
      uint64_t v66 = sub_2372A4780();
      uint64_t v67 = *(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32);
      v67(a1, a2, v66);
      uint64_t v68 = *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
      uint64_t v69 = &a1[v68];
      uint64_t v70 = &a2[v68];
      uint64_t v71 = type metadata accessor for SystemActivityHistory_File(0);
      uint64_t v72 = *(void *)(v71 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48))(v70, 1, v71))
      {
        uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
        memcpy(v69, v70, *(void *)(*(void *)(v73 - 8) + 64));
      }
      else
      {
        *(void *)uint64_t v69 = *(void *)v70;
        v67(&v69[*(int *)(v71 + 20)], &v70[*(int *)(v71 + 20)], v66);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v69, 0, 1, v71);
      }
      break;
    case 0xEu:
      uint64_t v74 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v74 - 8) + 32))(a1, a2, v74);
      uint64_t v75 = *(int *)(type metadata accessor for MobileAssetDownloadResponse(0) + 20);
      uint64_t v76 = &a1[v75];
      uint64_t v77 = &a2[v75];
      *(void *)uint64_t v76 = *(void *)v77;
      v76[8] = v77[8];
      break;
    case 0xFu:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v78 = type metadata accessor for ShadowEvaluationResponse(0);
      uint64_t v79 = *(int *)(v78 + 24);
      uint64_t v80 = &a1[v79];
      uint64_t v81 = &a2[v79];
      uint64_t v82 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v82 - 8) + 32))(v80, v81, v82);
      a1[*(int *)(v78 + 28)] = a2[*(int *)(v78 + 28)];
      break;
    case 0x10u:
      uint64_t v83 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 32))(a1, a2, v83);
      uint64_t VersionResponse = type metadata accessor for MobileAssetGetVersionResponse(0);
      *(_OWORD *)&a1[*(int *)(VersionResponse + 20)] = *(_OWORD *)&a2[*(int *)(VersionResponse + 20)];
      break;
    case 0x11u:
      uint64_t v85 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 32))(a1, a2, v85);
      uint64_t v86 = type metadata accessor for DeleteDaemonStateResponse(0);
      *(_OWORD *)&a1[*(int *)(v86 + 20)] = *(_OWORD *)&a2[*(int *)(v86 + 20)];
      break;
    default:
      uint64_t v4 = sub_2372A4780();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
      uint64_t v5 = type metadata accessor for ErrorResponse(0);
      *(_OWORD *)&a1[*(int *)(v5 + 20)] = *(_OWORD *)&a2[*(int *)(v5 + 20)];
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *assignWithTake for SubscriptionClientResponse.OneOf_Type(char *a1, char *a2)
{
  if (a1 != a2)
  {
    sub_23723CDC0((uint64_t)a1, type metadata accessor for SubscriptionClientResponse.OneOf_Type);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v6 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        uint64_t v7 = type metadata accessor for PingResponse(0);
        *(_OWORD *)&a1[*(int *)(v7 + 20)] = *(_OWORD *)&a2[*(int *)(v7 + 20)];
        break;
      case 2u:
        uint64_t v8 = sub_2372A4780();
        uint64_t v9 = (void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32);
        uint64_t v97 = *v9;
        (*v9)(a1, a2, v8);
        uint64_t v10 = (int *)type metadata accessor for NewOfferResponse(0);
        uint64_t v11 = v10[5];
        uint64_t v12 = &a1[v11];
        uint64_t v13 = &a2[v11];
        *(void *)uint64_t v12 = *(void *)v13;
        *((_WORD *)v12 + 4) = *((_WORD *)v13 + 4);
        uint64_t v14 = v10[6];
        uint64_t v15 = &a1[v14];
        uint64_t v16 = &a2[v14];
        *(void *)uint64_t v15 = *(void *)v16;
        v15[8] = v16[8];
        uint64_t v17 = v10[7];
        __int16 v18 = &a1[v17];
        uint64_t v19 = &a2[v17];
        uint64_t v20 = (int *)type metadata accessor for QuotaServerState(0);
        uint64_t v21 = *((void *)v20 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v21 + 48))(v19, 1, v20))
        {
          uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECE090);
          memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
        }
        else
        {
          v97(v18, v19, v8);
          *(_OWORD *)&v18[v20[5]] = *(_OWORD *)&v19[v20[5]];
          *(_OWORD *)&v18[v20[6]] = *(_OWORD *)&v19[v20[6]];
          *(_OWORD *)&v18[v20[7]] = *(_OWORD *)&v19[v20[7]];
          *(_OWORD *)&v18[v20[8]] = *(_OWORD *)&v19[v20[8]];
          (*(void (**)(char *, void, uint64_t, int *))(v21 + 56))(v18, 0, 1, v20);
        }
        uint64_t v87 = v10[8];
        char v88 = &a1[v87];
        uint64_t v89 = &a2[v87];
        *(void *)char v88 = *(void *)v89;
        v88[8] = v89[8];
        *(_OWORD *)&a1[v10[9]] = *(_OWORD *)&a2[v10[9]];
        break;
      case 3u:
        *(void *)a1 = *(void *)a2;
        uint64_t v23 = type metadata accessor for FeaturesResponse(0);
        uint64_t v24 = *(int *)(v23 + 20);
        uint64_t v25 = &a1[v24];
        uint64_t v26 = &a2[v24];
        uint64_t v27 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
        uint64_t v28 = *(int *)(v23 + 24);
        uint64_t v29 = &a1[v28];
        uint64_t v30 = &a2[v28];
        *(void *)uint64_t v29 = *(void *)v30;
        v29[8] = v30[8];
        break;
      case 4u:
        uint64_t v31 = sub_2372A4780();
        uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32);
        v32(a1, a2, v31);
        uint64_t v33 = *(int *)(type metadata accessor for GetStateResponse(0) + 20);
        uint64_t v34 = &a1[v33];
        uint64_t v35 = &a2[v33];
        uint64_t v36 = type metadata accessor for DaemonState(0);
        uint64_t v37 = *(void *)(v36 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
        {
          uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083A0);
          memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
        }
        else
        {
          v32(v34, v35, v31);
          *(void *)&v34[*(int *)(v36 + 20)] = *(void *)&v35[*(int *)(v36 + 20)];
          (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
        }
        break;
      case 5u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v39 = (int *)type metadata accessor for DataResponse(0);
        uint64_t v40 = v39[6];
        uint64_t v41 = &a1[v40];
        uint64_t v42 = &a2[v40];
        uint64_t v43 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 32))(v41, v42, v43);
        a1[v39[7]] = a2[v39[7]];
        a1[v39[8]] = a2[v39[8]];
        break;
      case 6u:
        uint64_t v44 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32))(a1, a2, v44);
        uint64_t v45 = type metadata accessor for NotificationPendingResponse(0);
        a1[*(int *)(v45 + 20)] = a2[*(int *)(v45 + 20)];
        uint64_t v46 = *(int *)(v45 + 24);
        uint64_t v47 = &a1[v46];
        uint64_t v48 = &a2[v46];
        v47[8] = v48[8];
        *(void *)uint64_t v47 = *(void *)v48;
        break;
      case 7u:
        uint64_t v49 = sub_2372A4780();
        uint64_t v50 = *(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 32);
        v50(a1, a2, v49);
        uint64_t v51 = *(int *)(type metadata accessor for SetCliActivityResponse(0) + 20);
        uint64_t v52 = &a1[v51];
        uint64_t v53 = &a2[v51];
        uint64_t v54 = (int *)type metadata accessor for CliActivityState(0);
        uint64_t v55 = *((void *)v54 - 1);
        if ((*(unsigned int (**)(char *, uint64_t, int *))(v55 + 48))(v53, 1, v54))
        {
          uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECBF78);
          memcpy(v52, v53, *(void *)(*(void *)(v56 - 8) + 64));
        }
        else
        {
          v50(v52, v53, v49);
          *(_OWORD *)&v52[v54[5]] = *(_OWORD *)&v53[v54[5]];
          uint64_t v90 = v54[6];
          uint64_t v91 = &v52[v90];
          uint64_t v92 = &v53[v90];
          *(void *)uint64_t v91 = *(void *)v92;
          v91[8] = v92[8];
          uint64_t v93 = v54[7];
          uint64_t v94 = &v52[v93];
          uint64_t v95 = &v53[v93];
          *(void *)uint64_t v94 = *(void *)v95;
          v94[8] = v95[8];
          (*(void (**)(char *, void, uint64_t, int *))(v55 + 56))(v52, 0, 1, v54);
        }
        break;
      case 8u:
      case 0xAu:
      case 0xCu:
        uint64_t v65 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v65 - 8) + 32))(a1, a2, v65);
        break;
      case 9u:
        *(void *)a1 = *(void *)a2;
        uint64_t v57 = *(int *)(type metadata accessor for ActivityStatusResponse(0) + 20);
        uint64_t v58 = &a1[v57];
        uint64_t v59 = &a2[v57];
        uint64_t v60 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 32))(v58, v59, v60);
        break;
      case 0xBu:
        *(void *)a1 = *(void *)a2;
        uint64_t v61 = *(int *)(type metadata accessor for GetBiomeStreamResponse(0) + 20);
        uint64_t v62 = &a1[v61];
        uint64_t v63 = &a2[v61];
        uint64_t v64 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 32))(v62, v63, v64);
        break;
      case 0xDu:
        uint64_t v66 = sub_2372A4780();
        uint64_t v67 = *(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32);
        v67(a1, a2, v66);
        uint64_t v68 = *(int *)(type metadata accessor for ActivityHistoryResponse(0) + 20);
        uint64_t v69 = &a1[v68];
        uint64_t v70 = &a2[v68];
        uint64_t v71 = type metadata accessor for SystemActivityHistory_File(0);
        uint64_t v72 = *(void *)(v71 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48))(v70, 1, v71))
        {
          uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689083B0);
          memcpy(v69, v70, *(void *)(*(void *)(v73 - 8) + 64));
        }
        else
        {
          *(void *)uint64_t v69 = *(void *)v70;
          v67(&v69[*(int *)(v71 + 20)], &v70[*(int *)(v71 + 20)], v66);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v69, 0, 1, v71);
        }
        break;
      case 0xEu:
        uint64_t v74 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v74 - 8) + 32))(a1, a2, v74);
        uint64_t v75 = *(int *)(type metadata accessor for MobileAssetDownloadResponse(0) + 20);
        uint64_t v76 = &a1[v75];
        uint64_t v77 = &a2[v75];
        *(void *)uint64_t v76 = *(void *)v77;
        v76[8] = v77[8];
        break;
      case 0xFu:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v78 = type metadata accessor for ShadowEvaluationResponse(0);
        uint64_t v79 = *(int *)(v78 + 24);
        uint64_t v80 = &a1[v79];
        uint64_t v81 = &a2[v79];
        uint64_t v82 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v82 - 8) + 32))(v80, v81, v82);
        a1[*(int *)(v78 + 28)] = a2[*(int *)(v78 + 28)];
        break;
      case 0x10u:
        uint64_t v83 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 32))(a1, a2, v83);
        uint64_t VersionResponse = type metadata accessor for MobileAssetGetVersionResponse(0);
        *(_OWORD *)&a1[*(int *)(VersionResponse + 20)] = *(_OWORD *)&a2[*(int *)(VersionResponse + 20)];
        break;
      case 0x11u:
        uint64_t v85 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 32))(a1, a2, v85);
        uint64_t v86 = type metadata accessor for DeleteDaemonStateResponse(0);
        *(_OWORD *)&a1[*(int *)(v86 + 20)] = *(_OWORD *)&a2[*(int *)(v86 + 20)];
        break;
      default:
        uint64_t v4 = sub_2372A4780();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
        uint64_t v5 = type metadata accessor for ErrorResponse(0);
        *(_OWORD *)&a1[*(int *)(v5 + 20)] = *(_OWORD *)&a2[*(int *)(v5 + 20)];
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2372A18F8()
{
  uint64_t result = type metadata accessor for ErrorResponse(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for PingResponse(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for NewOfferResponse(319);
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for FeaturesResponse(319);
        if (v4 <= 0x3F)
        {
          uint64_t result = type metadata accessor for GetStateResponse(319);
          if (v5 <= 0x3F)
          {
            uint64_t result = type metadata accessor for DataResponse(319);
            if (v6 <= 0x3F)
            {
              uint64_t result = type metadata accessor for NotificationPendingResponse(319);
              if (v7 <= 0x3F)
              {
                uint64_t result = type metadata accessor for SetCliActivityResponse(319);
                if (v8 <= 0x3F)
                {
                  uint64_t result = sub_2372A4780();
                  if (v9 <= 0x3F)
                  {
                    uint64_t result = type metadata accessor for ActivityStatusResponse(319);
                    if (v10 <= 0x3F)
                    {
                      uint64_t result = type metadata accessor for GetBiomeStreamResponse(319);
                      if (v11 <= 0x3F)
                      {
                        uint64_t result = type metadata accessor for ActivityHistoryResponse(319);
                        if (v12 <= 0x3F)
                        {
                          uint64_t result = type metadata accessor for MobileAssetDownloadResponse(319);
                          if (v13 <= 0x3F)
                          {
                            uint64_t result = type metadata accessor for ShadowEvaluationResponse(319);
                            if (v14 <= 0x3F)
                            {
                              uint64_t result = type metadata accessor for MobileAssetGetVersionResponse(319);
                              if (v15 <= 0x3F)
                              {
                                uint64_t result = type metadata accessor for DeleteDaemonStateResponse(319);
                                if (v16 <= 0x3F)
                                {
                                  swift_initEnumMetadataMultiPayload();
                                  return 0;
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
  return result;
}

unint64_t sub_2372A1D04()
{
  unint64_t result = qword_26AECD558;
  if (!qword_26AECD558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AECD558);
  }
  return result;
}

unint64_t sub_2372A1D58()
{
  unint64_t result = qword_268908AE8;
  if (!qword_268908AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268908AE8);
  }
  return result;
}

unint64_t sub_2372A1DAC()
{
  unint64_t result = qword_268908AF0;
  if (!qword_268908AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268908AF0);
  }
  return result;
}

uint64_t NotificationPendingRequest.traverse<A>(visitor:)()
{
  return GetStateRequest.traverse<A>(visitor:)();
}

uint64_t NotificationStateWriteResponse.traverse<A>(visitor:)()
{
  return GetStateRequest.traverse<A>(visitor:)();
}

uint64_t MobileAssetGetVersionRequest.traverse<A>(visitor:)()
{
  return GetStateRequest.traverse<A>(visitor:)();
}

uint64_t DisplayDelayedOfferResponse.traverse<A>(visitor:)()
{
  return GetStateRequest.traverse<A>(visitor:)();
}

uint64_t ActivityStatusRequest.traverse<A>(visitor:)()
{
  return GetStateRequest.traverse<A>(visitor:)();
}

uint64_t ActivityClearResponse.traverse<A>(visitor:)()
{
  return GetStateRequest.traverse<A>(visitor:)();
}

uint64_t ActivityHistoryRequest.traverse<A>(visitor:)()
{
  return GetStateRequest.traverse<A>(visitor:)();
}

uint64_t XpcSubscriptionClientConnection.__allocating_init(onError:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for XpcSubscriptionClientConnection();
  uint64_t v4 = swift_allocObject();
  XpcSubscriptionClientConnection.init(forServiceName:onError:)(0xD000000000000031, 0x80000002372AE1D0, a1, a2);
  return v4;
}

uint64_t sub_2372A1F80()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  unint64_t v3 = (void *)((char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_allocate_value_buffer(v1, qword_268908C40);
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_268908C40);
  v7[1] = type metadata accessor for XpcSubscriptionClientConnection();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268908C68);
  *unint64_t v3 = sub_2372A4BC0();
  v3[1] = v5;
  swift_bridgeObjectRetain();
  sub_2372A4A70();
  return sub_23720F970((uint64_t)v3, v4);
}

uint64_t XpcSubscriptionClientConnection.__allocating_init(forServiceName:onError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  XpcSubscriptionClientConnection.init(forServiceName:onError:)(a1, a2, a3, a4);
  return v8;
}

uint64_t type metadata accessor for XpcSubscriptionClientConnection()
{
  return self;
}

uint64_t *XpcSubscriptionClientConnection.init(forServiceName:onError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *v4;
  id v8 = objc_allocWithZone(MEMORY[0x263F08D68]);
  unint64_t v9 = (void *)sub_2372A4B50();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_initWithMachServiceName_options_, v9, 0);

  v4[2] = (uint64_t)v10;
  unint64_t v11 = self;
  id v12 = v10;
  id v13 = objc_msgSend(v11, sel_interfaceWithProtocol_, &unk_26EA3F4F0);
  objc_msgSend(v12, sel_setRemoteObjectInterface_, v13);

  unint64_t v14 = (void *)v4[2];
  objc_msgSend(v14, sel_resume);
  unint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = v7;
  v21[4] = sub_2372A2784;
  v21[5] = v15;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 1107296256;
  v21[2] = sub_2372A254C;
  v21[3] = &block_descriptor_2;
  unint64_t v16 = _Block_copy(v21);
  id v17 = v14;
  swift_retain();
  swift_release();
  id v18 = objc_msgSend(v17, sel_remoteObjectProxyWithErrorHandler_, v16);
  _Block_release(v16);

  sub_2372A4E90();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AECC788);
  if (swift_dynamicCast())
  {
    uint64_t v19 = v21[7];
    swift_release();
    v4[3] = v19;
  }
  else
  {
    sub_2372A27A8();
    swift_allocError();
    swift_willThrow();
    swift_release();

    type metadata accessor for XpcSubscriptionClientConnection();
    swift_deallocPartialClassInstance();
  }
  return v4;
}

uint64_t sub_2372A23D0(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = type metadata accessor for Logger();
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268907B88 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v4, (uint64_t)qword_268908C40);
  sub_23720F68C(v7, (uint64_t)v6);
  uint64_t v10 = 0;
  unint64_t v11 = 0xE000000000000000;
  sub_2372A4EE0();
  sub_2372A4C60();
  v9[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268908D00);
  sub_2372A4F30();
  sub_2372A4C60();
  sub_23720FCDC(3, v10, v11);
  swift_bridgeObjectRelease();
  sub_23720C2CC((uint64_t)v6);
  return a2(a1);
}

void sub_2372A254C(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t XpcSubscriptionClientConnection.getProtocol()()
{
  return swift_unknownObjectRetain();
}

uint64_t static XpcSubscriptionClientConnection.XpcError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t XpcSubscriptionClientConnection.XpcError.hash(into:)()
{
  return sub_2372A5070();
}

uint64_t XpcSubscriptionClientConnection.XpcError.hashValue.getter()
{
  return sub_2372A5080();
}

uint64_t sub_2372A2630()
{
  return 1;
}

uint64_t sub_2372A2638()
{
  return sub_2372A5080();
}

uint64_t sub_2372A267C()
{
  return sub_2372A5070();
}

uint64_t sub_2372A26A4()
{
  return sub_2372A5080();
}

uint64_t XpcSubscriptionClientConnection.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t XpcSubscriptionClientConnection.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2372A274C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2372A2784(uint64_t a1)
{
  return sub_2372A23D0(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unint64_t sub_2372A27A8()
{
  unint64_t result = qword_268908C58;
  if (!qword_268908C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268908C58);
  }
  return result;
}

unint64_t sub_2372A2800()
{
  unint64_t result = qword_268908C60;
  if (!qword_268908C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268908C60);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for XpcSubscriptionClientConnection.XpcError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for XpcSubscriptionClientConnection.XpcError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2372A2944);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for XpcSubscriptionClientConnection.XpcError()
{
  return &type metadata for XpcSubscriptionClientConnection.XpcError;
}

uint64_t sub_2372A297C(uint64_t a1, void *a2)
{
  return sub_2372A29C4(a1, a2, (void (*)(void))type metadata accessor for SubscriptionClientResponse, &qword_26AECCA50, (void (*)(uint64_t))type metadata accessor for SubscriptionClientResponse);
}

uint64_t sub_2372A29C4(uint64_t a1, void *a2, void (*a3)(void), unint64_t *a4, void (*a5)(uint64_t))
{
  uint64_t v9 = type metadata accessor for Logger();
  MEMORY[0x270FA5388](v9);
  a3(0);
  sub_2372A3AD0(a4, a5);
  uint64_t v10 = sub_2372A4930();
  unint64_t v12 = v11;
  id v13 = objc_allocWithZone(MEMORY[0x263EFF8F8]);
  sub_23723A284(v10, v12);
  unint64_t v14 = (void *)sub_2372A4630();
  id v15 = objc_msgSend(v13, sel_initWithData_, v14);
  sub_23720CAB8(v10, v12);

  unint64_t v16 = (void *)sub_2372A4B50();
  objc_msgSend(a2, sel_encodeObject_forKey_, v15, v16);

  return sub_23720CAB8(v10, v12);
}

uint64_t sub_2372A2C6C@<X0>(uint64_t a1@<X8>)
{
  return sub_2372A2CB4(type metadata accessor for SubscriptionClientResponse, &qword_26AECCA50, (void (*)(uint64_t))type metadata accessor for SubscriptionClientResponse, a1);
}

uint64_t sub_2372A2CB4@<X0>(uint64_t (*a1)(void)@<X1>, unint64_t *a2@<X2>, void (*a3)(uint64_t)@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for Logger();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2372A47E0();
  MEMORY[0x270FA5388](v11 - 8);
  sub_23723A5E0();
  uint64_t v12 = sub_2372A4E00();
  if (v12)
  {
    id v13 = (void *)v12;
    v19[1] = v10;
    uint64_t v14 = a1(0);
    id v15 = v13;
    sub_237239AF8(v15);
    uint64_t v22 = 0;
    long long v20 = 0u;
    long long v21 = 0u;
    sub_2372A47D0();
    sub_2372A3AD0(a2, a3);
    sub_2372A4920();

    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a4, 0, 1, v14);
  }
  else
  {
    if (qword_268907A18 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v8, (uint64_t)qword_268908368);
    sub_2372A3714(v16, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Logger);
    sub_23720FCDC(3, 0xD000000000000030, 0x80000002372B05A0);
    sub_2372A377C((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Logger);
    uint64_t v17 = a1(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a4, 1, 1, v17);
  }
}

id XpcSubscriptionClientRequest.__allocating_init(withProto:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  sub_2372A3714(a1, (uint64_t)v3 + OBJC_IVAR___ISOXpcSubscriptionClientRequest_proto, type metadata accessor for SubscriptionClientRequest);
  v6.receiver = v3;
  v6.super_class = v1;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  sub_2372A377C(a1, type metadata accessor for SubscriptionClientRequest);
  return v4;
}

uint64_t sub_2372A3118()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  id v3 = (void *)((char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_allocate_value_buffer(v1, qword_268908C70);
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_268908C70);
  v7[1] = type metadata accessor for XpcSubscriptionClientRequest();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268908D08);
  *id v3 = sub_2372A4BC0();
  v3[1] = v5;
  swift_bridgeObjectRetain();
  sub_2372A4A70();
  return sub_2372A3B18((uint64_t)v3, v4, (uint64_t (*)(void))type metadata accessor for Logger);
}

uint64_t XpcSubscriptionClientRequest.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2372A3714(v1 + OBJC_IVAR___ISOXpcSubscriptionClientRequest_proto, a1, type metadata accessor for SubscriptionClientRequest);
}

id XpcSubscriptionClientRequest.init(withProto:)(uint64_t a1)
{
  sub_2372A3714(a1, (uint64_t)v1 + OBJC_IVAR___ISOXpcSubscriptionClientRequest_proto, type metadata accessor for SubscriptionClientRequest);
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for XpcSubscriptionClientRequest();
  id v3 = objc_msgSendSuper2(&v5, sel_init);
  sub_2372A377C(a1, type metadata accessor for SubscriptionClientRequest);
  return v3;
}

uint64_t type metadata accessor for XpcSubscriptionClientRequest()
{
  uint64_t result = qword_26AECC6B8;
  if (!qword_26AECC6B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id XpcSubscriptionClientRequest.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return XpcSubscriptionClientRequest.init(coder:)(a1);
}

id XpcSubscriptionClientRequest.init(coder:)(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  MEMORY[0x270FA5388](v3);
  objc_super v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268908C88);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SubscriptionClientRequest(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = v1;
  sub_2372A2CB4(type metadata accessor for SubscriptionClientRequest, (unint64_t *)&qword_26AECC8F0, (void (*)(uint64_t))type metadata accessor for SubscriptionClientRequest, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {

    sub_2372A36B4((uint64_t)v8);
    if (qword_268907B90 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v3, (uint64_t)qword_268908C70);
    sub_2372A3714(v14, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Logger);
    sub_23720FCDC(3, 0xD000000000000025, 0x80000002372B0B30);

    sub_2372A377C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Logger);
    type metadata accessor for XpcSubscriptionClientRequest();
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    sub_2372A3B18((uint64_t)v8, (uint64_t)v12, type metadata accessor for SubscriptionClientRequest);
    sub_2372A3B18((uint64_t)v12, (uint64_t)v13 + OBJC_IVAR___ISOXpcSubscriptionClientRequest_proto, type metadata accessor for SubscriptionClientRequest);

    uint64_t v16 = (objc_class *)type metadata accessor for XpcSubscriptionClientRequest();
    v18.receiver = v13;
    v18.super_class = v16;
    id v15 = objc_msgSendSuper2(&v18, sel_init);
  }
  return v15;
}

uint64_t sub_2372A36B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268908C88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2372A3714(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2372A377C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t static XpcSubscriptionClientRequest.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall XpcSubscriptionClientRequest.encode(with:)(NSCoder with)
{
  sub_2372A29C4(v1 + OBJC_IVAR___ISOXpcSubscriptionClientRequest_proto, with.super.isa, (void (*)(void))type metadata accessor for SubscriptionClientRequest, (unint64_t *)&qword_26AECC8F0, (void (*)(uint64_t))type metadata accessor for SubscriptionClientRequest);
}

id XpcSubscriptionClientRequest.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void XpcSubscriptionClientRequest.init()()
{
}

id XpcSubscriptionClientRequest.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XpcSubscriptionClientRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2372A3A38()
{
  return type metadata accessor for XpcSubscriptionClientRequest();
}

uint64_t sub_2372A3A40()
{
  uint64_t result = type metadata accessor for SubscriptionClientRequest(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2372A3AD0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2372A3B18(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id XpcSubscriptionClientResponse.__allocating_init(fromProto:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  sub_2372A41C8(a1, (uint64_t)v3 + OBJC_IVAR___ISOXpcSubscriptionClientResponse_proto, type metadata accessor for SubscriptionClientResponse);
  v6.receiver = v3;
  v6.super_class = v1;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  sub_2372A4230(a1, type metadata accessor for SubscriptionClientResponse);
  return v4;
}

uint64_t sub_2372A3C10()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  id v3 = (void *)((char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_allocate_value_buffer(v1, qword_268908D70);
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_268908D70);
  v7[1] = type metadata accessor for SubscriptionClientResponse(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268908D88);
  *id v3 = sub_2372A4BC0();
  v3[1] = v5;
  swift_bridgeObjectRetain();
  sub_2372A4A70();
  return sub_2372A44E8((uint64_t)v3, v4, (uint64_t (*)(void))type metadata accessor for Logger);
}

uint64_t XpcSubscriptionClientResponse.proto.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2372A41C8(v1 + OBJC_IVAR___ISOXpcSubscriptionClientResponse_proto, a1, type metadata accessor for SubscriptionClientResponse);
}

id XpcSubscriptionClientResponse.init(fromProto:)(uint64_t a1)
{
  sub_2372A41C8(a1, (uint64_t)v1 + OBJC_IVAR___ISOXpcSubscriptionClientResponse_proto, type metadata accessor for SubscriptionClientResponse);
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for XpcSubscriptionClientResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_init);
  sub_2372A4230(a1, type metadata accessor for SubscriptionClientResponse);
  return v3;
}

uint64_t type metadata accessor for XpcSubscriptionClientResponse()
{
  uint64_t result = qword_26AECC6C8;
  if (!qword_26AECC6C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id XpcSubscriptionClientResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return XpcSubscriptionClientResponse.init(coder:)(a1);
}

id XpcSubscriptionClientResponse.init(coder:)(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  MEMORY[0x270FA5388](v3);
  objc_super v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECCA98);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SubscriptionClientResponse(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = v1;
  sub_2372A2C6C((uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {

    sub_2372A4168((uint64_t)v8);
    if (qword_268907B98 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v3, (uint64_t)qword_268908D70);
    sub_2372A41C8(v14, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Logger);
    sub_23720FCDC(3, 0xD000000000000025, 0x80000002372B0C20);

    sub_2372A4230((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Logger);
    type metadata accessor for XpcSubscriptionClientResponse();
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    sub_2372A44E8((uint64_t)v8, (uint64_t)v12, type metadata accessor for SubscriptionClientResponse);
    sub_2372A44E8((uint64_t)v12, (uint64_t)v13 + OBJC_IVAR___ISOXpcSubscriptionClientResponse_proto, type metadata accessor for SubscriptionClientResponse);

    uint64_t v16 = (objc_class *)type metadata accessor for XpcSubscriptionClientResponse();
    v18.receiver = v13;
    v18.super_class = v16;
    id v15 = objc_msgSendSuper2(&v18, sel_init);
  }
  return v15;
}

uint64_t sub_2372A4168(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AECCA98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2372A41C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2372A4230(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t static XpcSubscriptionClientResponse.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall XpcSubscriptionClientResponse.encode(with:)(NSCoder with)
{
  sub_2372A297C(v1 + OBJC_IVAR___ISOXpcSubscriptionClientResponse_proto, with.super.isa);
}

id XpcSubscriptionClientResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void XpcSubscriptionClientResponse.init()()
{
}

id XpcSubscriptionClientResponse.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XpcSubscriptionClientResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2372A4450()
{
  return type metadata accessor for XpcSubscriptionClientResponse();
}

uint64_t sub_2372A4458()
{
  uint64_t result = type metadata accessor for SubscriptionClientResponse(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2372A44E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2372A4550()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_2372A4560()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_2372A4570()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2372A4580()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2372A4590()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_2372A45A0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2372A45B0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2372A45C0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2372A45D0()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_2372A45E0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2372A45F0()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_2372A4600()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2372A4610()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_2372A4620()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_2372A4630()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2372A4640()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2372A4650()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_2372A4660()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_2372A4670()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_2372A4680()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2372A4690()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_2372A46A0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_2372A46B0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2372A46C0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2372A46D0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2372A46E0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_2372A46F0()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_2372A4700()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_2372A4710()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_2372A4720()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2372A4730()
{
  return MEMORY[0x270EF1590]();
}

uint64_t sub_2372A4740()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_2372A4750()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_2372A4760()
{
  return MEMORY[0x270F44A18]();
}

uint64_t _s31iCloudSubscriptionOptimizerCore10LitmusInfoV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_2372A4780()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_2372A4790()
{
  return MEMORY[0x270F44A78]();
}

uint64_t sub_2372A47A0()
{
  return MEMORY[0x270F44A80]();
}

uint64_t sub_2372A47B0()
{
  return MEMORY[0x270F44A90]();
}

uint64_t sub_2372A47C0()
{
  return MEMORY[0x270F44A98]();
}

uint64_t sub_2372A47D0()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_2372A47E0()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_2372A47F0()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_2372A4820()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_2372A4830()
{
  return MEMORY[0x270F44B20]();
}

uint64_t sub_2372A4840()
{
  return MEMORY[0x270F44B38]();
}

uint64_t sub_2372A4850()
{
  return MEMORY[0x270F44B48]();
}

uint64_t sub_2372A4860()
{
  return MEMORY[0x270F44B60]();
}

uint64_t sub_2372A4870()
{
  return MEMORY[0x270F44B88]();
}

uint64_t sub_2372A4880()
{
  return MEMORY[0x270F44B98]();
}

uint64_t sub_2372A4890()
{
  return MEMORY[0x270F44BA8]();
}

uint64_t sub_2372A48A0()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_2372A48B0()
{
  return MEMORY[0x270F44BD8]();
}

uint64_t sub_2372A48C0()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_2372A48D0()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_2372A48E0()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_2372A48F0()
{
  return MEMORY[0x270F44C70]();
}

uint64_t sub_2372A4900()
{
  return MEMORY[0x270F44C78]();
}

uint64_t sub_2372A4910()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_2372A4920()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_2372A4930()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_2372A4940()
{
  return MEMORY[0x270F44CC0]();
}

uint64_t sub_2372A4950()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_2372A4960()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t sub_2372A4970()
{
  return MEMORY[0x270F44D28]();
}

uint64_t sub_2372A4980()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_2372A4990()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_2372A49A0()
{
  return MEMORY[0x270F44D90]();
}

uint64_t sub_2372A49B0()
{
  return MEMORY[0x270F44D98]();
}

uint64_t sub_2372A49C0()
{
  return MEMORY[0x270F44DA0]();
}

uint64_t sub_2372A49D0()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_2372A49E0()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_2372A49F0()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_2372A4A00()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_2372A4A10()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_2372A4A20()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_2372A4A30()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_2372A4A40()
{
  return MEMORY[0x270F44E20]();
}

uint64_t sub_2372A4A50()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_2372A4A60()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2372A4A70()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2372A4A80()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2372A4A90()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_2372A4AA0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2372A4AB0()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_2372A4AC0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2372A4AD0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2372A4AE0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2372A4AF0()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t sub_2372A4B00()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2372A4B10()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2372A4B20()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2372A4B30()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2372A4B40()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2372A4B50()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2372A4B60()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2372A4B70()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_2372A4B80()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_2372A4B90()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2372A4BA0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_2372A4BB0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_2372A4BC0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2372A4BD0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2372A4BE0()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_2372A4BF0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2372A4C00()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_2372A4C10()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2372A4C20()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2372A4C30()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2372A4C40()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_2372A4C50()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_2372A4C60()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2372A4C70()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_2372A4C80()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2372A4C90()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2372A4CA0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2372A4CB0()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_2372A4CC0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2372A4CD0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2372A4CE0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2372A4CF0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2372A4D00()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2372A4D10()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2372A4D20()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2372A4D40()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_2372A4D50()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_2372A4D60()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2372A4D70()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2372A4D80()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2372A4D90()
{
  return MEMORY[0x270FA0C08]();
}

uint64_t sub_2372A4DA0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2372A4DB0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2372A4DC0()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_2372A4DD0()
{
  return MEMORY[0x270EF2090]();
}

uint64_t sub_2372A4DE0()
{
  return MEMORY[0x270EF20A0]();
}

uint64_t sub_2372A4DF0()
{
  return MEMORY[0x270EF20A8]();
}

uint64_t sub_2372A4E00()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_2372A4E10()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_2372A4E20()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2372A4E30()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_2372A4E40()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_2372A4E50()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_2372A4E60()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2372A4E70()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2372A4E80()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_2372A4E90()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2372A4EA0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2372A4EB0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2372A4EC0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2372A4ED0()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_2372A4EE0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2372A4EF0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2372A4F00()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2372A4F10()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2372A4F20()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_2372A4F30()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2372A4F40()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2372A4F50()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2372A4F60()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2372A4F70()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2372A4F80()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2372A4F90()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2372A4FA0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2372A4FB0()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_2372A4FC0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2372A4FD0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2372A4FE0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_2372A4FF0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2372A5000()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2372A5010()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2372A5020()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2372A5030()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2372A5040()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2372A5050()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_2372A5060()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2372A5070()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2372A5080()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}