uint64_t STSReader.StateChanges.makeAsyncIterator()()
{
  type metadata accessor for STSReader.StateChanges();
  sub_22117289C(&qword_267F45BF8);
  return sub_2211A35C8();
}

uint64_t type metadata accessor for STSReader.StateChanges()
{
  uint64_t result = qword_267F46520;
  if (!qword_267F46520) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22117289C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2211728E0(uint64_t a1, uint64_t a2)
{
  sub_221172A2C(a2);
  uint64_t v4 = sub_22117289C(&qword_267F45C00);
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a1, v4);
  v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);
  return v5(a2, 0, 1, v4);
}

uint64_t sub_2211729BC(uint64_t a1)
{
  return sub_2211728E0(a1, *(void *)(v1 + 16));
}

uint64_t sub_2211729C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22117289C(&qword_267F45C10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_221172A2C(uint64_t a1)
{
  uint64_t v2 = sub_22117289C(&qword_267F45C10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_221172A8C()
{
  sub_22117289C(&qword_267F45BF8);
  sub_2211A35C8();
  return sub_221173EB0(v0);
}

uint64_t STSReader.start(configuration:)(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  type metadata accessor for STSReader.StateChanges();
  v3[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_221172B7C, 0, 0);
}

uint64_t sub_221172B7C()
{
  uint64_t v2 = (void *)v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[11];
  v0[2] = v0;
  v0[7] = v1;
  v0[3] = sub_221172C28;
  uint64_t v4 = swift_continuation_init();
  sub_221172D60(v4, v2, v3);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_221172C28()
{
  uint64_t v1 = *v0;
  if (*(void *)(*v0 + 48)) {
    swift_willThrow();
  }
  else {
    sub_221173368(*(void *)(*v0 + 104), *(void *)(*v0 + 80));
  }
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return v2();
}

uint64_t sub_221172D60(uint64_t a1, void *a2, uint64_t a3)
{
  id v34 = a2;
  uint64_t v35 = a3;
  uint64_t v32 = a1;
  uint64_t v36 = sub_22117289C(&qword_267F45C08);
  uint64_t v3 = *(void *)(v36 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22117289C(&qword_267F45C10);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v10 = (char *)&v31 - v9;
  uint64_t v11 = type metadata accessor for STSReader.StateChanges();
  uint64_t v33 = *(void *)(v11 - 8);
  uint64_t v12 = *(void *)(v33 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v14 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v16 = (char *)&v31 - v15;
  uint64_t v17 = sub_22117289C(&qword_267F45C00);
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v10, 1, 1, v17);
  v37 = v10;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F580], v36);
  sub_2211A35D8();
  sub_2211729C4((uint64_t)v10, (uint64_t)v8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v8, 1, v17);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v16, v8, v17);
    sub_221172A2C((uint64_t)v10);
    sub_221173FF8((uint64_t)v16, (uint64_t)v14);
    unint64_t v20 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    uint64_t v21 = swift_allocObject();
    sub_221173368((uint64_t)v14, v21 + v20);
    v42 = sub_221174060;
    uint64_t v43 = v21;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v39 = 1107296256;
    v40 = sub_2211740C0;
    v41 = &unk_26D2FDCC8;
    uint64_t v36 = (uint64_t)_Block_copy(&aBlock);
    swift_release();
    sub_221173FF8((uint64_t)v16, (uint64_t)v14);
    uint64_t v22 = swift_allocObject();
    sub_221173368((uint64_t)v14, v22 + v20);
    v42 = sub_221174258;
    uint64_t v43 = v22;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v39 = 1107296256;
    v40 = sub_221174270;
    v41 = &unk_26D2FDD18;
    v23 = _Block_copy(&aBlock);
    swift_release();
    sub_221173FF8((uint64_t)v16, (uint64_t)v14);
    uint64_t v24 = swift_allocObject();
    sub_221173368((uint64_t)v14, v24 + v20);
    v42 = sub_2211743EC;
    uint64_t v43 = v24;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v39 = 1107296256;
    v40 = sub_221174270;
    v41 = &unk_26D2FDD68;
    v25 = _Block_copy(&aBlock);
    swift_release();
    sub_221173FF8((uint64_t)v16, (uint64_t)v14);
    uint64_t v26 = swift_allocObject();
    sub_221173368((uint64_t)v14, v26 + v20);
    v42 = sub_221174644;
    uint64_t v43 = v26;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v39 = 1107296256;
    v40 = sub_221174270;
    v41 = &unk_26D2FDDB8;
    v27 = _Block_copy(&aBlock);
    swift_release();
    v28 = (const void *)v36;
    id v29 = objc_msgSend(v34, sel_startWithConfiguration_connectionHandler_tnepStatusHandler_invalidationHandler_completion_, v35, v36, v23, v25, v27);
    _Block_release(v27);
    _Block_release(v25);
    _Block_release(v23);
    _Block_release(v28);
    if (v29)
    {
      sub_22117289C(&qword_267F45C40);
      swift_allocError();
      void *v30 = v29;
      swift_continuation_throwingResumeWithError();
    }
    else
    {
      sub_221173FF8((uint64_t)v16, (uint64_t)v14);
      sub_221173368((uint64_t)v14, *(void *)(*(void *)(v32 + 64) + 40));
      swift_continuation_throwingResume();
    }
    return sub_221173EB0((uint64_t)v16);
  }
  return result;
}

uint64_t sub_221173368(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for STSReader.StateChanges();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2211733D0()
{
  unint64_t result = qword_267F45C20;
  if (!qword_267F45C20)
  {
    sub_22117342C(&qword_267F45C28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F45C20);
  }
  return result;
}

uint64_t sub_22117342C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t _s10StateEventOwCP(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_2211734BC(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

id sub_2211734BC(id result, unsigned __int8 a2)
{
  if (a2 <= 1u) {
    return result;
  }
  return result;
}

void _s10StateEventOwxx(uint64_t a1)
{
}

void sub_2211734E0(id a1, unsigned __int8 a2)
{
  if (a2 <= 1u) {
}
  }

uint64_t _s10StateEventOwca(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_2211734BC(*(id *)a2, v4);
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v3;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_2211734E0(v5, v6);
  return a1;
}

uint64_t _s10StateEventOwtk(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t _s10StateEventOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  unsigned __int8 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_2211734E0(v4, v5);
  return a1;
}

uint64_t _s10StateEventOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s10StateEventOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_221173628(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_221173644(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for STSReader.StateEvent()
{
  return &type metadata for STSReader.StateEvent;
}

uint64_t *_s12StateChangesVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_22117289C(&qword_267F45C00);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    uint64_t v11 = sub_22117289C(&qword_267F45BF8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t _s12StateChangesVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22117289C(&qword_267F45C00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_22117289C(&qword_267F45BF8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t _s12StateChangesVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22117289C(&qword_267F45C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22117289C(&qword_267F45BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t _s12StateChangesVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22117289C(&qword_267F45C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22117289C(&qword_267F45BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t _s12StateChangesVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22117289C(&qword_267F45C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22117289C(&qword_267F45BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t _s12StateChangesVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22117289C(&qword_267F45C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22117289C(&qword_267F45BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t _s12StateChangesVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_221173B40);
}

uint64_t sub_221173B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22117289C(&qword_267F45C00);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_22117289C(&qword_267F45BF8);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t _s12StateChangesVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_221173C54);
}

uint64_t sub_221173C54(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_22117289C(&qword_267F45C00);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_22117289C(&qword_267F45BF8);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_221173D60()
{
  sub_221173E60(319, &qword_267F45C30, MEMORY[0x263F8F590]);
  if (v0 <= 0x3F)
  {
    sub_221173E60(319, &qword_267F45C38, MEMORY[0x263F8F5B8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_221173E60(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, ValueMetadata *))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, &type metadata for STSReader.StateEvent);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_221173EB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for STSReader.StateChanges();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_221173F0C()
{
  uint64_t v0 = sub_22117289C(&qword_267F45C48);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  unsigned int v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = 0;
  char v6 = 2;
  sub_22117289C(&qword_267F45C00);
  sub_2211A35A8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_221173FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for STSReader.StateChanges();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_221174060()
{
  type metadata accessor for STSReader.StateChanges();
  return sub_221173F0C();
}

void sub_2211740C0(uint64_t a1, void *a2)
{
  unsigned int v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_221174128(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_221174138()
{
  return swift_release();
}

uint64_t sub_221174140(void *a1)
{
  uint64_t v2 = sub_22117289C(&qword_267F45C48);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v8 = (uint64_t)a1;
    char v9 = 0;
    id v6 = a1;
  }
  else
  {
    uint64_t v8 = 1;
    char v9 = 2;
  }
  sub_22117289C(&qword_267F45C00);
  sub_2211A35A8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_221174258(uint64_t a1)
{
  return sub_22117465C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_221174140);
}

void sub_221174270(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_2211742DC(void *a1)
{
  uint64_t v2 = sub_22117289C(&qword_267F45C48);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1;
  char v9 = 1;
  id v6 = a1;
  sub_22117289C(&qword_267F45C00);
  sub_2211A35A8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_2211A35B8();
}

uint64_t sub_2211743EC(uint64_t a1)
{
  return sub_22117465C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2211742DC);
}

uint64_t sub_221174404(void *a1)
{
  uint64_t v2 = sub_22117289C(&qword_267F45C48);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = MEMORY[0x270FA5388]();
  id v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v8 = a1;
    char v9 = 1;
    id v7 = a1;
    sub_22117289C(&qword_267F45C00);
    sub_2211A35A8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return sub_2211A35B8();
  }
  return result;
}

uint64_t sub_221174518()
{
  uint64_t v1 = (int *)(type metadata accessor for STSReader.StateChanges() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_22117289C(&qword_267F45C00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v6 + v1[7];
  uint64_t v9 = sub_22117289C(&qword_267F45BF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_221174644(uint64_t a1)
{
  return sub_22117465C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_221174404);
}

uint64_t sub_22117465C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for STSReader.StateChanges() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(a1, v5);
}

void sub_221174998(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase startWithDelegate:isFirstInQueue:]_block_invoke", 69, *(void **)(a1 + 32), @"Starting Control SE session", v2, v3, v7);
  uint64_t v4 = [*(id *)(a1 + 32) nfHardwareManager];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = sub_221174AA8;
  uint64_t v10 = &unk_264594508;
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v6 = [v4 startSecureElementManagerSession:&v7];

  **(unsigned char **)(a1 + 48) = objc_msgSend(v6, "isFirstInQueue", v7, v8, v9, v10, v11);
  [*(id *)(a1 + 32) setInitiatingSession:v6];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

void sub_221174AA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) callbackQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_221174B94;
  v12[3] = &unk_2645944E0;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

uint64_t sub_221174B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 32)) {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase startWithDelegate:isFirstInQueue:]_block_invoke_3", 75, *(void **)(a1 + 40), @"Failed to start Control SE session: %@", a7, a8, *(void *)(a1 + 32));
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
  [*(id *)(a1 + 40) setMasterSESession:*(void *)(a1 + 48)];
  uint64_t v9 = *(void **)(a1 + 40);
  id v10 = [v9 masterSESession];
  [v10 setSessionDelegate:v9];

  id v11 = *(void **)(a1 + 40);
  id v12 = [v11 masterSESession];
  [v12 setDelegate:v11];

  [*(id *)(a1 + 40) setInitiatingSession:0];
  *(unsigned char *)(*(void *)(a1 + 40) + 24) = 0;
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void **)(v13 + 32);
  *(void *)(v13 + 32) = 0;

  *(unsigned char *)(*(void *)(a1 + 40) + 56) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase startWithDelegate:isFirstInQueue:]_block_invoke_3", 88, *(void **)(a1 + 40), @"Control SE session started", v15, v16, v22);
  uint64_t v17 = [*(id *)(a1 + 40) theStartCallback];

  if (v17)
  {
    uint64_t v18 = [*(id *)(a1 + 40) theStartCallback];
    v18[2](v18, *(void *)(a1 + 32));

    [*(id *)(a1 + 40) setTheStartCallback:0];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    uint64_t result = [*(id *)(a1 + 56) stsSession:*(void *)(a1 + 40) didStart:*(void *)(a1 + 32)];
  }
  if (!*(void *)(a1 + 32))
  {
    uint64_t result = [*(id *)(a1 + 40) isTimeLimited];
    if (v20 > 0.0)
    {
      uint64_t v21 = *(void *)(a1 + 40);
      return MEMORY[0x270F9A6D0](v21, sel_setSessionTimeLimit_);
    }
  }
  return result;
}

uint64_t sub_221174EC4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_2211751CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

uint64_t sub_2211751E8(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v7 = WeakRetained;
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    WeakRetained = v7;
  }
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) clearSessionTimer];
    os_unfair_lock_lock(v7 + 2);
    int os_unfair_lock_opaque_low = LOBYTE(v7[14]._os_unfair_lock_opaque);
    LOBYTE(v7[14]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v7 + 2);
    if (os_unfair_lock_opaque_low)
    {
      id v5 = [(os_unfair_lock_s *)v7 delegate];
      if (objc_opt_respondsToSelector()) {
        [v5 stsSession:*(void *)(a1 + 32) didEnd:0];
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

void sub_221176C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221176CAC(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = _os_activity_create(&dword_221170000, "com.apple.sts.session.activeTimer", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v3, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    Name = class_getName(v6);
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)state = 136315394;
    *(void *)&state[4] = Name;
    *(_WORD *)&state[12] = 2048;
    *(void *)&state[14] = v8;
    _os_log_fault_impl(&dword_221170000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s is still active after %lf seconds", state, 0x16u);
  }
  uint64_t v4 = [WeakRetained delegate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_221176E34;
  v9[3] = &unk_2645945A8;
  id v10 = v4;
  id v11 = WeakRetained;
  id v5 = v4;
  [WeakRetained endSessionWithCompletion:v9];
}

uint64_t sub_221176E34(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 stsSessionDidEndUnexpectedly:v4 errorCode:7];
  }
  return result;
}

void sub_221177208(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

void sub_221177218(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

void sub_221177228(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

uint64_t sub_221177238(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2211772F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22117739C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221178C58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_221178C7C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id sub_221178C90(uint64_t a1, void *a2)
{
  v29[4] = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = [v4 domain];
  char v6 = [v5 isEqual:@"STSXPCHelperErrorDomain"];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) _translateSTSXPCHelperError:v4];
    goto LABEL_13;
  }
  if ([v4 code] != 50)
  {
    uint64_t v14 = [v4 code];
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = [NSString stringWithUTF8String:"STS.fwk"];
    if (v14 == 47)
    {
      v26[0] = *MEMORY[0x263F08320];
      uint64_t v16 = [NSString stringWithUTF8String:"Reader mode protection enable"];
      v27[0] = v16;
      v27[1] = &unk_26D307780;
      v26[1] = @"Line";
      v26[2] = @"Method";
      uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
      v27[2] = v2;
      v26[3] = *MEMORY[0x263F07F80];
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 336);
      v27[3] = v17;
      uint64_t v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
      uint64_t v7 = [v15 errorWithDomain:v9 code:20 userInfo:v18];
    }
    else
    {
      v24[0] = *MEMORY[0x263F08320];
      uint64_t v16 = [NSString stringWithUTF8String:"Unexpected Result"];
      v25[0] = v16;
      v24[1] = *MEMORY[0x263F08608];
      uint64_t v17 = v4;
      if (!v4)
      {
        v19 = (void *)MEMORY[0x263F087E8];
        uint64_t v2 = [NSString stringWithUTF8String:"STS.fwk"];
        uint64_t v17 = [v19 errorWithDomain:v2 code:5 userInfo:0];
      }
      v25[1] = v17;
      v25[2] = &unk_26D307798;
      v24[2] = @"Line";
      v24[3] = @"Method";
      double v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
      v25[3] = v20;
      v24[4] = *MEMORY[0x263F07F80];
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 338);
      v25[4] = v21;
      uint64_t v22 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];
      uint64_t v7 = [v15 errorWithDomain:v9 code:10 userInfo:v22];

      if (v4) {
        goto LABEL_11;
      }
    }

LABEL_11:
    goto LABEL_12;
  }
  uint64_t v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = [NSString stringWithUTF8String:"STS.fwk"];
  v28[0] = *MEMORY[0x263F08320];
  id v10 = [NSString stringWithUTF8String:"NFC radio disabled"];
  v29[0] = v10;
  v29[1] = &unk_26D307768;
  v28[1] = @"Line";
  v28[2] = @"Method";
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v29[2] = v11;
  v28[3] = *MEMORY[0x263F07F80];
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 334);
  v29[3] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
  uint64_t v7 = [v8 errorWithDomain:v9 code:18 userInfo:v13];

LABEL_12:
LABEL_13:

  return v7;
}

uint64_t sub_221179124(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_221179134(uint64_t a1)
{
}

void sub_22117913C(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]_block_invoke", 353, *(void **)(a1 + 32), @"Failed to start handover session: %@", v9, v10, (uint64_t)v8);
    [*(id *)(a1 + 32) _activateSessionStartCompletion:v8];
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]_block_invoke", 358, *(void **)(a1 + 32), @"Handover session started", v5, v6, v18);
    id v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    [*(id *)(a1 + 32) setHandoverSession:v19];
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v12 handoverSession];
    [v13 setDelegate:v12];

    objc_sync_exit(v11);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;

    uint64_t v16 = [*(id *)(a1 + 32) stsNotificationListener];
    uint64_t v17 = [v16 xpcEndpoint];
    [v19 startSTSNotificationListenerWithEndpoint:v17];

    [*(id *)(a1 + 32) _activateSessionStartCompletion:0];
  }
}

void sub_2211792B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2211792CC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_2211792E0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_2211792F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v7 = [v3 _translateSTSXPCHelperError:a2];
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]_block_invoke_4", 411, *(void **)(a1 + 32), @"Failed to start QRCode handover session: %@", v4, v5, (uint64_t)v7);
    [*(id *)(a1 + 32) _activateTnepStatusHandler:v7];
    [*(id *)(a1 + 32) _activateInvalidationHandler:v7];
  }
  else
  {
    [v3 _activateTnepStatusHandler:0];
    uint64_t v6 = *(void **)(a1 + 32);
    [v6 _activateSessionStartCompletion:0];
  }
}

void sub_221179BA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_221179BC4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t sub_221179BDC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_221179BF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    uint64_t v4 = [v3 code];
    uint64_t v5 = *(void **)(a1 + 32);
    if (v4 == 6)
    {
      [v5 _activateInvalidationHandler:v7];
    }
    else
    {
      [v5 _activateSendRequestCompletion:0 terminationRequested:0 error:v7];
      id v6 = *(id *)(a1 + 32);
      objc_sync_enter(v6);
      if (![*(id *)(a1 + 32) transmissionState]) {
        [*(id *)(a1 + 32) setTransmissionState:2];
      }
      objc_sync_exit(v6);
    }
    id v3 = v7;
  }
}

void sub_221179CA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221179CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v19[4] = *MEMORY[0x263EF8340];
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:]_block_invoke", 500, *(void **)(a1 + 32), @"Timeout in getting response", a7, a8, v17);
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = (void *)MEMORY[0x263F087E8];
  id v11 = [NSString stringWithUTF8String:"STS.fwk"];
  v18[0] = *MEMORY[0x263F08320];
  id v12 = [NSString stringWithUTF8String:"Timeout"];
  v19[0] = v12;
  v19[1] = &unk_26D3077C8;
  v18[1] = @"Line";
  v18[2] = @"Method";
  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v19[2] = v13;
  v18[3] = *MEMORY[0x263F07F80];
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 501);
  v19[3] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  uint64_t v16 = [v10 errorWithDomain:v11 code:4 userInfo:v15];
  [v9 _activateSendRequestCompletion:0 terminationRequested:0 error:v16];
}

void sub_221179F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22117A31C(uint64_t a1)
{
  v13[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = [NSString stringWithUTF8String:"STS.fwk"];
  uint64_t v5 = *(unsigned int *)(a1 + 48);
  v12[0] = *MEMORY[0x263F08320];
  if (v5 >= 0x18) {
    int v6 = 24;
  }
  else {
    int v6 = v5;
  }
  id v7 = [NSString stringWithUTF8String:off_264594668[v6]];
  v13[0] = v7;
  v13[1] = &unk_26D3077F8;
  v12[1] = @"Line";
  v12[2] = @"Method";
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v13[2] = v8;
  v12[3] = *MEMORY[0x263F07F80];
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 549);
  v13[3] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
  id v11 = [v3 errorWithDomain:v4 code:v5 userInfo:v10];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v11);
}

void sub_22117AD54(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_22117AD84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]_block_invoke", 561, *(void **)(a1 + 32), @"Creating Proxy SE session", a7, a8, v15);
  uint64_t v9 = [*(id *)(a1 + 32) nfHwManager];
  uint64_t v10 = [v9 manager];

  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_22117AEA8;
  uint64_t v18 = &unk_264594508;
  id v11 = *(void **)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = v11;
  uint64_t v14 = [v10 startSecureElementManagerSession:&v15];
  if (v14) {
    objc_msgSend(*(id *)(a1 + 32), "setInitiatingSession:", v14, v15, v16, v17, v18, v19);
  }
  else {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]_block_invoke", 579, *(void **)(a1 + 32), @"Failed to start session.", v12, v13, v15);
  }
}

void sub_22117AEA8(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id v7 = *(void **)(a1 + 32);
  if (a3)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]_block_invoke_2", 567, v7, @"Failed to create Proxy SE session: %@", v5, v6, a3);
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]_block_invoke_2", 569, v7, @"Got the SE Proxy", v5, v6, v8);
    [*(id *)(a1 + 32) setInitiatingSession:0];
    [*(id *)(a1 + 32) setProxyReaderSESession:v9];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_22117AF60(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t sub_22117AF80(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_22117AFA0(uint64_t a1)
{
  v11[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = [NSString stringWithUTF8String:"STS.fwk"];
  v10[0] = *MEMORY[0x263F08320];
  uint64_t v5 = [NSString stringWithUTF8String:"Hardware Not Available"];
  v11[0] = v5;
  v11[1] = &unk_26D307810;
  v10[1] = @"Line";
  v10[2] = @"Method";
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x263F07F80];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 637);
  v11[3] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v9 = [v3 errorWithDomain:v4 code:12 userInfo:v8];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v9);
}

void sub_22117B154(uint64_t a1)
{
  v11[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = [NSString stringWithUTF8String:"STS.fwk"];
  v10[0] = *MEMORY[0x263F08320];
  uint64_t v5 = [NSString stringWithUTF8String:"Hardware Not Available"];
  v11[0] = v5;
  v11[1] = &unk_26D307828;
  v10[1] = @"Line";
  v10[2] = @"Method";
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x263F07F80];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 650);
  v11[3] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v9 = [v3 errorWithDomain:v4 code:12 userInfo:v8];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v9);
}

uint64_t sub_22117B308(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = [*(id *)(a1 + 40) stsHelper];
  [v2 stopReaderSEProxyListener];

  id v3 = *(void **)(a1 + 40);
  return [v3 _seProxyCleanup:0];
}

void sub_22117B370(uint64_t a1)
{
  v11[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = [NSString stringWithUTF8String:"STS.fwk"];
  v10[0] = *MEMORY[0x263F08320];
  uint64_t v5 = [NSString stringWithUTF8String:"Hardware Not Available"];
  v11[0] = v5;
  v11[1] = &unk_26D307840;
  v10[1] = @"Line";
  v10[2] = @"Method";
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x263F07F80];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 670);
  v11[3] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v9 = [v3 errorWithDomain:v4 code:12 userInfo:v8];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v9);
}

void sub_22117BA48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22117BA64(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v7 = a2;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader receiveISO18013DeviceResponse:sessionDataStatus:mDocResponseStatus:error:]_block_invoke", 732, v3, @"Session termination after SessionEstablishment", v4, v5, v6);
  [*(id *)(a1 + 32) _activateInvalidationHandler:v7];
}

void sub_22117C49C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_22117C4B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = WeakRetained;
    objc_sync_enter(v3);
    uint64_t v4 = [v3 sessionStartCompletion];

    if (v4)
    {
      uint64_t v5 = [v3 sessionStartCompletion];
      v5[2](v5, *(void *)(a1 + 32));

      [v3 setSessionStartCompletion:0];
    }
    objc_sync_exit(v3);

    id WeakRetained = v6;
  }
}

void sub_22117C564(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22117C658(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_22117C66C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = WeakRetained;
    objc_sync_enter(v3);
    uint64_t v4 = [v3 tnepStatusHandler];

    if (v4)
    {
      uint64_t v5 = [v3 tnepStatusHandler];
      v5[2](v5, *(void *)(a1 + 32));

      [v3 setTnepStatusHandler:0];
    }
    objc_sync_exit(v3);

    id WeakRetained = v6;
  }
}

void sub_22117C720(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22117C7EC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_22117C800(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v2 = [WeakRetained connectionHandler];

    id WeakRetained = v4;
    if (v2)
    {
      id v3 = [v4 connectionHandler];
      ((void (**)(void, id))v3)[2](v3, v4);

      [v4 setConnectionHandler:0];
      id WeakRetained = v4;
    }
  }
}

void sub_22117C9A4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_22117C9B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    id v3 = [WeakRetained sendRequestCompletion];

    id WeakRetained = v10;
    if (v3)
    {
      id v4 = [v10 _translateSTSXPCHelperError:*(void *)(a1 + 32)];
      if (!*(void *)(a1 + 32))
      {
        uint64_t v5 = [v10 caSessionStats];
        objc_msgSend(v5, "setTotalSuccessfulTransactionsInSession:", objc_msgSend(v5, "totalSuccessfulTransactionsInSession") + 1);
      }
      id v6 = [v10 sendRequestCompletion];
      ((void (**)(void, void, void *))v6)[2](v6, *(void *)(a1 + 40), v4);

      [v10 setSendRequestCompletion:0];
      if (*(unsigned char *)(a1 + 64))
      {
        sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader _activateSendRequestCompletion:terminationRequested:error:]_block_invoke", 919, *(void **)(a1 + 48), @"Invoking invalidation handler", v7, v8, v9);
        [*(id *)(a1 + 48) _activateInvalidationHandler:*(void *)(a1 + 32)];
      }

      id WeakRetained = v10;
    }
  }
}

void sub_22117CBF0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_22117CC04(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [WeakRetained sendRequestCompletion];

    if (v2)
    {
      id v3 = [WeakRetained sendRequestCompletion];
      v3[2](v3, 0, *(void *)(a1 + 32));

      [WeakRetained setSendRequestCompletion:0];
    }
    id v4 = [WeakRetained invalidationHandler];

    if (v4)
    {
      uint64_t v5 = [WeakRetained invalidationHandler];
      v5[2](v5, *(void *)(a1 + 32));

      [WeakRetained setInvalidationHandler:0];
    }
  }
}

void sub_22117F3A4(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v10 = v7;
  if (a3)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignPeerPaymentHandler startNFSessionWithCompletion:]_block_invoke", 41, v6, @"Failed to create NFPeerPaymentSession! %@", v8, v9, (uint64_t)v7);
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[SignPeerPaymentHandler startNFSessionWithCompletion:]_block_invoke", 43, v6, @"Peer Payment session created", v8, v9, v11);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_221180684(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v7 = a3;
  if (v8) {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) generateHandoverRequestForQRCodeWithConfiguration:responseHandler:]_block_invoke", 132, *(void **)(a1 + 32), @"request=%@", v5, v6, (uint64_t)v8);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_22118095C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_221180970(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained sendRequestCompletion];

    id WeakRetained = v5;
    if (v3)
    {
      id v4 = [v5 sendRequestCompletion];
      v4[2](v4, 0, *(void *)(a1 + 32));

      [v5 setSendRequestCompletion:0];
      id WeakRetained = v5;
    }
  }
}

uint64_t sub_221181FA0(void *a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  if (!a1) {
    goto LABEL_6;
  }
  uint64_t v11 = [a1 initWithParent:a2];
  if (v11)
  {
    id v12 = [[STSXPCClientNotificationListener alloc] initWithDelegate:v9 queue:v10];
    uint64_t v13 = *(void **)(v11 + 64);
    *(void *)(v11 + 64) = v12;

    *(_DWORD *)(v11 + 56) = 0;
    if (a4)
    {
      sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013Handler initWithParent:notificationListenerDelegate:initSTSHelper:callbackQueue:]", 79, (void *)v11, @"Create STSHelper", v14, v15, v22);
      uint64_t v16 = objc_opt_new();
      uint64_t v17 = *(void **)(v11 + 72);
      *(void *)(v11 + 72) = v16;

      uint64_t v18 = *(void **)(v11 + 72);
      uint64_t v19 = [*(id *)(v11 + 64) xpcEndpoint];
      id v20 = [v18 connectToNotificationListener:v19];

      if (v20)
      {

LABEL_6:
        uint64_t v11 = 0;
      }
    }
  }

  return v11;
}

uint64_t sub_2211820D4(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = [a1 initWithParent:a3];
    if (v9)
    {
      id v10 = [[STSXPCClientNotificationListener alloc] initWithDelegate:v9 queue:v8];
      uint64_t v11 = *(void **)(v9 + 64);
      *(void *)(v9 + 64) = v10;

      objc_storeWeak((id *)(v9 + 80), v7);
      *(_DWORD *)(v9 + 56) = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t sub_22118218C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 88) setDelegate:0];
    [*(id *)(v1 + 88) endSession];
    uint64_t v2 = *(void **)(v1 + 88);
    *(void *)(v1 + 88) = 0;

    id v3 = *(void **)(v1 + 64);
    return [v3 invalidateXPCConnection];
  }
  return result;
}

void sub_221182200(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

id sub_221182218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v65[4] = *MEMORY[0x263EF8340];
  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    if (v10[11])
    {
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler _start18013TransactionWithToken:]_block_invoke", 122, v10, @"handover session already exists, reusing", a7, a8, v43);
      uint64_t v11 = 0;
      goto LABEL_17;
    }
    v10[12] = 0;
    id v10 = *(void **)(a1 + 32);
  }
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = sub_221182ABC;
  v56 = sub_221182ACC;
  id v57 = 0;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler _start18013TransactionWithToken:]_block_invoke", 132, v10, @"Starting handover device session, type=%lu", a7, a8, 3);
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  uint64_t v13 = [*(id *)(a1 + 32) nfHardwareManager];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = sub_221182AD4;
  v49[3] = &unk_264594940;
  v49[4] = *(void *)(a1 + 32);
  v51 = &v52;
  uint64_t v14 = v12;
  v50 = v14;
  v47 = v13;
  uint64_t v17 = [v13 startSecureTransactionServicesSessionWithRole:0 connectionHandoverCofig:3 completion:v49];
  if (v17)
  {
    sub_221182200(*(void *)(a1 + 32), v17);
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      uint64_t v19 = *(void **)(v18 + 88);
    }
    else {
      uint64_t v19 = 0;
    }
    id v20 = v19;
    [v20 setDelegate:v18];

    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[ISO18013Handler _start18013TransactionWithToken:]_block_invoke", 162, *(void **)(a1 + 32), @"Activating session with token: %@", v21, v22, *(void *)(a1 + 40));
    v23 = *(void **)(a1 + 32);
    if (v23) {
      v23 = (void *)v23[11];
    }
    uint64_t v24 = v23;
    v25 = [v24 activateWithToken:*(void *)(a1 + 40)];

    if (v25)
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013Handler _start18013TransactionWithToken:]_block_invoke", 165, *(void **)(a1 + 32), @"Session switching error=%@", v26, v27, (uint64_t)v25);
      sub_22118218C(*(void *)(a1 + 32));
      v28 = (void *)MEMORY[0x263F087E8];
      id v29 = [NSString stringWithUTF8String:"STS.fwk"];
      v62[0] = *MEMORY[0x263F08320];
      v30 = [NSString stringWithUTF8String:"Unexpected Result"];
      uint64_t v31 = *MEMORY[0x263F08608];
      v63[0] = v30;
      v63[1] = v25;
      v62[1] = v31;
      v62[2] = @"Line";
      v63[2] = &unk_26D307C90;
      v62[3] = @"Method";
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
      v63[3] = v8;
      v62[4] = *MEMORY[0x263F07F80];
      uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 169);
      v63[4] = v32;
      uint64_t v33 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:5];
      uint64_t v11 = [v28 errorWithDomain:v29 code:10 userInfo:v33];
    }
    else
    {
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

      if (!v53[5])
      {
        v48.receiver = *(id *)(a1 + 32);
        v48.super_class = (Class)ISO18013Handler;
        id v37 = objc_msgSendSuper2(&v48, sel_startTransactionWithAuthorization_options_, 0, 0);
        v25 = 0;
        uint64_t v14 = 0;
        uint64_t v11 = 0;
        goto LABEL_16;
      }
      sub_22118218C(*(void *)(a1 + 32));
      uint64_t v36 = [(id)v53[5] code];
      v45 = (void *)MEMORY[0x263F087E8];
      if (v36 != 50)
      {
        id v29 = [NSString stringWithUTF8String:"STS.fwk"];
        v58[0] = *MEMORY[0x263F08320];
        v30 = [NSString stringWithUTF8String:"Unexpected Result"];
        v59[0] = v30;
        v58[1] = *MEMORY[0x263F08608];
        uint64_t v38 = v53[5];
        if (v38)
        {
          uint64_t v32 = (void *)v53[5];
        }
        else
        {
          uint64_t v39 = (void *)MEMORY[0x263F087E8];
          id v8 = [NSString stringWithUTF8String:"STS.fwk"];
          uint64_t v32 = [v39 errorWithDomain:v8 code:5 userInfo:0];
        }
        v59[1] = v32;
        v59[2] = &unk_26D307CC0;
        v58[2] = @"Line";
        v58[3] = @"Method";
        v40 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
        v59[3] = v40;
        v58[4] = *MEMORY[0x263F07F80];
        v41 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 183);
        v59[4] = v41;
        v42 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:5];
        uint64_t v11 = [v45 errorWithDomain:v29 code:10 userInfo:v42];
        BOOL v46 = v38 == 0;

        v25 = 0;
        uint64_t v14 = 0;
        if (!v46) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      id v29 = [NSString stringWithUTF8String:"STS.fwk"];
      v60[0] = *MEMORY[0x263F08320];
      v30 = [NSString stringWithUTF8String:"NFC radio disabled"];
      v61[0] = v30;
      v61[1] = &unk_26D307CA8;
      v60[1] = @"Line";
      v60[2] = @"Method";
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
      v61[2] = v8;
      v60[3] = *MEMORY[0x263F07F80];
      uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 181);
      v61[3] = v32;
      uint64_t v33 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:4];
      uint64_t v11 = [v45 errorWithDomain:v29 code:18 userInfo:v33];
      v25 = 0;
      uint64_t v14 = 0;
    }
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013Handler _start18013TransactionWithToken:]_block_invoke", 153, *(void **)(a1 + 32), @"Fail to start SecureTransactionServicesSession", v15, v16, v44);
    sub_22118218C(*(void *)(a1 + 32));
    id v34 = (void *)MEMORY[0x263F087E8];
    v25 = [NSString stringWithUTF8String:"STS.fwk"];
    v64[0] = *MEMORY[0x263F08320];
    id v29 = [NSString stringWithUTF8String:"Invalid State"];
    v65[0] = v29;
    v65[1] = &unk_26D307C78;
    v64[1] = @"Line";
    v64[2] = @"Method";
    v30 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
    v65[2] = v30;
    v64[3] = *MEMORY[0x263F07F80];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 156);
    v65[3] = v8;
    uint64_t v32 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:4];
    uint64_t v11 = [v34 errorWithDomain:v25 code:9 userInfo:v32];
  }
LABEL_14:

LABEL_15:
LABEL_16:

  _Block_object_dispose(&v52, 8);
LABEL_17:
  return v11;
}

void sub_221182A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_221182ABC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_221182ACC(uint64_t a1)
{
}

void sub_221182AD4(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v8 = v5;
  uint64_t v9 = *(void **)(a1 + 32);
  if (v5)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013Handler _start18013TransactionWithToken:]_block_invoke_2", 143, v9, @"Start session failed: %@", v6, v7, (uint64_t)v5);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = v8;
    dispatch_semaphore_t v12 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }
  else
  {
    if (v9) {
      uint64_t v13 = (void *)v9[8];
    }
    else {
      uint64_t v13 = 0;
    }
    dispatch_semaphore_t v12 = [v13 xpcEndpoint];
    [v14 startSTSNotificationListenerWithEndpoint:v12];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_221182C18(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_221182CD8;
    v5[3] = &unk_264594990;
    v5[4] = a1;
    id v6 = v3;
    os_unfair_lock_lock(a1 + 14);
    sub_221182CD8((uint64_t)v5);
    os_unfair_lock_unlock(a1 + 14);
  }
}

uint64_t sub_221182CD8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2
    && (*(void *)(v2 + 96) = 4, (uint64_t v3 = *(void *)(a1 + 32)) != 0)
    && ((id v4 = *(void **)(v3 + 88)) == 0 || ([v4 setDelegate:0], (v3 = *(void *)(a1 + 32)) != 0))
    && (id v5 = *(void **)(v3 + 88)) != 0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_221182E00;
    v10[3] = &unk_264594648;
    id v11 = *(id *)(a1 + 40);
    [v5 endSessionWithCompletion:v10];
    sub_221182200(*(void *)(a1 + 32), 0);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    id v8 = *(void **)(v7 + 72);
  }
  else {
    id v8 = 0;
  }
  [v8 invalidate];
  return [*(id *)(a1 + 32) _tearDown];
}

uint64_t sub_221182E00(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

id *sub_221182F50(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = sub_221182ABC;
    uint64_t v31 = sub_221182ACC;
    id v32 = 0;
    objc_storeStrong(a1 + 13, a2);
    id v11 = sub_22119847C();
    if (os_signpost_enabled(v11))
    {
      dispatch_semaphore_t v12 = [v8 subIdentifier];
      *(_DWORD *)buf = 138412290;
      id v34 = v12;
      _os_signpost_emit_with_name_impl(&dword_221170000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReleaseCredential", "keyIdentifier=%@", buf, 0xCu);
    }
    uint64_t v13 = [v8 subIdentifier];
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler releaseCredential:withAuthorization:iso18013Selection:]", 266, a1, @"keyIdentifier=%@", v14, v15, (uint64_t)v13);

    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    id v17 = a1[8];
    uint64_t v18 = [v8 subIdentifier];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_22118323C;
    v24[3] = &unk_2645949B8;
    v24[4] = a1;
    uint64_t v26 = &v27;
    uint64_t v19 = v16;
    v25 = v19;
    [v17 activateISO18013CredentialWithIdentifier:v18 elementSelection:v10 authData:v9 completion:v24];

    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler releaseCredential:withAuthorization:iso18013Selection:]", 280, a1, @"exit", v20, v21, v23);
    a1 = (id *)(id)v28[5];

    _Block_object_dispose(&v27, 8);
  }

  return a1;
}

void sub_221183210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22118323C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler releaseCredential:withAuthorization:iso18013Selection:]_block_invoke", 273, *(void **)(a1 + 32), @"callback", v4, v5, v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v9 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id *sub_221183A50(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 10);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

void sub_2211841CC(os_unfair_lock_s *a1)
{
  if (a1)
  {
    uint64_t v1 = a1 + 14;
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = sub_221184268;
    v2[3] = &unk_264594620;
    v2[4] = a1;
    os_unfair_lock_lock(a1 + 14);
    sub_221184268((uint64_t)v2);
    os_unfair_lock_unlock(v1);
  }
}

void sub_221184268(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1[11])
  {
    objc_initWeak(&location, v1);
    dispatch_time_t v3 = dispatch_time(0, 200000000);
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 88) callbackQueue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_22118436C;
    v5[3] = &unk_264594898;
    objc_copyWeak(&v6, &location);
    dispatch_after(v3, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void sub_221184358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_22118436C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2211983A0(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler delayedStopTNEPOperation]_block_invoke_2", 509, (uint64_t)"after delay", a6, a7, a8, v11);
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_22118444C;
    v12[3] = &unk_264594620;
    uint64_t v13 = WeakRetained;
    os_unfair_lock_lock(v10 + 14);
    sub_22118444C((uint64_t)v12);
    os_unfair_lock_unlock(v10 + 14);
  }
}

uint64_t sub_22118444C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 88);
  }
  else {
    uint64_t v2 = 0;
  }
  return [v2 stopTNEPOperation];
}

id sub_221184B60(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id sub_2211852DC(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) xpcConnection];
  if (v1) {
    id v2 = (void *)MEMORY[0x263EFFA88];
  }
  else {
    id v2 = (void *)MEMORY[0x263EFFA80];
  }
  id v3 = v2;

  return v3;
}

void sub_221185434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22118544C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];

  if (v2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) delayWork];
    id v3 = _Block_copy(*(const void **)(a1 + 40));
    [v4 addObject:v3];
  }
}

void sub_2211855B4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2211856C8;
  v9[3] = &unk_264594A60;
  void v9[4] = v2;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v10 = v3;
  uint64_t v11 = v4;
  uint64_t v5 = [v2 _asynchronousRemoteProxyWithErrorHandler:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2211858A0;
  v7[3] = &unk_264594A88;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v5 sendRawDataToAlternativeCarrier:v6 callback:v7];
}

void sub_2211856C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void v18[4] = *MEMORY[0x263EF8340];
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener alternativerCarrierSend:completion:]_block_invoke_2", 74, *(void **)(a1 + 32), @"XPC error=%@", a7, a8, a2);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = [NSString stringWithUTF8String:"STS.fwk"];
  v17[0] = *MEMORY[0x263F08320];
  dispatch_semaphore_t v12 = [NSString stringWithUTF8String:"XPC Error"];
  v18[0] = v12;
  v18[1] = &unk_26D307D08;
  v17[1] = @"Line";
  v17[2] = @"Method";
  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v18[2] = v13;
  v17[3] = *MEMORY[0x263F07F80];
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 75);
  v18[3] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  dispatch_semaphore_t v16 = [v10 errorWithDomain:v11 code:6 userInfo:v15];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v16);
}

uint64_t sub_2211858A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22118591C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_2211859A4;
  v3[3] = &unk_2645945F8;
  v3[4] = v1;
  id v2 = [v1 _asynchronousRemoteProxyWithErrorHandler:v3];
  [v2 sendConnectionHandoverStarted];
}

void sub_2211859A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener sendConnectionHandoverStarted]_block_invoke_2", 89, *(void **)(a1 + 32), @"XPC error=%@", a7, a8, a2);
}

void sub_221185A54(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_221185ADC;
  v3[3] = &unk_2645945F8;
  v3[4] = v1;
  id v2 = [v1 _asynchronousRemoteProxyWithErrorHandler:v3];
  [v2 sendConnectionHandoverCompleted];
}

void sub_221185ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener sendConnectionHandoverCompleted]_block_invoke_2", 100, *(void **)(a1 + 32), @"XPC error=%@", a7, a8, a2);
}

void sub_221185C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_221185C38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_221185C48(uint64_t a1)
{
}

void sub_221185C50(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener setRequestHandoverConfirmation:]_block_invoke", 108, *(void **)(a1 + 32), @"XPC error=%@", v4, v5, (uint64_t)v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_221185E0C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_221185E24(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener startHandoff]_block_invoke", 118, *(void **)(a1 + 32), @"XPC error=%@", v4, v5, (uint64_t)v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void sub_221185E9C(uint64_t a1, void *a2)
{
}

void sub_221185FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void v18[4] = *MEMORY[0x263EF8340];
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener activateISO18013CredentialWithIdentifier:elementSelection:authData:completion:]_block_invoke", 137, *(void **)(a1 + 32), @"XPC error=%@", a7, a8, a2);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = [NSString stringWithUTF8String:"STS.fwk"];
  v17[0] = *MEMORY[0x263F08320];
  dispatch_semaphore_t v12 = [NSString stringWithUTF8String:"XPC Error"];
  v18[0] = v12;
  v18[1] = &unk_26D307D20;
  v17[1] = @"Line";
  v17[2] = @"Method";
  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v18[2] = v13;
  v17[3] = *MEMORY[0x263F07F80];
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 138);
  v18[3] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  dispatch_semaphore_t v16 = [v10 errorWithDomain:v11 code:6 userInfo:v15];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v16);
}

void sub_2211862D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void v18[4] = *MEMORY[0x263EF8340];
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener sendISO18013SessionEstablishment:completion:]_block_invoke", 144, *(void **)(a1 + 32), @"XPC error=%@", a7, a8, a2);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = [NSString stringWithUTF8String:"STS.fwk"];
  v17[0] = *MEMORY[0x263F08320];
  dispatch_semaphore_t v12 = [NSString stringWithUTF8String:"XPC Error"];
  v18[0] = v12;
  v18[1] = &unk_26D307D38;
  v17[1] = @"Line";
  v17[2] = @"Method";
  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v18[2] = v13;
  v17[3] = *MEMORY[0x263F07F80];
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 145);
  v18[3] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  dispatch_semaphore_t v16 = [v10 errorWithDomain:v11 code:6 userInfo:v15];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v16);
}

uint64_t sub_2211864AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_221186600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void v18[4] = *MEMORY[0x263EF8340];
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener sendISO18013SessionData:status:completion:]_block_invoke", 156, *(void **)(a1 + 32), @"XPC error=%@", a7, a8, a2);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = [NSString stringWithUTF8String:"STS.fwk"];
  v17[0] = *MEMORY[0x263F08320];
  dispatch_semaphore_t v12 = [NSString stringWithUTF8String:"XPC Error"];
  v18[0] = v12;
  v18[1] = &unk_26D307D50;
  v17[1] = @"Line";
  v17[2] = @"Method";
  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v18[2] = v13;
  v17[3] = *MEMORY[0x263F07F80];
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 157);
  v18[3] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  dispatch_semaphore_t v16 = [v10 errorWithDomain:v11 code:6 userInfo:v15];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v16);
}

uint64_t sub_2211867D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22118690C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void v18[4] = *MEMORY[0x263EF8340];
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener testGetRemoteTransceiverProxyXPCEndpointWithType:completion:]_block_invoke", 171, *(void **)(a1 + 32), @"XPC error=%@", a7, a8, a2);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = [NSString stringWithUTF8String:"STS.fwk"];
  v17[0] = *MEMORY[0x263F08320];
  dispatch_semaphore_t v12 = [NSString stringWithUTF8String:"XPC Error"];
  v18[0] = v12;
  v18[1] = &unk_26D307D68;
  v17[1] = @"Line";
  v17[2] = @"Method";
  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v18[2] = v13;
  v17[3] = *MEMORY[0x263F07F80];
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 172);
  v18[3] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  dispatch_semaphore_t v16 = [v10 errorWithDomain:v11 code:6 userInfo:v15];
  (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v16, 0);
}

uint64_t sub_221186AE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_221186C84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_221186D64(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];

  if (v2)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener listener:shouldAcceptNewConnection:]_block_invoke", 208, *(void **)(a1 + 32), @"Connection existed", v3, v4, v19);
    return MEMORY[0x263EFFA80];
  }
  else
  {
    id v6 = sub_221199794([STSEntitlementChecker alloc], *(void **)(a1 + 40));
    uint64_t v9 = v6;
    if (!v6 || !*((unsigned char *)v6 + 8)) {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener listener:shouldAcceptNewConnection:]_block_invoke", 214, *(void **)(a1 + 32), @"Missing xpcClientNotificationListenerAccess entitlement", v7, v8, v19);
    }
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSXPCClientNotificationListener listener:shouldAcceptNewConnection:]_block_invoke", 221, *(void **)(a1 + 32), @"Accepting new connection", v7, v8, v19);
    id v10 = [*(id *)(a1 + 32) _stsHandoverNotificationListenerProtocol];
    [*(id *)(a1 + 40) setExportedInterface:v10];

    [*(id *)(a1 + 32) setXpcConnection:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) setExportedObject:*(void *)(a1 + 32)];
    uint64_t v11 = [*(id *)(a1 + 32) _stsHandoverNotificationListenerCallbackProtocol];
    [*(id *)(a1 + 40) setRemoteObjectInterface:v11];

    objc_initWeak(&location, *(id *)(a1 + 32));
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_2211870A0;
    v24[3] = &unk_264594B50;
    v24[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v25, &location);
    [*(id *)(a1 + 40) setInvalidationHandler:v24];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_2211871D8;
    v22[3] = &unk_264594B50;
    v22[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v23, &location);
    [*(id *)(a1 + 40) setInterruptionHandler:v22];
    dispatch_semaphore_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = [*(id *)(a1 + 32) callbackQueue];
    [v12 _setQueue:v13];

    [*(id *)(a1 + 40) resume];
    uint64_t v14 = [*(id *)(a1 + 32) delayWork];
    uint64_t v15 = (void *)[v14 copy];

    dispatch_semaphore_t v16 = [*(id *)(a1 + 32) delayWork];
    [v16 removeAllObjects];

    id v17 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_221187268;
    block[3] = &unk_2645945A8;
    block[4] = *(void *)(a1 + 32);
    id v21 = v15;
    id v18 = v15;
    dispatch_async(v17, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

    return MEMORY[0x263EFFA88];
  }
}

void sub_22118706C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2211870A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCClientNotificationListener listener:shouldAcceptNewConnection:]_block_invoke_2", 236, *(void **)(a1 + 32), @"XPC invalidated", a7, a8, v12);
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    [(os_unfair_lock_s *)WeakRetained setXpcConnection:0];
    uint64_t v11 = [(os_unfair_lock_s *)v10 delegate];
    [v11 xpcInvalidated];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_221187194;
    v13[3] = &unk_264594620;
    v13[4] = v10;
    os_unfair_lock_lock(v10 + 2);
    sub_221187194((uint64_t)v13);
    os_unfair_lock_unlock(v10 + 2);
  }
}

void sub_221187194(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delayWork];
  [v1 removeAllObjects];
}

void sub_2211871D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCClientNotificationListener listener:shouldAcceptNewConnection:]_block_invoke_4", 248, *(void **)(a1 + 32), @"XPC interrupted", a7, a8, v11);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v12 = WeakRetained;
    [WeakRetained setXpcConnection:0];
    id v10 = [v12 delegate];
    [v10 xpcInterrupted];

    id WeakRetained = v12;
  }
}

void sub_221187268(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 notificationClientConnected];
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void sub_221187E64(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
        uint64_t v13 = [STS18013RequestElement alloc];
        if (v12)
        {
          id v14 = *(id *)(v12 + 16);
          uint64_t v15 = *(unsigned __int16 *)(v12 + 8);
        }
        else
        {
          id v14 = 0;
          uint64_t v15 = 0;
        }
        dispatch_semaphore_t v16 = [(STS18013RequestElement *)v13 initWithName:v14 retention:v15];
        [v6 addObject:v16];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v17 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v9 = v17;
    }
    while (v17);
  }

  id v18 = *(void **)(a1 + 32);
  uint64_t v19 = (void *)[v6 copy];
  [v18 setValue:v19 forKey:v4];
}

id sub_221188104(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 xpcConnection];
    id v5 = [v4 remoteObjectProxy];
    uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = [v3 callbackQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_221188214;
    v11[3] = &unk_264594800;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v12 = v8;
    uint64_t v13 = v9;
    dispatch_async(v7, v11);

    uint64_t v6 = 0;
  }
  return v6;
}

void sub_221188214(uint64_t a1)
{
  void v11[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F087E8];
  id v4 = [NSString stringWithUTF8String:"STS.fwk"];
  v10[0] = *MEMORY[0x263F08320];
  id v5 = [NSString stringWithUTF8String:"XPC Error"];
  v11[0] = v5;
  v11[1] = &unk_26D307D80;
  v10[1] = @"Line";
  v10[2] = @"Method";
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x263F07F80];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 505);
  v11[3] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  uint64_t v9 = [v3 errorWithDomain:v4 code:6 userInfo:v8];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);
}

id sub_221188498(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) xpcConnection];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 xpcConnection];
    id v5 = [v4 remoteObjectProxy];
    uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = [v3 callbackQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_2211885A8;
    v11[3] = &unk_264594800;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v12 = v8;
    uint64_t v13 = v9;
    dispatch_async(v7, v11);

    uint64_t v6 = 0;
  }
  return v6;
}

void sub_2211885A8(uint64_t a1)
{
  void v11[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F087E8];
  id v4 = [NSString stringWithUTF8String:"STS.fwk"];
  v10[0] = *MEMORY[0x263F08320];
  id v5 = [NSString stringWithUTF8String:"XPC Error"];
  v11[0] = v5;
  v11[1] = &unk_26D307D98;
  v10[1] = @"Line";
  v10[2] = @"Method";
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x263F07F80];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 520);
  v11[3] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  uint64_t v9 = [v3 errorWithDomain:v4 code:6 userInfo:v8];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);
}

id *sub_221188848(id *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)STSCredentialSelect;
    uint64_t v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

void sub_221188CC4(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v10 = v7;
  if (a3)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler startNFSessionWithCompletion:]_block_invoke", 34, v6, @"Failed to create loyalty and payment session! %@", v8, v9, (uint64_t)v7);
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[PaymentHandler startNFSessionWithCompletion:]_block_invoke", 36, v6, @"Loyalty and payment session created", v8, v9, v11);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setDelegate:");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_221189CBC(uint64_t a1, void *a2)
{
  v54[4] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1)
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v6 = objc_opt_new();
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v43 = v5;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v45;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v45 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            if ([v12 type] != 1)
            {
              uint64_t v24 = [v12 type];
              sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler setAuxiliaryCredentials:]", 135, (void *)a1, @"Incorrect aux credential type: %ld", v25, v26, v24);
              uint64_t v27 = (void *)MEMORY[0x263F087E8];
              v28 = [NSString stringWithUTF8String:"STS.fwk"];
              v50[0] = *MEMORY[0x263F08320];
              uint64_t v29 = [NSString stringWithUTF8String:"Invalid Parameter"];
              v51[0] = v29;
              v51[1] = &unk_26D307E70;
              v50[1] = @"Line";
              v50[2] = @"Method";
              v30 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_setAuxiliaryCredentials_));
              v51[2] = v30;
              v50[3] = *MEMORY[0x263F07F80];
              uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_setAuxiliaryCredentials_), 136);
              v51[3] = v31;
              id v32 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:4];
              long long v23 = [v27 errorWithDomain:v28 code:8 userInfo:v32];

              goto LABEL_16;
            }
            objc_super v13 = (objc_class *)MEMORY[0x263F58148];
            id v14 = v12;
            id v15 = objc_alloc_init(v13);
            dispatch_semaphore_t v16 = [v14 merchantId];
            [v15 setIdentifier:v16];

            uint64_t v17 = [v14 data];
            [v15 setData:v17];

            id v18 = [v14 mobileToken];
            [v15 setToken:v18];

            objc_msgSend(v15, "setUserInterventionRequired:", objc_msgSend(v14, "userInterventionRequired"));
            uint64_t v19 = [v14 type];

            [v15 setType:v19];
            [v6 addObject:v15];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      if ([*(id *)(a1 + 56) setHostCards:v6])
      {
        id v22 = v7;
        long long v23 = 0;
        id v7 = *(id *)(a1 + 64);
        *(void *)(a1 + 64) = v22;
      }
      else
      {
        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler setAuxiliaryCredentials:]", 151, (void *)a1, @"%@ failed to set VAS cards", v20, v21, (uint64_t)v6);
        id v37 = (void *)MEMORY[0x263F087E8];
        id v7 = [NSString stringWithUTF8String:"STS.fwk"];
        v48[0] = *MEMORY[0x263F08320];
        v28 = [NSString stringWithUTF8String:"Unexpected Result"];
        v49[0] = v28;
        v49[1] = &unk_26D307E88;
        v48[1] = @"Line";
        v48[2] = @"Method";
        uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_setAuxiliaryCredentials_));
        v49[2] = v38;
        v48[3] = *MEMORY[0x263F07F80];
        uint64_t v39 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_setAuxiliaryCredentials_), 152);
        v49[3] = v39;
        v40 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:4];
        long long v23 = [v37 errorWithDomain:v7 code:10 userInfo:v40];

LABEL_16:
      }
      id v5 = v43;
    }
    else
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler setAuxiliaryCredentials:]", 127, (void *)a1, @"NF session does not exist!", v3, v4, v42);
      uint64_t v33 = (void *)MEMORY[0x263F087E8];
      uint64_t v6 = [NSString stringWithUTF8String:"STS.fwk"];
      v53[0] = *MEMORY[0x263F08320];
      id v7 = [NSString stringWithUTF8String:"Invalid State"];
      v54[0] = v7;
      v54[1] = &unk_26D307E58;
      v53[1] = @"Line";
      v53[2] = @"Method";
      id v34 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_setAuxiliaryCredentials_));
      v54[2] = v34;
      v53[3] = *MEMORY[0x263F07F80];
      uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_setAuxiliaryCredentials_), 128);
      v54[3] = v35;
      uint64_t v36 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:4];
      long long v23 = [v33 errorWithDomain:v6 code:9 userInfo:v36];
    }
  }
  else
  {
    long long v23 = 0;
  }

  return v23;
}

id sub_22118A310(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v35[4] = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v9 = (void *)a1[7];
    if (v9)
    {
      int v10 = a2;
      id v31 = 0;
      uint64_t v11 = [v9 enablePlasticCardMode:a2 error:&v31];
      id v12 = v31;
      id v15 = v12;
      if (v11) {
        goto LABEL_13;
      }
      dispatch_semaphore_t v16 = @"disabling";
      if (v10) {
        dispatch_semaphore_t v16 = @"enabling";
      }
      id v30 = v12;
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler enablePlasticCardMode:]", 167, a1, @"%@ plastic card mode failed = %@", v13, v14, (uint64_t)v16);
      uint64_t v17 = (void *)MEMORY[0x263F087E8];
      id v18 = [NSString stringWithUTF8String:"STS.fwk"];
      v32[0] = *MEMORY[0x263F08320];
      uint64_t v19 = [NSString stringWithUTF8String:"Unexpected Result"];
      v33[0] = v19;
      v32[1] = *MEMORY[0x263F08608];
      uint64_t v20 = v15;
      if (!v15)
      {
        uint64_t v21 = (void *)MEMORY[0x263F087E8];
        uint64_t v11 = [NSString stringWithUTF8String:"STS.fwk"];
        uint64_t v20 = [v21 errorWithDomain:v11 code:5 userInfo:0];
      }
      v33[1] = v20;
      v33[2] = &unk_26D307EB8;
      v32[2] = @"Line";
      v32[3] = @"Method";
      id v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_enablePlasticCardMode_), v30);
      v33[3] = v22;
      v32[4] = *MEMORY[0x263F07F80];
      long long v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_enablePlasticCardMode_), 168);
      v33[4] = v23;
      uint64_t v24 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];
      uint64_t v25 = [v17 errorWithDomain:v18 code:10 userInfo:v24];

      if (v15) {
        goto LABEL_12;
      }
    }
    else
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler enablePlasticCardMode:]", 161, a1, @"NF session does not exist!", a7, a8, v29);
      uint64_t v26 = (void *)MEMORY[0x263F087E8];
      id v18 = [NSString stringWithUTF8String:"STS.fwk"];
      v34[0] = *MEMORY[0x263F08320];
      uint64_t v19 = [NSString stringWithUTF8String:"Invalid State"];
      v35[0] = v19;
      v35[1] = &unk_26D307EA0;
      v34[1] = @"Line";
      v34[2] = @"Method";
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_enablePlasticCardMode_));
      v35[2] = v11;
      v34[3] = *MEMORY[0x263F07F80];
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_enablePlasticCardMode_), 162);
      v35[3] = v20;
      uint64_t v27 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
      uint64_t v25 = [v26 errorWithDomain:v18 code:9 userInfo:v27];
    }
LABEL_12:

    id v15 = (void *)v25;
    goto LABEL_13;
  }
  id v15 = 0;
LABEL_13:
  return v15;
}

id sub_22118A6F4(void *a1, void *a2, void *a3)
{
  v45[4] = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v9 = v6;
  if (a1)
  {
    if (a1[7])
    {
      int v10 = [v6 identifier];

      if (v10
        && (uint64_t v11 = (void *)a1[7],
            [v9 identifier],
            id v12 = objc_claimAutoreleasedReturnValue(),
            [v11 appletWithIdentifier:v12],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            v12,
            v13))
      {
        sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler felicaCredentialState:error:]", 193, a1, @"Felica applet %@", v14, v15, (uint64_t)v13);
        dispatch_semaphore_t v16 = (void *)a1[7];
        id v39 = 0;
        uint64_t v17 = [v16 felicaAppletState:v13 error:&v39];
        id v18 = v39;
        if (v17) {
          BOOL v21 = v18 == 0;
        }
        else {
          BOOL v21 = 0;
        }
        if (v21)
        {
          id v22 = 0;
          goto LABEL_21;
        }
        id v22 = v18;
        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler felicaCredentialState:error:]", 197, a1, @"get felica state failed = %@", v19, v20, (uint64_t)v18);
        if (!a3)
        {
LABEL_21:

LABEL_22:
          goto LABEL_23;
        }
        id v37 = (void *)MEMORY[0x263F087E8];
        uint64_t v38 = [NSString stringWithUTF8String:"STS.fwk"];
        v42[0] = *MEMORY[0x263F08320];
        long long v23 = [NSString stringWithUTF8String:"Unexpected Result"];
        v43[0] = v23;
        v42[1] = *MEMORY[0x263F08608];
        uint64_t v24 = v22;
        if (!v22)
        {
          uint64_t v25 = (void *)MEMORY[0x263F087E8];
          uint64_t v3 = [NSString stringWithUTF8String:"STS.fwk"];
          uint64_t v24 = [v25 errorWithDomain:v3 code:5 userInfo:0];
        }
        v43[1] = v24;
        v43[2] = &unk_26D307EE8;
        v42[2] = @"Line";
        v42[3] = @"Method";
        uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_felicaCredentialState_error_));
        v43[3] = v36;
        v42[4] = *MEMORY[0x263F07F80];
        uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_felicaCredentialState_error_), 199);
        v43[4] = v26;
        uint64_t v27 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:5];
        *a3 = [v37 errorWithDomain:v38 code:10 userInfo:v27];

        if (v22)
        {
          v28 = (void *)v38;
LABEL_20:

          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v29 = [v9 identifier];
        sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler felicaCredentialState:error:]", 203, a1, @"applet not found for identifier = %@", v30, v31, (uint64_t)v29);

        if (!a3)
        {
          uint64_t v13 = 0;
          uint64_t v17 = 0;
          goto LABEL_22;
        }
        id v32 = (void *)MEMORY[0x263F087E8];
        id v22 = [NSString stringWithUTF8String:"STS.fwk"];
        v40[0] = *MEMORY[0x263F08320];
        uint64_t v38 = [NSString stringWithUTF8String:"Invalid Parameter"];
        v41[0] = v38;
        v41[1] = &unk_26D307F00;
        v40[1] = @"Line";
        v40[2] = @"Method";
        long long v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_felicaCredentialState_error_));
        v41[2] = v23;
        v40[3] = *MEMORY[0x263F07F80];
        uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_felicaCredentialState_error_), 205);
        v41[3] = v3;
        uint64_t v24 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:4];
        [v32 errorWithDomain:v22 code:8 userInfo:v24];
        uint64_t v13 = 0;
        uint64_t v17 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      v28 = (void *)v38;
LABEL_19:

      goto LABEL_20;
    }
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler felicaCredentialState:error:]", 178, a1, @"NF session does not exist!", v7, v8, v35);
    if (a3)
    {
      uint64_t v33 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = [NSString stringWithUTF8String:"STS.fwk"];
      v44[0] = *MEMORY[0x263F08320];
      id v22 = [NSString stringWithUTF8String:"Invalid State"];
      v45[0] = v22;
      v45[1] = &unk_26D307ED0;
      v44[1] = @"Line";
      v44[2] = @"Method";
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_felicaCredentialState_error_));
      v45[2] = v28;
      v44[3] = *MEMORY[0x263F07F80];
      long long v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_felicaCredentialState_error_), 180);
      v45[3] = v23;
      uint64_t v3 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];
      [v33 errorWithDomain:v13 code:9 userInfo:v3];
      uint64_t v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  uint64_t v17 = 0;
LABEL_23:

  return v17;
}

id sub_22118ACF4(void *a1, void *a2, void *a3)
{
  v45[4] = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v9 = v6;
  if (a1)
  {
    if (a1[7])
    {
      int v10 = [v6 identifier];

      if (v10
        && (uint64_t v11 = (void *)a1[7],
            [v9 identifier],
            id v12 = objc_claimAutoreleasedReturnValue(),
            [v11 appletWithIdentifier:v12],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            v12,
            v13))
      {
        sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler transitCredentialState:error:]", 231, a1, @"Transit applet %@", v14, v15, (uint64_t)v13);
        dispatch_semaphore_t v16 = (void *)a1[7];
        id v39 = 0;
        uint64_t v17 = [v16 transitAppletState:v13 error:&v39];
        id v18 = v39;
        if (v17) {
          BOOL v21 = v18 == 0;
        }
        else {
          BOOL v21 = 0;
        }
        if (v21)
        {
          id v22 = 0;
          goto LABEL_21;
        }
        id v22 = v18;
        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler transitCredentialState:error:]", 235, a1, @"get transit state failed = %@", v19, v20, (uint64_t)v18);
        if (!a3)
        {
LABEL_21:

LABEL_22:
          goto LABEL_23;
        }
        id v37 = (void *)MEMORY[0x263F087E8];
        uint64_t v38 = [NSString stringWithUTF8String:"STS.fwk"];
        v42[0] = *MEMORY[0x263F08320];
        long long v23 = [NSString stringWithUTF8String:"Unexpected Result"];
        v43[0] = v23;
        v42[1] = *MEMORY[0x263F08608];
        uint64_t v24 = v22;
        if (!v22)
        {
          uint64_t v25 = (void *)MEMORY[0x263F087E8];
          uint64_t v3 = [NSString stringWithUTF8String:"STS.fwk"];
          uint64_t v24 = [v25 errorWithDomain:v3 code:5 userInfo:0];
        }
        v43[1] = v24;
        v43[2] = &unk_26D307F30;
        v42[2] = @"Line";
        v42[3] = @"Method";
        uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_transitCredentialState_error_));
        v43[3] = v36;
        v42[4] = *MEMORY[0x263F07F80];
        uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_transitCredentialState_error_), 237);
        v43[4] = v26;
        uint64_t v27 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:5];
        *a3 = [v37 errorWithDomain:v38 code:10 userInfo:v27];

        if (v22)
        {
          v28 = (void *)v38;
LABEL_20:

          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v29 = [v9 identifier];
        sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler transitCredentialState:error:]", 241, a1, @"applet not found for identifier = %@", v30, v31, (uint64_t)v29);

        if (!a3)
        {
          uint64_t v13 = 0;
          uint64_t v17 = 0;
          goto LABEL_22;
        }
        id v32 = (void *)MEMORY[0x263F087E8];
        id v22 = [NSString stringWithUTF8String:"STS.fwk"];
        v40[0] = *MEMORY[0x263F08320];
        uint64_t v38 = [NSString stringWithUTF8String:"Invalid Parameter"];
        v41[0] = v38;
        v41[1] = &unk_26D307F48;
        v40[1] = @"Line";
        v40[2] = @"Method";
        long long v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_transitCredentialState_error_));
        v41[2] = v23;
        v40[3] = *MEMORY[0x263F07F80];
        uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_transitCredentialState_error_), 243);
        v41[3] = v3;
        uint64_t v24 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:4];
        [v32 errorWithDomain:v22 code:8 userInfo:v24];
        uint64_t v13 = 0;
        uint64_t v17 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      v28 = (void *)v38;
LABEL_19:

      goto LABEL_20;
    }
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler transitCredentialState:error:]", 216, a1, @"NF session does not exist!", v7, v8, v35);
    if (a3)
    {
      uint64_t v33 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = [NSString stringWithUTF8String:"STS.fwk"];
      v44[0] = *MEMORY[0x263F08320];
      id v22 = [NSString stringWithUTF8String:"Invalid State"];
      v45[0] = v22;
      v45[1] = &unk_26D307F18;
      v44[1] = @"Line";
      v44[2] = @"Method";
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_transitCredentialState_error_));
      v45[2] = v28;
      v44[3] = *MEMORY[0x263F07F80];
      long long v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_transitCredentialState_error_), 218);
      v45[3] = v23;
      uint64_t v3 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];
      [v33 errorWithDomain:v13 code:9 userInfo:v3];
      uint64_t v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  uint64_t v17 = 0;
LABEL_23:

  return v17;
}

void sub_22118BE34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22118BFA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_22118C538(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void sub_22118CD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22118CD40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22118CD50(uint64_t a1)
{
}

void sub_22118CD58(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHandler activateWithHandoffToken:]_block_invoke", 83, *(void **)(a1 + 32), @"%@", v4, v5, (uint64_t)v6);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_22118D1C4(void *a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  if (!a1) {
    goto LABEL_6;
  }
  uint64_t v11 = [a1 initWithParent:a2];
  if (v11)
  {
    id v12 = [[STSXPCClientNotificationListener alloc] initWithDelegate:v9 queue:v10];
    uint64_t v13 = *(void **)(v11 + 64);
    *(void *)(v11 + 64) = v12;

    *(_DWORD *)(v11 + 56) = 0;
    if (a4)
    {
      sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013HybridHandler initWithParent:notificationListenerDelegate:initSTSHelper:callbackQueue:]", 78, (void *)v11, @"Create STSHelper", v14, v15, v22);
      uint64_t v16 = objc_opt_new();
      uint64_t v17 = *(void **)(v11 + 72);
      *(void *)(v11 + 72) = v16;

      id v18 = *(void **)(v11 + 72);
      uint64_t v19 = [*(id *)(v11 + 64) xpcEndpoint];
      uint64_t v20 = [v18 connectToNotificationListener:v19];

      if (v20)
      {

LABEL_6:
        uint64_t v11 = 0;
      }
    }
  }

  return v11;
}

uint64_t sub_22118D2F8(uint64_t a1)
{
  [*(id *)(a1 + 88) setDelegate:0];
  [*(id *)(a1 + 88) endSession];
  uint64_t v2 = *(void **)(a1 + 88);
  *(void *)(a1 + 88) = 0;

  uint64_t v3 = *(void **)(a1 + 64);
  return [v3 invalidateXPCConnection];
}

uint64_t sub_22118D364(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22118D374(uint64_t a1)
{
}

void sub_22118D37C(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  uint64_t v8 = v5;
  id v9 = *(void **)(a1 + 32);
  if (v5)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler _startHandoverSession]_block_invoke", 131, v9, @"Start session failed: %@", v6, v7, (uint64_t)v5);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = v8;
    id v12 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler _startHandoverSession]_block_invoke", 136, v9, @"Start session started", v6, v7, v15);
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      uint64_t v14 = *(void **)(v13 + 64);
    }
    else {
      uint64_t v14 = 0;
    }
    id v12 = [v14 xpcEndpoint];
    [v16 startSTSNotificationListenerWithEndpoint:v12];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_22118EABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_22118EB10(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

void sub_22118EB28(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  int v7 = [v13 type];
  if (v7 == [*(id *)(a1 + 32) supportedCredentialType]
    && ([v13 identifier], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v9 = (void *)v8,
        [v13 secondarySubIdentifier],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    id v11 = [v13 subIdentifier];

    if (v11) {
      uint64_t v12 = *(void *)(a1 + 40);
    }
    else {
      uint64_t v12 = *(void *)(a1 + 48);
    }
    objc_storeStrong((id *)(*(void *)(v12 + 8) + 40), a2);
  }
  else
  {
    *a4 = 1;
  }
}

uint64_t sub_22118EC0C(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ISO18013HybridHandler;
  id v1 = objc_msgSendSuper2(&v3, sel_startTransactionWithAuthorization_options_, 0, 0);
  return 0;
}

void sub_22118ECC4(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_22118ED84;
    v5[3] = &unk_264594990;
    void v5[4] = a1;
    id v6 = v3;
    os_unfair_lock_lock(a1 + 14);
    sub_22118ED84((uint64_t)v5);
    os_unfair_lock_unlock(a1 + 14);
  }
}

uint64_t sub_22118ED84(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2
    && (*(void *)(v2 + 112) = 4, (uint64_t v3 = *(void *)(a1 + 32)) != 0)
    && ((uint64_t v4 = *(void **)(v3 + 88)) == 0 || ([v4 setDelegate:0], (v3 = *(void *)(a1 + 32)) != 0))
    && (id v5 = *(void **)(v3 + 88)) != 0)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_22118EEC0;
    v11[3] = &unk_264594648;
    id v12 = *(id *)(a1 + 40);
    [v5 endSessionWithCompletion:v11];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      objc_storeStrong((id *)(v6 + 88), 0);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    id v9 = *(void **)(v8 + 72);
  }
  else {
    id v9 = 0;
  }
  [v9 invalidate];
  return [*(id *)(a1 + 32) _tearDown];
}

uint64_t sub_22118EEC0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

id *sub_22118F280(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = sub_22118D364;
    uint64_t v31 = sub_22118D374;
    id v32 = 0;
    objc_storeStrong(a1 + 12, a2);
    id v11 = sub_22119847C();
    if (os_signpost_enabled(v11))
    {
      id v12 = [v8 subIdentifier];
      *(_DWORD *)buf = 138412290;
      id v34 = v12;
      _os_signpost_emit_with_name_impl(&dword_221170000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReleaseCredential", "keyIdentifier=%@", buf, 0xCu);
    }
    id v13 = [v8 subIdentifier];
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler releaseCredential:withAuthorization:iso18013Selection:]", 364, a1, @"keyIdentifier=%@", v14, v15, (uint64_t)v13);

    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    id v17 = a1[8];
    id v18 = [v8 subIdentifier];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_22118F56C;
    v24[3] = &unk_2645949B8;
    v24[4] = a1;
    uint64_t v26 = &v27;
    uint64_t v19 = v16;
    uint64_t v25 = v19;
    [v17 activateISO18013CredentialWithIdentifier:v18 elementSelection:v10 authData:v9 completion:v24];

    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler releaseCredential:withAuthorization:iso18013Selection:]", 378, a1, @"exit", v20, v21, v23);
    a1 = (id *)(id)v28[5];

    _Block_object_dispose(&v27, 8);
  }

  return a1;
}

void sub_22118F540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22118F56C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler releaseCredential:withAuthorization:iso18013Selection:]_block_invoke", 371, *(void **)(a1 + 32), @"callback", v4, v5, v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v9 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id *sub_221190140(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 10);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

void sub_2211908BC(os_unfair_lock_s *a1)
{
  if (a1)
  {
    uint64_t v1 = a1 + 14;
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = sub_221190958;
    v2[3] = &unk_264594620;
    v2[4] = a1;
    os_unfair_lock_lock(a1 + 14);
    sub_221190958((uint64_t)v2);
    os_unfair_lock_unlock(v1);
  }
}

void sub_221190958(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1[11])
  {
    objc_initWeak(&location, v1);
    dispatch_time_t v3 = dispatch_time(0, 200000000);
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 88) callbackQueue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_221190A5C;
    v5[3] = &unk_264594898;
    objc_copyWeak(&v6, &location);
    dispatch_after(v3, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void sub_221190A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_221190A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2211983A0(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler delayedStopTNEPOperation]_block_invoke_2", 621, (uint64_t)"after delay", a6, a7, a8, v11);
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_221190B3C;
    v12[3] = &unk_264594620;
    id v13 = WeakRetained;
    os_unfair_lock_lock(v10 + 14);
    sub_221190B3C((uint64_t)v12);
    os_unfair_lock_unlock(v10 + 14);
  }
}

uint64_t sub_221190B3C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 88);
  }
  else {
    uint64_t v2 = 0;
  }
  return [v2 stopTNEPOperation];
}

void sub_2211919D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2211919F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_221191A00(uint64_t a1)
{
}

void sub_221191A08(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener startWithDelegate:]_block_invoke", 49, *(void **)(a1 + 32), @"Session created: error: %@", v7, v8, (uint64_t)v6);
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener startWithDelegate:]_block_invoke", 50, *(void **)(a1 + 32), @"Session: %@", v9, v10, (uint64_t)v11);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (!v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
    [v11 setDelegate:*(void *)(a1 + 32)];
  }
}

void sub_221191BC0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

void sub_221191C70(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didEndSession]_block_invoke", 80, *(void **)(a1 + 32), @"firing event", v2, v3, v4);
    [v5 listenerDidEndUnexpectedly:*(void *)(a1 + 32)];
  }
}

void sub_221191DC4(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didStartSession:]_block_invoke", 91, *(void **)(a1 + 32), @"firing event", v2, v3, v4);
    [v5 listenerDidStart:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  }
}

void sub_221191F18(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  id v5 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didEnterField:]_block_invoke", 103, *(void **)(a1 + 32), @"firing event", v2, v3, v4);
    [v5 listener:*(void *)(a1 + 32) didEnterField:*(void *)(*(void *)(a1 + 32) + 24)];
  }
}

void sub_221192054(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didExitField]_block_invoke", 114, *(void **)(a1 + 32), @"firing event", v2, v3, v4);
    [v5 listener:*(void *)(a1 + 32) didExitField:*(void *)(*(void *)(a1 + 32) + 24)];
  }
}

id sub_221194404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2211982D4(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[CALogger postCAEventFor:eventInput:]_block_invoke", 20, @"Posting for %@ = %@", a6, a7, a8, *(void *)(a1 + 32));
  uint64_t v9 = *(void **)(a1 + 40);
  return v9;
}

void sub_2211948F8(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v10 = v7;
  if (a3)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignMerchantPaymentHandler startNFSessionWithCompletion:]_block_invoke", 39, v6, @"Failed to create NFECommercePaymentSession! %@", v8, v9, (uint64_t)v7);
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[SignMerchantPaymentHandler startNFSessionWithCompletion:]_block_invoke", 41, v6, @"NFECommercePaymentSession session created", v8, v9, v11);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_221195244(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2211953D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2211954CC(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v10 = v7;
  if (a3)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler startNFSessionWithCompletion:]_block_invoke", 36, v6, @"Failed to create digital car key session! %@", v8, v9, (uint64_t)v7);
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[DigitalCarKeyHandler startNFSessionWithCompletion:]_block_invoke", 38, v6, @"Digital car key session created", v8, v9, v11);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setDelegate:");
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setPassthroughDelegate:");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_221196260(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 0;
  }
  uint64_t v9 = a1[7];
  if (!v9)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler supportsSecureRanging]", 107, a1, @"NF session does not exist!", a7, a8, vars0);
    return 0;
  }
  return MEMORY[0x270F9A6D0](v9, sel_supportsSecureRanging);
}

id sub_2211962C8(id a1, uint64_t a2)
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v3 = [MEMORY[0x263F58100] vehicleReports:a2];
    id v6 = v3;
    if (v3 && [v3 count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_2211963E8;
      v10[3] = &unk_264594D80;
      id v2 = v7;
      id v11 = v2;
      [v6 enumerateKeysAndObjectsUsingBlock:v10];
    }
    else
    {
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler vehicleReports:]", 118, v2, @"No vehicle reports.", v4, v5, v9);
      id v2 = 0;
    }
  }
  return v2;
}

void sub_2211963E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[STSVehicleReport alloc] initVehicleReport:v5];

  [*(id *)(a1 + 32) setValue:v7 forKey:v6];
}

id sub_221196474(void *a1, void *a2)
{
  void v34[4] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (!a1)
  {
    id v12 = 0;
    goto LABEL_11;
  }
  if (!a1[7])
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler rkeSendPassthroughMessage:]", 136, a1, @"NF session does not exist!", v3, v4, v27);
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = [NSString stringWithUTF8String:"STS.fwk"];
    v33[0] = *MEMORY[0x263F08320];
    uint64_t v15 = [NSString stringWithUTF8String:"Invalid State"];
    v34[0] = v15;
    v34[1] = &unk_26D308350;
    v33[1] = @"Line";
    v33[2] = @"Method";
    dispatch_semaphore_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_rkeSendPassthroughMessage_));
    v34[2] = v16;
    v33[3] = *MEMORY[0x263F07F80];
    id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_rkeSendPassthroughMessage_), 137);
    v34[3] = v17;
    uint64_t v23 = NSDictionary;
    uint64_t v24 = v34;
    uint64_t v25 = v33;
LABEL_9:
    id v18 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:4];
    uint64_t v19 = v22;
    uint64_t v20 = v14;
    uint64_t v21 = 9;
    goto LABEL_10;
  }
  id v6 = [a1 activeSTSCredential];

  if (!v6)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler rkeSendPassthroughMessage:]", 139, a1, @"Credential does not exist!", v7, v8, v27);
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = [NSString stringWithUTF8String:"STS.fwk"];
    v31[0] = *MEMORY[0x263F08320];
    uint64_t v15 = [NSString stringWithUTF8String:"Invalid State"];
    v32[0] = v15;
    v32[1] = &unk_26D308368;
    v31[1] = @"Line";
    v31[2] = @"Method";
    dispatch_semaphore_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_rkeSendPassthroughMessage_));
    v32[2] = v16;
    v31[3] = *MEMORY[0x263F07F80];
    id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_rkeSendPassthroughMessage_), 140);
    v32[3] = v17;
    uint64_t v23 = NSDictionary;
    uint64_t v24 = v32;
    uint64_t v25 = v31;
    goto LABEL_9;
  }
  uint64_t v9 = (void *)a1[7];
  id v28 = 0;
  char v10 = [v9 sendPassthroughMessage:v5 error:&v28];
  id v11 = v28;
  id v12 = v11;
  if ((v10 & 1) == 0 && !v11)
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = [NSString stringWithUTF8String:"STS.fwk"];
    v29[0] = *MEMORY[0x263F08320];
    uint64_t v15 = [NSString stringWithUTF8String:"Unknown Error"];
    v30[0] = v15;
    v30[1] = &unk_26D308380;
    v29[1] = @"Line";
    v29[2] = @"Method";
    dispatch_semaphore_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_rkeSendPassthroughMessage_));
    v30[2] = v16;
    v29[3] = *MEMORY[0x263F07F80];
    id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel_rkeSendPassthroughMessage_), 147);
    v30[3] = v17;
    id v18 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];
    uint64_t v19 = v13;
    uint64_t v20 = v14;
    uint64_t v21 = 5;
LABEL_10:
    id v12 = [v19 errorWithDomain:v20 code:v21 userInfo:v18];
  }
LABEL_11:

  return v12;
}

id *sub_2211968D0(id *a1, uint64_t a2)
{
  if (a1)
  {
    a1 = [a1[7] cancelRKEFunction:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

id sub_221196910(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    a1 = [MEMORY[0x263F58100] pauseRangingForReaderIdentifier:a2 durationInSec:a3];
    uint64_t v3 = vars8;
  }
  return a1;
}

id sub_221196950(void *a1, uint64_t a2)
{
  if (a1)
  {
    a1 = [MEMORY[0x263F58100] resumeRangingForReaderIdentifier:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

id sub_2211970E8(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  id v6 = a3;
  id v7 = a2;
  self;
  uint64_t v8 = [MEMORY[0x263F58100] requestAssertionForKeyID:v7 options:v6 outError:a4];

  if (!v8)
  {
    if (a4) {
      id v12 = *a4;
    }
    else {
      id v12 = @"(error not avail)";
    }
    sub_2211982D4(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[DigitalCarKeyHandler requestAssertionForKeyID:options:outError:]", 275, @"Failed to get assertion %@", v9, v10, v11, (uint64_t)v12);
  }
  return v8;
}

uint64_t sub_22119801C()
{
  if (qword_267F46538 != -1) {
    dispatch_once(&qword_267F46538, &unk_26D2FDE20);
  }
  return dword_267F46534;
}

uint64_t sub_221198060()
{
  uint64_t result = arc4random();
  dword_267F46534 = result;
  return result;
}

void sub_221198080(os_log_type_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (qword_267F46548 != -1) {
    dispatch_once(&qword_267F46548, &unk_26D2FDE40);
  }
  id v6 = (id) [[NSString alloc] initWithFormat:v5 arguments:a3];
  uint64_t v7 = [v6 UTF8String];
  uint64_t v8 = qword_267F46540;
  if (os_log_type_enabled((os_log_t)qword_267F46540, a1))
  {
    int v9 = 136446210;
    uint64_t v10 = v7;
    _os_log_impl(&dword_221170000, v8, a1, "%{public}s", (uint8_t *)&v9, 0xCu);
  }
}

uint64_t sub_221198194()
{
  qword_267F46540 = (uint64_t)os_log_create("com.apple.sts", "logging");
  return MEMORY[0x270F9A758]();
}

void sub_2211981D8(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = a5;
  id v15 = a6;
  if (!a2) {
    goto LABEL_5;
  }
  if (qword_267F46560 != -1) {
    dispatch_once(&qword_267F46560, &unk_26D2FDE80);
  }
  if (byte_267F46530 == 1)
  {
LABEL_5:
    dispatch_semaphore_t v16 = NSString;
    id v17 = v15;
    id v18 = [v16 stringWithFormat:@"%08x [%s]:%d %@", objc_msgSend(v14, "objectInstanceID"), a3, a4, v17];

    sub_221198080(a1, v18, (uint64_t)&a9);
  }
}

void sub_2211982D4(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13 = a5;
  if (!a2) {
    goto LABEL_5;
  }
  if (qword_267F46560 != -1) {
    dispatch_once(&qword_267F46560, &unk_26D2FDE80);
  }
  if (byte_267F46530 == 1)
  {
LABEL_5:
    id v14 = [NSString stringWithFormat:@"%s : %d : %@", a3, a4, v13];
    sub_221198080(a1, v14, (uint64_t)&a9);
  }
}

void sub_2211983A0(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a2) {
    goto LABEL_5;
  }
  if (qword_267F46560 != -1) {
    dispatch_once(&qword_267F46560, &unk_26D2FDE80);
  }
  if (byte_267F46530 == 1)
  {
LABEL_5:
    id v13 = [NSString stringWithCString:a5 encoding:4];
    id v14 = [NSString stringWithFormat:@"%s : %d : %@", a3, a4, v13];

    sub_221198080(a1, v14, (uint64_t)&a9);
  }
}

id sub_22119847C()
{
  if (qword_267F46558 != -1) {
    dispatch_once(&qword_267F46558, &unk_26D2FDE60);
  }
  uint64_t v0 = (void *)qword_267F46550;
  return v0;
}

uint64_t sub_2211984D0()
{
  qword_267F46550 = (uint64_t)os_log_create("com.apple.sts.signpost", "GeneralSignposts");
  return MEMORY[0x270F9A758]();
}

uint64_t sub_221198514()
{
  uint64_t result = MGGetBoolAnswer();
  if (result) {
    byte_267F46530 = 1;
  }
  return result;
}

uint64_t sub_221198948()
{
  qword_267F46568 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2211993A8(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__postReaderTransactionEvent_prepOnly_);
}

uint64_t sub_221199450(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__postReaderSessionEvent_);
}

id sub_221199468(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  [v1 rfTechnology];
  [v2 setNFCTechnology:0];
  [v2 setFieldType:1];
  uint64_t v3 = [v1 notificationType];
  switch(v3)
  {
    case 3:
      id v6 = v1;
      objc_msgSend(v2, "setODARequired:", objc_msgSend(v6, "odaRequired"));
      uint64_t v7 = [v6 terminalType];
      unsigned int v8 = [v6 terminalSubType];
      if (v7 != 1)
      {
        if (v7 == 2)
        {
          if (v8 >= 8) {
            uint64_t v7 = 2;
          }
          else {
            uint64_t v7 = qword_2211A6740[(char)v8];
          }
        }
        else
        {
          uint64_t v7 = 7;
        }
      }
      [v2 setTerminalType:v7];
      id v12 = [v6 tciArray];
      [v2 setTCIS:v12];

      id v13 = [v6 openLoopSchemeBitfield];

      [v2 setOpenLoopSchemeBitfield:v13];
      uint64_t v4 = v2;
      uint64_t v5 = 2;
      goto LABEL_16;
    case 2:
      id v9 = v1;
      objc_msgSend(v2, "setODARequired:", objc_msgSend(v9, "odaRequired"));
      unsigned int v10 = [v9 terminalMode] - 1;
      if (v10 > 3) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = dword_2211A6780[v10];
      }
      [v2 setTerminalMode:v11];
      [v2 setTerminalType:4];
      [v2 setEcpVersion:1];

      break;
    case 1:
      [v2 setODARequired:0];
      [v2 setTerminalType:4];
      uint64_t v4 = v2;
      uint64_t v5 = 0;
LABEL_16:
      [v4 setEcpVersion:v5];
      break;
  }

  return v2;
}

id sub_221199794(id a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)STSEntitlementChecker;
    a1 = objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      *((_DWORD *)a1 + 3) = [v3 processIdentifier];
      CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      if (v3) {
        [v3 auditToken];
      }
      else {
        memset(&token, 0, sizeof(token));
      }
      SecTaskRef v5 = SecTaskCreateWithAuditToken(v4, &token);
      if (v5)
      {
        unsigned int v8 = v5;
        id v9 = @"com.apple.sts.xpcclientnotification.listener";
        CFErrorRef error = 0;
        CFTypeRef v12 = SecTaskCopyValueForEntitlement(v8, @"com.apple.sts.xpcclientnotification.listener", &error);
        if (error)
        {
          sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSEntitlementChecker _copyValueOfEntitlement:secTask:]", 30, a1, @"Failed to get entitlements: %@", v10, v11, (uint64_t)error);
          CFRelease(error);
        }
        if (v12)
        {
          CFTypeID v13 = CFGetTypeID(v12);
          BOOL v14 = v13 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v12) != 0;
          CFRelease(v12);
        }
        else
        {
          BOOL v14 = 0;
        }

        *((unsigned char *)a1 + 8) = v14;
        CFRelease(v8);
      }
      else
      {
        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSEntitlementChecker initWithConnection:]", 84, a1, @"Cannot create SecTaskRef with XPC Connection: %@", v6, v7, (uint64_t)v3);

        a1 = 0;
      }
    }
  }

  return a1;
}

void sub_22119A314(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22119A3FC;
  block[3] = &unk_264594828;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t sub_22119A3FC(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_22119BCE8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_22119D2C8(uint64_t a1)
{
  void v11[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F087E8];
  CFAllocatorRef v4 = [NSString stringWithUTF8String:"STS.fwk"];
  v10[0] = *MEMORY[0x263F08320];
  id v5 = [NSString stringWithUTF8String:"Invalid State"];
  v11[0] = v5;
  v11[1] = &unk_26D3085D8;
  v10[1] = @"Line";
  v10[2] = @"Method";
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 40)));
  v11[2] = v6;
  v10[3] = *MEMORY[0x263F07F80];
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 40)), 204);
  v11[3] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v9 = [v3 errorWithDomain:v4 code:9 userInfo:v8];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);
}

uint64_t sub_22119D478(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22119E39C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22119E3C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22119E3D0(uint64_t a1)
{
}

void sub_22119E3D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_22119E504(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    a2 = +[STSTapToProvisionAppletData fromOR:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22119E644(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = +[STSTapToProvisionResult fromOR:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void sub_22119EFB8(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v10 = v7;
  if (a3)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler startNFSessionWithCompletion:]_block_invoke", 42, v6, @"Failed to create Unified Access session! %@", v8, v9, (uint64_t)v7);
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[UnifiedAccessHandler startNFSessionWithCompletion:]_block_invoke", 44, v6, @"Unified session created", v8, v9, v11);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setDelegate:");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_2211A1438(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 activeSTSCredential];
    id v5 = [a1 activeSTSCredentials];

    if (v5)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = objc_msgSend(a1, "activeSTSCredentials", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            id v12 = [v11 identifier];
            int v13 = [v3 isEqual:v12];

            if (v13)
            {
              id v14 = v11;

              uint64_t v4 = v14;
              goto LABEL_13;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_2211A35A8()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_2211A35B8()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_2211A35C8()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_2211A35D8()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t dispatch_time_to_nsec()
{
  return MEMORY[0x270ED95B0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x270F9AA48](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x270FA2410]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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