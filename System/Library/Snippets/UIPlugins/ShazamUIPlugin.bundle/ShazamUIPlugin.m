void destroy for ShazamListeningView(uint64_t a1)
{
  void *v2;
  uint64_t vars8;

  swift_release();
  v2 = *(void **)(a1 + 8);
}

void *_s14ShazamUIPlugin19ShazamListeningViewVwCP_0(void *a1, void *a2)
{
  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  id v4 = v3;
  return a1;
}

void *assignWithCopy for ShazamListeningView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  id v4 = (void *)a1[1];
  v5 = (void *)a2[1];
  a1[1] = v5;
  id v6 = v5;

  a1[2] = a2[2];
  return a1;
}

__n128 initializeWithTake for ShazamListeningView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ShazamListeningView(uint64_t a1, uint64_t a2)
{
  swift_release();
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ShazamListeningView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ShazamListeningView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShazamListeningView()
{
  return &type metadata for ShazamListeningView;
}

uint64_t sub_3C74(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_EF08, 1);
}

uint64_t sub_3C90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_4370(&qword_140A8);
  __chkstk_darwin();
  int v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_DED0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_DEE0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_DF10();
  swift_allocObject();
  sub_DF00();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for MatchingFlowState.listening(_:), v9);
  sub_DEF0();
  swift_retain();
  sub_DEC0();
  LOBYTE(v9) = sub_DF70();
  sub_DF50();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v4, v8, v5);
  v21 = &v4[*(int *)(v2 + 36)];
  char *v21 = v9;
  *((void *)v21 + 1) = v14;
  *((void *)v21 + 2) = v16;
  *((void *)v21 + 3) = v18;
  *((void *)v21 + 4) = v20;
  v21[40] = 0;
  sub_43B4();
  uint64_t v22 = sub_DFE0();
  swift_release();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *a1 = v22;
  return result;
}

uint64_t sub_3F1C()
{
  return sub_DFA0();
}

uint64_t sub_3F3C(uint64_t a1, uint64_t a2)
{
  return sub_40A8(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_3F54(uint64_t a1, id *a2)
{
  uint64_t result = sub_E020();
  *a2 = 0;
  return result;
}

uint64_t sub_3FCC(uint64_t a1, id *a2)
{
  char v3 = sub_E030();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_404C@<X0>(void *a1@<X8>)
{
  sub_E040();
  NSString v2 = sub_E010();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_4090(uint64_t a1, uint64_t a2)
{
  return sub_40A8(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_40A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_E040();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_40EC()
{
  sub_E040();
  sub_E060();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_4140()
{
  sub_E040();
  sub_E230();
  sub_E060();
  Swift::Int v0 = sub_E250();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_41B4()
{
  uint64_t v0 = sub_E040();
  uint64_t v2 = v1;
  if (v0 == sub_E040() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_E1D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_4240@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_E010();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_4288@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_E040();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_42B4(uint64_t a1)
{
  uint64_t v2 = sub_45E4(&qword_140E0, (void (*)(uint64_t))type metadata accessor for SHMediaItemProperty);
  uint64_t v3 = sub_45E4(&qword_140E8, (void (*)(uint64_t))type metadata accessor for SHMediaItemProperty);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_4370(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_43B4()
{
  unint64_t result = qword_140B0;
  if (!qword_140B0)
  {
    sub_4460(&qword_140A8);
    sub_45E4((unint64_t *)&qword_140B8, (void (*)(uint64_t))&type metadata accessor for MatchingFlowView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_140B0);
  }
  return result;
}

uint64_t sub_4460(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for SHMediaItemProperty()
{
  if (!qword_140C0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_140C0);
    }
  }
}

void *sub_4500()
{
  return &protocol witness table for AnyView;
}

uint64_t sub_450C()
{
  return sub_45E4(&qword_140C8, (void (*)(uint64_t))type metadata accessor for SHMediaItemProperty);
}

uint64_t sub_4554()
{
  return sub_45E4(&qword_140D0, (void (*)(uint64_t))type metadata accessor for SHMediaItemProperty);
}

uint64_t sub_459C()
{
  return sub_45E4(&qword_140D8, (void (*)(uint64_t))type metadata accessor for SHMediaItemProperty);
}

uint64_t sub_45E4(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_462C(void *a1, char *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *(void *)a2;
    *uint64_t v4 = *(void *)a2;
    uint64_t v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v6;
    uint64_t v7 = *((void *)a2 + 3);
    a1[2] = *((void *)a2 + 2);
    a1[3] = v7;
    uint64_t v8 = *((void *)a2 + 5);
    a1[4] = *((void *)a2 + 4);
    a1[5] = v8;
    uint64_t v9 = *((void *)a2 + 7);
    a1[6] = *((void *)a2 + 6);
    a1[7] = v9;
    uint64_t v10 = *((void *)a2 + 9);
    a1[8] = *((void *)a2 + 8);
    a1[9] = v10;
    uint64_t v11 = *((void *)a2 + 11);
    a1[10] = *((void *)a2 + 10);
    a1[11] = v11;
    uint64_t matched = type metadata accessor for ShazamSuccessfulMatchModel();
    uint64_t v13 = *(int *)(matched + 40);
    __dst = (char *)v4 + v13;
    v46 = (int *)matched;
    v43 = &a2[v13];
    uint64_t v14 = sub_DE80();
    uint64_t v44 = *(void *)(v14 - 8);
    uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v15(v43, 1, v14))
    {
      uint64_t v16 = sub_4370(&qword_140F0);
      memcpy(__dst, v43, *(void *)(*(void *)(v16 - 8) + 64));
      uint64_t v17 = v44;
    }
    else
    {
      uint64_t v17 = v44;
      (*(void (**)(char *, char *, uint64_t))(v44 + 16))(__dst, v43, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(__dst, 0, 1, v14);
    }
    uint64_t v19 = v46[11];
    uint64_t v20 = (char *)v4 + v19;
    v21 = &a2[v19];
    if (v15(&a2[v19], 1, v14))
    {
      uint64_t v22 = sub_4370(&qword_140F0);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v21, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v20, 0, 1, v14);
    }
    uint64_t v23 = v46[12];
    uint64_t v24 = (char *)v4 + v23;
    v25 = &a2[v23];
    if (v15(&a2[v23], 1, v14))
    {
      uint64_t v26 = sub_4370(&qword_140F0);
      memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v24, v25, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v24, 0, 1, v14);
    }
    uint64_t v27 = v46[13];
    v28 = (char *)v4 + v27;
    v29 = &a2[v27];
    if (v15(&a2[v27], 1, v14))
    {
      uint64_t v30 = sub_4370(&qword_140F0);
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v28, v29, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v28, 0, 1, v14);
    }
    *((unsigned char *)v4 + v46[14]) = a2[v46[14]];
    uint64_t v31 = v46[15];
    v32 = (void *)((char *)v4 + v31);
    v33 = &a2[v31];
    uint64_t v34 = *((void *)v33 + 1);
    void *v32 = *(void *)v33;
    v32[1] = v34;
    *((unsigned char *)v4 + v46[16]) = a2[v46[16]];
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_4370(&qword_140F8);
    *(void *)((char *)v4 + *(int *)(v35 + 28)) = *(void *)&a2[*(int *)(v35 + 28)];
    uint64_t v36 = *(int *)(a3 + 20);
    v37 = (void *)((char *)v4 + v36);
    v38 = &a2[v36];
    v40 = *(void **)v38;
    uint64_t v39 = *((void *)v38 + 1);
    void *v37 = v40;
    v37[1] = v39;
    swift_retain();
    id v41 = v40;
  }
  return v4;
}

void sub_4A68(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t matched = (int *)type metadata accessor for ShazamSuccessfulMatchModel();
  uint64_t v5 = a1 + matched[10];
  uint64_t v6 = sub_DE80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v9 = a1 + matched[11];
  if (!v8(v9, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v10 = a1 + matched[12];
  if (!v8(v10, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  }
  uint64_t v11 = a1 + matched[13];
  if (!v8(v11, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v6);
  }
  swift_bridgeObjectRelease();
  sub_4370(&qword_140F8);
  swift_release();
  v12 = *(void **)(a1 + *(int *)(a2 + 20));
}

void *sub_4C5C(void *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *a1 = *(void *)a2;
  a1[1] = v5;
  uint64_t v6 = *((void *)a2 + 3);
  a1[2] = *((void *)a2 + 2);
  a1[3] = v6;
  uint64_t v7 = *((void *)a2 + 5);
  a1[4] = *((void *)a2 + 4);
  a1[5] = v7;
  uint64_t v8 = *((void *)a2 + 7);
  a1[6] = *((void *)a2 + 6);
  a1[7] = v8;
  uint64_t v9 = *((void *)a2 + 9);
  a1[8] = *((void *)a2 + 8);
  a1[9] = v9;
  uint64_t v10 = *((void *)a2 + 11);
  a1[10] = *((void *)a2 + 10);
  a1[11] = v10;
  uint64_t matched = type metadata accessor for ShazamSuccessfulMatchModel();
  uint64_t v12 = *(int *)(matched + 40);
  __dst = (char *)a1 + v12;
  uint64_t v44 = (int *)matched;
  id v41 = &a2[v12];
  uint64_t v13 = sub_DE80();
  uint64_t v42 = *(void *)(v13 - 8);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v14(v41, 1, v13))
  {
    uint64_t v15 = sub_4370(&qword_140F0);
    memcpy(__dst, v41, *(void *)(*(void *)(v15 - 8) + 64));
    uint64_t v16 = v42;
  }
  else
  {
    uint64_t v16 = v42;
    (*(void (**)(char *, char *, uint64_t))(v42 + 16))(__dst, v41, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(__dst, 0, 1, v13);
  }
  uint64_t v17 = v44[11];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = &a2[v17];
  if (v14(&a2[v17], 1, v13))
  {
    uint64_t v20 = sub_4370(&qword_140F0);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v18, v19, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v18, 0, 1, v13);
  }
  uint64_t v21 = v44[12];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = &a2[v21];
  if (v14(&a2[v21], 1, v13))
  {
    uint64_t v24 = sub_4370(&qword_140F0);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v22, v23, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v13);
  }
  uint64_t v25 = v44[13];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = &a2[v25];
  if (v14(&a2[v25], 1, v13))
  {
    uint64_t v28 = sub_4370(&qword_140F0);
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v26, v27, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v26, 0, 1, v13);
  }
  *((unsigned char *)a1 + v44[14]) = a2[v44[14]];
  uint64_t v29 = v44[15];
  uint64_t v30 = (void *)((char *)a1 + v29);
  uint64_t v31 = &a2[v29];
  uint64_t v32 = *((void *)v31 + 1);
  *uint64_t v30 = *(void *)v31;
  v30[1] = v32;
  *((unsigned char *)a1 + v44[16]) = a2[v44[16]];
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_4370(&qword_140F8);
  *(void *)((char *)a1 + *(int *)(v33 + 28)) = *(void *)&a2[*(int *)(v33 + 28)];
  uint64_t v34 = *(int *)(a3 + 20);
  uint64_t v35 = (void *)((char *)a1 + v34);
  uint64_t v36 = &a2[v34];
  v38 = *(void **)v36;
  uint64_t v37 = *((void *)v36 + 1);
  *uint64_t v35 = v38;
  v35[1] = v37;
  swift_retain();
  id v39 = v38;
  return a1;
}

char *sub_5048(char *a1, void *a2, uint64_t a3)
{
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = a2[2];
  *((void *)a1 + 3) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 4) = a2[4];
  *((void *)a1 + 5) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 6) = a2[6];
  *((void *)a1 + 7) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 8) = a2[8];
  *((void *)a1 + 9) = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 10) = a2[10];
  *((void *)a1 + 11) = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t matched = (int *)type metadata accessor for ShazamSuccessfulMatchModel();
  uint64_t v6 = matched[10];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_DE80();
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
    uint64_t v14 = sub_4370(&qword_140F0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = matched[11];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (char *)a2 + v15;
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
LABEL_12:
    uint64_t v20 = sub_4370(&qword_140F0);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v16, v17, v9);
LABEL_13:
  uint64_t v21 = matched[12];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = (char *)a2 + v21;
  int v24 = v11(&a1[v21], 1, v9);
  int v25 = v11(v23, 1, v9);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v22, v23, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v22, v9);
LABEL_18:
    uint64_t v26 = sub_4370(&qword_140F0);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v22, v23, v9);
LABEL_19:
  uint64_t v27 = matched[13];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = (char *)a2 + v27;
  int v30 = v11(&a1[v27], 1, v9);
  int v31 = v11(v29, 1, v9);
  if (!v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v28, v29, v9);
      goto LABEL_25;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v28, v9);
    goto LABEL_24;
  }
  if (v31)
  {
LABEL_24:
    uint64_t v32 = sub_4370(&qword_140F0);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v28, v29, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v28, 0, 1, v9);
LABEL_25:
  a1[matched[14]] = *((unsigned char *)a2 + matched[14]);
  uint64_t v33 = matched[15];
  uint64_t v34 = &a1[v33];
  uint64_t v35 = (void *)((char *)a2 + v33);
  *(void *)uint64_t v34 = *v35;
  *((void *)v34 + 1) = v35[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[matched[16]] = *((unsigned char *)a2 + matched[16]);
  uint64_t v36 = sub_4370(&qword_140F8);
  *(void *)&a1[*(int *)(v36 + 28)] = *(void *)((char *)a2 + *(int *)(v36 + 28));
  swift_retain();
  swift_release();
  uint64_t v37 = *(int *)(a3 + 20);
  v38 = &a1[v37];
  id v39 = (char *)a2 + v37;
  v40 = *(void **)&a1[v37];
  id v41 = *(void **)v39;
  *(void *)v38 = *(void *)v39;
  id v42 = v41;

  *((void *)v38 + 1) = *((void *)v39 + 1);
  return a1;
}

_OWORD *sub_5628(_OWORD *a1, char *a2, uint64_t a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *a1 = *(_OWORD *)a2;
  a1[1] = v6;
  long long v7 = *((_OWORD *)a2 + 3);
  a1[2] = *((_OWORD *)a2 + 2);
  a1[3] = v7;
  long long v8 = *((_OWORD *)a2 + 5);
  a1[4] = *((_OWORD *)a2 + 4);
  a1[5] = v8;
  uint64_t matched = (int *)type metadata accessor for ShazamSuccessfulMatchModel();
  uint64_t v10 = matched[10];
  uint64_t v11 = (char *)a1 + v10;
  int v12 = &a2[v10];
  uint64_t v13 = sub_DE80();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v15(v12, 1, v13))
  {
    uint64_t v16 = sub_4370(&qword_140F0);
    memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  uint64_t v17 = matched[11];
  int v18 = (char *)a1 + v17;
  int v19 = &a2[v17];
  if (v15(&a2[v17], 1, v13))
  {
    uint64_t v20 = sub_4370(&qword_140F0);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v18, v19, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v18, 0, 1, v13);
  }
  uint64_t v21 = matched[12];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = &a2[v21];
  if (v15(&a2[v21], 1, v13))
  {
    uint64_t v24 = sub_4370(&qword_140F0);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v22, v23, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v22, 0, 1, v13);
  }
  uint64_t v25 = matched[13];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = &a2[v25];
  if (v15(&a2[v25], 1, v13))
  {
    uint64_t v28 = sub_4370(&qword_140F0);
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v26, v27, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v26, 0, 1, v13);
  }
  *((unsigned char *)a1 + matched[14]) = a2[matched[14]];
  *(_OWORD *)((char *)a1 + matched[15]) = *(_OWORD *)&a2[matched[15]];
  *((unsigned char *)a1 + matched[16]) = a2[matched[16]];
  uint64_t v29 = sub_4370(&qword_140F8);
  *(void *)((char *)a1 + *(int *)(v29 + 28)) = *(void *)&a2[*(int *)(v29 + 28)];
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_598C(char *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[3];
  *((void *)a1 + 2) = a2[2];
  *((void *)a1 + 3) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[5];
  *((void *)a1 + 4) = a2[4];
  *((void *)a1 + 5) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[7];
  *((void *)a1 + 6) = a2[6];
  *((void *)a1 + 7) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[9];
  *((void *)a1 + 8) = a2[8];
  *((void *)a1 + 9) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[11];
  *((void *)a1 + 10) = a2[10];
  *((void *)a1 + 11) = v10;
  swift_bridgeObjectRelease();
  uint64_t matched = (int *)type metadata accessor for ShazamSuccessfulMatchModel();
  uint64_t v12 = matched[10];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_DE80();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    uint64_t v20 = sub_4370(&qword_140F0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_7:
  uint64_t v21 = matched[11];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = (char *)a2 + v21;
  int v24 = v17(&a1[v21], 1, v15);
  int v25 = v17(v23, 1, v15);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v22, v23, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
LABEL_12:
    uint64_t v26 = sub_4370(&qword_140F0);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v22, v23, v15);
LABEL_13:
  uint64_t v27 = matched[12];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = (char *)a2 + v27;
  int v30 = v17(&a1[v27], 1, v15);
  int v31 = v17(v29, 1, v15);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v28, v29, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v28, 0, 1, v15);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v28, v15);
LABEL_18:
    uint64_t v32 = sub_4370(&qword_140F0);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v28, v29, v15);
LABEL_19:
  uint64_t v33 = matched[13];
  uint64_t v34 = &a1[v33];
  uint64_t v35 = (char *)a2 + v33;
  int v36 = v17(&a1[v33], 1, v15);
  int v37 = v17(v35, 1, v15);
  if (!v36)
  {
    if (!v37)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v34, v35, v15);
      goto LABEL_25;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v34, v15);
    goto LABEL_24;
  }
  if (v37)
  {
LABEL_24:
    uint64_t v38 = sub_4370(&qword_140F0);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v34, v35, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v34, 0, 1, v15);
LABEL_25:
  a1[matched[14]] = *((unsigned char *)a2 + matched[14]);
  uint64_t v39 = matched[15];
  v40 = &a1[v39];
  id v41 = (void *)((char *)a2 + v39);
  uint64_t v43 = *v41;
  uint64_t v42 = v41[1];
  *(void *)v40 = v43;
  *((void *)v40 + 1) = v42;
  swift_bridgeObjectRelease();
  a1[matched[16]] = *((unsigned char *)a2 + matched[16]);
  uint64_t v44 = sub_4370(&qword_140F8);
  *(void *)&a1[*(int *)(v44 + 28)] = *(void *)((char *)a2 + *(int *)(v44 + 28));
  swift_release();
  uint64_t v45 = *(int *)(a3 + 20);
  v46 = &a1[v45];
  v47 = (void *)((char *)a2 + v45);
  v48 = *(void **)&a1[v45];
  *(void *)v46 = *v47;

  *((void *)v46 + 1) = v47[1];
  return a1;
}

uint64_t sub_5EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5F04);
}

uint64_t sub_5F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_4370(&qword_140F8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
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

uint64_t sub_5FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5FE8);
}

uint64_t sub_5FE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_4370(&qword_140F8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t type metadata accessor for ShazamSuccessfulMatchView()
{
  uint64_t result = qword_14158;
  if (!qword_14158) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_60F4()
{
  sub_6188();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_6188()
{
  if (!qword_14168)
  {
    type metadata accessor for ShazamSuccessfulMatchModel();
    unint64_t v0 = sub_DFD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_14168);
    }
  }
}

uint64_t sub_61E0(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_EF64, 1);
}

uint64_t sub_61FC@<X0>(uint64_t *a1@<X8>)
{
  v126 = a1;
  uint64_t v125 = sub_4370(&qword_140A8);
  ((void (*)(void))__chkstk_darwin)();
  v124 = (char *)&v106 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_DED0();
  uint64_t v122 = *(void *)(v2 - 8);
  uint64_t v123 = v2;
  ((void (*)(void))__chkstk_darwin)();
  v121 = (char *)&v106 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_DEE0();
  uint64_t v119 = *(void *)(v4 - 8);
  uint64_t v120 = v4;
  ((void (*)(void))__chkstk_darwin)();
  v118 = (char *)&v106 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_DEB0();
  uint64_t v128 = *(void *)(v117 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v127 = (char *)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = type metadata accessor for ShazamSuccessfulMatchModel() - 8;
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v116 = (char *)&v106 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  v115 = (char *)&v106 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v114 = (char *)&v106 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  v112 = (char *)&v106 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v111 = (char *)&v106 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v109 = (char *)&v106 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v108 = (char *)&v106 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = (char **)((char *)&v106 - v22);
  uint64_t v24 = __chkstk_darwin(v21);
  v106 = (char *)&v106 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v106 - v27;
  uint64_t v29 = __chkstk_darwin(v26);
  int v31 = (char *)&v106 - v30;
  __chkstk_darwin(v29);
  uint64_t v33 = (uint64_t *)((char *)&v106 - v32);
  uint64_t v113 = sub_84F8(0, &qword_14198);
  sub_4370(&qword_141A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_E870;
  *(void *)(inited + 32) = SHMediaItemShazamID;
  uint64_t v35 = SHMediaItemShazamID;
  sub_4370(&qword_140F8);
  sub_DFC0();
  uint64_t v37 = *v33;
  uint64_t v36 = v33[1];
  swift_bridgeObjectRetain();
  sub_7754((uint64_t)v33);
  uint64_t v38 = sub_4370(&qword_141A8);
  *(void *)(inited + 40) = v37;
  *(void *)(inited + 48) = v36;
  *(void *)(inited + 64) = v38;
  *(void *)(inited + 72) = SHMediaItemTitle;
  uint64_t v39 = v38;
  v40 = SHMediaItemTitle;
  sub_DFC0();
  uint64_t v42 = *((void *)v31 + 2);
  uint64_t v41 = *((void *)v31 + 3);
  swift_bridgeObjectRetain();
  sub_7754((uint64_t)v31);
  *(void *)(inited + 80) = v42;
  *(void *)(inited + 88) = v41;
  *(void *)(inited + 104) = v39;
  *(void *)(inited + 112) = SHMediaItemSubtitle;
  uint64_t v43 = SHMediaItemSubtitle;
  sub_DFC0();
  uint64_t v44 = *((void *)v28 + 4);
  uint64_t v45 = *((void *)v28 + 5);
  swift_bridgeObjectRetain();
  sub_7754((uint64_t)v28);
  *(void *)(inited + 120) = v44;
  *(void *)(inited + 128) = v45;
  *(void *)(inited + 144) = v39;
  *(void *)(inited + 152) = SHMediaItemArtist;
  v46 = SHMediaItemArtist;
  uint64_t v47 = (uint64_t)v106;
  sub_DFC0();
  uint64_t v48 = *(void *)(v47 + 48);
  uint64_t v49 = *(void *)(v47 + 56);
  swift_bridgeObjectRetain();
  sub_7754(v47);
  *(void *)(inited + 160) = v48;
  *(void *)(inited + 168) = v49;
  *(void *)(inited + 184) = v39;
  *(void *)(inited + 192) = SHMediaItemGenres;
  uint64_t v107 = v39;
  sub_4370(&qword_141B0);
  uint64_t v50 = swift_allocObject();
  *(_OWORD *)(v50 + 16) = xmmword_E880;
  v51 = SHMediaItemGenres;
  sub_DFC0();
  uint64_t v53 = v23[8];
  uint64_t v52 = v23[9];
  swift_bridgeObjectRetain();
  sub_7754((uint64_t)v23);
  *(void *)(v50 + 32) = v53;
  *(void *)(v50 + 40) = v52;
  uint64_t v54 = sub_4370(&qword_141B8);
  *(void *)(inited + 200) = v50;
  *(void *)(inited + 224) = v54;
  *(void *)(inited + 232) = SHMediaItemAppleMusicID;
  v55 = SHMediaItemAppleMusicID;
  sub_DFC0();
  uint64_t v57 = v23[10];
  uint64_t v56 = v23[11];
  swift_bridgeObjectRetain();
  sub_7754((uint64_t)v23);
  *(void *)(inited + 240) = v57;
  *(void *)(inited + 248) = v56;
  *(void *)(inited + 264) = v39;
  *(void *)(inited + 272) = SHMediaItemAppleMusicURL;
  v58 = SHMediaItemAppleMusicURL;
  uint64_t v59 = (uint64_t)v108;
  sub_DFC0();
  v60 = (int *)v110;
  uint64_t v61 = v59 + *(int *)(v110 + 48);
  uint64_t v62 = sub_4370(&qword_140F0);
  *(void *)(inited + 304) = v62;
  v63 = sub_77B0((uint64_t *)(inited + 280));
  sub_85D8(v61, (uint64_t)v63, &qword_140F0);
  sub_7754(v59);
  *(void *)(inited + 312) = SHMediaItemWebURL;
  v64 = SHMediaItemWebURL;
  uint64_t v65 = (uint64_t)v109;
  sub_DFC0();
  uint64_t v66 = v65 + v60[13];
  *(void *)(inited + 344) = v62;
  v67 = sub_77B0((uint64_t *)(inited + 320));
  sub_85D8(v66, (uint64_t)v67, &qword_140F0);
  sub_7754(v65);
  *(void *)(inited + 352) = SHMediaItemArtworkURL;
  v68 = SHMediaItemArtworkURL;
  uint64_t v69 = (uint64_t)v111;
  sub_DFC0();
  uint64_t v70 = v69 + v60[14];
  *(void *)(inited + 384) = v62;
  v71 = sub_77B0((uint64_t *)(inited + 360));
  sub_85D8(v70, (uint64_t)v71, &qword_140F0);
  sub_7754(v69);
  *(void *)(inited + 392) = SHMediaItemVideoURL;
  v72 = SHMediaItemVideoURL;
  uint64_t v73 = (uint64_t)v112;
  sub_DFC0();
  uint64_t v74 = v73 + v60[15];
  *(void *)(inited + 424) = v62;
  v75 = sub_77B0((uint64_t *)(inited + 400));
  sub_85D8(v74, (uint64_t)v75, &qword_140F0);
  sub_7754(v73);
  *(void *)(inited + 432) = SHMediaItemExplicitContent;
  v76 = SHMediaItemExplicitContent;
  uint64_t v77 = (uint64_t)v114;
  sub_DFC0();
  LOBYTE(v74) = *(unsigned char *)(v77 + v60[16]);
  sub_7754(v77);
  uint64_t v78 = sub_4370(&qword_141C0);
  *(unsigned char *)(inited + 440) = v74;
  *(void *)(inited + 464) = v78;
  *(void *)(inited + 472) = SHMediaItemISRC;
  v79 = SHMediaItemISRC;
  uint64_t v80 = (uint64_t)v115;
  sub_DFC0();
  v81 = (uint64_t *)(v80 + v60[17]);
  uint64_t v83 = *v81;
  uint64_t v82 = v81[1];
  swift_bridgeObjectRetain();
  sub_7754(v80);
  *(void *)(inited + 504) = v107;
  *(void *)(inited + 480) = v83;
  *(void *)(inited + 488) = v82;
  v84 = (void *)sub_6BA8(inited);
  v85 = (void *)sub_6CEC(v84);
  sub_DF10();
  swift_allocObject();
  sub_DF00();
  uint64_t v86 = (uint64_t)v116;
  sub_DFC0();
  sub_7754(v86);
  id v87 = v85;
  v88 = v127;
  sub_DEA0();
  sub_DE90();
  uint64_t v90 = v117;
  v89 = v118;
  (*(void (**)(char *, char *, uint64_t))(v128 + 16))(v118, v88, v117);
  (*(void (**)(char *, void, uint64_t))(v119 + 104))(v89, enum case for MatchingFlowState.match(_:), v120);
  sub_DEF0();
  swift_retain();
  v91 = v121;
  sub_DEC0();
  LOBYTE(v89) = sub_DF70();
  sub_DF50();
  uint64_t v93 = v92;
  uint64_t v95 = v94;
  uint64_t v97 = v96;
  uint64_t v99 = v98;
  uint64_t v101 = v122;
  uint64_t v100 = v123;
  v102 = v124;
  (*(void (**)(char *, char *, uint64_t))(v122 + 16))(v124, v91, v123);
  v103 = &v102[*(int *)(v125 + 36)];
  char *v103 = (char)v89;
  *((void *)v103 + 1) = v93;
  *((void *)v103 + 2) = v95;
  *((void *)v103 + 3) = v97;
  *((void *)v103 + 4) = v99;
  v103[40] = 0;
  sub_43B4();
  uint64_t v104 = sub_DFE0();

  swift_release();
  (*(void (**)(char *, uint64_t))(v101 + 8))(v91, v100);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v128 + 8))(v127, v90);
  uint64_t *v126 = v104;
  return result;
}

unint64_t sub_6BA8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4370(&qword_14200);
  uint64_t v2 = sub_E140();
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
    sub_85D8(v6, (uint64_t)&v13, &qword_14210);
    uint64_t v7 = v13;
    unint64_t result = sub_8538(v13, (uint64_t (*)(uint64_t, Swift::Int))sub_863C);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_7994(&v14, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_6CEC(void *a1)
{
  uint64_t v2 = v1;
  sub_4370(&qword_141C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_E890;
  *(void *)(inited + 32) = sub_E090();
  *(void *)(inited + 40) = SHMediaItemTimeRanges;
  uint64_t v5 = SHMediaItemTimeRanges;
  *(void *)(inited + 48) = sub_E0A0();
  *(void *)(inited + 56) = SHMediaItemFrequencySkewRanges;
  uint64_t v6 = SHMediaItemFrequencySkewRanges;
  unint64_t v7 = sub_7814(inited);
  int64_t v8 = 0;
  uint64_t v9 = *(void *)(v7 + 64);
  unint64_t v94 = v7 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v9;
  int64_t v95 = (unint64_t)(v10 + 63) >> 6;
  if ((v11 & v9) != 0) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v17 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v17 < v95)
    {
      unint64_t v18 = *(void *)(v94 + 8 * v17);
      ++v8;
      if (v18) {
        goto LABEL_22;
      }
      int64_t v8 = v17 + 1;
      if (v17 + 1 >= v95) {
        goto LABEL_84;
      }
      unint64_t v18 = *(void *)(v94 + 8 * v8);
      if (v18) {
        goto LABEL_22;
      }
      int64_t v8 = v17 + 2;
      if (v17 + 2 >= v95) {
        goto LABEL_84;
      }
      unint64_t v18 = *(void *)(v94 + 8 * v8);
      if (v18) {
        goto LABEL_22;
      }
      int64_t v8 = v17 + 3;
      if (v17 + 3 >= v95) {
        goto LABEL_84;
      }
      unint64_t v18 = *(void *)(v94 + 8 * v8);
      if (v18)
      {
LABEL_22:
        unint64_t v12 = (v18 - 1) & v18;
        for (unint64_t i = __clz(__rbit64(v18)) + (v8 << 6); ; unint64_t i = v15 | (v8 << 6))
        {
          uint64_t v20 = 8 * i;
          uint64_t v21 = *(void **)(*(void *)(v7 + 48) + v20);
          uint64_t v22 = *(void **)(*(void *)(v7 + 56) + v20);
          if (!a1[2])
          {
            long long v98 = 0u;
            long long v99 = 0u;
            id v13 = v21;
            id v14 = v22;
LABEL_6:

            sub_7934((uint64_t)&v98);
            if (!v12) {
              goto LABEL_8;
            }
            goto LABEL_7;
          }
          id v23 = v21;
          id v96 = v22;
          uint64_t v24 = sub_8538((uint64_t)v23, (uint64_t (*)(uint64_t, Swift::Int))sub_816C);
          if (v25)
          {
            sub_79A4(a1[7] + 32 * v24, (uint64_t)&v98);
          }
          else
          {
            long long v98 = 0u;
            long long v99 = 0u;
          }

          if (!*((void *)&v99 + 1)) {
            goto LABEL_6;
          }
          sub_7994(&v98, v100);
          sub_79A4((uint64_t)v100, (uint64_t)&v98);
          sub_4370(&qword_141D8);
          unint64_t v93 = v7;
          if (swift_dynamicCast())
          {
            uint64_t v26 = *(void *)&v97[0];
            int64_t v27 = *(void *)(*(void *)&v97[0] + 16);
            uint64_t v92 = v2;
            if (v27)
            {
              *(void *)&long long v98 = &_swiftEmptyArrayStorage;
              sub_835C(0, v27, 0);
              uint64_t v28 = (void *)v98;
              uint64_t v29 = (double *)(v26 + 40);
              do
              {
                id v30 = [objc_allocWithZone((Class)SHRange) initWithLowerBound:*(v29 - 1) upperBound:*v29];
                *(void *)&long long v98 = v28;
                unint64_t v32 = v28[2];
                unint64_t v31 = v28[3];
                if (v32 >= v31 >> 1)
                {
                  sub_835C((void *)(v31 > 1), v32 + 1, 1);
                  uint64_t v28 = (void *)v98;
                }
                v28[2] = v32 + 1;
                v28[v32 + 4] = v30;
                v29 += 2;
                --v27;
              }
              while (v27);
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_bridgeObjectRelease();
              uint64_t v28 = &_swiftEmptyArrayStorage;
            }
            *((void *)&v99 + 1) = sub_4370(&qword_141E8);
            *(void *)&long long v98 = v28;
            sub_7994(&v98, v97);
            id v55 = v96;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            id v57 = v55;
            unint64_t v59 = sub_8538((uint64_t)v55, (uint64_t (*)(uint64_t, Swift::Int))sub_816C);
            uint64_t v60 = a1[2];
            BOOL v61 = (v58 & 1) == 0;
            uint64_t v62 = v60 + v61;
            if (__OFADD__(v60, v61)) {
              goto LABEL_87;
            }
            char v63 = v58;
            if (a1[3] >= v62)
            {
              if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                sub_7A00();
              }
              v64 = v55;
              if (v63) {
                goto LABEL_75;
              }
            }
            else
            {
              sub_7C28(v62, isUniquelyReferenced_nonNull_native);
              v64 = v55;
              uint64_t v65 = sub_8538((uint64_t)v55, (uint64_t (*)(uint64_t, Swift::Int))sub_816C);
              if ((v63 & 1) != (v66 & 1)) {
                goto LABEL_93;
              }
              unint64_t v59 = v65;
              if (v63) {
                goto LABEL_75;
              }
            }
            a1[(v59 >> 6) + 8] |= 1 << v59;
            *(void *)(a1[6] + 8 * v59) = v64;
            sub_7994(v97, (_OWORD *)(a1[7] + 32 * v59));
            uint64_t v67 = a1[2];
            BOOL v52 = __OFADD__(v67, 1);
            uint64_t v68 = v67 + 1;
            if (v52) {
              goto LABEL_90;
            }
          }
          else
          {
            sub_79A4((uint64_t)v100, (uint64_t)&v98);
            sub_4370(&qword_141E0);
            if ((swift_dynamicCast() & 1) == 0)
            {
              sub_79A4((uint64_t)v100, (uint64_t)&v98);
              id v40 = v96;
              char v41 = swift_isUniquelyReferenced_nonNull_native();
              *(void *)&v97[0] = a1;
              unint64_t v43 = sub_8538((uint64_t)v40, (uint64_t (*)(uint64_t, Swift::Int))sub_816C);
              uint64_t v44 = a1[2];
              BOOL v45 = (v42 & 1) == 0;
              uint64_t v46 = v44 + v45;
              if (__OFADD__(v44, v45)) {
                goto LABEL_88;
              }
              char v47 = v42;
              if (a1[3] >= v46)
              {
                if ((v41 & 1) == 0) {
                  sub_7A00();
                }
                uint64_t v48 = v40;
                a1 = *(void **)&v97[0];
                if ((v47 & 1) == 0) {
                  goto LABEL_46;
                }
              }
              else
              {
                sub_7C28(v46, v41);
                uint64_t v48 = v40;
                uint64_t v49 = sub_8538((uint64_t)v40, (uint64_t (*)(uint64_t, Swift::Int))sub_816C);
                if ((v47 & 1) != (v50 & 1)) {
                  goto LABEL_93;
                }
                unint64_t v43 = v49;
                a1 = *(void **)&v97[0];
                if ((v47 & 1) == 0)
                {
LABEL_46:
                  a1[(v43 >> 6) + 8] |= 1 << v43;
                  *(void *)(a1[6] + 8 * v43) = v48;
                  sub_7994(&v98, (_OWORD *)(a1[7] + 32 * v43));
                  uint64_t v51 = a1[2];
                  BOOL v52 = __OFADD__(v51, 1);
                  uint64_t v53 = v51 + 1;
                  if (v52) {
                    goto LABEL_91;
                  }
                  a1[2] = v53;
                  id v54 = v48;
                  goto LABEL_64;
                }
              }
              uint64_t v69 = a1[7] + 32 * v43;
              sub_7BD8(v69);
              uint64_t v70 = (_OWORD *)v69;
              uint64_t v48 = v40;
              sub_7994(&v98, v70);
LABEL_64:
              unint64_t v7 = v93;

              swift_bridgeObjectRelease();
              goto LABEL_77;
            }
            uint64_t v33 = *(void *)&v97[0];
            int64_t v34 = *(void *)(*(void *)&v97[0] + 16);
            uint64_t v92 = v2;
            if (v34)
            {
              *(void *)&long long v98 = &_swiftEmptyArrayStorage;
              sub_835C(0, v34, 0);
              uint64_t v35 = (void *)v98;
              uint64_t v36 = (float *)(v33 + 36);
              do
              {
                id v37 = [objc_allocWithZone((Class)SHRange) initWithLowerBound:*(v36 - 1) upperBound:*v36];
                *(void *)&long long v98 = v35;
                unint64_t v39 = v35[2];
                unint64_t v38 = v35[3];
                if (v39 >= v38 >> 1)
                {
                  sub_835C((void *)(v38 > 1), v39 + 1, 1);
                  uint64_t v35 = (void *)v98;
                }
                v35[2] = v39 + 1;
                v35[v39 + 4] = v37;
                v36 += 2;
                --v34;
              }
              while (v34);
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_bridgeObjectRelease();
              uint64_t v35 = &_swiftEmptyArrayStorage;
            }
            *((void *)&v99 + 1) = sub_4370(&qword_141E8);
            *(void *)&long long v98 = v35;
            sub_7994(&v98, v97);
            id v71 = v96;
            char v72 = swift_isUniquelyReferenced_nonNull_native();
            id v57 = v71;
            unint64_t v59 = sub_8538((uint64_t)v71, (uint64_t (*)(uint64_t, Swift::Int))sub_816C);
            uint64_t v74 = a1[2];
            BOOL v75 = (v73 & 1) == 0;
            uint64_t v76 = v74 + v75;
            if (__OFADD__(v74, v75)) {
              goto LABEL_89;
            }
            char v77 = v73;
            if (a1[3] >= v76)
            {
              if ((v72 & 1) == 0) {
                sub_7A00();
              }
              v64 = v71;
              if (v77) {
                goto LABEL_75;
              }
            }
            else
            {
              sub_7C28(v76, v72);
              v64 = v71;
              uint64_t v78 = sub_8538((uint64_t)v71, (uint64_t (*)(uint64_t, Swift::Int))sub_816C);
              if ((v77 & 1) != (v79 & 1)) {
                goto LABEL_93;
              }
              unint64_t v59 = v78;
              if (v77)
              {
LABEL_75:
                uint64_t v82 = a1[7] + 32 * v59;
                sub_7BD8(v82);
                uint64_t v83 = (_OWORD *)v82;
                v64 = v57;
                sub_7994(v97, v83);
                goto LABEL_76;
              }
            }
            a1[(v59 >> 6) + 8] |= 1 << v59;
            *(void *)(a1[6] + 8 * v59) = v64;
            sub_7994(v97, (_OWORD *)(a1[7] + 32 * v59));
            uint64_t v80 = a1[2];
            BOOL v52 = __OFADD__(v80, 1);
            uint64_t v68 = v80 + 1;
            if (v52) {
              goto LABEL_92;
            }
          }
          a1[2] = v68;
          id v81 = v64;
LABEL_76:
          uint64_t v2 = v92;
          unint64_t v7 = v93;

          swift_bridgeObjectRelease();
LABEL_77:
          swift_bridgeObjectRetain();
          unint64_t v84 = sub_8538((uint64_t)v23, (uint64_t (*)(uint64_t, Swift::Int))sub_816C);
          char v86 = v85;
          swift_bridgeObjectRelease();
          if (v86)
          {
            char v87 = swift_isUniquelyReferenced_nonNull_native();
            *(void *)&v97[0] = a1;
            if ((v87 & 1) == 0)
            {
              sub_7A00();
              a1 = *(void **)&v97[0];
            }

            sub_7994((_OWORD *)(a1[7] + 32 * v84), &v98);
            sub_7F78(v84, (uint64_t)a1);
            swift_bridgeObjectRelease();
          }
          else
          {
            long long v98 = 0u;
            long long v99 = 0u;
          }

          sub_7934((uint64_t)&v98);
          sub_7BD8((uint64_t)v100);

          if (!v12) {
            goto LABEL_8;
          }
LABEL_7:
          unint64_t v15 = __clz(__rbit64(v12));
          v12 &= v12 - 1;
        }
      }
      int64_t v8 = v17 + 4;
      if (v17 + 4 < v95)
      {
        unint64_t v18 = *(void *)(v94 + 8 * v8);
        int64_t v19 = v17 + 4;
        if (!v18)
        {
          while (1)
          {
            int64_t v8 = v19 + 1;
            if (__OFADD__(v19, 1)) {
              goto LABEL_86;
            }
            if (v8 >= v95) {
              goto LABEL_84;
            }
            unint64_t v18 = *(void *)(v94 + 8 * v8);
            ++v19;
            if (v18) {
              goto LABEL_22;
            }
          }
        }
        goto LABEL_22;
      }
    }
LABEL_84:
    swift_release();
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    type metadata accessor for SHMediaItemProperty();
    sub_837C(&qword_140E0, (void (*)(uint64_t))type metadata accessor for SHMediaItemProperty);
    swift_bridgeObjectRetain();
    Class isa = sub_E000().super.isa;
    swift_bridgeObjectRelease();
    id v90 = [ObjCClassFromMetadata mediaItemWithProperties:isa];
    swift_bridgeObjectRelease();

    return (uint64_t)v90;
  }
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
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  type metadata accessor for SHMediaItemProperty();
  uint64_t result = sub_E1E0();
  __break(1u);
  return result;
}

uint64_t sub_7754(uint64_t a1)
{
  uint64_t matched = type metadata accessor for ShazamSuccessfulMatchModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(matched - 8) + 8))(a1, matched);
  return a1;
}

uint64_t *sub_77B0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_7814(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4370(&qword_14208);
  uint64_t v2 = (void *)sub_E140();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_8538((uint64_t)v6, (uint64_t (*)(uint64_t, Swift::Int))sub_816C);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

uint64_t sub_7934(uint64_t a1)
{
  uint64_t v2 = sub_4370(&qword_141D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_7994(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_79A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_7A00()
{
  uint64_t v1 = v0;
  sub_4370(&qword_14200);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_E120();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_27:
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v19 >= v13) {
      goto LABEL_27;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_27;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20)
      {
        int64_t v9 = v19 + 2;
        if (v19 + 2 >= v13) {
          goto LABEL_27;
        }
        unint64_t v20 = *(void *)(v6 + 8 * v9);
        if (!v20)
        {
          int64_t v9 = v19 + 3;
          if (v19 + 3 >= v13) {
            goto LABEL_27;
          }
          unint64_t v20 = *(void *)(v6 + 8 * v9);
          int64_t v21 = v19 + 3;
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_26:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_79A4(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_7994(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_27;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_26;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_7BD8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_7C28(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4370(&qword_14200);
  char v34 = a2;
  uint64_t v6 = sub_E130();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v32 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v15 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v16 = v15 | (v13 << 6);
      }
      else
      {
        int64_t v17 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v17 >= v33) {
          goto LABEL_35;
        }
        unint64_t v18 = v32[v17];
        ++v13;
        if (!v18)
        {
          int64_t v13 = v17 + 1;
          if (v17 + 1 >= v33) {
            goto LABEL_35;
          }
          unint64_t v18 = v32[v13];
          if (!v18)
          {
            int64_t v13 = v17 + 2;
            if (v17 + 2 >= v33) {
              goto LABEL_35;
            }
            unint64_t v18 = v32[v13];
            if (!v18)
            {
              int64_t v13 = v17 + 3;
              if (v17 + 3 >= v33)
              {
LABEL_35:
                swift_release();
                if (v34)
                {
                  uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
                  if (v31 >= 64) {
                    bzero(v32, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                  }
                  else {
                    void *v32 = -1 << v31;
                  }
                  *(void *)(v5 + 16) = 0;
                }
                break;
              }
              unint64_t v18 = v32[v13];
              for (int64_t i = v17 + 3; !v18; ++i)
              {
                int64_t v13 = i + 1;
                if (__OFADD__(i, 1)) {
                  goto LABEL_42;
                }
                if (v13 >= v33) {
                  goto LABEL_35;
                }
                unint64_t v18 = v32[v13];
              }
            }
          }
        }
        unint64_t v10 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }
      unint64_t v20 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
      int64_t v21 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v16);
      if (v34)
      {
        sub_7994(v21, v35);
      }
      else
      {
        sub_79A4((uint64_t)v21, (uint64_t)v35);
        id v22 = v20;
      }
      sub_E040();
      sub_E230();
      sub_E060();
      Swift::Int v23 = sub_E250();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v25 = v23 & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(void *)(*(void *)(v7 + 48) + 8 * v14) = v20;
      uint64_t result = (uint64_t)sub_7994(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_7F78(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_E0E0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        unint64_t v10 = *(void **)(*(void *)(a2 + 48) + 8 * v6);
        sub_E040();
        sub_E230();
        id v11 = v10;
        sub_E060();
        Swift::Int v12 = sub_E250();

        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8) {
            goto LABEL_5;
          }
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          uint64_t v14 = *(void *)(a2 + 48);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || v15 >= v16 + 1) {
            *unint64_t v15 = *v16;
          }
          uint64_t v17 = *(void *)(a2 + 56);
          unint64_t v18 = (_OWORD *)(v17 + 32 * v3);
          int64_t v19 = (_OWORD *)(v17 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v18 >= v19 + 2))
          {
            long long v9 = v19[1];
            *unint64_t v18 = *v19;
            v18[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_816C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_E040();
    uint64_t v8 = v7;
    if (v6 == sub_E040() && v8 == v9) {
      goto LABEL_22;
    }
    char v11 = sub_E1D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v11) {
      return v5;
    }
    uint64_t v12 = ~v4;
    unint64_t v5 = (v5 + 1) & v12;
    if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
      return v5;
    }
    uint64_t v13 = sub_E040();
    uint64_t v15 = v14;
    if (v13 == sub_E040() && v15 == v16)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v18 = sub_E1D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v19 = sub_E040();
          uint64_t v21 = v20;
          if (v19 == sub_E040() && v21 == v22) {
            break;
          }
          char v24 = sub_E1D0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v24 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_22;
      }
    }
  }
  return v5;
}

void *sub_835C(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_83C4(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_837C(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_83C4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_4370(&qword_141F0);
    unint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = (2 * (v12 >> 3)) | 1;
  }
  else
  {
    unint64_t v10 = &_swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_84F8(0, &qword_141F8);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_84F8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_8538(uint64_t a1, uint64_t (*a2)(uint64_t, Swift::Int))
{
  sub_E040();
  sub_E230();
  sub_E060();
  Swift::Int v3 = sub_E250();
  swift_bridgeObjectRelease();

  return a2(a1, v3);
}

uint64_t sub_85D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4370(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_863C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_E040();
    uint64_t v8 = v7;
    if (v6 == sub_E040() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_E1D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_E040();
          uint64_t v15 = v14;
          if (v13 == sub_E040() && v15 == v16) {
            break;
          }
          char v18 = sub_E1D0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

void *sub_87B4()
{
  return &protocol witness table for AnyView;
}

ValueMetadata *type metadata accessor for ShazamNoMatchView()
{
  return &type metadata for ShazamNoMatchView;
}

uint64_t sub_87D0(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_EFA8, 1);
}

uint64_t sub_87EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_4370(&qword_140A8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_DED0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_DEE0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (uint64_t *)((char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_DF10();
  swift_allocObject();
  sub_DF00();
  void *v12 = 0;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, enum case for MatchingFlowState.noMatch(_:), v9);
  sub_DEF0();
  swift_retain();
  sub_DEC0();
  LOBYTE(v9) = sub_DF70();
  sub_DF50();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v4, v8, v5);
  uint64_t v21 = &v4[*(int *)(v2 + 36)];
  char *v21 = v9;
  *((void *)v21 + 1) = v14;
  *((void *)v21 + 2) = v16;
  *((void *)v21 + 3) = v18;
  *((void *)v21 + 4) = v20;
  v21[40] = 0;
  sub_43B4();
  uint64_t v22 = sub_DFE0();
  swift_release();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *a1 = v22;
  return result;
}

unint64_t sub_8A78()
{
  unint64_t result = qword_140B8;
  if (!qword_140B8)
  {
    sub_DED0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_140B8);
  }
  return result;
}

void *sub_8AD0()
{
  return &protocol witness table for AnyView;
}

uint64_t sub_8ADC()
{
  uint64_t v0 = sub_DF40();
  sub_9F0C(v0, qword_15360);
  sub_9B70(v0, (uint64_t)qword_15360);
  return sub_DF30();
}

BOOL sub_8B58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_8B70()
{
  Swift::UInt v1 = *v0;
  sub_E230();
  sub_E240(v1);
  return sub_E250();
}

void sub_8BB8()
{
  sub_E240(*v0);
}

Swift::Int sub_8BE4()
{
  Swift::UInt v1 = *v0;
  sub_E230();
  sub_E240(v1);
  return sub_E250();
}

uint64_t sub_8C38()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for Plugin()
{
  return self;
}

uint64_t sub_8C6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_8CA0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_9310(a1, a2, a3, a4);
}

uint64_t sub_8CB8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_8D8C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_79A4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_79A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_7BD8((uint64_t)v12);
  return v7;
}

uint64_t sub_8D8C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_E0D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_8F48(a5, a6);
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
  uint64_t v8 = sub_E100();
  if (!v8)
  {
    sub_E110();
    __break(1u);
LABEL_17:
    uint64_t result = sub_E150();
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

uint64_t sub_8F48(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_8FE0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_91C0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_91C0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_8FE0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_9158(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_E0F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_E110();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_E070();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_E150();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_E110();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_9158(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_4370(&qword_142F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_91C0(char a1, int64_t a2, char a3, char *a4)
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
    sub_4370(&qword_142F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_E150();
  __break(1u);
  return result;
}

uint64_t sub_9310(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v57 = a3;
  uint64_t matched = type metadata accessor for ShazamSuccessfulMatchModel();
  uint64_t v6 = __chkstk_darwin(matched);
  uint64_t v51 = (uint64_t)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  id v54 = (char *)v46 - v9;
  __chkstk_darwin(v8);
  uint64_t v50 = (uint64_t)v46 - v10;
  uint64_t v53 = type metadata accessor for ShazamSuccessfulMatchView();
  __chkstk_darwin(v53);
  BOOL v52 = (char *)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_DF40();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_140A0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_9B70(v12, (uint64_t)qword_15360);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_DF20();
  os_log_type_t v18 = sub_E080();
  if (os_log_type_enabled(v17, v18))
  {
    unint64_t v49 = a4;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v58 = v47;
    *(_DWORD *)uint64_t v19 = 136315138;
    v46[1] = v19 + 4;
    uint64_t v48 = a1;
    uint64_t v20 = sub_E050();
    uint64_t v61 = sub_8CB8(v20, v21, &v58);
    sub_E0C0();
    swift_bridgeObjectRelease_n();
    a4 = v49;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v17, v18, "ShazamUIPlugin#view %s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v23 = sub_E050();
  uint64_t v24 = v22;
  if (v23 == 0x6E696E657473696CLL && v22 == 0xE900000000000067 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_DE40();
    swift_allocObject();
    uint64_t v25 = v57;
    sub_9BFC(v57, a4);
    sub_DE30();
    sub_9E64();
    uint64_t v26 = v56;
    sub_DE20();
    sub_9C54(v25, a4);
    uint64_t result = swift_release();
    if (v26) {
      return result;
    }
    sub_DFB0();
    uint64_t v28 = v58;
    sub_DFF0();
    sub_9D74(&qword_142C0, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t v29 = sub_DF60();
    uint64_t v58 = v28;
    uint64_t v59 = v29;
    uint64_t v60 = v30;
    sub_9EB8();
    return sub_DFE0();
  }
  if (v23 == 0x686374616D6F6ELL && v24 == 0xE700000000000000 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_DE40();
    swift_allocObject();
    uint64_t v31 = v57;
    sub_9BFC(v57, a4);
    sub_DE30();
    sub_9DBC();
    uint64_t v32 = v56;
    sub_DE20();
    sub_9C54(v31, a4);
    uint64_t result = swift_release();
    if (!v32)
    {
      sub_DFB0();
      uint64_t v33 = v58;
      sub_DFF0();
      sub_9D74(&qword_142C0, (void (*)(uint64_t))&type metadata accessor for Context);
      uint64_t v34 = sub_DF60();
      uint64_t v58 = v33;
      uint64_t v59 = v34;
      uint64_t v60 = v35;
      sub_9E10();
      return sub_DFE0();
    }
  }
  else
  {
    if (v23 == 0x6673736563637573 && v24 == 0xEF686374616D6C75)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v36 = sub_E1D0();
      swift_bridgeObjectRelease();
      if ((v36 & 1) == 0)
      {
        sub_9BA8();
        swift_allocError();
        *BOOL v45 = 0;
        return swift_willThrow();
      }
    }
    sub_DE40();
    swift_allocObject();
    uint64_t v37 = v57;
    sub_9BFC(v57, a4);
    sub_DE30();
    sub_9D74(&qword_142B8, (void (*)(uint64_t))type metadata accessor for ShazamSuccessfulMatchModel);
    unint64_t v38 = v54;
    uint64_t v39 = v56;
    sub_DE20();
    sub_9C54(v37, a4);
    uint64_t result = swift_release();
    if (!v39)
    {
      uint64_t v40 = (uint64_t)v38;
      uint64_t v41 = v50;
      sub_9CAC(v40, v50);
      sub_9D10(v41, v51);
      char v42 = v52;
      sub_DFB0();
      sub_7754(v41);
      unint64_t v43 = (uint64_t *)&v42[*(int *)(v53 + 20)];
      sub_DFF0();
      sub_9D74(&qword_142C0, (void (*)(uint64_t))&type metadata accessor for Context);
      uint64_t *v43 = sub_DF60();
      v43[1] = v44;
      sub_9D74(&qword_142C8, (void (*)(uint64_t))type metadata accessor for ShazamSuccessfulMatchView);
      return sub_DFE0();
    }
  }
  return result;
}

uint64_t sub_9B70(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_9BA8()
{
  unint64_t result = qword_142B0;
  if (!qword_142B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142B0);
  }
  return result;
}

uint64_t sub_9BFC(uint64_t a1, unint64_t a2)
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

uint64_t sub_9C54(uint64_t a1, unint64_t a2)
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

uint64_t sub_9CAC(uint64_t a1, uint64_t a2)
{
  uint64_t matched = type metadata accessor for ShazamSuccessfulMatchModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(matched - 8) + 32))(a2, a1, matched);
  return a2;
}

uint64_t sub_9D10(uint64_t a1, uint64_t a2)
{
  uint64_t matched = type metadata accessor for ShazamSuccessfulMatchModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(matched - 8) + 16))(a2, a1, matched);
  return a2;
}

uint64_t sub_9D74(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_9DBC()
{
  unint64_t result = qword_142D0;
  if (!qword_142D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142D0);
  }
  return result;
}

unint64_t sub_9E10()
{
  unint64_t result = qword_142D8;
  if (!qword_142D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142D8);
  }
  return result;
}

unint64_t sub_9E64()
{
  unint64_t result = qword_142E0;
  if (!qword_142E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142E0);
  }
  return result;
}

unint64_t sub_9EB8()
{
  unint64_t result = qword_142E8;
  if (!qword_142E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142E8);
  }
  return result;
}

uint64_t *sub_9F0C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for Plugin.Error(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Plugin.Error(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Plugin.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xA0DCLL);
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

uint64_t sub_A104(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_A110(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Plugin.Error()
{
  return &type metadata for Plugin.Error;
}

unint64_t sub_A130()
{
  unint64_t result = qword_142F8;
  if (!qword_142F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_142F8);
  }
  return result;
}

uint64_t ShazamListeningModel.init(_:)(uint64_t a1, unint64_t a2)
{
  return sub_A1EC(a1, a2, (void (*)(void))sub_9E64);
}

uint64_t ShazamNoMatchModel.init(_:)(uint64_t a1, unint64_t a2)
{
  return sub_A1EC(a1, a2, (void (*)(void))sub_9DBC);
}

uint64_t sub_A1EC(uint64_t a1, unint64_t a2, void (*a3)(void))
{
  return swift_release();
}

uint64_t ShazamSuccessfulMatchModel.init(_:)(uint64_t a1, unint64_t a2)
{
  return swift_release();
}

uint64_t type metadata accessor for ShazamSuccessfulMatchModel()
{
  uint64_t result = qword_143B8;
  if (!qword_143B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_A3B0()
{
  return 0;
}

uint64_t sub_A3BC()
{
  return 0;
}

void sub_A3C8(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_A3D4(uint64_t a1)
{
  unint64_t v2 = sub_A4CC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_A410(uint64_t a1)
{
  unint64_t v2 = sub_A4CC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ShazamListeningModel.encode(to:)(void *a1)
{
  return sub_A6F0(a1, &qword_14300, (void (*)(void))sub_A4CC);
}

void *sub_A488(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_A4CC()
{
  unint64_t result = qword_14308;
  if (!qword_14308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14308);
  }
  return result;
}

uint64_t ShazamListeningModel.init(from:)(uint64_t a1)
{
  return sub_7BD8(a1);
}

uint64_t sub_A548(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_A8A0(a1, a2, a3, &qword_14300, (void (*)(void))sub_A4CC);
}

uint64_t ShazamListeningModel.serializedData.getter()
{
  return sub_A9F4((void (*)(void))sub_A5B8);
}

unint64_t sub_A5B8()
{
  unint64_t result = qword_14310;
  if (!qword_14310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14310);
  }
  return result;
}

uint64_t sub_A60C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_A63C(uint64_t a1)
{
  unint64_t v2 = sub_A810();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_A678(uint64_t a1)
{
  unint64_t v2 = sub_A810();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ShazamNoMatchModel.encode(to:)(void *a1)
{
  return sub_A6F0(a1, &qword_14318, (void (*)(void))sub_A810);
}

uint64_t sub_A6F0(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v5 = sub_4370(a2);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A488(a1, a1[3]);
  a3();
  sub_E270();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_A810()
{
  unint64_t result = qword_14320;
  if (!qword_14320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14320);
  }
  return result;
}

uint64_t sub_A864(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_A8A0(a1, a2, a3, &qword_14318, (void (*)(void))sub_A810);
}

uint64_t sub_A8A0(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v7 = sub_4370(a4);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A488(a1, a1[3]);
  a5();
  sub_E270();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t ShazamNoMatchModel.serializedData.getter()
{
  return sub_A9F4((void (*)(void))sub_AA7C);
}

uint64_t sub_A9F4(void (*a1)(void))
{
  sub_DE70();
  swift_allocObject();
  sub_DE60();
  a1();
  uint64_t v2 = sub_DE50();
  swift_release();
  return v2;
}

unint64_t sub_AA7C()
{
  unint64_t result = qword_14328;
  if (!qword_14328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14328);
  }
  return result;
}

unint64_t sub_AAD0(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C746974;
      break;
    case 2:
      unint64_t result = 0x656C746974627573;
      break;
    case 3:
      unint64_t result = 0x747369747261;
      break;
    case 4:
      unint64_t result = 0x65726E6567;
      break;
    case 5:
    case 6:
      unint64_t result = 0x73754D656C707061;
      break;
    case 7:
      unint64_t result = 0x4C5255626577;
      break;
    case 8:
      unint64_t result = 0x556B726F77747261;
      break;
    case 9:
      unint64_t result = 0x4C52556F65646976;
      break;
    case 10:
      unint64_t result = 0x746963696C707865;
      break;
    case 11:
      unint64_t result = 1668445033;
      break;
    case 12:
      return result;
    default:
      unint64_t result = 0x44496D617A616873;
      break;
  }
  return result;
}

BOOL sub_AC60(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_AC74()
{
  return sub_AAD0(*v0);
}

uint64_t sub_AC7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_D930(a1, a2);
  *a3 = result;
  return result;
}

void sub_ACA4(unsigned char *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_ACB0(uint64_t a1)
{
  unint64_t v2 = sub_B0DC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_ACEC(uint64_t a1)
{
  unint64_t v2 = sub_B0DC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ShazamSuccessfulMatchModel.encode(to:)(void *a1)
{
  uint64_t v3 = sub_4370(&qword_14330);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_A488(a1, a1[3]);
  sub_B0DC();
  sub_E270();
  v8[31] = 0;
  sub_E1A0();
  if (!v1)
  {
    v8[30] = 1;
    sub_E1A0();
    v8[29] = 2;
    sub_E1A0();
    v8[28] = 3;
    sub_E1A0();
    v8[27] = 4;
    sub_E1A0();
    v8[26] = 5;
    sub_E1A0();
    type metadata accessor for ShazamSuccessfulMatchModel();
    v8[25] = 6;
    sub_DE80();
    sub_BAF4(&qword_14340, (void (*)(uint64_t))&type metadata accessor for URL);
    sub_E1C0();
    v8[24] = 7;
    sub_E1C0();
    v8[15] = 8;
    sub_E1C0();
    v8[14] = 9;
    sub_E1C0();
    v8[13] = 10;
    sub_E1B0();
    v8[12] = 11;
    sub_E1A0();
    v8[11] = 12;
    sub_E1B0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_B0DC()
{
  unint64_t result = qword_14338;
  if (!qword_14338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14338);
  }
  return result;
}

uint64_t ShazamSuccessfulMatchModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v3 = sub_4370(&qword_140F0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v37 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v37 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v37 - v13;
  uint64_t v41 = sub_4370(&qword_14348);
  uint64_t v15 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t matched = (int *)type metadata accessor for ShazamSuccessfulMatchModel();
  __chkstk_darwin(matched);
  BOOL v45 = (uint64_t *)((char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = a1[3];
  unint64_t v43 = a1;
  sub_A488(a1, v19);
  sub_B0DC();
  uint64_t v40 = v17;
  uint64_t v20 = v44;
  sub_E260();
  if (v20) {
    return sub_7BD8((uint64_t)v43);
  }
  uint64_t v44 = v12;
  uint64_t v37 = v6;
  unint64_t v38 = v9;
  char v58 = 0;
  uint64_t v21 = sub_E170();
  uint64_t v22 = v45;
  *BOOL v45 = v21;
  v22[1] = v23;
  char v57 = 1;
  _OWORD v22[2] = sub_E170();
  v22[3] = v24;
  char v56 = 2;
  v22[4] = sub_E170();
  v22[5] = v25;
  char v55 = 3;
  v22[6] = sub_E170();
  v22[7] = v26;
  char v54 = 4;
  v22[8] = sub_E170();
  v22[9] = v27;
  char v53 = 5;
  v22[10] = sub_E170();
  v22[11] = v28;
  sub_DE80();
  char v52 = 6;
  sub_BAF4(&qword_14350, (void (*)(uint64_t))&type metadata accessor for URL);
  sub_E190();
  sub_B99C((uint64_t)v14, (uint64_t)v22 + matched[10]);
  char v51 = 7;
  uint64_t v29 = (uint64_t)v44;
  sub_E190();
  sub_B99C(v29, (uint64_t)v22 + matched[11]);
  char v50 = 8;
  uint64_t v30 = (uint64_t)v38;
  sub_E190();
  sub_B99C(v30, (uint64_t)v22 + matched[12]);
  char v49 = 9;
  sub_E190();
  sub_B99C((uint64_t)v37, (uint64_t)v45 + matched[13]);
  char v48 = 10;
  *((unsigned char *)v45 + matched[14]) = sub_E180();
  char v47 = 11;
  uint64_t v31 = sub_E170();
  uint64_t v32 = (uint64_t *)((char *)v45 + matched[15]);
  uint64_t *v32 = v31;
  v32[1] = v33;
  char v46 = 12;
  char v34 = sub_E180();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v40, v41);
  uint64_t v35 = (uint64_t)v45;
  *((unsigned char *)v45 + matched[16]) = v34;
  sub_9D10(v35, v39);
  sub_7BD8((uint64_t)v43);
  return sub_7754(v35);
}

uint64_t sub_B93C(uint64_t a1)
{
  uint64_t v2 = sub_4370(&qword_140F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_B99C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4370(&qword_140F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_BA04@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ShazamSuccessfulMatchModel.init(from:)(a1, a2);
}

uint64_t sub_BA1C(void *a1)
{
  return ShazamSuccessfulMatchModel.encode(to:)(a1);
}

uint64_t ShazamSuccessfulMatchModel.serializedData.getter()
{
  sub_DE70();
  swift_allocObject();
  sub_DE60();
  type metadata accessor for ShazamSuccessfulMatchModel();
  sub_BAF4(&qword_14358, (void (*)(uint64_t))type metadata accessor for ShazamSuccessfulMatchModel);
  uint64_t v0 = sub_DE50();
  swift_release();
  return v0;
}

uint64_t sub_BAF4(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for ShazamListeningModel()
{
  return &type metadata for ShazamListeningModel;
}

ValueMetadata *type metadata accessor for ShazamNoMatchModel()
{
  return &type metadata for ShazamNoMatchModel;
}

void *initializeBufferWithCopyOfBuffer for ShazamSuccessfulMatchModel(void *a1, char *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *(void *)a2;
    *uint64_t v4 = *(void *)a2;
    uint64_t v4 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v6;
    uint64_t v7 = *((void *)a2 + 3);
    a1[2] = *((void *)a2 + 2);
    a1[3] = v7;
    uint64_t v8 = *((void *)a2 + 5);
    a1[4] = *((void *)a2 + 4);
    a1[5] = v8;
    uint64_t v9 = *((void *)a2 + 7);
    a1[6] = *((void *)a2 + 6);
    a1[7] = v9;
    uint64_t v10 = *((void *)a2 + 9);
    a1[8] = *((void *)a2 + 8);
    a1[9] = v10;
    uint64_t v11 = *((void *)a2 + 11);
    uint64_t v12 = a3[10];
    __dst = (char *)a1 + v12;
    uint64_t v35 = &a2[v12];
    a1[10] = *((void *)a2 + 10);
    a1[11] = v11;
    uint64_t v13 = sub_DE80();
    uint64_t v36 = *(void *)(v13 - 8);
    uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v35, 1, v13))
    {
      uint64_t v15 = sub_4370(&qword_140F0);
      memcpy(__dst, v35, *(void *)(*(void *)(v15 - 8) + 64));
      uint64_t v16 = v36;
    }
    else
    {
      uint64_t v16 = v36;
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(__dst, v35, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(__dst, 0, 1, v13);
    }
    uint64_t v18 = a3[11];
    uint64_t v19 = (char *)v4 + v18;
    uint64_t v20 = &a2[v18];
    if (v14(&a2[v18], 1, v13))
    {
      uint64_t v21 = sub_4370(&qword_140F0);
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v20, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v19, 0, 1, v13);
    }
    uint64_t v22 = a3[12];
    uint64_t v23 = (char *)v4 + v22;
    uint64_t v24 = &a2[v22];
    if (v14(&a2[v22], 1, v13))
    {
      uint64_t v25 = sub_4370(&qword_140F0);
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v23, v24, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v23, 0, 1, v13);
    }
    uint64_t v26 = a3[13];
    uint64_t v27 = (char *)v4 + v26;
    uint64_t v28 = &a2[v26];
    if (v14(&a2[v26], 1, v13))
    {
      uint64_t v29 = sub_4370(&qword_140F0);
      memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v27, v28, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v27, 0, 1, v13);
    }
    uint64_t v30 = a3[15];
    *((unsigned char *)v4 + a3[14]) = a2[a3[14]];
    uint64_t v31 = (void *)((char *)v4 + v30);
    uint64_t v32 = &a2[v30];
    uint64_t v33 = *((void *)v32 + 1);
    *uint64_t v31 = *(void *)v32;
    v31[1] = v33;
    *((unsigned char *)v4 + a3[16]) = a2[a3[16]];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ShazamSuccessfulMatchModel(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[10];
  uint64_t v5 = sub_DE80();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v8 = a1 + a2[11];
  if (!v7(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v9 = a1 + a2[12];
  if (!v7(v9, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  }
  uint64_t v10 = a1 + a2[13];
  if (!v7(v10, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v5);
  }

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ShazamSuccessfulMatchModel(void *a1, char *a2, int *a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *a1 = *(void *)a2;
  a1[1] = v5;
  uint64_t v6 = *((void *)a2 + 3);
  a1[2] = *((void *)a2 + 2);
  a1[3] = v6;
  uint64_t v7 = *((void *)a2 + 5);
  a1[4] = *((void *)a2 + 4);
  a1[5] = v7;
  uint64_t v8 = *((void *)a2 + 7);
  a1[6] = *((void *)a2 + 6);
  a1[7] = v8;
  uint64_t v9 = *((void *)a2 + 9);
  a1[8] = *((void *)a2 + 8);
  a1[9] = v9;
  uint64_t v10 = *((void *)a2 + 11);
  uint64_t v11 = a3[10];
  __dst = (char *)a1 + v11;
  uint64_t v33 = &a2[v11];
  a1[10] = *((void *)a2 + 10);
  a1[11] = v10;
  uint64_t v12 = sub_DE80();
  uint64_t v34 = *(void *)(v12 - 8);
  uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v33, 1, v12))
  {
    uint64_t v14 = sub_4370(&qword_140F0);
    memcpy(__dst, v33, *(void *)(*(void *)(v14 - 8) + 64));
    uint64_t v15 = v34;
  }
  else
  {
    uint64_t v15 = v34;
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(__dst, v33, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(__dst, 0, 1, v12);
  }
  uint64_t v16 = a3[11];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = &a2[v16];
  if (v13(&a2[v16], 1, v12))
  {
    uint64_t v19 = sub_4370(&qword_140F0);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v17, v18, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v17, 0, 1, v12);
  }
  uint64_t v20 = a3[12];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = &a2[v20];
  if (v13(&a2[v20], 1, v12))
  {
    uint64_t v23 = sub_4370(&qword_140F0);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v21, v22, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v21, 0, 1, v12);
  }
  uint64_t v24 = a3[13];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = &a2[v24];
  if (v13(&a2[v24], 1, v12))
  {
    uint64_t v27 = sub_4370(&qword_140F0);
    memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v25, v26, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v25, 0, 1, v12);
  }
  uint64_t v28 = a3[15];
  *((unsigned char *)a1 + a3[14]) = a2[a3[14]];
  uint64_t v29 = (void *)((char *)a1 + v28);
  uint64_t v30 = &a2[v28];
  uint64_t v31 = *((void *)v30 + 1);
  void *v29 = *(void *)v30;
  v29[1] = v31;
  *((unsigned char *)a1 + a3[16]) = a2[a3[16]];
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for ShazamSuccessfulMatchModel(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = a2[2];
  *((void *)a1 + 3) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 4) = a2[4];
  *((void *)a1 + 5) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 6) = a2[6];
  *((void *)a1 + 7) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 8) = a2[8];
  *((void *)a1 + 9) = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 10) = a2[10];
  *((void *)a1 + 11) = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[10];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_DE80();
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
    uint64_t v14 = sub_4370(&qword_140F0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[11];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (char *)a2 + v15;
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
LABEL_12:
    uint64_t v20 = sub_4370(&qword_140F0);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v16, v17, v9);
LABEL_13:
  uint64_t v21 = a3[12];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = (char *)a2 + v21;
  int v24 = v11(&a1[v21], 1, v9);
  int v25 = v11(v23, 1, v9);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v22, v23, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v22, v9);
LABEL_18:
    uint64_t v26 = sub_4370(&qword_140F0);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v22, v23, v9);
LABEL_19:
  uint64_t v27 = a3[13];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = (char *)a2 + v27;
  int v30 = v11(&a1[v27], 1, v9);
  int v31 = v11(v29, 1, v9);
  if (!v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v28, v29, v9);
      goto LABEL_25;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v28, v9);
    goto LABEL_24;
  }
  if (v31)
  {
LABEL_24:
    uint64_t v32 = sub_4370(&qword_140F0);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v28, v29, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v28, 0, 1, v9);
LABEL_25:
  a1[a3[14]] = *((unsigned char *)a2 + a3[14]);
  uint64_t v33 = a3[15];
  uint64_t v34 = &a1[v33];
  uint64_t v35 = (void *)((char *)a2 + v33);
  *(void *)uint64_t v34 = *v35;
  *((void *)v34 + 1) = v35[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[16]] = *((unsigned char *)a2 + a3[16]);
  return a1;
}

_OWORD *initializeWithTake for ShazamSuccessfulMatchModel(_OWORD *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *a1 = *(_OWORD *)a2;
  a1[1] = v6;
  long long v7 = *((_OWORD *)a2 + 3);
  a1[2] = *((_OWORD *)a2 + 2);
  a1[3] = v7;
  long long v8 = *((_OWORD *)a2 + 5);
  uint64_t v9 = a3[10];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = &a2[v9];
  a1[4] = *((_OWORD *)a2 + 4);
  a1[5] = v8;
  uint64_t v12 = sub_DE80();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v11, 1, v12))
  {
    uint64_t v15 = sub_4370(&qword_140F0);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v16 = a3[11];
  uint64_t v17 = (char *)a1 + v16;
  int v18 = &a2[v16];
  if (v14(&a2[v16], 1, v12))
  {
    uint64_t v19 = sub_4370(&qword_140F0);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v18, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v17, 0, 1, v12);
  }
  uint64_t v20 = a3[12];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = &a2[v20];
  if (v14(&a2[v20], 1, v12))
  {
    uint64_t v23 = sub_4370(&qword_140F0);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v21, v22, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v21, 0, 1, v12);
  }
  uint64_t v24 = a3[13];
  int v25 = (char *)a1 + v24;
  uint64_t v26 = &a2[v24];
  if (v14(&a2[v24], 1, v12))
  {
    uint64_t v27 = sub_4370(&qword_140F0);
    memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v25, v26, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v25, 0, 1, v12);
  }
  uint64_t v28 = a3[15];
  *((unsigned char *)a1 + a3[14]) = a2[a3[14]];
  *(_OWORD *)((char *)a1 + v28) = *(_OWORD *)&a2[v28];
  *((unsigned char *)a1 + a3[16]) = a2[a3[16]];
  return a1;
}

char *assignWithTake for ShazamSuccessfulMatchModel(char *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  *((void *)a1 + 2) = a2[2];
  *((void *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  *((void *)a1 + 4) = a2[4];
  *((void *)a1 + 5) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  *((void *)a1 + 6) = a2[6];
  *((void *)a1 + 7) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[9];
  *((void *)a1 + 8) = a2[8];
  *((void *)a1 + 9) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a2[11];
  *((void *)a1 + 10) = a2[10];
  *((void *)a1 + 11) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[10];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_DE80();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    uint64_t v20 = sub_4370(&qword_140F0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_7:
  uint64_t v21 = a3[11];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = (char *)a2 + v21;
  int v24 = v17(&a1[v21], 1, v15);
  int v25 = v17(v23, 1, v15);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v22, v23, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
LABEL_12:
    uint64_t v26 = sub_4370(&qword_140F0);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v22, v23, v15);
LABEL_13:
  uint64_t v27 = a3[12];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = (char *)a2 + v27;
  int v30 = v17(&a1[v27], 1, v15);
  int v31 = v17(v29, 1, v15);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v28, v29, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v28, 0, 1, v15);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v28, v15);
LABEL_18:
    uint64_t v32 = sub_4370(&qword_140F0);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v28, v29, v15);
LABEL_19:
  uint64_t v33 = a3[13];
  uint64_t v34 = &a1[v33];
  uint64_t v35 = (char *)a2 + v33;
  int v36 = v17(&a1[v33], 1, v15);
  int v37 = v17(v35, 1, v15);
  if (!v36)
  {
    if (!v37)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v34, v35, v15);
      goto LABEL_25;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v34, v15);
    goto LABEL_24;
  }
  if (v37)
  {
LABEL_24:
    uint64_t v38 = sub_4370(&qword_140F0);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v34, v35, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v34, 0, 1, v15);
LABEL_25:
  uint64_t v39 = a3[15];
  a1[a3[14]] = *((unsigned char *)a2 + a3[14]);
  uint64_t v40 = &a1[v39];
  uint64_t v41 = (void *)((char *)a2 + v39);
  uint64_t v43 = *v41;
  uint64_t v42 = v41[1];
  *(void *)uint64_t v40 = v43;
  *((void *)v40 + 1) = v42;
  swift_bridgeObjectRelease();
  a1[a3[16]] = *((unsigned char *)a2 + a3[16]);
  return a1;
}

uint64_t getEnumTagSinglePayload for ShazamSuccessfulMatchModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_D280);
}

uint64_t sub_D280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_4370(&qword_140F0);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 40);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for ShazamSuccessfulMatchModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_D354);
}

uint64_t sub_D354(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = sub_4370(&qword_140F0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_D400()
{
  sub_D4B4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_D4B4()
{
  if (!qword_143C8)
  {
    sub_DE80();
    unint64_t v0 = sub_E0B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_143C8);
    }
  }
}

uint64_t getEnumTagSinglePayload for ShazamSuccessfulMatchModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ShazamSuccessfulMatchModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *uint64_t result = a2 + 12;
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
        JUMPOUT(0xD668);
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
          *uint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

unsigned char *sub_D690(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ShazamSuccessfulMatchModel.CodingKeys()
{
  return &type metadata for ShazamSuccessfulMatchModel.CodingKeys;
}

ValueMetadata *type metadata accessor for ShazamNoMatchModel.CodingKeys()
{
  return &type metadata for ShazamNoMatchModel.CodingKeys;
}

ValueMetadata *type metadata accessor for ShazamListeningModel.CodingKeys()
{
  return &type metadata for ShazamListeningModel.CodingKeys;
}

unint64_t sub_D6CC()
{
  unint64_t result = qword_14428;
  if (!qword_14428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14428);
  }
  return result;
}

unint64_t sub_D724()
{
  unint64_t result = qword_14430;
  if (!qword_14430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14430);
  }
  return result;
}

unint64_t sub_D77C()
{
  unint64_t result = qword_14438;
  if (!qword_14438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14438);
  }
  return result;
}

unint64_t sub_D7D4()
{
  unint64_t result = qword_14440;
  if (!qword_14440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14440);
  }
  return result;
}

unint64_t sub_D82C()
{
  unint64_t result = qword_14448;
  if (!qword_14448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14448);
  }
  return result;
}

unint64_t sub_D884()
{
  unint64_t result = qword_14450;
  if (!qword_14450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14450);
  }
  return result;
}

unint64_t sub_D8DC()
{
  unint64_t result = qword_14458;
  if (!qword_14458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14458);
  }
  return result;
}

uint64_t sub_D930(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x44496D617A616873 && a2 == 0xE800000000000000;
  if (v3 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x747369747261 && a2 == 0xE600000000000000 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65726E6567 && a2 == 0xE500000000000000 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x73754D656C707061 && a2 == 0xEC00000044496369 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x73754D656C707061 && a2 == 0xED00004C52556369 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x4C5255626577 && a2 == 0xE600000000000000 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x556B726F77747261 && a2 == 0xEA00000000004C52 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x4C52556F65646976 && a2 == 0xE800000000000000 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x746963696C707865 && a2 == 0xEF746E65746E6F43 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 1668445033 && a2 == 0xE400000000000000 || (sub_E1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000000000FAC0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    char v6 = sub_E1D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 12;
    }
    else {
      return 13;
    }
  }
}

uint64_t sub_DE20()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_DE30()
{
  return JSONDecoder.init()();
}

uint64_t sub_DE40()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_DE50()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_DE60()
{
  return JSONEncoder.init()();
}

uint64_t sub_DE70()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_DE80()
{
  return type metadata accessor for URL();
}

uint64_t sub_DE90()
{
  return MatchResult.showStreamingServiceLink.setter();
}

uint64_t sub_DEA0()
{
  return MatchResult.init(mediaItem:)();
}

uint64_t sub_DEB0()
{
  return type metadata accessor for MatchResult();
}

uint64_t sub_DEC0()
{
  return MatchingFlowView.init(viewModel:)();
}

uint64_t sub_DED0()
{
  return type metadata accessor for MatchingFlowView();
}

uint64_t sub_DEE0()
{
  return type metadata accessor for MatchingFlowState();
}

uint64_t sub_DEF0()
{
  return dispatch thunk of MatchingFlowViewModel.state.setter();
}

uint64_t sub_DF00()
{
  return MatchingFlowViewModel.init()();
}

uint64_t sub_DF10()
{
  return type metadata accessor for MatchingFlowViewModel();
}

uint64_t sub_DF20()
{
  return Logger.logObject.getter();
}

uint64_t sub_DF30()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_DF40()
{
  return type metadata accessor for Logger();
}

uint64_t sub_DF50()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_DF60()
{
  return EnvironmentObject.init()();
}

uint64_t sub_DF70()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_DF80()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_DF90()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_DFA0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_DFB0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_DFC0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_DFD0()
{
  return type metadata accessor for State();
}

uint64_t sub_DFE0()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_DFF0()
{
  return type metadata accessor for Context();
}

NSDictionary sub_E000()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_E010()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_E020()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_E030()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_E040()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E050()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_E060()
{
  return String.hash(into:)();
}

Swift::Int sub_E070()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_E080()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_E090()
{
  return static SHMediaItemProperty.timeRanges.getter();
}

uint64_t sub_E0A0()
{
  return static SHMediaItemProperty.frequencySkewRanges.getter();
}

uint64_t sub_E0B0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_E0C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_E0D0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_E0E0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_E0F0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_E100()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_E110()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_E120()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_E130()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_E140()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_E150()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_E170()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_E180()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_E190()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_E1A0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_E1B0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_E1C0()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_E1D0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_E1E0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_E1F0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_E200()
{
  return Error._code.getter();
}

uint64_t sub_E210()
{
  return Error._domain.getter();
}

uint64_t sub_E220()
{
  return Error._userInfo.getter();
}

uint64_t sub_E230()
{
  return Hasher.init(_seed:)();
}

void sub_E240(Swift::UInt a1)
{
}

Swift::Int sub_E250()
{
  return Hasher._finalize()();
}

uint64_t sub_E260()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_E270()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}