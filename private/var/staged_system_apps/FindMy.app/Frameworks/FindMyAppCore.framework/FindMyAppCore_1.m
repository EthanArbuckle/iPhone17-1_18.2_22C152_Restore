char *assignWithTake for PeopleListPersonRow.State(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t, uint64_t);
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(char *, uint64_t, uint64_t);
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v50;

  v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  v8 = *((void *)a2 + 5);
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = v8;
  swift_bridgeObjectRelease();
  v9 = a3[7];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v13 = *(void *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      if (a1 == a2) {
        goto LABEL_14;
      }
      sub_B8F94((uint64_t)v10);
      if (!swift_getEnumCaseMultiPayload())
      {
        v50 = sub_BF048();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 32))(v10, v11, v50);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v17 = *(void *)(v13 + 64);
LABEL_8:
      memcpy(v10, v11, v17);
      goto LABEL_14;
    }
    sub_B8F94((uint64_t)v10);
LABEL_7:
    v17 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_EE4F0) - 8) + 64);
    goto LABEL_8;
  }
  if (v16) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v10, v11, *(void *)(v13 + 64));
  }
  else
  {
    v18 = sub_BF048();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v10, v11, v18);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_14:
  v19 = a3[8];
  v20 = (uint64_t)&a1[v19];
  v21 = &a2[v19];
  if (*(void *)&a1[v19 + 8] == 1)
  {
LABEL_17:
    *(_OWORD *)v20 = *(_OWORD *)v21;
    goto LABEL_19;
  }
  v22 = *((void *)v21 + 1);
  if (v22 == 1)
  {
    sub_66700(v20);
    goto LABEL_17;
  }
  *(void *)v20 = *(void *)v21;
  *(void *)(v20 + 8) = v22;
  swift_bridgeObjectRelease();
LABEL_19:
  v23 = a3[9];
  v24 = &a1[v23];
  v25 = &a2[v23];
  v26 = sub_BF098();
  v27 = *(void *)(v26 - 8);
  v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  v29 = v28(v24, 1, v26);
  v30 = v28(v25, 1, v26);
  if (v29)
  {
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v30)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
LABEL_24:
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_EE4F8);
    memcpy(v24, v25, *(void *)(*(void *)(v31 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v24, v25, v26);
LABEL_25:
  v32 = a3[10];
  v33 = *(void **)&a1[v32];
  *(void *)&a1[v32] = *(void *)&a2[v32];

  v34 = a3[11];
  v35 = &a1[v34];
  v36 = &a2[v34];
  v37 = sub_BF3B8();
  v38 = *(void *)(v37 - 8);
  v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48);
  v40 = v39(v35, 1, v37);
  v41 = v39(v36, 1, v37);
  if (v40)
  {
    if (!v41)
    {
      (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v35, v36, v37);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v41)
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v35, v37);
LABEL_30:
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_EE500);
    memcpy(v35, v36, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 40))(v35, v36, v37);
LABEL_31:
  v43 = a3[12];
  v44 = &a1[v43];
  v45 = &a2[v43];
  v46 = v39(&a1[v43], 1, v37);
  v47 = v39(v45, 1, v37);
  if (!v46)
  {
    if (!v47)
    {
      (*(void (**)(char *, char *, uint64_t))(v38 + 40))(v44, v45, v37);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v38 + 8))(v44, v37);
    goto LABEL_36;
  }
  if (v47)
  {
LABEL_36:
    v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_EE500);
    memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v44, v45, v37);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v44, 0, 1, v37);
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleListPersonRow.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_BDCBC);
}

uint64_t sub_BDCBC(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_EE4F0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[7];
LABEL_9:
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v13(a1 + v11, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_EE4F8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[9];
    goto LABEL_9;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_EE500);
  v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + a3[11];

  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for PeopleListPersonRow.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_BDE54);
}

uint64_t sub_BDE54(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_EE4F0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[7];
LABEL_7:
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v13(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_EE4F8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[9];
    goto LABEL_7;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_EE500);
  v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = v5 + a4[11];

  return v15(v17, a2, a2, v16);
}

void sub_BDFD8()
{
  sub_BE150(319, &qword_EE650, (void (*)(uint64_t))type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
  if (v0 <= 0x3F)
  {
    sub_BE150(319, &qword_EE658, (void (*)(uint64_t))&type metadata accessor for Badge);
    if (v1 <= 0x3F)
    {
      sub_BE150(319, (unint64_t *)&unk_EE660, (void (*)(uint64_t))&type metadata accessor for GenericControl.Info);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_BE150(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_C0868();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

ValueMetadata *type metadata accessor for PeopleListPersonRow.State.SendableContact()
{
  return &type metadata for PeopleListPersonRow.State.SendableContact;
}

uint64_t getEnumTagSinglePayload for PeopleListPersonRow.State.DetailOrProgress(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PeopleListPersonRow.State.DetailOrProgress(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
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

uint64_t sub_BE25C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_BE274(void *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleListPersonRow.State.DetailOrProgress()
{
  return &type metadata for PeopleListPersonRow.State.DetailOrProgress;
}

uint64_t *initializeBufferWithCopyOfBuffer for PeopleListPersonRow.State.RelativeDateOrString(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
      uint64_t v8 = sub_BF048();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for PeopleListPersonRow.State.RelativeDateOrString(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = sub_BF048();
    unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
}

void *initializeWithCopy for PeopleListPersonRow.State.RelativeDateOrString(void *a1, void *a2)
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
    uint64_t v5 = sub_BF048();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for PeopleListPersonRow.State.RelativeDateOrString(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_B8F94((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v4 = sub_BF048();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for PeopleListPersonRow.State.RelativeDateOrString(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_BF048();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for PeopleListPersonRow.State.RelativeDateOrString(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_B8F94((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_BF048();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_BE724()
{
  uint64_t result = sub_BF048();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleListPersonRow.State.ID()
{
  return &type metadata for PeopleListPersonRow.State.ID;
}

uint64_t sub_BE7C4()
{
  return sub_DC08(&qword_EE758, &qword_EE4E8);
}

uint64_t getEnumTagSinglePayload for PeopleListPersonRow.DetailOrProgress(uint64_t a1, unsigned int a2)
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
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleListPersonRow.DetailOrProgress(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
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

ValueMetadata *type metadata accessor for PeopleListPersonRow.DetailOrProgress()
{
  return &type metadata for PeopleListPersonRow.DetailOrProgress;
}

uint64_t sub_BE8BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_BE8D8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 96 * a1 + 32;
    unint64_t v6 = a3 + 96 * v4;
    if (v5 >= v6 || v5 + 96 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_C0A28();
  __break(1u);
  return result;
}

uint64_t sub_BE9D0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_BF3B8() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_C0A28();
  __break(1u);
  return result;
}

unint64_t sub_BEB28()
{
  unint64_t result = qword_EE7D0;
  if (!qword_EE7D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_EE7C0);
    sub_B8FF0(&qword_EE7D8, (void (*)(uint64_t))&type metadata accessor for RelativeDateText);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_EE7D0);
  }
  return result;
}

uint64_t sub_BEBD8()
{
  type metadata accessor for PeopleListPersonRow(0);

  return sub_B6C90();
}

unint64_t sub_BEC7C()
{
  unint64_t result = qword_EE7F0;
  if (!qword_EE7F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_EE768);
    sub_DC08(&qword_ECEE0, &qword_EC000);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_EE7F0);
  }
  return result;
}

uint64_t type metadata accessor for PeopleModule()
{
  return self;
}

uint64_t sub_BED48()
{
  uint64_t v0 = sub_BF068();
  __swift_allocate_value_buffer(v0, qword_EE890);
  __swift_project_value_buffer(v0, (uint64_t)qword_EE890);
  type metadata accessor for PeopleModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = [self bundleForClass:ObjCClassFromMetadata];
  return sub_BF058();
}

uint64_t static FindMyLocalizationTable.people.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_EA510 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_BF068();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_EE890);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_BEEAC()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_EE8A8 = (uint64_t)result;
  return result;
}

uint64_t sub_BEF04(uint64_t a1)
{
  return sub_BEF94(a1, qword_F4890);
}

uint64_t sub_BEF28(uint64_t a1)
{
  return sub_BEF94(a1, qword_F48A8);
}

uint64_t sub_BEF4C(uint64_t a1)
{
  return sub_BEF94(a1, qword_F48C0);
}

uint64_t sub_BEF70(uint64_t a1)
{
  return sub_BEF94(a1, qword_F48D8);
}

uint64_t sub_BEF94(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_BF618();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_EA518 != -1) {
    swift_once();
  }
  id v4 = (id)qword_EE8A8;
  return sub_BF608();
}

uint64_t sub_BF038()
{
  return static FindMyRelativeDate.== infix(_:_:)();
}

uint64_t sub_BF048()
{
  return type metadata accessor for FindMyRelativeDate();
}

uint64_t sub_BF058()
{
  return FindMyLocalizationTable.init(tableName:tableBundle:)();
}

uint64_t sub_BF068()
{
  return type metadata accessor for FindMyLocalizationTable();
}

uint64_t sub_BF078()
{
  return type metadata accessor for Badge.Color();
}

uint64_t sub_BF088()
{
  return Badge.init(title:systemSymbol:backgroundColor:)();
}

uint64_t sub_BF098()
{
  return type metadata accessor for Badge();
}

uint64_t sub_BF0A8()
{
  return Person.Handle.debugDescription.getter();
}

uint64_t sub_BF0B8()
{
  return static Person.Handle.== infix(_:_:)();
}

uint64_t sub_BF0C8()
{
  return static Person.Handle.Kind.== infix(_:_:)();
}

uint64_t sub_BF0D8()
{
  return type metadata accessor for Person.Handle.Kind();
}

uint64_t sub_BF0E8()
{
  return Person.Handle.kind.getter();
}

uint64_t _s13FindMyAppCore12LostModeInfoV19contactDisplayValueSSvg_0()
{
  return Person.Handle.label.getter();
}

uint64_t sub_BF108()
{
  return Person.Handle.init(rawValue:)();
}

uint64_t sub_BF118()
{
  return Person.Handle.rawValue.getter();
}

uint64_t sub_BF128()
{
  return type metadata accessor for Person.Handle();
}

uint64_t sub_BF168()
{
  return static _BridgedStoredNSError.== infix(_:_:)();
}

uint64_t sub_BF198()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t sub_BF1A8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_BF1B8()
{
  return static FormatStyleCapitalizationContext.beginningOfSentence.getter();
}

uint64_t sub_BF1C8()
{
  return type metadata accessor for FormatStyleCapitalizationContext();
}

uint64_t sub_BF1D8()
{
  return URL.absoluteString.getter();
}

void sub_BF1E8(NSURL *retstr@<X8>)
{
}

uint64_t sub_BF1F8()
{
  return static URL.== infix(_:_:)();
}

uint64_t sub_BF208()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_BF218()
{
  return type metadata accessor for URL();
}

uint64_t sub_BF228()
{
  return static Date.FormatStyle.TimeStyle.omitted.getter();
}

uint64_t sub_BF238()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t sub_BF248()
{
  return static Date.FormatStyle.DateStyle.long.getter();
}

uint64_t sub_BF258()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

uint64_t sub_BF268()
{
  return static Date.== infix(_:_:)();
}

uint64_t sub_BF278()
{
  return static Date.now.getter();
}

uint64_t sub_BF288()
{
  return Date.formatted(date:time:)();
}

uint64_t sub_BF298()
{
  return Date.formatted()()._countAndFlagsBits;
}

uint64_t sub_BF2A8()
{
  return type metadata accessor for Date();
}

uint64_t sub_BF2B8()
{
  return UUID.uuidString.getter();
}

uint64_t sub_BF2C8()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_BF2D8()
{
  return UUID.init()();
}

uint64_t sub_BF2E8()
{
  return type metadata accessor for UUID();
}

uint64_t sub_BF2F8()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_BF308()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_BF318()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t sub_BF328()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t sub_BF338()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_BF348()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_BF358()
{
  return type metadata accessor for FindMyRelativeDateFormatStyle.DisplayStyle();
}

uint64_t sub_BF368()
{
  return AsyncButton.init(role:action:label:wantsDefaultProgressView:)();
}

uint64_t sub_BF378()
{
  return CancelButton.init(customAction:)();
}

uint64_t sub_BF388()
{
  return type metadata accessor for CancelButton();
}

uint64_t sub_BF398()
{
  return static GenericControl.Info.offerLocationMenu(compactTitleOnly:fromEmailDescription:forceInProgressState:forceDisabledState:action:)();
}

uint64_t sub_BF3A8()
{
  return GenericControl.Info.Label.init(title:symbol:forceStyleProminent:forceInProgressState:forceDisabledState:)();
}

uint64_t sub_BF3B8()
{
  return type metadata accessor for GenericControl.Info();
}

uint64_t sub_BF3C8()
{
  return GenericControl.init(info:matchingSizeOfInfos:)();
}

uint64_t sub_BF3D8()
{
  return type metadata accessor for GenericControl();
}

uint64_t sub_BF3E8()
{
  return static PlatterWithIcon.Icon.avatar(_:)();
}

uint64_t sub_BF3F8()
{
  return type metadata accessor for PlatterWithIcon.Icon();
}

uint64_t sub_BF408()
{
  return PlatterWithIcon.init(icon:style:)();
}

uint64_t sub_BF418()
{
  return static PlatterWithIcon.Style.listLeadingIcon()();
}

uint64_t sub_BF428()
{
  return type metadata accessor for PlatterWithIcon.Style();
}

uint64_t sub_BF438()
{
  return type metadata accessor for PlatterWithIcon();
}

uint64_t sub_BF448()
{
  return static BadgeOffsetStyle.topCircleBottomTrailing.getter();
}

uint64_t sub_BF458()
{
  return type metadata accessor for BadgeOffsetStyle();
}

uint64_t sub_BF468()
{
  return RelativeDateText.init(forcingPastDate:displayStyle:capitalizationContext:localizerContainer:)();
}

uint64_t sub_BF478()
{
  return type metadata accessor for RelativeDateText();
}

uint64_t sub_BF488()
{
  return DynamicControlsStack.init(controls:isSameWidthWhenHorizontal:isSameWidthWhenVertical:)();
}

uint64_t sub_BF498()
{
  return type metadata accessor for DynamicControlsStack();
}

uint64_t sub_BF4A8()
{
  return type metadata accessor for OfferLocationDuration();
}

uint64_t sub_BF4B8()
{
  return static AlertInfo.ActionInfo.okAction(withValue:)();
}

uint64_t sub_BF4C8()
{
  return AlertInfo.ActionInfo.Style.role.getter();
}

uint64_t sub_BF4D8()
{
  return AlertInfo.ActionInfo.style.getter();
}

uint64_t sub_BF4E8()
{
  return AlertInfo.ActionInfo.init(title:style:value:)();
}

uint64_t sub_BF4F8()
{
  return AlertInfo.ActionInfo.title.getter();
}

uint64_t sub_BF508()
{
  return AlertInfo.ActionInfo.value.getter();
}

uint64_t sub_BF518()
{
  return static AlertInfo.ActionInfo<>.cancelAction.getter();
}

uint64_t sub_BF528()
{
  return static AlertInfo.ActionInfo<>.continueAction.getter();
}

uint64_t sub_BF538()
{
  return static AlertInfo.ActionInfo<>.okAction.getter();
}

uint64_t sub_BF548()
{
  return AlertInfo.init(title:message:actions:)();
}

uint64_t sub_BF558()
{
  return AlertInfo.title.getter();
}

uint64_t sub_BF568()
{
  return AlertInfo.actions.getter();
}

uint64_t sub_BF578()
{
  return AlertInfo.message.getter();
}

uint64_t sub_BF588()
{
  return AlertInfo.resolved(with:)();
}

uint64_t sub_BF598()
{
  return type metadata accessor for AlertInfo();
}

uint64_t sub_BF5A8()
{
  return BadgeView.init(info:style:)();
}

uint64_t sub_BF5B8()
{
  return BadgeView.Style.init(badgeIconFont:supportsDynamicSize:border:)();
}

uint64_t sub_BF5C8()
{
  return static BadgeView.Style.Border.default.getter();
}

uint64_t sub_BF5D8()
{
  return type metadata accessor for BadgeView.Style.Border();
}

uint64_t sub_BF5E8()
{
  return type metadata accessor for BadgeView.Style();
}

uint64_t sub_BF5F8()
{
  return type metadata accessor for BadgeView();
}

uint64_t sub_BF608()
{
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_BF618()
{
  return type metadata accessor for ColorResource();
}

uint64_t sub_BF628()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_BF638()
{
  return Logger.logObject.getter();
}

uint64_t sub_BF648()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_BF658()
{
  return type metadata accessor for Logger();
}

uint64_t sub_BF668()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_BF678()
{
  return static ButtonRole.destructive.getter();
}

uint64_t sub_BF688()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_BF698()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_BF6A8()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t sub_BF6B8()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_BF6C8()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_BF6D8()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_BF6E8()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_BF6F8()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_BF708()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_BF718()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t sub_BF728()
{
  return ProgressView<>.init<>()();
}

uint64_t sub_BF738()
{
  return ScaledMetric.init(wrappedValue:relativeTo:)();
}

uint64_t sub_BF748()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t sub_BF758()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t sub_BF768()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t sub_BF778()
{
  return SharePreview<>.init<A>(_:image:)();
}

uint64_t sub_BF788()
{
  return static VerticalEdge.Set.all.getter();
}

uint64_t sub_BF798()
{
  return _CALayerView.init(type:onUpdate:)();
}

uint64_t sub_BF7A8()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_BF7B8()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t sub_BF7C8()
{
  return AnyTransition.init<A>(_:)();
}

void sub_BF7D8()
{
}

uint64_t sub_BF7E8()
{
  return type metadata accessor for DismissAction();
}

uint64_t sub_BF7F8()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_BF808()
{
  return LinkShapeStyle.init()();
}

uint64_t sub_BF818()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_BF828()
{
  return PlainListStyle.init()();
}

uint64_t sub_BF838()
{
  return type metadata accessor for PlainListStyle();
}

uint64_t sub_BF848()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t sub_BF858()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_BF868()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_BF878()
{
  return NavigationStack.init<>(root:)();
}

uint64_t sub_BF888()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t sub_BF898()
{
  return static SafeAreaRegions.container.getter();
}

uint64_t sub_BF8A8()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t sub_BF8B8()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t sub_BF8C8()
{
  return static KeyboardShortcut.defaultAction.getter();
}

uint64_t sub_BF8D8()
{
  return type metadata accessor for KeyboardShortcut();
}

uint64_t sub_BF8E8()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_BF8F8()
{
  return static ToolbarPlacement.navigationBar.getter();
}

uint64_t sub_BF908()
{
  return type metadata accessor for ToolbarPlacement();
}

uint64_t sub_BF918()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_BF928()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_BF938()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_BF948()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_BF958()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_BF968()
{
  return EnvironmentValues.controlSize.getter();
}

uint64_t sub_BF978()
{
  return EnvironmentValues.controlSize.setter();
}

uint64_t sub_BF988()
{
  return EnvironmentValues.externalIsLoading.getter();
}

uint64_t sub_BF998()
{
  return EnvironmentValues.externalIsLoading.setter();
}

uint64_t sub_BF9A8()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_BF9B8()
{
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t sub_BF9C8()
{
  return EnvironmentValues.listSectionSpacing.getter();
}

uint64_t sub_BF9D8()
{
  return EnvironmentValues.listSectionSpacing.setter();
}

uint64_t sub_BF9E8()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_BF9F8()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_BFA08()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_BFA18()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_BFA28()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t sub_BFA38()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_BFA48()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_BFA58()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_BFA68()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_BFA78()
{
  return EnvironmentValues.init()();
}

uint64_t sub_BFA88()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_BFA98()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t sub_BFAA8()
{
  return OpacityTransition.init()();
}

uint64_t sub_BFAB8()
{
  return type metadata accessor for OpacityTransition();
}

uint64_t sub_BFAC8()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_BFAD8()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_BFAE8()
{
  return static ListSectionSpacing.compact.getter();
}

uint64_t sub_BFAF8()
{
  return type metadata accessor for ListSectionSpacing();
}

uint64_t sub_BFB08()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_BFB18()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_BFB28()
{
  return BorderedButtonStyle.init()();
}

uint64_t sub_BFB38()
{
  return type metadata accessor for BorderedButtonStyle();
}

uint64_t sub_BFB48()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_BFB58()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_BFB68()
{
  return TitleOnlyLabelStyle.init()();
}

uint64_t sub_BFB78()
{
  return type metadata accessor for TitleOnlyLabelStyle();
}

uint64_t sub_BFB88()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t sub_BFB98()
{
  return dispatch thunk of UIHostingController.sizingOptions.setter();
}

uint64_t sub_BFBA8()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_BFBB8()
{
  return dispatch thunk of UIHostingController.rootView.setter();
}

uint64_t sub_BFBC8()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_BFBD8()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_BFBE8()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t sub_BFBF8()
{
  return static ToolbarItemPlacement.primaryAction.getter();
}

uint64_t sub_BFC08()
{
  return static ToolbarItemPlacement.cancellationAction.getter();
}

uint64_t sub_BFC18()
{
  return static ToolbarItemPlacement.confirmationAction.getter();
}

uint64_t sub_BFC28()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_BFC38()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t sub_BFC48()
{
  return static ToolbarContentBuilder.buildIf<A>(_:)();
}

uint64_t sub_BFC58()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t sub_BFC68()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t sub_BFC78()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_BFC88()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t sub_BFC98()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t sub_BFCA8()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t sub_BFCB8()
{
  return static AccessibilityChildBehavior.contain.getter();
}

uint64_t sub_BFCC8()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_BFCD8()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_BFCE8()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_BFCF8()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_BFD18()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_BFD28()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_BFD38()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_BFD58()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t sub_BFD68()
{
  return static UIHostingControllerSizingOptions.intrinsicContentSize.getter();
}

uint64_t sub_BFD78()
{
  return type metadata accessor for UIHostingControllerSizingOptions();
}

uint64_t sub_BFD88()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t sub_BFD98()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_BFDA8()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t sub_BFDB8()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_BFDC8()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_BFDD8()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_BFDE8()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_BFDF8()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_BFE08()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_BFE18()
{
  return static Font.subheadline.getter();
}

uint64_t sub_BFE28()
{
  return static Font.body.getter();
}

uint64_t sub_BFE38()
{
  return Font.bold()();
}

uint64_t sub_BFE48()
{
  return static Font.title.getter();
}

uint64_t sub_BFE58()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_BFE68()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_BFE78()
{
  return Font.weight(_:)();
}

uint64_t sub_BFE88()
{
  return static Font.headline.getter();
}

uint64_t sub_BFE98()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t sub_BFEA8()
{
  return Form.init(content:)();
}

uint64_t sub_BFEB8()
{
  return List<>.init(content:)();
}

uint64_t sub_BFEC8()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_BFED8()
{
  return Text.init(_:localizationTable:)();
}

uint64_t sub_BFEE8()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_BFEF8()
{
  return static Text.+ infix(_:_:)();
}

uint64_t sub_BFF08()
{
  return Text.font(_:)();
}

uint64_t sub_BFF18()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_BFF28()
{
  return Text.init<A>(_:)();
}

uint64_t sub_BFF38()
{
  return View.badge(_:offsetStyle:style:)();
}

uint64_t sub_BFF48()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_BFF58()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_BFF68()
{
  return View.labelStyle<A>(_:)();
}

uint64_t sub_BFF78()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_BFF88()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_BFF98()
{
  return View.listPadding(_:_:)();
}

uint64_t sub_BFFA8()
{
  return View.keyboardType(_:)();
}

uint64_t sub_BFFB8()
{
  return View.sharingPicker<A, B, C>(isPresented:item:subject:message:preview:)();
}

uint64_t sub_BFFC8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_BFFD8()
{
  return View.scrollDisabled(_:)();
}

uint64_t sub_BFFE8()
{
  return View.foregroundStyle<A>(_:)();
}

uint64_t sub_BFFF8()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t sub_C0008()
{
  return View.keyboardShortcut(_:)();
}

uint64_t sub_C0018()
{
  return View.listRowSeparator(_:edges:)();
}

uint64_t sub_C0028()
{
  return View.toolbarVisibility(_:for:)();
}

uint64_t sub_C0038()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_C0048()
{
  return View.navigationDestination<A, B>(item:destination:)();
}

uint64_t sub_C0058()
{
  return View.containerRelativeFrame(_:alignment:)();
}

uint64_t sub_C0068()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_C0078()
{
  return View.scrollContentBackground(_:)();
}

uint64_t sub_C0088()
{
  return View.scrollContentBackground<A>(_:)();
}

uint64_t sub_C0098()
{
  return View.listHasLazyStackBehavior()();
}

uint64_t sub_C00A8()
{
  return View.interactiveDismissDisabled(_:)();
}

uint64_t sub_C00B8()
{
  return View.navigationBarBackButtonHidden(_:)();
}

uint64_t sub_C00C8()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t sub_C00D8()
{
  return View.bold(_:)();
}

uint64_t sub_C00E8()
{
  return View.font(_:)();
}

uint64_t sub_C00F8()
{
  return View.alert<A, B, C>(_:isPresented:presenting:actions:message:)();
}

uint64_t sub_C0108()
{
  return View.alert<A, B>(_:isPresented:actions:message:)();
}

uint64_t sub_C0118()
{
  return View.frame(width:height:alignment:)();
}

uint64_t sub_C0128()
{
  return View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_C0138()
{
  return View.sheet<A, B>(item:onDismiss:content:)();
}

uint64_t sub_C0148()
{
  return View.padding(_:_:)();
}

uint64_t sub_C0158()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_C0168()
{
  return View.editMenu<A>(menu:)();
}

uint64_t sub_C0178()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_C0188()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_C0198()
{
  return View.listStyle<A>(_:)();
}

uint64_t sub_C01A8()
{
  return Color.init(uiColor:)();
}

uint64_t sub_C01B8()
{
  return static Color.accentColor.getter();
}

uint64_t sub_C01C8()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_C01D8()
{
  return static Color.gray.getter();
}

uint64_t sub_C01E8()
{
  return static Color.black.getter();
}

uint64_t sub_C01F8()
{
  return static Color.clear.getter();
}

uint64_t sub_C0208()
{
  return static Color.orange.getter();
}

uint64_t sub_C0218()
{
  return Color.opacity(_:)();
}

uint64_t sub_C0228()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_C0238()
{
  return Image.init(systemName:)();
}

uint64_t sub_C0248()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_C0258()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_C0268()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_C0278()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_C0288()
{
  return Image.init(_:bundle:)();
}

uint64_t sub_C0298()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_C02A8()
{
  return State.wrappedValue.getter();
}

uint64_t sub_C02B8()
{
  return State.wrappedValue.setter();
}

uint64_t sub_C02C8()
{
  return State.projectedValue.getter();
}

uint64_t sub_C02D8()
{
  return Button.init(role:action:label:)();
}

uint64_t sub_C02E8()
{
  return Button.init(action:label:)();
}

uint64_t sub_C02F8()
{
  return Button<>.init<A>(_:role:action:)();
}

uint64_t sub_C0308()
{
  return Button<>.init<A>(_:action:)();
}

uint64_t sub_C0318()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t sub_C0328()
{
  return type metadata accessor for HStack();
}

uint64_t sub_C0338()
{
  return Toggle<>.init<A>(_:isOn:)();
}

uint64_t sub_C0348()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t sub_C0358()
{
  return type metadata accessor for VStack();
}

uint64_t sub_C0368()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_C0378()
{
  return Binding.subscript.getter();
}

uint64_t sub_C0388()
{
  return Binding.projectedValue.getter();
}

uint64_t sub_C0398()
{
  return Binding.init(get:set:)();
}

uint64_t sub_C03A8()
{
  return Divider.init()();
}

uint64_t sub_C03B8()
{
  return type metadata accessor for Divider();
}

uint64_t sub_C03C8()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_C03D8()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_C03E8()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_C03F8()
{
  return Section<>.init(content:)();
}

uint64_t sub_C0408()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_C0418()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_C0428()
{
  return static Alignment.center.getter();
}

uint64_t sub_C0438()
{
  return static Animation.default.getter();
}

uint64_t sub_C0448()
{
  return ShareLink.init<A>(item:subject:message:preview:label:)();
}

uint64_t sub_C0458()
{
  return TextField<>.init(_:text:onEditingChanged:onCommit:)();
}

uint64_t sub_C0468()
{
  return type metadata accessor for TupleView();
}

uint64_t sub_C0478()
{
  return TupleView.init(_:)();
}

uint64_t sub_C0488()
{
  return static UnitPoint.leading.getter();
}

uint64_t sub_C0498()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_C04A8()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_C04B8()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_C04C8()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_C04D8()
{
  return static DispatchTime.now()();
}

uint64_t sub_C04E8()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_C04F8()
{
  return + infix(_:_:)();
}

NSDictionary sub_C0508()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_C0518()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_C0528()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_C0548()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_C0558()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_C0568()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_C0578()
{
  return String.fmLocalized(replacements:table:)();
}

NSString sub_C0588()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_C0598()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_C05A8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_C05B8()
{
  return String.init(format:arguments:)();
}

uint64_t sub_C05C8()
{
  return String.init(format:_:)();
}

uint64_t sub_C05D8()
{
  return String.init<A>(describing:)();
}

uint64_t sub_C05E8()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_C05F8()
{
  return String.hash(into:)();
}

uint64_t sub_C0608()
{
  return String.count.getter();
}

uint64_t sub_C0618()
{
  return String.index(_:offsetBy:limitedBy:)();
}

Swift::Int sub_C0628()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_C0648()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_C0658()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_C0668()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_C0678()
{
  return specialized Array._endMutation()();
}

uint64_t sub_C0688()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_C0698()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_C06A8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_C06B8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_C06D8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_C06E8()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_C06F8()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_C0708()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_C0718()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t sub_C0738()
{
  return type metadata accessor for AsyncStream();
}

uint64_t sub_C0748()
{
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

void sub_C0758()
{
}

uint64_t sub_C0768()
{
  return static Task<>.isCancelled.getter();
}

uint64_t sub_C0778()
{
  return ThrowingTaskGroup.makeAsyncIterator()();
}

uint64_t sub_C0788()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_C0798()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_C07A8()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_C07B8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_C07C8()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_C07D8()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_C07E8()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_C07F8()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_C0808()
{
  return UIColor.init(resource:)();
}

Swift::Int sub_C0818(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_C0828()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_C0838()
{
  return NSObject.hash(into:)();
}

uint64_t sub_C0848()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_C0858()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_C0868()
{
  return type metadata accessor for Optional();
}

uint64_t sub_C0878()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_C0888()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_C0898()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_C08B8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_C08C8()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_C08D8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_C08E8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_C08F8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_C0908()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_C0918()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_C0928()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_C0938()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_C0948()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_C0958()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_C0968()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_C0978()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_C0988()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t sub_C0998()
{
  return ContinuousClock.init()();
}

uint64_t sub_C09A8()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t sub_C09B8()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t sub_C09C8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_C09D8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_C09E8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_C09F8()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_C0A08()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_C0A18()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_C0A28()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_C0A38(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

Swift::Int sub_C0A58(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_C0A68()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_C0A88()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_C0A98()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_C0AA8()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_C0AB8()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_C0AC8()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t sub_C0B08()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_C0B18()
{
  return Error._code.getter();
}

uint64_t sub_C0B28()
{
  return Error._domain.getter();
}

uint64_t sub_C0B38()
{
  return Error._userInfo.getter();
}

uint64_t sub_C0B48()
{
  return Hasher.init(_seed:)();
}

void sub_C0B58(Swift::UInt a1)
{
}

void sub_C0B68(Swift::UInt8 a1)
{
}

Swift::Int sub_C0B78()
{
  return Hasher._finalize()();
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return _CATransform3DMakeAffineTransform(retstr, m);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
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

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return _swift_task_reportUnexpectedExecutor();
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

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
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