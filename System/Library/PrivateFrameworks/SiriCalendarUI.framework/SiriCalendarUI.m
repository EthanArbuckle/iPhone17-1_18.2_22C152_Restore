uint64_t sub_25C628968@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, void, uint64_t);
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a2;
  v3 = sub_25C662B40();
  OUTLINED_FUNCTION_0();
  v5 = v4;
  v7 = MEMORY[0x270FA5388](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v11 = (char *)&v26 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC350);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC358);
  OUTLINED_FUNCTION_0();
  v27 = v17;
  v28 = v16;
  MEMORY[0x270FA5388](v16);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)v15 = sub_25C6630A0();
  *((void *)v15 + 1) = 0x4020000000000000;
  v15[16] = 0;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC360);
  sub_25C628C10(a1, (uint64_t)&v15[*(int *)(v20 + 44)]);
  v21 = sub_25C6298EC(&qword_26A5BC368, &qword_26A5BC350);
  sub_25C663290();
  sub_25C62978C((uint64_t)v15, &qword_26A5BC350);
  v22 = *(void (**)(char *, void, uint64_t))(v5 + 104);
  v22(v11, *MEMORY[0x263F76968], v3);
  v22(v9, *MEMORY[0x263F76980], v3);
  v30 = v12;
  v31 = v21;
  swift_getOpaqueTypeConformance2();
  v23 = v28;
  sub_25C663260();
  v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  v24(v9, v3);
  v24(v11, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v19, v23);
}

uint64_t sub_25C628C10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v19[0] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC370);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)v19 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC378);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v14 = (char *)v19 - v13;
  *(void *)v14 = sub_25C663000();
  *((void *)v14 + 1) = 0;
  v14[16] = 1;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC380);
  sub_25C628EEC(a1, &v14[*(int *)(v15 + 44)]);
  *(void *)v8 = sub_25C6630A0();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC388);
  v19[1] = a1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC390);
  sub_25C662A20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC398);
  sub_25C6298EC(&qword_26A5BC3A0, &qword_26A5BC390);
  sub_25C629624();
  sub_25C6296F4(&qword_26A5BC3C8, MEMORY[0x263F6CD50]);
  sub_25C663460();
  sub_25C62973C((uint64_t)v14, (uint64_t)v12, &qword_26A5BC378);
  sub_25C62973C((uint64_t)v8, (uint64_t)v6, &qword_26A5BC370);
  uint64_t v16 = v19[0];
  sub_25C62973C((uint64_t)v12, v19[0], &qword_26A5BC378);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC3D0);
  sub_25C62973C((uint64_t)v6, v16 + *(int *)(v17 + 48), &qword_26A5BC370);
  sub_25C62978C((uint64_t)v8, &qword_26A5BC370);
  sub_25C62978C((uint64_t)v14, &qword_26A5BC378);
  sub_25C62978C((uint64_t)v6, &qword_26A5BC370);
  return sub_25C62978C((uint64_t)v12, &qword_26A5BC378);
}

uint64_t sub_25C628EEC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v44 = a2;
  sub_25C662AC0();
  ((void (*)(void))MEMORY[0x270FA5388])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC3D8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC3E0);
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v43 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v39 - v6;
  sub_25C663060();
  if (qword_26A5BC340 != -1) {
    swift_once();
  }
  id v8 = (id)qword_26A5BE0E0;
  uint64_t v9 = sub_25C663220();
  uint64_t v11 = v10;
  uint64_t v45 = v9;
  uint64_t v46 = v10;
  char v13 = v12 & 1;
  char v47 = v12 & 1;
  uint64_t v48 = v14;
  sub_25C663340();
  sub_25C629890(v9, v11, v13);
  swift_bridgeObjectRelease();
  uint64_t v45 = *(void *)(a1 + 16);
  sub_25C662A40();
  sub_25C6298A0();
  sub_25C6628B0();
  sub_25C6298EC(&qword_26A5BC3F0, &qword_26A5BC3D8);
  uint64_t v15 = sub_25C663210();
  uint64_t v17 = v16;
  v18 = v7;
  v40 = v7;
  char v20 = v19 & 1;
  LODWORD(v45) = sub_25C663110();
  uint64_t v21 = sub_25C6631D0();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  sub_25C629890(v15, v17, v20);
  swift_bridgeObjectRelease();
  uint64_t v28 = v41;
  v29 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
  v30 = v43;
  v31 = v18;
  uint64_t v32 = v42;
  v29(v43, v31, v42);
  v33 = v44;
  v29(v44, v30, v32);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC3F8);
  v35 = &v33[*(int *)(v34 + 48)];
  *(void *)v35 = 0;
  v35[8] = 1;
  v36 = &v33[*(int *)(v34 + 64)];
  *(void *)v36 = v21;
  *((void *)v36 + 1) = v23;
  v36[16] = v27;
  *((void *)v36 + 3) = v25;
  sub_25C629930(v21, v23, v27);
  v37 = *(void (**)(char *, uint64_t))(v28 + 8);
  swift_bridgeObjectRetain();
  v37(v40, v32);
  sub_25C629890(v21, v23, v27);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v37)(v30, v32);
}

uint64_t sub_25C629310@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ParticipantLabelView();
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C6297E0(a1, (uint64_t)v7, MEMORY[0x263F6CD50]);
  v7[*(int *)(v5 + 28)] = 0;
  v7[*(int *)(v5 + 32)] = 0;
  uint64_t v8 = sub_25C6631B0();
  uint64_t KeyPath = swift_getKeyPath();
  sub_25C6297E0((uint64_t)v7, a2, (void (*)(void))type metadata accessor for ParticipantLabelView);
  uint64_t v10 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC398) + 36));
  *uint64_t v10 = KeyPath;
  v10[1] = v8;
  return sub_25C629834((uint64_t)v7);
}

uint64_t sub_25C629418()
{
  return sub_25C663320();
}

uint64_t sub_25C629434()
{
  return sub_25C628964(*v0);
}

uint64_t variable initialization expression of CalendarSnippetProvider.$__lazy_storage_$_eventStore()
{
  return 0;
}

void type metadata accessor for VRXIdiom()
{
  if (!qword_26A5BC348)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A5BC348);
    }
  }
}

BOOL sub_25C629490(uint64_t *a1, uint64_t *a2)
{
  return sub_25C629560(*a1, *a2);
}

void sub_25C62949C(uint64_t a1@<X8>)
{
  sub_25C6294D0();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_25C6294D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_25C629508@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C662F40();
  *a1 = result;
  return result;
}

uint64_t sub_25C629534()
{
  return sub_25C662F50();
}

BOOL sub_25C629560(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

ValueMetadata *type metadata accessor for ParticipantListView()
{
  return &type metadata for ParticipantListView;
}

uint64_t sub_25C62957C()
{
  return swift_getOpaqueTypeConformance2();
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

unint64_t sub_25C629624()
{
  unint64_t result = qword_26A5BC3A8;
  if (!qword_26A5BC3A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC398);
    sub_25C6296F4(&qword_26A5BC3B0, (void (*)(uint64_t))type metadata accessor for ParticipantLabelView);
    sub_25C6298EC(&qword_26A5BC3B8, &qword_26A5BC3C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC3A8);
  }
  return result;
}

uint64_t sub_25C6296F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C62973C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = OUTLINED_FUNCTION_2();
  v5(v4);
  return a2;
}

uint64_t sub_25C62978C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25C6297E0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = OUTLINED_FUNCTION_2();
  v5(v4);
  return a2;
}

uint64_t sub_25C629834(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ParticipantLabelView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C629890(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_25C6298A0()
{
  unint64_t result = qword_26A5BC3E8;
  if (!qword_26A5BC3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC3E8);
  }
  return result;
}

uint64_t sub_25C6298EC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25C629930(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_25C629940()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

void *sub_25C629A3C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    long long v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    uint64_t v11 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v11;
    uint64_t v12 = (int *)sub_25C662CE0();
    uint64_t v13 = v12[8];
    uint64_t v49 = (uint64_t)a2 + v13;
    v50 = (char *)v4 + v13;
    uint64_t v14 = sub_25C6628A0();
    uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v48(v50, v49, v14);
    *((unsigned char *)v4 + v12[9]) = *((unsigned char *)a2 + v12[9]);
    uint64_t v15 = v12[10];
    uint64_t v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = v12[11];
    char v20 = (void *)((char *)v4 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *char v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = v12[12];
    uint64_t v24 = (char *)v4 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = sub_25C662CD0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
      memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      *uint64_t v24 = *v25;
      *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
      uint64_t v29 = *(int *)(v26 + 28);
      v30 = &v24[v29];
      v31 = &v25[v29];
      uint64_t v32 = sub_25C662CC0();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        uint64_t v33 = sub_25C6629F0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v33 - 8) + 16))(v30, v31, v33);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
    }
    *(void *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    uint64_t v34 = v12[14];
    v35 = (char *)v4 + v34;
    v36 = (char *)a2 + v34;
    uint64_t v37 = sub_25C662B70();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
      memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
    }
    uint64_t v39 = *(int *)(a3 + 20);
    v40 = (char *)v4 + v39;
    uint64_t v41 = (uint64_t)a2 + v39;
    uint64_t v42 = sub_25C662C10();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
    uint64_t v43 = *(int *)(a3 + 24);
    v44 = (void *)((char *)v4 + v43);
    uint64_t v45 = (uint64_t *)((char *)a2 + v43);
    uint64_t v46 = v45[1];
    void *v44 = *v45;
    v44[1] = v46;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25C629E68(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)sub_25C662CE0();
  uint64_t v5 = a1 + v4[8];
  uint64_t v6 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + v4[12];
  uint64_t v8 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    uint64_t v9 = v7 + *(int *)(v8 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      uint64_t v10 = sub_25C6629F0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = a1 + v4[14];
  uint64_t v12 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  uint64_t v13 = a1 + *(int *)(a2 + 20);
  uint64_t v14 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C62A070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  long long v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v47 = a2 + v12;
  uint64_t v48 = a1 + v12;
  uint64_t v13 = sub_25C6628A0();
  uint64_t v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v46(v48, v47, v13);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v14 = v11[10];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v11[11];
  uint64_t v19 = (void *)(a1 + v18);
  char v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = v11[12];
  uint64_t v23 = (unsigned char *)(a1 + v22);
  uint64_t v24 = (unsigned char *)(a2 + v22);
  uint64_t v25 = sub_25C662CD0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    *uint64_t v23 = *v24;
    *(_OWORD *)(v23 + 8) = *(_OWORD *)(v24 + 8);
    uint64_t v27 = *(int *)(v25 + 28);
    uint64_t v28 = &v23[v27];
    uint64_t v29 = &v24[v27];
    uint64_t v30 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      uint64_t v31 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v31 - 8) + 16))(v28, v29, v31);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  }
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  uint64_t v32 = v11[14];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  uint64_t v35 = sub_25C662B70();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
  }
  uint64_t v37 = *(int *)(a3 + 20);
  uint64_t v38 = a1 + v37;
  uint64_t v39 = a2 + v37;
  uint64_t v40 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
  uint64_t v41 = *(int *)(a3 + 24);
  uint64_t v42 = (void *)(a1 + v41);
  uint64_t v43 = (void *)(a2 + v41);
  uint64_t v44 = v43[1];
  *uint64_t v42 = *v43;
  v42[1] = v44;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25C62A3FC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)sub_25C662CE0();
  uint64_t v7 = v6[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(unsigned char *)(a1 + v6[9]) = *(unsigned char *)(a2 + v6[9]);
  uint64_t v11 = v6[10];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  void *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = v6[11];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = v6[12];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  int v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
      *(void *)(v18 + 8) = *(void *)(v19 + 8);
      *(void *)(v18 + 16) = *(void *)(v19 + 16);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v30 = *(int *)(v20 + 28);
      uint64_t v31 = v18 + v30;
      uint64_t v32 = (const void *)(v19 + v30);
      sub_25C62BCF8(v31, MEMORY[0x263F6CD68]);
      uint64_t v33 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v51 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v51 - 8) + 16))(v31, v32, v51);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v27 = *(void *)(*(void *)(v33 - 8) + 64);
      uint64_t v28 = (void *)v31;
      uint64_t v29 = v32;
LABEL_8:
      memcpy(v28, v29, v27);
      goto LABEL_14;
    }
    sub_25C62BCF8(v18, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v27 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v28 = (void *)v18;
    uint64_t v29 = (const void *)v19;
    goto LABEL_8;
  }
  if (v22) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  *(void *)(v18 + 16) = *(void *)(v19 + 16);
  uint64_t v23 = *(int *)(v20 + 28);
  uint64_t v24 = (void *)(v18 + v23);
  uint64_t v25 = (const void *)(v19 + v23);
  uint64_t v26 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v34 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(void *)(a1 + v6[13]) = *(void *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = v6[14];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (const void *)(a2 + v35);
  uint64_t v38 = sub_25C662B70();
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
  int v40 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
  if (!v39)
  {
    uint64_t v41 = *(void *)(v38 - 8);
    if (!v40)
    {
      (*(void (**)(void *, const void *, uint64_t))(v41 + 24))(v36, v37, v38);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v41 + 8))(v36, v38);
    goto LABEL_19;
  }
  if (v40)
  {
LABEL_19:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v36, v37, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
LABEL_20:
  uint64_t v43 = *(int *)(a3 + 20);
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  uint64_t v46 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 24))(v44, v45, v46);
  uint64_t v47 = *(int *)(a3 + 24);
  uint64_t v48 = (void *)(a1 + v47);
  uint64_t v49 = (void *)(a2 + v47);
  *uint64_t v48 = *v49;
  v48[1] = v49[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_25C62A9A0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  uint64_t v8 = (int *)sub_25C662CE0();
  uint64_t v9 = v8[8];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25C6628A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *((unsigned char *)a1 + v8[9]) = *((unsigned char *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  uint64_t v13 = v8[12];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_25C662CD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    unsigned char *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    uint64_t v18 = *(int *)(v16 + 28);
    uint64_t v19 = &v14[v18];
    uint64_t v20 = &v15[v18];
    uint64_t v21 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(void *)((char *)a1 + v8[13]) = *(void *)((char *)a2 + v8[13]);
  uint64_t v23 = v8[14];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_25C662B70();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  uint64_t v28 = *(int *)(a3 + 20);
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = sub_25C662C10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32))(v29, v30, v31);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_25C62ACA8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v16 = v11[10];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v11[11];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = v11[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  int v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v39 = *(int *)(v29 + 28);
      uint64_t v40 = v27 + v39;
      uint64_t v41 = (const void *)(v28 + v39);
      sub_25C62BCF8(v40, MEMORY[0x263F6CD68]);
      uint64_t v42 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v62 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v62 - 8) + 32))(v40, v41, v62);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v36 = *(void *)(*(void *)(v42 - 8) + 64);
      uint64_t v37 = (void *)v40;
      uint64_t v38 = v41;
LABEL_8:
      memcpy(v37, v38, v36);
      goto LABEL_14;
    }
    sub_25C62BCF8(v27, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v36 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v37 = (void *)v27;
    uint64_t v38 = (const void *)v28;
    goto LABEL_8;
  }
  if (v31) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  uint64_t v32 = *(int *)(v29 + 28);
  uint64_t v33 = (void *)(v27 + v32);
  uint64_t v34 = (const void *)(v28 + v32);
  uint64_t v35 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    uint64_t v43 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  uint64_t v44 = v11[14];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (const void *)(a2 + v44);
  uint64_t v47 = sub_25C662B70();
  int v48 = __swift_getEnumTagSinglePayload((uint64_t)v45, 1, v47);
  int v49 = __swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47);
  if (!v48)
  {
    uint64_t v50 = *(void *)(v47 - 8);
    if (!v49)
    {
      (*(void (**)(void *, const void *, uint64_t))(v50 + 40))(v45, v46, v47);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v50 + 8))(v45, v47);
    goto LABEL_19;
  }
  if (v49)
  {
LABEL_19:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v45, v46, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
  __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
LABEL_20:
  uint64_t v52 = *(int *)(a3 + 20);
  uint64_t v53 = a1 + v52;
  uint64_t v54 = a2 + v52;
  uint64_t v55 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 40))(v53, v54, v55);
  uint64_t v56 = *(int *)(a3 + 24);
  v57 = (void *)(a1 + v56);
  v58 = (uint64_t *)(a2 + v56);
  uint64_t v60 = *v58;
  uint64_t v59 = v58[1];
  void *v57 = v60;
  v57[1] = v59;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C62B1AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C62B1C0);
}

uint64_t sub_25C62B1C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C662CE0();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  sub_25C662C10();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_25C62B278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C62B28C);
}

void sub_25C62B28C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25C662CE0();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_25C662C10();
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for RenderableEvent()
{
  uint64_t result = qword_26A5BC410;
  if (!qword_26A5BC410) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C62B388()
{
  uint64_t result = sub_25C662CE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C662C10();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C62B458()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_25C62B464()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = *v0;
  uint64_t v8 = *(void *)(v1 + 8);
  sub_25C62BA60(v1, v5 - v4, (void (*)(void))type metadata accessor for RenderableEvent);
  if (!v8)
  {
    uint64_t v7 = *(void *)(v6 + *(int *)(v2 + 24));
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_25C62BCF8(v6, (void (*)(void))type metadata accessor for RenderableEvent);
  return v7;
}

uint64_t sub_25C62B548@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C62B464();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C62B570@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v61 = a1;
  v67 = a2;
  uint64_t v66 = sub_25C662D20();
  OUTLINED_FUNCTION_0();
  uint64_t v64 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5();
  uint64_t v65 = v6;
  MEMORY[0x270FA5388](v7);
  v58 = (char *)&v57 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC420);
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_25C662C10();
  OUTLINED_FUNCTION_0();
  uint64_t v68 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_5();
  uint64_t v59 = v16;
  MEMORY[0x270FA5388](v17);
  v63 = (char *)&v57 - v18;
  uint64_t v19 = sub_25C662A20();
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_3();
  uint64_t v25 = v24 - v23;
  uint64_t v60 = type metadata accessor for RenderableEvent();
  uint64_t v26 = (uint64_t *)(a3 + *(int *)(v60 + 24));
  sub_25C662A10();
  uint64_t v27 = sub_25C662A00();
  uint64_t v29 = v28;
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v25, v19);
  uint64_t v30 = v13;
  *uint64_t v26 = v27;
  v26[1] = v29;
  v57 = v26;
  uint64_t v31 = a3;
  uint64_t v32 = v61;
  sub_25C62BA60(v61, v31, MEMORY[0x263F6CD78]);
  uint64_t v33 = sub_25C662CE0();
  uint64_t v34 = v62;
  sub_25C62BAC0(v32 + *(int *)(v33 + 56), v12);
  if (__swift_getEnumTagSinglePayload(v12, 1, v13) == 1)
  {
    uint64_t v62 = v13;
    sub_25C62BC98(v12);
    sub_25C662D00();
    uint64_t v35 = v64;
    size_t v36 = v58;
    OUTLINED_FUNCTION_4();
    v37();
    uint64_t v38 = sub_25C662D10();
    os_log_type_t v39 = sub_25C6637C0();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = v35;
      uint64_t v41 = v12;
      uint64_t v42 = v31;
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_25C626000, v38, v39, "[RenderableEvent] Using event store to make event cell model", v43, 2u);
      uint64_t v44 = v43;
      uint64_t v31 = v42;
      uint64_t v12 = v41;
      uint64_t v35 = v40;
      MEMORY[0x26118DF90](v44, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v12);
    uint64_t v45 = v59;
    uint64_t v46 = v67;
    sub_25C659D94(v67, v59);

    sub_25C62BCF8(v32, MEMORY[0x263F6CD78]);
    if (v34)
    {
      sub_25C62BCF8(v31, MEMORY[0x263F6CD78]);
      return swift_bridgeObjectRelease();
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v68 + 32))(v31 + *(int *)(v60 + 20), v45, v62);
    }
  }
  else
  {
    int v48 = *(void (**)(char *, uint64_t, uint64_t))(v68 + 32);
    v68 += 32;
    v48(v63, v12, v13);
    sub_25C662D00();
    uint64_t v49 = v64;
    OUTLINED_FUNCTION_4();
    v50();
    uint64_t v51 = sub_25C662D10();
    os_log_type_t v52 = sub_25C6637C0();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v62 = v30;
      uint64_t v54 = v31;
      uint64_t v55 = v53;
      *(_WORD *)uint64_t v53 = 0;
      _os_log_impl(&dword_25C626000, v51, v52, "[RenderableEvent] Using event cell model to render event", v53, 2u);
      uint64_t v56 = v55;
      uint64_t v31 = v54;
      uint64_t v30 = v62;
      MEMORY[0x26118DF90](v56, -1, -1);
    }

    sub_25C62BCF8(v32, MEMORY[0x263F6CD78]);
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v65, v12);
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v48)(v31 + *(int *)(v60 + 20), v63, v30);
  }
}

uint64_t sub_25C62BA60(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C62BAC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25C662B70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = &v14[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25C62BD50(a1, (uint64_t)v10);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v4) == 1)
  {
    uint64_t v11 = sub_25C662C10();
    return __swift_storeEnumTagSinglePayload(a2, 1, 1, v11);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v7, v10, v4);
    v15[3] = v4;
    v15[4] = sub_25C62BDB8();
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
    (*(void (**)(uint64_t *, unsigned char *, uint64_t))(v5 + 16))(boxed_opaque_existential_1, v7, v4);
    sub_25C62BE6C((uint64_t)v15, (uint64_t)v14);
    sub_25C662BE0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_25C62BC98(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC420);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C62BCF8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25C62BD50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25C62BDB8()
{
  unint64_t result = qword_26A5BC428;
  if (!qword_26A5BC428)
  {
    sub_25C662B70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC428);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_25C62BE6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

void *sub_25C62BF70(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    long long v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    uint64_t v11 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v11;
    uint64_t v12 = (int *)sub_25C662CE0();
    uint64_t v13 = v12[8];
    uint64_t v62 = (uint64_t)a2 + v13;
    v63 = (char *)v4 + v13;
    uint64_t v14 = sub_25C6628A0();
    uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v61(v63, v62, v14);
    *((unsigned char *)v4 + v12[9]) = *((unsigned char *)a2 + v12[9]);
    uint64_t v15 = v12[10];
    uint64_t v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = v12[11];
    uint64_t v20 = (void *)((char *)v4 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = v12[12];
    uint64_t v24 = (char *)v4 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = sub_25C662CD0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
      memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      *uint64_t v24 = *v25;
      *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
      uint64_t v29 = *(int *)(v26 + 28);
      uint64_t v30 = &v24[v29];
      uint64_t v31 = &v25[v29];
      uint64_t v32 = sub_25C662CC0();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        uint64_t v33 = sub_25C6629F0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v33 - 8) + 16))(v30, v31, v33);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
    }
    *(void *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    uint64_t v34 = v12[14];
    uint64_t v35 = (char *)v4 + v34;
    size_t v36 = (char *)a2 + v34;
    uint64_t v37 = sub_25C662B70();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
      memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
    }
    uint64_t v39 = type metadata accessor for RenderableEvent();
    uint64_t v40 = *(int *)(v39 + 20);
    uint64_t v41 = (char *)v4 + v40;
    uint64_t v42 = (uint64_t)a2 + v40;
    uint64_t v43 = sub_25C662C10();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
    uint64_t v44 = *(int *)(v39 + 24);
    uint64_t v45 = (void *)((char *)v4 + v44);
    uint64_t v46 = (uint64_t *)((char *)a2 + v44);
    uint64_t v47 = v46[1];
    *uint64_t v45 = *v46;
    v45[1] = v47;
    uint64_t v48 = a3[5];
    uint64_t v49 = (char *)v4 + v48;
    uint64_t v50 = (char *)a2 + v48;
    uint64_t v51 = sub_25C6629F0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v50, 1, v51))
    {
      uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
      memcpy(v49, v50, *(void *)(*(void *)(v52 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
      __swift_storeEnumTagSinglePayload((uint64_t)v49, 0, 1, v51);
    }
    uint64_t v53 = a3[7];
    *((unsigned char *)v4 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    uint64_t v54 = (char *)v4 + v53;
    uint64_t v55 = (uint64_t)a2 + v53;
    uint64_t v56 = *(uint64_t *)((char *)a2 + v53);
    char v57 = *(unsigned char *)(v55 + 8);
    sub_25C62C450(v56, v57);
    *(void *)uint64_t v54 = v56;
    v54[8] = v57;
    *((_OWORD *)v54 + 1) = *(_OWORD *)(v55 + 16);
    v54[32] = *(unsigned char *)(v55 + 32);
    uint64_t v58 = *(void *)(v55 + 48);
    uint64_t v59 = *(void *)(v55 + 56);
    *((void *)v54 + 5) = *(void *)(v55 + 40);
    *((void *)v54 + 6) = v58;
    *((void *)v54 + 7) = v59;
  }
  swift_retain();
  return v4;
}

uint64_t sub_25C62C450(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_25C62C45C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)sub_25C662CE0();
  uint64_t v5 = a1 + v4[8];
  uint64_t v6 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + v4[12];
  uint64_t v8 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    uint64_t v9 = v7 + *(int *)(v8 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      uint64_t v10 = sub_25C6629F0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = a1 + v4[14];
  uint64_t v12 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  uint64_t v13 = a1 + *(int *)(type metadata accessor for RenderableEvent() + 20);
  uint64_t v14 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  swift_bridgeObjectRelease();
  uint64_t v15 = a1 + *(int *)(a2 + 20);
  uint64_t v16 = sub_25C6629F0();
  if (!__swift_getEnumTagSinglePayload(v15, 1, v16)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  }
  sub_25C62C6E4(*(void *)(a1 + *(int *)(a2 + 28)), *(unsigned char *)(a1 + *(int *)(a2 + 28) + 8));
  return swift_release();
}

uint64_t sub_25C62C6E4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25C62C6F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  long long v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v60 = a2 + v12;
  uint64_t v61 = a1 + v12;
  uint64_t v13 = sub_25C6628A0();
  uint64_t v59 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v59(v61, v60, v13);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v14 = v11[10];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v11[11];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = v11[12];
  uint64_t v23 = (unsigned char *)(a1 + v22);
  uint64_t v24 = (unsigned char *)(a2 + v22);
  uint64_t v25 = sub_25C662CD0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    *uint64_t v23 = *v24;
    *(_OWORD *)(v23 + 8) = *(_OWORD *)(v24 + 8);
    uint64_t v27 = *(int *)(v25 + 28);
    uint64_t v28 = &v23[v27];
    uint64_t v29 = &v24[v27];
    uint64_t v30 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      uint64_t v31 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v31 - 8) + 16))(v28, v29, v31);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  }
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  uint64_t v32 = v11[14];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  uint64_t v35 = sub_25C662B70();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
  }
  uint64_t v37 = type metadata accessor for RenderableEvent();
  uint64_t v38 = *(int *)(v37 + 20);
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  uint64_t v41 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  uint64_t v42 = *(int *)(v37 + 24);
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (void *)(a2 + v42);
  uint64_t v45 = v44[1];
  void *v43 = *v44;
  v43[1] = v45;
  uint64_t v46 = a3[5];
  uint64_t v47 = (void *)(a1 + v46);
  uint64_t v48 = (const void *)(a2 + v46);
  uint64_t v49 = sub_25C6629F0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v48, 1, v49))
  {
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    memcpy(v47, v48, *(void *)(*(void *)(v50 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v49 - 8) + 16))(v47, v48, v49);
    __swift_storeEnumTagSinglePayload((uint64_t)v47, 0, 1, v49);
  }
  uint64_t v51 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v52 = a1 + v51;
  uint64_t v53 = a2 + v51;
  uint64_t v54 = *(void *)(a2 + v51);
  char v55 = *(unsigned char *)(v53 + 8);
  sub_25C62C450(v54, v55);
  *(void *)uint64_t v52 = v54;
  *(unsigned char *)(v52 + 8) = v55;
  *(_OWORD *)(v52 + 16) = *(_OWORD *)(v53 + 16);
  *(unsigned char *)(v52 + 32) = *(unsigned char *)(v53 + 32);
  uint64_t v56 = *(void *)(v53 + 48);
  uint64_t v57 = *(void *)(v53 + 56);
  *(void *)(v52 + 40) = *(void *)(v53 + 40);
  *(void *)(v52 + 48) = v56;
  *(void *)(v52 + 56) = v57;
  swift_retain();
  return a1;
}

uint64_t sub_25C62CB84(uint64_t a1, uint64_t a2, int *a3)
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
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)sub_25C662CE0();
  uint64_t v7 = v6[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(unsigned char *)(a1 + v6[9]) = *(unsigned char *)(a2 + v6[9]);
  uint64_t v11 = v6[10];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  void *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = v6[11];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = v6[12];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  int v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
      *(void *)(v18 + 8) = *(void *)(v19 + 8);
      *(void *)(v18 + 16) = *(void *)(v19 + 16);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v30 = *(int *)(v20 + 28);
      uint64_t v31 = v18 + v30;
      uint64_t v32 = (const void *)(v19 + v30);
      sub_25C62D2D0(v31, MEMORY[0x263F6CD68]);
      uint64_t v33 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v69 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v69 - 8) + 16))(v31, v32, v69);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v27 = *(void *)(*(void *)(v33 - 8) + 64);
      uint64_t v28 = (void *)v31;
      uint64_t v29 = v32;
LABEL_8:
      memcpy(v28, v29, v27);
      goto LABEL_14;
    }
    sub_25C62D2D0(v18, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v27 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v28 = (void *)v18;
    uint64_t v29 = (const void *)v19;
    goto LABEL_8;
  }
  if (v22) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  *(void *)(v18 + 16) = *(void *)(v19 + 16);
  uint64_t v23 = *(int *)(v20 + 28);
  uint64_t v24 = (void *)(v18 + v23);
  uint64_t v25 = (const void *)(v19 + v23);
  uint64_t v26 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v34 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(void *)(a1 + v6[13]) = *(void *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = v6[14];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (const void *)(a2 + v35);
  uint64_t v38 = sub_25C662B70();
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
  int v40 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
  if (v39)
  {
    if (!v40)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
      __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v41 = *(void *)(v38 - 8);
  if (v40)
  {
    (*(void (**)(void *, uint64_t))(v41 + 8))(v36, v38);
LABEL_19:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v36, v37, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(v41 + 24))(v36, v37, v38);
LABEL_20:
  uint64_t v43 = type metadata accessor for RenderableEvent();
  uint64_t v44 = *(int *)(v43 + 20);
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  uint64_t v47 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 24))(v45, v46, v47);
  uint64_t v48 = *(int *)(v43 + 24);
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (void *)(a2 + v48);
  *uint64_t v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v51 = a3[5];
  uint64_t v52 = (void *)(a1 + v51);
  uint64_t v53 = (const void *)(a2 + v51);
  uint64_t v54 = sub_25C6629F0();
  int v55 = __swift_getEnumTagSinglePayload((uint64_t)v52, 1, v54);
  int v56 = __swift_getEnumTagSinglePayload((uint64_t)v53, 1, v54);
  if (!v55)
  {
    uint64_t v57 = *(void *)(v54 - 8);
    if (!v56)
    {
      (*(void (**)(void *, const void *, uint64_t))(v57 + 24))(v52, v53, v54);
      goto LABEL_26;
    }
    (*(void (**)(void *, uint64_t))(v57 + 8))(v52, v54);
    goto LABEL_25;
  }
  if (v56)
  {
LABEL_25:
    uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    memcpy(v52, v53, *(void *)(*(void *)(v58 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v54 - 8) + 16))(v52, v53, v54);
  __swift_storeEnumTagSinglePayload((uint64_t)v52, 0, 1, v54);
LABEL_26:
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v59 = a3[7];
  uint64_t v60 = a1 + v59;
  uint64_t v61 = a2 + v59;
  uint64_t v62 = *(void *)(a2 + v59);
  char v63 = *(unsigned char *)(v61 + 8);
  sub_25C62C450(v62, v63);
  uint64_t v64 = *(void *)v60;
  char v65 = *(unsigned char *)(v60 + 8);
  *(void *)uint64_t v60 = v62;
  *(unsigned char *)(v60 + 8) = v63;
  sub_25C62C6E4(v64, v65);
  *(void *)(v60 + 16) = *(void *)(v61 + 16);
  uint64_t v66 = *(void *)(v61 + 24);
  *(unsigned char *)(v60 + 32) = *(unsigned char *)(v61 + 32);
  *(void *)(v60 + 24) = v66;
  *(void *)(v60 + 40) = *(void *)(v61 + 40);
  uint64_t v67 = *(void *)(v61 + 56);
  *(void *)(v60 + 48) = *(void *)(v61 + 48);
  *(void *)(v60 + 56) = v67;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25C62D2D0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

_OWORD *sub_25C62D328(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  uint64_t v8 = (int *)sub_25C662CE0();
  uint64_t v9 = v8[8];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25C6628A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *((unsigned char *)a1 + v8[9]) = *((unsigned char *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  uint64_t v13 = v8[12];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_25C662CD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    unsigned char *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    uint64_t v18 = *(int *)(v16 + 28);
    uint64_t v19 = &v14[v18];
    uint64_t v20 = &v15[v18];
    uint64_t v21 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(void *)((char *)a1 + v8[13]) = *(void *)((char *)a2 + v8[13]);
  uint64_t v23 = v8[14];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_25C662B70();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  uint64_t v28 = type metadata accessor for RenderableEvent();
  uint64_t v29 = *(int *)(v28 + 20);
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = sub_25C662C10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
  *(_OWORD *)((char *)a1 + *(int *)(v28 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v28 + 24));
  uint64_t v33 = a3[5];
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = sub_25C6629F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v35, 1, v36))
  {
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
    __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v36);
  }
  uint64_t v38 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  int v39 = (_OWORD *)((char *)a1 + v38);
  int v40 = (_OWORD *)((char *)a2 + v38);
  long long v41 = v40[1];
  *int v39 = *v40;
  v39[1] = v41;
  long long v42 = v40[3];
  v39[2] = v40[2];
  v39[3] = v42;
  return a1;
}

uint64_t sub_25C62D704(uint64_t a1, uint64_t a2, int *a3)
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
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v16 = v11[10];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v11[11];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = v11[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  int v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v39 = *(int *)(v29 + 28);
      uint64_t v40 = v27 + v39;
      long long v41 = (const void *)(v28 + v39);
      sub_25C62D2D0(v40, MEMORY[0x263F6CD68]);
      uint64_t v42 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v76 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v76 - 8) + 32))(v40, v41, v76);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v36 = *(void *)(*(void *)(v42 - 8) + 64);
      uint64_t v37 = (void *)v40;
      uint64_t v38 = v41;
LABEL_8:
      memcpy(v37, v38, v36);
      goto LABEL_14;
    }
    sub_25C62D2D0(v27, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v36 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v37 = (void *)v27;
    uint64_t v38 = (const void *)v28;
    goto LABEL_8;
  }
  if (v31) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  uint64_t v32 = *(int *)(v29 + 28);
  uint64_t v33 = (void *)(v27 + v32);
  uint64_t v34 = (const void *)(v28 + v32);
  uint64_t v35 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    uint64_t v43 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  uint64_t v44 = v11[14];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (const void *)(a2 + v44);
  uint64_t v47 = sub_25C662B70();
  int v48 = __swift_getEnumTagSinglePayload((uint64_t)v45, 1, v47);
  int v49 = __swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47);
  if (v48)
  {
    if (!v49)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
      __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v50 = *(void *)(v47 - 8);
  if (v49)
  {
    (*(void (**)(void *, uint64_t))(v50 + 8))(v45, v47);
LABEL_19:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v45, v46, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(v50 + 40))(v45, v46, v47);
LABEL_20:
  uint64_t v52 = type metadata accessor for RenderableEvent();
  uint64_t v53 = *(int *)(v52 + 20);
  uint64_t v54 = a1 + v53;
  uint64_t v55 = a2 + v53;
  uint64_t v56 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 40))(v54, v55, v56);
  uint64_t v57 = *(int *)(v52 + 24);
  uint64_t v58 = (void *)(a1 + v57);
  uint64_t v59 = (uint64_t *)(a2 + v57);
  uint64_t v61 = *v59;
  uint64_t v60 = v59[1];
  void *v58 = v61;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  uint64_t v62 = a3[5];
  char v63 = (void *)(a1 + v62);
  uint64_t v64 = (const void *)(a2 + v62);
  uint64_t v65 = sub_25C6629F0();
  int v66 = __swift_getEnumTagSinglePayload((uint64_t)v63, 1, v65);
  int v67 = __swift_getEnumTagSinglePayload((uint64_t)v64, 1, v65);
  if (!v66)
  {
    uint64_t v68 = *(void *)(v65 - 8);
    if (!v67)
    {
      (*(void (**)(void *, const void *, uint64_t))(v68 + 40))(v63, v64, v65);
      goto LABEL_26;
    }
    (*(void (**)(void *, uint64_t))(v68 + 8))(v63, v65);
    goto LABEL_25;
  }
  if (v67)
  {
LABEL_25:
    uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    memcpy(v63, v64, *(void *)(*(void *)(v69 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v65 - 8) + 32))(v63, v64, v65);
  __swift_storeEnumTagSinglePayload((uint64_t)v63, 0, 1, v65);
LABEL_26:
  uint64_t v70 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v71 = a1 + v70;
  uint64_t v72 = a2 + v70;
  LOBYTE(v70) = *(unsigned char *)(v72 + 8);
  uint64_t v73 = *(void *)v71;
  char v74 = *(unsigned char *)(v71 + 8);
  *(void *)uint64_t v71 = *(void *)v72;
  *(unsigned char *)(v71 + 8) = v70;
  sub_25C62C6E4(v73, v74);
  *(void *)(v71 + 16) = *(void *)(v72 + 16);
  *(void *)(v71 + 24) = *(void *)(v72 + 24);
  *(unsigned char *)(v71 + 32) = *(unsigned char *)(v72 + 32);
  *(void *)(v71 + 40) = *(void *)(v72 + 40);
  *(_OWORD *)(v71 + 48) = *(_OWORD *)(v72 + 48);
  swift_release();
  return a1;
}

uint64_t sub_25C62DD98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C62DDAC);
}

uint64_t sub_25C62DDAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 28) + 48);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_25C62DE68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C62DE7C);
}

void sub_25C62DE7C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28) + 48) = (a2 - 1);
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for EventCellView()
{
  uint64_t result = qword_26A5BC438;
  if (!qword_26A5BC438) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C62DF7C()
{
  type metadata accessor for RenderableEvent();
  if (v0 <= 0x3F)
  {
    sub_25C62E058();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25C62E058()
{
  if (!qword_26A5BC448)
  {
    sub_25C6629F0();
    unint64_t v0 = sub_25C663810();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A5BC448);
    }
  }
}

uint64_t sub_25C62E0B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C62E0CC()
{
  return sub_25C662B90();
}

uint64_t sub_25C62E198@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v5 = sub_25C6629F0();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = type metadata accessor for EventCellView();
  sub_25C62E768(v1 + *(int *)(v12 + 20), v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v5) == 1)
  {
    sub_25C62978C(v2, &qword_26A5BC430);
LABEL_6:
    *a1 = 0;
    uint64_t v15 = (unsigned int *)MEMORY[0x263F30560];
    goto LABEL_7;
  }
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v13(v11, v2, v5);
  sub_25C662CE0();
  if ((sub_25C662890() & 1) == 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
    goto LABEL_6;
  }
  uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC478) + 48);
  v13((uint64_t)a1, v11, v5);
  a1[v14] = 0;
  uint64_t v15 = (unsigned int *)MEMORY[0x263F30568];
LABEL_7:
  uint64_t v16 = *v15;
  sub_25C662BD0();
  OUTLINED_FUNCTION_1();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v17 + 104))(a1, v16);
}

uint64_t sub_25C62E368@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v4 = sub_25C662BD0();
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v7 = (unsigned char *)(v6 - v5);
  uint64_t v8 = sub_25C662C10();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = v13 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC450);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_3();
  uint64_t v18 = v17 - v16;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC458);
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_4_0();
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC460);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_3();
  uint64_t v25 = v24 - v23;
  uint64_t v26 = type metadata accessor for RenderableEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v14, v3 + *(int *)(v26 + 20), v8);
  sub_25C62E198(v7);
  sub_25C662BB0();
  sub_25C62E0CC();
  sub_25C62E63C();
  sub_25C6632C0();
  swift_release();
  sub_25C62978C(v18, &qword_26A5BC450);
  char v27 = sub_25C663130();
  char v28 = *(unsigned char *)(v3 + *(int *)(type metadata accessor for EventCellView() + 28) + 32);
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  if ((v28 & 1) == 0)
  {
    sub_25C662D30();
    uint64_t v29 = v33;
    uint64_t v30 = v34;
    uint64_t v31 = v35;
    uint64_t v32 = v36;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v25, v2, v40);
  uint64_t v37 = v25 + *(int *)(v39 + 36);
  *(unsigned char *)uint64_t v37 = v27;
  *(void *)(v37 + 8) = v29;
  *(void *)(v37 + 16) = v30;
  *(void *)(v37 + 24) = v31;
  *(void *)(v37 + 32) = v32;
  *(unsigned char *)(v37 + 40) = v28;
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v2, v40);
  return sub_25C62E700(v25, a1);
}

unint64_t sub_25C62E63C()
{
  unint64_t result = qword_26A5BC468;
  if (!qword_26A5BC468)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC450);
    sub_25C62E6B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC468);
  }
  return result;
}

unint64_t sub_25C62E6B0()
{
  unint64_t result = qword_26A5BC470;
  if (!qword_26A5BC470)
  {
    sub_25C662BC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC470);
  }
  return result;
}

uint64_t sub_25C62E700(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C62E768(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25C62E7D4()
{
  unint64_t result = qword_26A5BC480;
  if (!qword_26A5BC480)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC460);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC450);
    sub_25C62E63C();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC480);
  }
  return result;
}

uint64_t sub_25C62E89C()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
  uint64_t v1 = (uint64_t *)(v0 + 16);
  OUTLINED_FUNCTION_1_0(1, 64);
  OUTLINED_FUNCTION_1_0(2, 1);
  OUTLINED_FUNCTION_1_0(3, 2);
  OUTLINED_FUNCTION_1_0(4, 4);
  OUTLINED_FUNCTION_1_0(5, 8);
  OUTLINED_FUNCTION_1_0(6, 16);
  OUTLINED_FUNCTION_1_0(7, 32);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25C663880();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v2 = 0;
    goto LABEL_6;
  }
  if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  swift_bridgeObjectRetain();
LABEL_6:
  swift_release();
  return v2;
}

id sub_25C62E9BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_25C6629F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_25C662CC0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = (void *)(v13 - v12);
  sub_25C62EC70(v1, v13 - v12);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    id v16 = 0;
    if (EnumCaseMultiPayload == 1) {
      return objc_msgSend(objc_allocWithZone(MEMORY[0x263F04BC8]), sel_initWithOccurrenceCount_, *v14);
    }
  }
  else
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v7 + 32))(v10, v14, v6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v10, v6);
    __swift_storeEnumTagSinglePayload(v5, 0, 1, v6);
    id v17 = objc_allocWithZone(MEMORY[0x263F04BC8]);
    id v16 = sub_25C62ED84(v5);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  }
  return v16;
}

uint64_t sub_25C62EBCC()
{
  return sub_25C663060();
}

uint64_t sub_25C62EC70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C662CC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C62ECD4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((a2 & ~a3) == 0)
  {
    id v5 = objc_msgSend(self, sel_dayOfWeek_, result);
    uint64_t v6 = swift_beginAccess();
    MEMORY[0x26118D980](v6);
    sub_25C62EE68(*(void *)((*(void *)(a4 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10));
    sub_25C6637A0();
    sub_25C663780();
    return swift_endAccess();
  }
  return result;
}

id sub_25C62ED84(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25C6629F0();
  id v5 = 0;
  if (__swift_getEnumTagSinglePayload(a1, 1, v4) != 1)
  {
    id v5 = (void *)sub_25C6629E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  id v6 = objc_msgSend(v2, sel_initWithEndDate_, v5);

  return v6;
}

uint64_t sub_25C62EE30()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C62EE68(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (result + 1 > (uint64_t)(v2 >> 1)) {
    return MEMORY[0x270F9DBF0](v2 > 1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return 0x5F5952455645;
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1, uint64_t a2)
{
  return sub_25C62ECD4(a1, a2, v3, v2);
}

uint64_t sub_25C62EEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a3;
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_1, a1, v4);
  __swift_project_boxed_opaque_existential_1(v10, v11);
  uint64_t v7 = (void *)sub_25C662C60();
  uint64_t v8 = (void *)sub_25C662C50();

  LOBYTE(v4) = sub_25C663660();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v4 & 1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t *sub_25C62EFDC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_25C663590();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_25C62F0C4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25C663590();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_25C62F13C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_25C663590();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_25C62F1D4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_25C62F270(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_25C62F2EC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_25C62F378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C62F38C);
}

uint64_t sub_25C62F38C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v9 = sub_25C663590();
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t sub_25C62F420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C62F434);
}

uint64_t sub_25C62F434(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = sub_25C663590();
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PunchoutButtonSnippet()
{
  uint64_t result = qword_26A5BC488;
  if (!qword_26A5BC488) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C62F4FC()
{
  uint64_t result = sub_25C663590();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C62F594()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C62F5B0()
{
  uint64_t v1 = type metadata accessor for PunchoutButtonSnippet();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  sub_25C62FA9C(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_25C62FB04((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC498);
  sub_25C6298EC((unint64_t *)&qword_26A5BC4A0, &qword_26A5BC498);
  return sub_25C6634A0();
}

uint64_t sub_25C62F6F0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PunchoutButtonSnippet();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  sub_25C62FA9C(a1, (uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_25C62FB04((uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v6 + v5);
  uint64_t v9 = a1;
  return sub_25C663440();
}

uint64_t sub_25C62F824()
{
  uint64_t v0 = sub_25C663670();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PunchoutButtonSnippet();
  sub_25C663570();
  uint64_t v4 = (void *)sub_25C662C90();
  sub_25C663650();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_25C62F914@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_25C62F950(*a1, a1[1]);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  *(void *)(a2 + 24) = v6;
  return result;
}

uint64_t sub_25C62F950(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    sub_25C663060();
    uint64_t v3 = qword_26A5BC340;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v3 != -1) {
      swift_once();
    }
    id v4 = (id)qword_26A5BE0E0;
    a1 = sub_25C663220();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25C62FA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PunchoutButtonSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C62FB04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PunchoutButtonSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C62FB68()
{
  uint64_t v1 = type metadata accessor for PunchoutButtonSnippet();
  OUTLINED_FUNCTION_0_2(v1);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return sub_25C62F6F0(v3);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for PunchoutButtonSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25C62FCB0()
{
  uint64_t v0 = type metadata accessor for PunchoutButtonSnippet();
  OUTLINED_FUNCTION_0_2(v0);
  return sub_25C62F824();
}

uint64_t sub_25C62FCF0@<X0>(uint64_t a1@<X8>)
{
  return sub_25C62F914(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_25C62FCF8()
{
  return sub_25C6298EC(&qword_26A5BC4A8, &qword_26A5BC4B0);
}

uint64_t OUTLINED_FUNCTION_0_2(uint64_t a1)
{
  return a1 - 8;
}

uint64_t initializeBufferWithCopyOfBuffer for NotifyAUIOfEditingModifier(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for NotifyAUIOfEditingModifier(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for NotifyAUIOfEditingModifier(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v3;
  swift_retain();
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for NotifyAUIOfEditingModifier(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  id v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v5;
  id v6 = v5;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NotifyAUIOfEditingModifier(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotifyAUIOfEditingModifier(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NotifyAUIOfEditingModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotifyAUIOfEditingModifier()
{
  return &type metadata for NotifyAUIOfEditingModifier;
}

uint64_t sub_25C62FFAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C62FFC8@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC4B8);
  OUTLINED_FUNCTION_0();
  uint64_t v26 = v2;
  uint64_t v27 = v3;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_3();
  uint64_t v6 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC4C0);
  OUTLINED_FUNCTION_0();
  uint64_t v29 = v8;
  uint64_t v30 = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v11 = v10 - v9;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC4C8);
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = v13 - v12;
  long long v32 = *v1;
  char v33 = *((unsigned char *)v1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC4D0);
  sub_25C662D60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC4D8);
  sub_25C6298EC(&qword_26A5BC4E0, &qword_26A5BC4D8);
  sub_25C663350();
  swift_release();
  swift_release();
  sub_25C662D40();
  uint64_t v15 = (void *)*((void *)v1 + 3);
  uint64_t v16 = swift_allocObject();
  OUTLINED_FUNCTION_2_0(v16);
  sub_25C6305F8((uint64_t)&v32);
  id v17 = v15;
  swift_getOpaqueTypeConformance2();
  sub_25C663360();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v6, v26);
  if (v15)
  {
    id v18 = v17;
    uint64_t v19 = sub_25C6636E0();

    uint64_t v20 = swift_allocObject();
    __n128 v21 = OUTLINED_FUNCTION_2_0(v20);
    (*(void (**)(uint64_t, uint64_t, uint64_t, __n128))(v29 + 16))(v14, v11, v30, v21);
    *(void *)(v14 + *(int *)(v28 + 52)) = v19;
    uint64_t v22 = (uint64_t (**)(uint64_t))(v14 + *(int *)(v28 + 56));
    *uint64_t v22 = sub_25C6306B8;
    v22[1] = (uint64_t (*)(uint64_t))v20;
    sub_25C6305F8((uint64_t)&v32);
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    id v24 = v18;
    v23(v11, v30);
    return sub_25C6306C0(v14, a1);
  }
  else
  {
    sub_25C663710();
    sub_25C630624();
    uint64_t result = sub_25C662EA0();
    __break(1u);
  }
  return result;
}

void sub_25C630364(long long *a1)
{
  long long v6 = *a1;
  LOBYTE(v7) = *((unsigned char *)a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC4D0);
  sub_25C662D40();
  uint64_t v2 = (void *)*((void *)a1 + 3);
  if (v8 == 1)
  {
    if (v2)
    {
      id v3 = v2;
      sub_25C6636D0();

      id v4 = objc_msgSend(objc_allocWithZone((Class)sub_25C663680()), sel_init, v6, v7);
      id v5 = v3;
      sub_25C6636F0();

LABEL_6:
      return;
    }
  }
  else if (v2)
  {
    id v5 = v2;
    sub_25C6636C0();
    goto LABEL_6;
  }
  sub_25C663710();
  sub_25C630624();
  sub_25C662EA0();
  __break(1u);
}

uint64_t sub_25C63044C(uint64_t a1, long long *a2)
{
  uint64_t v4 = sub_25C663700();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(void *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  if ((*(unsigned int (**)(void *, uint64_t))(v5 + 88))(v7, v4) != *MEMORY[0x263F77958]) {
    return (*(uint64_t (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v5 + 96))(v7, v4);
  if ((unint64_t)(*v7 - 3) <= 1)
  {
    long long v10 = *a2;
    char v11 = *((unsigned char *)a2 + 16);
    v9[15] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC4D0);
    return sub_25C662D50();
  }
  return result;
}

uint64_t sub_25C6305CC()
{
  return sub_25C662DD0();
}

void sub_25C6305F0()
{
  sub_25C630364((long long *)(v0 + 16));
}

uint64_t sub_25C6305F8(uint64_t a1)
{
  return a1;
}

unint64_t sub_25C630624()
{
  unint64_t result = qword_26A5BC4E8;
  if (!qword_26A5BC4E8)
  {
    sub_25C663710();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC4E8);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25C6306B8(uint64_t a1)
{
  return sub_25C63044C(a1, (long long *)(v1 + 16));
}

uint64_t sub_25C6306C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC4C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C630728()
{
  return sub_25C6298EC(&qword_26A5BC4F0, &qword_26A5BC4C8);
}

__n128 OUTLINED_FUNCTION_2_0(uint64_t a1)
{
  __n128 result = *(__n128 *)v1;
  long long v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 32) = v3;
  *(void *)(a1 + 48) = *(void *)(v1 + 32);
  return result;
}

uint64_t *sub_25C630778(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  long long v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *long long v3 = *a2;
    long long v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = a2[2];
    a1[1] = a2[1];
    a1[2] = v5;
    a1[3] = a2[3];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    char v8 = (char *)a2 + v6;
    uint64_t v9 = sub_25C663590();
    long long v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_25C630878(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25C663590();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_25C6308F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_25C663590();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  v9(v6, v7, v8);
  return a1;
}

uint64_t sub_25C6309A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_25C630A64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_25C630AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_25C630B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C630BA8);
}

uint64_t sub_25C630BA8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25C663590();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_25C630C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C630C44);
}

uint64_t sub_25C630C44(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25C663590();
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PromptForTitleSnippet()
{
  uint64_t result = qword_26A5BC4F8;
  if (!qword_26A5BC4F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C630D0C()
{
  uint64_t result = sub_25C663590();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C630DAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C630DC8()
{
  uint64_t v1 = sub_25C663670();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0[1];
  uint64_t v6 = v0[2];
  uint64_t v7 = v0[3];
  uint64_t v15 = v5;
  uint64_t v16 = v6;
  uint64_t v17 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC560);
  sub_25C663420();
  uint64_t v9 = v18;
  unint64_t v8 = v19;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    type metadata accessor for PromptForTitleSnippet();
    sub_25C663570();
    uint64_t v15 = v5;
    uint64_t v16 = v6;
    uint64_t v17 = v7;
    sub_25C663420();
    uint64_t v12 = sub_25C662C30();
    sub_25C65580C(v12, v13);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25C630F38()
{
  uint64_t v1 = type metadata accessor for PromptForTitleSnippet();
  uint64_t v2 = OUTLINED_FUNCTION_1_1(v1);
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v2);
  sub_25C633008(v0, (uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for PromptForTitleSnippet);
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  sub_25C632F28((uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, (void (*)(void))type metadata accessor for PromptForTitleSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC508);
  sub_25C6298EC(&qword_26A5BC510, &qword_26A5BC508);
  return sub_25C6634A0();
}

uint64_t sub_25C63107C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v150 = a2;
  uint64_t v152 = sub_25C6634D0();
  uint64_t v151 = *(void *)(v152 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v152);
  v160 = (char *)&v120 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v159 = (char *)&v120 - v5;
  uint64_t v149 = sub_25C662E90() - 8;
  MEMORY[0x270FA5388](v149);
  v148 = (char *)&v120 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = sub_25C662E00();
  uint64_t v143 = *(void *)(v144 - 8);
  MEMORY[0x270FA5388](v144);
  v142 = (char *)&v120 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PromptForTitleSnippet();
  uint64_t v140 = *(void *)(v8 - 8);
  uint64_t v139 = *(void *)(v140 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v138 = (uint64_t)&v120 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_25C662DA0();
  uint64_t v134 = *(void *)(v137 - 8);
  MEMORY[0x270FA5388](v137);
  v128 = (char *)&v120 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25C6630C0();
  uint64_t v125 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v120 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC518);
  uint64_t v122 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v120 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC520);
  uint64_t v126 = *(void *)(v123 - 8);
  MEMORY[0x270FA5388](v123);
  uint64_t v18 = (char *)&v120 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC528);
  uint64_t v133 = *(void *)(v130 - 8);
  MEMORY[0x270FA5388](v130);
  v121 = (char *)&v120 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC530);
  uint64_t v131 = *(void *)(v135 - 8);
  MEMORY[0x270FA5388](v135);
  v127 = (char *)&v120 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC538) - 8;
  MEMORY[0x270FA5388](v129);
  uint64_t v22 = (char *)&v120 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC540) - 8;
  MEMORY[0x270FA5388](v136);
  v132 = (char *)&v120 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC548) - 8;
  MEMORY[0x270FA5388](v141);
  v124 = (char *)&v120 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC550);
  MEMORY[0x270FA5388](v147);
  uint64_t v146 = (uint64_t)&v120 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC558);
  uint64_t v157 = *(void *)(v26 - 8);
  uint64_t v158 = v26;
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  v162 = (char *)&v120 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v145 = (char *)&v120 - v30;
  MEMORY[0x270FA5388](v29);
  v161 = (char *)&v120 - v31;
  uint64_t v156 = sub_25C6636B0();
  uint64_t v155 = *(void *)(v156 - 8);
  uint64_t v32 = MEMORY[0x270FA5388](v156);
  v154 = (char *)&v120 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v120 - v34;
  uint64_t v36 = sub_25C6322C4();
  uint64_t v170 = MEMORY[0x263F1B720];
  uint64_t v171 = MEMORY[0x263F774B0];
  uint64_t v167 = v36;
  v153 = v35;
  sub_25C6636A0();
  uint64_t v37 = *(void *)(a1 + 24);
  long long v163 = *(_OWORD *)(a1 + 8);
  uint64_t v164 = v37;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC560);
  sub_25C663430();
  sub_25C663470();
  sub_25C6630B0();
  uint64_t v38 = sub_25C6298EC(&qword_26A5BC568, &qword_26A5BC518);
  uint64_t v39 = sub_25C63317C(&qword_26A5BC570, MEMORY[0x263F19A88]);
  sub_25C663330();
  (*(void (**)(char *, uint64_t))(v125 + 8))(v13, v11);
  (*(void (**)(char *, uint64_t))(v122 + 8))(v16, v14);
  uint64_t v40 = v128;
  sub_25C662D90();
  uint64_t v167 = v14;
  uint64_t v168 = v11;
  uint64_t v169 = v38;
  uint64_t v170 = v39;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v42 = v121;
  uint64_t v43 = v123;
  sub_25C6632F0();
  (*(void (**)(char *, uint64_t))(v134 + 8))(v40, v137);
  uint64_t v44 = v18;
  uint64_t v45 = v43;
  (*(void (**)(char *, uint64_t))(v126 + 8))(v44, v43);
  uint64_t v46 = v138;
  sub_25C633008(a1, v138, (void (*)(void))type metadata accessor for PromptForTitleSnippet);
  unint64_t v47 = (*(unsigned __int8 *)(v140 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80);
  uint64_t v48 = swift_allocObject();
  sub_25C632F28(v46, v48 + v47, (void (*)(void))type metadata accessor for PromptForTitleSnippet);
  int v49 = v142;
  sub_25C662DF0();
  uint64_t v167 = v45;
  uint64_t v168 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v50 = v127;
  uint64_t v51 = v130;
  sub_25C663370();
  swift_release();
  (*(void (**)(char *, uint64_t))(v143 + 8))(v49, v144);
  (*(void (**)(char *, uint64_t))(v133 + 8))(v42, v51);
  LOBYTE(v39) = sub_25C663140();
  sub_25C662D30();
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v60 = v131;
  uint64_t v61 = v135;
  (*(void (**)(char *, char *, uint64_t))(v131 + 16))(v22, v50, v135);
  uint64_t v62 = (uint64_t)v124;
  char v63 = &v22[*(int *)(v129 + 44)];
  char *v63 = v39;
  *((void *)v63 + 1) = v53;
  *((void *)v63 + 2) = v55;
  *((void *)v63 + 3) = v57;
  *((void *)v63 + 4) = v59;
  v63[40] = 0;
  (*(void (**)(char *, uint64_t))(v60 + 8))(v50, v61);
  LODWORD(v39) = sub_25C663100();
  uint64_t v64 = v148;
  uint64_t v65 = &v148[*(int *)(v149 + 28)];
  uint64_t v66 = *MEMORY[0x263F19860];
  uint64_t v67 = sub_25C663080();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v67 - 8) + 104))(v65, v66, v67);
  __asm { FMOV            V0.2D, #5.0 }
  *uint64_t v64 = _Q0;
  uint64_t v73 = (uint64_t)v132;
  char v74 = &v132[*(int *)(v136 + 44)];
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC578);
  sub_25C633008((uint64_t)v64, (uint64_t)&v74[*(int *)(v75 + 52)], MEMORY[0x263F19048]);
  *(_DWORD *)char v74 = v39;
  *(_WORD *)&v74[*(int *)(v75 + 56)] = 256;
  sub_25C62973C((uint64_t)v22, v73, &qword_26A5BC538);
  sub_25C63305C((uint64_t)v64, MEMORY[0x263F19048]);
  sub_25C6331C4((uint64_t)v22, &qword_26A5BC538);
  LOBYTE(v39) = sub_25C662D70();
  uint64_t v77 = v76;
  LOBYTE(v74) = v78;
  sub_25C663710();
  sub_25C63317C((unint64_t *)&qword_26A5BC4E8, MEMORY[0x263F77980]);
  uint64_t v79 = sub_25C662EB0();
  uint64_t v81 = v80;
  sub_25C62973C(v73, v62, &qword_26A5BC540);
  uint64_t v82 = v62 + *(int *)(v141 + 44);
  *(unsigned char *)uint64_t v82 = v39 & 1;
  *(void *)(v82 + 8) = v77;
  *(unsigned char *)(v82 + 16) = v74 & 1;
  *(void *)(v82 + 24) = v79;
  *(void *)(v82 + 32) = v81;
  sub_25C6331C4(v73, &qword_26A5BC540);
  LOBYTE(v74) = sub_25C663130();
  unsigned __int8 v83 = sub_25C663150();
  char v84 = sub_25C663160();
  sub_25C663160();
  if (sub_25C663160() != v74) {
    char v84 = sub_25C663160();
  }
  sub_25C663160();
  if (sub_25C663160() != v83) {
    char v84 = sub_25C663160();
  }
  uint64_t v85 = v146;
  sub_25C62973C(v62, v146, &qword_26A5BC548);
  uint64_t v86 = v85 + *(int *)(v147 + 36);
  *(unsigned char *)uint64_t v86 = v84;
  *(_OWORD *)(v86 + 8) = 0u;
  *(_OWORD *)(v86 + 24) = 0u;
  *(unsigned char *)(v86 + 40) = 1;
  sub_25C6331C4(v62, &qword_26A5BC548);
  sub_25C6329D4();
  v87 = v145;
  sub_25C663280();
  sub_25C6331C4(v85, &qword_26A5BC550);
  uint64_t v88 = v157;
  (*(void (**)(char *, char *, uint64_t))(v157 + 32))(v161, v87, v158);
  uint64_t v89 = sub_25C6325AC();
  uint64_t v171 = MEMORY[0x263F774B0];
  uint64_t v170 = MEMORY[0x263F1B720];
  uint64_t v167 = v89;
  uint64_t v90 = sub_25C663060();
  uint64_t v92 = v91;
  char v94 = v93;
  uint64_t v96 = v95;
  uint64_t v97 = type metadata accessor for CalendarButtonView(0);
  uint64_t v165 = v97;
  uint64_t v166 = sub_25C63317C(&qword_26A5BC5B0, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v163);
  boxed_opaque_existential_1[7] = MEMORY[0x263F6CD30];
  boxed_opaque_existential_1[8] = sub_25C632D4C();
  *((unsigned char *)boxed_opaque_existential_1 + 32) = 2;
  *((unsigned char *)boxed_opaque_existential_1 + 72) = 1;
  v99 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v100 = (char *)boxed_opaque_existential_1 + v99[6];
  uint64_t v101 = *MEMORY[0x263F774D8];
  uint64_t v102 = sub_25C663490();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v102 - 8) + 104))(v100, v101, v102);
  uint64_t *boxed_opaque_existential_1 = v90;
  boxed_opaque_existential_1[1] = v92;
  *((unsigned char *)boxed_opaque_existential_1 + 16) = v94 & 1;
  boxed_opaque_existential_1[3] = v96;
  *(uint64_t *)((char *)boxed_opaque_existential_1 + v99[7]) = 0;
  *(uint64_t *)((char *)boxed_opaque_existential_1 + v99[8]) = 0;
  v103 = (char *)boxed_opaque_existential_1 + *(int *)(v97 + 20);
  *(void *)v103 = swift_getKeyPath();
  v103[8] = 0;
  sub_25C663580();
  v104 = v159;
  sub_25C6634C0();
  v105 = *(void (**)(char *, char *, uint64_t))(v155 + 16);
  v106 = v154;
  uint64_t v107 = v156;
  v105(v154, v153, v156);
  uint64_t v149 = *(void *)(v88 + 16);
  uint64_t v108 = v158;
  ((void (*)(char *, char *, uint64_t))v149)(v162, v161, v158);
  uint64_t v109 = v151;
  v148 = *(char **)(v151 + 16);
  v110 = v104;
  uint64_t v111 = v152;
  ((void (*)(char *, char *, uint64_t))v148)(v160, v110, v152);
  v112 = v150;
  v105(v150, v106, v107);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC5C0);
  ((void (*)(char *, char *, uint64_t))v149)(&v112[*(int *)(v113 + 48)], v162, v108);
  v114 = v160;
  ((void (*)(char *, char *, uint64_t))v148)(&v112[*(int *)(v113 + 64)], v160, v111);
  v115 = *(void (**)(char *, uint64_t))(v109 + 8);
  v115(v159, v111);
  v116 = *(void (**)(char *, uint64_t))(v157 + 8);
  v116(v161, v108);
  v117 = *(void (**)(char *, uint64_t))(v155 + 8);
  uint64_t v118 = v156;
  v117(v153, v156);
  v115(v114, v111);
  v116(v162, v108);
  return ((uint64_t (*)(char *, uint64_t))v117)(v154, v118);
}

uint64_t sub_25C6322C4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC3E0);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_3();
  uint64_t v4 = v3 - v2;
  sub_25C663060();
  if (qword_26A5BC340 != -1) {
    swift_once();
  }
  id v5 = (id)qword_26A5BE0E0;
  uint64_t v6 = sub_25C663220();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  sub_25C663340();
  sub_25C629890(v6, v8, v10);
  swift_bridgeObjectRelease();
  swift_getOpaqueTypeConformance2();
  uint64_t v11 = sub_25C663240();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  return v11;
}

uint64_t sub_25C6324CC@<X0>(uint64_t a1@<X8>)
{
  sub_25C663060();
  if (qword_26A5BC340 != -1) {
    swift_once();
  }
  id v2 = (id)qword_26A5BE0E0;
  uint64_t result = sub_25C663220();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_25C6325AC()
{
  uint64_t v1 = type metadata accessor for PromptForTitleSnippet();
  uint64_t v2 = OUTLINED_FUNCTION_1_1(v1);
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = type metadata accessor for CalendarButtonView(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_3();
  uint64_t v17 = v16 - v15;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC5C8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_3();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = sub_25C663060();
  uint64_t v45 = v23;
  uint64_t v46 = v22;
  char v25 = v24;
  uint64_t v44 = v26;
  sub_25C633008(v0, (uint64_t)v7, (void (*)(void))type metadata accessor for PromptForTitleSnippet);
  unint64_t v27 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v28 = swift_allocObject();
  sub_25C632F28((uint64_t)v7, v28 + v27, (void (*)(void))type metadata accessor for PromptForTitleSnippet);
  *(void *)&long long v50 = sub_25C6329D0;
  *((void *)&v50 + 1) = v28;
  char v52 = 0;
  uint64_t v29 = v12 + v8[6];
  uint64_t v30 = *MEMORY[0x263F774E0];
  sub_25C663490();
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v31 + 104))(v29, v30);
  uint64_t v32 = v45;
  *(void *)uint64_t v12 = v46;
  *(void *)(v12 + 8) = v32;
  *(unsigned char *)(v12 + 16) = v25 & 1;
  *(void *)(v12 + 24) = v44;
  sub_25C632ECC((uint64_t)&v50, v12 + 32);
  *(void *)(v12 + v8[7]) = 0;
  *(void *)(v12 + v8[8]) = 0;
  sub_25C632F28(v12, v17, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  uint64_t v33 = v17 + *(int *)(v13 + 20);
  *(void *)uint64_t v33 = swift_getKeyPath();
  *(unsigned char *)(v33 + 8) = 0;
  sub_25C663580();
  uint64_t v34 = *(void *)(v0 + 24);
  long long v50 = *(_OWORD *)(v0 + 8);
  uint64_t v51 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC560);
  sub_25C663420();
  uint64_t v36 = v48;
  unint64_t v35 = v49;
  swift_bridgeObjectRelease();
  uint64_t v37 = HIBYTE(v35) & 0xF;
  if ((v35 & 0x2000000000000000) == 0) {
    uint64_t v37 = v36 & 0xFFFFFFFFFFFFLL;
  }
  BOOL v38 = v37 == 0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v40 = swift_allocObject();
  *(unsigned char *)(v40 + 16) = v38;
  sub_25C633008(v17, v21, (void (*)(void))type metadata accessor for CalendarButtonView);
  long long v41 = (uint64_t *)(v21 + *(int *)(v47 + 36));
  *long long v41 = KeyPath;
  v41[1] = (uint64_t)sub_25C632FF0;
  v41[2] = v40;
  sub_25C63305C(v17, (void (*)(void))type metadata accessor for CalendarButtonView);
  sub_25C6330AC();
  uint64_t v42 = sub_25C663240();
  sub_25C6331C4(v21, &qword_26A5BC5C8);
  return v42;
}

uint64_t sub_25C63297C@<X0>(char *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PromptForTitleSnippet();
  OUTLINED_FUNCTION_0_2(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_25C63107C(v5, a1);
}

unint64_t sub_25C6329D4()
{
  unint64_t result = qword_26A5BC580;
  if (!qword_26A5BC580)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC550);
    sub_25C632A50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC580);
  }
  return result;
}

unint64_t sub_25C632A50()
{
  unint64_t result = qword_26A5BC588;
  if (!qword_26A5BC588)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC548);
    sub_25C632ACC();
    sub_25C632D00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC588);
  }
  return result;
}

unint64_t sub_25C632ACC()
{
  unint64_t result = qword_26A5BC590;
  if (!qword_26A5BC590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC540);
    sub_25C632B6C();
    sub_25C6298EC(&qword_26A5BC5A0, &qword_26A5BC578);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC590);
  }
  return result;
}

unint64_t sub_25C632B6C()
{
  unint64_t result = qword_26A5BC598;
  if (!qword_26A5BC598)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC538);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC528);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC520);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC518);
    sub_25C6630C0();
    sub_25C6298EC(&qword_26A5BC568, &qword_26A5BC518);
    sub_25C63317C(&qword_26A5BC570, MEMORY[0x263F19A88]);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC598);
  }
  return result;
}

unint64_t sub_25C632D00()
{
  unint64_t result = qword_26A5BC5A8;
  if (!qword_26A5BC5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC5A8);
  }
  return result;
}

unint64_t sub_25C632D4C()
{
  unint64_t result = qword_26A5BC5B8;
  if (!qword_26A5BC5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC5B8);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = *(void *)(type metadata accessor for PromptForTitleSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  swift_bridgeObjectRelease();
  swift_release();
  sub_25C663590();
  OUTLINED_FUNCTION_1();
  uint64_t v5 = OUTLINED_FUNCTION_4_1();
  v6(v5);
  return MEMORY[0x270FA0238](v0, v3, v4);
}

uint64_t sub_25C632E90()
{
  uint64_t v0 = type metadata accessor for PromptForTitleSnippet();
  OUTLINED_FUNCTION_0_2(v0);
  return sub_25C630DC8();
}

uint64_t sub_25C632ECC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25C632F28(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25C632F88@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C662F80();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25C632FB8()
{
  return sub_25C662F90();
}

uint64_t sub_25C632FE0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_25C632FF0(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_25C633008(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = OUTLINED_FUNCTION_2();
  v5(v4);
  return a2;
}

uint64_t sub_25C63305C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1();
  uint64_t v3 = OUTLINED_FUNCTION_4_1();
  v4(v3);
  return a1;
}

unint64_t sub_25C6330AC()
{
  unint64_t result = qword_26A5BC5D0;
  if (!qword_26A5BC5D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC5C8);
    sub_25C63317C((unint64_t *)&qword_26A5BC5D8, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
    sub_25C6298EC(&qword_26A5BC5E0, &qword_26A5BC5E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC5D0);
  }
  return result;
}

uint64_t sub_25C63317C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C6331C4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1();
  uint64_t v3 = OUTLINED_FUNCTION_4_1();
  v4(v3);
  return a1;
}

uint64_t sub_25C633210()
{
  return sub_25C6298EC(&qword_26A5BC5F0, &qword_26A5BC5F8);
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return v0;
}

void *sub_25C633274(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    long long v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    uint64_t v11 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v11;
    uint64_t v12 = (int *)sub_25C662CE0();
    uint64_t v13 = v12[8];
    uint64_t v63 = (uint64_t)a2 + v13;
    uint64_t v64 = (char *)v4 + v13;
    uint64_t v14 = sub_25C6628A0();
    uint64_t v62 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v62(v64, v63, v14);
    *((unsigned char *)v4 + v12[9]) = *((unsigned char *)a2 + v12[9]);
    uint64_t v15 = v12[10];
    uint64_t v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = v12[11];
    uint64_t v20 = (void *)((char *)v4 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = v12[12];
    char v24 = (char *)v4 + v23;
    char v25 = (char *)a2 + v23;
    uint64_t v26 = sub_25C662CD0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
      memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      *char v24 = *v25;
      *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
      uint64_t v29 = *(int *)(v26 + 28);
      uint64_t v30 = &v24[v29];
      uint64_t v31 = &v25[v29];
      uint64_t v32 = sub_25C662CC0();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        uint64_t v33 = sub_25C6629F0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v33 - 8) + 16))(v30, v31, v33);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
    }
    *(void *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    uint64_t v34 = v12[14];
    unint64_t v35 = (char *)v4 + v34;
    uint64_t v36 = (char *)a2 + v34;
    uint64_t v37 = sub_25C662B70();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
      memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
    }
    uint64_t v39 = type metadata accessor for RenderableEvent();
    uint64_t v40 = *(int *)(v39 + 20);
    long long v41 = (char *)v4 + v40;
    uint64_t v42 = (uint64_t)a2 + v40;
    uint64_t v43 = sub_25C662C10();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
    uint64_t v44 = *(int *)(v39 + 24);
    uint64_t v45 = (void *)((char *)v4 + v44);
    uint64_t v46 = (uint64_t *)((char *)a2 + v44);
    uint64_t v47 = v46[1];
    *uint64_t v45 = *v46;
    v45[1] = v47;
    uint64_t v48 = a3[6];
    *(void *)((char *)v4 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    unint64_t v49 = (char *)v4 + v48;
    uint64_t v50 = *(uint64_t *)((char *)a2 + v48);
    LOBYTE(v42) = *((unsigned char *)a2 + v48 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25C62C450(v50, v42);
    *(void *)unint64_t v49 = v50;
    v49[8] = v42;
    uint64_t v51 = a3[7];
    char v52 = (char *)v4 + v51;
    uint64_t v53 = (uint64_t)a2 + v51;
    uint64_t v54 = sub_25C663590();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v54 - 8) + 16))(v52, v53, v54);
    uint64_t v55 = a3[8];
    uint64_t v56 = (char *)v4 + v55;
    uint64_t v57 = (uint64_t)a2 + v55;
    uint64_t v58 = *(uint64_t *)((char *)a2 + v55);
    LOBYTE(v52) = *(unsigned char *)(v57 + 8);
    sub_25C62C450(v58, (char)v52);
    *(void *)uint64_t v56 = v58;
    v56[8] = (char)v52;
    *((_OWORD *)v56 + 1) = *(_OWORD *)(v57 + 16);
    v56[32] = *(unsigned char *)(v57 + 32);
    uint64_t v59 = *(void *)(v57 + 48);
    uint64_t v60 = *(void *)(v57 + 56);
    *((void *)v56 + 5) = *(void *)(v57 + 40);
    *((void *)v56 + 6) = v59;
    *((void *)v56 + 7) = v60;
  }
  swift_retain();
  return v4;
}

uint64_t sub_25C633724(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)sub_25C662CE0();
  uint64_t v5 = a1 + v4[8];
  uint64_t v6 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + v4[12];
  uint64_t v8 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    uint64_t v9 = v7 + *(int *)(v8 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      uint64_t v10 = sub_25C6629F0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = a1 + v4[14];
  uint64_t v12 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  uint64_t v13 = a1 + *(int *)(type metadata accessor for RenderableEvent() + 20);
  uint64_t v14 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C62C6E4(*(void *)(a1 + a2[6]), *(unsigned char *)(a1 + a2[6] + 8));
  uint64_t v15 = a1 + a2[7];
  uint64_t v16 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  sub_25C62C6E4(*(void *)(a1 + a2[8]), *(unsigned char *)(a1 + a2[8] + 8));
  return swift_release();
}

uint64_t sub_25C6339B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  long long v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v61 = a2 + v12;
  uint64_t v62 = a1 + v12;
  uint64_t v13 = sub_25C6628A0();
  uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v60(v62, v61, v13);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v14 = v11[10];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v11[11];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = v11[12];
  uint64_t v23 = (unsigned char *)(a1 + v22);
  char v24 = (unsigned char *)(a2 + v22);
  uint64_t v25 = sub_25C662CD0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    *uint64_t v23 = *v24;
    *(_OWORD *)(v23 + 8) = *(_OWORD *)(v24 + 8);
    uint64_t v27 = *(int *)(v25 + 28);
    uint64_t v28 = &v23[v27];
    uint64_t v29 = &v24[v27];
    uint64_t v30 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      uint64_t v31 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v31 - 8) + 16))(v28, v29, v31);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  }
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  uint64_t v32 = v11[14];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  uint64_t v35 = sub_25C662B70();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
  }
  uint64_t v37 = type metadata accessor for RenderableEvent();
  uint64_t v38 = *(int *)(v37 + 20);
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  uint64_t v41 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  uint64_t v42 = *(int *)(v37 + 24);
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (void *)(a2 + v42);
  uint64_t v45 = v44[1];
  void *v43 = *v44;
  v43[1] = v45;
  uint64_t v46 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v47 = a1 + v46;
  uint64_t v48 = *(void *)(a2 + v46);
  LOBYTE(v40) = *(unsigned char *)(a2 + v46 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25C62C450(v48, v40);
  *(void *)uint64_t v47 = v48;
  *(unsigned char *)(v47 + 8) = v40;
  uint64_t v49 = a3[7];
  uint64_t v50 = a1 + v49;
  uint64_t v51 = a2 + v49;
  uint64_t v52 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 16))(v50, v51, v52);
  uint64_t v53 = a3[8];
  uint64_t v54 = a1 + v53;
  uint64_t v55 = a2 + v53;
  uint64_t v56 = *(void *)(a2 + v53);
  LOBYTE(v50) = *(unsigned char *)(v55 + 8);
  sub_25C62C450(v56, v50);
  *(void *)uint64_t v54 = v56;
  *(unsigned char *)(v54 + 8) = v50;
  *(_OWORD *)(v54 + 16) = *(_OWORD *)(v55 + 16);
  *(unsigned char *)(v54 + 32) = *(unsigned char *)(v55 + 32);
  uint64_t v57 = *(void *)(v55 + 48);
  uint64_t v58 = *(void *)(v55 + 56);
  *(void *)(v54 + 40) = *(void *)(v55 + 40);
  *(void *)(v54 + 48) = v57;
  *(void *)(v54 + 56) = v58;
  swift_retain();
  return a1;
}

uint64_t sub_25C633E18(uint64_t a1, uint64_t a2, int *a3)
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
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)sub_25C662CE0();
  uint64_t v7 = v6[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(unsigned char *)(a1 + v6[9]) = *(unsigned char *)(a2 + v6[9]);
  uint64_t v11 = v6[10];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  void *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = v6[11];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = v6[12];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  int v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
      *(void *)(v18 + 8) = *(void *)(v19 + 8);
      *(void *)(v18 + 16) = *(void *)(v19 + 16);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v30 = *(int *)(v20 + 28);
      uint64_t v31 = v18 + v30;
      uint64_t v32 = (const void *)(v19 + v30);
      sub_25C639628(v31, MEMORY[0x263F6CD68]);
      uint64_t v33 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v71 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v71 - 8) + 16))(v31, v32, v71);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v27 = *(void *)(*(void *)(v33 - 8) + 64);
      uint64_t v28 = (void *)v31;
      uint64_t v29 = v32;
LABEL_8:
      memcpy(v28, v29, v27);
      goto LABEL_14;
    }
    sub_25C639628(v18, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v27 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v28 = (void *)v18;
    uint64_t v29 = (const void *)v19;
    goto LABEL_8;
  }
  if (v22) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  *(void *)(v18 + 16) = *(void *)(v19 + 16);
  uint64_t v23 = *(int *)(v20 + 28);
  char v24 = (void *)(v18 + v23);
  uint64_t v25 = (const void *)(v19 + v23);
  uint64_t v26 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v34 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(void *)(a1 + v6[13]) = *(void *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = v6[14];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (const void *)(a2 + v35);
  uint64_t v38 = sub_25C662B70();
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
  int v40 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
  if (!v39)
  {
    uint64_t v41 = *(void *)(v38 - 8);
    if (!v40)
    {
      (*(void (**)(void *, const void *, uint64_t))(v41 + 24))(v36, v37, v38);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v41 + 8))(v36, v38);
    goto LABEL_19;
  }
  if (v40)
  {
LABEL_19:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v36, v37, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
LABEL_20:
  uint64_t v43 = type metadata accessor for RenderableEvent();
  uint64_t v44 = *(int *)(v43 + 20);
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  uint64_t v47 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 24))(v45, v46, v47);
  uint64_t v48 = *(int *)(v43 + 24);
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (void *)(a2 + v48);
  *uint64_t v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v51 = a3[6];
  uint64_t v52 = a1 + v51;
  uint64_t v53 = a2 + v51;
  uint64_t v54 = *(void *)v53;
  LOBYTE(v45) = *(unsigned char *)(v53 + 8);
  sub_25C62C450(*(void *)v53, v45);
  uint64_t v55 = *(void *)v52;
  char v56 = *(unsigned char *)(v52 + 8);
  *(void *)uint64_t v52 = v54;
  *(unsigned char *)(v52 + 8) = v45;
  sub_25C62C6E4(v55, v56);
  uint64_t v57 = a3[7];
  uint64_t v58 = a1 + v57;
  uint64_t v59 = a2 + v57;
  uint64_t v60 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 24))(v58, v59, v60);
  uint64_t v61 = a3[8];
  uint64_t v62 = a1 + v61;
  uint64_t v63 = a2 + v61;
  uint64_t v64 = *(void *)(a2 + v61);
  char v65 = *(unsigned char *)(v63 + 8);
  sub_25C62C450(v64, v65);
  uint64_t v66 = *(void *)v62;
  char v67 = *(unsigned char *)(v62 + 8);
  *(void *)uint64_t v62 = v64;
  *(unsigned char *)(v62 + 8) = v65;
  sub_25C62C6E4(v66, v67);
  *(void *)(v62 + 16) = *(void *)(v63 + 16);
  uint64_t v68 = *(void *)(v63 + 24);
  *(unsigned char *)(v62 + 32) = *(unsigned char *)(v63 + 32);
  *(void *)(v62 + 24) = v68;
  *(void *)(v62 + 40) = *(void *)(v63 + 40);
  uint64_t v69 = *(void *)(v63 + 56);
  *(void *)(v62 + 48) = *(void *)(v63 + 48);
  *(void *)(v62 + 56) = v69;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_25C6344CC(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  uint64_t v8 = (int *)sub_25C662CE0();
  uint64_t v9 = v8[8];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25C6628A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *((unsigned char *)a1 + v8[9]) = *((unsigned char *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  uint64_t v13 = v8[12];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_25C662CD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    unsigned char *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    uint64_t v18 = *(int *)(v16 + 28);
    uint64_t v19 = &v14[v18];
    uint64_t v20 = &v15[v18];
    uint64_t v21 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(void *)((char *)a1 + v8[13]) = *(void *)((char *)a2 + v8[13]);
  uint64_t v23 = v8[14];
  char v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_25C662B70();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  uint64_t v28 = type metadata accessor for RenderableEvent();
  uint64_t v29 = *(int *)(v28 + 20);
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = sub_25C662C10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
  *(_OWORD *)((char *)a1 + *(int *)(v28 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v28 + 24));
  uint64_t v33 = a3[6];
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  v34[8] = v35[8];
  *(void *)uint64_t v34 = *(void *)v35;
  uint64_t v36 = a3[7];
  uint64_t v37 = (char *)a1 + v36;
  uint64_t v38 = (char *)a2 + v36;
  uint64_t v39 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 32))(v37, v38, v39);
  uint64_t v40 = a3[8];
  uint64_t v41 = (_OWORD *)((char *)a1 + v40);
  uint64_t v42 = (_OWORD *)((char *)a2 + v40);
  long long v43 = v42[1];
  *uint64_t v41 = *v42;
  v41[1] = v43;
  long long v44 = v42[3];
  v41[2] = v42[2];
  v41[3] = v44;
  return a1;
}

uint64_t sub_25C634868(uint64_t a1, uint64_t a2, int *a3)
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
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v16 = v11[10];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v11[11];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = v11[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  int v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v39 = *(int *)(v29 + 28);
      uint64_t v40 = v27 + v39;
      uint64_t v41 = (const void *)(v28 + v39);
      sub_25C639628(v40, MEMORY[0x263F6CD68]);
      uint64_t v42 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v79 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v79 - 8) + 32))(v40, v41, v79);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v36 = *(void *)(*(void *)(v42 - 8) + 64);
      uint64_t v37 = (void *)v40;
      uint64_t v38 = v41;
LABEL_8:
      memcpy(v37, v38, v36);
      goto LABEL_14;
    }
    sub_25C639628(v27, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v36 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v37 = (void *)v27;
    uint64_t v38 = (const void *)v28;
    goto LABEL_8;
  }
  if (v31) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  uint64_t v32 = *(int *)(v29 + 28);
  uint64_t v33 = (void *)(v27 + v32);
  uint64_t v34 = (const void *)(v28 + v32);
  uint64_t v35 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    uint64_t v43 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  uint64_t v44 = v11[14];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (const void *)(a2 + v44);
  uint64_t v47 = sub_25C662B70();
  int v48 = __swift_getEnumTagSinglePayload((uint64_t)v45, 1, v47);
  int v49 = __swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47);
  if (!v48)
  {
    uint64_t v50 = *(void *)(v47 - 8);
    if (!v49)
    {
      (*(void (**)(void *, const void *, uint64_t))(v50 + 40))(v45, v46, v47);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v50 + 8))(v45, v47);
    goto LABEL_19;
  }
  if (v49)
  {
LABEL_19:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v45, v46, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
  __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
LABEL_20:
  uint64_t v52 = type metadata accessor for RenderableEvent();
  uint64_t v53 = *(int *)(v52 + 20);
  uint64_t v54 = a1 + v53;
  uint64_t v55 = a2 + v53;
  uint64_t v56 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 40))(v54, v55, v56);
  uint64_t v57 = *(int *)(v52 + 24);
  uint64_t v58 = (void *)(a1 + v57);
  uint64_t v59 = (uint64_t *)(a2 + v57);
  uint64_t v61 = *v59;
  uint64_t v60 = v59[1];
  void *v58 = v61;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  uint64_t v62 = a3[6];
  uint64_t v63 = a1 + v62;
  uint64_t v64 = (uint64_t *)(a2 + v62);
  uint64_t v65 = *v64;
  LOBYTE(v64) = *((unsigned char *)v64 + 8);
  uint64_t v66 = *(void *)v63;
  char v67 = *(unsigned char *)(v63 + 8);
  *(void *)uint64_t v63 = v65;
  *(unsigned char *)(v63 + 8) = (_BYTE)v64;
  sub_25C62C6E4(v66, v67);
  uint64_t v68 = a3[7];
  uint64_t v69 = a1 + v68;
  uint64_t v70 = a2 + v68;
  uint64_t v71 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 40))(v69, v70, v71);
  uint64_t v72 = a3[8];
  uint64_t v73 = a1 + v72;
  uint64_t v74 = a2 + v72;
  char v75 = *(unsigned char *)(v74 + 8);
  uint64_t v76 = *(void *)(a1 + v72);
  char v77 = *(unsigned char *)(a1 + v72 + 8);
  *(void *)uint64_t v73 = *(void *)v74;
  *(unsigned char *)(v73 + 8) = v75;
  sub_25C62C6E4(v76, v77);
  *(void *)(v73 + 16) = *(void *)(v74 + 16);
  *(void *)(v73 + 24) = *(void *)(v74 + 24);
  *(unsigned char *)(v73 + 32) = *(unsigned char *)(v74 + 32);
  *(void *)(v73 + 40) = *(void *)(v74 + 40);
  *(_OWORD *)(v73 + 48) = *(_OWORD *)(v74 + 48);
  swift_release();
  return a1;
}

uint64_t sub_25C634E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C634E68);
}

uint64_t sub_25C634E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_8:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = sub_25C663590();
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    goto LABEL_8;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

uint64_t sub_25C634F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C634F2C);
}

void sub_25C634F2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return;
    }
    uint64_t v10 = sub_25C663590();
    uint64_t v11 = a1 + *(int *)(a4 + 28);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for ConflictingEventConfirmationSnippet()
{
  uint64_t result = qword_26A5BC600;
  if (!qword_26A5BC600) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C635020()
{
  uint64_t result = type metadata accessor for RenderableEvent();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C663590();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C635108()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C635124()
{
  OUTLINED_FUNCTION_16();
  sub_25C6633F0();
  sub_25C663230();
  OUTLINED_FUNCTION_15();
  uint64_t v3 = sub_25C6631E0();
  uint64_t v5 = v4;
  char v7 = v6;
  sub_25C629890(v0, v1, v2);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16();
  uint64_t v8 = sub_25C663060();
  uint64_t v10 = v9;
  char v12 = v11;
  if (qword_26A5BC340 != -1) {
    swift_once();
  }
  id v13 = (id)qword_26A5BE0E0;
  sub_25C663220();
  OUTLINED_FUNCTION_15();
  uint64_t v15 = sub_25C6631E0();
  sub_25C629890(v8, v10, v12);
  swift_bridgeObjectRelease();
  sub_25C629890(v3, v5, v7 & 1);
  swift_bridgeObjectRelease();
  return v15;
}

void sub_25C6352C8()
{
  OUTLINED_FUNCTION_6();
  uint64_t v34 = v1;
  uint64_t v2 = type metadata accessor for ConflictingEventConfirmationSnippet();
  uint64_t v3 = v2 - 8;
  uint64_t v29 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v29 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC610);
  OUTLINED_FUNCTION_0();
  uint64_t v31 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v30 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC618);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3();
  uint64_t v12 = v11 - v10;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC620);
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_3();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = v0 + *(int *)(v3 + 32);
  uint64_t v20 = *(void *)v19;
  char v21 = *(unsigned char *)(v19 + 8);
  sub_25C62C450(*(void *)v19, v21);
  sub_25C637EB4();
  sub_25C62C6E4(v20, v21);
  if (sub_25C6637F0())
  {
    sub_25C635728();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v12, v18, v32);
    swift_storeEnumTagMultiPayload();
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC638);
    uint64_t v36 = sub_25C6298EC(&qword_26A5BC640, &qword_26A5BC638);
    swift_getOpaqueTypeConformance2();
    sub_25C6298EC(&qword_26A5BC648, &qword_26A5BC610);
    sub_25C6630F0();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v32);
  }
  else
  {
    sub_25C6395D4(v0, (uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ConflictingEventConfirmationSnippet);
    unint64_t v22 = (*(unsigned __int8 *)(v29 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
    uint64_t v23 = swift_allocObject();
    sub_25C6394AC((uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22, (void (*)(void))type metadata accessor for ConflictingEventConfirmationSnippet);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC628);
    sub_25C6298EC(&qword_26A5BC630, &qword_26A5BC628);
    uint64_t v24 = v30;
    sub_25C6634A0();
    uint64_t v25 = v31;
    uint64_t v26 = v33;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v12, v24, v33);
    swift_storeEnumTagMultiPayload();
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC638);
    uint64_t v28 = sub_25C6298EC(&qword_26A5BC640, &qword_26A5BC638);
    uint64_t v35 = v27;
    uint64_t v36 = v28;
    swift_getOpaqueTypeConformance2();
    sub_25C6298EC(&qword_26A5BC648, &qword_26A5BC610);
    sub_25C6630F0();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
  }
  OUTLINED_FUNCTION_5_0();
}

void sub_25C635728()
{
  OUTLINED_FUNCTION_6();
  uint64_t v21 = v0;
  uint64_t v23 = v2;
  uint64_t v22 = sub_25C663690();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3_0();
  uint64_t v6 = type metadata accessor for ConflictingEventConfirmationSnippet();
  uint64_t v7 = v6 - 8;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC638);
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3();
  uint64_t v16 = v15 - v14;
  sub_25C6395D4(v0, (uint64_t)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ConflictingEventConfirmationSnippet);
  unint64_t v17 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v18 = swift_allocObject();
  sub_25C6394AC((uint64_t)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17, (void (*)(void))type metadata accessor for ConflictingEventConfirmationSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC650);
  sub_25C6298EC(&qword_26A5BC658, &qword_26A5BC650);
  sub_25C6634A0();
  uint64_t v19 = v22;
  *uint64_t v1 = *(void *)(v21 + *(int *)(v7 + 40) + 16);
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v1, *MEMORY[0x263F778F8], v19);
  sub_25C6298EC(&qword_26A5BC640, &qword_26A5BC638);
  sub_25C6632A0();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v1, v19);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v10);
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_25C6359D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v96 = a1;
  uint64_t v108 = a2;
  uint64_t v113 = sub_25C6634D0();
  uint64_t v124 = *(void *)(v113 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v113);
  uint64_t v120 = (char *)&v96 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v112 = (char *)&v96 - v5;
  uint64_t v107 = (void (*)(void, void, void))__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6B0);
  MEMORY[0x270FA5388](v107);
  v106 = (void (*)(char *, char *, uint64_t))((char *)&v96 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6B8);
  uint64_t v121 = *(void *)(v111 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v111);
  uint64_t v123 = (char *)&v96 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v119 = (char *)&v96 - v9;
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6C0) - 8;
  MEMORY[0x270FA5388](v102);
  v100 = (uint64_t *)((char *)&v96 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6C8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v97 = (char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6D0) - 8;
  MEMORY[0x270FA5388](v98);
  uint64_t v14 = (char *)&v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6D8);
  MEMORY[0x270FA5388](v103);
  uint64_t v99 = (uint64_t)&v96 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6E0);
  uint64_t v105 = *(v104 - 1);
  MEMORY[0x270FA5388](v104);
  uint64_t v101 = (char *)&v96 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6E8);
  uint64_t v118 = *(void *)(v110 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v110);
  uint64_t v122 = (char *)&v96 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v117 = (char *)&v96 - v19;
  uint64_t v20 = sub_25C662B40();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v96 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = (int *)type metadata accessor for SingleEventView();
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v96 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6F0);
  uint64_t v115 = *(void *)(v116 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v116);
  v114 = (char *)&v96 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v96 - v29;
  uint64_t v109 = (char *)&v96 - v29;
  sub_25C6395D4(a1, (uint64_t)v26, (void (*)(void))type metadata accessor for RenderableEvent);
  v26[v24[5]] = 0;
  sub_25C663580();
  uint64_t v31 = &v26[v24[7]];
  *(void *)uint64_t v31 = swift_getKeyPath();
  v31[8] = 0;
  *((void *)v31 + 2) = 0x4030000000000000;
  *((void *)v31 + 3) = 0;
  v31[32] = 1;
  *((void *)v31 + 5) = 1;
  *((void *)v31 + 6) = sub_25C64B95C;
  *((void *)v31 + 7) = 0;
  uint64_t v32 = &v26[v24[8]];
  *(void *)uint64_t v32 = swift_getKeyPath();
  v32[8] = 0;
  *((_OWORD *)v32 + 1) = xmmword_25C664230;
  *((void *)v32 + 4) = 1;
  *((void *)v32 + 5) = sub_25C660C58;
  *((void *)v32 + 6) = 0;
  uint64_t v33 = &v26[v24[9]];
  *(void *)uint64_t v33 = swift_getKeyPath();
  v33[8] = 0;
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v23, *MEMORY[0x263F76968], v20);
  sub_25C639414((unint64_t *)&qword_26A5BC6F8, (void (*)(uint64_t))type metadata accessor for SingleEventView);
  uint64_t v34 = v114;
  sub_25C663270();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  sub_25C639628((uint64_t)v26, (void (*)(void))type metadata accessor for SingleEventView);
  (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v30, v34, v116);
  uint64_t v35 = sub_25C635124();
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  LOBYTE(v20) = v40 & 1;
  uint64_t v41 = (uint64_t)v97;
  sub_25C6630D0();
  uint64_t v42 = sub_25C6630E0();
  __swift_storeEnumTagSinglePayload(v41, 0, 1, v42);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v44 = v100;
  sub_25C62973C(v41, (uint64_t)v100 + *(int *)(v102 + 36), &qword_26A5BC6C8);
  uint64_t *v44 = KeyPath;
  sub_25C62973C((uint64_t)v44, (uint64_t)&v14[*(int *)(v98 + 44)], &qword_26A5BC6C0);
  *(void *)uint64_t v14 = v35;
  *((void *)v14 + 1) = v37;
  v14[16] = v20;
  *((void *)v14 + 3) = v39;
  sub_25C629930(v35, v37, v20);
  swift_bridgeObjectRetain();
  sub_25C63945C((uint64_t)v44, &qword_26A5BC6C0);
  sub_25C63945C(v41, &qword_26A5BC6C8);
  sub_25C629890(v35, v37, v20);
  swift_bridgeObjectRelease();
  LOBYTE(v39) = sub_25C663130();
  uint64_t v45 = v99;
  sub_25C62973C((uint64_t)v14, v99, &qword_26A5BC6D0);
  uint64_t v46 = v103;
  uint64_t v47 = v45 + *(int *)(v103 + 36);
  *(unsigned char *)uint64_t v47 = v39;
  *(_OWORD *)(v47 + 8) = 0u;
  *(_OWORD *)(v47 + 24) = 0u;
  *(unsigned char *)(v47 + 40) = 1;
  sub_25C63945C((uint64_t)v14, &qword_26A5BC6D0);
  uint64_t v48 = type metadata accessor for ConflictingEventConfirmationSnippet();
  uint64_t v49 = v96;
  unint64_t v50 = sub_25C63921C();
  uint64_t v51 = v101;
  sub_25C663290();
  sub_25C63945C(v45, &qword_26A5BC6D8);
  v126[0] = v46;
  v126[1] = v50;
  swift_getOpaqueTypeConformance2();
  uint64_t v52 = v122;
  uint64_t v53 = v104;
  sub_25C663280();
  (*(void (**)(char *, void *))(v105 + 8))(v51, v53);
  (*(void (**)(char *, char *, uint64_t))(v118 + 32))(v117, v52, v110);
  uint64_t v54 = sub_25C663090();
  uint64_t v55 = (uint64_t)v106;
  *(void *)v106 = v54;
  *(void *)(v55 + 8) = 0x4024000000000000;
  *(unsigned char *)(v55 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC718);
  v126[0] = *(void *)(v49 + *(int *)(v48 + 20));
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC720);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC728);
  sub_25C6298EC(&qword_26A5BC730, &qword_26A5BC720);
  sub_25C639338();
  sub_25C639414(&qword_26A5BC750, (void (*)(uint64_t))type metadata accessor for RenderableEvent);
  sub_25C663460();
  sub_25C6298EC(&qword_26A5BC758, &qword_26A5BC6B0);
  uint64_t v56 = v123;
  sub_25C663280();
  sub_25C63945C(v55, &qword_26A5BC6B0);
  (*(void (**)(char *, char *, uint64_t))(v121 + 32))(v119, v56, v111);
  uint64_t v105 = sub_25C663060();
  v104 = v57;
  char v59 = v58;
  v106 = v60;
  uint64_t v61 = type metadata accessor for CalendarButtonView(0);
  v126[3] = v61;
  uint64_t v62 = sub_25C639414(&qword_26A5BC5B0, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
  v126[4] = v62;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v126);
  boxed_opaque_existential_1[7] = MEMORY[0x263F6CD30];
  uint64_t v107 = (void (*)(void, void, void))sub_25C632D4C();
  boxed_opaque_existential_1[8] = (uint64_t)v107;
  *((unsigned char *)boxed_opaque_existential_1 + 32) = 0;
  *((unsigned char *)boxed_opaque_existential_1 + 72) = 1;
  uint64_t v64 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v65 = (char *)boxed_opaque_existential_1 + v64[6];
  uint64_t v66 = *MEMORY[0x263F774E0];
  uint64_t v67 = sub_25C663490();
  uint64_t v68 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v67 - 8) + 104);
  v68(v65, v66, v67);
  uint64_t v69 = v104;
  uint64_t *boxed_opaque_existential_1 = v105;
  boxed_opaque_existential_1[1] = (uint64_t)v69;
  *((unsigned char *)boxed_opaque_existential_1 + 16) = v59 & 1;
  boxed_opaque_existential_1[3] = (uint64_t)v106;
  *(uint64_t *)((char *)boxed_opaque_existential_1 + v64[7]) = 0;
  *(uint64_t *)((char *)boxed_opaque_existential_1 + v64[8]) = 0;
  uint64_t v70 = (char *)boxed_opaque_existential_1 + *(int *)(v61 + 20);
  *(void *)uint64_t v70 = swift_getKeyPath();
  v70[8] = 0;
  sub_25C663580();
  uint64_t v71 = sub_25C663060();
  uint64_t v73 = v72;
  char v75 = v74;
  uint64_t v77 = v76;
  v125[3] = v61;
  v125[4] = v62;
  char v78 = __swift_allocate_boxed_opaque_existential_1(v125);
  uint64_t v79 = v107;
  v78[7] = MEMORY[0x263F6CD30];
  v78[8] = (uint64_t)v79;
  *((unsigned char *)v78 + 32) = 2;
  *((unsigned char *)v78 + 72) = 1;
  v68((char *)v78 + v64[6], *MEMORY[0x263F774D8], v67);
  *char v78 = v71;
  v78[1] = v73;
  *((unsigned char *)v78 + 16) = v75 & 1;
  v78[3] = v77;
  *(uint64_t *)((char *)v78 + v64[7]) = 0;
  *(uint64_t *)((char *)v78 + v64[8]) = 0;
  uint64_t v80 = (char *)v78 + *(int *)(v61 + 20);
  *(void *)uint64_t v80 = swift_getKeyPath();
  v80[8] = 0;
  sub_25C663580();
  uint64_t v81 = v112;
  sub_25C6634C0();
  v104 = *(void **)(v115 + 16);
  uint64_t v82 = v114;
  uint64_t v83 = v116;
  ((void (*)(char *, char *, uint64_t))v104)(v114, v109, v116);
  uint64_t v107 = *(void (**)(void, void, void))(v118 + 16);
  uint64_t v84 = v110;
  v107(v122, v117, v110);
  v106 = *(void (**)(char *, char *, uint64_t))(v121 + 16);
  uint64_t v85 = v111;
  v106(v123, v119, v111);
  uint64_t v105 = *(void *)(v124 + 16);
  uint64_t v86 = v81;
  uint64_t v87 = v113;
  ((void (*)(char *, char *, uint64_t))v105)(v120, v86, v113);
  uint64_t v88 = v108;
  ((void (*)(uint64_t, char *, uint64_t))v104)(v108, v82, v83);
  uint64_t v89 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC760);
  v107(v88 + v89[12], v122, v84);
  v106((char *)(v88 + v89[16]), v123, v85);
  ((void (*)(uint64_t, char *, uint64_t))v105)(v88 + v89[20], v120, v87);
  uint64_t v90 = *(void (**)(char *, uint64_t))(v124 + 8);
  v124 += 8;
  v90(v112, v87);
  uint64_t v91 = *(void (**)(char *, uint64_t))(v121 + 8);
  v91(v119, v85);
  uint64_t v92 = *(void (**)(char *, uint64_t))(v118 + 8);
  v92(v117, v84);
  char v93 = *(void (**)(char *, uint64_t))(v115 + 8);
  uint64_t v94 = v116;
  v93(v109, v116);
  v90(v120, v113);
  v91(v123, v85);
  v92(v122, v84);
  return ((uint64_t (*)(char *, uint64_t))v93)(v114, v94);
}

uint64_t sub_25C636A04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for RenderableEvent();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C6395D4(a1, (uint64_t)v9, (void (*)(void))type metadata accessor for RenderableEvent);
  uint64_t v10 = sub_25C6629F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v10);
  uint64_t v11 = (int *)type metadata accessor for EventCellView();
  uint64_t v12 = a2 + v11[5];
  __swift_storeEnumTagSinglePayload(v12, 1, 1, v10);
  uint64_t v13 = a2 + v11[7];
  *(void *)uint64_t v13 = swift_getKeyPath();
  *(unsigned char *)(v13 + 8) = 0;
  *(void *)(v13 + 16) = 0x4030000000000000;
  *(void *)(v13 + 24) = 0;
  *(unsigned char *)(v13 + 32) = 1;
  *(void *)(v13 + 40) = 1;
  *(void *)(v13 + 48) = sub_25C64B95C;
  *(void *)(v13 + 56) = 0;
  sub_25C6394AC((uint64_t)v9, a2, (void (*)(void))type metadata accessor for RenderableEvent);
  sub_25C63950C((uint64_t)v6, v12);
  *(unsigned char *)(a2 + v11[6]) = 0;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC728);
  sub_25C6395D4(a1, a2 + *(int *)(v14 + 36), (void (*)(void))type metadata accessor for RenderableEvent);
  type metadata accessor for PunchoutToEventDetailsModifier();
  return sub_25C663580();
}

uint64_t sub_25C636BF4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v71 = a2;
  uint64_t v70 = sub_25C6634D0();
  uint64_t v76 = *(void *)(v70 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v70);
  uint64_t v69 = &v62[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v3);
  char v75 = &v62[-v5];
  uint64_t v6 = type metadata accessor for EventCellView();
  uint64_t v7 = (int *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v62[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v77 = &v62[-v11];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC660);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = &v62[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC668);
  uint64_t v68 = v15;
  uint64_t v74 = *(void *)(v15 - 8);
  uint64_t v16 = v74;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = &v62[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v72 = v19;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = &v62[-v20];
  uint64_t v73 = &v62[-v20];
  *(void *)uint64_t v14 = sub_25C663000();
  *((void *)v14 + 1) = 0;
  v14[16] = 1;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC670);
  sub_25C637374(a1, (uint64_t)&v14[*(int *)(v22 + 44)]);
  type metadata accessor for ConflictingEventConfirmationSnippet();
  sub_25C6298EC(&qword_26A5BC678, &qword_26A5BC660);
  sub_25C663290();
  sub_25C63945C((uint64_t)v14, &qword_26A5BC660);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v16 + 32))(v21, v19, v15);
  sub_25C6395D4(a1, (uint64_t)v10, (void (*)(void))type metadata accessor for RenderableEvent);
  uint64_t v23 = (uint64_t)&v10[v7[7]];
  uint64_t v24 = sub_25C6629F0();
  __swift_storeEnumTagSinglePayload(v23, 1, 1, v24);
  v10[v7[8]] = 0;
  uint64_t v25 = &v10[v7[9]];
  uint64_t v67 = v10;
  *(void *)uint64_t v25 = swift_getKeyPath();
  v25[8] = 0;
  *((void *)v25 + 2) = 0x4030000000000000;
  *((void *)v25 + 3) = 0;
  v25[32] = 1;
  *((void *)v25 + 5) = 1;
  *((void *)v25 + 6) = sub_25C64B95C;
  *((void *)v25 + 7) = 0;
  sub_25C6394AC((uint64_t)v10, (uint64_t)v77, (void (*)(void))type metadata accessor for EventCellView);
  uint64_t v26 = sub_25C663060();
  uint64_t v64 = v27;
  int v63 = v28;
  uint64_t v65 = v29;
  uint64_t v30 = type metadata accessor for CalendarButtonView(0);
  v79[3] = v30;
  uint64_t v31 = sub_25C639414(&qword_26A5BC5B0, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
  v79[4] = v31;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v79);
  boxed_opaque_existential_1[7] = MEMORY[0x263F6CD30];
  uint64_t v66 = (void (*)(void, void, void))sub_25C632D4C();
  boxed_opaque_existential_1[8] = (uint64_t)v66;
  *((unsigned char *)boxed_opaque_existential_1 + 32) = 0;
  *((unsigned char *)boxed_opaque_existential_1 + 72) = 1;
  uint64_t v33 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v34 = (char *)boxed_opaque_existential_1 + v33[6];
  uint64_t v35 = *MEMORY[0x263F774E0];
  uint64_t v36 = sub_25C663490();
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 104);
  v37(v34, v35, v36);
  uint64_t v38 = v64;
  uint64_t *boxed_opaque_existential_1 = v26;
  boxed_opaque_existential_1[1] = v38;
  *((unsigned char *)boxed_opaque_existential_1 + 16) = v63 & 1;
  boxed_opaque_existential_1[3] = v65;
  *(uint64_t *)((char *)boxed_opaque_existential_1 + v33[7]) = 0;
  *(uint64_t *)((char *)boxed_opaque_existential_1 + v33[8]) = 0;
  uint64_t v39 = (char *)boxed_opaque_existential_1 + *(int *)(v30 + 20);
  *(void *)uint64_t v39 = swift_getKeyPath();
  v39[8] = 0;
  sub_25C663580();
  uint64_t v40 = sub_25C663060();
  uint64_t v42 = v41;
  LOBYTE(v26) = v43;
  uint64_t v45 = v44;
  v78[3] = v30;
  v78[4] = v31;
  uint64_t v46 = __swift_allocate_boxed_opaque_existential_1(v78);
  uint64_t v47 = v66;
  v46[7] = MEMORY[0x263F6CD30];
  v46[8] = (uint64_t)v47;
  *((unsigned char *)v46 + 32) = 2;
  *((unsigned char *)v46 + 72) = 1;
  v37((char *)v46 + v33[6], *MEMORY[0x263F774D8], v36);
  *uint64_t v46 = v40;
  v46[1] = v42;
  *((unsigned char *)v46 + 16) = v26 & 1;
  v46[3] = v45;
  *(uint64_t *)((char *)v46 + v33[7]) = 0;
  *(uint64_t *)((char *)v46 + v33[8]) = 0;
  uint64_t v48 = (char *)v46 + *(int *)(v30 + 20);
  *(void *)uint64_t v48 = swift_getKeyPath();
  v48[8] = 0;
  sub_25C663580();
  uint64_t v49 = v75;
  sub_25C6634C0();
  unint64_t v50 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v74 + 16);
  uint64_t v51 = v72;
  uint64_t v52 = v68;
  v50(v72, v73, v68);
  uint64_t v53 = (uint64_t)v67;
  sub_25C6395D4((uint64_t)v77, (uint64_t)v67, (void (*)(void))type metadata accessor for EventCellView);
  uint64_t v66 = *(void (**)(void, void, void))(v76 + 16);
  uint64_t v54 = v69;
  uint64_t v55 = v49;
  uint64_t v56 = v70;
  v66(v69, v55, v70);
  uint64_t v57 = v71;
  v50(v71, v51, v52);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC680);
  sub_25C6395D4(v53, (uint64_t)&v57[*(int *)(v58 + 48)], (void (*)(void))type metadata accessor for EventCellView);
  v66(&v57[*(int *)(v58 + 64)], v54, v56);
  char v59 = *(void (**)(unsigned char *, uint64_t))(v76 + 8);
  v59(v75, v56);
  sub_25C639628((uint64_t)v77, (void (*)(void))type metadata accessor for EventCellView);
  uint64_t v60 = *(void (**)(unsigned char *, uint64_t))(v74 + 8);
  v60(v73, v52);
  v59(v54, v56);
  sub_25C639628(v53, (void (*)(void))type metadata accessor for EventCellView);
  return ((uint64_t (*)(unsigned char *, uint64_t))v60)(v72, v52);
}

uint64_t sub_25C637374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v3 = sub_25C663050();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC688);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (uint64_t *)((char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC690);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_25C6629F0();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DateHeaderView();
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v58 = (uint64_t)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v56 - v16;
  sub_25C662CE0();
  sub_25C662880();
  *uint64_t v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC698);
  swift_storeEnumTagMultiPayload();
  uint64_t *v6 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6A0);
  swift_storeEnumTagMultiPayload();
  uint64_t v56 = v17;
  sub_25C65A7E0((uint64_t)v12, (uint64_t)v9, (uint64_t)v6, (uint64_t)v17);
  sub_25C663040();
  sub_25C663030();
  uint64_t v18 = type metadata accessor for ConflictingEventConfirmationSnippet();
  uint64_t v19 = *(int *)(v18 + 20);
  uint64_t v57 = a1;
  uint64_t v61 = *(void *)(*(void *)(a1 + v19) + 16);
  sub_25C663010();
  sub_25C663030();
  sub_25C663070();
  if (qword_26A5BC340 != -1) {
    swift_once();
  }
  id v20 = (id)qword_26A5BE0E0;
  uint64_t v21 = sub_25C663220();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  int v60 = sub_25C663110();
  uint64_t v26 = sub_25C6631D0();
  uint64_t v28 = v27;
  char v30 = v29 & 1;
  sub_25C629890(v21, v23, v25);
  swift_bridgeObjectRelease();
  sub_25C6631C0();
  uint64_t v31 = sub_25C663200();
  uint64_t v33 = v32;
  char v35 = v34;
  uint64_t v37 = v36;
  swift_release();
  sub_25C629890(v26, v28, v30);
  swift_bridgeObjectRelease();
  char v38 = sub_25C663170();
  char v39 = *(unsigned char *)(v57 + *(int *)(v18 + 32) + 32);
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  if ((v39 & 1) == 0)
  {
    sub_25C662D30();
    uint64_t v40 = v44;
    uint64_t v41 = v45;
    uint64_t v42 = v46;
    uint64_t v43 = v47;
  }
  char v48 = v35 & 1;
  uint64_t v49 = (uint64_t)v56;
  uint64_t v50 = v58;
  sub_25C6395D4((uint64_t)v56, v58, (void (*)(void))type metadata accessor for DateHeaderView);
  uint64_t v51 = v59;
  sub_25C6395D4(v50, v59, (void (*)(void))type metadata accessor for DateHeaderView);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6A8);
  uint64_t v53 = v51 + *(int *)(v52 + 48);
  *(void *)uint64_t v53 = 0;
  *(unsigned char *)(v53 + 8) = 1;
  uint64_t v54 = v51 + *(int *)(v52 + 64);
  *(void *)uint64_t v54 = v31;
  *(void *)(v54 + 8) = v33;
  *(unsigned char *)(v54 + 16) = v48;
  *(void *)(v54 + 24) = v37;
  *(unsigned char *)(v54 + 32) = v38;
  *(void *)(v54 + 40) = v40;
  *(void *)(v54 + 48) = v41;
  *(void *)(v54 + 56) = v42;
  *(void *)(v54 + 64) = v43;
  *(unsigned char *)(v54 + 72) = v39;
  sub_25C629930(v31, v33, v48);
  swift_bridgeObjectRetain();
  sub_25C639628(v49, (void (*)(void))type metadata accessor for DateHeaderView);
  sub_25C629890(v31, v33, v48);
  swift_bridgeObjectRelease();
  return sub_25C639628(v50, (void (*)(void))type metadata accessor for DateHeaderView);
}

uint64_t sub_25C6378C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = sub_25C662CE0();
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for RenderableEvent();
  MEMORY[0x270FA5388](v11 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = (int *)type metadata accessor for ConflictingEventConfirmationSnippet();
  uint64_t v16 = a4 + v15[6];
  *(void *)uint64_t v16 = swift_getKeyPath();
  *(unsigned char *)(v16 + 8) = 0;
  sub_25C663580();
  uint64_t v17 = a4 + v15[8];
  *(void *)uint64_t v17 = swift_getKeyPath();
  *(unsigned char *)(v17 + 8) = 0;
  *(void *)(v17 + 16) = 0x4030000000000000;
  *(void *)(v17 + 24) = 0;
  *(unsigned char *)(v17 + 32) = 1;
  *(void *)(v17 + 40) = 1;
  *(void *)(v17 + 48) = sub_25C64B95C;
  *(void *)(v17 + 56) = 0;
  sub_25C6395D4(a1, v10, MEMORY[0x263F6CD78]);
  id v18 = a3;
  sub_25C62B570(v10, v18, v14);
  if (v23)
  {

    swift_bridgeObjectRelease();
    sub_25C639628(a1, MEMORY[0x263F6CD78]);
    sub_25C62C6E4(*(void *)v16, *(unsigned char *)(v16 + 8));
    sub_25C663590();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_7();
    v20();
    sub_25C62C6E4(*(void *)v17, *(unsigned char *)(v17 + 8));
    return swift_release();
  }
  else
  {
    sub_25C6394AC(v14, a4, (void (*)(void))type metadata accessor for RenderableEvent);
    id v19 = v18;
    uint64_t v22 = sub_25C637B94(a2, v19);

    sub_25C639628(a1, MEMORY[0x263F6CD78]);
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(a4 + v15[5]) = v22;
  }
  return result;
}

uint64_t sub_25C637B94(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_25C662CE0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v22 = (uint64_t)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for RenderableEvent();
  uint64_t v21 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    uint64_t v23 = MEMORY[0x263F8EE78];
    sub_25C64B730(0, v11, 0);
    uint64_t v12 = v23;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v20 = *(void *)(v6 + 72);
    while (1)
    {
      uint64_t v14 = v22;
      sub_25C6395D4(v13, v22, MEMORY[0x263F6CD78]);
      id v15 = a2;
      sub_25C62B570(v14, v15, (uint64_t)v10);
      if (v2) {
        break;
      }
      uint64_t v23 = v12;
      unint64_t v17 = *(void *)(v12 + 16);
      unint64_t v16 = *(void *)(v12 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_25C64B730(v16 > 1, v17 + 1, 1);
        uint64_t v12 = v23;
      }
      *(void *)(v12 + 16) = v17 + 1;
      sub_25C6394AC((uint64_t)v10, v12+ ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(void *)(v21 + 72) * v17, (void (*)(void))type metadata accessor for RenderableEvent);
      v13 += v20;
      if (!--v11)
      {

        return v12;
      }
    }

    swift_release();
  }
  else
  {

    return MEMORY[0x263F8EE78];
  }
  return v12;
}

uint64_t sub_25C637E0C()
{
  return sub_25C662F60();
}

uint64_t sub_25C637E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25C6387E0(a1, a2, a3, a4, MEMORY[0x263F07690], MEMORY[0x263F19590]);
}

uint64_t sub_25C637E5C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C662F80();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25C637E8C()
{
  return sub_25C662F90();
}

void sub_25C637EB4()
{
  OUTLINED_FUNCTION_6();
  char v1 = v0;
  sub_25C662FF0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_3_0();
  if ((v1 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v3 = sub_25C6637B0();
    uint64_t v4 = sub_25C663120();
    if (os_log_type_enabled(v4, v3))
    {
      swift_slowAlloc();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_14(4.8149e-34);
      uint64_t v6 = sub_25C638888(0x6D6F696449585256, 0xE800000000000000, v5);
      OUTLINED_FUNCTION_9(v6);
      OUTLINED_FUNCTION_13(&dword_25C626000, v7, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }

    sub_25C662FE0();
    swift_getAtKeyPath();
    uint64_t v9 = OUTLINED_FUNCTION_10();
    v10(v9);
  }
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_25C63800C()
{
  return sub_25C638314((uint64_t (*)(uint64_t))sub_25C6359D8);
}

uint64_t objectdestroyTm_2()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = type metadata accessor for ConflictingEventConfirmationSnippet();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_25C662CE0();
  sub_25C6628A0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v5();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v3 + *(int *)(v4 + 48);
  uint64_t v7 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7))
  {
    uint64_t v8 = v6 + *(int *)(v7 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_25C6629F0();
      OUTLINED_FUNCTION_1();
      (*(void (**)(uint64_t))(v9 + 8))(v8);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = v3 + *(int *)(v4 + 56);
  uint64_t v11 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v10, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  type metadata accessor for RenderableEvent();
  sub_25C662C10();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v12();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C62C6E4(*(void *)(v3 + *(int *)(v1 + 24)), *(unsigned char *)(v3 + *(int *)(v1 + 24) + 8));
  sub_25C663590();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v13();
  sub_25C62C6E4(*(void *)(v3 + *(int *)(v1 + 32)), *(unsigned char *)(v3 + *(int *)(v1 + 32) + 8));
  swift_release();
  OUTLINED_FUNCTION_5_0();
  return MEMORY[0x270FA0238](v14, v15, v16);
}

uint64_t sub_25C6382FC()
{
  return sub_25C638314((uint64_t (*)(uint64_t))sub_25C636BF4);
}

uint64_t sub_25C638314(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for ConflictingEventConfirmationSnippet() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

void sub_25C6383A0()
{
  OUTLINED_FUNCTION_6();
  char v1 = v0;
  sub_25C662FF0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_3_0();
  if ((v1 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v3 = sub_25C6637B0();
    uint64_t v4 = sub_25C663120();
    if (os_log_type_enabled(v4, v3))
    {
      swift_slowAlloc();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_14(4.8149e-34);
      uint64_t v6 = sub_25C638888(1819242306, 0xE400000000000000, v5);
      OUTLINED_FUNCTION_9(v6);
      OUTLINED_FUNCTION_13(&dword_25C626000, v7, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }

    sub_25C662FE0();
    swift_getAtKeyPath();
    uint64_t v9 = OUTLINED_FUNCTION_10();
    v10(v9);
  }
  OUTLINED_FUNCTION_5_0();
}

void sub_25C6384F0()
{
}

void sub_25C638520()
{
}

void sub_25C638554()
{
  OUTLINED_FUNCTION_6();
  unint64_t v3 = v2;
  uint64_t v23 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v0;
  uint64_t v11 = v10;
  uint64_t v12 = sub_25C662FF0();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_3_0();
  __swift_instantiateConcreteTypeFromMangledName(v8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_3();
  uint64_t v19 = v18 - v17;
  sub_25C62973C(v9, v18 - v17, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6(0);
    OUTLINED_FUNCTION_1();
    (*(void (**)(uint8_t *, uint64_t))(v20 + 32))(v11, v19);
  }
  else
  {
    os_log_type_t v21 = sub_25C6637B0();
    uint64_t v22 = sub_25C663120();
    if (os_log_type_enabled(v22, v21))
    {
      swift_slowAlloc();
      uint64_t v24 = OUTLINED_FUNCTION_11();
      *(_DWORD *)uint64_t v11 = 136315138;
      sub_25C638888(v23, v3, &v24);
      sub_25C663820();
      _os_log_impl(&dword_25C626000, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }

    sub_25C662FE0();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v12);
  }
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_25C638790()
{
  return sub_25C662F70();
}

uint64_t sub_25C6387B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25C6387E0(a1, a2, a3, a4, MEMORY[0x263F07920], MEMORY[0x263F195E0]);
}

uint64_t sub_25C6387E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

uint64_t sub_25C638888(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25C63895C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25C639574((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25C639574((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25C63895C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25C638AB4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25C663830();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25C638B8C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25C663850();
    if (!v8)
    {
      uint64_t result = sub_25C663860();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_25C638AB4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C663890();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25C638B8C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C638C24(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25C638E00(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25C638E00((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C638C24(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25C663750();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_25C638D98(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25C663840();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25C663890();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25C663860();
  __break(1u);
  return result;
}

void *sub_25C638D98(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC768);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25C638E00(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC768);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25C638FB0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C638ED8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25C638ED8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C663890();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25C638FB0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25C663890();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_25C639040(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6C8);
  MEMORY[0x270FA5388](v2 - 8);
  sub_25C62973C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26A5BC6C8);
  return sub_25C662F30();
}

uint64_t sub_25C6390D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C662F80();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25C639104()
{
  return sub_25C662F90();
}

uint64_t sub_25C63912C()
{
  return sub_25C662F60();
}

uint64_t sub_25C639150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25C6387E0(a1, a2, a3, a4, MEMORY[0x263F07690], MEMORY[0x263F19590]);
}

uint64_t sub_25C639190()
{
  return sub_25C662F70();
}

uint64_t sub_25C6391B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25C6387E0(a1, a2, a3, a4, MEMORY[0x263F07920], MEMORY[0x263F195E0]);
}

uint64_t sub_25C6391F4()
{
  return sub_25C662F20();
}

unint64_t sub_25C63921C()
{
  unint64_t result = qword_26A5BC700;
  if (!qword_26A5BC700)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC6D8);
    sub_25C639298();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC700);
  }
  return result;
}

unint64_t sub_25C639298()
{
  unint64_t result = qword_26A5BC708;
  if (!qword_26A5BC708)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC6D0);
    sub_25C6298EC(&qword_26A5BC710, &qword_26A5BC6C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC708);
  }
  return result;
}

unint64_t sub_25C639338()
{
  unint64_t result = qword_26A5BC738;
  if (!qword_26A5BC738)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC728);
    sub_25C639414(&qword_26A5BC740, (void (*)(uint64_t))type metadata accessor for EventCellView);
    sub_25C639414(&qword_26A5BC748, (void (*)(uint64_t))type metadata accessor for PunchoutToEventDetailsModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC738);
  }
  return result;
}

uint64_t sub_25C639414(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C63945C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v3();
  return a1;
}

uint64_t sub_25C6394AC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25C63950C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C639574(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25C6395D4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = OUTLINED_FUNCTION_2();
  v5(v4);
  return a2;
}

uint64_t sub_25C639628(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v3();
  return a1;
}

unint64_t sub_25C639680()
{
  unint64_t result = qword_26A5BC770;
  if (!qword_26A5BC770)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC778);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC638);
    sub_25C6298EC(&qword_26A5BC640, &qword_26A5BC638);
    swift_getOpaqueTypeConformance2();
    sub_25C6298EC(&qword_26A5BC648, &qword_26A5BC610);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC770);
  }
  return result;
}

void OUTLINED_FUNCTION_8()
{
  JUMPOUT(0x26118DF90);
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_25C663820();
}

uint64_t OUTLINED_FUNCTION_10()
{
  sub_25C62C6E4(v0, 0);
  return v1;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_14(float a1)
{
  *uint64_t v1 = a1;
}

unint64_t OUTLINED_FUNCTION_16()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_25C6398B0()
{
  uint64_t v1 = type metadata accessor for SingleEventWithButtonsSnippet();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  sub_25C63E1B0(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for SingleEventWithButtonsSnippet);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_25C63E150((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (void (*)(void))type metadata accessor for SingleEventWithButtonsSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC7A0);
  sub_25C6298EC(&qword_26A5BC7A8, &qword_26A5BC7A0);
  return sub_25C6634A0();
}

uint64_t sub_25C639A18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC7B0);
  MEMORY[0x270FA5388](v33);
  unint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC7B8);
  uint64_t v5 = *(void *)(v34 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v34);
  uint64_t v32 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v31 = (char *)&v30 - v8;
  uint64_t v9 = type metadata accessor for SingleEventView();
  uint64_t v10 = (int *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v30 - v14;
  sub_25C63E1B0(a1, (uint64_t)v13, (void (*)(void))type metadata accessor for RenderableEvent);
  uint64_t v16 = type metadata accessor for SingleEventWithButtonsSnippet();
  v13[v10[7]] = *(unsigned char *)(a1 + *(int *)(v16 + 36));
  sub_25C663580();
  uint64_t v17 = &v13[v10[9]];
  *(void *)uint64_t v17 = swift_getKeyPath();
  v17[8] = 0;
  *((void *)v17 + 2) = 0x4030000000000000;
  *((void *)v17 + 3) = 0;
  v17[32] = 1;
  *((void *)v17 + 5) = 1;
  *((void *)v17 + 6) = sub_25C64B95C;
  *((void *)v17 + 7) = 0;
  uint64_t v18 = &v13[v10[10]];
  *(void *)uint64_t v18 = swift_getKeyPath();
  v18[8] = 0;
  *((_OWORD *)v18 + 1) = xmmword_25C664230;
  *((void *)v18 + 4) = 1;
  *((void *)v18 + 5) = sub_25C660C58;
  *((void *)v18 + 6) = 0;
  uint64_t v19 = &v13[v10[11]];
  *(void *)uint64_t v19 = swift_getKeyPath();
  v19[8] = 0;
  sub_25C63E150((uint64_t)v13, (uint64_t)v15, (void (*)(void))type metadata accessor for SingleEventView);
  uint64_t v20 = *(void *)(a1 + *(int *)(v16 + 44) + 16);
  *(void *)unint64_t v4 = sub_25C663090();
  *((void *)v4 + 1) = v20;
  v4[16] = 0;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC7C0);
  sub_25C639E3C(a1, (uint64_t)&v4[*(int *)(v21 + 44)]);
  sub_25C6298EC(&qword_26A5BC7C8, &qword_26A5BC7B0);
  uint64_t v22 = v31;
  sub_25C663290();
  sub_25C63945C((uint64_t)v4, &qword_26A5BC7B0);
  sub_25C63E1B0((uint64_t)v15, (uint64_t)v13, (void (*)(void))type metadata accessor for SingleEventView);
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v24 = v32;
  uint64_t v25 = v34;
  v23(v32, v22, v34);
  uint64_t v26 = v35;
  sub_25C63E1B0((uint64_t)v13, v35, (void (*)(void))type metadata accessor for SingleEventView);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC7D0);
  v23((char *)(v26 + *(int *)(v27 + 48)), v24, v25);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v5 + 8);
  v28(v22, v25);
  sub_25C63E0B4((uint64_t)v15, (void (*)(void))type metadata accessor for SingleEventView);
  v28(v24, v25);
  return sub_25C63E0B4((uint64_t)v13, (void (*)(void))type metadata accessor for SingleEventView);
}

uint64_t sub_25C639E3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v81 = a2;
  uint64_t v3 = type metadata accessor for CalendarButtonView(0);
  MEMORY[0x270FA5388](v3);
  uint64_t v67 = (uint64_t)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC7D8);
  uint64_t v68 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v66 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC780);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = type metadata accessor for CalendarButtonView.Model(0);
  MEMORY[0x270FA5388](v76);
  uint64_t v65 = (uint64_t)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC7E0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v79 = (uint64_t)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  char v78 = (char *)&v63 - v13;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC7E8);
  MEMORY[0x270FA5388](v74);
  uint64_t v15 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC7F0);
  uint64_t v16 = *(void *)(v75 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v75);
  uint64_t v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v63 - v20;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC7F8);
  MEMORY[0x270FA5388](v70);
  uint64_t v72 = (char *)&v63 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_25C6634D0();
  uint64_t v23 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v25 = (char *)&v63 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC800);
  uint64_t v27 = MEMORY[0x270FA5388](v26 - 8);
  char v29 = (char *)&v63 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v71 = (char *)&v63 - v30;
  uint64_t v31 = type metadata accessor for SingleEventWithButtonsSnippet();
  BOOL v32 = *(unsigned char *)(a1 + *(int *)(v31 + 32)) == 1;
  uint64_t v77 = a1;
  uint64_t v69 = v31;
  if (v32)
  {
    uint64_t v33 = a1 + *(int *)(v31 + 20);
    uint64_t v85 = v3;
    uint64_t v34 = sub_25C63E108(&qword_26A5BC5B0, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
    uint64_t v86 = v34;
    uint64_t v35 = __swift_allocate_boxed_opaque_existential_1(&v83);
    uint64_t v64 = v25;
    sub_25C63E1B0(v33, (uint64_t)v35, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
    uint64_t v36 = (char *)v35 + *(int *)(v3 + 20);
    *(void *)uint64_t v36 = swift_getKeyPath();
    v36[8] = 0;
    uint64_t v50 = v69;
    sub_25C663580();
    uint64_t v37 = a1 + *(int *)(v50 + 24);
    v82[3] = v3;
    v82[4] = v34;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v82);
    sub_25C63E1B0(v37, (uint64_t)boxed_opaque_existential_1, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
    char v39 = (char *)boxed_opaque_existential_1 + *(int *)(v3 + 20);
    *(void *)char v39 = swift_getKeyPath();
    v39[8] = 0;
    sub_25C663580();
    uint64_t v40 = v64;
    sub_25C6634C0();
    uint64_t v41 = v73;
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v72, v40, v73);
    swift_storeEnumTagMultiPayload();
    sub_25C63E108(&qword_26A5BC818, MEMORY[0x263F77660]);
    uint64_t v42 = sub_25C6298EC(&qword_26A5BC810, &qword_26A5BC7E8);
    uint64_t v83 = v74;
    uint64_t v84 = v42;
    swift_getOpaqueTypeConformance2();
    uint64_t v43 = v71;
    sub_25C6630F0();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v40, v41);
    uint64_t v49 = (uint64_t)v43;
  }
  else
  {
    *(void *)uint64_t v15 = sub_25C663090();
    *((void *)v15 + 1) = 0;
    v15[16] = 1;
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC808);
    sub_25C63A890(a1, (uint64_t)&v15[*(int *)(v44 + 44)]);
    uint64_t v45 = sub_25C6298EC(&qword_26A5BC810, &qword_26A5BC7E8);
    uint64_t v46 = v74;
    sub_25C663280();
    sub_25C63945C((uint64_t)v15, &qword_26A5BC7E8);
    uint64_t v47 = v19;
    uint64_t v48 = v75;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v47, v75);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v72, v21, v48);
    swift_storeEnumTagMultiPayload();
    sub_25C63E108(&qword_26A5BC818, MEMORY[0x263F77660]);
    uint64_t v83 = v46;
    uint64_t v84 = v45;
    swift_getOpaqueTypeConformance2();
    uint64_t v49 = (uint64_t)v71;
    sub_25C6630F0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v48);
    uint64_t v50 = v69;
  }
  sub_25C62973C(v77 + *(int *)(v50 + 28), (uint64_t)v8, &qword_26A5BC780);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v76) == 1)
  {
    sub_25C63945C((uint64_t)v8, &qword_26A5BC780);
    uint64_t v51 = 1;
    uint64_t v52 = v80;
    uint64_t v53 = (uint64_t)v78;
  }
  else
  {
    uint64_t v54 = v65;
    sub_25C63E150((uint64_t)v8, v65, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
    uint64_t v55 = v67;
    sub_25C63E1B0(v54, v67, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
    uint64_t v56 = v55 + *(int *)(v3 + 20);
    *(void *)uint64_t v56 = swift_getKeyPath();
    *(unsigned char *)(v56 + 8) = 0;
    sub_25C663580();
    sub_25C63E108((unint64_t *)&qword_26A5BC5D8, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
    uint64_t v57 = v66;
    sub_25C663280();
    sub_25C63E0B4(v55, (void (*)(void))type metadata accessor for CalendarButtonView);
    sub_25C63E0B4(v54, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
    uint64_t v53 = (uint64_t)v78;
    uint64_t v58 = v57;
    uint64_t v52 = v80;
    (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v78, v58, v80);
    uint64_t v51 = 0;
  }
  __swift_storeEnumTagSinglePayload(v53, v51, 1, v52);
  sub_25C62973C(v49, (uint64_t)v29, &qword_26A5BC800);
  uint64_t v59 = v79;
  sub_25C62973C(v53, v79, &qword_26A5BC7E0);
  uint64_t v60 = v81;
  sub_25C62973C((uint64_t)v29, v81, &qword_26A5BC800);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC820);
  sub_25C62973C(v59, v60 + *(int *)(v61 + 48), &qword_26A5BC7E0);
  sub_25C63945C(v53, &qword_26A5BC7E0);
  sub_25C63945C(v49, &qword_26A5BC800);
  sub_25C63945C(v59, &qword_26A5BC7E0);
  return sub_25C63945C((uint64_t)v29, &qword_26A5BC800);
}

uint64_t sub_25C63A890@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = type metadata accessor for CalendarButtonView(0);
  uint64_t v4 = v3 - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v22 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = type metadata accessor for SingleEventWithButtonsSnippet();
  sub_25C63E1B0(a1 + *(int *)(v16 + 20), (uint64_t)v13, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  uint64_t v17 = &v13[*(int *)(v4 + 28)];
  *(void *)uint64_t v17 = swift_getKeyPath();
  v17[8] = 0;
  sub_25C663580();
  sub_25C63E150((uint64_t)v13, (uint64_t)v15, (void (*)(void))type metadata accessor for CalendarButtonView);
  sub_25C63E1B0(a1 + *(int *)(v16 + 24), (uint64_t)v10, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  uint64_t v18 = &v10[*(int *)(v4 + 28)];
  *(void *)uint64_t v18 = swift_getKeyPath();
  v18[8] = 0;
  sub_25C663580();
  sub_25C63E150((uint64_t)v10, (uint64_t)v13, (void (*)(void))type metadata accessor for CalendarButtonView);
  sub_25C63E1B0((uint64_t)v15, (uint64_t)v10, (void (*)(void))type metadata accessor for CalendarButtonView);
  sub_25C63E1B0((uint64_t)v13, (uint64_t)v7, (void (*)(void))type metadata accessor for CalendarButtonView);
  uint64_t v19 = v23;
  sub_25C63E1B0((uint64_t)v10, v23, (void (*)(void))type metadata accessor for CalendarButtonView);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC828);
  sub_25C63E1B0((uint64_t)v7, v19 + *(int *)(v20 + 48), (void (*)(void))type metadata accessor for CalendarButtonView);
  sub_25C63E0B4((uint64_t)v13, (void (*)(void))type metadata accessor for CalendarButtonView);
  sub_25C63E0B4((uint64_t)v15, (void (*)(void))type metadata accessor for CalendarButtonView);
  sub_25C63E0B4((uint64_t)v7, (void (*)(void))type metadata accessor for CalendarButtonView);
  return sub_25C63E0B4((uint64_t)v10, (void (*)(void))type metadata accessor for CalendarButtonView);
}

uint64_t type metadata accessor for SingleEventWithButtonsSnippet()
{
  uint64_t result = qword_26A5BC788;
  if (!qword_26A5BC788) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_25C63AB50(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    long long v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    uint64_t v11 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v11;
    uint64_t v12 = (int *)sub_25C662CE0();
    uint64_t v13 = v12[8];
    uint64_t v88 = (uint64_t)a2 + v13;
    uint64_t v89 = (char *)v4 + v13;
    uint64_t v14 = sub_25C6628A0();
    uint64_t v87 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v87(v89, v88, v14);
    *((unsigned char *)v4 + v12[9]) = *((unsigned char *)a2 + v12[9]);
    uint64_t v15 = v12[10];
    uint64_t v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = v12[11];
    uint64_t v20 = (void *)((char *)v4 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = v12[12];
    uint64_t v24 = (char *)v4 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = sub_25C662CD0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
      memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      *uint64_t v24 = *v25;
      *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
      uint64_t v29 = *(int *)(v26 + 28);
      uint64_t v30 = &v24[v29];
      uint64_t v31 = &v25[v29];
      uint64_t v32 = sub_25C662CC0();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        uint64_t v33 = sub_25C6629F0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v33 - 8) + 16))(v30, v31, v33);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
    }
    *(void *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    uint64_t v34 = v12[14];
    uint64_t v35 = (char *)v4 + v34;
    uint64_t v36 = (char *)a2 + v34;
    uint64_t v37 = sub_25C662B70();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
      memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
    }
    uint64_t v39 = type metadata accessor for RenderableEvent();
    uint64_t v40 = *(int *)(v39 + 20);
    uint64_t v41 = (char *)v4 + v40;
    uint64_t v42 = (uint64_t)a2 + v40;
    uint64_t v43 = sub_25C662C10();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
    uint64_t v44 = *(int *)(v39 + 24);
    uint64_t v45 = (void *)((char *)v4 + v44);
    uint64_t v46 = (uint64_t *)((char *)a2 + v44);
    uint64_t v47 = v46[1];
    *uint64_t v45 = *v46;
    v45[1] = v47;
    uint64_t v48 = a3[5];
    uint64_t v49 = (char *)v4 + v48;
    uint64_t v50 = (uint64_t)a2 + v48;
    uint64_t v51 = *(uint64_t *)((char *)a2 + v48 + 8);
    *(void *)uint64_t v49 = *(uint64_t *)((char *)a2 + v48);
    *((void *)v49 + 1) = v51;
    v49[16] = *((unsigned char *)a2 + v48 + 16);
    *((void *)v49 + 3) = *(uint64_t *)((char *)a2 + v48 + 24);
    char v52 = *((unsigned char *)a2 + v48 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v52)
    {
      long long v53 = *(_OWORD *)(v50 + 56);
      *(_OWORD *)(v49 + 56) = v53;
      (**(void (***)(uint64_t, uint64_t))(v53 - 8))((uint64_t)(v49 + 32), v50 + 32);
    }
    else
    {
      uint64_t v54 = *(void *)(v50 + 40);
      *((void *)v49 + 4) = *(void *)(v50 + 32);
      *((void *)v49 + 5) = v54;
      swift_retain();
    }
    v49[72] = v52;
    uint64_t v55 = (int *)type metadata accessor for CalendarButtonView.Model(0);
    uint64_t v56 = v55[6];
    uint64_t v57 = &v49[v56];
    uint64_t v58 = v50 + v56;
    uint64_t v59 = sub_25C663490();
    uint64_t v90 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v59 - 8) + 16);
    v90(v57, v58, v59);
    *(void *)&v49[v55[7]] = *(void *)(v50 + v55[7]);
    *(void *)&v49[v55[8]] = *(void *)(v50 + v55[8]);
    uint64_t v60 = a3[6];
    uint64_t v61 = (char *)v4 + v60;
    uint64_t v62 = (uint64_t)a2 + v60;
    uint64_t v63 = *(uint64_t *)((char *)a2 + v60 + 8);
    *(void *)uint64_t v61 = *(uint64_t *)((char *)a2 + v60);
    *((void *)v61 + 1) = v63;
    v61[16] = *((unsigned char *)a2 + v60 + 16);
    *((void *)v61 + 3) = *(uint64_t *)((char *)a2 + v60 + 24);
    char v64 = *((unsigned char *)a2 + v60 + 72);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v64)
    {
      long long v65 = *(_OWORD *)(v62 + 56);
      *(_OWORD *)(v61 + 56) = v65;
      (**(void (***)(uint64_t, uint64_t))(v65 - 8))((uint64_t)(v61 + 32), v62 + 32);
    }
    else
    {
      uint64_t v66 = *(void *)(v62 + 40);
      *((void *)v61 + 4) = *(void *)(v62 + 32);
      *((void *)v61 + 5) = v66;
      swift_retain();
    }
    v61[72] = v64;
    v90(&v61[v55[6]], v62 + v55[6], v59);
    *(void *)&v61[v55[7]] = *(void *)(v62 + v55[7]);
    *(void *)&v61[v55[8]] = *(void *)(v62 + v55[8]);
    uint64_t v67 = a3[7];
    uint64_t v68 = (void *)((char *)v4 + v67);
    uint64_t v69 = (uint64_t *)((char *)a2 + v67);
    swift_retain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v69, 1, (uint64_t)v55))
    {
      uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC780);
      memcpy(v68, v69, *(void *)(*(void *)(v70 - 8) + 64));
    }
    else
    {
      uint64_t v71 = v69[1];
      *uint64_t v68 = *v69;
      v68[1] = v71;
      *((unsigned char *)v68 + 16) = *((unsigned char *)v69 + 16);
      v68[3] = v69[3];
      char v72 = *((unsigned char *)v69 + 72);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v72)
      {
        long long v73 = *(_OWORD *)(v69 + 7);
        *(_OWORD *)(v68 + 7) = v73;
        (**(void (***)(uint64_t, uint64_t))(v73 - 8))((uint64_t)(v68 + 4), (uint64_t)(v69 + 4));
      }
      else
      {
        uint64_t v74 = v69[5];
        v68[4] = v69[4];
        v68[5] = v74;
        swift_retain();
      }
      *((unsigned char *)v68 + 72) = v72;
      v90((char *)v68 + v55[6], (uint64_t)v69 + v55[6], v59);
      *(void *)((char *)v68 + v55[7]) = *(void *)((char *)v69 + v55[7]);
      *(void *)((char *)v68 + v55[8]) = *(void *)((char *)v69 + v55[8]);
      swift_retain();
      swift_retain();
      __swift_storeEnumTagSinglePayload((uint64_t)v68, 0, 1, (uint64_t)v55);
    }
    uint64_t v75 = a3[9];
    *((unsigned char *)v4 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    *((unsigned char *)v4 + v75) = *((unsigned char *)a2 + v75);
    uint64_t v76 = a3[10];
    uint64_t v77 = (char *)v4 + v76;
    uint64_t v78 = (uint64_t)a2 + v76;
    uint64_t v79 = sub_25C663590();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v79 - 8) + 16))(v77, v78, v79);
    uint64_t v80 = a3[11];
    uint64_t v81 = (char *)v4 + v80;
    uint64_t v82 = (uint64_t)a2 + v80;
    uint64_t v83 = *(uint64_t *)((char *)a2 + v80);
    LOBYTE(v77) = *(unsigned char *)(v82 + 8);
    sub_25C62C450(v83, (char)v77);
    *(void *)uint64_t v81 = v83;
    v81[8] = (char)v77;
    *((_OWORD *)v81 + 1) = *(_OWORD *)(v82 + 16);
    v81[32] = *(unsigned char *)(v82 + 32);
    uint64_t v84 = *(void *)(v82 + 48);
    uint64_t v85 = *(void *)(v82 + 56);
    *((void *)v81 + 5) = *(void *)(v82 + 40);
    *((void *)v81 + 6) = v84;
    *((void *)v81 + 7) = v85;
  }
  swift_retain();
  return v4;
}

uint64_t sub_25C63B2E0(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)sub_25C662CE0();
  uint64_t v5 = a1 + v4[8];
  uint64_t v6 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + v4[12];
  uint64_t v8 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    uint64_t v9 = v7 + *(int *)(v8 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      uint64_t v10 = sub_25C6629F0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = a1 + v4[14];
  uint64_t v12 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  uint64_t v13 = a1 + *(int *)(type metadata accessor for RenderableEvent() + 20);
  uint64_t v14 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  swift_bridgeObjectRelease();
  uint64_t v15 = a1 + a2[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v15 + 72)) {
    __swift_destroy_boxed_opaque_existential_1(v15 + 32);
  }
  else {
    swift_release();
  }
  uint64_t v16 = type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v17 = v15 + *(int *)(v16 + 24);
  uint64_t v18 = sub_25C663490();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8);
  v19(v17, v18);
  swift_release();
  swift_release();
  uint64_t v20 = a1 + a2[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v20 + 72)) {
    __swift_destroy_boxed_opaque_existential_1(v20 + 32);
  }
  else {
    swift_release();
  }
  v19(v20 + *(int *)(v16 + 24), v18);
  swift_release();
  swift_release();
  uint64_t v21 = a1 + a2[7];
  if (!__swift_getEnumTagSinglePayload(v21, 1, v16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(v21 + 72)) {
      __swift_destroy_boxed_opaque_existential_1(v21 + 32);
    }
    else {
      swift_release();
    }
    v19(v21 + *(int *)(v16 + 24), v18);
    swift_release();
    swift_release();
  }
  uint64_t v22 = a1 + a2[10];
  uint64_t v23 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);
  sub_25C62C6E4(*(void *)(a1 + a2[11]), *(unsigned char *)(a1 + a2[11] + 8));
  return swift_release();
}

uint64_t sub_25C63B6D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  long long v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v86 = a2 + v12;
  uint64_t v87 = a1 + v12;
  uint64_t v13 = sub_25C6628A0();
  uint64_t v85 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v85(v87, v86, v13);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v14 = v11[10];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v11[11];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = v11[12];
  uint64_t v23 = (unsigned char *)(a1 + v22);
  uint64_t v24 = (unsigned char *)(a2 + v22);
  uint64_t v25 = sub_25C662CD0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    *uint64_t v23 = *v24;
    *(_OWORD *)(v23 + 8) = *(_OWORD *)(v24 + 8);
    uint64_t v27 = *(int *)(v25 + 28);
    uint64_t v28 = &v23[v27];
    uint64_t v29 = &v24[v27];
    uint64_t v30 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      uint64_t v31 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v31 - 8) + 16))(v28, v29, v31);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  }
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  uint64_t v32 = v11[14];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  uint64_t v35 = sub_25C662B70();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
  }
  uint64_t v37 = type metadata accessor for RenderableEvent();
  uint64_t v38 = *(int *)(v37 + 20);
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  uint64_t v41 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  uint64_t v42 = *(int *)(v37 + 24);
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (void *)(a2 + v42);
  uint64_t v45 = v44[1];
  void *v43 = *v44;
  v43[1] = v45;
  uint64_t v46 = a3[5];
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  uint64_t v49 = *(void *)(a2 + v46 + 8);
  *(void *)uint64_t v47 = *(void *)(a2 + v46);
  *(void *)(v47 + 8) = v49;
  *(unsigned char *)(v47 + 16) = *(unsigned char *)(a2 + v46 + 16);
  *(void *)(v47 + 24) = *(void *)(a2 + v46 + 24);
  char v50 = *(unsigned char *)(a2 + v46 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v50)
  {
    long long v51 = *(_OWORD *)(v48 + 56);
    *(_OWORD *)(v47 + 56) = v51;
    (**(void (***)(uint64_t, uint64_t))(v51 - 8))(v47 + 32, v48 + 32);
  }
  else
  {
    uint64_t v52 = *(void *)(v48 + 40);
    *(void *)(v47 + 32) = *(void *)(v48 + 32);
    *(void *)(v47 + 40) = v52;
    swift_retain();
  }
  *(unsigned char *)(v47 + 72) = v50;
  long long v53 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v54 = v53[6];
  uint64_t v55 = v47 + v54;
  uint64_t v56 = v48 + v54;
  uint64_t v57 = sub_25C663490();
  uint64_t v88 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 16);
  v88(v55, v56, v57);
  *(void *)(v47 + v53[7]) = *(void *)(v48 + v53[7]);
  *(void *)(v47 + v53[8]) = *(void *)(v48 + v53[8]);
  uint64_t v58 = a3[6];
  uint64_t v59 = a1 + v58;
  uint64_t v60 = a2 + v58;
  uint64_t v61 = *(void *)(a2 + v58 + 8);
  *(void *)uint64_t v59 = *(void *)(a2 + v58);
  *(void *)(v59 + 8) = v61;
  *(unsigned char *)(v59 + 16) = *(unsigned char *)(a2 + v58 + 16);
  *(void *)(v59 + 24) = *(void *)(a2 + v58 + 24);
  char v62 = *(unsigned char *)(a2 + v58 + 72);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v62)
  {
    long long v63 = *(_OWORD *)(v60 + 56);
    *(_OWORD *)(v59 + 56) = v63;
    (**(void (***)(uint64_t, uint64_t))(v63 - 8))(v59 + 32, v60 + 32);
  }
  else
  {
    uint64_t v64 = *(void *)(v60 + 40);
    *(void *)(v59 + 32) = *(void *)(v60 + 32);
    *(void *)(v59 + 40) = v64;
    swift_retain();
  }
  *(unsigned char *)(v59 + 72) = v62;
  v88(v59 + v53[6], v60 + v53[6], v57);
  *(void *)(v59 + v53[7]) = *(void *)(v60 + v53[7]);
  *(void *)(v59 + v53[8]) = *(void *)(v60 + v53[8]);
  uint64_t v65 = a3[7];
  uint64_t v66 = (void *)(a1 + v65);
  uint64_t v67 = (void *)(a2 + v65);
  swift_retain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v67, 1, (uint64_t)v53))
  {
    uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC780);
    memcpy(v66, v67, *(void *)(*(void *)(v68 - 8) + 64));
  }
  else
  {
    uint64_t v69 = v67[1];
    *uint64_t v66 = *v67;
    v66[1] = v69;
    *((unsigned char *)v66 + 16) = *((unsigned char *)v67 + 16);
    v66[3] = v67[3];
    char v70 = *((unsigned char *)v67 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v70)
    {
      long long v71 = *(_OWORD *)(v67 + 7);
      *(_OWORD *)(v66 + 7) = v71;
      (**(void (***)(uint64_t, uint64_t))(v71 - 8))((uint64_t)(v66 + 4), (uint64_t)(v67 + 4));
    }
    else
    {
      uint64_t v72 = v67[5];
      v66[4] = v67[4];
      v66[5] = v72;
      swift_retain();
    }
    *((unsigned char *)v66 + 72) = v70;
    v88((uint64_t)v66 + v53[6], (uint64_t)v67 + v53[6], v57);
    *(void *)((char *)v66 + v53[7]) = *(void *)((char *)v67 + v53[7]);
    *(void *)((char *)v66 + v53[8]) = *(void *)((char *)v67 + v53[8]);
    swift_retain();
    swift_retain();
    __swift_storeEnumTagSinglePayload((uint64_t)v66, 0, 1, (uint64_t)v53);
  }
  uint64_t v73 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v73) = *(unsigned char *)(a2 + v73);
  uint64_t v74 = a3[10];
  uint64_t v75 = a1 + v74;
  uint64_t v76 = a2 + v74;
  uint64_t v77 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 16))(v75, v76, v77);
  uint64_t v78 = a3[11];
  uint64_t v79 = a1 + v78;
  uint64_t v80 = a2 + v78;
  uint64_t v81 = *(void *)(a2 + v78);
  LOBYTE(v75) = *(unsigned char *)(v80 + 8);
  sub_25C62C450(v81, v75);
  *(void *)uint64_t v79 = v81;
  *(unsigned char *)(v79 + 8) = v75;
  *(_OWORD *)(v79 + 16) = *(_OWORD *)(v80 + 16);
  *(unsigned char *)(v79 + 32) = *(unsigned char *)(v80 + 32);
  uint64_t v82 = *(void *)(v80 + 48);
  uint64_t v83 = *(void *)(v80 + 56);
  *(void *)(v79 + 40) = *(void *)(v80 + 40);
  *(void *)(v79 + 48) = v82;
  *(void *)(v79 + 56) = v83;
  swift_retain();
  return a1;
}

uint64_t sub_25C63BE14(uint64_t a1, uint64_t a2, int *a3)
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
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)sub_25C662CE0();
  uint64_t v7 = v6[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(unsigned char *)(a1 + v6[9]) = *(unsigned char *)(a2 + v6[9]);
  uint64_t v11 = v6[10];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  void *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = v6[11];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = v6[12];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  int v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
      *(void *)(v18 + 8) = *(void *)(v19 + 8);
      *(void *)(v18 + 16) = *(void *)(v19 + 16);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v30 = *(int *)(v20 + 28);
      uint64_t v31 = v18 + v30;
      uint64_t v32 = (const void *)(v19 + v30);
      sub_25C63E0B4(v31, MEMORY[0x263F6CD68]);
      uint64_t v33 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v93 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v93 - 8) + 16))(v31, v32, v93);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v27 = *(void *)(*(void *)(v33 - 8) + 64);
      uint64_t v28 = (void *)v31;
      uint64_t v29 = v32;
LABEL_8:
      memcpy(v28, v29, v27);
      goto LABEL_14;
    }
    sub_25C63E0B4(v18, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v27 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v28 = (void *)v18;
    uint64_t v29 = (const void *)v19;
    goto LABEL_8;
  }
  if (v22) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  *(void *)(v18 + 16) = *(void *)(v19 + 16);
  uint64_t v23 = *(int *)(v20 + 28);
  uint64_t v24 = (void *)(v18 + v23);
  uint64_t v25 = (const void *)(v19 + v23);
  uint64_t v26 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v34 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(void *)(a1 + v6[13]) = *(void *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = v6[14];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (const void *)(a2 + v35);
  uint64_t v38 = sub_25C662B70();
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
  int v40 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
  if (v39)
  {
    if (!v40)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
      __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v41 = *(void *)(v38 - 8);
  if (v40)
  {
    (*(void (**)(void *, uint64_t))(v41 + 8))(v36, v38);
LABEL_19:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v36, v37, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(v41 + 24))(v36, v37, v38);
LABEL_20:
  uint64_t v43 = type metadata accessor for RenderableEvent();
  uint64_t v44 = *(int *)(v43 + 20);
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  uint64_t v47 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 24))(v45, v46, v47);
  uint64_t v48 = *(int *)(v43 + 24);
  uint64_t v49 = (void *)(a1 + v48);
  char v50 = (void *)(a2 + v48);
  *uint64_t v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v95 = a3;
  uint64_t v51 = a3[5];
  uint64_t v52 = a1 + v51;
  uint64_t v53 = a2 + v51;
  *(void *)uint64_t v52 = *(void *)(a2 + v51);
  *(void *)(v52 + 8) = *(void *)(a2 + v51 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v52 + 16) = *(unsigned char *)(v53 + 16);
  *(void *)(v52 + 24) = *(void *)(v53 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_25C63C9A8(v52 + 32);
    if (*(unsigned char *)(v53 + 72))
    {
      uint64_t v54 = *(void *)(v53 + 56);
      *(void *)(v52 + 56) = v54;
      *(void *)(v52 + 64) = *(void *)(v53 + 64);
      (**(void (***)(uint64_t, uint64_t))(v54 - 8))(v52 + 32, v53 + 32);
      *(unsigned char *)(v52 + 72) = 1;
    }
    else
    {
      uint64_t v55 = *(void *)(v53 + 40);
      *(void *)(v52 + 32) = *(void *)(v53 + 32);
      *(void *)(v52 + 40) = v55;
      *(unsigned char *)(v52 + 72) = 0;
      swift_retain();
    }
  }
  uint64_t v56 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v57 = v56[6];
  uint64_t v58 = v52 + v57;
  uint64_t v59 = v53 + v57;
  uint64_t v60 = sub_25C663490();
  uint64_t v94 = *(void *)(v60 - 8);
  uint64_t v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v94 + 24);
  v61(v58, v59, v60);
  *(void *)(v52 + v56[7]) = *(void *)(v53 + v56[7]);
  swift_retain();
  swift_release();
  *(void *)(v52 + v56[8]) = *(void *)(v53 + v56[8]);
  swift_retain();
  swift_release();
  uint64_t v62 = v95[6];
  uint64_t v63 = a1 + v62;
  uint64_t v64 = a2 + v62;
  *(void *)uint64_t v63 = *(void *)(a2 + v62);
  *(void *)(v63 + 8) = *(void *)(a2 + v62 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v63 + 16) = *(unsigned char *)(v64 + 16);
  *(void *)(v63 + 24) = *(void *)(v64 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_25C63C9A8(v63 + 32);
    if (*(unsigned char *)(v64 + 72))
    {
      uint64_t v65 = *(void *)(v64 + 56);
      *(void *)(v63 + 56) = v65;
      *(void *)(v63 + 64) = *(void *)(v64 + 64);
      (**(void (***)(uint64_t, uint64_t))(v65 - 8))(v63 + 32, v64 + 32);
      *(unsigned char *)(v63 + 72) = 1;
    }
    else
    {
      uint64_t v66 = *(void *)(v64 + 40);
      *(void *)(v63 + 32) = *(void *)(v64 + 32);
      *(void *)(v63 + 40) = v66;
      *(unsigned char *)(v63 + 72) = 0;
      swift_retain();
    }
  }
  v61(v63 + v56[6], v64 + v56[6], v60);
  *(void *)(v63 + v56[7]) = *(void *)(v64 + v56[7]);
  swift_retain();
  swift_release();
  *(void *)(v63 + v56[8]) = *(void *)(v64 + v56[8]);
  swift_retain();
  swift_release();
  uint64_t v67 = v95;
  uint64_t v68 = v95[7];
  uint64_t v69 = a1 + v68;
  uint64_t v70 = a2 + v68;
  int v71 = __swift_getEnumTagSinglePayload(a1 + v68, 1, (uint64_t)v56);
  int v72 = __swift_getEnumTagSinglePayload(v70, 1, (uint64_t)v56);
  if (v71)
  {
    if (!v72)
    {
      *(void *)uint64_t v69 = *(void *)v70;
      *(void *)(v69 + 8) = *(void *)(v70 + 8);
      *(unsigned char *)(v69 + 16) = *(unsigned char *)(v70 + 16);
      *(void *)(v69 + 24) = *(void *)(v70 + 24);
      char v73 = *(unsigned char *)(v70 + 72);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v73)
      {
        uint64_t v74 = *(void *)(v70 + 56);
        *(void *)(v69 + 56) = v74;
        *(void *)(v69 + 64) = *(void *)(v70 + 64);
        (**(void (***)(uint64_t, uint64_t))(v74 - 8))(v69 + 32, v70 + 32);
      }
      else
      {
        uint64_t v77 = *(void *)(v70 + 40);
        *(void *)(v69 + 32) = *(void *)(v70 + 32);
        *(void *)(v69 + 40) = v77;
        swift_retain();
      }
      *(unsigned char *)(v69 + 72) = v73;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v94 + 16))(v69 + v56[6], v70 + v56[6], v60);
      *(void *)(v69 + v56[7]) = *(void *)(v70 + v56[7]);
      *(void *)(v69 + v56[8]) = *(void *)(v70 + v56[8]);
      swift_retain();
      swift_retain();
      __swift_storeEnumTagSinglePayload(v69, 0, 1, (uint64_t)v56);
      uint64_t v67 = v95;
      goto LABEL_43;
    }
LABEL_34:
    uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC780);
    memcpy((void *)v69, (const void *)v70, *(void *)(*(void *)(v75 - 8) + 64));
    goto LABEL_43;
  }
  if (v72)
  {
    sub_25C63E0B4(v69, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
    goto LABEL_34;
  }
  *(void *)uint64_t v69 = *(void *)v70;
  *(void *)(v69 + 8) = *(void *)(v70 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v69 + 16) = *(unsigned char *)(v70 + 16);
  *(void *)(v69 + 24) = *(void *)(v70 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_25C63C9A8(v69 + 32);
    if (*(unsigned char *)(v70 + 72))
    {
      uint64_t v76 = *(void *)(v70 + 56);
      *(void *)(v69 + 56) = v76;
      *(void *)(v69 + 64) = *(void *)(v70 + 64);
      (**(void (***)(uint64_t, uint64_t))(v76 - 8))(v69 + 32, v70 + 32);
      *(unsigned char *)(v69 + 72) = 1;
    }
    else
    {
      uint64_t v78 = *(void *)(v70 + 40);
      *(void *)(v69 + 32) = *(void *)(v70 + 32);
      *(void *)(v69 + 40) = v78;
      *(unsigned char *)(v69 + 72) = 0;
      swift_retain();
    }
  }
  v61(v69 + v56[6], v70 + v56[6], v60);
  *(void *)(v69 + v56[7]) = *(void *)(v70 + v56[7]);
  swift_retain();
  swift_release();
  *(void *)(v69 + v56[8]) = *(void *)(v70 + v56[8]);
  swift_retain();
  swift_release();
LABEL_43:
  *(unsigned char *)(a1 + v67[8]) = *(unsigned char *)(a2 + v67[8]);
  *(unsigned char *)(a1 + v67[9]) = *(unsigned char *)(a2 + v67[9]);
  uint64_t v79 = v67[10];
  uint64_t v80 = a1 + v79;
  uint64_t v81 = a2 + v79;
  uint64_t v82 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 24))(v80, v81, v82);
  uint64_t v83 = v67[11];
  uint64_t v84 = a1 + v83;
  uint64_t v85 = a2 + v83;
  uint64_t v86 = *(void *)(a2 + v83);
  char v87 = *(unsigned char *)(v85 + 8);
  sub_25C62C450(v86, v87);
  uint64_t v88 = *(void *)v84;
  char v89 = *(unsigned char *)(v84 + 8);
  *(void *)uint64_t v84 = v86;
  *(unsigned char *)(v84 + 8) = v87;
  sub_25C62C6E4(v88, v89);
  *(void *)(v84 + 16) = *(void *)(v85 + 16);
  uint64_t v90 = *(void *)(v85 + 24);
  *(unsigned char *)(v84 + 32) = *(unsigned char *)(v85 + 32);
  *(void *)(v84 + 24) = v90;
  *(void *)(v84 + 40) = *(void *)(v85 + 40);
  uint64_t v91 = *(void *)(v85 + 56);
  *(void *)(v84 + 48) = *(void *)(v85 + 48);
  *(void *)(v84 + 56) = v91;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25C63C9A8(uint64_t a1)
{
  return a1;
}

_OWORD *sub_25C63C9FC(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  uint64_t v8 = (int *)sub_25C662CE0();
  uint64_t v9 = v8[8];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25C6628A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *((unsigned char *)a1 + v8[9]) = *((unsigned char *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  uint64_t v13 = v8[12];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_25C662CD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    unsigned char *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    uint64_t v18 = *(int *)(v16 + 28);
    uint64_t v19 = &v14[v18];
    uint64_t v20 = &v15[v18];
    uint64_t v21 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(void *)((char *)a1 + v8[13]) = *(void *)((char *)a2 + v8[13]);
  uint64_t v23 = v8[14];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_25C662B70();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  uint64_t v28 = type metadata accessor for RenderableEvent();
  uint64_t v29 = *(int *)(v28 + 20);
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = sub_25C662C10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
  *(_OWORD *)((char *)a1 + *(int *)(v28 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v28 + 24));
  uint64_t v33 = a3[5];
  uint64_t v34 = (_OWORD *)((char *)a1 + v33);
  uint64_t v66 = a3;
  uint64_t v35 = (char *)a2 + v33;
  long long v36 = *(_OWORD *)((char *)a2 + v33 + 16);
  *uint64_t v34 = *(_OWORD *)((char *)a2 + v33);
  v34[1] = v36;
  *(_OWORD *)((char *)v34 + 57) = *(_OWORD *)((char *)a2 + v33 + 57);
  long long v37 = *(_OWORD *)((char *)a2 + v33 + 48);
  v34[2] = *(_OWORD *)((char *)a2 + v33 + 32);
  v34[3] = v37;
  uint64_t v38 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v39 = v38[6];
  int v40 = (char *)v34 + v39;
  uint64_t v41 = &v35[v39];
  uint64_t v42 = sub_25C663490();
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 32);
  v43(v40, v41, v42);
  *(void *)((char *)v34 + v38[7]) = *(void *)&v35[v38[7]];
  *(void *)((char *)v34 + v38[8]) = *(void *)&v35[v38[8]];
  uint64_t v44 = v66[6];
  uint64_t v45 = (_OWORD *)((char *)a1 + v44);
  uint64_t v46 = (char *)a2 + v44;
  long long v47 = *(_OWORD *)((char *)a2 + v44 + 16);
  *uint64_t v45 = *(_OWORD *)((char *)a2 + v44);
  v45[1] = v47;
  long long v48 = *(_OWORD *)((char *)a2 + v44 + 48);
  v45[2] = *(_OWORD *)((char *)a2 + v44 + 32);
  v45[3] = v48;
  *(_OWORD *)((char *)v45 + 57) = *(_OWORD *)((char *)a2 + v44 + 57);
  v43((char *)a1 + v44 + v38[6], (char *)a2 + v44 + v38[6], v42);
  *(void *)((char *)v45 + v38[7]) = *(void *)&v46[v38[7]];
  *(void *)((char *)v45 + v38[8]) = *(void *)&v46[v38[8]];
  uint64_t v49 = v66[7];
  char v50 = (_OWORD *)((char *)a1 + v49);
  uint64_t v51 = (_OWORD *)((char *)a2 + v49);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v49, 1, (uint64_t)v38))
  {
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC780);
    memcpy(v50, v51, *(void *)(*(void *)(v52 - 8) + 64));
  }
  else
  {
    long long v53 = v51[1];
    _OWORD *v50 = *v51;
    v50[1] = v53;
    long long v54 = v51[3];
    v50[2] = v51[2];
    v50[3] = v54;
    *(_OWORD *)((char *)v50 + 57) = *(_OWORD *)((char *)v51 + 57);
    v43((char *)v50 + v38[6], (char *)v51 + v38[6], v42);
    *(void *)((char *)v50 + v38[7]) = *(void *)((char *)v51 + v38[7]);
    *(void *)((char *)v50 + v38[8]) = *(void *)((char *)v51 + v38[8]);
    __swift_storeEnumTagSinglePayload((uint64_t)v50, 0, 1, (uint64_t)v38);
  }
  uint64_t v55 = v66[9];
  *((unsigned char *)a1 + v66[8]) = *((unsigned char *)a2 + v66[8]);
  *((unsigned char *)a1 + v55) = *((unsigned char *)a2 + v55);
  uint64_t v56 = v66[10];
  uint64_t v57 = (char *)a1 + v56;
  uint64_t v58 = (char *)a2 + v56;
  uint64_t v59 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v59 - 8) + 32))(v57, v58, v59);
  uint64_t v60 = v66[11];
  uint64_t v61 = (_OWORD *)((char *)a1 + v60);
  uint64_t v62 = (_OWORD *)((char *)a2 + v60);
  long long v63 = v62[1];
  *uint64_t v61 = *v62;
  v61[1] = v63;
  long long v64 = v62[3];
  v61[2] = v62[2];
  v61[3] = v64;
  return a1;
}

uint64_t sub_25C63CF38(uint64_t a1, uint64_t a2, int *a3)
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
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v16 = v11[10];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v11[11];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = v11[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  int v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v39 = *(int *)(v29 + 28);
      uint64_t v40 = v27 + v39;
      uint64_t v41 = (const void *)(v28 + v39);
      sub_25C63E0B4(v40, MEMORY[0x263F6CD68]);
      uint64_t v42 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v104 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v104 - 8) + 32))(v40, v41, v104);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v36 = *(void *)(*(void *)(v42 - 8) + 64);
      long long v37 = (void *)v40;
      uint64_t v38 = v41;
LABEL_8:
      memcpy(v37, v38, v36);
      goto LABEL_14;
    }
    sub_25C63E0B4(v27, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v36 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    long long v37 = (void *)v27;
    uint64_t v38 = (const void *)v28;
    goto LABEL_8;
  }
  if (v31) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  uint64_t v32 = *(int *)(v29 + 28);
  uint64_t v33 = (void *)(v27 + v32);
  uint64_t v34 = (const void *)(v28 + v32);
  uint64_t v35 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    uint64_t v43 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  uint64_t v44 = v11[14];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (const void *)(a2 + v44);
  uint64_t v47 = sub_25C662B70();
  int v48 = __swift_getEnumTagSinglePayload((uint64_t)v45, 1, v47);
  int v49 = __swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47);
  if (v48)
  {
    if (!v49)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
      __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v50 = *(void *)(v47 - 8);
  if (v49)
  {
    (*(void (**)(void *, uint64_t))(v50 + 8))(v45, v47);
LABEL_19:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v45, v46, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(v50 + 40))(v45, v46, v47);
LABEL_20:
  uint64_t v52 = type metadata accessor for RenderableEvent();
  uint64_t v53 = *(int *)(v52 + 20);
  uint64_t v54 = a1 + v53;
  uint64_t v55 = a2 + v53;
  uint64_t v56 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 40))(v54, v55, v56);
  uint64_t v57 = *(int *)(v52 + 24);
  uint64_t v58 = (void *)(a1 + v57);
  uint64_t v59 = (uint64_t *)(a2 + v57);
  uint64_t v61 = *v59;
  uint64_t v60 = v59[1];
  void *v58 = v61;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  uint64_t v62 = a3;
  uint64_t v63 = a3[5];
  uint64_t v64 = a1 + v63;
  uint64_t v65 = a2 + v63;
  uint64_t v66 = *(void *)(a2 + v63 + 8);
  *(void *)uint64_t v64 = *(void *)(a2 + v63);
  *(void *)(v64 + 8) = v66;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v64 + 16) = *(unsigned char *)(v65 + 16);
  *(void *)(v64 + 24) = *(void *)(v65 + 24);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_25C63C9A8(v64 + 32);
    long long v67 = *(_OWORD *)(v65 + 48);
    *(_OWORD *)(v64 + 32) = *(_OWORD *)(v65 + 32);
    *(_OWORD *)(v64 + 48) = v67;
    *(_OWORD *)(v64 + 57) = *(_OWORD *)(v65 + 57);
  }
  uint64_t v68 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v69 = v68[6];
  uint64_t v70 = v64 + v69;
  uint64_t v71 = v65 + v69;
  uint64_t v72 = sub_25C663490();
  uint64_t v105 = *(void *)(v72 - 8);
  uint64_t v73 = v71;
  uint64_t v74 = *(void (**)(uint64_t, uint64_t, uint64_t))(v105 + 40);
  v74(v70, v73, v72);
  *(void *)(v64 + v68[7]) = *(void *)(v65 + v68[7]);
  swift_release();
  *(void *)(v64 + v68[8]) = *(void *)(v65 + v68[8]);
  swift_release();
  uint64_t v75 = v62[6];
  uint64_t v76 = a1 + v75;
  uint64_t v77 = a2 + v75;
  uint64_t v78 = *(void *)(a2 + v75 + 8);
  *(void *)uint64_t v76 = *(void *)(a2 + v75);
  *(void *)(v76 + 8) = v78;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v76 + 16) = *(unsigned char *)(v77 + 16);
  *(void *)(v76 + 24) = *(void *)(v77 + 24);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_25C63C9A8(v76 + 32);
    long long v79 = *(_OWORD *)(v77 + 48);
    *(_OWORD *)(v76 + 32) = *(_OWORD *)(v77 + 32);
    *(_OWORD *)(v76 + 48) = v79;
    *(_OWORD *)(v76 + 57) = *(_OWORD *)(v77 + 57);
  }
  v74(v76 + v68[6], v77 + v68[6], v72);
  *(void *)(v76 + v68[7]) = *(void *)(v77 + v68[7]);
  swift_release();
  *(void *)(v76 + v68[8]) = *(void *)(v77 + v68[8]);
  swift_release();
  uint64_t v80 = v62;
  uint64_t v81 = v62[7];
  uint64_t v82 = (_OWORD *)(a1 + v81);
  uint64_t v83 = (void (*)(char *, char *, uint64_t))v74;
  uint64_t v84 = (_OWORD *)(a2 + v81);
  int v85 = __swift_getEnumTagSinglePayload(a1 + v81, 1, (uint64_t)v68);
  int v86 = __swift_getEnumTagSinglePayload((uint64_t)v84, 1, (uint64_t)v68);
  if (v85)
  {
    if (!v86)
    {
      long long v87 = v84[1];
      *uint64_t v82 = *v84;
      v82[1] = v87;
      long long v88 = v84[3];
      v82[2] = v84[2];
      v82[3] = v88;
      *(_OWORD *)((char *)v82 + 57) = *(_OWORD *)((char *)v84 + 57);
      (*(void (**)(char *, char *, uint64_t))(v105 + 32))((char *)v82 + v68[6], (char *)v84 + v68[6], v72);
      *(void *)((char *)v82 + v68[7]) = *(void *)((char *)v84 + v68[7]);
      *(void *)((char *)v82 + v68[8]) = *(void *)((char *)v84 + v68[8]);
      __swift_storeEnumTagSinglePayload((uint64_t)v82, 0, 1, (uint64_t)v68);
      goto LABEL_30;
    }
LABEL_29:
    uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC780);
    memcpy(v82, v84, *(void *)(*(void *)(v89 - 8) + 64));
    goto LABEL_30;
  }
  if (v86)
  {
    sub_25C63E0B4((uint64_t)v82, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
    goto LABEL_29;
  }
  uint64_t v102 = *((void *)v84 + 1);
  *(void *)uint64_t v82 = *(void *)v84;
  *((void *)v82 + 1) = v102;
  swift_bridgeObjectRelease();
  *((unsigned char *)v82 + 16) = *((unsigned char *)v84 + 16);
  *((void *)v82 + 3) = *((void *)v84 + 3);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_25C63C9A8((uint64_t)(v82 + 2));
    long long v103 = v84[3];
    v82[2] = v84[2];
    v82[3] = v103;
    *(_OWORD *)((char *)v82 + 57) = *(_OWORD *)((char *)v84 + 57);
  }
  v83((char *)v82 + v68[6], (char *)v84 + v68[6], v72);
  *(void *)((char *)v82 + v68[7]) = *(void *)((char *)v84 + v68[7]);
  swift_release();
  *(void *)((char *)v82 + v68[8]) = *(void *)((char *)v84 + v68[8]);
  swift_release();
LABEL_30:
  uint64_t v90 = v80[9];
  *(unsigned char *)(a1 + v80[8]) = *(unsigned char *)(a2 + v80[8]);
  *(unsigned char *)(a1 + v90) = *(unsigned char *)(a2 + v90);
  uint64_t v91 = v80[10];
  uint64_t v92 = a1 + v91;
  uint64_t v93 = a2 + v91;
  uint64_t v94 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v94 - 8) + 40))(v92, v93, v94);
  uint64_t v95 = v80[11];
  uint64_t v96 = a1 + v95;
  uint64_t v97 = a2 + v95;
  char v98 = *(unsigned char *)(v97 + 8);
  uint64_t v99 = *(void *)(a1 + v95);
  char v100 = *(unsigned char *)(a1 + v95 + 8);
  *(void *)uint64_t v96 = *(void *)v97;
  *(unsigned char *)(v96 + 8) = v98;
  sub_25C62C6E4(v99, v100);
  *(void *)(v96 + 16) = *(void *)(v97 + 16);
  *(void *)(v96 + 24) = *(void *)(v97 + 24);
  *(unsigned char *)(v96 + 32) = *(unsigned char *)(v97 + 32);
  *(void *)(v96 + 40) = *(void *)(v97 + 40);
  *(_OWORD *)(v96 + 48) = *(_OWORD *)(v97 + 48);
  swift_release();
  return a1;
}

uint64_t sub_25C63D81C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C63D830);
}

uint64_t sub_25C63D830(uint64_t a1, uint64_t a2, int *a3)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_10:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  type metadata accessor for CalendarButtonView.Model(0);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v12 = a3[5];
LABEL_9:
    uint64_t v9 = a1 + v12;
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC780);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v14 + 84) == a2)
  {
    uint64_t v8 = v13;
    uint64_t v12 = a3[7];
    goto LABEL_9;
  }
  sub_25C663590();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v16 + 84) == a2)
  {
    uint64_t v8 = v15;
    uint64_t v12 = a3[10];
    goto LABEL_9;
  }
  unint64_t v18 = *(void *)(a1 + a3[11] + 48);
  if (v18 >= 0xFFFFFFFF) {
    LODWORD(v18) = -1;
  }
  return (v18 + 1);
}

uint64_t sub_25C63D934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C63D948);
}

void sub_25C63D948(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    type metadata accessor for CalendarButtonView.Model(0);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC780);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[7];
      }
      else
      {
        sub_25C663590();
        OUTLINED_FUNCTION_0_0();
        if (*(_DWORD *)(v18 + 84) != a3)
        {
          *(void *)(a1 + a4[11] + 48) = (a2 - 1);
          return;
        }
        uint64_t v10 = v17;
        uint64_t v14 = a4[10];
      }
    }
    uint64_t v11 = a1 + v14;
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_25C63DA48()
{
  type metadata accessor for RenderableEvent();
  if (v0 <= 0x3F)
  {
    type metadata accessor for CalendarButtonView.Model(319);
    if (v1 <= 0x3F)
    {
      sub_25C63DB9C();
      if (v2 <= 0x3F)
      {
        sub_25C663590();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_25C63DB9C()
{
  if (!qword_26A5BC798)
  {
    type metadata accessor for CalendarButtonView.Model(255);
    unint64_t v0 = sub_25C663810();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A5BC798);
    }
  }
}

uint64_t sub_25C63DBF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C63DC10()
{
  uint64_t v1 = (int *)type metadata accessor for SingleEventWithButtonsSnippet();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v22 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v23 = v0;
  uint64_t v4 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_25C662CE0();
  sub_25C6628A0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v6();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + *(int *)(v5 + 48);
  uint64_t v8 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    uint64_t v9 = v7 + *(int *)(v8 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_25C6629F0();
      OUTLINED_FUNCTION_1();
      (*(void (**)(uint64_t))(v10 + 8))(v9);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = v4 + *(int *)(v5 + 56);
  uint64_t v12 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  type metadata accessor for RenderableEvent();
  sub_25C662C10();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v13();
  swift_bridgeObjectRelease();
  uint64_t v14 = v4 + v1[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v14 + 72)) {
    __swift_destroy_boxed_opaque_existential_1(v14 + 32);
  }
  else {
    swift_release();
  }
  uint64_t v15 = type metadata accessor for CalendarButtonView.Model(0);
  sub_25C663490();
  OUTLINED_FUNCTION_1();
  uint64_t v17 = *(void (**)(void))(v16 + 8);
  OUTLINED_FUNCTION_3_1();
  v17();
  swift_release();
  swift_release();
  uint64_t v18 = v4 + v1[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v18 + 72)) {
    __swift_destroy_boxed_opaque_existential_1(v18 + 32);
  }
  else {
    swift_release();
  }
  OUTLINED_FUNCTION_3_1();
  v17();
  swift_release();
  swift_release();
  uint64_t v19 = v4 + v1[7];
  if (!__swift_getEnumTagSinglePayload(v19, 1, v15))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(v19 + 72)) {
      __swift_destroy_boxed_opaque_existential_1(v19 + 32);
    }
    else {
      swift_release();
    }
    OUTLINED_FUNCTION_3_1();
    v17();
    swift_release();
    swift_release();
  }
  sub_25C663590();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v20();
  sub_25C62C6E4(*(void *)(v4 + v1[11]), *(unsigned char *)(v4 + v1[11] + 8));
  swift_release();
  return MEMORY[0x270FA0238](v23, v3 + v22, v2 | 7);
}

uint64_t sub_25C63E03C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for SingleEventWithButtonsSnippet() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_25C639A18(v4, a1);
}

uint64_t sub_25C63E0B4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v3();
  return a1;
}

uint64_t sub_25C63E108(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C63E150(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25C63E1B0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = OUTLINED_FUNCTION_2();
  v5(v4);
  return a2;
}

uint64_t sub_25C63E204()
{
  return sub_25C6298EC(&qword_26A5BC830, &qword_26A5BC838);
}

void sub_25C63E250()
{
  uint64_t v18 = sub_25C663690();
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v0;
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_3();
  uint64_t v16 = v3 - v2;
  uint64_t v4 = type metadata accessor for SingleEventView();
  MEMORY[0x270FA5388](v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC850);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC858);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC860);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  sub_25C641EFC();
  swift_allocObject();
  sub_25C641F4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC868);
  sub_25C6298EC(&qword_26A5BC870, &qword_26A5BC868);
  sub_25C6634A0();
  (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v16, *MEMORY[0x263F778F0], v18);
  sub_25C6298EC(&qword_26A5BC878, &qword_26A5BC850);
  sub_25C6632A0();
  OUTLINED_FUNCTION_7();
  v9(v8);
  OUTLINED_FUNCTION_7();
  v11(v10);
  swift_getOpaqueTypeConformance2();
  sub_25C663290();
  OUTLINED_FUNCTION_7();
  v13(v12);
  swift_getOpaqueTypeConformance2();
  sub_25C663280();
  OUTLINED_FUNCTION_7();
  v15(v14);
  OUTLINED_FUNCTION_5_1();
}

uint64_t sub_25C63E65C@<X0>(char *a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC880) - 8;
  uint64_t v1 = MEMORY[0x270FA5388](v32);
  uint64_t v33 = (uint64_t)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  int v31 = (char *)&v29 - v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC688);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (uint64_t *)((char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC690);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_25C6629F0();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for DateHeaderView();
  MEMORY[0x270FA5388](v30);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC888);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v29 - v20;
  sub_25C662CE0();
  sub_25C662880();
  *uint64_t v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC698);
  swift_storeEnumTagMultiPayload();
  uint64_t *v6 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6A0);
  swift_storeEnumTagMultiPayload();
  sub_25C65A7E0((uint64_t)v12, (uint64_t)v9, (uint64_t)v6, (uint64_t)v14);
  type metadata accessor for SingleEventView();
  sub_25C641FA0(&qword_26A5BC890, (void (*)(uint64_t))type metadata accessor for DateHeaderView);
  sub_25C663290();
  sub_25C641FE8((uint64_t)v14, (void (*)(void))type metadata accessor for DateHeaderView);
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v19, v15);
  uint64_t v22 = v31;
  sub_25C63EB14(v31);
  sub_25C641EFC();
  type metadata accessor for PunchoutToEventDetailsModifier();
  sub_25C663580();
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v23(v19, v21, v15);
  uint64_t v24 = v33;
  sub_25C62973C((uint64_t)v22, v33, &qword_26A5BC880);
  uint64_t v25 = v34;
  v23(v34, v19, v15);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC898);
  sub_25C62973C(v24, (uint64_t)&v25[*(int *)(v26 + 48)], &qword_26A5BC880);
  sub_25C63945C((uint64_t)v22, &qword_26A5BC880);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v16 + 8);
  v27(v21, v15);
  sub_25C63945C(v24, &qword_26A5BC880);
  return ((uint64_t (*)(char *, uint64_t))v27)(v19, v15);
}

uint64_t sub_25C63EB14@<X0>(char *a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC8A0);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v42 = (uint64_t)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v41 = (uint64_t)&v35 - v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for RenderableEvent();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = (int *)type metadata accessor for EventCellView();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC8A8);
  uint64_t v44 = *(void *)(v40 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v40);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v35 - v15;
  sub_25C641EFC();
  uint64_t v17 = sub_25C6629F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v17);
  uint64_t v18 = (uint64_t)&v11[v9[5]];
  __swift_storeEnumTagSinglePayload(v18, 1, 1, v17);
  uint64_t v19 = &v11[v9[7]];
  *(void *)uint64_t v19 = swift_getKeyPath();
  v19[8] = 0;
  *((void *)v19 + 2) = 0x4030000000000000;
  *((void *)v19 + 3) = 0;
  v19[32] = 1;
  *((void *)v19 + 5) = 1;
  *((void *)v19 + 6) = sub_25C64B95C;
  *((void *)v19 + 7) = 0;
  sub_25C641F4C();
  sub_25C63950C((uint64_t)v7, v18);
  v11[v9[6]] = 0;
  type metadata accessor for SingleEventView();
  sub_25C641FA0(&qword_26A5BC740, (void (*)(uint64_t))type metadata accessor for EventCellView);
  sub_25C663290();
  sub_25C641FE8((uint64_t)v11, (void (*)(void))type metadata accessor for EventCellView);
  uint64_t v20 = v44;
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
  uint64_t v22 = v16;
  uint64_t v39 = v16;
  uint64_t v23 = v40;
  v21(v16, v14, v40);
  uint64_t v24 = v41;
  sub_25C63EFF8(v41);
  sub_25C63F35C((uint64_t)&v45);
  uint64_t v25 = v45;
  long long v37 = v47;
  long long v38 = v46;
  uint64_t v36 = v48;
  char v26 = v49;
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  v27(v14, v22, v23);
  uint64_t v28 = v24;
  uint64_t v29 = v42;
  sub_25C62973C(v24, v42, &qword_26A5BC8A0);
  uint64_t v30 = v43;
  v27(v43, v14, v23);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC8B0);
  sub_25C62973C(v29, (uint64_t)&v30[*(int *)(v31 + 48)], &qword_26A5BC8A0);
  uint64_t v32 = &v30[*(int *)(v31 + 64)];
  *(void *)uint64_t v32 = v25;
  *(_OWORD *)(v32 + 8) = v38;
  *(_OWORD *)(v32 + 24) = v37;
  *((void *)v32 + 5) = v36;
  v32[48] = v26;
  swift_bridgeObjectRetain();
  sub_25C63945C(v28, &qword_26A5BC8A0);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v44 + 8);
  v33(v39, v23);
  swift_bridgeObjectRelease();
  sub_25C63945C(v29, &qword_26A5BC8A0);
  return ((uint64_t (*)(char *, uint64_t))v33)(v14, v23);
}

void sub_25C63EFF8(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25C663050();
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v4 = v1 + *(int *)(type metadata accessor for SingleEventView() + 36);
  uint64_t v5 = *(void *)v4;
  char v6 = *(unsigned char *)(v4 + 8);
  sub_25C62C450(*(void *)v4, v6);
  sub_25C637EB4();
  sub_25C62C6E4(v5, v6);
  if ((sub_25C663800() & 1) != 0 && (sub_25C63F580(), v7))
  {
    uint64_t v30 = a1;
    sub_25C663040();
    sub_25C663030();
    sub_25C663020();
    swift_bridgeObjectRelease();
    sub_25C663030();
    sub_25C663070();
    if (qword_26A5BC340 != -1) {
      swift_once();
    }
    id v8 = (id)qword_26A5BE0E0;
    uint64_t v9 = sub_25C663220();
    uint64_t v11 = v10;
    char v13 = v12 & 1;
    sub_25C663180();
    uint64_t v14 = sub_25C663200();
    uint64_t v16 = v15;
    char v18 = v17;
    swift_release();
    sub_25C629890(v9, v11, v13);
    swift_bridgeObjectRelease();
    sub_25C663110();
    uint64_t v19 = sub_25C6631D0();
    uint64_t v21 = v20;
    char v23 = v22 & 1;
    sub_25C629890(v14, v16, v18 & 1);
    swift_bridgeObjectRelease();
    sub_25C663130();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC8C0);
    sub_25C64203C();
    sub_25C663290();
    sub_25C629890(v19, v21, v23);
    swift_bridgeObjectRelease();
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC8B8);
    __swift_storeEnumTagSinglePayload(v30, 0, 1, v24);
    OUTLINED_FUNCTION_5_1();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC8B8);
    OUTLINED_FUNCTION_5_1();
    __swift_storeEnumTagSinglePayload(v25, v26, v27, v28);
  }
}

double sub_25C63F35C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SingleEventView();
  OUTLINED_FUNCTION_1();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v21 - v9;
  uint64_t v11 = v1 + *(int *)(v8 + 36);
  uint64_t v12 = *(void *)v11;
  char v13 = *(unsigned char *)(v11 + 8);
  sub_25C62C450(*(void *)v11, v13);
  sub_25C637EB4();
  sub_25C62C6E4(v12, v13);
  LOBYTE(v12) = sub_25C6637F0();
  sub_25C641EFC();
  if (v12)
  {
    sub_25C641FE8((uint64_t)v10, (void (*)(void))type metadata accessor for SingleEventView);
    sub_25C641EFC();
LABEL_6:
    sub_25C641FE8((uint64_t)v7, (void (*)(void))type metadata accessor for SingleEventView);
    goto LABEL_7;
  }
  int v14 = v10[*(int *)(v3 + 20)];
  sub_25C641FE8((uint64_t)v10, (void (*)(void))type metadata accessor for SingleEventView);
  sub_25C641EFC();
  if (v14 != 1) {
    goto LABEL_6;
  }
  uint64_t v15 = sub_25C662CE0();
  uint64_t v16 = *(void *)(*(void *)&v7[*(int *)(v15 + 52)] + 16);
  sub_25C641FE8((uint64_t)v7, (void (*)(void))type metadata accessor for SingleEventView);
  if (!v16)
  {
LABEL_7:
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    char v19 = 0;
    goto LABEL_8;
  }
  uint64_t v17 = *(void *)(v1 + *(int *)(v15 + 52));
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_25C663130();
  char v19 = 1;
LABEL_8:
  *(void *)a1 = v17;
  *(void *)(a1 + 8) = v18;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(unsigned char *)(a1 + 48) = v19;
  return result;
}

void sub_25C63F580()
{
  sub_25C662B30();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_3();
  uint64_t v2 = sub_25C6629F0();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v12 = (unsigned __int8 *)(v11 - v10);
  uint64_t v13 = sub_25C662CE0();
  sub_25C62973C(v0 + *(int *)(v13 + 48), (uint64_t)v12, &qword_26A5BC400);
  uint64_t v14 = sub_25C662CD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v14) == 1)
  {
    sub_25C63945C((uint64_t)v12, &qword_26A5BC400);
  }
  else
  {
    uint64_t v15 = *v12;
    uint64_t v16 = *((void *)v12 + 1);
    uint64_t v17 = sub_25C62E89C();
    id v18 = sub_25C62E9BC();
    id v19 = objc_allocWithZone(MEMORY[0x263F04BD8]);
    id v20 = sub_25C641CCC(v15, v16, v17, 0, 0, 0, 0, 0, v18);
    sub_25C641FE8((uint64_t)v12, MEMORY[0x263F6CD70]);
    sub_25C662880();
    uint64_t v21 = (void *)sub_25C6629E0();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
    sub_25C662B20();
    char v22 = (void *)sub_25C662B00();
    OUTLINED_FUNCTION_7();
    v24(v23);
    id v25 = (id)CUIKStringForRecurrenceRule();

    if (v25)
    {
      sub_25C663740();
    }
    else
    {
      __break(1u);
    }
  }
}

double sub_25C63F834@<D0>(_OWORD *a1@<X8>)
{
  double result = 12.0;
  *a1 = xmmword_25C664230;
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SingleEventView.StyleConstants(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SingleEventView.StyleConstants(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SingleEventView.StyleConstants()
{
  return &type metadata for SingleEventView.StyleConstants;
}

void *sub_25C63F8AC(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    long long v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    uint64_t v11 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v11;
    uint64_t v12 = (int *)sub_25C662CE0();
    uint64_t v13 = v12[8];
    uint64_t v71 = (uint64_t)a2 + v13;
    uint64_t v72 = (char *)v4 + v13;
    uint64_t v14 = sub_25C6628A0();
    uint64_t v70 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v70(v72, v71, v14);
    *((unsigned char *)v4 + v12[9]) = *((unsigned char *)a2 + v12[9]);
    uint64_t v15 = v12[10];
    uint64_t v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = v12[11];
    id v20 = (void *)((char *)v4 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *id v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = v12[12];
    uint64_t v24 = (char *)v4 + v23;
    id v25 = (char *)a2 + v23;
    uint64_t v26 = sub_25C662CD0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
      memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      *uint64_t v24 = *v25;
      *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
      uint64_t v29 = *(int *)(v26 + 28);
      uint64_t v30 = &v24[v29];
      uint64_t v31 = &v25[v29];
      uint64_t v32 = sub_25C662CC0();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        uint64_t v33 = sub_25C6629F0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v33 - 8) + 16))(v30, v31, v33);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
    }
    *(void *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    uint64_t v34 = v12[14];
    uint64_t v35 = (char *)v4 + v34;
    uint64_t v36 = (char *)a2 + v34;
    uint64_t v37 = sub_25C662B70();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
      memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
    }
    uint64_t v39 = type metadata accessor for RenderableEvent();
    uint64_t v40 = *(int *)(v39 + 20);
    uint64_t v41 = (char *)v4 + v40;
    uint64_t v42 = (uint64_t)a2 + v40;
    uint64_t v43 = sub_25C662C10();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
    uint64_t v44 = *(int *)(v39 + 24);
    uint64_t v45 = (void *)((char *)v4 + v44);
    long long v46 = (uint64_t *)((char *)a2 + v44);
    uint64_t v47 = v46[1];
    *uint64_t v45 = *v46;
    v45[1] = v47;
    uint64_t v48 = a3[6];
    *((unsigned char *)v4 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    char v49 = (char *)v4 + v48;
    uint64_t v50 = (uint64_t)a2 + v48;
    uint64_t v51 = sub_25C663590();
    uint64_t v52 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v51 - 8) + 16);
    swift_bridgeObjectRetain();
    v52(v49, v50, v51);
    uint64_t v53 = a3[7];
    uint64_t v54 = (char *)v4 + v53;
    uint64_t v55 = (uint64_t)a2 + v53;
    uint64_t v56 = *(uint64_t *)((char *)a2 + v53);
    LOBYTE(v49) = *((unsigned char *)a2 + v53 + 8);
    sub_25C62C450(v56, (char)v49);
    *(void *)uint64_t v54 = v56;
    v54[8] = (char)v49;
    *((_OWORD *)v54 + 1) = *(_OWORD *)(v55 + 16);
    v54[32] = *(unsigned char *)(v55 + 32);
    uint64_t v57 = *(void *)(v55 + 48);
    uint64_t v58 = *(void *)(v55 + 56);
    *((void *)v54 + 5) = *(void *)(v55 + 40);
    *((void *)v54 + 6) = v57;
    *((void *)v54 + 7) = v58;
    uint64_t v59 = a3[8];
    uint64_t v60 = (char *)v4 + v59;
    uint64_t v61 = (uint64_t)a2 + v59;
    uint64_t v62 = *(uint64_t *)((char *)a2 + v59);
    LOBYTE(v49) = *((unsigned char *)a2 + v59 + 8);
    swift_retain();
    sub_25C62C450(v62, (char)v49);
    *(void *)uint64_t v60 = v62;
    v60[8] = (char)v49;
    *((_OWORD *)v60 + 1) = *(_OWORD *)(v61 + 16);
    uint64_t v63 = *(void *)(v61 + 40);
    uint64_t v64 = *(void *)(v61 + 48);
    *((void *)v60 + 4) = *(void *)(v61 + 32);
    *((void *)v60 + 5) = v63;
    *((void *)v60 + 6) = v64;
    uint64_t v65 = a3[9];
    uint64_t v66 = (char *)v4 + v65;
    uint64_t v67 = (uint64_t)a2 + v65;
    uint64_t v68 = *(void *)v67;
    LOBYTE(v62) = *(unsigned char *)(v67 + 8);
    swift_retain();
    sub_25C62C450(v68, v62);
    *(void *)uint64_t v66 = v68;
    v66[8] = v62;
  }
  return v4;
}

uint64_t sub_25C63FDA4(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)sub_25C662CE0();
  uint64_t v5 = a1 + v4[8];
  uint64_t v6 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + v4[12];
  uint64_t v8 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    uint64_t v9 = v7 + *(int *)(v8 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      uint64_t v10 = sub_25C6629F0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = a1 + v4[14];
  uint64_t v12 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  uint64_t v13 = a1 + *(int *)(type metadata accessor for RenderableEvent() + 20);
  uint64_t v14 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  swift_bridgeObjectRelease();
  uint64_t v15 = a1 + a2[6];
  uint64_t v16 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  sub_25C62C6E4(*(void *)(a1 + a2[7]), *(unsigned char *)(a1 + a2[7] + 8));
  swift_release();
  sub_25C62C6E4(*(void *)(a1 + a2[8]), *(unsigned char *)(a1 + a2[8] + 8));
  swift_release();
  uint64_t v17 = a1 + a2[9];
  uint64_t v18 = *(void *)v17;
  char v19 = *(unsigned char *)(v17 + 8);
  return sub_25C62C6E4(v18, v19);
}

uint64_t sub_25C640044(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  long long v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v69 = a2 + v12;
  uint64_t v70 = a1 + v12;
  uint64_t v13 = sub_25C6628A0();
  uint64_t v68 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v68(v70, v69, v13);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v14 = v11[10];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v11[11];
  char v19 = (void *)(a1 + v18);
  id v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *char v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = v11[12];
  uint64_t v23 = (unsigned char *)(a1 + v22);
  uint64_t v24 = (unsigned char *)(a2 + v22);
  uint64_t v25 = sub_25C662CD0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    *uint64_t v23 = *v24;
    *(_OWORD *)(v23 + 8) = *(_OWORD *)(v24 + 8);
    uint64_t v27 = *(int *)(v25 + 28);
    uint64_t v28 = &v23[v27];
    uint64_t v29 = &v24[v27];
    uint64_t v30 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      uint64_t v31 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v31 - 8) + 16))(v28, v29, v31);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  }
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  uint64_t v32 = v11[14];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  uint64_t v35 = sub_25C662B70();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
  }
  uint64_t v37 = type metadata accessor for RenderableEvent();
  uint64_t v38 = *(int *)(v37 + 20);
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  uint64_t v41 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  uint64_t v42 = *(int *)(v37 + 24);
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (void *)(a2 + v42);
  uint64_t v45 = v44[1];
  void *v43 = *v44;
  v43[1] = v45;
  uint64_t v46 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  uint64_t v49 = sub_25C663590();
  uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 16);
  swift_bridgeObjectRetain();
  v50(v47, v48, v49);
  uint64_t v51 = a3[7];
  uint64_t v52 = a1 + v51;
  uint64_t v53 = a2 + v51;
  uint64_t v54 = *(void *)(a2 + v51);
  LOBYTE(v47) = *(unsigned char *)(a2 + v51 + 8);
  sub_25C62C450(v54, v47);
  *(void *)uint64_t v52 = v54;
  *(unsigned char *)(v52 + 8) = v47;
  *(_OWORD *)(v52 + 16) = *(_OWORD *)(v53 + 16);
  *(unsigned char *)(v52 + 32) = *(unsigned char *)(v53 + 32);
  uint64_t v55 = *(void *)(v53 + 48);
  uint64_t v56 = *(void *)(v53 + 56);
  *(void *)(v52 + 40) = *(void *)(v53 + 40);
  *(void *)(v52 + 48) = v55;
  *(void *)(v52 + 56) = v56;
  uint64_t v57 = a3[8];
  uint64_t v58 = a1 + v57;
  uint64_t v59 = a2 + v57;
  uint64_t v60 = *(void *)(a2 + v57);
  LOBYTE(v47) = *(unsigned char *)(a2 + v57 + 8);
  swift_retain();
  sub_25C62C450(v60, v47);
  *(void *)uint64_t v58 = v60;
  *(unsigned char *)(v58 + 8) = v47;
  *(_OWORD *)(v58 + 16) = *(_OWORD *)(v59 + 16);
  uint64_t v61 = *(void *)(v59 + 40);
  uint64_t v62 = *(void *)(v59 + 48);
  *(void *)(v58 + 32) = *(void *)(v59 + 32);
  *(void *)(v58 + 40) = v61;
  *(void *)(v58 + 48) = v62;
  uint64_t v63 = a3[9];
  uint64_t v64 = a1 + v63;
  uint64_t v65 = a2 + v63;
  uint64_t v66 = *(void *)v65;
  LOBYTE(v60) = *(unsigned char *)(v65 + 8);
  swift_retain();
  sub_25C62C450(v66, v60);
  *(void *)uint64_t v64 = v66;
  *(unsigned char *)(v64 + 8) = v60;
  return a1;
}

uint64_t sub_25C6404EC(uint64_t a1, uint64_t a2, int *a3)
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
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)sub_25C662CE0();
  uint64_t v7 = v6[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(unsigned char *)(a1 + v6[9]) = *(unsigned char *)(a2 + v6[9]);
  uint64_t v11 = v6[10];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  void *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = v6[11];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = v6[12];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  int v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
      *(void *)(v18 + 8) = *(void *)(v19 + 8);
      *(void *)(v18 + 16) = *(void *)(v19 + 16);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v30 = *(int *)(v20 + 28);
      uint64_t v31 = v18 + v30;
      uint64_t v32 = (const void *)(v19 + v30);
      sub_25C641FE8(v31, MEMORY[0x263F6CD68]);
      uint64_t v33 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v78 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v78 - 8) + 16))(v31, v32, v78);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v27 = *(void *)(*(void *)(v33 - 8) + 64);
      uint64_t v28 = (void *)v31;
      uint64_t v29 = v32;
LABEL_8:
      memcpy(v28, v29, v27);
      goto LABEL_14;
    }
    sub_25C641FE8(v18, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v27 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v28 = (void *)v18;
    uint64_t v29 = (const void *)v19;
    goto LABEL_8;
  }
  if (v22) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  *(void *)(v18 + 16) = *(void *)(v19 + 16);
  uint64_t v23 = *(int *)(v20 + 28);
  uint64_t v24 = (void *)(v18 + v23);
  uint64_t v25 = (const void *)(v19 + v23);
  uint64_t v26 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v34 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(void *)(a1 + v6[13]) = *(void *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = v6[14];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (const void *)(a2 + v35);
  uint64_t v38 = sub_25C662B70();
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
  int v40 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
  if (!v39)
  {
    uint64_t v41 = *(void *)(v38 - 8);
    if (!v40)
    {
      (*(void (**)(void *, const void *, uint64_t))(v41 + 24))(v36, v37, v38);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v41 + 8))(v36, v38);
    goto LABEL_19;
  }
  if (v40)
  {
LABEL_19:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v36, v37, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
LABEL_20:
  uint64_t v43 = type metadata accessor for RenderableEvent();
  uint64_t v44 = *(int *)(v43 + 20);
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  uint64_t v47 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 24))(v45, v46, v47);
  uint64_t v48 = *(int *)(v43 + 24);
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (void *)(a2 + v48);
  *uint64_t v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v51 = a3[6];
  uint64_t v52 = a1 + v51;
  uint64_t v53 = a2 + v51;
  uint64_t v54 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 24))(v52, v53, v54);
  uint64_t v55 = a3[7];
  uint64_t v56 = a1 + v55;
  uint64_t v57 = a2 + v55;
  uint64_t v58 = *(void *)(a2 + v55);
  LOBYTE(v53) = *(unsigned char *)(a2 + v55 + 8);
  sub_25C62C450(v58, v53);
  uint64_t v59 = *(void *)v56;
  char v60 = *(unsigned char *)(v56 + 8);
  *(void *)uint64_t v56 = v58;
  *(unsigned char *)(v56 + 8) = v53;
  sub_25C62C6E4(v59, v60);
  *(void *)(v56 + 16) = *(void *)(v57 + 16);
  uint64_t v61 = *(void *)(v57 + 24);
  *(unsigned char *)(v56 + 32) = *(unsigned char *)(v57 + 32);
  *(void *)(v56 + 24) = v61;
  *(void *)(v56 + 40) = *(void *)(v57 + 40);
  uint64_t v62 = *(void *)(v57 + 56);
  *(void *)(v56 + 48) = *(void *)(v57 + 48);
  *(void *)(v56 + 56) = v62;
  swift_retain();
  swift_release();
  uint64_t v63 = a3[8];
  uint64_t v64 = a1 + v63;
  uint64_t v65 = (void *)(a2 + v63);
  uint64_t v66 = *(void *)(a2 + v63);
  LOBYTE(v53) = *(unsigned char *)(a2 + v63 + 8);
  sub_25C62C450(v66, v53);
  uint64_t v67 = *(void *)v64;
  char v68 = *(unsigned char *)(v64 + 8);
  *(void *)uint64_t v64 = v66;
  *(unsigned char *)(v64 + 8) = v53;
  sub_25C62C6E4(v67, v68);
  *(void *)(v64 + 16) = v65[2];
  *(void *)(v64 + 24) = v65[3];
  *(void *)(v64 + 32) = v65[4];
  uint64_t v69 = v65[6];
  *(void *)(v64 + 40) = v65[5];
  *(void *)(v64 + 48) = v69;
  swift_retain();
  swift_release();
  uint64_t v70 = a3[9];
  uint64_t v71 = a1 + v70;
  uint64_t v72 = a2 + v70;
  uint64_t v73 = *(void *)v72;
  char v74 = *(unsigned char *)(v72 + 8);
  sub_25C62C450(*(void *)v72, v74);
  uint64_t v75 = *(void *)v71;
  char v76 = *(unsigned char *)(v71 + 8);
  *(void *)uint64_t v71 = v73;
  *(unsigned char *)(v71 + 8) = v74;
  sub_25C62C6E4(v75, v76);
  return a1;
}

_OWORD *sub_25C640BF4(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  uint64_t v8 = (int *)sub_25C662CE0();
  uint64_t v9 = v8[8];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25C6628A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *((unsigned char *)a1 + v8[9]) = *((unsigned char *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  uint64_t v13 = v8[12];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_25C662CD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    unsigned char *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    uint64_t v18 = *(int *)(v16 + 28);
    uint64_t v19 = &v14[v18];
    uint64_t v20 = &v15[v18];
    uint64_t v21 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(void *)((char *)a1 + v8[13]) = *(void *)((char *)a2 + v8[13]);
  uint64_t v23 = v8[14];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_25C662B70();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  uint64_t v28 = type metadata accessor for RenderableEvent();
  uint64_t v29 = *(int *)(v28 + 20);
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = sub_25C662C10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
  *(_OWORD *)((char *)a1 + *(int *)(v28 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v28 + 24));
  uint64_t v33 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
  uint64_t v37 = a3[7];
  uint64_t v38 = a3[8];
  int v39 = (_OWORD *)((char *)a1 + v37);
  int v40 = (_OWORD *)((char *)a2 + v37);
  long long v41 = v40[1];
  *int v39 = *v40;
  v39[1] = v41;
  long long v42 = v40[3];
  v39[2] = v40[2];
  v39[3] = v42;
  uint64_t v43 = (char *)a1 + v38;
  uint64_t v44 = (char *)a2 + v38;
  long long v45 = *((_OWORD *)v44 + 1);
  *(_OWORD *)uint64_t v43 = *(_OWORD *)v44;
  *((_OWORD *)v43 + 1) = v45;
  *((_OWORD *)v43 + 2) = *((_OWORD *)v44 + 2);
  *((void *)v43 + 6) = *((void *)v44 + 6);
  uint64_t v46 = a3[9];
  uint64_t v47 = (char *)a1 + v46;
  uint64_t v48 = (char *)a2 + v46;
  v47[8] = v48[8];
  *(void *)uint64_t v47 = *(void *)v48;
  return a1;
}

uint64_t sub_25C640FB0(uint64_t a1, uint64_t a2, int *a3)
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
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v16 = v11[10];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v11[11];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = v11[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  int v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v39 = *(int *)(v29 + 28);
      uint64_t v40 = v27 + v39;
      long long v41 = (const void *)(v28 + v39);
      sub_25C641FE8(v40, MEMORY[0x263F6CD68]);
      uint64_t v42 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v85 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v85 - 8) + 32))(v40, v41, v85);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v36 = *(void *)(*(void *)(v42 - 8) + 64);
      uint64_t v37 = (void *)v40;
      uint64_t v38 = v41;
LABEL_8:
      memcpy(v37, v38, v36);
      goto LABEL_14;
    }
    sub_25C641FE8(v27, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v36 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v37 = (void *)v27;
    uint64_t v38 = (const void *)v28;
    goto LABEL_8;
  }
  if (v31) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  uint64_t v32 = *(int *)(v29 + 28);
  uint64_t v33 = (void *)(v27 + v32);
  uint64_t v34 = (const void *)(v28 + v32);
  uint64_t v35 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    uint64_t v43 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  uint64_t v44 = v11[14];
  long long v45 = (void *)(a1 + v44);
  uint64_t v46 = (const void *)(a2 + v44);
  uint64_t v47 = sub_25C662B70();
  int v48 = __swift_getEnumTagSinglePayload((uint64_t)v45, 1, v47);
  int v49 = __swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47);
  if (!v48)
  {
    uint64_t v50 = *(void *)(v47 - 8);
    if (!v49)
    {
      (*(void (**)(void *, const void *, uint64_t))(v50 + 40))(v45, v46, v47);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v50 + 8))(v45, v47);
    goto LABEL_19;
  }
  if (v49)
  {
LABEL_19:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v45, v46, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
  __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
LABEL_20:
  uint64_t v52 = type metadata accessor for RenderableEvent();
  uint64_t v53 = *(int *)(v52 + 20);
  uint64_t v54 = a1 + v53;
  uint64_t v55 = a2 + v53;
  uint64_t v56 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 40))(v54, v55, v56);
  uint64_t v57 = *(int *)(v52 + 24);
  uint64_t v58 = (void *)(a1 + v57);
  uint64_t v59 = (uint64_t *)(a2 + v57);
  uint64_t v61 = *v59;
  uint64_t v60 = v59[1];
  void *v58 = v61;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  uint64_t v62 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v63 = a1 + v62;
  uint64_t v64 = a2 + v62;
  uint64_t v65 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 40))(v63, v64, v65);
  uint64_t v66 = a3[7];
  uint64_t v67 = a1 + v66;
  uint64_t v68 = a2 + v66;
  char v69 = *(unsigned char *)(a2 + v66 + 8);
  uint64_t v70 = *(void *)(a1 + v66);
  char v71 = *(unsigned char *)(a1 + v66 + 8);
  *(void *)uint64_t v67 = *(void *)(a2 + v66);
  *(unsigned char *)(v67 + 8) = v69;
  sub_25C62C6E4(v70, v71);
  *(void *)(v67 + 16) = *(void *)(v68 + 16);
  *(void *)(v67 + 24) = *(void *)(v68 + 24);
  *(unsigned char *)(v67 + 32) = *(unsigned char *)(v68 + 32);
  *(void *)(v67 + 40) = *(void *)(v68 + 40);
  *(_OWORD *)(v67 + 48) = *(_OWORD *)(v68 + 48);
  swift_release();
  uint64_t v72 = a3[8];
  uint64_t v73 = a1 + v72;
  uint64_t v74 = a2 + v72;
  char v75 = *(unsigned char *)(a2 + v72 + 8);
  uint64_t v76 = *(void *)(a1 + v72);
  char v77 = *(unsigned char *)(a1 + v72 + 8);
  *(void *)uint64_t v73 = *(void *)(a2 + v72);
  *(unsigned char *)(v73 + 8) = v75;
  sub_25C62C6E4(v76, v77);
  *(_OWORD *)(v73 + 16) = *(_OWORD *)(v74 + 16);
  *(void *)(v73 + 32) = *(void *)(v74 + 32);
  *(_OWORD *)(v73 + 40) = *(_OWORD *)(v74 + 40);
  swift_release();
  uint64_t v78 = a3[9];
  uint64_t v79 = a1 + v78;
  uint64_t v80 = (uint64_t *)(a2 + v78);
  uint64_t v81 = *v80;
  LOBYTE(v80) = *((unsigned char *)v80 + 8);
  uint64_t v82 = *(void *)v79;
  char v83 = *(unsigned char *)(v79 + 8);
  *(void *)uint64_t v79 = v81;
  *(unsigned char *)(v79 + 8) = (_BYTE)v80;
  sub_25C62C6E4(v82, v83);
  return a1;
}

uint64_t sub_25C6415D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6415EC);
}

uint64_t sub_25C6415EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  sub_25C663590();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 28) + 48);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_25C6416A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6416B8);
}

void sub_25C6416B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_25C663590();
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28) + 48) = (a2 - 1);
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for SingleEventView()
{
  uint64_t result = qword_26A5BC840;
  if (!qword_26A5BC840) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6417B4()
{
  uint64_t result = type metadata accessor for RenderableEvent();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C663590();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C6418A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C6418BC()
{
  return sub_25C663620();
}

uint64_t sub_25C6418D4()
{
  return sub_25C663610();
}

double sub_25C6418EC@<D0>(_OWORD *a1@<X8>)
{
  double result = 10.0;
  *a1 = xmmword_25C6644F0;
  return result;
}

uint64_t sub_25C6418FC()
{
  return sub_25C663600();
}

uint64_t sub_25C641914()
{
  return sub_25C6635F0();
}

uint64_t sub_25C64192C()
{
  return sub_25C663640();
}

uint64_t sub_25C641944()
{
  return sub_25C6635E0();
}

uint64_t sub_25C641960()
{
  unint64_t v1 = (int *)type metadata accessor for SingleEventView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_25C662CE0();
  sub_25C6628A0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v7();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = v0 + v3 + *(int *)(v6 + 48);
  uint64_t v9 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v8, 1, v9))
  {
    uint64_t v10 = v8 + *(int *)(v9 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_25C6629F0();
      OUTLINED_FUNCTION_1();
      (*(void (**)(uint64_t))(v11 + 8))(v10);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = v5 + *(int *)(v6 + 56);
  uint64_t v13 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v12, 1, v13)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  type metadata accessor for RenderableEvent();
  sub_25C662C10();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v14();
  swift_bridgeObjectRelease();
  sub_25C663590();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v15();
  sub_25C62C6E4(*(void *)(v5 + v1[7]), *(unsigned char *)(v5 + v1[7] + 8));
  swift_release();
  sub_25C62C6E4(*(void *)(v5 + v1[8]), *(unsigned char *)(v5 + v1[8] + 8));
  swift_release();
  sub_25C62C6E4(*(void *)(v5 + v1[9]), *(unsigned char *)(v5 + v1[9] + 8));
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25C641C54@<X0>(char *a1@<X8>)
{
  type metadata accessor for SingleEventView();
  return sub_25C63E65C(a1);
}

id sub_25C641CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  if (a3)
  {
    sub_25C6420B0(0, &qword_26A5BC8D8);
    uint64_t v16 = (void *)sub_25C663770();
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if (a4)
    {
LABEL_3:
      sub_25C6420B0(0, &qword_26A5BC8D0);
      uint64_t v17 = (void *)sub_25C663770();
      swift_bridgeObjectRelease();
      if (a5) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  uint64_t v17 = 0;
  if (a5)
  {
LABEL_4:
    sub_25C6420B0(0, &qword_26A5BC8D0);
    uint64_t v18 = (void *)sub_25C663770();
    swift_bridgeObjectRelease();
    if (a6) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v19 = 0;
    if (a7) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v18 = 0;
  if (!a6) {
    goto LABEL_10;
  }
LABEL_5:
  sub_25C6420B0(0, &qword_26A5BC8D0);
  uint64_t v19 = (void *)sub_25C663770();
  swift_bridgeObjectRelease();
  if (a7)
  {
LABEL_6:
    sub_25C6420B0(0, &qword_26A5BC8D0);
    uint64_t v20 = (void *)sub_25C663770();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v20 = 0;
LABEL_12:
  if (a8)
  {
    sub_25C6420B0(0, &qword_26A5BC8D0);
    uint64_t v21 = (void *)sub_25C663770();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = objc_msgSend(v24, sel_initRecurrenceWithFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_, a1, a2, v16, v17, v18, v19, v20, v21, a9);

  return v22;
}

uint64_t sub_25C641EFC()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  v2(v1);
  OUTLINED_FUNCTION_1();
  uint64_t v3 = OUTLINED_FUNCTION_2();
  v4(v3);
  return v0;
}

uint64_t sub_25C641F4C()
{
  uint64_t v2 = OUTLINED_FUNCTION_7_0();
  v3(v2);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_25C641FA0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C641FE8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v3();
  return a1;
}

unint64_t sub_25C64203C()
{
  unint64_t result = qword_26A5BC8C8;
  if (!qword_26A5BC8C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC8C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC8C8);
  }
  return result;
}

uint64_t sub_25C6420B0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25C6420EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return 0;
}

void *sub_25C64220C(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    if ((unint64_t)(v7 - 1) < 3 || v7 == 4)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = a2[2];
    }
    else
    {
      *a1 = *a2;
      a1[1] = v7;
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
    }
    uint64_t v9 = a2[4];
    a1[3] = a2[3];
    a1[4] = v9;
    uint64_t v10 = a2[6];
    a1[5] = a2[5];
    a1[6] = v10;
    uint64_t v11 = (int *)sub_25C662CA0();
    uint64_t v12 = v11[7];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_25C6629F0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
      memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
    }
    uint64_t v17 = v11[8];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v17, 1, v15))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v18, v19, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v15);
    }
    *((unsigned char *)a1 + v11[9]) = *((unsigned char *)a2 + v11[9]);
    *((unsigned char *)a1 + v11[10]) = *((unsigned char *)a2 + v11[10]);
    *(void *)((char *)a1 + v11[11]) = *(void *)((char *)a2 + v11[11]);
    uint64_t v21 = v11[12];
    id v22 = (void *)((char *)a1 + v21);
    uint64_t v23 = (void *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *id v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = *(int *)(a3 + 20);
    uint64_t v26 = (char *)a1 + v25;
    uint64_t v27 = (char *)a2 + v25;
    uint64_t v28 = sub_25C663590();
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v29(v26, v27, v28);
  }
  return a1;
}

uint64_t sub_25C6424E4(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(*(void *)(a1 + 8) - 1) >= 4) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_25C662CA0();
  uint64_t v5 = a1 + *(int *)(v4 + 28);
  uint64_t v6 = sub_25C6629F0();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  uint64_t v7 = a1 + *(int *)(v4 + 32);
  if (!__swift_getEnumTagSinglePayload(v7, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v7, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = a1 + *(int *)(a2 + 20);
  uint64_t v9 = sub_25C663590();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  return v10(v8, v9);
}

uint64_t sub_25C642654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  if ((unint64_t)(v6 - 1) < 3 || v6 == 4)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v6;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    swift_bridgeObjectRetain();
  }
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  uint64_t v9 = (int *)sub_25C662CA0();
  uint64_t v10 = v9[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = sub_25C6629F0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
  }
  uint64_t v15 = v9[8];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  if (__swift_getEnumTagSinglePayload(a2 + v15, 1, v13))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 16))(v16, v17, v13);
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v13);
  }
  *(unsigned char *)(a1 + v9[9]) = *(unsigned char *)(a2 + v9[9]);
  *(unsigned char *)(a1 + v9[10]) = *(unsigned char *)(a2 + v9[10]);
  *(void *)(a1 + v9[11]) = *(void *)(a2 + v9[11]);
  uint64_t v19 = v9[12];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = *(int *)(a3 + 20);
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = sub_25C663590();
  uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v27(v24, v25, v26);
  return a1;
}

void *sub_25C6428DC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a1[1];
  uint64_t v7 = a2[1];
  if (v6 == 4)
  {
    if ((unint64_t)(v7 - 1) < 3 || v7 == 4) {
      goto LABEL_4;
    }
LABEL_9:
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    swift_bridgeObjectRetain();
    goto LABEL_14;
  }
  if (v7 == 4)
  {
    sub_25C642D20((uint64_t)a1);
  }
  else
  {
    unint64_t v9 = v7 - 1;
    if ((unint64_t)(v6 - 1) < 3)
    {
      if (v9 < 3)
      {
LABEL_4:
        long long v8 = *(_OWORD *)a2;
        a1[2] = a2[2];
        *(_OWORD *)a1 = v8;
        goto LABEL_14;
      }
      goto LABEL_9;
    }
    if (v9 >= 3)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v10 = a2[2];
      goto LABEL_13;
    }
    sub_25C63945C((uint64_t)a1, &qword_26A5BC8E0);
  }
  uint64_t v10 = a2[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_13:
  a1[2] = v10;
LABEL_14:
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = (int *)sub_25C662CA0();
  uint64_t v12 = v11[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_25C6629F0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15);
  int v17 = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  if (EnumTagSinglePayload)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v18 = *(void *)(v15 - 8);
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v13, v15);
LABEL_19:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v13, v14, v15);
LABEL_20:
  uint64_t v20 = v11[8];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  int v23 = __swift_getEnumTagSinglePayload((uint64_t)a1 + v20, 1, v15);
  int v24 = __swift_getEnumTagSinglePayload((uint64_t)v22, 1, v15);
  if (!v23)
  {
    uint64_t v25 = *(void *)(v15 - 8);
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 24))(v21, v22, v15);
      goto LABEL_26;
    }
    (*(void (**)(char *, uint64_t))(v25 + 8))(v21, v15);
    goto LABEL_25;
  }
  if (v24)
  {
LABEL_25:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    memcpy(v21, v22, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v21, v22, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v15);
LABEL_26:
  *((unsigned char *)a1 + v11[9]) = *((unsigned char *)a2 + v11[9]);
  *((unsigned char *)a1 + v11[10]) = *((unsigned char *)a2 + v11[10]);
  *(void *)((char *)a1 + v11[11]) = *(void *)((char *)a2 + v11[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = v11[12];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = *(int *)(a3 + 20);
  int v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 24))(v31, v32, v33);
  return a1;
}

uint64_t sub_25C642D20(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C642D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = (int *)sub_25C662CA0();
  uint64_t v7 = v6[7];
  long long v8 = (void *)(a1 + v7);
  unint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25C6629F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = v6[8];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  if (__swift_getEnumTagSinglePayload(a2 + v12, 1, v10))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v13, v14, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v10);
  }
  *(unsigned char *)(a1 + v6[9]) = *(unsigned char *)(a2 + v6[9]);
  *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
  *(void *)(a1 + v6[11]) = *(void *)(a2 + v6[11]);
  *(_OWORD *)(a1 + v6[12]) = *(_OWORD *)(a2 + v6[12]);
  uint64_t v16 = *(int *)(a3 + 20);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t sub_25C642F98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6 == 4) {
    goto LABEL_7;
  }
  if (v7 == 4)
  {
    sub_25C642D20(a1);
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if ((unint64_t)(v6 - 1) < 3) {
    goto LABEL_7;
  }
  if ((unint64_t)(v7 - 1) < 3)
  {
    sub_25C63945C(a1, &qword_26A5BC8E0);
    goto LABEL_7;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRelease();
LABEL_8:
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = (int *)sub_25C662CA0();
  uint64_t v12 = v11[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_25C6629F0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15);
  int v17 = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  if (EnumTagSinglePayload)
  {
    if (!v17)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v18 = *(void *)(v15 - 8);
  if (v17)
  {
    (*(void (**)(void *, uint64_t))(v18 + 8))(v13, v15);
LABEL_13:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(void *, const void *, uint64_t))(v18 + 40))(v13, v14, v15);
LABEL_14:
  uint64_t v20 = v11[8];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (const void *)(a2 + v20);
  int v23 = __swift_getEnumTagSinglePayload(a1 + v20, 1, v15);
  int v24 = __swift_getEnumTagSinglePayload((uint64_t)v22, 1, v15);
  if (!v23)
  {
    uint64_t v25 = *(void *)(v15 - 8);
    if (!v24)
    {
      (*(void (**)(void *, const void *, uint64_t))(v25 + 40))(v21, v22, v15);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v25 + 8))(v21, v15);
    goto LABEL_19;
  }
  if (v24)
  {
LABEL_19:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
    memcpy(v21, v22, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v21, v22, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v15);
LABEL_20:
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  *(unsigned char *)(a1 + v11[10]) = *(unsigned char *)(a2 + v11[10]);
  *(void *)(a1 + v11[11]) = *(void *)(a2 + v11[11]);
  swift_bridgeObjectRelease();
  uint64_t v27 = v11[12];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (uint64_t *)(a2 + v27);
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  *uint64_t v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  uint64_t v32 = *(int *)(a3 + 20);
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  uint64_t v35 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 40))(v33, v34, v35);
  return a1;
}

uint64_t sub_25C643354(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C643368);
}

uint64_t sub_25C643368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C662CA0();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_25C663590();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_25C6433E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6433F8);
}

uint64_t sub_25C6433F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25C662CA0();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_25C663590();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for ComposeEventSnippet()
{
  uint64_t result = qword_26A5BC8E8;
  if (!qword_26A5BC8E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6434C4()
{
  uint64_t result = sub_25C662CA0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C663590();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C64358C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C6435A8@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_25C663090();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC8F8);
  return sub_25C6435F4(v1, (char *)(a1 + *(int *)(v3 + 44)));
}

uint64_t sub_25C6435F4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v66 = a2;
  uint64_t v64 = sub_25C663690();
  uint64_t v61 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v60 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC900);
  uint64_t v65 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v58 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC908);
  uint64_t v69 = *(void *)(v63 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v63);
  uint64_t v59 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v68 = (char *)&v52 - v6;
  uint64_t v7 = type metadata accessor for ComposeEventSnippet();
  uint64_t v54 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v54 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25C663510();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v55 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC910);
  uint64_t v56 = *(void *)(v57 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v57);
  uint64_t v67 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v70 = (char *)&v52 - v14;
  sub_25C643DEC((uint64_t)&v74);
  uint64_t v15 = v74;
  uint64_t v16 = v75;
  char v17 = v76;
  uint64_t v18 = v77;
  char v19 = BYTE1(v78);
  uint64_t v20 = v78;
  v71[0] = v74;
  v71[1] = v75;
  v71[2] = v76;
  uint64_t v72 = v77;
  LOWORD(v73) = v78;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC918);
  sub_25C6480CC();
  uint64_t v21 = sub_25C663240();
  sub_25C6481B4(v15, v16, v17, v18, v20, v19);
  uint64_t v77 = MEMORY[0x263F1B720];
  uint64_t v78 = MEMORY[0x263F774B0];
  uint64_t v74 = v21;
  uint64_t v72 = sub_25C662B60();
  uint64_t v73 = MEMORY[0x263F772D0];
  __swift_allocate_boxed_opaque_existential_1(v71);
  sub_25C662B50();
  uint64_t v22 = v53;
  sub_25C6485FC(v53, (uint64_t)v9, (void (*)(void))type metadata accessor for ComposeEventSnippet);
  unint64_t v23 = (*(unsigned __int8 *)(v54 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
  uint64_t v24 = swift_allocObject();
  sub_25C648258((uint64_t)v9, v24 + v23);
  sub_25C663380();
  sub_25C663500();
  sub_25C6485FC(v22, (uint64_t)v9, (void (*)(void))type metadata accessor for ComposeEventSnippet);
  uint64_t v25 = swift_allocObject();
  sub_25C648258((uint64_t)v9, v25 + v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC938);
  sub_25C6298EC(&qword_26A5BC940, &qword_26A5BC938);
  sub_25C6634B0();
  sub_25C6485FC(v22, (uint64_t)v9, (void (*)(void))type metadata accessor for ComposeEventSnippet);
  uint64_t v26 = swift_allocObject();
  sub_25C648258((uint64_t)v9, v26 + v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC948);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC950);
  unint64_t v28 = sub_25C648334();
  uint64_t v74 = v27;
  uint64_t v75 = v28;
  swift_getOpaqueTypeConformance2();
  uint64_t v29 = v58;
  sub_25C6634A0();
  uint64_t v31 = v60;
  uint64_t v30 = v61;
  uint64_t v32 = v64;
  (*(void (**)(char *, void, uint64_t))(v61 + 104))(v60, *MEMORY[0x263F778F0], v64);
  sub_25C6298EC(&qword_26A5BC980, &qword_26A5BC900);
  uint64_t v33 = v59;
  uint64_t v34 = v62;
  sub_25C6632A0();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v29, v34);
  size_t v36 = v68;
  uint64_t v35 = v69;
  uint64_t v37 = v33;
  uint64_t v38 = v63;
  (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v68, v33, v63);
  uint64_t v39 = v56;
  uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v56 + 16);
  long long v41 = v67;
  uint64_t v42 = v57;
  v40(v67, v70, v57);
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  uint64_t v44 = v36;
  uint64_t v45 = v38;
  v43(v33, v44, v38);
  uint64_t v46 = v66;
  v40(v66, v41, v42);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC988);
  int v48 = &v46[*(int *)(v47 + 48)];
  *(void *)int v48 = 0;
  v48[8] = 1;
  v43(&v46[*(int *)(v47 + 64)], v33, v45);
  int v49 = *(void (**)(char *, uint64_t))(v69 + 8);
  v49(v68, v45);
  uint64_t v50 = *(void (**)(char *, uint64_t))(v39 + 8);
  v50(v70, v42);
  v49(v37, v45);
  return ((uint64_t (*)(char *, uint64_t))v50)(v67, v42);
}

double sub_25C643DEC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 8);
  if ((unint64_t)(v3 - 1) < 2) {
    goto LABEL_4;
  }
  if (v3 != 3)
  {
    if (v3 != 4)
    {
      OUTLINED_FUNCTION_29();
      sub_25C663060();
      OUTLINED_FUNCTION_27();
      if (qword_26A5BC340 == -1)
      {
LABEL_10:
        id v5 = (id)qword_26A5BE0E0;
        uint64_t v6 = OUTLINED_FUNCTION_6_0();
        uint64_t v8 = v7;
        char v10 = v9 & 1;
        sub_25C629930(v6, v7, v9 & 1);
        swift_bridgeObjectRetain();
        sub_25C6630F0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC930);
        sub_25C648148();
        sub_25C6630F0();
        sub_25C629890(v6, v8, v10);
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
LABEL_12:
      swift_once();
      goto LABEL_10;
    }
LABEL_4:
    sub_25C663060();
    OUTLINED_FUNCTION_27();
    if (qword_26A5BC340 == -1) {
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_29();
  sub_25C663060();
  OUTLINED_FUNCTION_27();
  if (qword_26A5BC340 != -1) {
    swift_once();
  }
  id v4 = (id)qword_26A5BE0E0;
  OUTLINED_FUNCTION_6_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC930);
  sub_25C648148();
  sub_25C6630F0();
LABEL_11:
  double result = *(double *)&v12;
  *(_OWORD *)a1 = v12;
  *(_OWORD *)(a1 + 16) = v13;
  *(unsigned char *)(a1 + 32) = v14;
  *(unsigned char *)(a1 + 33) = v15;
  return result;
}

void sub_25C6440BC(uint64_t a1)
{
  uint64_t v2 = sub_25C662CA0();
  MEMORY[0x270FA5388](v2 - 8);
  sub_25C6485FC(a1, (uint64_t)&v4[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], MEMORY[0x263F6CD60]);
  sub_25C662C40();
  sub_25C663870();
  __break(1u);
}

uint64_t sub_25C64419C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC998);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v42 = (uint64_t)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v34 - v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9A0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v41 = (uint64_t)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v34 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9A8);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  char v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v34 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9B0);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v34 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9B8);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v26 = (char *)&v34 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  unint64_t v28 = (char *)&v34 - v27;
  sub_25C6445CC();
  uint64_t v39 = v22;
  sub_25C644AC4();
  uint64_t v38 = v16;
  sub_25C6450E4();
  size_t v36 = v10;
  sub_25C645ED4();
  uint64_t v34 = v5;
  sub_25C6460D8();
  uint64_t v40 = v26;
  sub_25C62973C((uint64_t)v28, (uint64_t)v26, &qword_26A5BC9B8);
  uint64_t v37 = v20;
  sub_25C62973C((uint64_t)v22, (uint64_t)v20, &qword_26A5BC9B0);
  uint64_t v35 = v14;
  sub_25C62973C((uint64_t)v16, (uint64_t)v14, &qword_26A5BC9A8);
  uint64_t v29 = v41;
  sub_25C62973C((uint64_t)v10, v41, &qword_26A5BC9A0);
  uint64_t v30 = v42;
  sub_25C62973C((uint64_t)v5, v42, &qword_26A5BC998);
  uint64_t v31 = v43;
  sub_25C62973C((uint64_t)v26, v43, &qword_26A5BC9B8);
  uint64_t v32 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9C0);
  sub_25C62973C((uint64_t)v20, v31 + v32[12], &qword_26A5BC9B0);
  sub_25C62973C((uint64_t)v14, v31 + v32[16], &qword_26A5BC9A8);
  sub_25C62973C(v29, v31 + v32[20], &qword_26A5BC9A0);
  sub_25C62973C(v30, v31 + v32[24], &qword_26A5BC998);
  sub_25C63945C((uint64_t)v34, &qword_26A5BC998);
  sub_25C63945C((uint64_t)v36, &qword_26A5BC9A0);
  sub_25C63945C((uint64_t)v38, &qword_26A5BC9A8);
  sub_25C63945C((uint64_t)v39, &qword_26A5BC9B0);
  sub_25C63945C((uint64_t)v28, &qword_26A5BC9B8);
  sub_25C63945C(v30, &qword_26A5BC998);
  sub_25C63945C(v29, &qword_26A5BC9A0);
  sub_25C63945C((uint64_t)v35, &qword_26A5BC9A8);
  sub_25C63945C((uint64_t)v37, &qword_26A5BC9B0);
  return sub_25C63945C((uint64_t)v40, &qword_26A5BC9B8);
}

void sub_25C6445CC()
{
  OUTLINED_FUNCTION_6();
  uint64_t v51 = v3;
  unint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA90);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA98);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_39();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCAA0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_30();
  uint64_t v13 = type metadata accessor for ComposeEventSnippet();
  uint64_t v14 = OUTLINED_FUNCTION_1_1(v13);
  uint64_t v50 = v15;
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (void (**)(unint64_t, unint64_t))((char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9E8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_3();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = v0[1];
  if ((unint64_t)(v25 - 1) < 2 || v25 == 4)
  {
    swift_storeEnumTagMultiPayload();
    sub_25C648EB8();
    sub_25C6630F0();
  }
  else
  {
    uint64_t v39 = v17;
    uint64_t v40 = (uint64_t)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v41 = v8;
    uint64_t v42 = v20;
    uint64_t v27 = v50;
    uint64_t v43 = v2;
    uint64_t v44 = v9;
    uint64_t v45 = v24;
    uint64_t v46 = v21;
    uint64_t v47 = v1;
    uint64_t v48 = v11;
    unint64_t v49 = v4;
    if (v25 == 3)
    {
      uint64_t v53 = sub_25C662B60();
      uint64_t v54 = MEMORY[0x263F772D0];
      __swift_allocate_boxed_opaque_existential_1(v52);
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_24();
      uint64_t v28 = v40;
      sub_25C6485FC((uint64_t)v0, v40, (void (*)(void))type metadata accessor for ComposeEventSnippet);
      unint64_t v29 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
      uint64_t v30 = swift_allocObject();
      sub_25C648258(v28, v30 + v29);
    }
    else
    {
      uint64_t v33 = v0[2];
      uint64_t v34 = *v0;
      uint64_t v53 = sub_25C662B60();
      uint64_t v54 = MEMORY[0x263F772D0];
      __swift_allocate_boxed_opaque_existential_1(v52);
      sub_25C648670(v34, v25);
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_24();
      uint64_t v35 = v40;
      sub_25C6485FC((uint64_t)v0, v40, (void (*)(void))type metadata accessor for ComposeEventSnippet);
      unint64_t v29 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
      uint64_t v18 = (void (**)(unint64_t, unint64_t))((v39 + v29 + 7) & 0xFFFFFFFFFFFFFFF8);
      unint64_t v4 = ((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v36 = swift_allocObject();
      sub_25C648258(v35, v36 + v29);
      uint64_t v37 = (uint64_t *)((char *)v18 + v36);
      *uint64_t v37 = v34;
      v37[1] = v25;
      *(void *)(v36 + v4) = v33;
    }
    sub_25C6634F0();
    sub_25C648A88(&qword_26A5BC9D8, MEMORY[0x263F77670]);
    OUTLINED_FUNCTION_35();
    uint64_t v31 = OUTLINED_FUNCTION_21();
    v32(v31);
    swift_storeEnumTagMultiPayload();
    sub_25C6298EC(&qword_26A5BCA88, &qword_26A5BC9E8);
    uint64_t v38 = v47;
    sub_25C6630F0();
    sub_25C62973C(v38, v41, &qword_26A5BCAA0);
    swift_storeEnumTagMultiPayload();
    sub_25C648EB8();
    sub_25C6630F0();
    sub_25C63945C(v38, &qword_26A5BCAA0);
    v18[1](v29, v4);
  }
  OUTLINED_FUNCTION_5_0();
}

void sub_25C644AC4()
{
  OUTLINED_FUNCTION_6();
  uint64_t v61 = v2;
  uint64_t v60 = sub_25C663530();
  OUTLINED_FUNCTION_0();
  uint64_t v57 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_38();
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA78);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_4_0();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9B0);
  uint64_t v7 = OUTLINED_FUNCTION_12(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_11_0();
  uint64_t v59 = v8;
  uint64_t v9 = type metadata accessor for ComposeEventSnippet();
  uint64_t v10 = OUTLINED_FUNCTION_1_1(v9);
  uint64_t v12 = v11;
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9E8);
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_3();
  uint64_t v22 = v21 - v20;
  uint64_t v23 = v0[4];
  if (v23)
  {
    uint64_t v57 = v0[3];
    uint64_t v65 = sub_25C662B60();
    uint64_t v66 = MEMORY[0x263F772D0];
    __swift_allocate_boxed_opaque_existential_1(&v62);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_24();
    sub_25C6485FC((uint64_t)v0, (uint64_t)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ComposeEventSnippet);
    unint64_t v24 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    unint64_t v25 = (v14 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v26 = swift_allocObject();
    sub_25C648258((uint64_t)v15, v26 + v24);
    uint64_t v27 = (uint64_t *)(v26 + v25);
    *uint64_t v27 = v57;
    v27[1] = v23;
    sub_25C6634F0();
    sub_25C648A88(&qword_26A5BC9D8, MEMORY[0x263F77670]);
    sub_25C6635D0();
    OUTLINED_FUNCTION_25();
    v28();
    swift_storeEnumTagMultiPayload();
    sub_25C6298EC(&qword_26A5BCA88, &qword_26A5BC9E8);
    sub_25C648A88(&qword_26A5BCA28, MEMORY[0x263F776E0]);
    uint64_t v29 = v59;
    sub_25C6630F0();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v22, v16);
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA80);
    OUTLINED_FUNCTION_14_0(v29, v31, v32, v30);
    uint64_t v33 = v29;
  }
  else
  {
    uint64_t v34 = v57;
    uint64_t v56 = v16;
    uint64_t v35 = v60;
    uint64_t v36 = v0[1];
    if (v36 == 4) {
      goto LABEL_9;
    }
    uint64_t v37 = v0[2];
    uint64_t v62 = *v0;
    uint64_t v38 = v62;
    uint64_t v63 = v36;
    uint64_t v64 = v37;
    long long v67 = xmmword_25C6646D0;
    uint64_t v68 = 0;
    sub_25C648670(v62, v36);
    sub_25C648670(v38, v36);
    sub_25C648688();
    char v39 = sub_25C663720();
    sub_25C6486D4(v62, v63);
    sub_25C6486EC(v38, v36);
    if ((v39 & 1) == 0)
    {
LABEL_9:
      uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA80);
      __swift_storeEnumTagSinglePayload(v61, 1, 1, v55);
      goto LABEL_10;
    }
    uint64_t v40 = sub_25C663060();
    uint64_t v42 = v41;
    char v44 = v43;
    if (qword_26A5BC340 != -1) {
      swift_once();
    }
    id v45 = (id)qword_26A5BE0E0;
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_36();
    sub_25C663220();
    OUTLINED_FUNCTION_46();
    uint64_t v47 = v46;
    uint64_t v65 = MEMORY[0x263F1A830];
    uint64_t v66 = MEMORY[0x263F77348];
    uint64_t v48 = swift_allocObject();
    uint64_t v62 = v48;
    *(void *)(v48 + 16) = v40;
    *(void *)(v48 + 24) = v42;
    *(unsigned char *)(v48 + 32) = v44 & 1;
    *(void *)(v48 + 40) = v47;
    sub_25C663520();
    OUTLINED_FUNCTION_25();
    v50(v49);
    swift_storeEnumTagMultiPayload();
    sub_25C6298EC(&qword_26A5BCA88, &qword_26A5BC9E8);
    sub_25C648A88(&qword_26A5BCA28, MEMORY[0x263F776E0]);
    uint64_t v51 = v59;
    sub_25C6630F0();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v1, v35);
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA80);
    OUTLINED_FUNCTION_14_0(v51, v53, v54, v52);
    uint64_t v33 = v51;
  }
  sub_25C648AD0(v33, v61, &qword_26A5BC9B0);
LABEL_10:
  OUTLINED_FUNCTION_5_0();
}

void sub_25C6450E4()
{
  OUTLINED_FUNCTION_6();
  uint64_t v149 = v1;
  uint64_t v143 = sub_25C663530();
  OUTLINED_FUNCTION_0();
  uint64_t v131 = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_11_0();
  uint64_t v130 = v4;
  uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9F0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_11_0();
  uint64_t v141 = v6;
  uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9F8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_11_0();
  uint64_t v138 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9A8);
  uint64_t v10 = OUTLINED_FUNCTION_12(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_11_0();
  uint64_t v142 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9A0);
  uint64_t v13 = OUTLINED_FUNCTION_12(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_43();
  uint64_t v148 = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA00);
  uint64_t v17 = OUTLINED_FUNCTION_12(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_43();
  uint64_t v137 = v19;
  uint64_t v20 = type metadata accessor for ComposeEventSnippet();
  uint64_t v21 = OUTLINED_FUNCTION_1_1(v20);
  uint64_t v133 = v22;
  uint64_t v24 = *(void *)(v23 + 64);
  MEMORY[0x270FA5388](v21);
  uint64_t v147 = (uint64_t)v120 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA08);
  OUTLINED_FUNCTION_0();
  uint64_t v146 = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_5();
  uint64_t v145 = v27;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_43();
  uint64_t v151 = v29;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
  uint64_t v31 = OUTLINED_FUNCTION_12(v30);
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v32);
  uint64_t v34 = (char *)v120 - v33;
  uint64_t v35 = sub_25C6629F0();
  OUTLINED_FUNCTION_0();
  uint64_t v150 = v36;
  uint64_t v38 = *(void *)(v37 + 64);
  uint64_t v40 = MEMORY[0x270FA5388](v39);
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_43();
  uint64_t v144 = v41;
  MEMORY[0x270FA5388](v42);
  char v44 = (char *)v120 - v43;
  uint64_t v45 = sub_25C662CA0();
  sub_25C62973C((uint64_t)v0 + *(int *)(v45 + 28), (uint64_t)v34, &qword_26A5BC430);
  if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35) != 1)
  {
    v127 = (char *)v120 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v71 = v150;
    uint64_t v72 = v150;
    uint64_t v130 = v24;
    uint64_t v73 = *(void (**)(void))(v150 + 32);
    OUTLINED_FUNCTION_48();
    v73();
    uint64_t v126 = sub_25C662B60();
    *((void *)&v153 + 1) = v126;
    uint64_t v154 = MEMORY[0x263F772D0];
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v152);
    OUTLINED_FUNCTION_24();
    v128 = v0;
    uint64_t v74 = (uint64_t)v0;
    uint64_t v75 = v147;
    sub_25C6485FC(v74, v147, (void (*)(void))type metadata accessor for ComposeEventSnippet);
    uint64_t v76 = *(void (**)(uint64_t, char *, uint64_t))(v71 + 16);
    uint64_t v131 = v44;
    uint64_t v121 = v76;
    v76(v144, v44, v35);
    uint64_t v77 = *(unsigned __int8 *)(v133 + 80);
    uint64_t v133 = v45;
    uint64_t v78 = (v77 + 16) & ~v77;
    uint64_t v79 = v78 + v130;
    uint64_t v80 = v77 | 7;
    v120[2] = v71 + 16;
    uint64_t v81 = *(unsigned __int8 *)(v71 + 80);
    uint64_t v124 = v78 + v130 + 1;
    uint64_t v82 = (v124 + v81) & ~v81;
    uint64_t v125 = v80;
    v120[1] = v82 + v38;
    v120[0] = v80 | v81;
    uint64_t v83 = swift_allocObject();
    uint64_t v130 = v78;
    sub_25C648258(v75, v83 + v78);
    uint64_t v129 = v79;
    *(unsigned char *)(v83 + v79) = 1;
    v120[3] = v82;
    uint64_t v123 = v72 + 32;
    uint64_t v122 = v73;
    OUTLINED_FUNCTION_48();
    v73();
    uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA30);
    sub_25C6298EC(&qword_26A5BCA38, &qword_26A5BCA30);
    sub_25C6635D0();
    uint64_t v85 = (uint64_t)v128;
    uint64_t v86 = v132;
    sub_25C62973C((uint64_t)v128 + *(int *)(v133 + 32), v132, &qword_26A5BC430);
    if (__swift_getEnumTagSinglePayload(v86, 1, v35) == 1)
    {
      sub_25C63945C(v86, &qword_26A5BC430);
      uint64_t v87 = 1;
      uint64_t v88 = v147;
      uint64_t v89 = v148;
      uint64_t v90 = v137;
      uint64_t v91 = v136;
      uint64_t v92 = v129;
    }
    else
    {
      uint64_t v94 = v127;
      uint64_t v95 = v122;
      OUTLINED_FUNCTION_48();
      v95();
      uint64_t v154 = 0;
      long long v152 = 0u;
      long long v153 = 0u;
      uint64_t v88 = v147;
      sub_25C6485FC(v85, v147, (void (*)(void))type metadata accessor for ComposeEventSnippet);
      v121(v144, v94, v35);
      uint64_t v96 = swift_allocObject();
      uint64_t v132 = v84;
      OUTLINED_FUNCTION_32(v96);
      uint64_t v97 = v129;
      *(unsigned char *)(v85 + v129) = 0;
      OUTLINED_FUNCTION_48();
      v95();
      uint64_t v98 = v145;
      sub_25C6635D0();
      (*(void (**)(char *, uint64_t))(v150 + 8))(v94, v35);
      uint64_t v90 = v137;
      uint64_t v91 = v136;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v146 + 32))(v137, v98, v136);
      uint64_t v87 = 0;
      uint64_t v89 = v148;
      uint64_t v92 = v97;
    }
    uint64_t v147 = v35;
    uint64_t v99 = 1;
    __swift_storeEnumTagSinglePayload(v90, v87, 1, v91);
    int v100 = *(unsigned __int8 *)(v85 + *(int *)(v133 + 40));
    uint64_t v101 = v151;
    if (v100 != 4)
    {
      *((void *)&v153 + 1) = v126;
      uint64_t v154 = MEMORY[0x263F772D0];
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v152);
      OUTLINED_FUNCTION_24();
      sub_25C6485FC(v85, v88, (void (*)(void))type metadata accessor for ComposeEventSnippet);
      uint64_t v102 = swift_allocObject();
      OUTLINED_FUNCTION_32(v102);
      *(unsigned char *)(v85 + v92) = v100;
      sub_25C6634F0();
      sub_25C648A88(&qword_26A5BC9D8, MEMORY[0x263F77670]);
      sub_25C6635D0();
      uint64_t v99 = 0;
    }
    uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9E8);
    __swift_storeEnumTagSinglePayload(v89, v99, 1, v103);
    uint64_t v104 = v146;
    uint64_t v105 = *(void (**)(uint64_t, uint64_t, uint64_t))(v146 + 16);
    uint64_t v106 = v89;
    uint64_t v107 = v145;
    v105(v145, v101, v91);
    uint64_t v108 = v134;
    sub_25C62973C(v90, v134, &qword_26A5BCA00);
    uint64_t v109 = v106;
    uint64_t v110 = v135;
    sub_25C62973C(v109, v135, &qword_26A5BC9A0);
    uint64_t v111 = v138;
    v105(v138, v107, v91);
    uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA40);
    sub_25C62973C(v108, v111 + *(int *)(v112 + 48), &qword_26A5BCA00);
    sub_25C62973C(v110, v111 + *(int *)(v112 + 64), &qword_26A5BC9A0);
    sub_25C63945C(v110, &qword_26A5BC9A0);
    sub_25C63945C(v108, &qword_26A5BCA00);
    uint64_t v113 = *(void (**)(uint64_t, uint64_t))(v104 + 8);
    v113(v107, v91);
    sub_25C62973C(v111, v141, &qword_26A5BC9F8);
    swift_storeEnumTagMultiPayload();
    sub_25C6298EC(&qword_26A5BCA20, &qword_26A5BC9F8);
    sub_25C648A88(&qword_26A5BCA28, MEMORY[0x263F776E0]);
    uint64_t v114 = v91;
    uint64_t v115 = v142;
    sub_25C6630F0();
    sub_25C63945C(v111, &qword_26A5BC9F8);
    sub_25C63945C(v148, &qword_26A5BC9A0);
    sub_25C63945C(v90, &qword_26A5BCA00);
    v113(v151, v114);
    OUTLINED_FUNCTION_7();
    v116();
    uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA10);
    OUTLINED_FUNCTION_14_0(v115, v118, v119, v117);
    uint64_t v69 = v115;
    uint64_t v70 = v149;
    goto LABEL_14;
  }
  sub_25C63945C((uint64_t)v34, &qword_26A5BC430);
  uint64_t v46 = v0[1];
  uint64_t v47 = v149;
  if (v46 != 4)
  {
    uint64_t v48 = v149;
    uint64_t v49 = v0[2];
    *(void *)&long long v152 = *v0;
    uint64_t v50 = v152;
    *((void *)&v152 + 1) = v46;
    *(void *)&long long v153 = v49;
    long long v155 = xmmword_25C6646E0;
    uint64_t v156 = 0;
    sub_25C648670(v152, v46);
    sub_25C648670(v50, v46);
    sub_25C648688();
    char v51 = sub_25C663720();
    sub_25C6486D4(v152, *((uint64_t *)&v152 + 1));
    uint64_t v47 = v48;
    sub_25C6486EC(v50, v46);
    if (v51)
    {
      uint64_t v52 = sub_25C663060();
      uint64_t v54 = v53;
      char v56 = v55;
      if (qword_26A5BC340 != -1) {
        swift_once();
      }
      id v57 = (id)qword_26A5BE0E0;
      OUTLINED_FUNCTION_47();
      OUTLINED_FUNCTION_36();
      sub_25C663220();
      OUTLINED_FUNCTION_46();
      uint64_t v59 = v58;
      *((void *)&v153 + 1) = MEMORY[0x263F1A830];
      uint64_t v154 = MEMORY[0x263F77348];
      uint64_t v60 = swift_allocObject();
      *(void *)&long long v152 = v60;
      *(void *)(v60 + 16) = v52;
      *(void *)(v60 + 24) = v54;
      *(unsigned char *)(v60 + 32) = v56 & 1;
      *(void *)(v60 + 40) = v59;
      uint64_t v61 = v130;
      sub_25C663520();
      uint64_t v62 = (void (**)(uint64_t, uint64_t))v131;
      uint64_t v63 = v143;
      OUTLINED_FUNCTION_25();
      v64();
      swift_storeEnumTagMultiPayload();
      sub_25C6298EC(&qword_26A5BCA20, &qword_26A5BC9F8);
      sub_25C648A88(&qword_26A5BCA28, MEMORY[0x263F776E0]);
      uint64_t v65 = v142;
      sub_25C6630F0();
      v62[1](v61, v63);
      uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA10);
      OUTLINED_FUNCTION_14_0(v65, v67, v68, v66);
      uint64_t v69 = v65;
      uint64_t v70 = v48;
LABEL_14:
      sub_25C648AD0(v69, v70, &qword_26A5BC9A8);
      goto LABEL_15;
    }
  }
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA10);
  __swift_storeEnumTagSinglePayload(v47, 1, 1, v93);
LABEL_15:
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_25C645ED4()
{
  uint64_t v3 = OUTLINED_FUNCTION_26();
  uint64_t v4 = OUTLINED_FUNCTION_1_1(v3);
  uint64_t v6 = v5;
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v9 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_42() + 48));
  uint64_t v10 = v9[1];
  if (v10)
  {
    uint64_t v11 = *v9;
    v23[3] = sub_25C662B60();
    v23[4] = MEMORY[0x263F772D0];
    __swift_allocate_boxed_opaque_existential_1(v23);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_24();
    sub_25C6485FC(v1, v2, (void (*)(void))type metadata accessor for ComposeEventSnippet);
    unint64_t v12 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v13 = swift_allocObject();
    sub_25C648258(v2, v13 + v12);
    uint64_t v14 = (void *)(v13 + ((v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
    void *v14 = v11;
    v14[1] = v10;
    sub_25C6634F0();
    sub_25C648A88(&qword_26A5BC9D8, MEMORY[0x263F77670]);
    sub_25C6635D0();
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9E8);
    return OUTLINED_FUNCTION_14_0(v0, v16, v17, v15);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9E8);
    uint64_t v19 = OUTLINED_FUNCTION_45();
    return __swift_storeEnumTagSinglePayload(v19, v20, v21, v22);
  }
}

uint64_t sub_25C6460D8()
{
  uint64_t v3 = OUTLINED_FUNCTION_26();
  uint64_t v4 = OUTLINED_FUNCTION_1_1(v3);
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v4);
  if (*(void *)(*(void *)(v1 + *(int *)(OUTLINED_FUNCTION_42() + 44)) + 16))
  {
    v17[3] = sub_25C662B60();
    v17[4] = MEMORY[0x263F772D0];
    __swift_allocate_boxed_opaque_existential_1(v17);
    OUTLINED_FUNCTION_24();
    sub_25C6485FC(v1, v2, (void (*)(void))type metadata accessor for ComposeEventSnippet);
    unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v8 = swift_allocObject();
    sub_25C648258(v2, v8 + v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9C8);
    sub_25C6484EC();
    sub_25C6635D0();
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9E0);
    return OUTLINED_FUNCTION_14_0(v0, v10, v11, v9);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC9E0);
    uint64_t v13 = OUTLINED_FUNCTION_45();
    return __swift_storeEnumTagSinglePayload(v13, v14, v15, v16);
  }
}

uint64_t sub_25C646280()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC968);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC950);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C646408();
  char v6 = sub_25C663130();
  sub_25C662D30();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  sub_25C62973C((uint64_t)v2, (uint64_t)v5, &qword_26A5BC968);
  uint64_t v15 = &v5[*(int *)(v3 + 36)];
  *uint64_t v15 = v6;
  *((void *)v15 + 1) = v8;
  *((void *)v15 + 2) = v10;
  *((void *)v15 + 3) = v12;
  *((void *)v15 + 4) = v14;
  v15[40] = 0;
  sub_25C63945C((uint64_t)v2, &qword_26A5BC968);
  sub_25C648334();
  sub_25C663290();
  return sub_25C63945C((uint64_t)v5, &qword_26A5BC950);
}

void sub_25C646408()
{
  OUTLINED_FUNCTION_6();
  uint64_t v79 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC990);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4_0();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC968);
  uint64_t v5 = OUTLINED_FUNCTION_12(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_31();
  sub_25C6634D0();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = *(void *)(v0 + 8);
  if ((unint64_t)(v8 - 1) >= 2)
  {
    if (v8 == 3)
    {
      uint64_t v14 = sub_25C663060();
      uint64_t v71 = v15;
      uint64_t v73 = v14;
      char v69 = v16;
      uint64_t v67 = v17;
      uint64_t v18 = type metadata accessor for CalendarButtonView(0);
      uint64_t v84 = v18;
      uint64_t v66 = sub_25C648A88(&qword_26A5BC5B0, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
      uint64_t v85 = v66;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v83);
      boxed_opaque_existential_1[7] = MEMORY[0x263F6CD30];
      unint64_t v75 = sub_25C632D4C();
      boxed_opaque_existential_1[8] = v75;
      *((unsigned char *)boxed_opaque_existential_1 + 32) = 0;
      *((unsigned char *)boxed_opaque_existential_1 + 72) = 1;
      uint64_t v20 = (int *)type metadata accessor for CalendarButtonView.Model(0);
      uint64_t v77 = v1;
      uint64_t v21 = (char *)boxed_opaque_existential_1 + v20[6];
      uint64_t v22 = *MEMORY[0x263F774E0];
      uint64_t v23 = sub_25C663490();
      OUTLINED_FUNCTION_1();
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 104))(v21, v22, v23);
      uint64_t *boxed_opaque_existential_1 = v73;
      boxed_opaque_existential_1[1] = v71;
      *((unsigned char *)boxed_opaque_existential_1 + 16) = v69 & 1;
      boxed_opaque_existential_1[3] = v67;
      *(uint64_t *)((char *)boxed_opaque_existential_1 + v20[7]) = 0;
      *(uint64_t *)((char *)boxed_opaque_existential_1 + v20[8]) = 0;
      uint64_t v25 = (char *)boxed_opaque_existential_1 + *(int *)(v18 + 20);
      *(void *)uint64_t v25 = swift_getKeyPath();
      v25[8] = 0;
      sub_25C663580();
      OUTLINED_FUNCTION_29();
      uint64_t v26 = sub_25C663060();
      uint64_t v28 = v27;
      LOBYTE(v22) = v29;
      uint64_t v31 = v30;
      uint64_t v81 = v18;
      uint64_t v82 = v66;
      uint64_t v32 = __swift_allocate_boxed_opaque_existential_1(v80);
      v32[7] = MEMORY[0x263F6CD30];
      v32[8] = v75;
      *((unsigned char *)v32 + 32) = 1;
      *((unsigned char *)v32 + 72) = 1;
      OUTLINED_FUNCTION_28();
      v33();
      *uint64_t v32 = v26;
      v32[1] = v28;
      *((unsigned char *)v32 + 16) = v22 & 1;
      v32[3] = v31;
      *(uint64_t *)((char *)v32 + v20[7]) = 0;
      *(uint64_t *)((char *)v32 + v20[8]) = 0;
      uint64_t v34 = (char *)v32 + *(int *)(v18 + 20);
      *(void *)uint64_t v34 = swift_getKeyPath();
      v34[8] = 0;
      sub_25C663580();
      sub_25C6634C0();
      OUTLINED_FUNCTION_25();
      v35();
      swift_storeEnumTagMultiPayload();
      sub_25C648A88(&qword_26A5BC818, MEMORY[0x263F77660]);
      sub_25C6630F0();
      OUTLINED_FUNCTION_7();
      v36();
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC978);
      OUTLINED_FUNCTION_14_0(v77, v38, v39, v37);
      uint64_t v40 = v77;
    }
    else
    {
      if (v8 == 4) {
        goto LABEL_4;
      }
      uint64_t v41 = sub_25C663060();
      uint64_t v70 = v42;
      uint64_t v72 = v41;
      char v68 = v43;
      uint64_t v74 = v44;
      uint64_t v45 = type metadata accessor for CalendarButtonView(0);
      uint64_t v84 = v45;
      uint64_t v78 = sub_25C648A88(&qword_26A5BC5B0, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
      uint64_t v85 = v78;
      uint64_t v46 = __swift_allocate_boxed_opaque_existential_1(v83);
      v46[7] = MEMORY[0x263F6CD30];
      unint64_t v76 = sub_25C632D4C();
      v46[8] = v76;
      *((unsigned char *)v46 + 32) = 0;
      *((unsigned char *)v46 + 72) = 1;
      uint64_t v47 = (int *)type metadata accessor for CalendarButtonView.Model(0);
      uint64_t v48 = (char *)v46 + v47[6];
      uint64_t v49 = *MEMORY[0x263F774E0];
      uint64_t v50 = sub_25C663490();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v50 - 8) + 104))(v48, v49, v50);
      *uint64_t v46 = v72;
      v46[1] = v70;
      *((unsigned char *)v46 + 16) = v68 & 1;
      v46[3] = v74;
      *(uint64_t *)((char *)v46 + v47[7]) = 0;
      *(uint64_t *)((char *)v46 + v47[8]) = 0;
      char v51 = (char *)v46 + *(int *)(v45 + 20);
      *(void *)char v51 = swift_getKeyPath();
      v51[8] = 0;
      sub_25C663580();
      uint64_t v52 = sub_25C663060();
      uint64_t v54 = v53;
      LOBYTE(v49) = v55;
      uint64_t v57 = v56;
      uint64_t v81 = v45;
      uint64_t v82 = v78;
      uint64_t v58 = __swift_allocate_boxed_opaque_existential_1(v80);
      v58[7] = MEMORY[0x263F6CD30];
      v58[8] = v76;
      *((unsigned char *)v58 + 32) = 2;
      *((unsigned char *)v58 + 72) = 1;
      OUTLINED_FUNCTION_28();
      v59();
      uint64_t *v58 = v52;
      v58[1] = v54;
      *((unsigned char *)v58 + 16) = v49 & 1;
      v58[3] = v57;
      *(uint64_t *)((char *)v58 + v47[7]) = 0;
      *(uint64_t *)((char *)v58 + v47[8]) = 0;
      uint64_t v60 = (char *)v58 + *(int *)(v45 + 20);
      *(void *)uint64_t v60 = swift_getKeyPath();
      v60[8] = 0;
      sub_25C663580();
      sub_25C6634C0();
      OUTLINED_FUNCTION_25();
      v61();
      swift_storeEnumTagMultiPayload();
      sub_25C648A88(&qword_26A5BC818, MEMORY[0x263F77660]);
      sub_25C6630F0();
      OUTLINED_FUNCTION_7();
      v62();
      uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC978);
      OUTLINED_FUNCTION_14_0((uint64_t)v58, v64, v65, v63);
      uint64_t v40 = (uint64_t)v58;
    }
    sub_25C648AD0(v40, v79, &qword_26A5BC968);
    OUTLINED_FUNCTION_5_0();
    return;
  }
LABEL_4:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC978);
  OUTLINED_FUNCTION_5_0();
  __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
}

uint64_t sub_25C646BA4()
{
  sub_25C663060();
  if (qword_26A5BC340 != -1) {
    swift_once();
  }
  id v0 = (id)qword_26A5BE0E0;
  uint64_t v1 = sub_25C663220();
  uint64_t v3 = v2;
  char v5 = v4 & 1;
  sub_25C663240();
  sub_25C629890(v1, v3, v5);
  swift_bridgeObjectRelease();
  return sub_25C6634E0();
}

uint64_t sub_25C646CF0(unsigned __int8 a1, void (*a2)(uint64_t))
{
  uint64_t v3 = v2;
  int v6 = a1;
  uint64_t v7 = type metadata accessor for ComposeEventSnippet();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7 - 8);
  if (v6 == 7)
  {
    a2(v10);
    uint64_t v11 = sub_25C663240();
    sub_25C629890(v17, v18, v19);
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x263F1B720];
    uint64_t v21 = MEMORY[0x263F774B0];
    uint64_t v17 = v11;
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, uint64_t))a2)(&v17, v10);
    uint64_t v12 = sub_25C663240();
    sub_25C629890(v17, v18, v19);
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x263F1B720];
    uint64_t v21 = MEMORY[0x263F774B0];
    uint64_t v17 = v12;
    sub_25C6485FC(v3, (uint64_t)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ComposeEventSnippet);
    unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v14 = swift_allocObject();
    sub_25C648258((uint64_t)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
    *(unsigned char *)(v14 + v13 + v9) = a1;
  }
  return sub_25C6634E0();
}

uint64_t sub_25C646EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C646FC0(a3, (uint64_t)v8);
  uint64_t v3 = v8[0];
  uint64_t v4 = v8[1];
  char v5 = v9;
  uint64_t v6 = sub_25C663240();
  sub_25C629890(v3, v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v10 = MEMORY[0x263F1B720];
  uint64_t v11 = MEMORY[0x263F774B0];
  v8[0] = v6;
  return sub_25C6634E0();
}

uint64_t sub_25C646FC0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25C663050();
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  MEMORY[0x270FA5388](v5);
  if (a1)
  {
    sub_25C663040();
    sub_25C663030();
    sub_25C663020();
    sub_25C663030();
    sub_25C663070();
    if (qword_26A5BC340 == -1) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  sub_25C663040();
  sub_25C663030();
  sub_25C663010();
  sub_25C663030();
  sub_25C663070();
  if (qword_26A5BC340 != -1) {
LABEL_6:
  }
    swift_once();
LABEL_5:
  id v6 = (id)qword_26A5BE0E0;
  uint64_t result = sub_25C663220();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v8;
  *(unsigned char *)(a2 + 16) = v9 & 1;
  *(void *)(a2 + 24) = v10;
  return result;
}

uint64_t sub_25C647240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for ComposeEventSnippet();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  v12[2] = a3;
  char v13 = 0;
  uint64_t v8 = sub_25C663240();
  uint64_t v14 = MEMORY[0x263F1B720];
  uint64_t v15 = MEMORY[0x263F774B0];
  v12[1] = v8;
  sub_25C6485FC(a1, (uint64_t)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ComposeEventSnippet);
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  sub_25C648258((uint64_t)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  *(unsigned char *)(v10 + v9 + v7) = 0;
  return sub_25C6634E0();
}

uint64_t sub_25C6473BC()
{
  sub_25C62EBCC();
  if (qword_26A5BC340 != -1) {
    swift_once();
  }
  id v0 = (id)qword_26A5BE0E0;
  uint64_t v1 = sub_25C663220();
  uint64_t v3 = v2;
  char v5 = v4 & 1;
  sub_25C663240();
  sub_25C629890(v1, v3, v5);
  swift_bridgeObjectRelease();
  return sub_25C6634E0();
}

uint64_t sub_25C6474F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for ComposeEventSnippet();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  v12[2] = a3;
  char v13 = 0;
  uint64_t v8 = sub_25C663240();
  uint64_t v14 = MEMORY[0x263F1B720];
  uint64_t v15 = MEMORY[0x263F774B0];
  v12[1] = v8;
  sub_25C6485FC(a1, (uint64_t)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ComposeEventSnippet);
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  sub_25C648258((uint64_t)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  *(unsigned char *)(v10 + v9 + v7) = 6;
  return sub_25C6634E0();
}

uint64_t sub_25C647674(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ComposeEventSnippet();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  v8[1] = *(void *)(a1 + *(int *)(sub_25C662CA0() + 44));
  sub_25C6485FC(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ComposeEventSnippet);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_25C648258((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC390);
  sub_25C662A20();
  sub_25C6634F0();
  sub_25C6298EC(&qword_26A5BC3A0, &qword_26A5BC390);
  sub_25C648A88(&qword_26A5BC9D8, MEMORY[0x263F77670]);
  sub_25C648A88(&qword_26A5BC3C8, MEMORY[0x263F6CD50]);
  return sub_25C663460();
}

uint64_t sub_25C647894()
{
  return sub_25C6634E0();
}

void sub_25C647918(uint64_t a1)
{
  uint64_t v2 = sub_25C662CA0();
  MEMORY[0x270FA5388](v2 - 8);
  sub_25C6485FC(a1, (uint64_t)&v4[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], MEMORY[0x263F6CD60]);
  sub_25C662C40();
  sub_25C663870();
  __break(1u);
}

uint64_t sub_25C647A00@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  char v43 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA48);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v44 = (uint64_t)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v41 = (char *)&v39 - v10;
  uint64_t v11 = sub_25C6634F0();
  uint64_t v12 = *(void **)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v42 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v39 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v39 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v39 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v39 - v24;
  uint64_t v39 = a3;
  uint64_t v45 = a3;
  int v40 = a2;
  if (a2) {
    unsigned __int8 v26 = 1;
  }
  else {
    unsigned __int8 v26 = 3;
  }
  sub_25C646CF0(v26, (void (*)(uint64_t))sub_25C648A00);
  uint64_t v27 = (void (*)(char *, char *, uint64_t))v12[4];
  v27(v25, v23, v11);
  uint64_t v28 = sub_25C662CA0();
  if (*(unsigned char *)(a1 + *(int *)(v28 + 36)))
  {
    uint64_t v29 = 1;
    uint64_t v30 = (uint64_t)v41;
  }
  else
  {
    MEMORY[0x270FA5388](v28);
    *(&v39 - 2) = v39;
    if (v40) {
      unsigned __int8 v31 = 2;
    }
    else {
      unsigned __int8 v31 = 4;
    }
    sub_25C646CF0(v31, (void (*)(uint64_t))sub_25C648A44);
    v27(v20, v17, v11);
    uint64_t v30 = (uint64_t)v41;
    v27(v41, v20, v11);
    uint64_t v29 = 0;
  }
  __swift_storeEnumTagSinglePayload(v30, v29, 1, v11);
  uint64_t v32 = (void (*)(char *, char *, uint64_t))v12[2];
  uint64_t v33 = v42;
  v32(v42, v25, v11);
  uint64_t v34 = v44;
  sub_25C62973C(v30, v44, &qword_26A5BCA48);
  uint64_t v35 = v43;
  v32(v43, v33, v11);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA50);
  sub_25C62973C(v34, (uint64_t)&v35[*(int *)(v36 + 48)], &qword_26A5BCA48);
  sub_25C63945C(v30, &qword_26A5BCA48);
  uint64_t v37 = (void (*)(char *, uint64_t))v12[1];
  v37(v25, v11);
  sub_25C63945C(v34, &qword_26A5BCA48);
  return ((uint64_t (*)(char *, uint64_t))v37)(v33, v11);
}

void sub_25C647DA8()
{
  OUTLINED_FUNCTION_6();
  uint64_t v38 = v1;
  uint64_t v39 = v2;
  uint64_t v37 = v3;
  uint64_t v5 = v4;
  uint64_t v6 = sub_25C6628E0();
  uint64_t v7 = OUTLINED_FUNCTION_12(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v8 = sub_25C662B30();
  uint64_t v9 = OUTLINED_FUNCTION_12(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_30();
  uint64_t v10 = sub_25C662AF0();
  uint64_t v11 = OUTLINED_FUNCTION_12(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_39();
  uint64_t v12 = sub_25C662AC0();
  uint64_t v13 = OUTLINED_FUNCTION_12(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_38();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA58);
  uint64_t v15 = OUTLINED_FUNCTION_12(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_3();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCA60);
  uint64_t v20 = OUTLINED_FUNCTION_12(v19);
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_4_0();
  sub_25C6629D0();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_31();
  sub_25C6629F0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_3();
  uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 16))(v24 - v23, v37);
  v38(v26);
  uint64_t v27 = sub_25C662920();
  uint64_t v30 = OUTLINED_FUNCTION_14_0(v0, v28, v29, v27);
  v39(v30);
  uint64_t v31 = sub_25C662910();
  OUTLINED_FUNCTION_14_0(v18, v32, v33, v31);
  sub_25C662A40();
  sub_25C662AE0();
  sub_25C662B10();
  sub_25C6628D0();
  sub_25C662940();
  sub_25C648A88(&qword_26A5BCA68, MEMORY[0x263F07258]);
  sub_25C648A88(&qword_26A5BCA70, MEMORY[0x263F07490]);
  *(void *)uint64_t v5 = sub_25C663210();
  *(void *)(v5 + 8) = v34;
  *(unsigned char *)(v5 + 16) = v35 & 1;
  *(void *)(v5 + 24) = v36;
  OUTLINED_FUNCTION_5_0();
}

unint64_t sub_25C6480CC()
{
  unint64_t result = qword_26A5BC920;
  if (!qword_26A5BC920)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC918);
    sub_25C648148();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC920);
  }
  return result;
}

unint64_t sub_25C648148()
{
  unint64_t result = qword_26A5BC928;
  if (!qword_26A5BC928)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC930);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC928);
  }
  return result;
}

uint64_t sub_25C6481B4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    sub_25C629890(a1, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    return sub_25C648218(a1, a2, a3);
  }
}

uint64_t sub_25C648218(uint64_t a1, uint64_t a2, char a3)
{
  sub_25C629890(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C648258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComposeEventSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_25C6482BC()
{
  uint64_t v1 = type metadata accessor for ComposeEventSnippet();
  OUTLINED_FUNCTION_0_2(v1);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  sub_25C6440BC(v3);
}

uint64_t sub_25C648300()
{
  return sub_25C649288((uint64_t (*)(uint64_t))sub_25C64419C);
}

uint64_t sub_25C64831C()
{
  return sub_25C649288((uint64_t (*)(uint64_t))sub_25C646280);
}

unint64_t sub_25C648334()
{
  unint64_t result = qword_26A5BC958;
  if (!qword_26A5BC958)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC950);
    sub_25C6483B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC958);
  }
  return result;
}

unint64_t sub_25C6483B0()
{
  unint64_t result = qword_26A5BC960;
  if (!qword_26A5BC960)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC968);
    sub_25C648424();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC960);
  }
  return result;
}

unint64_t sub_25C648424()
{
  unint64_t result = qword_26A5BC970;
  if (!qword_26A5BC970)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC978);
    sub_25C648A88(&qword_26A5BC818, MEMORY[0x263F77660]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC970);
  }
  return result;
}

uint64_t sub_25C6484D4()
{
  return sub_25C649288(sub_25C647674);
}

unint64_t sub_25C6484EC()
{
  unint64_t result = qword_26A5BC9D0;
  if (!qword_26A5BC9D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC9C8);
    sub_25C648A88(&qword_26A5BC9D8, MEMORY[0x263F77670]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC9D0);
  }
  return result;
}

uint64_t sub_25C648594()
{
  uint64_t v0 = type metadata accessor for ComposeEventSnippet();
  OUTLINED_FUNCTION_0_2(v0);
  return sub_25C647894();
}

uint64_t sub_25C6485FC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = OUTLINED_FUNCTION_2();
  v5(v4);
  return a2;
}

uint64_t sub_25C648654()
{
  return sub_25C648C94((uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_25C6474F4);
}

uint64_t sub_25C648670(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) >= 3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_25C648688()
{
  unint64_t result = qword_26A5BCA18;
  if (!qword_26A5BCA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCA18);
  }
  return result;
}

uint64_t sub_25C6486D4(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) >= 3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25C6486EC(uint64_t a1, uint64_t a2)
{
  if (a2 != 4) {
    return sub_25C6486D4(a1, a2);
  }
  return a1;
}

uint64_t sub_25C6486FC()
{
  sub_25C629890(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25C64874C()
{
  uint64_t v0 = OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1_1(v0);
  return sub_25C6473BC();
}

uint64_t objectdestroy_29Tm()
{
  type metadata accessor for ComposeEventSnippet();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v19 = *(void *)(v4 + 64);
  uint64_t v5 = sub_25C6629F0();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v18 = *(void *)(v9 + 64);
  if ((unint64_t)(*(void *)(v0 + v3 + 8) - 1) >= 4) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_25C662CA0();
  if (!OUTLINED_FUNCTION_44(*(int *)(v10 + 28)))
  {
    uint64_t v11 = OUTLINED_FUNCTION_33();
    v12(v11);
  }
  if (!OUTLINED_FUNCTION_44(*(int *)(v10 + 32)))
  {
    uint64_t v13 = OUTLINED_FUNCTION_33();
    v14(v13);
  }
  uint64_t v15 = (v19 + v3 + v8 + 1) & ~v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C663590();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v16();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v15, v5);
  return MEMORY[0x270FA0238](v0, v15 + v18, v2 | v8 | 7);
}

uint64_t sub_25C648970()
{
  uint64_t v2 = OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1_1(v2);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v6 = v4 + *(void *)(v5 + 64);
  uint64_t v7 = sub_25C6629F0();
  OUTLINED_FUNCTION_0_2(v7);
  int v9 = *(unsigned __int8 *)(v1 + v6);
  uint64_t v10 = v1 + ((v6 + *(unsigned __int8 *)(v8 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return sub_25C647A00(v1 + v4, v9, v10, v0);
}

void sub_25C648A00()
{
}

void sub_25C648A44()
{
}

uint64_t sub_25C648A88(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C648AD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t objectdestroy_19Tm()
{
  OUTLINED_FUNCTION_6();
  type metadata accessor for ComposeEventSnippet();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_15_0();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C662CA0();
  OUTLINED_FUNCTION_16_0();
  if (!OUTLINED_FUNCTION_8_0())
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v1 = OUTLINED_FUNCTION_9_0();
    v2(v1);
  }
  if (!OUTLINED_FUNCTION_8_0())
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v3 = OUTLINED_FUNCTION_9_0();
    v4(v3);
  }
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v5();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_5_0();
  return MEMORY[0x270FA0238](v6, v7, v8);
}

uint64_t sub_25C648C7C()
{
  return sub_25C648C94((uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_25C647240);
}

uint64_t sub_25C648C94(uint64_t (*a1)(unint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1_1(v2);
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v8 = (*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(v1 + v8);
  uint64_t v10 = *(void *)(v1 + v8 + 8);
  return a1(v1 + v7, v9, v10);
}

uint64_t objectdestroy_16Tm()
{
  OUTLINED_FUNCTION_6();
  type metadata accessor for ComposeEventSnippet();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_15_0();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C662CA0();
  OUTLINED_FUNCTION_16_0();
  if (!OUTLINED_FUNCTION_8_0())
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v1 = OUTLINED_FUNCTION_9_0();
    v2(v1);
  }
  if (!OUTLINED_FUNCTION_8_0())
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v3 = OUTLINED_FUNCTION_9_0();
    v4(v3);
  }
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v5();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_5_0();
  return MEMORY[0x270FA0238](v6, v7, v8);
}

void sub_25C648E58()
{
  uint64_t v1 = type metadata accessor for ComposeEventSnippet();
  OUTLINED_FUNCTION_1_1(v1);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  sub_25C647918(v3);
}

unint64_t sub_25C648EB8()
{
  unint64_t result = qword_26A5BCAA8;
  if (!qword_26A5BCAA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCAA0);
    sub_25C6298EC(&qword_26A5BCA88, &qword_26A5BC9E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCAA8);
  }
  return result;
}

uint64_t sub_25C648F50()
{
  OUTLINED_FUNCTION_6();
  type metadata accessor for ComposeEventSnippet();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_15_0();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C662CA0();
  OUTLINED_FUNCTION_16_0();
  if (!OUTLINED_FUNCTION_8_0())
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v1 = OUTLINED_FUNCTION_9_0();
    v2(v1);
  }
  if (!OUTLINED_FUNCTION_8_0())
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v3 = OUTLINED_FUNCTION_9_0();
    v4(v3);
  }
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v5();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_5_0();
  return MEMORY[0x270FA0238](v6, v7, v8);
}

uint64_t sub_25C6490A4()
{
  uint64_t v1 = OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1_1(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v0 + v7);
  uint64_t v9 = *(void *)(v0 + v7 + 8);
  return sub_25C646EF8(v0 + v6, v8, v9);
}

uint64_t objectdestroyTm_3()
{
  OUTLINED_FUNCTION_6();
  type metadata accessor for ComposeEventSnippet();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_15_0();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C662CA0();
  OUTLINED_FUNCTION_16_0();
  if (!OUTLINED_FUNCTION_8_0())
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v1 = OUTLINED_FUNCTION_9_0();
    v2(v1);
  }
  if (!OUTLINED_FUNCTION_8_0())
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v3 = OUTLINED_FUNCTION_9_0();
    v4(v3);
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v5();
  OUTLINED_FUNCTION_5_0();
  return MEMORY[0x270FA0238](v6, v7, v8);
}

uint64_t sub_25C649270()
{
  return sub_25C649288((uint64_t (*)(uint64_t))sub_25C646BA4);
}

uint64_t sub_25C649288(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_0_2(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return a1(v4);
}

uint64_t sub_25C6492E4()
{
  return sub_25C6298EC(&qword_26A5BCAB0, &qword_26A5BCAB8);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_25C663220();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_14_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, a4);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return *(void *)(v0 + v1 + 8);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return sub_25C6629F0();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return *(void *)(v0 - 192);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_25C663590();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_25C662B50();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return type metadata accessor for ComposeEventSnippet();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_32(uint64_t a1)
{
  uint64_t v4 = a1 + *(void *)(v2 - 344);
  return sub_25C648258(v1, v4);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_25C6635D0();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return v0;
}

void OUTLINED_FUNCTION_37()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return sub_25C662CA0();
}

uint64_t OUTLINED_FUNCTION_44@<X0>(uint64_t a1@<X8>)
{
  return __swift_getEnumTagSinglePayload(v2 + a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return v0;
}

uint64_t sub_25C6496A0(uint64_t a1)
{
  uint64_t v3 = sub_25C662CE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v20 = (uint64_t)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RenderableEvent();
  uint64_t v19 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_25C64B730(0, v9, 0);
    uint64_t v10 = v21;
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v18 = *(void *)(v4 + 72);
    while (1)
    {
      uint64_t v12 = v20;
      sub_25C64C028(v11, v20, MEMORY[0x263F6CD78]);
      id v13 = sub_25C649978();
      sub_25C62B570(v12, v13, (uint64_t)v8);
      if (v1) {
        break;
      }
      uint64_t v21 = v10;
      unint64_t v15 = *(void *)(v10 + 16);
      unint64_t v14 = *(void *)(v10 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_25C64B730(v14 > 1, v15 + 1, 1);
        uint64_t v10 = v21;
      }
      *(void *)(v10 + 16) = v15 + 1;
      sub_25C64B068((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(void *)(v19 + 72) * v15, (void (*)(void))type metadata accessor for RenderableEvent);
      v11 += v18;
      if (!--v9)
      {
        swift_release();
        return v10;
      }
    }
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  return v10;
}

uint64_t sub_25C649924@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C662EC0();
  *a1 = result;
  return result;
}

uint64_t sub_25C649950()
{
  return sub_25C662ED0();
}

id sub_25C649978()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = *(id *)(v0 + 16);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04B98]), sel_initWithEKOptions_, 0x2000);
    if (!v3) {
      id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04B98]), sel_init);
    }
    uint64_t v4 = *(void **)(v0 + 16);
    *(void *)(v0 + 16) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

uint64_t CalendarSnippetProvider.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t CalendarSnippetProvider.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = 0;
  return result;
}

char *CalendarSnippetProvider.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v180 = a1;
  uint64_t v3 = type metadata accessor for EventListSnippet();
  uint64_t v4 = OUTLINED_FUNCTION_12(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_11_0();
  uint64_t v171 = (uint64_t *)v5;
  OUTLINED_FUNCTION_5_2();
  uint64_t v169 = type metadata accessor for ComposeEventSnippet();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_11_0();
  uint64_t v170 = v7;
  OUTLINED_FUNCTION_5_2();
  uint64_t v8 = sub_25C662CA0();
  uint64_t v9 = OUTLINED_FUNCTION_12(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_11_0();
  uint64_t v168 = v10;
  OUTLINED_FUNCTION_5_2();
  uint64_t v166 = type metadata accessor for PromptForTitleSnippet();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_11_0();
  uint64_t v167 = v12;
  OUTLINED_FUNCTION_5_2();
  uint64_t v149 = type metadata accessor for EventStatusSnippet();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v14);
  uint64_t v147 = (uint64_t)&v145 - v15;
  OUTLINED_FUNCTION_5_2();
  uint64_t v145 = type metadata accessor for SingleEventSnippet();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_11_0();
  uint64_t v146 = v17;
  OUTLINED_FUNCTION_5_2();
  uint64_t v160 = type metadata accessor for PunchoutButtonSnippet();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_11_0();
  long long v163 = v19;
  OUTLINED_FUNCTION_5_2();
  uint64_t v20 = type metadata accessor for RenderableEvent();
  uint64_t v21 = OUTLINED_FUNCTION_12(v20);
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_5();
  uint64_t v162 = v22;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_3_2();
  uint64_t v161 = v24;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_3_2();
  uint64_t v159 = v26;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_3_2();
  uint64_t v165 = v28;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_3_2();
  uint64_t v164 = v30;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_3_2();
  uint64_t v158 = v32;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v35);
  uint64_t v154 = (uint64_t)&v145 - v36;
  OUTLINED_FUNCTION_5_2();
  uint64_t v37 = type metadata accessor for ConflictingEventConfirmationSnippet();
  uint64_t v38 = OUTLINED_FUNCTION_12(v37);
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_11_0();
  uint64_t v153 = v39;
  OUTLINED_FUNCTION_5_2();
  uint64_t v40 = sub_25C662CE0();
  uint64_t v41 = OUTLINED_FUNCTION_12(v40);
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v46);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v48);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v51);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v53);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x270FA5388](v54);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  uint64_t v56 = MEMORY[0x270FA5388](v55);
  uint64_t v58 = (char *)&v145 - v57;
  MEMORY[0x270FA5388](v56);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_37();
  uint64_t v60 = MEMORY[0x270FA5388](v59);
  uint64_t v62 = (char *)&v145 - v61;
  uint64_t v63 = MEMORY[0x270FA5388](v60);
  uint64_t v65 = (char *)&v145 - v64;
  uint64_t v66 = MEMORY[0x270FA5388](v63);
  char v68 = (char *)&v145 - v67;
  MEMORY[0x270FA5388](v66);
  uint64_t v70 = (char *)&v145 - v69;
  uint64_t v71 = type metadata accessor for DisambiguateEventsSnippet();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v72);
  OUTLINED_FUNCTION_12_0();
  sub_25C662CF0();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v73);
  unint64_t v75 = (char *)&v145 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C64C028(v180, (uint64_t)v75, MEMORY[0x263F6CD90]);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      char v78 = v75[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCAC0) + 48)];
      uint64_t v79 = v151;
      sub_25C64B068((uint64_t)v75, v151, MEMORY[0x263F6CD78]);
      uint64_t v62 = v150;
      sub_25C64C028(v79, (uint64_t)v150, MEMORY[0x263F6CD78]);
      id v80 = sub_25C649978();
      uint64_t v81 = v158;
      uint64_t v82 = v173;
      sub_25C62B570((uint64_t)v62, v80, v158);
      if (v82)
      {
        uint64_t v83 = (void (*)(void))MEMORY[0x263F6CD78];
        uint64_t v84 = v79;
        goto LABEL_28;
      }
      uint64_t v122 = v146;
      sub_25C64B068(v81, v146, (void (*)(void))type metadata accessor for RenderableEvent);
      *(unsigned char *)(v122 + *(int *)(v145 + 20)) = v78;
      uint64_t v62 = (char *)sub_25C64AF14(&qword_26A5BCB40, (void (*)(void))type metadata accessor for SingleEventSnippet, (void (*)(uint64_t))sub_25C64BC90);
      sub_25C64BF24(v122, (void (*)(void))type metadata accessor for SingleEventSnippet);
      uint64_t v104 = (uint64_t (*)())MEMORY[0x263F6CD78];
      uint64_t v105 = v79;
      goto LABEL_40;
    case 2u:
      OUTLINED_FUNCTION_11_1((uint64_t)v75, MEMORY[0x263F6CD78], (uint64_t)&v172);
      sub_25C64C028((uint64_t)v65, (uint64_t)v58, MEMORY[0x263F6CD78]);
      id v85 = sub_25C649978();
      uint64_t v86 = v156;
      uint64_t v87 = v173;
      sub_25C62B570((uint64_t)v58, v85, v156);
      if (v87) {
        goto LABEL_27;
      }
      sub_25C660F84();
      goto LABEL_39;
    case 3u:
      sub_25C64B068((uint64_t)v75, (uint64_t)v65, MEMORY[0x263F6CD78]);
      sub_25C64C028((uint64_t)v65, (uint64_t)v62, MEMORY[0x263F6CD78]);
      id v89 = sub_25C649978();
      uint64_t v86 = v154;
      uint64_t v90 = v173;
      sub_25C62B570((uint64_t)v62, v89, v154);
      if (v90) {
        goto LABEL_27;
      }
      sub_25C660F04();
      goto LABEL_39;
    case 4u:
      uint64_t v91 = *(void *)&v75[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCAD0) + 48)];
      sub_25C64B068((uint64_t)v75, (uint64_t)v70, MEMORY[0x263F6CD78]);
      sub_25C64C028((uint64_t)v70, (uint64_t)v68, MEMORY[0x263F6CD78]);
      id v92 = sub_25C649978();
      uint64_t v93 = v153;
      uint64_t v94 = v173;
      sub_25C6378C4((uint64_t)v68, v91, v92, v153);
      if (v94)
      {
        uint64_t v83 = (void (*)(void))MEMORY[0x263F6CD78];
        uint64_t v84 = (uint64_t)v70;
        goto LABEL_28;
      }
      uint64_t v62 = (char *)sub_25C64AF14(&qword_26A5BCB10, (void (*)(void))type metadata accessor for ConflictingEventConfirmationSnippet, (void (*)(uint64_t))sub_25C64BAD8);
      sub_25C64BF24(v93, (void (*)(void))type metadata accessor for ConflictingEventConfirmationSnippet);
      uint64_t v104 = (uint64_t (*)())MEMORY[0x263F6CD78];
      uint64_t v105 = (uint64_t)v70;
      goto LABEL_40;
    case 5u:
      uint64_t v95 = *(void *)v75;
      swift_retain();
      uint64_t v96 = v173;
      uint64_t v97 = sub_25C6496A0(v95);
      if (v96)
      {
        swift_bridgeObjectRelease();
        return v62;
      }
      uint64_t v123 = v97;
      swift_bridgeObjectRelease();
      *uint64_t v1 = v123;
      sub_25C663580();
      uint64_t v124 = (char *)v1 + *(int *)(v71 + 24);
      *(void *)uint64_t v124 = swift_getKeyPath();
      v124[8] = 0;
      *((void *)v124 + 2) = 0x4030000000000000;
      *((void *)v124 + 3) = 0;
      v124[32] = 1;
      *((void *)v124 + 5) = 1;
      *((void *)v124 + 6) = sub_25C64B95C;
      *((void *)v124 + 7) = 0;
      uint64_t v62 = (char *)sub_25C64AF14(&qword_26A5BCAE0, (void (*)(void))type metadata accessor for DisambiguateEventsSnippet, (void (*)(uint64_t))sub_25C64B9FC);
      uint64_t v121 = type metadata accessor for DisambiguateEventsSnippet;
LABEL_35:
      uint64_t v104 = v121;
      uint64_t v105 = (uint64_t)v1;
      goto LABEL_40;
    case 6u:
      OUTLINED_FUNCTION_11_1((uint64_t)v75, MEMORY[0x263F6CD78], (uint64_t)&v175);
      OUTLINED_FUNCTION_9_1((uint64_t)v65, MEMORY[0x263F6CD78], (uint64_t)&v171);
      id v98 = sub_25C649978();
      uint64_t v86 = v157;
      OUTLINED_FUNCTION_7_1((uint64_t)v98, v98);
      if (v2) {
        goto LABEL_27;
      }
      sub_25C661210();
      goto LABEL_39;
    case 7u:
      uint64_t v99 = v152;
      sub_25C64B068((uint64_t)v75, v152, MEMORY[0x263F6CD78]);
      OUTLINED_FUNCTION_9_1(v99, MEMORY[0x263F6CD78], (uint64_t)&v174);
      id v100 = sub_25C649978();
      uint64_t v101 = v164;
      uint64_t v102 = v173;
      sub_25C62B570((uint64_t)v75, v100, v164);
      if (v102)
      {
        uint64_t v83 = (void (*)(void))MEMORY[0x263F6CD78];
        uint64_t v84 = v99;
        goto LABEL_28;
      }
      uint64_t v125 = v147;
      sub_25C64C028(v101, v147, (void (*)(void))type metadata accessor for RenderableEvent);
      uint64_t v126 = v149;
      sub_25C6635A0();
      OUTLINED_FUNCTION_1();
      uint64_t v127 = OUTLINED_FUNCTION_14_1();
      v128(v127);
      uint64_t v129 = sub_25C663060();
      *(unsigned char *)(v125 + *(int *)(v126 + 20)) = 1;
      OUTLINED_FUNCTION_15_1(v129, v130, v131, v132, v125 + *(int *)(v126 + 28));
      sub_25C64C164(&qword_26A5BCAC8, (void (*)(uint64_t))type metadata accessor for EventStatusSnippet);
      uint64_t v133 = sub_25C663240();
      sub_25C64BF24(v125, (void (*)(void))type metadata accessor for EventStatusSnippet);
      sub_25C64BF24(v101, (void (*)(void))type metadata accessor for RenderableEvent);
      uint64_t v62 = (char *)sub_25C64AD48(v133);
      swift_release();
      uint64_t v104 = (uint64_t (*)())MEMORY[0x263F6CD78];
      uint64_t v105 = v99;
      goto LABEL_40;
    case 8u:
      unint64_t v76 = v167;
      *uint64_t v167 = *v75;
      uint64_t v174 = 0;
      unint64_t v175 = 0xE000000000000000;
      sub_25C663410();
      uint64_t v103 = v177;
      *(_OWORD *)(v76 + 8) = v176;
      *((void *)v76 + 3) = v103;
      sub_25C663580();
      uint64_t v62 = (char *)sub_25C64AF14(&qword_26A5BCB58, (void (*)(void))type metadata accessor for PromptForTitleSnippet, (void (*)(uint64_t))sub_25C64BD6C);
      uint64_t v77 = type metadata accessor for PromptForTitleSnippet;
      goto LABEL_18;
    case 9u:
      uint64_t v106 = (uint64_t)v75;
      uint64_t v107 = v168;
      sub_25C64B068(v106, v168, MEMORY[0x263F6CD60]);
      uint64_t v108 = v170;
      sub_25C64C028(v107, v170, MEMORY[0x263F6CD60]);
      sub_25C663580();
      uint64_t v62 = (char *)sub_25C64AF14(&qword_26A5BCB70, (void (*)(void))type metadata accessor for ComposeEventSnippet, (void (*)(uint64_t))sub_25C64BE48);
      sub_25C64BF24(v108, (void (*)(void))type metadata accessor for ComposeEventSnippet);
      uint64_t v104 = (uint64_t (*)())MEMORY[0x263F6CD60];
      uint64_t v105 = v107;
      goto LABEL_40;
    case 0xAu:
      OUTLINED_FUNCTION_11_1((uint64_t)v75, MEMORY[0x263F6CD78], (uint64_t)&v180);
      OUTLINED_FUNCTION_9_1((uint64_t)v65, MEMORY[0x263F6CD78], (uint64_t)&v176 + 8);
      id v109 = sub_25C649978();
      uint64_t v86 = v159;
      OUTLINED_FUNCTION_7_1((uint64_t)v109, v109);
      if (v2) {
        goto LABEL_27;
      }
      sub_25C6614D4();
      goto LABEL_39;
    case 0xBu:
      char v110 = v75[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCAC0) + 48)];
      uint64_t v111 = v155;
      sub_25C64B068((uint64_t)v75, v155, MEMORY[0x263F6CD78]);
      OUTLINED_FUNCTION_9_1(v111, MEMORY[0x263F6CD78], (uint64_t)&v176);
      id v112 = sub_25C649978();
      uint64_t v113 = v165;
      uint64_t v114 = v173;
      sub_25C62B570((uint64_t)v75, v112, v165);
      if (v114)
      {
        uint64_t v83 = (void (*)(void))MEMORY[0x263F6CD78];
        uint64_t v84 = v111;
        goto LABEL_28;
      }
      uint64_t v134 = v148;
      sub_25C64C028(v113, v148, (void (*)(void))type metadata accessor for RenderableEvent);
      uint64_t v135 = v149;
      sub_25C6635A0();
      OUTLINED_FUNCTION_1();
      uint64_t v136 = OUTLINED_FUNCTION_14_1();
      v137(v136);
      uint64_t v138 = sub_25C663060();
      *(unsigned char *)(v134 + *(int *)(v135 + 20)) = v110;
      OUTLINED_FUNCTION_15_1(v138, v139, v140, v141, v134 + *(int *)(v135 + 28));
      sub_25C64C164(&qword_26A5BCAC8, (void (*)(uint64_t))type metadata accessor for EventStatusSnippet);
      uint64_t v142 = sub_25C663240();
      sub_25C64BF24(v134, (void (*)(void))type metadata accessor for EventStatusSnippet);
      sub_25C64BF24(v113, (void (*)(void))type metadata accessor for RenderableEvent);
      uint64_t v62 = (char *)sub_25C64AD48(v142);
      swift_release();
      uint64_t v104 = (uint64_t (*)())MEMORY[0x263F6CD78];
      uint64_t v105 = v111;
      goto LABEL_40;
    case 0xCu:
      OUTLINED_FUNCTION_11_1((uint64_t)v75, MEMORY[0x263F6CD78], (uint64_t)&v181);
      OUTLINED_FUNCTION_9_1((uint64_t)v65, MEMORY[0x263F6CD78], (uint64_t)v178);
      id v115 = sub_25C649978();
      uint64_t v86 = v161;
      OUTLINED_FUNCTION_7_1((uint64_t)v115, v115);
      if (v2) {
        goto LABEL_27;
      }
      sub_25C6614EC();
      goto LABEL_39;
    case 0xDu:
      OUTLINED_FUNCTION_11_1((uint64_t)v75, MEMORY[0x263F6CD78], (uint64_t)&v182);
      OUTLINED_FUNCTION_9_1((uint64_t)v65, MEMORY[0x263F6CD78], (uint64_t)&v179);
      id v116 = sub_25C649978();
      uint64_t v86 = v162;
      OUTLINED_FUNCTION_7_1((uint64_t)v116, v116);
      if (v2)
      {
LABEL_27:
        uint64_t v83 = (void (*)(void))MEMORY[0x263F6CD78];
        uint64_t v84 = (uint64_t)v65;
LABEL_28:
        sub_25C64BF24(v84, v83);
      }
      else
      {
        sub_25C661764();
LABEL_39:
        uint64_t v143 = v88;
        sub_25C64BF24(v86, (void (*)(void))type metadata accessor for RenderableEvent);
        uint64_t v62 = (char *)sub_25C64AD48(v143);
        swift_release();
        uint64_t v104 = (uint64_t (*)())MEMORY[0x263F6CD78];
        uint64_t v105 = (uint64_t)v65;
LABEL_40:
        sub_25C64BF24(v105, (void (*)(void))v104);
      }
      return v62;
    case 0xEu:
      uint64_t v117 = *(void *)v75;
      char v118 = v75[8];
      id v119 = sub_25C649978();
      uint64_t v1 = v171;
      uint64_t v120 = v173;
      sub_25C652D88(v117, v118, v119, (uint64_t)v171);
      if (v120) {
        return v62;
      }
      uint64_t v62 = (char *)sub_25C64AF14(&qword_26A5BCB98, (void (*)(void))type metadata accessor for EventListSnippet, (void (*)(uint64_t))sub_25C64C088);
      uint64_t v121 = type metadata accessor for EventListSnippet;
      goto LABEL_35;
    default:
      unint64_t v76 = v163;
      *long long v163 = *(_OWORD *)v75;
      sub_25C663580();
      uint64_t v62 = (char *)sub_25C64AF14(&qword_26A5BCB28, (void (*)(void))type metadata accessor for PunchoutButtonSnippet, (void (*)(uint64_t))sub_25C64BBB4);
      uint64_t v77 = type metadata accessor for PunchoutButtonSnippet;
LABEL_18:
      uint64_t v104 = v77;
      uint64_t v105 = (uint64_t)v76;
      goto LABEL_40;
  }
}

uint64_t sub_25C64AD48(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CalendarEnvironmentSetupModifier();
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCB88);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (uint64_t *)((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25C64B398((uint64_t)v5);
  uint64_t v9 = *(int *)(v3 + 28);
  id v10 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v11 = (void *)sub_25C663730();
  unsigned __int8 v12 = objc_msgSend(v10, sel_BOOLForKey_, v11);

  v5[v9] = v12;
  sub_25C64C028((uint64_t)v5, (uint64_t)v8 + *(int *)(v6 + 36), (void (*)(void))type metadata accessor for CalendarEnvironmentSetupModifier);
  void *v8 = a1;
  swift_retain();
  sub_25C64BF24((uint64_t)v5, (void (*)(void))type metadata accessor for CalendarEnvironmentSetupModifier);
  sub_25C64BF7C();
  uint64_t v13 = sub_25C663240();
  sub_25C62978C((uint64_t)v8, &qword_26A5BCB88);
  return v13;
}

uint64_t sub_25C64AF14(uint64_t *a1, void (*a2)(void), void (*a3)(uint64_t))
{
  uint64_t v19 = a3;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_1();
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t)&v9[*(int *)(v7 + 36)];
  sub_25C64B214(v10);
  uint64_t v11 = *(int *)(type metadata accessor for CalendarEnvironmentSetupModifier() + 20);
  id v12 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v13 = (void *)sub_25C663730();
  unsigned __int8 v14 = objc_msgSend(v12, sel_BOOLForKey_, v13);

  *(unsigned char *)(v10 + v11) = v14;
  uint64_t v15 = sub_25C64C028(v3, (uint64_t)v9, a2);
  v19(v15);
  uint64_t v16 = sub_25C663240();
  sub_25C62978C((uint64_t)v9, a1);
  return v16;
}

uint64_t sub_25C64B068(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25C64B0C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C662EC0();
  *a1 = result;
  return result;
}

uint64_t sub_25C64B0F4()
{
  return sub_25C662ED0();
}

uint64_t CalendarSnippetProvider.deinit()
{
  return v0;
}

uint64_t CalendarSnippetProvider.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_25C64B174@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CalendarSnippetProvider.__allocating_init()();
  *a1 = result;
  return result;
}

char *sub_25C64B19C(uint64_t a1)
{
  return CalendarSnippetProvider.snippet(for:mode:idiom:)(a1);
}

id sub_25C64B1C0()
{
  type metadata accessor for CalendarSnippetProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26A5BE0E0 = (uint64_t)result;
  return result;
}

uint64_t sub_25C64B214@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCB00);
  uint64_t v4 = OUTLINED_FUNCTION_12(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_12_0();
  id v5 = objc_msgSend(self, sel_sharedPreferences);
  id v6 = objc_msgSend(v5, sel_languageCode);

  if (v6)
  {
    sub_25C663740();

    swift_bridgeObjectRetain();
    sub_25C662A30();
    uint64_t v7 = sub_25C662AC0();
    __swift_storeEnumTagSinglePayload(v1, 0, 1, v7);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload(v1, 1, v7) != 1) {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a1, v1, v7);
    }
  }
  else
  {
    uint64_t v9 = sub_25C662AC0();
    __swift_storeEnumTagSinglePayload(v1, 1, 1, v9);
  }
  sub_25C662A80();
  return sub_25C62978C(v1, &qword_26A5BCB00);
}

uint64_t sub_25C64B398@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCB00);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(self, sel_sharedPreferences);
  id v6 = objc_msgSend(v5, sel_languageCode);

  if (v6)
  {
    sub_25C663740();

    swift_bridgeObjectRetain();
    sub_25C662A30();
    uint64_t v7 = sub_25C662AC0();
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v7);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v7) != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, v4, v7);
    }
  }
  else
  {
    uint64_t v9 = sub_25C662AC0();
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v9);
  }
  sub_25C662A80();
  return sub_25C62978C((uint64_t)v4, &qword_26A5BCB00);
}

void sub_25C64B530(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(uint64_t))
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_6_1();
    uint64_t v10 = sub_25C663890();
    __break(1u);
_swift_arrayInitWithTakeBackToFront:
    MEMORY[0x270FA01D0](v10);
    return;
  }
  if (a3 < a1 || (uint64_t v8 = OUTLINED_FUNCTION_13_0(), a4(v8), OUTLINED_FUNCTION_1(), a1 + *(void *)(v9 + 72) * a2 <= a3))
  {
    uint64_t v11 = OUTLINED_FUNCTION_13_0();
    a4(v11);
    uint64_t v12 = OUTLINED_FUNCTION_16_1();
    MEMORY[0x270FA01D8](v12);
  }
  else if (a3 != a1)
  {
    uint64_t v10 = OUTLINED_FUNCTION_16_1();
    goto _swift_arrayInitWithTakeBackToFront;
  }
}

uint64_t sub_25C64B638(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v6 = OUTLINED_FUNCTION_13_0(),
         v7(v6),
         OUTLINED_FUNCTION_1(),
         uint64_t v10 = *(void *)(v9 + 72) * a2,
         unint64_t v11 = a3 + v10,
         unint64_t v12 = a1 + v10,
         v11 > a1)
      ? (BOOL v13 = v12 > a3)
      : (BOOL v13 = 0),
        v13))
  {
    OUTLINED_FUNCTION_6_1();
    uint64_t v15 = sub_25C663890();
    __break(1u);
  }
  else
  {
    uint64_t v14 = v8;
    uint64_t v15 = a3;
    unint64_t v16 = a1;
    uint64_t v17 = a2;
  }
  return MEMORY[0x270FA01C8](v15, v16, v17, v14);
}

size_t sub_25C64B730(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25C64B7B0(a1, a2, a3, *v3, &qword_26A5BCB08, (uint64_t (*)(uint64_t))type metadata accessor for RenderableEvent, (void (*)(uint64_t))type metadata accessor for RenderableEvent);
  *uint64_t v3 = result;
  return result;
}

size_t sub_25C64B770(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25C64B7B0(a1, a2, a3, *v3, &qword_26A5BCBB0, type metadata accessor for DayEventGroupView.DayEventGroup, (void (*)(uint64_t))type metadata accessor for DayEventGroupView.DayEventGroup);
  *uint64_t v3 = result;
  return result;
}

size_t sub_25C64B7B0(size_t result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(uint64_t), void (*a7)(uint64_t))
{
  char v10 = result;
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v19 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = OUTLINED_FUNCTION_13_0();
  uint64_t v16 = *(void *)(a6(v15) - 8);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v19);
  if (!v17)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v18 == 0x8000000000000000 && v17 == -1) {
    goto LABEL_24;
  }
  uint64_t v19[2] = v13;
  v19[3] = 2 * ((uint64_t)(result - v18) / v17);
LABEL_19:
  uint64_t v21 = OUTLINED_FUNCTION_13_0();
  uint64_t v22 = *(void *)(a6(v21) - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v24 = (unint64_t)v19 + v23;
  unint64_t v25 = a4 + v23;
  if (v10)
  {
    sub_25C64B530(v25, v13, v24, a7);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C64B638(v25, v13, v24);
  }
  swift_release();
  return (size_t)v19;
}

uint64_t sub_25C64B95C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_25C660BB8();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = result;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  return result;
}

uint64_t sub_25C64B990()
{
  return sub_25C64C164(&qword_26A5BCAD8, MEMORY[0x263F6CD90]);
}

uint64_t type metadata accessor for CalendarSnippetProvider()
{
  return self;
}

unint64_t sub_25C64B9FC()
{
  unint64_t result = qword_26A5BCAE8;
  if (!qword_26A5BCAE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCAE0);
    sub_25C64C164(&qword_26A5BCAF0, (void (*)(uint64_t))type metadata accessor for DisambiguateEventsSnippet);
    sub_25C64C164(&qword_26A5BCAF8, (void (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCAE8);
  }
  return result;
}

unint64_t sub_25C64BAD8()
{
  unint64_t result = qword_26A5BCB18;
  if (!qword_26A5BCB18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCB10);
    sub_25C64C164(&qword_26A5BCB20, (void (*)(uint64_t))type metadata accessor for ConflictingEventConfirmationSnippet);
    sub_25C64C164(&qword_26A5BCAF8, (void (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCB18);
  }
  return result;
}

unint64_t sub_25C64BBB4()
{
  unint64_t result = qword_26A5BCB30;
  if (!qword_26A5BCB30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCB28);
    sub_25C64C164(&qword_26A5BCB38, (void (*)(uint64_t))type metadata accessor for PunchoutButtonSnippet);
    sub_25C64C164(&qword_26A5BCAF8, (void (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCB30);
  }
  return result;
}

unint64_t sub_25C64BC90()
{
  unint64_t result = qword_26A5BCB48;
  if (!qword_26A5BCB48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCB40);
    sub_25C64C164(&qword_26A5BCB50, (void (*)(uint64_t))type metadata accessor for SingleEventSnippet);
    sub_25C64C164(&qword_26A5BCAF8, (void (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCB48);
  }
  return result;
}

unint64_t sub_25C64BD6C()
{
  unint64_t result = qword_26A5BCB60;
  if (!qword_26A5BCB60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCB58);
    sub_25C64C164(&qword_26A5BCB68, (void (*)(uint64_t))type metadata accessor for PromptForTitleSnippet);
    sub_25C64C164(&qword_26A5BCAF8, (void (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCB60);
  }
  return result;
}

unint64_t sub_25C64BE48()
{
  unint64_t result = qword_26A5BCB78;
  if (!qword_26A5BCB78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCB70);
    sub_25C64C164(&qword_26A5BCB80, (void (*)(uint64_t))type metadata accessor for ComposeEventSnippet);
    sub_25C64C164(&qword_26A5BCAF8, (void (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCB78);
  }
  return result;
}

uint64_t sub_25C64BF24(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_25C64BF7C()
{
  unint64_t result = qword_26A5BCB90;
  if (!qword_26A5BCB90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCB88);
    sub_25C64C164(&qword_26A5BCAF8, (void (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCB90);
  }
  return result;
}

uint64_t sub_25C64C028(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_25C64C088()
{
  unint64_t result = qword_26A5BCBA0;
  if (!qword_26A5BCBA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCB98);
    sub_25C64C164(&qword_26A5BCBA8, (void (*)(uint64_t))type metadata accessor for EventListSnippet);
    sub_25C64C164(&qword_26A5BCAF8, (void (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCBA0);
  }
  return result;
}

uint64_t sub_25C64C164(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_5_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_7_1(uint64_t a1, void *a2)
{
  return sub_25C62B570(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_9_1@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a3 - 256);
  return sub_25C64C028(a1, v4, a2);
}

uint64_t OUTLINED_FUNCTION_11_1@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a3 - 256);
  return sub_25C64B068(a1, v4, a2);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_1@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = a3 & 1;
  *(void *)(a5 + 24) = a4;
  return result;
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return v0;
}

void *sub_25C64C290(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    long long v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    uint64_t v11 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v11;
    uint64_t v12 = (int *)sub_25C662CE0();
    uint64_t v13 = v12[8];
    uint64_t v55 = (uint64_t)a2 + v13;
    uint64_t v56 = (char *)v4 + v13;
    uint64_t v14 = sub_25C6628A0();
    uint64_t v54 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v54(v56, v55, v14);
    *((unsigned char *)v4 + v12[9]) = *((unsigned char *)a2 + v12[9]);
    uint64_t v15 = v12[10];
    uint64_t v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = v12[11];
    uint64_t v20 = (void *)((char *)v4 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = v12[12];
    unint64_t v24 = (char *)v4 + v23;
    unint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = sub_25C662CD0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
      memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      *unint64_t v24 = *v25;
      *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
      uint64_t v29 = *(int *)(v26 + 28);
      uint64_t v30 = &v24[v29];
      uint64_t v31 = &v25[v29];
      uint64_t v32 = sub_25C662CC0();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        uint64_t v33 = sub_25C6629F0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v33 - 8) + 16))(v30, v31, v33);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
    }
    *(void *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    uint64_t v34 = v12[14];
    uint64_t v35 = (char *)v4 + v34;
    uint64_t v36 = (char *)a2 + v34;
    uint64_t v37 = sub_25C662B70();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
      memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
    }
    uint64_t v39 = type metadata accessor for RenderableEvent();
    uint64_t v40 = *(int *)(v39 + 20);
    uint64_t v41 = (char *)v4 + v40;
    uint64_t v42 = (uint64_t)a2 + v40;
    uint64_t v43 = sub_25C662C10();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
    uint64_t v44 = *(int *)(v39 + 24);
    uint64_t v45 = (void *)((char *)v4 + v44);
    uint64_t v46 = (uint64_t *)((char *)a2 + v44);
    uint64_t v47 = v46[1];
    *uint64_t v45 = *v46;
    v45[1] = v47;
    uint64_t v48 = *(int *)(a3 + 20);
    uint64_t v49 = (char *)v4 + v48;
    uint64_t v50 = (uint64_t)a2 + v48;
    uint64_t v51 = sub_25C663590();
    uint64_t v52 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v51 - 8) + 16);
    swift_bridgeObjectRetain();
    v52(v49, v50, v51);
  }
  return v4;
}

uint64_t sub_25C64C6C8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)sub_25C662CE0();
  uint64_t v5 = a1 + v4[8];
  uint64_t v6 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + v4[12];
  uint64_t v8 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    uint64_t v9 = v7 + *(int *)(v8 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      uint64_t v10 = sub_25C6629F0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = a1 + v4[14];
  uint64_t v12 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  uint64_t v13 = a1 + *(int *)(type metadata accessor for RenderableEvent() + 20);
  uint64_t v14 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  swift_bridgeObjectRelease();
  uint64_t v15 = a1 + *(int *)(a2 + 20);
  uint64_t v16 = sub_25C663590();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8);
  return v17(v15, v16);
}

uint64_t sub_25C64C91C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  long long v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v53 = a2 + v12;
  uint64_t v54 = a1 + v12;
  uint64_t v13 = sub_25C6628A0();
  uint64_t v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v52(v54, v53, v13);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v14 = v11[10];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v11[11];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = v11[12];
  uint64_t v23 = (unsigned char *)(a1 + v22);
  unint64_t v24 = (unsigned char *)(a2 + v22);
  uint64_t v25 = sub_25C662CD0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    *uint64_t v23 = *v24;
    *(_OWORD *)(v23 + 8) = *(_OWORD *)(v24 + 8);
    uint64_t v27 = *(int *)(v25 + 28);
    uint64_t v28 = &v23[v27];
    uint64_t v29 = &v24[v27];
    uint64_t v30 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      uint64_t v31 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v31 - 8) + 16))(v28, v29, v31);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  }
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  uint64_t v32 = v11[14];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  uint64_t v35 = sub_25C662B70();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
  }
  uint64_t v37 = type metadata accessor for RenderableEvent();
  uint64_t v38 = *(int *)(v37 + 20);
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  uint64_t v41 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  uint64_t v42 = *(int *)(v37 + 24);
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (void *)(a2 + v42);
  uint64_t v45 = v44[1];
  void *v43 = *v44;
  v43[1] = v45;
  uint64_t v46 = *(int *)(a3 + 20);
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  uint64_t v49 = sub_25C663590();
  uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 16);
  swift_bridgeObjectRetain();
  v50(v47, v48, v49);
  return a1;
}

uint64_t sub_25C64CD04(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)sub_25C662CE0();
  uint64_t v7 = v6[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(unsigned char *)(a1 + v6[9]) = *(unsigned char *)(a2 + v6[9]);
  uint64_t v11 = v6[10];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  void *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = v6[11];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = v6[12];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  int v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
      *(void *)(v18 + 8) = *(void *)(v19 + 8);
      *(void *)(v18 + 16) = *(void *)(v19 + 16);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v30 = *(int *)(v20 + 28);
      uint64_t v31 = v18 + v30;
      uint64_t v32 = (const void *)(v19 + v30);
      sub_25C64D2FC(v31, MEMORY[0x263F6CD68]);
      uint64_t v33 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v56 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v56 - 8) + 16))(v31, v32, v56);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v27 = *(void *)(*(void *)(v33 - 8) + 64);
      uint64_t v28 = (void *)v31;
      uint64_t v29 = v32;
LABEL_8:
      memcpy(v28, v29, v27);
      goto LABEL_14;
    }
    sub_25C64D2FC(v18, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v27 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v28 = (void *)v18;
    uint64_t v29 = (const void *)v19;
    goto LABEL_8;
  }
  if (v22) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  *(void *)(v18 + 16) = *(void *)(v19 + 16);
  uint64_t v23 = *(int *)(v20 + 28);
  unint64_t v24 = (void *)(v18 + v23);
  uint64_t v25 = (const void *)(v19 + v23);
  uint64_t v26 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v34 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(void *)(a1 + v6[13]) = *(void *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = v6[14];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (const void *)(a2 + v35);
  uint64_t v38 = sub_25C662B70();
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
  int v40 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
  if (!v39)
  {
    uint64_t v41 = *(void *)(v38 - 8);
    if (!v40)
    {
      (*(void (**)(void *, const void *, uint64_t))(v41 + 24))(v36, v37, v38);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v41 + 8))(v36, v38);
    goto LABEL_19;
  }
  if (v40)
  {
LABEL_19:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v36, v37, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
LABEL_20:
  uint64_t v43 = type metadata accessor for RenderableEvent();
  uint64_t v44 = *(int *)(v43 + 20);
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  uint64_t v47 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 24))(v45, v46, v47);
  uint64_t v48 = *(int *)(v43 + 24);
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (void *)(a2 + v48);
  *uint64_t v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v51 = *(int *)(a3 + 20);
  uint64_t v52 = a1 + v51;
  uint64_t v53 = a2 + v51;
  uint64_t v54 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 24))(v52, v53, v54);
  return a1;
}

uint64_t sub_25C64D2FC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v3();
  return a1;
}

_OWORD *sub_25C64D350(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  uint64_t v8 = (int *)sub_25C662CE0();
  uint64_t v9 = v8[8];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25C6628A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *((unsigned char *)a1 + v8[9]) = *((unsigned char *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  uint64_t v13 = v8[12];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_25C662CD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    unsigned char *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    uint64_t v18 = *(int *)(v16 + 28);
    uint64_t v19 = &v14[v18];
    uint64_t v20 = &v15[v18];
    uint64_t v21 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(void *)((char *)a1 + v8[13]) = *(void *)((char *)a2 + v8[13]);
  uint64_t v23 = v8[14];
  unint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_25C662B70();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  uint64_t v28 = type metadata accessor for RenderableEvent();
  uint64_t v29 = *(int *)(v28 + 20);
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = sub_25C662C10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
  *(_OWORD *)((char *)a1 + *(int *)(v28 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v28 + 24));
  uint64_t v33 = *(int *)(a3 + 20);
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
  return a1;
}

uint64_t sub_25C64D6AC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v16 = v11[10];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v11[11];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = v11[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  int v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v39 = *(int *)(v29 + 28);
      uint64_t v40 = v27 + v39;
      uint64_t v41 = (const void *)(v28 + v39);
      sub_25C64D2FC(v40, MEMORY[0x263F6CD68]);
      uint64_t v42 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v67 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v67 - 8) + 32))(v40, v41, v67);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v36 = *(void *)(*(void *)(v42 - 8) + 64);
      uint64_t v37 = (void *)v40;
      uint64_t v38 = v41;
LABEL_8:
      memcpy(v37, v38, v36);
      goto LABEL_14;
    }
    sub_25C64D2FC(v27, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v36 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v37 = (void *)v27;
    uint64_t v38 = (const void *)v28;
    goto LABEL_8;
  }
  if (v31) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  uint64_t v32 = *(int *)(v29 + 28);
  uint64_t v33 = (void *)(v27 + v32);
  uint64_t v34 = (const void *)(v28 + v32);
  uint64_t v35 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    uint64_t v43 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  uint64_t v44 = v11[14];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (const void *)(a2 + v44);
  uint64_t v47 = sub_25C662B70();
  int v48 = __swift_getEnumTagSinglePayload((uint64_t)v45, 1, v47);
  int v49 = __swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47);
  if (!v48)
  {
    uint64_t v50 = *(void *)(v47 - 8);
    if (!v49)
    {
      (*(void (**)(void *, const void *, uint64_t))(v50 + 40))(v45, v46, v47);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v50 + 8))(v45, v47);
    goto LABEL_19;
  }
  if (v49)
  {
LABEL_19:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v45, v46, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
  __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
LABEL_20:
  uint64_t v52 = type metadata accessor for RenderableEvent();
  uint64_t v53 = *(int *)(v52 + 20);
  uint64_t v54 = a1 + v53;
  uint64_t v55 = a2 + v53;
  uint64_t v56 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 40))(v54, v55, v56);
  uint64_t v57 = *(int *)(v52 + 24);
  uint64_t v58 = (void *)(a1 + v57);
  uint64_t v59 = (uint64_t *)(a2 + v57);
  uint64_t v61 = *v59;
  uint64_t v60 = v59[1];
  void *v58 = v61;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  uint64_t v62 = *(int *)(a3 + 20);
  uint64_t v63 = a1 + v62;
  uint64_t v64 = a2 + v62;
  uint64_t v65 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 40))(v63, v64, v65);
  return a1;
}

uint64_t sub_25C64DC04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C64DC18);
}

uint64_t sub_25C64DC18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_25C663590();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_25C64DC94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C64DCA8);
}

uint64_t sub_25C64DCA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_25C663590();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for PunchoutToEventDetailsModifier()
{
  uint64_t result = qword_26A5BCBB8;
  if (!qword_26A5BCBB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C64DD74()
{
  uint64_t result = type metadata accessor for RenderableEvent();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C663590();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C64DE3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C64DE58(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for PunchoutToEventDetailsModifier();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCBC8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3();
  uint64_t v11 = v10 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCBD0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v11, a1);
  *(unsigned char *)(v11 + *(int *)(v7 + 36)) = 0;
  sub_25C64E594(v2, (uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v13 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v14 = swift_allocObject();
  sub_25C64E8A0((uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  sub_25C64E960();
  sub_25C663300();
  swift_release();
  return sub_25C64EA24(v11);
}

void sub_25C64E00C()
{
  sub_25C663670();
  OUTLINED_FUNCTION_0();
  uint64_t v63 = v2;
  uint64_t v64 = v1;
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_3();
  uint64_t v62 = v4 - v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCBF8);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_25C662900();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v60 = (char *)v55 - v16;
  uint64_t v17 = sub_25C662D20();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)v55 - v24;
  uint64_t v26 = *(int *)(sub_25C662CE0() + 44);
  uint64_t v61 = v0;
  if (*(void *)(v0 + v26 + 8))
  {
    uint64_t v65 = v17;
    sub_25C64EA84();
    swift_bridgeObjectRetain();
    uint64_t v17 = v65;
    uint64_t v27 = v25;
    uint64_t v28 = sub_25C6637E0();
    if (v28)
    {
      uint64_t v29 = (void *)v28;
      uint64_t v30 = sub_25C662D00();
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v25, v30, v17);
      uint64_t v31 = v17;
      id v32 = v29;
      uint64_t v33 = sub_25C662D10();
      int v34 = sub_25C6637C0();
      if (os_log_type_enabled(v33, (os_log_type_t)v34))
      {
        int v58 = v34;
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v57 = swift_slowAlloc();
        uint64_t v67 = v57;
        size_t v36 = v32;
        uint64_t v37 = v35;
        *(_DWORD *)uint64_t v35 = 136315138;
        id v59 = v36;
        id v38 = objc_msgSend(v36, sel_punchOutUri);
        if (v38)
        {
          uint64_t v39 = v38;
          os_log_t v56 = v33;
          sub_25C6628F0();

          uint64_t v40 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
          v40(v8, v15, v9);
          __swift_storeEnumTagSinglePayload(v8, 0, 1, v9);
          if (__swift_getEnumTagSinglePayload(v8, 1, v9) != 1)
          {
            v55[1] = v37 + 4;
            uint64_t v41 = v60;
            v40((uint64_t)v60, (char *)v8, v9);
            sub_25C64EAC4();
            uint64_t v42 = sub_25C6638A0();
            unint64_t v44 = v43;
            (*(void (**)(char *, uint64_t))(v11 + 8))(v41, v9);
            uint64_t v66 = sub_25C638888(v42, v44, &v67);
            sub_25C663820();
            id v45 = v59;

            swift_bridgeObjectRelease();
            os_log_t v46 = v56;
            _os_log_impl(&dword_25C626000, v56, (os_log_type_t)v58, "Attempting to punchout to %s", v37, 0xCu);
            uint64_t v47 = v57;
            swift_arrayDestroy();
            MEMORY[0x26118DF90](v47, -1, -1);
            int v48 = v37;
            id v32 = v45;
            MEMORY[0x26118DF90](v48, -1, -1);

            (*(void (**)(char *, uint64_t))(v19 + 8))(v27, v65);
LABEL_11:
            type metadata accessor for PunchoutToEventDetailsModifier();
            uint64_t v53 = v62;
            sub_25C663570();
            id v54 = v32;
            sub_25C663650();

            (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v53, v64);
            return;
          }
        }
        else
        {

          __swift_storeEnumTagSinglePayload(v8, 1, 1, v9);
        }
        __break(1u);
        return;
      }

      (*(void (**)(char *, uint64_t))(v19 + 8))(v27, v31);
      goto LABEL_11;
    }
  }
  uint64_t v49 = sub_25C662D00();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v23, v49, v17);
  uint64_t v50 = sub_25C662D10();
  os_log_type_t v51 = sub_25C6637C0();
  if (os_log_type_enabled(v50, v51))
  {
    uint64_t v52 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v52 = 0;
    _os_log_impl(&dword_25C626000, v50, v51, "Punchout command not available for current event", v52, 2u);
    MEMORY[0x26118DF90](v52, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v19 + 8))(v23, v17);
}

uint64_t sub_25C64E594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PunchoutToEventDetailsModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C64E5F8()
{
  uint64_t v1 = *(void *)(type metadata accessor for PunchoutToEventDetailsModifier() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_25C662CE0();
  sub_25C6628A0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v6();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + *(int *)(v5 + 48);
  uint64_t v8 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    uint64_t v9 = v7 + *(int *)(v8 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_25C6629F0();
      OUTLINED_FUNCTION_1();
      (*(void (**)(uint64_t))(v10 + 8))(v9);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = v0 + v3 + *(int *)(v5 + 56);
  uint64_t v12 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  type metadata accessor for RenderableEvent();
  sub_25C662C10();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v13();
  swift_bridgeObjectRelease();
  sub_25C663590();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v14();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25C64E8A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PunchoutToEventDetailsModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_25C64E904()
{
}

unint64_t sub_25C64E960()
{
  unint64_t result = qword_26A5BCBD8;
  if (!qword_26A5BCBD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCBC8);
    sub_25C6298EC(&qword_26A5BCBE0, &qword_26A5BCBD0);
    sub_25C6298EC(&qword_26A5BCBE8, &qword_26A5BCBF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCBD8);
  }
  return result;
}

uint64_t sub_25C64EA24(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCBC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25C64EA84()
{
  unint64_t result = qword_26A5BCC00;
  if (!qword_26A5BCC00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5BCC00);
  }
  return result;
}

unint64_t sub_25C64EAC4()
{
  unint64_t result = qword_26A5BCC08;
  if (!qword_26A5BCC08)
  {
    sub_25C662900();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCC08);
  }
  return result;
}

uint64_t sub_25C64EB14()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_25C64EB70(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    long long v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    uint64_t v11 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v11;
    uint64_t v12 = (int *)sub_25C662CE0();
    uint64_t v13 = v12[8];
    uint64_t v50 = (uint64_t)a2 + v13;
    os_log_type_t v51 = (char *)v4 + v13;
    uint64_t v14 = sub_25C6628A0();
    uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v49(v51, v50, v14);
    *((unsigned char *)v4 + v12[9]) = *((unsigned char *)a2 + v12[9]);
    uint64_t v15 = v12[10];
    uint64_t v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = v12[11];
    uint64_t v20 = (void *)((char *)v4 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = v12[12];
    uint64_t v24 = (char *)v4 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = sub_25C662CD0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
      memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      *uint64_t v24 = *v25;
      *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
      uint64_t v29 = *(int *)(v26 + 28);
      uint64_t v30 = &v24[v29];
      uint64_t v31 = &v25[v29];
      uint64_t v32 = sub_25C662CC0();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        uint64_t v33 = sub_25C6629F0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v33 - 8) + 16))(v30, v31, v33);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
    }
    *(void *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    uint64_t v34 = v12[14];
    uint64_t v35 = (char *)v4 + v34;
    size_t v36 = (char *)a2 + v34;
    uint64_t v37 = sub_25C662B70();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
      memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
    }
    uint64_t v39 = type metadata accessor for RenderableEvent();
    uint64_t v40 = *(int *)(v39 + 20);
    uint64_t v41 = (char *)v4 + v40;
    uint64_t v42 = (uint64_t)a2 + v40;
    uint64_t v43 = sub_25C662C10();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
    uint64_t v44 = *(int *)(v39 + 24);
    id v45 = (void *)((char *)v4 + v44);
    os_log_t v46 = (uint64_t *)((char *)a2 + v44);
    uint64_t v47 = v46[1];
    *id v45 = *v46;
    v45[1] = v47;
    *((unsigned char *)v4 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_25C64EF64(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = (int *)sub_25C662CE0();
  uint64_t v3 = a1 + v2[8];
  uint64_t v4 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + v2[12];
  uint64_t v6 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6))
  {
    uint64_t v7 = v5 + *(int *)(v6 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      uint64_t v8 = sub_25C6629F0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = a1 + v2[14];
  uint64_t v10 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  uint64_t v11 = a1 + *(int *)(type metadata accessor for RenderableEvent() + 20);
  uint64_t v12 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C64F16C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  long long v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v48 = a2 + v12;
  uint64_t v49 = a1 + v12;
  uint64_t v13 = sub_25C6628A0();
  uint64_t v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v47(v49, v48, v13);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v14 = v11[10];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v11[11];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = v11[12];
  uint64_t v23 = (unsigned char *)(a1 + v22);
  uint64_t v24 = (unsigned char *)(a2 + v22);
  uint64_t v25 = sub_25C662CD0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    *uint64_t v23 = *v24;
    *(_OWORD *)(v23 + 8) = *(_OWORD *)(v24 + 8);
    uint64_t v27 = *(int *)(v25 + 28);
    uint64_t v28 = &v23[v27];
    uint64_t v29 = &v24[v27];
    uint64_t v30 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      uint64_t v31 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v31 - 8) + 16))(v28, v29, v31);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  }
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  uint64_t v32 = v11[14];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  uint64_t v35 = sub_25C662B70();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
  }
  uint64_t v37 = type metadata accessor for RenderableEvent();
  uint64_t v38 = *(int *)(v37 + 20);
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  uint64_t v41 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  uint64_t v42 = *(int *)(v37 + 24);
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (void *)(a2 + v42);
  uint64_t v45 = v44[1];
  void *v43 = *v44;
  v43[1] = v45;
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25C64F510(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)sub_25C662CE0();
  uint64_t v7 = v6[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(unsigned char *)(a1 + v6[9]) = *(unsigned char *)(a2 + v6[9]);
  uint64_t v11 = v6[10];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  void *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = v6[11];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = v6[12];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  int v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
      *(void *)(v18 + 8) = *(void *)(v19 + 8);
      *(void *)(v18 + 16) = *(void *)(v19 + 16);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v30 = *(int *)(v20 + 28);
      uint64_t v31 = v18 + v30;
      uint64_t v32 = (const void *)(v19 + v30);
      sub_25C64FACC(v31, MEMORY[0x263F6CD68]);
      uint64_t v33 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v52 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v52 - 8) + 16))(v31, v32, v52);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v27 = *(void *)(*(void *)(v33 - 8) + 64);
      uint64_t v28 = (void *)v31;
      uint64_t v29 = v32;
LABEL_8:
      memcpy(v28, v29, v27);
      goto LABEL_14;
    }
    sub_25C64FACC(v18, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v27 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v28 = (void *)v18;
    uint64_t v29 = (const void *)v19;
    goto LABEL_8;
  }
  if (v22) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  *(void *)(v18 + 16) = *(void *)(v19 + 16);
  uint64_t v23 = *(int *)(v20 + 28);
  uint64_t v24 = (void *)(v18 + v23);
  uint64_t v25 = (const void *)(v19 + v23);
  uint64_t v26 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v34 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(void *)(a1 + v6[13]) = *(void *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = v6[14];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (const void *)(a2 + v35);
  uint64_t v38 = sub_25C662B70();
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
  int v40 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
  if (!v39)
  {
    uint64_t v41 = *(void *)(v38 - 8);
    if (!v40)
    {
      (*(void (**)(void *, const void *, uint64_t))(v41 + 24))(v36, v37, v38);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v41 + 8))(v36, v38);
    goto LABEL_19;
  }
  if (v40)
  {
LABEL_19:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v36, v37, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
LABEL_20:
  uint64_t v43 = type metadata accessor for RenderableEvent();
  uint64_t v44 = *(int *)(v43 + 20);
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  uint64_t v47 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 24))(v45, v46, v47);
  uint64_t v48 = *(int *)(v43 + 24);
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (void *)(a2 + v48);
  *uint64_t v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25C64FACC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

_OWORD *sub_25C64FB20(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  uint64_t v8 = (int *)sub_25C662CE0();
  uint64_t v9 = v8[8];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25C6628A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *((unsigned char *)a1 + v8[9]) = *((unsigned char *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  uint64_t v13 = v8[12];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_25C662CD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    unsigned char *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    uint64_t v18 = *(int *)(v16 + 28);
    uint64_t v19 = &v14[v18];
    uint64_t v20 = &v15[v18];
    uint64_t v21 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(void *)((char *)a1 + v8[13]) = *(void *)((char *)a2 + v8[13]);
  uint64_t v23 = v8[14];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_25C662B70();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  uint64_t v28 = type metadata accessor for RenderableEvent();
  uint64_t v29 = *(int *)(v28 + 20);
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = sub_25C662C10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
  *(_OWORD *)((char *)a1 + *(int *)(v28 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v28 + 24));
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25C64FE40(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v16 = v11[10];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v11[11];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = v11[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  int v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v39 = *(int *)(v29 + 28);
      uint64_t v40 = v27 + v39;
      uint64_t v41 = (const void *)(v28 + v39);
      sub_25C64FACC(v40, MEMORY[0x263F6CD68]);
      uint64_t v42 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v63 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v63 - 8) + 32))(v40, v41, v63);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v36 = *(void *)(*(void *)(v42 - 8) + 64);
      uint64_t v37 = (void *)v40;
      uint64_t v38 = v41;
LABEL_8:
      memcpy(v37, v38, v36);
      goto LABEL_14;
    }
    sub_25C64FACC(v27, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v36 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v37 = (void *)v27;
    uint64_t v38 = (const void *)v28;
    goto LABEL_8;
  }
  if (v31) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  uint64_t v32 = *(int *)(v29 + 28);
  uint64_t v33 = (void *)(v27 + v32);
  uint64_t v34 = (const void *)(v28 + v32);
  uint64_t v35 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    uint64_t v43 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  uint64_t v44 = v11[14];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (const void *)(a2 + v44);
  uint64_t v47 = sub_25C662B70();
  int v48 = __swift_getEnumTagSinglePayload((uint64_t)v45, 1, v47);
  int v49 = __swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47);
  if (!v48)
  {
    uint64_t v50 = *(void *)(v47 - 8);
    if (!v49)
    {
      (*(void (**)(void *, const void *, uint64_t))(v50 + 40))(v45, v46, v47);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v50 + 8))(v45, v47);
    goto LABEL_19;
  }
  if (v49)
  {
LABEL_19:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v45, v46, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
  __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
LABEL_20:
  uint64_t v52 = type metadata accessor for RenderableEvent();
  uint64_t v53 = *(int *)(v52 + 20);
  uint64_t v54 = a1 + v53;
  uint64_t v55 = a2 + v53;
  uint64_t v56 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 40))(v54, v55, v56);
  uint64_t v57 = *(int *)(v52 + 24);
  int v58 = (void *)(a1 + v57);
  id v59 = (uint64_t *)(a2 + v57);
  uint64_t v61 = *v59;
  uint64_t v60 = v59[1];
  void *v58 = v61;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25C65035C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C650370);
}

uint64_t sub_25C650370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 2) {
      return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_25C65040C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C650420);
}

void sub_25C650420(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
}

uint64_t type metadata accessor for SingleEventSnippet()
{
  uint64_t result = qword_26A5BCC10;
  if (!qword_26A5BCC10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6504F0()
{
  uint64_t result = type metadata accessor for RenderableEvent();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C650584()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C6505A0()
{
  uint64_t v1 = type metadata accessor for SingleEventSnippet();
  uint64_t v2 = OUTLINED_FUNCTION_1_1(v1);
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v2);
  sub_25C650B28(v0, (uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for SingleEventSnippet);
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  sub_25C650A04((uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  type metadata accessor for SingleEventView();
  sub_25C650AD8();
  return sub_25C6634A0();
}

uint64_t sub_25C6506A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25C650B28(a1, a2, (uint64_t (*)(void))type metadata accessor for RenderableEvent);
  char v4 = *(unsigned char *)(a1 + *(int *)(type metadata accessor for SingleEventSnippet() + 20));
  uint64_t v5 = (int *)type metadata accessor for SingleEventView();
  *(unsigned char *)(a2 + v5[5]) = v4;
  sub_25C663580();
  uint64_t v6 = a2 + v5[7];
  *(void *)uint64_t v6 = swift_getKeyPath();
  *(unsigned char *)(v6 + 8) = 0;
  *(void *)(v6 + 16) = 0x4030000000000000;
  *(void *)(v6 + 24) = 0;
  *(unsigned char *)(v6 + 32) = 1;
  *(void *)(v6 + 40) = 1;
  *(void *)(v6 + 48) = sub_25C64B95C;
  *(void *)(v6 + 56) = 0;
  uint64_t v7 = a2 + v5[8];
  *(void *)uint64_t v7 = swift_getKeyPath();
  *(unsigned char *)(v7 + 8) = 0;
  *(_OWORD *)(v7 + 16) = xmmword_25C664230;
  *(void *)(v7 + 32) = 1;
  *(void *)(v7 + 40) = sub_25C660C58;
  *(void *)(v7 + 48) = 0;
  uint64_t v8 = a2 + v5[9];
  uint64_t result = swift_getKeyPath();
  *(void *)uint64_t v8 = result;
  *(unsigned char *)(v8 + 8) = 0;
  return result;
}

uint64_t sub_25C6507C8()
{
  uint64_t v1 = type metadata accessor for SingleEventSnippet();
  OUTLINED_FUNCTION_1_1(v1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = v0 + v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = (int *)sub_25C662CE0();
  uint64_t v9 = v0 + v4 + v8[8];
  sub_25C6628A0();
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t))(v10 + 8))(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = v0 + v4 + v8[12];
  uint64_t v12 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12))
  {
    uint64_t v13 = v11 + *(int *)(v12 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_25C6629F0();
      OUTLINED_FUNCTION_1_2();
      (*(void (**)(uint64_t))(v14 + 8))(v13);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = v7 + v8[14];
  uint64_t v16 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v15, 1, v16)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  }
  uint64_t v17 = v3 | 7;
  uint64_t v18 = v7 + *(int *)(type metadata accessor for RenderableEvent() + 20);
  sub_25C662C10();
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t))(v19 + 8))(v18);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v4 + v6, v17);
}

uint64_t sub_25C650A04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SingleEventSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C650A68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for SingleEventSnippet() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_25C6506A8(v4, a1);
}

unint64_t sub_25C650AD8()
{
  unint64_t result = qword_26A5BC6F8;
  if (!qword_26A5BC6F8)
  {
    type metadata accessor for SingleEventView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC6F8);
  }
  return result;
}

uint64_t sub_25C650B28(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_25C650B9C()
{
  unint64_t result = qword_26A5BCC20;
  if (!qword_26A5BCC20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCC28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCC20);
  }
  return result;
}

void *sub_25C650C04(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C662AC0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_25C650CD0(uint64_t a1)
{
  uint64_t v2 = sub_25C662AC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_25C650D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C662AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25C650DB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C662AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25C650E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C662AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25C650EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C662AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25C650F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C650F38);
}

uint64_t sub_25C650F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C662AC0();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 2) {
      return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_25C650FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C650FE8);
}

void sub_25C650FE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25C662AC0();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
}

uint64_t type metadata accessor for CalendarEnvironmentSetupModifier()
{
  uint64_t result = qword_26A5BCC30;
  if (!qword_26A5BCC30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6510B8()
{
  uint64_t result = sub_25C662AC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C65114C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C651168@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25C662AA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C662AB0();
  uint64_t v6 = sub_25C662A90();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v7 = sub_25C662E80();
  uint64_t v8 = (unsigned int *)MEMORY[0x263F18DD0];
  if (v6 != 2) {
    uint64_t v8 = (unsigned int *)MEMORY[0x263F18DC8];
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v7 - 8) + 104))(a1, *v8, v7);
}

uint64_t sub_25C651294@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = sub_25C662E80();
  uint64_t v3 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_3();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCC40);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCC48);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3();
  uint64_t v16 = v15 - v14;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCC50);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_3();
  uint64_t v20 = v19 - v18;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v22 = (uint64_t *)(v11 + *(int *)(v8 + 44));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCC58);
  sub_25C662AC0();
  OUTLINED_FUNCTION_1();
  uint64_t v23 = OUTLINED_FUNCTION_2();
  v24(v23);
  *uint64_t v22 = KeyPath;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCC60);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v11, a1);
  uint64_t v26 = swift_getKeyPath();
  if (*(unsigned char *)(v2 + *(int *)(type metadata accessor for CalendarEnvironmentSetupModifier() + 20)) == 1)
  {
    uint64_t v27 = v36;
    (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F18DD0], v36);
  }
  else
  {
    sub_25C651168(v6);
    uint64_t v27 = v36;
  }
  uint64_t v28 = (uint64_t *)(v16 + *(int *)(v12 + 36));
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCC68);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)v28 + *(int *)(v29 + 28), v6, v27);
  *uint64_t v28 = v26;
  sub_25C62973C(v11, v16, &qword_26A5BCC40);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v27);
  sub_25C62978C(v11, &qword_26A5BCC40);
  uint64_t v30 = sub_25C663380();
  uint64_t v31 = swift_getKeyPath();
  sub_25C62973C(v16, v20, &qword_26A5BCC48);
  uint64_t v32 = (uint64_t *)(v20 + *(int *)(v35 + 36));
  *uint64_t v32 = v31;
  v32[1] = v30;
  sub_25C62978C(v16, &qword_26A5BCC48);
  return sub_25C651730(v20, a2);
}

uint64_t sub_25C6515D8(uint64_t a1)
{
  uint64_t v2 = sub_25C662E80();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25C662F10();
}

uint64_t sub_25C6516AC()
{
  return sub_25C662F00();
}

uint64_t sub_25C6516D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C662FC0();
  *a1 = result;
  return result;
}

uint64_t sub_25C651700()
{
  return sub_25C662FD0();
}

uint64_t sub_25C651730(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCC50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_25C65179C()
{
  unint64_t result = qword_26A5BCC70;
  if (!qword_26A5BCC70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCC50);
    sub_25C65183C();
    sub_25C6298EC(&qword_26A5BCCA0, &qword_26A5BCCA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCC70);
  }
  return result;
}

unint64_t sub_25C65183C()
{
  unint64_t result = qword_26A5BCC78;
  if (!qword_26A5BCC78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCC48);
    sub_25C6518DC();
    sub_25C6298EC(&qword_26A5BCC98, &qword_26A5BCC68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCC78);
  }
  return result;
}

unint64_t sub_25C6518DC()
{
  unint64_t result = qword_26A5BCC80;
  if (!qword_26A5BCC80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCC40);
    sub_25C6298EC(&qword_26A5BCC88, &qword_26A5BCC60);
    sub_25C6298EC(&qword_26A5BCC90, &qword_26A5BCC58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCC80);
  }
  return result;
}

uint64_t sub_25C6519A0(uint64_t a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = v4 + ((v3 + 16) & ~(unint64_t)v3);
  }
  else
  {
    uint64_t v7 = a1;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v8 = a3[6];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_25C663590();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = v7 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v13);
    LOBYTE(v9) = *((unsigned char *)a2 + v13 + 8);
    sub_25C62C450(v16, v9);
    *(void *)uint64_t v14 = v16;
    *(unsigned char *)(v14 + 8) = v9;
    *(_OWORD *)(v14 + 16) = *(_OWORD *)(v15 + 16);
    *(unsigned char *)(v14 + 32) = *(unsigned char *)(v15 + 32);
    uint64_t v17 = *(void *)(v15 + 48);
    uint64_t v18 = *(void *)(v15 + 56);
    *(void *)(v14 + 40) = *(void *)(v15 + 40);
    *(void *)(v14 + 48) = v17;
    *(void *)(v14 + 56) = v18;
    uint64_t v19 = a3[8];
    uint64_t v20 = v7 + v19;
    uint64_t v21 = (uint64_t)a2 + v19;
    uint64_t v22 = *(uint64_t *)((char *)a2 + v19);
    uint64_t v23 = *(void *)(v21 + 8);
    *(void *)uint64_t v20 = v22;
    *(void *)(v20 + 8) = v23;
    *(unsigned char *)(v20 + 16) = *(unsigned char *)(v21 + 16);
    *(void *)(v20 + 24) = *(void *)(v21 + 24);
    char v24 = *(unsigned char *)(v21 + 72);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v24)
    {
      long long v25 = *(_OWORD *)(v21 + 56);
      *(_OWORD *)(v20 + 56) = v25;
      (**(void (***)(uint64_t, uint64_t))(v25 - 8))(v20 + 32, v21 + 32);
    }
    else
    {
      uint64_t v26 = *(void *)(v21 + 40);
      *(void *)(v20 + 32) = *(void *)(v21 + 32);
      *(void *)(v20 + 40) = v26;
      swift_retain();
    }
    *(unsigned char *)(v20 + 72) = v24;
    uint64_t v27 = (int *)type metadata accessor for CalendarButtonView.Model(0);
    uint64_t v28 = v27[6];
    uint64_t v29 = v20 + v28;
    uint64_t v30 = v21 + v28;
    uint64_t v31 = sub_25C663490();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
    *(void *)(v20 + v27[7]) = *(void *)(v21 + v27[7]);
    *(void *)(v20 + v27[8]) = *(void *)(v21 + v27[8]);
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_25C651BE4(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_25C62C6E4(*(void *)(a1 + a2[7]), *(unsigned char *)(a1 + a2[7] + 8));
  swift_release();
  uint64_t v6 = a1 + a2[8];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v6 + 72)) {
    __swift_destroy_boxed_opaque_existential_1(v6 + 32);
  }
  else {
    swift_release();
  }
  uint64_t v7 = v6 + *(int *)(type metadata accessor for CalendarButtonView.Model(0) + 24);
  uint64_t v8 = sub_25C663490();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  return swift_release();
}

uint64_t sub_25C651D18(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25C663590();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = *(void *)(a2 + v11);
  LOBYTE(v7) = *(unsigned char *)(a2 + v11 + 8);
  sub_25C62C450(v14, v7);
  *(void *)uint64_t v12 = v14;
  *(unsigned char *)(v12 + 8) = v7;
  *(_OWORD *)(v12 + 16) = *(_OWORD *)(v13 + 16);
  *(unsigned char *)(v12 + 32) = *(unsigned char *)(v13 + 32);
  uint64_t v15 = *(void *)(v13 + 48);
  uint64_t v16 = *(void *)(v13 + 56);
  *(void *)(v12 + 40) = *(void *)(v13 + 40);
  *(void *)(v12 + 48) = v15;
  *(void *)(v12 + 56) = v16;
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = *(void *)(a2 + v17 + 8);
  *(void *)uint64_t v18 = *(void *)(a2 + v17);
  *(void *)(v18 + 8) = v20;
  *(unsigned char *)(v18 + 16) = *(unsigned char *)(a2 + v17 + 16);
  *(void *)(v18 + 24) = *(void *)(a2 + v17 + 24);
  char v21 = *(unsigned char *)(a2 + v17 + 72);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v21)
  {
    long long v22 = *(_OWORD *)(v19 + 56);
    *(_OWORD *)(v18 + 56) = v22;
    (**(void (***)(uint64_t, uint64_t))(v22 - 8))(v18 + 32, v19 + 32);
  }
  else
  {
    uint64_t v23 = *(void *)(v19 + 40);
    *(void *)(v18 + 32) = *(void *)(v19 + 32);
    *(void *)(v18 + 40) = v23;
    swift_retain();
  }
  *(unsigned char *)(v18 + 72) = v21;
  char v24 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v25 = v24[6];
  uint64_t v26 = v18 + v25;
  uint64_t v27 = v19 + v25;
  uint64_t v28 = sub_25C663490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  *(void *)(v18 + v24[7]) = *(void *)(v19 + v24[7]);
  *(void *)(v18 + v24[8]) = *(void *)(v19 + v24[8]);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_25C651F18(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = *(void *)(a2 + v10);
  LOBYTE(v8) = *(unsigned char *)(a2 + v10 + 8);
  sub_25C62C450(v13, v8);
  uint64_t v14 = *(void *)v11;
  char v15 = *(unsigned char *)(v11 + 8);
  *(void *)uint64_t v11 = v13;
  *(unsigned char *)(v11 + 8) = v8;
  sub_25C62C6E4(v14, v15);
  *(void *)(v11 + 16) = *(void *)(v12 + 16);
  uint64_t v16 = *(void *)(v12 + 24);
  *(unsigned char *)(v11 + 32) = *(unsigned char *)(v12 + 32);
  *(void *)(v11 + 24) = v16;
  *(void *)(v11 + 40) = *(void *)(v12 + 40);
  uint64_t v17 = *(void *)(v12 + 56);
  *(void *)(v11 + 48) = *(void *)(v12 + 48);
  *(void *)(v11 + 56) = v17;
  swift_retain();
  swift_release();
  uint64_t v18 = a3[8];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  *(void *)uint64_t v19 = *(void *)(a2 + v18);
  *(void *)(v19 + 8) = *(void *)(a2 + v18 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v19 + 16) = *(unsigned char *)(v20 + 16);
  *(void *)(v19 + 24) = *(void *)(v20 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_25C63C9A8(v19 + 32);
    if (*(unsigned char *)(v20 + 72))
    {
      uint64_t v21 = *(void *)(v20 + 56);
      *(void *)(v19 + 56) = v21;
      *(void *)(v19 + 64) = *(void *)(v20 + 64);
      (**(void (***)(uint64_t, uint64_t))(v21 - 8))(v19 + 32, v20 + 32);
      *(unsigned char *)(v19 + 72) = 1;
    }
    else
    {
      uint64_t v22 = *(void *)(v20 + 40);
      *(void *)(v19 + 32) = *(void *)(v20 + 32);
      *(void *)(v19 + 40) = v22;
      *(unsigned char *)(v19 + 72) = 0;
      swift_retain();
    }
  }
  uint64_t v23 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v24 = v23[6];
  uint64_t v25 = v19 + v24;
  uint64_t v26 = v20 + v24;
  uint64_t v27 = sub_25C663490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 24))(v25, v26, v27);
  *(void *)(v19 + v23[7]) = *(void *)(v20 + v23[7]);
  swift_retain();
  swift_release();
  *(void *)(v19 + v23[8]) = *(void *)(v20 + v23[8]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25C652180(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a3[8];
  uint64_t v12 = (_OWORD *)(a1 + v10);
  uint64_t v13 = (_OWORD *)(a2 + v10);
  long long v14 = v13[1];
  _OWORD *v12 = *v13;
  v12[1] = v14;
  long long v15 = v13[3];
  v12[2] = v13[2];
  void v12[3] = v15;
  uint64_t v16 = (_OWORD *)(a1 + v11);
  uint64_t v17 = a2 + v11;
  long long v18 = *(_OWORD *)(a2 + v11 + 16);
  *uint64_t v16 = *(_OWORD *)(a2 + v11);
  v16[1] = v18;
  *(_OWORD *)((char *)v16 + 57) = *(_OWORD *)(a2 + v11 + 57);
  long long v19 = *(_OWORD *)(a2 + v11 + 48);
  v16[2] = *(_OWORD *)(a2 + v11 + 32);
  v16[3] = v19;
  uint64_t v20 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v21 = v20[6];
  uint64_t v22 = (char *)v16 + v21;
  uint64_t v23 = v17 + v21;
  uint64_t v24 = sub_25C663490();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
  *(void *)((char *)v16 + v20[7]) = *(void *)(v17 + v20[7]);
  *(void *)((char *)v16 + v20[8]) = *(void *)(v17 + v20[8]);
  return a1;
}

uint64_t sub_25C6522BC(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  char v13 = *(unsigned char *)(a2 + v10 + 8);
  uint64_t v14 = *(void *)(a1 + v10);
  char v15 = *(unsigned char *)(a1 + v10 + 8);
  *(void *)uint64_t v11 = *(void *)(a2 + v10);
  *(unsigned char *)(v11 + 8) = v13;
  sub_25C62C6E4(v14, v15);
  *(void *)(v11 + 16) = *(void *)(v12 + 16);
  *(void *)(v11 + 24) = *(void *)(v12 + 24);
  *(unsigned char *)(v11 + 32) = *(unsigned char *)(v12 + 32);
  *(void *)(v11 + 40) = *(void *)(v12 + 40);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(v12 + 48);
  swift_release();
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = *(void *)(a2 + v16 + 8);
  *(void *)uint64_t v17 = *(void *)(a2 + v16);
  *(void *)(v17 + 8) = v19;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v17 + 16) = *(unsigned char *)(v18 + 16);
  *(void *)(v17 + 24) = *(void *)(v18 + 24);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_25C63C9A8(v17 + 32);
    long long v20 = *(_OWORD *)(v18 + 48);
    *(_OWORD *)(v17 + 32) = *(_OWORD *)(v18 + 32);
    *(_OWORD *)(v17 + 48) = v20;
    *(_OWORD *)(v17 + 57) = *(_OWORD *)(v18 + 57);
  }
  uint64_t v21 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v22 = v21[6];
  uint64_t v23 = v17 + v22;
  uint64_t v24 = v18 + v22;
  uint64_t v25 = sub_25C663490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
  *(void *)(v17 + v21[7]) = *(void *)(v18 + v21[7]);
  swift_release();
  *(void *)(v17 + v21[8]) = *(void *)(v18 + v21[8]);
  swift_release();
  return a1;
}

uint64_t sub_25C652480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C652494);
}

uint64_t sub_25C652494(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    sub_25C663590();
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 24);
    }
    else
    {
      uint64_t v10 = type metadata accessor for CalendarButtonView.Model(0);
      uint64_t v11 = *(int *)(a3 + 32);
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v11, a2, v10);
  }
}

uint64_t sub_25C652540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C652554);
}

void *sub_25C652554(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    sub_25C663590();
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 24);
    }
    else
    {
      uint64_t v10 = type metadata accessor for CalendarButtonView.Model(0);
      uint64_t v11 = *(int *)(a4 + 32);
    }
    return (void *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for EventListSnippet()
{
  uint64_t result = qword_26A5BCCB0;
  if (!qword_26A5BCCB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C652644()
{
  uint64_t result = sub_25C663590();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for CalendarButtonView.Model(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C65272C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C652748(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_25C662CE0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v22 = (uint64_t)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for RenderableEvent();
  uint64_t v21 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    uint64_t v23 = MEMORY[0x263F8EE78];
    sub_25C64B730(0, v11, 0);
    uint64_t v12 = v23;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v20 = *(void *)(v6 + 72);
    while (1)
    {
      uint64_t v14 = v22;
      sub_25C653BA0(v13, v22, MEMORY[0x263F6CD78]);
      id v15 = a2;
      sub_25C62B570(v14, v15, (uint64_t)v10);
      if (v2) {
        break;
      }
      uint64_t v23 = v12;
      unint64_t v17 = *(void *)(v12 + 16);
      unint64_t v16 = *(void *)(v12 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_25C64B730(v16 > 1, v17 + 1, 1);
        uint64_t v12 = v23;
      }
      *(void *)(v12 + 16) = v17 + 1;
      sub_25C653C00((uint64_t)v10, v12+ ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(void *)(v21 + 72) * v17, (void (*)(void))type metadata accessor for RenderableEvent);
      v13 += v20;
      if (!--v11)
      {

        return v12;
      }
    }

    swift_release();
  }
  else
  {

    return MEMORY[0x263F8EE78];
  }
  return v12;
}

uint64_t sub_25C6529C0(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v37 = sub_25C662A20();
  uint64_t v6 = *(void (***)(char *, uint64_t))(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DayEventGroupView.DayEventGroup(0);
  uint64_t v35 = *(void *)(v9 - 8);
  uint64_t v36 = v9;
  MEMORY[0x270FA5388](v9);
  int64_t v11 = (void *)((char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  int64_t v12 = *(void *)(a1 + 16);
  if (v12)
  {
    uint64_t v33 = v6;
    uint64_t v39 = MEMORY[0x263F8EE78];
    sub_25C64B770(0, v12, 0);
    uint64_t v13 = v39;
    uint64_t v14 = sub_25C662C70();
    uint64_t v15 = a1
        + ((*(unsigned __int8 *)(*(void *)(v14 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v14 - 8) + 80));
    uint64_t v16 = v14;
    uint64_t v34 = *(void *)(*(void *)(v14 - 8) + 72);
    id v17 = a2;
    uint64_t v18 = swift_bridgeObjectRetain();
    id v38 = v17;
    uint64_t v19 = sub_25C652748(v18, v17);
    if (v3)
    {

      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v20 = v19;
      v32[1] = v16;
      ++v33;
      while (1)
      {
        swift_bridgeObjectRelease();
        sub_25C662A10();
        uint64_t v21 = sub_25C662A00();
        uint64_t v23 = v22;
        (*v33)(v8, v37);
        *int64_t v11 = v21;
        v11[1] = v23;
        v11[2] = v20;
        uint64_t v24 = (char *)v11 + *(int *)(v36 + 24);
        uint64_t v25 = sub_25C6629F0();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(v24, v15, v25);
        uint64_t v13 = v39;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25C64B770(0, *(void *)(v13 + 16) + 1, 1);
          uint64_t v13 = v39;
        }
        uint64_t v26 = v34;
        unint64_t v28 = *(void *)(v13 + 16);
        unint64_t v27 = *(void *)(v13 + 24);
        if (v28 >= v27 >> 1)
        {
          sub_25C64B770(v27 > 1, v28 + 1, 1);
          uint64_t v13 = v39;
        }
        *(void *)(v13 + 16) = v28 + 1;
        sub_25C653C00((uint64_t)v11, v13+ ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(void *)(v35 + 72) * v28, (void (*)(void))type metadata accessor for DayEventGroupView.DayEventGroup);
        if (!--v12) {
          break;
        }
        id v29 = v38;
        uint64_t v30 = swift_bridgeObjectRetain();
        uint64_t v20 = sub_25C652748(v30, v29);
        v15 += v26;
      }
    }
  }
  else
  {

    return MEMORY[0x263F8EE78];
  }
  return v13;
}

void sub_25C652D88(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = type metadata accessor for EventListSnippet();
  sub_25C663580();
  uint64_t v6 = a4 + *(int *)(v5 + 28);
  *(void *)uint64_t v6 = swift_getKeyPath();
  *(unsigned char *)(v6 + 8) = 0;
  *(void *)(v6 + 16) = 0x4030000000000000;
  *(void *)(v6 + 24) = 0;
  *(unsigned char *)(v6 + 32) = 1;
  *(void *)(v6 + 40) = 1;
  *(void *)(v6 + 48) = sub_25C64B95C;
  *(void *)(v6 + 56) = 0;
  uint64_t v7 = a4 + *(int *)(v5 + 32);
  uint64_t v8 = sub_25C663060();
  uint64_t v10 = v9;
  char v12 = v11;
  uint64_t v23 = v13;
  *(void *)(v7 + 56) = MEMORY[0x263F6CD30];
  *(void *)(v7 + 64) = sub_25C632D4C();
  *(unsigned char *)(v7 + 32) = 0;
  *(unsigned char *)(v7 + 72) = 1;
  uint64_t v14 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v15 = v7 + v14[6];
  uint64_t v16 = *MEMORY[0x263F774E0];
  sub_25C663490();
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v17 + 104))(v15, v16);
  *(void *)uint64_t v7 = v8;
  *(void *)(v7 + 8) = v10;
  *(unsigned char *)(v7 + 16) = v12 & 1;
  *(void *)(v7 + 24) = v23;
  *(void *)(v7 + v14[7]) = 0;
  *(void *)(v7 + v14[8]) = 0;
  id v18 = a3;
  uint64_t v19 = sub_25C6529C0(a1, v18);
  if (v26)
  {
    swift_bridgeObjectRelease();

    sub_25C663590();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_7();
    v20();
    sub_25C62C6E4(*(void *)v6, *(unsigned char *)(v6 + 8));
    swift_release();
    sub_25C653B4C(v7, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  }
  else
  {
    uint64_t v21 = v19;
    swift_bridgeObjectRelease();

    *(void *)a4 = v21;
    *(unsigned char *)(a4 + 8) = a2 & 1;
  }
}

uint64_t sub_25C652FA8()
{
  uint64_t v1 = type metadata accessor for EventListSnippet();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  sub_25C653BA0(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for EventListSnippet);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_25C653C00((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (void (*)(void))type metadata accessor for EventListSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCCC0);
  sub_25C6298EC(&qword_26A5BCCC8, &qword_26A5BCCC0);
  return sub_25C6634A0();
}

uint64_t sub_25C653110@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v61 = a2;
  uint64_t v52 = type metadata accessor for CalendarButtonView(0);
  MEMORY[0x270FA5388](v52);
  uint64_t v49 = (uint64_t)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCCD0);
  uint64_t v53 = *(void *)(v4 - 8);
  uint64_t v54 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v51 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCCD8);
  uint64_t v50 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  int v48 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCCE0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v60 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v57 = (char *)&v45 - v10;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCCE8);
  MEMORY[0x270FA5388](v56);
  char v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCCF0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  int v58 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v45 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v45 - v20;
  uint64_t v22 = sub_25C6630A0();
  uint64_t v23 = type metadata accessor for EventListSnippet();
  uint64_t v24 = *(int *)(v23 + 28);
  uint64_t v55 = a1;
  uint64_t v46 = v23;
  uint64_t v47 = (char *)a1 + v24;
  uint64_t v25 = *(void *)((char *)a1 + v24 + 16);
  *(void *)char v12 = v22;
  *((void *)v12 + 1) = v25;
  v12[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCCF8);
  uint64_t v62 = *a1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCD00);
  type metadata accessor for DayEventGroupView(0);
  sub_25C6298EC(&qword_26A5BCD08, &qword_26A5BCD00);
  sub_25C653AFC(&qword_26A5BCD10, (void (*)(uint64_t))type metadata accessor for DayEventGroupView);
  sub_25C653AFC(&qword_26A5BCD18, (void (*)(uint64_t))type metadata accessor for DayEventGroupView.DayEventGroup);
  uint64_t v26 = v21;
  sub_25C663460();
  sub_25C6298EC(&qword_26A5BCD20, &qword_26A5BCCE8);
  sub_25C663290();
  sub_25C63945C((uint64_t)v12, &qword_26A5BCCE8);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v21, v19, v13);
  if (*((unsigned char *)v55 + 8) == 1)
  {
    uint64_t v27 = v49;
    sub_25C653BA0((uint64_t)v55 + *(int *)(v46 + 32), v49, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
    uint64_t v28 = v52;
    uint64_t v29 = v27 + *(int *)(v52 + 20);
    *(void *)uint64_t v29 = swift_getKeyPath();
    *(unsigned char *)(v29 + 8) = 0;
    sub_25C663580();
    uint64_t v30 = sub_25C653AFC((unint64_t *)&qword_26A5BC5D8, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
    uint64_t v31 = v51;
    sub_25C663290();
    sub_25C653B4C(v27, (void (*)(void))type metadata accessor for CalendarButtonView);
    uint64_t v62 = v28;
    uint64_t v63 = v30;
    swift_getOpaqueTypeConformance2();
    uint64_t v32 = v48;
    uint64_t v33 = v54;
    sub_25C663280();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v31, v33);
    uint64_t v34 = (uint64_t)v57;
    uint64_t v35 = v59;
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v57, v32, v59);
    uint64_t v36 = 0;
    uint64_t v37 = v35;
  }
  else
  {
    uint64_t v36 = 1;
    uint64_t v37 = v59;
    uint64_t v34 = (uint64_t)v57;
  }
  __swift_storeEnumTagSinglePayload(v34, v36, 1, v37);
  id v38 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  uint64_t v39 = v58;
  v38(v58, v26, v13);
  uint64_t v40 = v60;
  sub_25C653A8C(v34, v60);
  uint64_t v41 = v61;
  v38(v61, v39, v13);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCD28);
  sub_25C653A8C(v40, (uint64_t)&v41[*(int *)(v42 + 48)]);
  sub_25C63945C(v34, &qword_26A5BCCE0);
  uint64_t v43 = *(void (**)(char *, uint64_t))(v14 + 8);
  v43(v26, v13);
  sub_25C63945C(v40, &qword_26A5BCCE0);
  return ((uint64_t (*)(char *, uint64_t))v43)(v39, v13);
}

uint64_t sub_25C653830@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25C663580();
}

uint64_t sub_25C653884()
{
  uint64_t v1 = (int *)(type metadata accessor for EventListSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  sub_25C663590();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v5();
  sub_25C62C6E4(*(void *)(v0 + v3 + v1[9]), *(unsigned char *)(v0 + v3 + v1[9] + 8));
  swift_release();
  uint64_t v6 = v0 + v3 + v1[10];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v6 + 72)) {
    __swift_destroy_boxed_opaque_existential_1(v6 + 32);
  }
  else {
    swift_release();
  }
  type metadata accessor for CalendarButtonView.Model(0);
  sub_25C663490();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v7();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25C653A1C@<X0>(char *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for EventListSnippet() - 8);
  uint64_t v4 = (void *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
  return sub_25C653110(v4, a1);
}

uint64_t sub_25C653A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCCE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C653AFC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C653B4C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v3();
  return a1;
}

uint64_t sub_25C653BA0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C653C00(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25C653C60()
{
  return sub_25C6298EC(&qword_26A5BCD30, &qword_26A5BCD38);
}

uint64_t *sub_25C653C9C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v5 = a3;
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25C663590();
    char v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(v5 + 24);
    uint64_t v14 = (char *)v7 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v13);
    LOBYTE(v5) = v15[8];
    sub_25C62C450(v16, v5);
    *(void *)uint64_t v14 = v16;
    v14[8] = v5;
    *((_OWORD *)v14 + 1) = *((_OWORD *)v15 + 1);
    v14[32] = v15[32];
    uint64_t v17 = *((void *)v15 + 5);
    uint64_t v18 = *((void *)v15 + 6);
    uint64_t v19 = *((void *)v15 + 7);
    *((void *)v14 + 5) = v17;
    *((void *)v14 + 6) = v18;
    *((void *)v14 + 7) = v19;
  }
  swift_retain();
  return v7;
}

uint64_t sub_25C653DD8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_25C62C6E4(*(void *)(a1 + *(int *)(a2 + 24)), *(unsigned char *)(a1 + *(int *)(a2 + 24) + 8));
  return swift_release();
}

void *sub_25C653E74(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C663590();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  char v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)v4 + v11;
  uint64_t v14 = *(void *)((char *)v4 + v11);
  LOBYTE(v4) = *((unsigned char *)v4 + v11 + 8);
  sub_25C62C450(v14, (char)v4);
  *(void *)char v12 = v14;
  v12[8] = (char)v4;
  *((_OWORD *)v12 + 1) = *((_OWORD *)v13 + 1);
  v12[32] = v13[32];
  uint64_t v15 = *((void *)v13 + 6);
  uint64_t v16 = *((void *)v13 + 7);
  *((void *)v12 + 5) = *((void *)v13 + 5);
  *((void *)v12 + 6) = v15;
  *((void *)v12 + 7) = v16;
  swift_retain();
  return a1;
}

void *sub_25C653F68(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)v4 + v6;
  uint64_t v9 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  char v12 = (char *)v4 + v10;
  uint64_t v13 = *(void *)((char *)v4 + v10);
  LOBYTE(v4) = *((unsigned char *)v4 + v10 + 8);
  sub_25C62C450(v13, (char)v4);
  uint64_t v14 = *(void *)v11;
  char v15 = v11[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v4;
  sub_25C62C6E4(v14, v15);
  *((void *)v11 + 2) = *((void *)v12 + 2);
  uint64_t v16 = *((void *)v12 + 3);
  v11[32] = v12[32];
  *((void *)v11 + 3) = v16;
  *((void *)v11 + 5) = *((void *)v12 + 5);
  uint64_t v17 = *((void *)v12 + 7);
  *((void *)v11 + 6) = *((void *)v12 + 6);
  *((void *)v11 + 7) = v17;
  swift_retain();
  swift_release();
  return a1;
}

void *sub_25C654070(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (_OWORD *)((char *)a1 + v10);
  char v12 = (_OWORD *)((char *)a2 + v10);
  long long v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  long long v14 = v12[3];
  v11[2] = v12[2];
  v11[3] = v14;
  return a1;
}

void *sub_25C654118(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  char v12 = (char *)a2 + v10;
  char v13 = v12[8];
  uint64_t v14 = *(void *)((char *)a1 + v10);
  char v15 = *((unsigned char *)a1 + v10 + 8);
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v13;
  sub_25C62C6E4(v14, v15);
  *((void *)v11 + 2) = *((void *)v12 + 2);
  *((void *)v11 + 3) = *((void *)v12 + 3);
  v11[32] = v12[32];
  *((void *)v11 + 5) = *((void *)v12 + 5);
  *((_OWORD *)v11 + 3) = *((_OWORD *)v12 + 3);
  swift_release();
  return a1;
}

uint64_t sub_25C654204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C654218);
}

uint64_t sub_25C654218(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25C663590();
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_25C6542A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6542B4);
}

void *sub_25C6542B4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25C663590();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for DisambiguateEventsSnippet()
{
  uint64_t result = qword_26A5BCD40;
  if (!qword_26A5BCD40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C65437C()
{
  uint64_t result = sub_25C663590();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C654420()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C65443C()
{
  uint64_t v0 = type metadata accessor for DisambiguateEventsSnippet();
  uint64_t v1 = OUTLINED_FUNCTION_1_1(v0);
  MEMORY[0x270FA5388](v1);
  uint64_t v2 = sub_25C663560();
  MEMORY[0x270FA5388](v2 - 8);
  sub_25C654608();
  sub_25C65535C();
  swift_allocObject();
  sub_25C6553B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCD50);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCD58);
  sub_25C6298EC(&qword_26A5BCD60, &qword_26A5BCD58);
  swift_getOpaqueTypeConformance2();
  return sub_25C663540();
}

uint64_t sub_25C654608()
{
  sub_25C663060();
  if (qword_26A5BC340 != -1) {
    swift_once();
  }
  id v0 = (id)qword_26A5BE0E0;
  uint64_t v1 = sub_25C663220();
  uint64_t v3 = v2;
  char v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v1;
  *(void *)(v9 + 24) = v3;
  *(unsigned char *)(v9 + 32) = v5 & 1;
  *(void *)(v9 + 40) = v7;
  return sub_25C663550();
}

uint64_t sub_25C654740(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCD58);
  MEMORY[0x270FA5388](v2);
  char v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25C6630A0();
  uint64_t v6 = *(void *)((char *)a1 + *(int *)(type metadata accessor for DisambiguateEventsSnippet() + 24) + 16);
  *(void *)char v4 = v5;
  *((void *)v4 + 1) = v6;
  v4[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCD68);
  sub_25C654860(a1);
  sub_25C6298EC(&qword_26A5BCD60, &qword_26A5BCD58);
  sub_25C663290();
  return sub_25C655078((uint64_t)v4);
}

uint64_t sub_25C654860(void *a1)
{
  uint64_t v2 = type metadata accessor for DisambiguateEventsSnippet();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCD70);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10[3] = *a1;
  sub_25C65535C();
  swift_allocObject();
  sub_25C6553B8();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC720);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCD78);
  sub_25C6298EC(&qword_26A5BC730, &qword_26A5BC720);
  uint64_t v7 = type metadata accessor for EventCellView();
  uint64_t v8 = sub_25C655240(&qword_26A5BC740, (void (*)(uint64_t))type metadata accessor for EventCellView);
  v10[1] = v7;
  v10[2] = v8;
  swift_getOpaqueTypeConformance2();
  sub_25C655240(&qword_26A5BC750, (void (*)(uint64_t))type metadata accessor for RenderableEvent);
  sub_25C663460();
  sub_25C655288();
  sub_25C663280();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_25C654B5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  v16[0] = a1;
  uint64_t v3 = type metadata accessor for DisambiguateEventsSnippet();
  uint64_t v17 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  v16[2] = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for RenderableEvent();
  v16[1] = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = (int *)type metadata accessor for EventCellView();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C65535C();
  uint64_t v12 = sub_25C6629F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v12);
  uint64_t v13 = (uint64_t)&v11[v9[5]];
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v12);
  uint64_t v14 = &v11[v9[7]];
  *(void *)uint64_t v14 = swift_getKeyPath();
  v14[8] = 0;
  *((void *)v14 + 2) = 0x4030000000000000;
  *((void *)v14 + 3) = 0;
  v14[32] = 1;
  *((void *)v14 + 5) = 1;
  *((void *)v14 + 6) = sub_25C64B95C;
  *((void *)v14 + 7) = 0;
  sub_25C6553B8();
  sub_25C63950C((uint64_t)v7, v13);
  v11[v9[6]] = 1;
  sub_25C65535C();
  sub_25C65535C();
  swift_allocObject();
  sub_25C6553B8();
  sub_25C6553B8();
  sub_25C655240(&qword_26A5BC740, (void (*)(uint64_t))type metadata accessor for EventCellView);
  sub_25C663300();
  swift_release();
  return sub_25C6557B0((uint64_t)v11);
}

uint64_t sub_25C654EF8()
{
  uint64_t v0 = sub_25C663670();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_25C662C20();
  uint64_t v6 = v5;
  type metadata accessor for DisambiguateEventsSnippet();
  sub_25C663570();
  sub_25C6558C4(v4, v6);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C655028()
{
  uint64_t v1 = type metadata accessor for DisambiguateEventsSnippet();
  OUTLINED_FUNCTION_0_2(v1);
  uint64_t v3 = (void *)(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return sub_25C654740(v3);
}

uint64_t sub_25C655078(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCD58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t objectdestroyTm_4()
{
  uint64_t v1 = (int *)(type metadata accessor for DisambiguateEventsSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  sub_25C663590();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v7();
  sub_25C62C6E4(*(void *)(v6 + v1[8]), *(unsigned char *)(v6 + v1[8] + 8));
  swift_release();
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25C6551E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for DisambiguateEventsSnippet();
  OUTLINED_FUNCTION_0_2(v5);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return sub_25C654B5C(a1, v7, a2);
}

uint64_t sub_25C655240(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25C655288()
{
  unint64_t result = qword_26A5BCD80;
  if (!qword_26A5BCD80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCD70);
    type metadata accessor for EventCellView();
    sub_25C655240(&qword_26A5BC740, (void (*)(uint64_t))type metadata accessor for EventCellView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCD80);
  }
  return result;
}

uint64_t sub_25C65535C()
{
  uint64_t v2 = OUTLINED_FUNCTION_4_3();
  v3(v2);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_25C6553B8()
{
  uint64_t v2 = OUTLINED_FUNCTION_4_3();
  v3(v2);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_25C65540C()
{
  uint64_t v1 = (int *)(type metadata accessor for DisambiguateEventsSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for RenderableEvent() - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  swift_bridgeObjectRelease();
  sub_25C663590();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v9();
  sub_25C62C6E4(*(void *)(v0 + v3 + v1[8]), *(unsigned char *)(v0 + v3 + v1[8] + 8));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_25C662CE0();
  sub_25C6628A0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v11();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = v0 + v7 + *(int *)(v10 + 48);
  uint64_t v13 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v12, 1, v13))
  {
    uint64_t v14 = v12 + *(int *)(v13 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_25C6629F0();
      OUTLINED_FUNCTION_1();
      (*(void (**)(uint64_t))(v15 + 8))(v14);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v16 = v0 + v7 + *(int *)(v10 + 56);
  uint64_t v17 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v16, 1, v17)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  sub_25C662C10();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v18();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v7 + v8, v2 | v6 | 7);
}

uint64_t sub_25C655730()
{
  uint64_t v0 = type metadata accessor for DisambiguateEventsSnippet();
  OUTLINED_FUNCTION_1_1(v0);
  uint64_t v1 = type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_2(v1);
  return sub_25C654EF8();
}

uint64_t sub_25C6557B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EventCellView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C65580C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x263F6CD20];
  v9[3] = MEMORY[0x263F6CD20];
  v9[4] = sub_25C655A0C();
  v9[0] = a1;
  v9[1] = a2;
  __swift_project_boxed_opaque_existential_1(v9, v4);
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_25C662C60();
  uint64_t v6 = (void *)sub_25C662C50();

  char v7 = sub_25C663660();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7 & 1;
}

uint64_t sub_25C6558C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x263F6CD10];
  v9[3] = MEMORY[0x263F6CD10];
  v9[4] = sub_25C65597C();
  v9[0] = a1;
  v9[1] = a2;
  __swift_project_boxed_opaque_existential_1(v9, v4);
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_25C662C60();
  uint64_t v6 = (void *)sub_25C662C50();

  char v7 = sub_25C663660();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7 & 1;
}

unint64_t sub_25C65597C()
{
  unint64_t result = qword_26A5BCD88;
  if (!qword_26A5BCD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCD88);
  }
  return result;
}

uint64_t sub_25C6559C8()
{
  sub_25C629890(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_25C655A0C()
{
  unint64_t result = qword_26A5BCD90;
  if (!qword_26A5BCD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCD90);
  }
  return result;
}

uint64_t sub_25C655A58()
{
  return sub_25C6298EC(&qword_26A5BCD98, &qword_26A5BCDA0);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return 0;
}

void sub_25C655AA8(uint64_t a1@<X8>)
{
  *(void *)a1 = 0x4030000000000000;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CommonConstants(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CommonConstants(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CommonConstants()
{
  return &type metadata for CommonConstants;
}

void sub_25C655B2C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0x4024000000000000;
  *(void *)(a1 + 8) = 0x4024000000000000;
  *(unsigned char *)(a1 + 16) = 0;
}

void sub_25C655B3C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0x4024000000000000;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
}

uint64_t destroy for CalendarButtonView.Model.Action(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 2) {
    unsigned int v1 = *(_DWORD *)a1 + 2;
  }
  if (v1 == 1) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else {
    return swift_release();
  }
}

uint64_t initializeWithCopy for CalendarButtonView.Model.Action(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 2) {
    unsigned int v3 = *(_DWORD *)a2 + 2;
  }
  if (v3 == 1)
  {
    long long v4 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v4;
    (**(void (***)(uint64_t))(v4 - 8))(a1);
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v6;
    swift_retain();
    char v5 = 0;
  }
  *(unsigned char *)(a1 + 40) = v5;
  return a1;
}

uint64_t assignWithCopy for CalendarButtonView.Model.Action(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1) {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else {
      swift_release();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      *(unsigned char *)(a1 + 40) = 1;
    }
    else
    {
      uint64_t v7 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v7;
      *(unsigned char *)(a1 + 40) = 0;
      swift_retain();
    }
  }
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CalendarButtonView.Model.Action(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1) {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else {
      swift_release();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      char v7 = 1;
    }
    else
    {
      char v7 = 0;
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    *(unsigned char *)(a1 + 40) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for CalendarButtonView.Model.Action(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 2) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CalendarButtonView.Model.Action(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25C655E24(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_25C655E40(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CalendarButtonView.Model.Action()
{
  return &type metadata for CalendarButtonView.Model.Action;
}

void *sub_25C655E78(void *a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    unsigned int v4 = (void *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *unsigned int v4 = *a2;
    v4[1] = v7;
    *((unsigned char *)v4 + 16) = *((unsigned char *)a2 + 16);
    v4[3] = a2[3];
    char v8 = *((unsigned char *)a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v8)
    {
      long long v9 = *(_OWORD *)(a2 + 7);
      *(_OWORD *)(v4 + 7) = v9;
      (**(void (***)(uint64_t, uint64_t))(v9 - 8))((uint64_t)(v4 + 4), (uint64_t)(a2 + 4));
    }
    else
    {
      uint64_t v11 = a2[5];
      v4[4] = a2[4];
      v4[5] = v11;
      swift_retain();
    }
    *((unsigned char *)v4 + 72) = v8;
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)v4 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    uint64_t v15 = sub_25C663490();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = a3[8];
    *(void *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(void *)((char *)v4 + v16) = *(uint64_t *)((char *)a2 + v16);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_25C655FE4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(a1 + 72)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  }
  else {
    swift_release();
  }
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25C663490();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  return swift_release();
}

uint64_t sub_25C6560A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    long long v8 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 56) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 32, a2 + 32);
  }
  else
  {
    uint64_t v9 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v9;
    swift_retain();
  }
  *(unsigned char *)(a1 + 72) = v7;
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_25C663490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  uint64_t v14 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_25C6561C0(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_25C63C9A8(a1 + 32);
    if (*(unsigned char *)(a2 + 72))
    {
      uint64_t v6 = *(void *)(a2 + 56);
      *(void *)(a1 + 56) = v6;
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 32, a2 + 32);
      *(unsigned char *)(a1 + 72) = 1;
    }
    else
    {
      uint64_t v7 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v7;
      *(unsigned char *)(a1 + 72) = 0;
      swift_retain();
    }
  }
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_25C663490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_25C656334(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  *(_OWORD *)((char *)a1 + 57) = *(_OWORD *)((char *)a2 + 57);
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_25C663490();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  return a1;
}

uint64_t sub_25C6563E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_25C63C9A8(a1 + 32);
    long long v7 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v7;
    *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  }
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_25C663490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_release();
  return a1;
}

uint64_t sub_25C6564D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6564EC);
}

uint64_t sub_25C6564EC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25C663490();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_25C656574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C656588);
}

uint64_t sub_25C656588(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25C663490();
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for CalendarButtonView.Model(uint64_t a1)
{
  return sub_25C657200(a1, (uint64_t *)&unk_26A5BCDA8);
}

uint64_t sub_25C656628()
{
  uint64_t result = sub_25C663490();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C6566D4@<X0>(uint64_t a1@<X8>)
{
  return sub_25C6566DC(2, a1);
}

uint64_t sub_25C6566DC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25C663060();
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  *(void *)(a2 + 56) = MEMORY[0x263F6CD30];
  *(void *)(a2 + 64) = sub_25C632D4C();
  *(unsigned char *)(a2 + 32) = a1;
  *(unsigned char *)(a2 + 72) = 1;
  uint64_t v11 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v12 = a2 + v11[6];
  uint64_t v13 = *MEMORY[0x263F774D8];
  sub_25C663490();
  OUTLINED_FUNCTION_1();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 104))(v12, v13);
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + v11[7]) = 0;
  *(void *)(a2 + v11[8]) = 0;
  return result;
}

uint64_t sub_25C6567D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v2 = sub_25C663490();
  OUTLINED_FUNCTION_0();
  uint64_t v47 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for CalendarButtonView(0);
  uint64_t v9 = v8 - 8;
  uint64_t v10 = *(void *)(v8 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC498);
  OUTLINED_FUNCTION_0();
  uint64_t v42 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCDC8);
  OUTLINED_FUNCTION_0();
  uint64_t v43 = v16;
  uint64_t v44 = v15;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCDD0);
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v18;
  uint64_t v41 = v17;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_3();
  uint64_t v39 = v20 - v19;
  sub_25C6580BC(v1, (uint64_t)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for CalendarButtonView);
  unint64_t v21 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v22 = swift_allocObject();
  sub_25C657F9C((uint64_t)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21);
  uint64_t v48 = v1;
  sub_25C663440();
  uint64_t v23 = v1 + *(int *)(type metadata accessor for CalendarButtonView.Model(0) + 24);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16);
  uint64_t v45 = v2;
  v24(v7, v23, v2);
  uint64_t v25 = v1 + *(int *)(v9 + 28);
  uint64_t v26 = *(void *)v25;
  char v27 = *(unsigned char *)(v25 + 8);
  sub_25C62C450(*(void *)v25, v27);
  sub_25C6383A0();
  char v29 = v28;
  sub_25C62C6E4(v26, v27);
  if (v29) {
    sub_25C656DF4();
  }
  sub_25C62C450(v26, v27);
  sub_25C6383A0();
  char v31 = v30;
  sub_25C62C6E4(v26, v27);
  if (v31) {
    sub_25C656ED0();
  }
  unint64_t v32 = sub_25C658068();
  sub_25C663250();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_7();
  v33();
  OUTLINED_FUNCTION_7();
  v34();
  uint64_t v49 = v12;
  unint64_t v50 = v32;
  swift_getOpaqueTypeConformance2();
  uint64_t v35 = v39;
  sub_25C663340();
  OUTLINED_FUNCTION_7();
  v36();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v46, v35, v41);
}

uint64_t sub_25C656BE4(uint64_t a1)
{
  uint64_t v2 = sub_25C663670();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25C658178(a1 + 32, (uint64_t)v15);
  if (v16)
  {
    sub_25C6581B0(v15, (uint64_t)v12);
    type metadata accessor for CalendarButtonView(0);
    sub_25C663570();
    uint64_t v7 = v13;
    uint64_t v8 = v14;
    uint64_t v9 = __swift_project_boxed_opaque_existential_1(v12, v13);
    sub_25C62EEBC((uint64_t)v9, (uint64_t)v5, v7, v8);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    (*(void (**)(uint64_t))&v15[0])(v6);
    return swift_release();
  }
}

uint64_t sub_25C656D24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = qword_26A5BC340;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  id v3 = (id)qword_26A5BE0E0;
  uint64_t result = sub_25C663220();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v7;
  return result;
}

uint64_t sub_25C656DF4()
{
  uint64_t v1 = type metadata accessor for CalendarButtonView.Model(0);
  MEMORY[0x270FA5388](v1 - 8);
  OUTLINED_FUNCTION_12_0();
  uint64_t v3 = *(void *)(v0 + *(int *)(v2 + 40));
  sub_25C6580BC(v0, v0, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  if (v3)
  {
    swift_retain();
  }
  else
  {
    uint64_t v3 = sub_25C656ED0();
    swift_release();
    if (v3)
    {
      sub_25C6633B0();
      uint64_t v3 = sub_25C662DE0();
    }
  }
  sub_25C65811C(v0);
  return v3;
}

uint64_t sub_25C656ED0()
{
  uint64_t v1 = sub_25C662E50();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_12_0();
  uint64_t v3 = sub_25C663490();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = v8 - v7;
  type metadata accessor for CalendarButtonView.Model(0);
  OUTLINED_FUNCTION_1();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  char v16 = (char *)v25 - v15;
  uint64_t v17 = *(void *)(v0 + *(int *)(v14 + 28));
  sub_25C6580BC(v0, (uint64_t)v25 - v15, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  if (v17)
  {
    swift_retain();
  }
  else
  {
    v25[1] = v1;
    uint64_t v18 = *MEMORY[0x263F774E0];
    v25[0] = *(void *)(v5 + 104);
    ((void (*)(uint64_t, uint64_t, uint64_t))v25[0])(v9, v18, v3);
    char v19 = sub_25C663480();
    uint64_t v20 = *(void (**)(uint64_t))(v5 + 8);
    uint64_t v21 = OUTLINED_FUNCTION_6_2();
    v20(v21);
    sub_25C6580BC((uint64_t)v16, (uint64_t)v13, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
    if (v19)
    {
      sub_25C65811C((uint64_t)v13);
    }
    else
    {
      ((void (*)(uint64_t, void, uint64_t))v25[0])(v9, *MEMORY[0x263F774D0], v3);
      char v22 = sub_25C663480();
      uint64_t v23 = OUTLINED_FUNCTION_6_2();
      v20(v23);
      sub_25C65811C((uint64_t)v13);
      if ((v22 & 1) == 0)
      {
        sub_25C65811C((uint64_t)v16);
        return 0;
      }
    }
    sub_25C662E40();
    uint64_t v17 = sub_25C662DE0();
  }
  sub_25C65811C((uint64_t)v16);
  return v17;
}

uint64_t sub_25C657144()
{
  type metadata accessor for CalendarButtonView(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_3();
  sub_25C6580BC(v0, v3 - v2, (void (*)(void))type metadata accessor for CalendarButtonView);
  sub_25C657234();
  return sub_25C663450();
}

uint64_t type metadata accessor for CalendarButtonView(uint64_t a1)
{
  return sub_25C657200(a1, (uint64_t *)&unk_26A5BCDB8);
}

uint64_t sub_25C657200(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25C657234()
{
  unint64_t result = qword_26A5BC5D8;
  if (!qword_26A5BC5D8)
  {
    type metadata accessor for CalendarButtonView(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC5D8);
  }
  return result;
}

uint64_t sub_25C657284(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *(void *)a1 = *a2;
    a1 = v10 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    char v8 = *((unsigned char *)a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v8)
    {
      long long v9 = *(_OWORD *)(a2 + 7);
      *(_OWORD *)(a1 + 56) = v9;
      (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 32, (uint64_t)(a2 + 4));
    }
    else
    {
      uint64_t v11 = a2[5];
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = v11;
      swift_retain();
    }
    *(unsigned char *)(a1 + 72) = v8;
    uint64_t v12 = (int *)type metadata accessor for CalendarButtonView.Model(0);
    uint64_t v13 = v12[6];
    uint64_t v14 = a1 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = sub_25C663490();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    *(void *)(a1 + v12[7]) = *(uint64_t *)((char *)a2 + v12[7]);
    *(void *)(a1 + v12[8]) = *(uint64_t *)((char *)a2 + v12[8]);
    uint64_t v17 = *(int *)(a3 + 20);
    uint64_t v18 = a1 + v17;
    uint64_t v19 = (uint64_t)a2 + v17;
    uint64_t v20 = *(void *)v19;
    LOBYTE(v15) = *(unsigned char *)(v19 + 8);
    swift_retain();
    swift_retain();
    sub_25C62C450(v20, v15);
    *(void *)uint64_t v18 = v20;
    *(unsigned char *)(v18 + 8) = v15;
    uint64_t v21 = *(int *)(a3 + 24);
    uint64_t v22 = a1 + v21;
    uint64_t v23 = (uint64_t)a2 + v21;
    uint64_t v24 = sub_25C663590();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  }
  return a1;
}

uint64_t sub_25C65747C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(a1 + 72)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  }
  else {
    swift_release();
  }
  uint64_t v4 = a1 + *(int *)(type metadata accessor for CalendarButtonView.Model(0) + 24);
  uint64_t v5 = sub_25C663490();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  swift_release();
  sub_25C62C6E4(*(void *)(a1 + *(int *)(a2 + 20)), *(unsigned char *)(a1 + *(int *)(a2 + 20) + 8));
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_25C663590();
  char v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

uint64_t sub_25C657598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    long long v8 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 56) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 32, a2 + 32);
  }
  else
  {
    uint64_t v9 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v9;
    swift_retain();
  }
  *(unsigned char *)(a1 + 72) = v7;
  uint64_t v10 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v11 = v10[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C663490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  *(void *)(a1 + v10[7]) = *(void *)(a2 + v10[7]);
  *(void *)(a1 + v10[8]) = *(void *)(a2 + v10[8]);
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = *(void *)v17;
  LOBYTE(v13) = *(unsigned char *)(v17 + 8);
  swift_retain();
  swift_retain();
  sub_25C62C450(v18, v13);
  *(void *)uint64_t v16 = v18;
  *(unsigned char *)(v16 + 8) = v13;
  uint64_t v19 = *(int *)(a3 + 24);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  return a1;
}

uint64_t sub_25C657740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_25C63C9A8(a1 + 32);
    if (*(unsigned char *)(a2 + 72))
    {
      uint64_t v6 = *(void *)(a2 + 56);
      *(void *)(a1 + 56) = v6;
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 32, a2 + 32);
      *(unsigned char *)(a1 + 72) = 1;
    }
    else
    {
      uint64_t v7 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v7;
      *(unsigned char *)(a1 + 72) = 0;
      swift_retain();
    }
  }
  long long v8 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v9 = v8[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_25C663490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  *(void *)(a1 + v8[7]) = *(void *)(a2 + v8[7]);
  swift_retain();
  swift_release();
  *(void *)(a1 + v8[8]) = *(void *)(a2 + v8[8]);
  swift_retain();
  swift_release();
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = *(void *)v15;
  LOBYTE(v10) = *(unsigned char *)(v15 + 8);
  sub_25C62C450(*(void *)v15, v10);
  uint64_t v17 = *(void *)v14;
  char v18 = *(unsigned char *)(v14 + 8);
  *(void *)uint64_t v14 = v16;
  *(unsigned char *)(v14 + 8) = v10;
  sub_25C62C6E4(v17, v18);
  uint64_t v19 = *(int *)(a3 + 24);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  return a1;
}

_OWORD *sub_25C65793C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  *(_OWORD *)((char *)a1 + 57) = *(_OWORD *)((char *)a2 + 57);
  long long v8 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v9 = v8[6];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25C663490();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *(void *)((char *)a1 + v8[7]) = *(void *)((char *)a2 + v8[7]);
  *(void *)((char *)a1 + v8[8]) = *(void *)((char *)a2 + v8[8]);
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (char *)a1 + v13;
  uint64_t v16 = (char *)a2 + v13;
  v15[8] = v16[8];
  *(void *)uint64_t v15 = *(void *)v16;
  uint64_t v17 = (char *)a1 + v14;
  char v18 = (char *)a2 + v14;
  uint64_t v19 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t sub_25C657A5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_25C63C9A8(a1 + 32);
    long long v7 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v7;
    *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  }
  long long v8 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v9 = v8[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_25C663490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  *(void *)(a1 + v8[7]) = *(void *)(a2 + v8[7]);
  swift_release();
  *(void *)(a1 + v8[8]) = *(void *)(a2 + v8[8]);
  swift_release();
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v16 = *v15;
  LOBYTE(v15) = *((unsigned char *)v15 + 8);
  uint64_t v17 = *(void *)v14;
  char v18 = *(unsigned char *)(v14 + 8);
  *(void *)uint64_t v14 = v16;
  *(unsigned char *)(v14 + 8) = (_BYTE)v15;
  sub_25C62C6E4(v17, v18);
  uint64_t v19 = *(int *)(a3 + 24);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 40))(v20, v21, v22);
  return a1;
}

uint64_t sub_25C657BCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C657BE0);
}

uint64_t sub_25C657BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OUTLINED_FUNCTION_2_3();
  if (*(_DWORD *)(v7 + 84) == v3)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4;
  }
  else
  {
    if (v3 == 254)
    {
      unsigned int v10 = *(unsigned __int8 *)(v4 + *(int *)(a3 + 20) + 8);
      if (v10 > 1) {
        return (v10 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = sub_25C663590();
    uint64_t v9 = v4 + *(int *)(a3 + 24);
  }
  return __swift_getEnumTagSinglePayload(v9, v3, v8);
}

uint64_t sub_25C657C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C657C90);
}

uint64_t sub_25C657C90(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = OUTLINED_FUNCTION_2_3();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = v5;
  }
  else
  {
    if (a3 == 254)
    {
      *(unsigned char *)(v5 + *(int *)(a4 + 20) + 8) = -(char)v4;
      return result;
    }
    uint64_t v10 = sub_25C663590();
    uint64_t v11 = v5 + *(int *)(a4 + 24);
  }
  return __swift_storeEnumTagSinglePayload(v11, v4, v4, v10);
}

uint64_t sub_25C657D2C()
{
  uint64_t result = type metadata accessor for CalendarButtonView.Model(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C663590();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C657DFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C657E18()
{
  uint64_t v1 = type metadata accessor for CalendarButtonView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v0 + v3 + 72)) {
    __swift_destroy_boxed_opaque_existential_1(v5 + 32);
  }
  else {
    swift_release();
  }
  type metadata accessor for CalendarButtonView.Model(0);
  sub_25C663490();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v6();
  swift_release();
  swift_release();
  sub_25C62C6E4(*(void *)(v5 + *(int *)(v1 + 20)), *(unsigned char *)(v5 + *(int *)(v1 + 20) + 8));
  sub_25C663590();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  v7();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25C657F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CalendarButtonView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C658000()
{
  uint64_t v1 = *(void *)(type metadata accessor for CalendarButtonView(0) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_25C656BE4(v2);
}

uint64_t sub_25C658060@<X0>(uint64_t a1@<X8>)
{
  return sub_25C656D24(a1);
}

unint64_t sub_25C658068()
{
  unint64_t result = qword_26A5BC4A0;
  if (!qword_26A5BC4A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BC498);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BC4A0);
  }
  return result;
}

uint64_t sub_25C6580BC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C65811C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CalendarButtonView.Model(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C658178(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25C6581B0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25C6581C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return type metadata accessor for CalendarButtonView.Model(0);
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return v0;
}

uint64_t *sub_25C6582A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    uint64_t v8 = *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25C6629F0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 20);
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_25C663590();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return v4;
}

uint64_t type metadata accessor for DayEventGroupView.DayEventGroup(uint64_t a1)
{
  return sub_25C657200(a1, (uint64_t *)&unk_26A5BCDE8);
}

uint64_t sub_25C658418(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  uint64_t v5 = sub_25C6629F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = sub_25C663590();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

void *sub_25C6584E8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25C6629F0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

void *sub_25C6585F0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C6629F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_25C6586FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25C6629F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

void *sub_25C6587E0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25C6629F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_25C663590();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_25C6588D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6588E8);
}

uint64_t sub_25C6588E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OUTLINED_FUNCTION_0_3();
  if (*(_DWORD *)(v7 + 84) == v3)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4;
  }
  else
  {
    uint64_t v8 = sub_25C663590();
    uint64_t v9 = v4 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, v3, v8);
}

uint64_t sub_25C658954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C658968);
}

uint64_t sub_25C658968(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = OUTLINED_FUNCTION_0_3();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v5;
  }
  else
  {
    uint64_t v10 = sub_25C663590();
    uint64_t v11 = v5 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, v4, v4, v10);
}

uint64_t type metadata accessor for DayEventGroupView(uint64_t a1)
{
  return sub_25C657200(a1, (uint64_t *)&unk_26A5BCDD8);
}

uint64_t sub_25C6589FC()
{
  uint64_t result = type metadata accessor for DayEventGroupView.DayEventGroup(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C663590();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_25C658AC4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    a1[2] = a2[2];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_25C6629F0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_25C658BBC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25C6629F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_25C658C3C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_25C6629F0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_25C658CE4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C6629F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_25C658D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_25C6629F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_25C658E1C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25C6629F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_25C658EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C658ECC);
}

uint64_t sub_25C658ECC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25C6629F0();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_25C658F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C658F68);
}

uint64_t sub_25C658F68(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25C6629F0();
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_25C658FE8()
{
  uint64_t result = sub_25C6629F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C65908C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCDF8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v3 = sub_25C6630A0();
  *((void *)v3 + 1) = 0x4014000000000000;
  v3[16] = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCE00);
  sub_25C65917C(v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  sub_25C6298EC(&qword_26A5BCE08, &qword_26A5BCDF8);
  sub_25C663280();
  return sub_25C659950((uint64_t)v3);
}

uint64_t sub_25C65917C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = type metadata accessor for DayEventGroupView(0);
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v39 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v38 = (uint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCE10);
  uint64_t v5 = *(void *)(v42 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v40 = (char *)&v37 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC688);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (uint64_t *)((char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC690);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (uint64_t *)((char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_25C6629F0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  char v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for DateHeaderView();
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v37 - v23;
  uint64_t v25 = type metadata accessor for DayEventGroupView.DayEventGroup(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1 + *(int *)(v25 + 24), v15);
  uint64_t *v14 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC698);
  swift_storeEnumTagMultiPayload();
  *uint64_t v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6A0);
  swift_storeEnumTagMultiPayload();
  sub_25C65A7E0((uint64_t)v18, (uint64_t)v14, (uint64_t)v11, (uint64_t)v24);
  uint64_t v44 = *(void *)(a1 + 16);
  uint64_t v26 = v38;
  sub_25C659BBC(a1, v38, (void (*)(void))type metadata accessor for DayEventGroupView);
  unint64_t v27 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  uint64_t v28 = swift_allocObject();
  sub_25C659C80(v26, v28 + v27, (void (*)(void))type metadata accessor for DayEventGroupView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC720);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC728);
  sub_25C6298EC(&qword_26A5BC730, &qword_26A5BC720);
  sub_25C639338();
  sub_25C659B74(&qword_26A5BC750, (void (*)(uint64_t))type metadata accessor for RenderableEvent);
  char v29 = v40;
  sub_25C663460();
  sub_25C659BBC((uint64_t)v24, (uint64_t)v22, (void (*)(void))type metadata accessor for DateHeaderView);
  char v30 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  char v31 = v41;
  uint64_t v32 = v42;
  v30(v41, v29, v42);
  uint64_t v33 = v43;
  sub_25C659BBC((uint64_t)v22, v43, (void (*)(void))type metadata accessor for DateHeaderView);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCE18);
  v30((char *)(v33 + *(int *)(v34 + 48)), v31, v32);
  uint64_t v35 = *(void (**)(char *, uint64_t))(v5 + 8);
  v35(v29, v32);
  sub_25C659C1C((uint64_t)v24);
  v35(v31, v32);
  return sub_25C659C1C((uint64_t)v22);
}

uint64_t sub_25C6596EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC430);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for RenderableEvent();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C659BBC(a1, (uint64_t)v11, (void (*)(void))type metadata accessor for RenderableEvent);
  uint64_t v12 = a2 + *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  uint64_t v13 = sub_25C6629F0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v8, v12, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v13);
  uint64_t v14 = (int *)type metadata accessor for EventCellView();
  uint64_t v15 = a3 + v14[5];
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v13);
  uint64_t v16 = a3 + v14[7];
  *(void *)uint64_t v16 = swift_getKeyPath();
  *(unsigned char *)(v16 + 8) = 0;
  *(void *)(v16 + 16) = 0x4030000000000000;
  *(void *)(v16 + 24) = 0;
  *(unsigned char *)(v16 + 32) = 1;
  *(void *)(v16 + 40) = 1;
  *(void *)(v16 + 48) = sub_25C64B95C;
  *(void *)(v16 + 56) = 0;
  sub_25C659C80((uint64_t)v11, a3, (void (*)(void))type metadata accessor for RenderableEvent);
  sub_25C63950C((uint64_t)v8, v15);
  *(unsigned char *)(a3 + v14[6]) = 0;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC728);
  sub_25C659BBC(a1, a3 + *(int *)(v17 + 36), (void (*)(void))type metadata accessor for RenderableEvent);
  type metadata accessor for PunchoutToEventDetailsModifier();
  return sub_25C663580();
}

uint64_t sub_25C659928@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C659934()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C659950(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCDF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C6599C0()
{
  uint64_t v1 = (int *)(type metadata accessor for DayEventGroupView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  sub_25C6629F0();
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v8 + 8))(v7);
  uint64_t v9 = v6 + v1[7];
  sub_25C663590();
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v10 + 8))(v9);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25C659AF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for DayEventGroupView(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25C6596EC(a1, v6, a2);
}

uint64_t sub_25C659B74(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C659BBC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C659C1C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DateHeaderView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C659C80(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25C659CE0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return type metadata accessor for DayEventGroupView.DayEventGroup(0);
}

uint64_t sub_25C659D94@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25C662D20();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_25C662CE0();
  uint64_t v14 = OUTLINED_FUNCTION_12(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_3();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC420);
  uint64_t v19 = OUTLINED_FUNCTION_12(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_3();
  uint64_t v22 = v21 - v20;
  sub_25C659FF4(v3, v17);
  sub_25C65A124((uint64_t)a1, v17, v22);
  uint64_t v23 = sub_25C662C10();
  if (__swift_getEnumTagSinglePayload(v22, 1, v23) != 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(a2, v22, v23);
  }
  sub_25C62BC98(v22);
  uint64_t v24 = sub_25C662D00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v12, v24, v6);
  uint64_t v25 = sub_25C662D10();
  os_log_type_t v26 = sub_25C6637B0();
  if (os_log_type_enabled(v25, v26))
  {
    unint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v27 = 0;
    _os_log_impl(&dword_25C626000, v25, v26, "[Snippet.Event] Could not create event cell model", v27, 2u);
    MEMORY[0x26118DF90](v27, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  sub_25C65A594();
  swift_allocError();
  return swift_willThrow();
}

uint64_t sub_25C659FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C662CE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C65A058()
{
  return sub_25C663910();
}

uint64_t sub_25C65A080()
{
  return sub_25C663920();
}

uint64_t sub_25C65A0C4()
{
  return 1;
}

uint64_t sub_25C65A0D4()
{
  return sub_25C663920();
}

uint64_t sub_25C65A124@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v49 = a1;
  uint64_t v50 = a3;
  uint64_t v4 = sub_25C6629F0();
  uint64_t v5 = OUTLINED_FUNCTION_12(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC420);
  uint64_t v8 = OUTLINED_FUNCTION_12(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2_4();
  uint64_t v11 = v9 - v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v46 - v13;
  uint64_t v15 = sub_25C662D20();
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_2_4();
  uint64_t v21 = v19 - v20;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)v46 - v23;
  uint64_t v48 = sub_25C662C10();
  OUTLINED_FUNCTION_0();
  v46[1] = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_3();
  uint64_t v47 = (char *)(v28 - v27);
  if (*(void *)(a2 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_25C662D00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v21, v29, v15);
    char v30 = sub_25C662D10();
    os_log_type_t v31 = sub_25C6637C0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_25C626000, v30, v31, "[Snippet.Event] Initializing EventListCellViewModel with concrete event", v32, 2u);
      MEMORY[0x26118DF90](v32, -1, -1);
    }

    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    uint64_t v33 = (void (*)(uint64_t, char *, uint64_t))(v17 + 8);
    v34(v21, v15);
    sub_25C662BF0();
    sub_25C65A5E0(a2);
    uint64_t v35 = v48;
    if (!__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v48))
    {
      uint64_t v36 = v47;
      uint64_t v37 = OUTLINED_FUNCTION_4_4();
      uint64_t v38 = v14;
LABEL_12:
      v33(v37, v38, v35);
      uint64_t v43 = v50;
      v33(v50, v36, v35);
      uint64_t v44 = 0;
      return __swift_storeEnumTagSinglePayload(v43, v44, 1, v35);
    }
  }
  else
  {
    v46[0] = v11;
    uint64_t v39 = sub_25C662D00();
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v24, v39, v15);
    uint64_t v40 = sub_25C662D10();
    os_log_type_t v41 = sub_25C6637C0();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_25C626000, v40, v41, "[Snippet.Event] Initializing EventListCellViewModel with draft event", v42, 2u);
      MEMORY[0x26118DF90](v42, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v24, v15);
    sub_25C662CE0();
    swift_bridgeObjectRetain();
    sub_25C662880();
    sub_25C662870();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v33 = (void (*)(uint64_t, char *, uint64_t))v46[0];
    sub_25C662C00();
    sub_25C65A5E0(a2);
    uint64_t v35 = v48;
    if (!__swift_getEnumTagSinglePayload((uint64_t)v33, 1, v48))
    {
      uint64_t v36 = v47;
      uint64_t v37 = OUTLINED_FUNCTION_4_4();
      goto LABEL_12;
    }
    uint64_t v14 = (char *)v33;
  }
  uint64_t v43 = v50;
  sub_25C62BC98((uint64_t)v14);
  uint64_t v44 = 1;
  return __swift_storeEnumTagSinglePayload(v43, v44, 1, v35);
}

unint64_t sub_25C65A594()
{
  unint64_t result = qword_26A5BCE20;
  if (!qword_26A5BCE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCE20);
  }
  return result;
}

uint64_t sub_25C65A5E0(uint64_t a1)
{
  uint64_t v2 = sub_25C662CE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for EventListCellViewModelError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for EventListCellViewModelError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C65A72CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C65A754()
{
  return 0;
}

ValueMetadata *type metadata accessor for EventListCellViewModelError()
{
  return &type metadata for EventListCellViewModelError;
}

unint64_t sub_25C65A770()
{
  unint64_t result = qword_26A5BCE28;
  if (!qword_26A5BCE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCE28);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return v0;
}

double sub_25C65A7E0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_25C662990();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_11_0();
  sub_25C662970();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3();
  sub_25C6629B0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3();
  sub_25C6629D0();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_2_4();
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  MEMORY[0x270FA5388](v14);
  sub_25C6629F0();
  OUTLINED_FUNCTION_4_2();
  (*(void (**)(uint64_t, uint64_t))(v15 + 32))(a4, a1);
  uint64_t v16 = (int *)type metadata accessor for DateHeaderView();
  sub_25C65AB90(a2, a4 + v16[5], &qword_26A5BC690);
  sub_25C65AB90(a3, a4 + v16[6], &qword_26A5BC688);
  sub_25C663580();
  uint64_t v17 = a4 + v16[8];
  *(void *)uint64_t v17 = swift_getKeyPath();
  *(unsigned char *)(v17 + 8) = 0;
  *(void *)(v17 + 16) = 0x4030000000000000;
  *(void *)(v17 + 24) = 0;
  *(unsigned char *)(v17 + 32) = 1;
  *(void *)(v17 + 40) = 1;
  *(void *)(v17 + 48) = sub_25C64B95C;
  *(void *)(v17 + 56) = 0;
  MEMORY[0x26118CAE0]();
  sub_25C6629A0();
  sub_25C6629C0();
  OUTLINED_FUNCTION_7();
  v18();
  uint64_t v19 = *(void (**)(void))(v11 + 8);
  OUTLINED_FUNCTION_7_2();
  v19();
  sub_25C662960();
  sub_25C662930();
  OUTLINED_FUNCTION_7();
  v20();
  OUTLINED_FUNCTION_7_2();
  v19();
  sub_25C662980();
  sub_25C662950();
  OUTLINED_FUNCTION_7();
  v21();
  OUTLINED_FUNCTION_7_2();
  v19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCE30);
  uint64_t v22 = swift_allocObject();
  *(void *)&double result = 2;
  *(_OWORD *)(v22 + 16) = xmmword_25C664FE0;
  *(void *)(v22 + 32) = 20554;
  *(void *)(v22 + 40) = 0xE200000000000000;
  uint64_t v24 = v16[10];
  *(void *)(v22 + 48) = 21067;
  *(void *)(v22 + 56) = 0xE200000000000000;
  *(void *)(a4 + v24) = v22;
  return result;
}

uint64_t type metadata accessor for DateHeaderView()
{
  uint64_t result = qword_26A5BCE38;
  if (!qword_26A5BCE38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C65AB90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25C65ABF8()
{
  sub_25C662AC0();
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v3;
  uint64_t v41 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_2_4();
  uint64_t v6 = (char *)(v4 - v5);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v38 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCE90);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_2_4();
  uint64_t v39 = v11 - v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v38 - v14;
  uint64_t v16 = sub_25C662AF0();
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_6_3();
  uint64_t v20 = type metadata accessor for DateHeaderView();
  sub_25C638520();
  char v21 = sub_25C662AD0();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v1, v16);
  uint64_t v22 = *(void **)(v0 + *(int *)(v20 + 40));
  swift_bridgeObjectRetain();
  uint64_t v23 = (void (**)(char *, uint64_t))(v40 + 8);
  if (v21)
  {
    sub_25C6384F0();
    sub_25C662A70();
    (*v23)(v9, v41);
    uint64_t v24 = sub_25C662A60();
    if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v24) == 1)
    {
      sub_25C65CF74((uint64_t)v15, &qword_26A5BCE90);
      uint64_t v25 = 0;
      uint64_t v26 = 0xE000000000000000;
    }
    else
    {
      uint64_t v25 = sub_25C662A50();
      uint64_t v26 = v31;
      OUTLINED_FUNCTION_4_2();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v15, v24);
    }
    char v33 = sub_25C65AF64(v25, v26, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v33 & 1) == 0) {
      return sub_25C663380();
    }
  }
  else
  {
    sub_25C6384F0();
    uint64_t v27 = v39;
    sub_25C662A70();
    (*v23)(v6, v41);
    uint64_t v28 = sub_25C662A60();
    if (__swift_getEnumTagSinglePayload(v27, 1, v28) == 1)
    {
      sub_25C65CF74(v27, &qword_26A5BCE90);
      uint64_t v29 = 0;
      uint64_t v30 = 0xE000000000000000;
    }
    else
    {
      uint64_t v29 = sub_25C662A50();
      uint64_t v30 = v35;
      OUTLINED_FUNCTION_4_2();
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v27, v28);
    }
    char v37 = sub_25C65AF64(v29, v30, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v37) {
      return sub_25C6633E0();
    }
  }
  return sub_25C6633D0();
}

uint64_t sub_25C65AF64(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_25C6638B0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_25C6638B0() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25C65B02C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v56 = a1;
  uint64_t v3 = type metadata accessor for DateHeaderView();
  uint64_t v4 = v3 - 8;
  uint64_t v51 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v52 = v5;
  uint64_t v54 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25C6629D0();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_6_3();
  uint64_t v10 = sub_25C6629F0();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3();
  uint64_t v16 = v15 - v14;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCE58);
  OUTLINED_FUNCTION_0();
  uint64_t v53 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_11_0();
  uint64_t v50 = v19;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v16, v1, v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v2, v1 + *(int *)(v4 + 44), v6);
  sub_25C65CA94(&qword_26A5BCA68, MEMORY[0x263F07258]);
  sub_25C65CA94(&qword_26A5BCA70, MEMORY[0x263F07490]);
  uint64_t v20 = sub_25C663210();
  uint64_t v22 = v21;
  char v24 = v23 & 1;
  uint64_t v25 = sub_25C6631F0();
  uint64_t v27 = v26;
  char v29 = v28 & 1;
  sub_25C629890(v20, v22, v24);
  swift_bridgeObjectRelease();
  uint64_t v57 = sub_25C65ABF8();
  uint64_t v30 = sub_25C6631D0();
  uint64_t v48 = v31;
  char v33 = v32;
  uint64_t v49 = v34;
  sub_25C629890(v25, v27, v29);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  char v36 = sub_25C663130();
  char v37 = *(unsigned char *)(v1 + *(int *)(v4 + 40) + 32);
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  if ((v37 & 1) == 0) {
    sub_25C662D30();
  }
  uint64_t v57 = v30;
  uint64_t v58 = v48;
  char v59 = v33 & 1;
  uint64_t v60 = v49;
  uint64_t v61 = KeyPath;
  uint64_t v62 = 1;
  char v63 = 0;
  char v64 = v36;
  uint64_t v65 = v38;
  uint64_t v66 = v39;
  uint64_t v67 = v40;
  uint64_t v68 = v41;
  char v69 = v37;
  uint64_t v42 = v54;
  sub_25C65CAE4(v1, v54);
  unint64_t v43 = (*(unsigned __int8 *)(v51 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
  uint64_t v44 = swift_allocObject();
  sub_25C65CD68(v42, v44 + v43);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCE60);
  sub_25C65CE28();
  uint64_t v45 = v50;
  sub_25C663300();
  swift_release();
  sub_25C629890(v57, v58, v59);
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v53 + 32))(v56, v45, v55);
}

uint64_t sub_25C65B488()
{
  uint64_t v0 = sub_25C663670();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_25C662900();
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_3();
  sub_25C64EA84();
  sub_25C662B80();
  uint64_t v8 = (void *)sub_25C6637D0();
  type metadata accessor for DateHeaderView();
  sub_25C663570();
  id v9 = v8;
  sub_25C663650();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
}

uint64_t sub_25C65B5B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_25C662FA0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_25C65B5E8()
{
  return sub_25C662FB0();
}

void *sub_25C65B618(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C6629F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    id v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC698);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_25C662AC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *id v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (void *)((char *)a2 + v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6A0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_25C662AF0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      void *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = a3[7];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = sub_25C663590();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    uint64_t v21 = a3[8];
    uint64_t v22 = (char *)a1 + v21;
    char v23 = (char *)a2 + v21;
    uint64_t v24 = *(void *)((char *)a2 + v21);
    LOBYTE(v19) = *((unsigned char *)a2 + v21 + 8);
    sub_25C62C450(v24, (char)v19);
    *(void *)uint64_t v22 = v24;
    v22[8] = (char)v19;
    *((_OWORD *)v22 + 1) = *((_OWORD *)v23 + 1);
    v22[32] = v23[32];
    uint64_t v25 = *((void *)v23 + 6);
    uint64_t v26 = *((void *)v23 + 7);
    *((void *)v22 + 5) = *((void *)v23 + 5);
    *((void *)v22 + 6) = v25;
    uint64_t v27 = a3[9];
    char v28 = (char *)a1 + v27;
    char v29 = (char *)a2 + v27;
    *((void *)v22 + 7) = v26;
    uint64_t v30 = sub_25C6629D0();
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16);
    swift_retain();
    v31(v28, v29, v30);
    *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25C65B914(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_25C6629F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC698);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25C662AC0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_25C662AF0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = a1 + a2[7];
  uint64_t v10 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  sub_25C62C6E4(*(void *)(a1 + a2[8]), *(unsigned char *)(a1 + a2[8] + 8));
  swift_release();
  uint64_t v11 = a1 + a2[9];
  uint64_t v12 = sub_25C6629D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C65BB04(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C6629F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC698);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_25C662AC0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_25C662AF0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    void *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = *(void *)(a2 + v19);
  LOBYTE(v17) = *(unsigned char *)(a2 + v19 + 8);
  sub_25C62C450(v22, v17);
  *(void *)uint64_t v20 = v22;
  *(unsigned char *)(v20 + 8) = v17;
  *(_OWORD *)(v20 + 16) = *(_OWORD *)(v21 + 16);
  *(unsigned char *)(v20 + 32) = *(unsigned char *)(v21 + 32);
  uint64_t v23 = *(void *)(v21 + 48);
  uint64_t v24 = *(void *)(v21 + 56);
  *(void *)(v20 + 40) = *(void *)(v21 + 40);
  *(void *)(v20 + 48) = v23;
  uint64_t v25 = a3[9];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  *(void *)(v20 + 56) = v24;
  uint64_t v28 = sub_25C6629D0();
  char v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16);
  swift_retain();
  v29(v26, v27, v28);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25C65BDB0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C6629F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  if (a1 != a2)
  {
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (void *)(a2 + v7);
    sub_25C65CF74(a1 + v7, &qword_26A5BC698);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC698);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_25C662AC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (void *)(a2 + v11);
    sub_25C65CF74(a1 + v11, &qword_26A5BC6A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6A0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_25C662AF0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      void *v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = *(void *)(a2 + v19);
  LOBYTE(v17) = *(unsigned char *)(a2 + v19 + 8);
  sub_25C62C450(v22, v17);
  uint64_t v23 = *(void *)v20;
  char v24 = *(unsigned char *)(v20 + 8);
  *(void *)uint64_t v20 = v22;
  *(unsigned char *)(v20 + 8) = v17;
  sub_25C62C6E4(v23, v24);
  *(void *)(v20 + 16) = *(void *)(v21 + 16);
  uint64_t v25 = *(void *)(v21 + 24);
  *(unsigned char *)(v20 + 32) = *(unsigned char *)(v21 + 32);
  *(void *)(v20 + 24) = v25;
  *(void *)(v20 + 40) = *(void *)(v21 + 40);
  uint64_t v26 = *(void *)(v21 + 56);
  *(void *)(v20 + 48) = *(void *)(v21 + 48);
  *(void *)(v20 + 56) = v26;
  swift_retain();
  swift_release();
  uint64_t v27 = a3[9];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = sub_25C6629D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 24))(v28, v29, v30);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C65C0A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C6629F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC698);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_25C662AC0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = sub_25C662AF0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = a3[8];
  uint64_t v22 = a3[9];
  uint64_t v23 = (_OWORD *)(a1 + v21);
  char v24 = (_OWORD *)(a2 + v21);
  long long v25 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v25;
  long long v26 = v24[3];
  v23[2] = v24[2];
  v23[3] = v26;
  uint64_t v27 = a1 + v22;
  uint64_t v28 = a2 + v22;
  uint64_t v29 = sub_25C6629D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 32))(v27, v28, v29);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_25C65C30C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C6629F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  if (a1 != a2)
  {
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_25C65CF74(a1 + v7, &qword_26A5BC698);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC698);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_25C662AC0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
    uint64_t v12 = a3[6];
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (const void *)(a2 + v12);
    sub_25C65CF74(a1 + v12, &qword_26A5BC6A0);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6A0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_25C662AF0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_25C663590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = a3[8];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  char v24 = *(unsigned char *)(a2 + v21 + 8);
  uint64_t v25 = *(void *)(a1 + v21);
  char v26 = *(unsigned char *)(a1 + v21 + 8);
  *(void *)uint64_t v22 = *(void *)(a2 + v21);
  *(unsigned char *)(v22 + 8) = v24;
  sub_25C62C6E4(v25, v26);
  *(void *)(v22 + 16) = *(void *)(v23 + 16);
  *(void *)(v22 + 24) = *(void *)(v23 + 24);
  *(unsigned char *)(v22 + 32) = *(unsigned char *)(v23 + 32);
  *(void *)(v22 + 40) = *(void *)(v23 + 40);
  *(_OWORD *)(v22 + 48) = *(_OWORD *)(v23 + 48);
  swift_release();
  uint64_t v27 = a3[9];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = sub_25C6629D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 40))(v28, v29, v30);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C65C5E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C65C5FC);
}

uint64_t sub_25C65C5FC(uint64_t a1, uint64_t a2, int *a3)
{
  sub_25C6629F0();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_15:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC690);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v12 = a3[5];
LABEL_14:
    uint64_t v9 = a1 + v12;
    goto LABEL_15;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC688);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v14 + 84) == a2)
  {
    uint64_t v8 = v13;
    uint64_t v12 = a3[6];
    goto LABEL_14;
  }
  sub_25C663590();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v16 + 84) == a2)
  {
    uint64_t v8 = v15;
    uint64_t v12 = a3[7];
    goto LABEL_14;
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = sub_25C6629D0();
    uint64_t v12 = a3[9];
    goto LABEL_14;
  }
  unint64_t v17 = *(void *)(a1 + a3[8] + 48);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

uint64_t sub_25C65C724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C65C738);
}

void sub_25C65C738(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_25C6629F0();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC690);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC688);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[6];
      }
      else
      {
        sub_25C663590();
        OUTLINED_FUNCTION_0_0();
        if (*(_DWORD *)(v18 + 84) == a3)
        {
          uint64_t v10 = v17;
          uint64_t v14 = a4[7];
        }
        else
        {
          if (a3 == 0x7FFFFFFF)
          {
            *(void *)(a1 + a4[8] + 48) = (a2 - 1);
            return;
          }
          uint64_t v10 = sub_25C6629D0();
          uint64_t v14 = a4[9];
        }
      }
    }
    uint64_t v11 = a1 + v14;
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_25C65C85C()
{
  sub_25C6629F0();
  if (v0 <= 0x3F)
  {
    sub_25C65CA24(319, &qword_26A5BCE48, MEMORY[0x263F07690]);
    if (v1 <= 0x3F)
    {
      sub_25C65CA24(319, &qword_26A5BCE50, MEMORY[0x263F07920]);
      if (v2 <= 0x3F)
      {
        sub_25C663590();
        if (v3 <= 0x3F)
        {
          sub_25C6629D0();
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

void sub_25C65CA24(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25C662D80();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_25C65CA78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C65CA94(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C65CAE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DateHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C65CB48()
{
  uint64_t v1 = type metadata accessor for DateHeaderView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_25C6629F0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7();
  v5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC698);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25C662AC0();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_7();
    v6();
  }
  else
  {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC6A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25C662AF0();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_7();
    v7();
  }
  else
  {
    swift_release();
  }
  sub_25C663590();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7();
  v8();
  sub_25C62C6E4(*(void *)(v0 + v3 + *(int *)(v1 + 32)), *(unsigned char *)(v0 + v3 + *(int *)(v1 + 32) + 8));
  swift_release();
  sub_25C6629D0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7();
  v9();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25C65CD68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DateHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C65CDCC()
{
  return sub_25C65B488();
}

unint64_t sub_25C65CE28()
{
  unint64_t result = qword_26A5BCE68;
  if (!qword_26A5BCE68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCE60);
    sub_25C65CEA4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCE68);
  }
  return result;
}

unint64_t sub_25C65CEA4()
{
  unint64_t result = qword_26A5BCE70;
  if (!qword_26A5BCE70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCE78);
    sub_25C65CF20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCE70);
  }
  return result;
}

unint64_t sub_25C65CF20()
{
  unint64_t result = qword_26A5BCE80;
  if (!qword_26A5BCE80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCE88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCE80);
  }
  return result;
}

uint64_t sub_25C65CF74(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7();
  v3();
  return a1;
}

uint64_t sub_25C65CFC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return 0;
}

void *sub_25C65D048(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    uint64_t v8 = *(int *)(sub_25C662C80() + 28);
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_25C662A20();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    *((unsigned char *)v4 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    *((unsigned char *)v4 + v13) = *((unsigned char *)a2 + v13);
  }
  return v4;
}

uint64_t sub_25C65D164(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(sub_25C662C80() + 28);
  uint64_t v3 = sub_25C662A20();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

uint64_t sub_25C65D1E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v7 = *(int *)(sub_25C662C80() + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C662A20();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  return a1;
}

uint64_t sub_25C65D2AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v6 = *(int *)(sub_25C662C80() + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25C662A20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_25C65D380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v6 = *(int *)(sub_25C662C80() + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25C662A20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  return a1;
}

uint64_t sub_25C65D430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v7 = *(int *)(sub_25C662C80() + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C662A20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  return a1;
}

uint64_t sub_25C65D4E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C65D4FC);
}

uint64_t sub_25C65D4FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C662C80();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 2) {
      return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_25C65D598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C65D5AC);
}

void sub_25C65D5AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25C662C80();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
}

uint64_t type metadata accessor for ParticipantLabelView()
{
  uint64_t result = qword_26A5BCE98;
  if (!qword_26A5BCE98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C65D67C()
{
  uint64_t result = sub_25C662C80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C65D714()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C65D730()
{
  uint64_t v1 = sub_25C663050();
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  MEMORY[0x270FA5388](v3);
  uint64_t result = *(unsigned __int8 *)(v0 + 17);
  switch(*(unsigned char *)(v0 + 17))
  {
    case 1:
    case 2:
    case 3:
      sub_25C663040();
      sub_25C663030();
      sub_25C663020();
      sub_25C663030();
      uint64_t result = sub_25C663070();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C65D918@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_25C663000();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCEA8);
  return sub_25C65D964(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_25C65D964@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25C662E30();
  uint64_t v59 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v58 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCEB0);
  MEMORY[0x270FA5388](v54);
  uint64_t v7 = (uint64_t *)((char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_25C663400();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCEB8);
  MEMORY[0x270FA5388](v60);
  uint64_t v13 = (uint64_t *)((char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCEC0);
  uint64_t v57 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v56 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v55 = (char *)&v52 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCEC8);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v61 = (char *)&v52 - v22;
  uint64_t v23 = type metadata accessor for ParticipantLabelView();
  char v24 = *(unsigned char *)(a1 + *(int *)(v23 + 24));
  uint64_t v62 = v23;
  char v63 = v21;
  if (v24)
  {
    uint64_t v25 = 1;
    uint64_t v26 = (uint64_t)v61;
  }
  else
  {
    uint64_t v27 = *(unsigned __int8 *)(a1 + 16);
    uint64_t v53 = a2;
    uint64_t v52 = v4;
    switch(v27)
    {
      case 1:
        uint64_t v28 = sub_25C6633F0();
        uint64_t v29 = sub_25C6633A0();
        break;
      case 2:
        uint64_t v28 = sub_25C6633F0();
        uint64_t v29 = sub_25C663380();
        break;
      case 3:
        uint64_t v28 = sub_25C6633F0();
        uint64_t v29 = sub_25C6633C0();
        break;
      default:
        uint64_t v28 = sub_25C6633F0();
        uint64_t v29 = sub_25C663390();
        break;
    }
    uint64_t v30 = v29;
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F1B538], v8);
    uint64_t KeyPath = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)v7 + *(int *)(v54 + 28), v11, v8);
    *uint64_t v7 = KeyPath;
    sub_25C65E30C((uint64_t)v7, (uint64_t)v13 + *(int *)(v60 + 36), &qword_26A5BCEB0);
    *uint64_t v13 = v28;
    v13[1] = v30;
    swift_retain();
    swift_retain();
    sub_25C65E3AC((uint64_t)v7, &qword_26A5BCEB0);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release();
    swift_release();
    if (sub_25C662CB0())
    {
      char v32 = v58;
      sub_25C662E20();
    }
    else
    {
      char v32 = v58;
      sub_25C662E10();
    }
    a2 = v53;
    uint64_t v26 = (uint64_t)v61;
    uint64_t v33 = v52;
    sub_25C65E1C4();
    uint64_t v34 = v56;
    sub_25C663310();
    (*(void (**)(char *, uint64_t))(v59 + 8))(v32, v33);
    sub_25C65E3AC((uint64_t)v13, &qword_26A5BCEB8);
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v57 + 32);
    char v36 = v55;
    v35(v55, v34, v14);
    v35((char *)v26, v36, v14);
    uint64_t v25 = 0;
  }
  __swift_storeEnumTagSinglePayload(v26, v25, 1, v14);
  if ((*(unsigned char *)(a1 + *(int *)(v62 + 20)) & 1) != 0 || (sub_25C65D730(), !v37))
  {
    uint64_t v42 = *(void *)(a1 + 8);
    uint64_t v64 = *(void *)a1;
    uint64_t v65 = v42;
    uint64_t v66 = 0;
    uint64_t v67 = MEMORY[0x263F8EE78];
    char v68 = 1;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (qword_26A5BC340 != -1) {
      swift_once();
    }
    id v38 = (id)qword_26A5BE0E0;
    uint64_t v64 = sub_25C663220();
    uint64_t v65 = v39;
    uint64_t v66 = v40 & 1;
    uint64_t v67 = v41;
    char v68 = 0;
  }
  sub_25C6630F0();
  uint64_t v43 = v69;
  uint64_t v44 = v70;
  uint64_t v45 = v71;
  uint64_t v46 = v72;
  char v47 = v73;
  uint64_t v48 = swift_getKeyPath();
  uint64_t v49 = (uint64_t)v63;
  sub_25C65E30C(v26, (uint64_t)v63, &qword_26A5BCEC8);
  sub_25C65E30C(v49, a2, &qword_26A5BCEC8);
  uint64_t v50 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCF00) + 48);
  *(void *)uint64_t v50 = v43;
  *(void *)(v50 + 8) = v44;
  *(void *)(v50 + 16) = v45;
  *(void *)(v50 + 24) = v46;
  *(unsigned char *)(v50 + 32) = v47;
  *(void *)(v50 + 40) = v48;
  *(void *)(v50 + 48) = 1;
  *(unsigned char *)(v50 + 56) = 0;
  sub_25C65E370(v43, v44, v45);
  swift_retain();
  sub_25C65E3AC(v26, &qword_26A5BCEC8);
  sub_25C648218(v43, v44, v45);
  swift_release();
  return sub_25C65E3AC(v49, &qword_26A5BCEC8);
}

uint64_t sub_25C65E0D4()
{
  return sub_25C662EE0();
}

uint64_t sub_25C65E0F8(uint64_t a1)
{
  uint64_t v2 = sub_25C663400();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25C662EF0();
}

unint64_t sub_25C65E1C4()
{
  unint64_t result = qword_26A5BCED0;
  if (!qword_26A5BCED0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCEB8);
    sub_25C65E264();
    sub_25C6298EC(&qword_26A5BCEF8, &qword_26A5BCEB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCED0);
  }
  return result;
}

unint64_t sub_25C65E264()
{
  unint64_t result = qword_26A5BCED8;
  if (!qword_26A5BCED8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BCEE0);
    sub_25C6298EC(&qword_26A5BCEE8, &qword_26A5BCEF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCED8);
  }
  return result;
}

uint64_t sub_25C65E30C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C65E370(uint64_t a1, uint64_t a2, char a3)
{
  sub_25C629930(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C65E3AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25C65E408()
{
  return sub_25C6298EC(&qword_26A5BCF08, &qword_26A5BCF10);
}

void *sub_25C65E444(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    long long v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    uint64_t v11 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v11;
    uint64_t v12 = (int *)sub_25C662CE0();
    uint64_t v13 = v12[8];
    uint64_t v59 = (uint64_t)a2 + v13;
    uint64_t v60 = (char *)v4 + v13;
    uint64_t v14 = sub_25C6628A0();
    uint64_t v58 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v58(v60, v59, v14);
    *((unsigned char *)v4 + v12[9]) = *((unsigned char *)a2 + v12[9]);
    uint64_t v15 = v12[10];
    uint64_t v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = v12[11];
    uint64_t v20 = (void *)((char *)v4 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = v12[12];
    char v24 = (char *)v4 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = sub_25C662CD0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
      memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      *char v24 = *v25;
      *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
      uint64_t v29 = *(int *)(v26 + 28);
      uint64_t v30 = &v24[v29];
      uint64_t v31 = &v25[v29];
      uint64_t v32 = sub_25C662CC0();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        uint64_t v33 = sub_25C6629F0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v33 - 8) + 16))(v30, v31, v33);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
    }
    *(void *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    uint64_t v34 = v12[14];
    uint64_t v35 = (char *)v4 + v34;
    char v36 = (char *)a2 + v34;
    uint64_t v37 = sub_25C662B70();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
      memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
    }
    uint64_t v39 = type metadata accessor for RenderableEvent();
    uint64_t v40 = *(int *)(v39 + 20);
    uint64_t v41 = (char *)v4 + v40;
    uint64_t v42 = (uint64_t)a2 + v40;
    uint64_t v43 = sub_25C662C10();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
    uint64_t v44 = *(int *)(v39 + 24);
    uint64_t v45 = (void *)((char *)v4 + v44);
    uint64_t v46 = (uint64_t *)((char *)a2 + v44);
    uint64_t v47 = v46[1];
    *uint64_t v45 = *v46;
    v45[1] = v47;
    uint64_t v48 = a3[6];
    *((unsigned char *)v4 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v49 = (char *)v4 + v48;
    uint64_t v50 = (uint64_t)a2 + v48;
    uint64_t v51 = sub_25C6635A0();
    uint64_t v52 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v51 - 8) + 16);
    swift_bridgeObjectRetain();
    v52(v49, v50, v51);
    uint64_t v53 = a3[7];
    uint64_t v54 = (char *)v4 + v53;
    uint64_t v55 = (uint64_t)a2 + v53;
    uint64_t v56 = *(void *)(v55 + 8);
    *(void *)uint64_t v54 = *(void *)v55;
    *((void *)v54 + 1) = v56;
    v54[16] = *(unsigned char *)(v55 + 16);
    *((void *)v54 + 3) = *(void *)(v55 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_25C65E8B4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)sub_25C662CE0();
  uint64_t v5 = a1 + v4[8];
  uint64_t v6 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + v4[12];
  uint64_t v8 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    uint64_t v9 = v7 + *(int *)(v8 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      uint64_t v10 = sub_25C6629F0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = a1 + v4[14];
  uint64_t v12 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  uint64_t v13 = a1 + *(int *)(type metadata accessor for RenderableEvent() + 20);
  uint64_t v14 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  swift_bridgeObjectRelease();
  uint64_t v15 = a1 + *(int *)(a2 + 24);
  uint64_t v16 = sub_25C6635A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C65EB20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  long long v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v57 = a2 + v12;
  uint64_t v58 = a1 + v12;
  uint64_t v13 = sub_25C6628A0();
  uint64_t v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v56(v58, v57, v13);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v14 = v11[10];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v11[11];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = v11[12];
  uint64_t v23 = (unsigned char *)(a1 + v22);
  char v24 = (unsigned char *)(a2 + v22);
  uint64_t v25 = sub_25C662CD0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    *uint64_t v23 = *v24;
    *(_OWORD *)(v23 + 8) = *(_OWORD *)(v24 + 8);
    uint64_t v27 = *(int *)(v25 + 28);
    uint64_t v28 = &v23[v27];
    uint64_t v29 = &v24[v27];
    uint64_t v30 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      uint64_t v31 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v31 - 8) + 16))(v28, v29, v31);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  }
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  uint64_t v32 = v11[14];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  uint64_t v35 = sub_25C662B70();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
  }
  uint64_t v37 = type metadata accessor for RenderableEvent();
  uint64_t v38 = *(int *)(v37 + 20);
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  uint64_t v41 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  uint64_t v42 = *(int *)(v37 + 24);
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (void *)(a2 + v42);
  uint64_t v45 = v44[1];
  void *v43 = *v44;
  v43[1] = v45;
  uint64_t v46 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  uint64_t v49 = sub_25C6635A0();
  uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 16);
  swift_bridgeObjectRetain();
  v50(v47, v48, v49);
  uint64_t v51 = a3[7];
  uint64_t v52 = a1 + v51;
  uint64_t v53 = a2 + v51;
  uint64_t v54 = *(void *)(v53 + 8);
  *(void *)uint64_t v52 = *(void *)v53;
  *(void *)(v52 + 8) = v54;
  *(unsigned char *)(v52 + 16) = *(unsigned char *)(v53 + 16);
  *(void *)(v52 + 24) = *(void *)(v53 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25C65EF40(uint64_t a1, uint64_t a2, int *a3)
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
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)sub_25C662CE0();
  uint64_t v7 = v6[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(unsigned char *)(a1 + v6[9]) = *(unsigned char *)(a2 + v6[9]);
  uint64_t v11 = v6[10];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  void *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = v6[11];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = v6[12];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  int v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
      *(void *)(v18 + 8) = *(void *)(v19 + 8);
      *(void *)(v18 + 16) = *(void *)(v19 + 16);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v30 = *(int *)(v20 + 28);
      uint64_t v31 = v18 + v30;
      uint64_t v32 = (const void *)(v19 + v30);
      sub_25C660DCC(v31, MEMORY[0x263F6CD68]);
      uint64_t v33 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v59 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v59 - 8) + 16))(v31, v32, v59);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v27 = *(void *)(*(void *)(v33 - 8) + 64);
      uint64_t v28 = (void *)v31;
      uint64_t v29 = v32;
LABEL_8:
      memcpy(v28, v29, v27);
      goto LABEL_14;
    }
    sub_25C660DCC(v18, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v27 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v28 = (void *)v18;
    uint64_t v29 = (const void *)v19;
    goto LABEL_8;
  }
  if (v22) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  *(void *)(v18 + 16) = *(void *)(v19 + 16);
  uint64_t v23 = *(int *)(v20 + 28);
  char v24 = (void *)(v18 + v23);
  uint64_t v25 = (const void *)(v19 + v23);
  uint64_t v26 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v34 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(void *)(a1 + v6[13]) = *(void *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = v6[14];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (const void *)(a2 + v35);
  uint64_t v38 = sub_25C662B70();
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
  int v40 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
  if (!v39)
  {
    uint64_t v41 = *(void *)(v38 - 8);
    if (!v40)
    {
      (*(void (**)(void *, const void *, uint64_t))(v41 + 24))(v36, v37, v38);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v41 + 8))(v36, v38);
    goto LABEL_19;
  }
  if (v40)
  {
LABEL_19:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v36, v37, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
LABEL_20:
  uint64_t v43 = type metadata accessor for RenderableEvent();
  uint64_t v44 = *(int *)(v43 + 20);
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  uint64_t v47 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 24))(v45, v46, v47);
  uint64_t v48 = *(int *)(v43 + 24);
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (void *)(a2 + v48);
  *uint64_t v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v51 = a3[6];
  uint64_t v52 = a1 + v51;
  uint64_t v53 = a2 + v51;
  uint64_t v54 = sub_25C6635A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 24))(v52, v53, v54);
  uint64_t v55 = a3[7];
  uint64_t v56 = a1 + v55;
  uint64_t v57 = a2 + v55;
  *(void *)uint64_t v56 = *(void *)(a2 + v55);
  *(void *)(v56 + 8) = *(void *)(a2 + v55 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v56 + 16) = *(unsigned char *)(v57 + 16);
  *(void *)(v56 + 24) = *(void *)(v57 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_25C65F590(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  uint64_t v8 = (int *)sub_25C662CE0();
  uint64_t v9 = v8[8];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25C6628A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *((unsigned char *)a1 + v8[9]) = *((unsigned char *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  uint64_t v13 = v8[12];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_25C662CD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    unsigned char *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    uint64_t v18 = *(int *)(v16 + 28);
    uint64_t v19 = &v14[v18];
    uint64_t v20 = &v15[v18];
    uint64_t v21 = sub_25C662CC0();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_25C6629F0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(void *)((char *)a1 + v8[13]) = *(void *)((char *)a2 + v8[13]);
  uint64_t v23 = v8[14];
  char v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_25C662B70();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  uint64_t v28 = type metadata accessor for RenderableEvent();
  uint64_t v29 = *(int *)(v28 + 20);
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = sub_25C662C10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
  *(_OWORD *)((char *)a1 + *(int *)(v28 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v28 + 24));
  uint64_t v33 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = sub_25C6635A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
  uint64_t v37 = a3[7];
  uint64_t v38 = (_OWORD *)((char *)a1 + v37);
  int v39 = (_OWORD *)((char *)a2 + v37);
  long long v40 = v39[1];
  *uint64_t v38 = *v39;
  v38[1] = v40;
  return a1;
}

uint64_t sub_25C65F908(uint64_t a1, uint64_t a2, int *a3)
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
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = (int *)sub_25C662CE0();
  uint64_t v12 = v11[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_25C6628A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(unsigned char *)(a1 + v11[9]) = *(unsigned char *)(a2 + v11[9]);
  uint64_t v16 = v11[10];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v11[11];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = v11[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = sub_25C662CD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  int v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2) {
        goto LABEL_14;
      }
      uint64_t v39 = *(int *)(v29 + 28);
      uint64_t v40 = v27 + v39;
      uint64_t v41 = (const void *)(v28 + v39);
      sub_25C660DCC(v40, MEMORY[0x263F6CD68]);
      uint64_t v42 = sub_25C662CC0();
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v71 = sub_25C6629F0();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(void *)(v71 - 8) + 32))(v40, v41, v71);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v36 = *(void *)(*(void *)(v42 - 8) + 64);
      uint64_t v37 = (void *)v40;
      uint64_t v38 = v41;
LABEL_8:
      memcpy(v37, v38, v36);
      goto LABEL_14;
    }
    sub_25C660DCC(v27, MEMORY[0x263F6CD70]);
LABEL_7:
    size_t v36 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC400) - 8) + 64);
    uint64_t v37 = (void *)v27;
    uint64_t v38 = (const void *)v28;
    goto LABEL_8;
  }
  if (v31) {
    goto LABEL_7;
  }
  *(unsigned char *)uint64_t v27 = *(unsigned char *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  uint64_t v32 = *(int *)(v29 + 28);
  uint64_t v33 = (void *)(v27 + v32);
  uint64_t v34 = (const void *)(v28 + v32);
  uint64_t v35 = sub_25C662CC0();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    uint64_t v43 = sub_25C6629F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(void *)(a1 + v11[13]) = *(void *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  uint64_t v44 = v11[14];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (const void *)(a2 + v44);
  uint64_t v47 = sub_25C662B70();
  int v48 = __swift_getEnumTagSinglePayload((uint64_t)v45, 1, v47);
  int v49 = __swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47);
  if (!v48)
  {
    uint64_t v50 = *(void *)(v47 - 8);
    if (!v49)
    {
      (*(void (**)(void *, const void *, uint64_t))(v50 + 40))(v45, v46, v47);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v50 + 8))(v45, v47);
    goto LABEL_19;
  }
  if (v49)
  {
LABEL_19:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BC408);
    memcpy(v45, v46, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
  __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
LABEL_20:
  uint64_t v52 = type metadata accessor for RenderableEvent();
  uint64_t v53 = *(int *)(v52 + 20);
  uint64_t v54 = a1 + v53;
  uint64_t v55 = a2 + v53;
  uint64_t v56 = sub_25C662C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 40))(v54, v55, v56);
  uint64_t v57 = *(int *)(v52 + 24);
  uint64_t v58 = (void *)(a1 + v57);
  uint64_t v59 = (uint64_t *)(a2 + v57);
  uint64_t v61 = *v59;
  uint64_t v60 = v59[1];
  void *v58 = v61;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  uint64_t v62 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v63 = a1 + v62;
  uint64_t v64 = a2 + v62;
  uint64_t v65 = sub_25C6635A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 40))(v63, v64, v65);
  uint64_t v66 = a3[7];
  uint64_t v67 = a1 + v66;
  uint64_t v68 = a2 + v66;
  uint64_t v69 = *(void *)(v68 + 8);
  *(void *)uint64_t v67 = *(void *)v68;
  *(void *)(v67 + 8) = v69;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v67 + 16) = *(unsigned char *)(v68 + 16);
  *(void *)(v67 + 24) = *(void *)(v68 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C65FE9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C65FEB0);
}

uint64_t sub_25C65FEB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  sub_25C6635A0();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_25C65FF68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C65FF7C);
}

void sub_25C65FF7C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_25C6635A0();
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for EventStatusSnippet()
{
  uint64_t result = qword_26A5BCF18;
  if (!qword_26A5BCF18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C660078()
{
  uint64_t result = type metadata accessor for RenderableEvent();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C6635A0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C660150()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C66016C()
{
  uint64_t v1 = type metadata accessor for EventStatusSnippet();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  sub_25C660D70(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for EventStatusSnippet);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_25C660C80((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (void (*)(void))type metadata accessor for EventStatusSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCF28);
  sub_25C6298EC(&qword_26A5BCF30, &qword_26A5BCF28);
  return sub_25C6634A0();
}

uint64_t sub_25C6602D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v54 = a2;
  uint64_t v3 = sub_25C6635A0();
  uint64_t v48 = *(void *)(v3 - 8);
  uint64_t v49 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v47 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25C6635C0();
  uint64_t v51 = *(void *)(v5 - 8);
  uint64_t v52 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v46 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCF38);
  uint64_t v7 = *(void *)(v44 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v44);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v53 = (char *)&v43 - v11;
  uint64_t v12 = type metadata accessor for SingleEventView();
  uint64_t v13 = (int *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v43 - v17;
  sub_25C660D70(a1, (uint64_t)v16, (void (*)(void))type metadata accessor for RenderableEvent);
  uint64_t v19 = type metadata accessor for EventStatusSnippet();
  v16[v13[7]] = *(unsigned char *)(a1 + *(int *)(v19 + 20));
  sub_25C663580();
  uint64_t v20 = &v16[v13[9]];
  *(void *)uint64_t v20 = swift_getKeyPath();
  v20[8] = 0;
  *((void *)v20 + 2) = 0x4030000000000000;
  *((void *)v20 + 3) = 0;
  v20[32] = 1;
  *((void *)v20 + 5) = 1;
  *((void *)v20 + 6) = sub_25C64B95C;
  *((void *)v20 + 7) = 0;
  uint64_t v21 = &v16[v13[10]];
  *(void *)uint64_t v21 = swift_getKeyPath();
  v21[8] = 0;
  *((_OWORD *)v21 + 1) = xmmword_25C664230;
  *((void *)v21 + 4) = 1;
  *((void *)v21 + 5) = sub_25C660C58;
  *((void *)v21 + 6) = 0;
  uint64_t v22 = &v16[v13[11]];
  *(void *)uint64_t v22 = swift_getKeyPath();
  v22[8] = 0;
  uint64_t v45 = v18;
  sub_25C660C80((uint64_t)v16, (uint64_t)v18, (void (*)(void))type metadata accessor for SingleEventView);
  uint64_t v50 = a1;
  uint64_t v23 = qword_26A5BC340;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v23 != -1) {
    swift_once();
  }
  id v24 = (id)qword_26A5BE0E0;
  uint64_t v25 = sub_25C663220();
  uint64_t v27 = v26;
  char v29 = v28;
  uint64_t v31 = v30;
  uint64_t v56 = MEMORY[0x263F1A830];
  uint64_t v57 = MEMORY[0x263F77348];
  uint64_t v32 = swift_allocObject();
  uint64_t v55 = v32;
  *(void *)(v32 + 16) = v25;
  *(void *)(v32 + 24) = v27;
  *(unsigned char *)(v32 + 32) = v29 & 1;
  *(void *)(v32 + 40) = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v47, v50 + *(int *)(v19 + 24), v49);
  uint64_t v33 = v46;
  sub_25C6635B0();
  sub_25C660D20();
  uint64_t v34 = v52;
  sub_25C6632B0();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v33, v34);
  uint64_t v35 = v53;
  uint64_t v36 = v44;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v53, v10, v44);
  uint64_t v37 = (uint64_t)v45;
  sub_25C660D70((uint64_t)v45, (uint64_t)v16, (void (*)(void))type metadata accessor for SingleEventView);
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v38(v10, v35, v36);
  uint64_t v39 = v54;
  sub_25C660D70((uint64_t)v16, v54, (void (*)(void))type metadata accessor for SingleEventView);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BCF48);
  v38((char *)(v39 + *(int *)(v40 + 48)), v10, v36);
  uint64_t v41 = *(void (**)(char *, uint64_t))(v7 + 8);
  v41(v35, v36);
  sub_25C660DCC(v37, (void (*)(void))type metadata accessor for SingleEventView);
  v41(v10, v36);
  return sub_25C660DCC((uint64_t)v16, (void (*)(void))type metadata accessor for SingleEventView);
}

uint64_t sub_25C660890()
{
  uint64_t v1 = *(void *)(type metadata accessor for EventStatusSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_25C662CE0();
  sub_25C6628A0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7();
  v6();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + *(int *)(v5 + 48);
  uint64_t v8 = sub_25C662CD0();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    uint64_t v9 = v7 + *(int *)(v8 + 28);
    sub_25C662CC0();
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_25C6629F0();
      OUTLINED_FUNCTION_1_2();
      (*(void (**)(uint64_t))(v10 + 8))(v9);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = v0 + v3 + *(int *)(v5 + 56);
  uint64_t v12 = sub_25C662B70();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  type metadata accessor for RenderableEvent();
  sub_25C662C10();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7();
  v13();
  swift_bridgeObjectRelease();
  sub_25C6635A0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7();
  v14();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25C660B40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for EventStatusSnippet() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_25C6602D4(v4, a1);
}

uint64_t sub_25C660BB8()
{
  sub_25C660E68();
  sub_25C663630();
  return v1;
}

double sub_25C660C0C()
{
  sub_25C660E1C();
  sub_25C663630();
  return v1;
}

void sub_25C660C58(uint64_t a1@<X8>)
{
  *(double *)a1 = sub_25C660C0C();
  *(void *)(a1 + 8) = v2;
}

uint64_t sub_25C660C80(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25C660CDC()
{
  sub_25C629890(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_25C660D20()
{
  unint64_t result = qword_26A5BCF40;
  if (!qword_26A5BCF40)
  {
    sub_25C6635C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCF40);
  }
  return result;
}

uint64_t sub_25C660D70(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C660DCC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7();
  v3();
  return a1;
}

unint64_t sub_25C660E1C()
{
  unint64_t result = qword_26A5BCF50;
  if (!qword_26A5BCF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCF50);
  }
  return result;
}

unint64_t sub_25C660E68()
{
  unint64_t result = qword_26A5BCF58;
  if (!qword_26A5BCF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCF58);
  }
  return result;
}

uint64_t sub_25C660EB4()
{
  return sub_25C6298EC(&qword_26A5BCF60, &qword_26A5BCF68);
}

void sub_25C660F04()
{
}

uint64_t sub_25C660F1C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

void sub_25C660F84()
{
}

void sub_25C660F98()
{
  OUTLINED_FUNCTION_6();
  uint64_t v27 = v2;
  uint64_t v3 = (int *)type metadata accessor for SingleEventWithButtonsSnippet();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3_0();
  uint64_t v7 = sub_25C663060();
  uint64_t v9 = v8;
  char v25 = v10;
  uint64_t v12 = v11;
  *(void *)(v1 + 56) = MEMORY[0x263F6CD30];
  unint64_t v26 = sub_25C632D4C();
  OUTLINED_FUNCTION_6_4(v26);
  sub_25C663490();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10_0();
  v13();
  *(void *)uint64_t v1 = v7;
  *(void *)(v1 + 8) = v9;
  *(unsigned char *)(v1 + 16) = v25 & 1;
  *(void *)(v1 + 24) = v12;
  OUTLINED_FUNCTION_12_1();
  sub_25C660F1C(v27, v0, (void (*)(void))type metadata accessor for RenderableEvent);
  sub_25C660F1C(v1, v0 + v3[5], (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  uint64_t v14 = OUTLINED_FUNCTION_11_2();
  uint64_t v16 = v15;
  LOBYTE(v7) = v17;
  uint64_t v19 = v18;
  uint64_t v20 = v0 + v3[6];
  *(void *)(v20 + 56) = MEMORY[0x263F6CD30];
  *(void *)(v20 + 64) = v26;
  *(unsigned char *)(v20 + 32) = 1;
  *(unsigned char *)(v20 + 72) = 1;
  OUTLINED_FUNCTION_10_0();
  v21();
  *(void *)uint64_t v20 = v14;
  *(void *)(v20 + 8) = v16;
  *(unsigned char *)(v20 + 16) = v7 & 1;
  *(void *)(v20 + 24) = v19;
  *(void *)(v20 + *(int *)(v5 + 28)) = 0;
  *(void *)(v20 + *(int *)(v5 + 32)) = 0;
  OUTLINED_FUNCTION_2_5();
  uint64_t v22 = (void *)(v0 + v3[11]);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_4_5(KeyPath);
  v22[5] = v24;
  v22[6] = sub_25C64B95C;
  v22[7] = 0;
  sub_25C661AD4();
  sub_25C663240();
  sub_25C661B24(v0, (void (*)(void))type metadata accessor for SingleEventWithButtonsSnippet);
  sub_25C661B24(v1, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_5_0();
}

void sub_25C661210()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = v0;
  uint64_t v2 = (int *)type metadata accessor for SingleEventWithButtonsSnippet();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C660F1C(v1, (uint64_t)v5, (void (*)(void))type metadata accessor for RenderableEvent);
  uint64_t v6 = sub_25C663060();
  uint64_t v30 = v7;
  uint64_t v31 = v6;
  char v9 = v8;
  uint64_t v32 = v10;
  uint64_t v11 = &v5[v2[5]];
  *((void *)v11 + 7) = MEMORY[0x263F6CD30];
  unint64_t v33 = sub_25C632D4C();
  *((void *)v11 + 8) = v33;
  v11[32] = 0;
  v11[72] = 1;
  uint64_t v12 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  uint64_t v13 = &v11[v12[6]];
  uint64_t v14 = *MEMORY[0x263F774E0];
  uint64_t v15 = sub_25C663490();
  OUTLINED_FUNCTION_1();
  char v29 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 104);
  v29(v13, v14, v15);
  uint64_t v17 = v30;
  *(void *)uint64_t v11 = v31;
  *((void *)v11 + 1) = v17;
  v11[16] = v9 & 1;
  *((void *)v11 + 3) = v32;
  *(void *)&v11[v12[7]] = 0;
  *(void *)&v11[v12[8]] = 0;
  uint64_t v18 = sub_25C663060();
  uint64_t v20 = v19;
  char v22 = v21;
  uint64_t v24 = v23;
  char v25 = &v5[v2[6]];
  unint64_t v26 = v33;
  *((void *)v25 + 7) = MEMORY[0x263F6CD30];
  *((void *)v25 + 8) = v26;
  v25[32] = 1;
  v25[72] = 1;
  v29(&v25[v12[6]], *MEMORY[0x263F774D8], v15);
  *(void *)char v25 = v18;
  *((void *)v25 + 1) = v20;
  v25[16] = v22 & 1;
  *((void *)v25 + 3) = v24;
  *(void *)&v25[v12[7]] = 0;
  *(void *)&v25[v12[8]] = 0;
  __swift_storeEnumTagSinglePayload((uint64_t)&v5[v2[7]], 1, 1, (uint64_t)v12);
  v5[v2[8]] = 0;
  v5[v2[9]] = 1;
  sub_25C663580();
  uint64_t v27 = &v5[v2[11]];
  *(void *)uint64_t v27 = swift_getKeyPath();
  v27[8] = 0;
  *((void *)v27 + 2) = 0x4030000000000000;
  *((void *)v27 + 3) = 0;
  v27[32] = 1;
  *((void *)v27 + 5) = 1;
  *((void *)v27 + 6) = sub_25C64B95C;
  *((void *)v27 + 7) = 0;
  sub_25C661AD4();
  sub_25C663240();
  sub_25C661B24((uint64_t)v5, (void (*)(void))type metadata accessor for SingleEventWithButtonsSnippet);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_5_0();
}

void sub_25C6614D4()
{
}

void sub_25C6614EC()
{
  OUTLINED_FUNCTION_6();
  uint64_t v26 = v2;
  uint64_t v3 = (int *)type metadata accessor for SingleEventWithButtonsSnippet();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3_0();
  uint64_t v7 = sub_25C663060();
  uint64_t v9 = v8;
  char v25 = v10;
  uint64_t v12 = v11;
  *(void *)(v1 + 56) = MEMORY[0x263F6CD30];
  unint64_t v27 = sub_25C632D4C();
  OUTLINED_FUNCTION_6_4(v27);
  sub_25C663490();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10_0();
  v13();
  *(void *)uint64_t v1 = v7;
  *(void *)(v1 + 8) = v9;
  *(unsigned char *)(v1 + 16) = v25 & 1;
  *(void *)(v1 + 24) = v12;
  OUTLINED_FUNCTION_12_1();
  sub_25C660F1C(v26, v0, (void (*)(void))type metadata accessor for RenderableEvent);
  sub_25C660F1C(v1, v0 + v3[5], (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  uint64_t v14 = OUTLINED_FUNCTION_11_2();
  uint64_t v16 = v15;
  LOBYTE(v12) = v17;
  uint64_t v19 = v18;
  uint64_t v20 = v0 + v3[6];
  *(void *)(v20 + 56) = MEMORY[0x263F6CD30];
  *(void *)(v20 + 64) = v27;
  *(unsigned char *)(v20 + 32) = 2;
  *(unsigned char *)(v20 + 72) = 1;
  OUTLINED_FUNCTION_10_0();
  v21();
  *(void *)uint64_t v20 = v14;
  *(void *)(v20 + 8) = v16;
  *(unsigned char *)(v20 + 16) = v12 & 1;
  *(void *)(v20 + 24) = v19;
  *(void *)(v20 + *(int *)(v5 + 28)) = 0;
  *(void *)(v20 + *(int *)(v5 + 32)) = 0;
  OUTLINED_FUNCTION_2_5();
  char v22 = (void *)(v0 + v3[11]);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_4_5(KeyPath);
  v22[5] = v24;
  v22[6] = sub_25C64B95C;
  v22[7] = 0;
  sub_25C661AD4();
  sub_25C663240();
  sub_25C661B24(v0, (void (*)(void))type metadata accessor for SingleEventWithButtonsSnippet);
  sub_25C661B24(v1, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_5_0();
}

void sub_25C661764()
{
}

void sub_25C66177C()
{
  OUTLINED_FUNCTION_6();
  uint64_t v37 = v1;
  uint64_t v39 = v2;
  uint64_t v38 = type metadata accessor for SingleEventWithButtonsSnippet();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = (int *)OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  char v10 = (char *)&v32 - v9;
  uint64_t v11 = sub_25C663060();
  uint64_t v33 = v12;
  uint64_t v34 = v11;
  char v14 = v13;
  uint64_t v35 = v15;
  *((void *)v10 + 7) = MEMORY[0x263F6CD40];
  unint64_t v36 = sub_25C661B7C();
  *((void *)v10 + 8) = v36;
  v10[32] = 1;
  v10[72] = 1;
  uint64_t v16 = &v10[v4[6]];
  uint64_t v17 = *MEMORY[0x263F774E0];
  uint64_t v18 = sub_25C663490();
  OUTLINED_FUNCTION_1();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 104);
  v20(v16, v17, v18);
  uint64_t v21 = v33;
  *(void *)char v10 = v34;
  *((void *)v10 + 1) = v21;
  v10[16] = v14 & 1;
  *((void *)v10 + 3) = v35;
  *(void *)&v10[v4[7]] = 0;
  *(void *)&v10[v4[8]] = 0;
  uint64_t v22 = sub_25C663060();
  uint64_t v24 = v23;
  char v26 = v25;
  uint64_t v37 = v27;
  unint64_t v28 = v36;
  *((void *)v8 + 7) = MEMORY[0x263F6CD40];
  *((void *)v8 + 8) = v28;
  v8[32] = 2;
  v8[72] = 1;
  v20(&v8[v4[6]], *MEMORY[0x263F774D8], v18);
  *(void *)uint64_t v8 = v22;
  *((void *)v8 + 1) = v24;
  unsigned char v8[16] = v26 & 1;
  *((void *)v8 + 3) = v37;
  *(void *)&v8[v4[7]] = 0;
  *(void *)&v8[v4[8]] = 0;
  sub_25C660F1C(v39, v0, (void (*)(void))type metadata accessor for RenderableEvent);
  char v29 = (int *)v38;
  sub_25C660F1C((uint64_t)v10, v0 + *(int *)(v38 + 20), (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  sub_25C660F1C((uint64_t)v8, v0 + v29[6], (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  uint64_t v30 = v0 + v29[7];
  sub_25C6566D4(v30);
  __swift_storeEnumTagSinglePayload(v30, 0, 1, (uint64_t)v4);
  *(unsigned char *)(v0 + v29[8]) = 0;
  *(unsigned char *)(v0 + v29[9]) = 0;
  sub_25C663580();
  uint64_t v31 = v0 + v29[11];
  *(void *)uint64_t v31 = swift_getKeyPath();
  *(unsigned char *)(v31 + 8) = 0;
  *(void *)(v31 + 16) = 0x4030000000000000;
  *(void *)(v31 + 24) = 0;
  *(unsigned char *)(v31 + 32) = 1;
  *(void *)(v31 + 40) = 1;
  *(void *)(v31 + 48) = sub_25C64B95C;
  *(void *)(v31 + 56) = 0;
  sub_25C661AD4();
  sub_25C663240();
  sub_25C661B24(v0, (void (*)(void))type metadata accessor for SingleEventWithButtonsSnippet);
  sub_25C661B24((uint64_t)v8, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  sub_25C661B24((uint64_t)v10, (void (*)(void))type metadata accessor for CalendarButtonView.Model);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_5_0();
}

unint64_t sub_25C661AD4()
{
  unint64_t result = qword_26A5BCF70;
  if (!qword_26A5BCF70)
  {
    type metadata accessor for SingleEventWithButtonsSnippet();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCF70);
  }
  return result;
}

uint64_t sub_25C661B24(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_25C661B7C()
{
  unint64_t result = qword_26A5BCF78;
  if (!qword_26A5BCF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BCF78);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return type metadata accessor for CalendarButtonView.Model(0);
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  __swift_storeEnumTagSinglePayload(v1 + v0[7], 1, 1, v2);
  *(unsigned char *)(v1 + v0[8]) = 1;
  *(unsigned char *)(v1 + v0[9]) = 0;
  return sub_25C663580();
}

void OUTLINED_FUNCTION_3_4()
{
}

uint64_t OUTLINED_FUNCTION_4_5(uint64_t result)
{
  *(void *)uint64_t v1 = result;
  *(unsigned char *)(v1 + 8) = 0;
  *(void *)(v1 + 16) = 0x4030000000000000;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_6_4(uint64_t result)
{
  *(void *)(v1 + 64) = result;
  *(unsigned char *)(v1 + 32) = 0;
  *(unsigned char *)(v1 + 72) = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return sub_25C663060();
}

void OUTLINED_FUNCTION_12_1()
{
  *(void *)(v0 + *(int *)(v1 + 28)) = 0;
  *(void *)(v0 + *(int *)(v1 + 32)) = 0;
}

uint64_t sub_25C661CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_25C661CDC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C661D94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64) + 7;
  if (v7 > 7
    || (*(_DWORD *)(v6 + 80) & 0x100000) != 0
    || ((((v8 + ((v7 + 9) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v11 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v11 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16));
  }
  else
  {
    uint64_t v12 = *(void *)a2;
    char v13 = *(unsigned char *)(a2 + 8);
    sub_25C62C450(*(void *)a2, v13);
    *(void *)a1 = v12;
    *(unsigned char *)(a1 + 8) = v13;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))((a1 + v7 + 9) & ~v7, (a2 + v7 + 9) & ~v7, v5);
    char v14 = (void *)((v8 + ((a1 + v7 + 9) & ~v7)) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v15 = (void *)((v8 + ((a2 + v7 + 9) & ~v7)) & 0xFFFFFFFFFFFFFFF8);
    void *v14 = *v15;
    uint64_t v16 = (void *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v17 = v16[1];
    uint64_t v18 = (void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8);
    void *v18 = *v16;
    v18[1] = v17;
  }
  swift_retain();
  return a1;
}

uint64_t sub_25C661F00(uint64_t a1, uint64_t a2)
{
  sub_25C62C6E4(*(void *)a1, *(unsigned char *)(a1 + 8));
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)
                                                                                            + 9) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
  return swift_release();
}

uint64_t sub_25C661FA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_25C62C450(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (v10 + 9 + a1) & ~v10;
  uint64_t v12 = (v10 + 9 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v11, v12);
  uint64_t v13 = *(void *)(v9 + 48) + 7;
  char v14 = (void *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  void *v14 = *v15;
  uint64_t v16 = (void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (void *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_retain();
  return a1;
}

uint64_t sub_25C66207C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_25C62C450(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_25C62C6E4(v8, v9);
  uint64_t v10 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v11 = v10 + 24;
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (v12 + 9 + a1) & ~v12;
  uint64_t v14 = (v12 + 9 + a2) & ~v12;
  (*(void (**)(uint64_t, uint64_t))(v10 + 24))(v13, v14);
  uint64_t v15 = *(void *)(v11 + 40) + 7;
  uint64_t v16 = (void *)((v15 + v13) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (void *)((v15 + v14) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v16 = *v17;
  uint64_t v18 = (void *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (void *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v20 = v19[1];
  void *v18 = *v19;
  v18[1] = v20;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25C66216C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = (v6 + 9 + a1) & ~v6;
  uint64_t v8 = (v6 + 9 + a2) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  uint64_t v9 = *(void *)(v5 + 32) + 7;
  uint64_t v10 = (void *)((v9 + v7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v11 = (void *)((v9 + v8) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v10 = *v11;
  *(_OWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_25C662224(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_25C62C6E4(v8, v9);
  uint64_t v10 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v11 = v10 + 40;
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (v12 + 9 + a1) & ~v12;
  uint64_t v14 = ((unint64_t)a2 + v12 + 9) & ~v12;
  (*(void (**)(uint64_t, uint64_t))(v10 + 40))(v13, v14);
  uint64_t v15 = *(void *)(v11 + 24) + 7;
  uint64_t v16 = (void *)((v15 + v13) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (void *)((v15 + v14) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v16 = *v17;
  *(_OWORD *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_25C6622F8(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v9 = *(void *)(*(void *)(v4 - 8) + 64) + 7;
  if (v8 < a2)
  {
    unint64_t v10 = ((((v9 + ((v7 + 9) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v11 = a2 - v8;
    uint64_t v12 = v10 & 0xFFFFFFF8;
    if ((v10 & 0xFFFFFFF8) != 0) {
      unsigned int v13 = 2;
    }
    else {
      unsigned int v13 = v11 + 1;
    }
    if (v13 >= 0x10000) {
      unsigned int v14 = 4;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v13 < 0x100) {
      unsigned int v14 = 1;
    }
    if (v13 >= 2) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    switch(v15)
    {
      case 1:
        int v16 = *((unsigned __int8 *)a1 + v10);
        if (!v16) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v16 = *(unsigned __int16 *)((char *)a1 + v10);
        if (v16) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x25C662460);
      case 4:
        int v16 = *(_DWORD *)((char *)a1 + v10);
        if (!v16) {
          break;
        }
LABEL_22:
        int v18 = v16 - 1;
        if (v12)
        {
          int v18 = 0;
          LODWORD(v12) = *a1;
        }
        return v8 + (v12 | v18) + 1;
      default:
        break;
    }
  }
  uint64_t v19 = ((unint64_t)a1 + v7 + 9) & ~v7;
  if (v6 >= 0x7FFFFFFF) {
    return __swift_getEnumTagSinglePayload(v19, v6, v4);
  }
  unint64_t v20 = *(void *)((((v9 + v19) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  if (v20 >= 0xFFFFFFFF) {
    LODWORD(v20) = -1;
  }
  return (v20 + 1);
}

void sub_25C662474(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = *(void *)(*(void *)(v6 - 8) + 64) + 7;
  unint64_t v12 = ((((v11 + ((v10 + 9) & ~v10)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v9 >= a3)
  {
    int v16 = 0;
  }
  else
  {
    unsigned int v13 = a3 - v9;
    if (((((v11 + ((v10 + 9) & ~v10)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v14 = v13 + 1;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v14 >= 0x10000) {
      int v15 = 4;
    }
    else {
      int v15 = 2;
    }
    if (v14 < 0x100) {
      int v15 = 1;
    }
    if (v14 >= 2) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
  }
  if (a2 > v9)
  {
    if (((((v11 + ((v10 + 9) & ~v10)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v17 = a2 - v9;
    }
    else {
      int v17 = 1;
    }
    if (((((v11 + ((v10 + 9) & ~v10)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v18 = ~v9 + a2;
      bzero(a1, ((((v11 + ((v10 + 9) & ~v10)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16);
      *(_DWORD *)a1 = v18;
    }
    switch(v16)
    {
      case 1:
        a1[v12] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v12] = v17;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v12] = v17;
        return;
      default:
        return;
    }
  }
  switch(v16)
  {
    case 1:
      a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x25C662674);
    case 4:
      *(_DWORD *)&a1[v12] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        unint64_t v19 = (unint64_t)&a1[v10 + 9] & ~v10;
        if (v8 < 0x7FFFFFFF)
        {
          unint64_t v20 = (void *)((((v11 + v19) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v21 = a2 ^ 0x80000000;
            v20[1] = 0;
          }
          else
          {
            uint64_t v21 = (a2 - 1);
          }
          *unint64_t v20 = v21;
        }
        else
        {
          __swift_storeEnumTagSinglePayload(v19, a2, v8, v6);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for IdiomConstant()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25C6626B4()
{
  uint64_t v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  sub_25C62C450(v1, v2);
  sub_25C637EB4();
  uint64_t v4 = v3;
  sub_25C62C6E4(v1, v2);
  return v4;
}

uint64_t sub_25C66270C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_25C6626B4();
  uint64_t v8 = *(int *)(a1 + 32);
  if (result != *(void *)(v1 + v8))
  {
    unsigned int v9 = *(void (**)(uint64_t))(v1 + *(int *)(a1 + 36));
    uint64_t v10 = sub_25C6626B4();
    v9(v10);
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 40))(v1 + *(int *)(a1 + 28), v6, v3);
    uint64_t result = sub_25C6626B4();
    *(void *)(v1 + v8) = result;
  }
  return result;
}

uint64_t sub_25C662828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270EFFE88](a1, a2, a3, a4, a6, a5);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25C662870()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_25C662880()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_25C662890()
{
  return MEMORY[0x270EEE318]();
}

uint64_t sub_25C6628A0()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_25C6628B0()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_25C6628C0()
{
  return MEMORY[0x270EEF318]();
}

uint64_t sub_25C6628D0()
{
  return MEMORY[0x270EEFB78]();
}

uint64_t sub_25C6628E0()
{
  return MEMORY[0x270EEFB88]();
}

uint64_t sub_25C6628F0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25C662900()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25C662910()
{
  return MEMORY[0x270EF0320]();
}

uint64_t sub_25C662920()
{
  return MEMORY[0x270EF0360]();
}

uint64_t sub_25C662930()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_25C662940()
{
  return MEMORY[0x270EF0428]();
}

uint64_t sub_25C662950()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_25C662960()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_25C662970()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_25C662980()
{
  return MEMORY[0x270EF0580]();
}

uint64_t sub_25C662990()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_25C6629A0()
{
  return MEMORY[0x270EF0600]();
}

uint64_t sub_25C6629B0()
{
  return MEMORY[0x270EF0628]();
}

uint64_t sub_25C6629C0()
{
  return MEMORY[0x270EF06A8]();
}

uint64_t sub_25C6629D0()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_25C6629E0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25C6629F0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25C662A00()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25C662A10()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25C662A20()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25C662A30()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_25C662A40()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_25C662A50()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_25C662A60()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_25C662A70()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_25C662A80()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25C662A90()
{
  return MEMORY[0x270EF1030]();
}

uint64_t sub_25C662AA0()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_25C662AB0()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_25C662AC0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25C662AD0()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_25C662AE0()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_25C662AF0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25C662B00()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_25C662B10()
{
  return MEMORY[0x270EF15D0]();
}

uint64_t sub_25C662B20()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_25C662B30()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25C662B40()
{
  return MEMORY[0x270F741F0]();
}

uint64_t sub_25C662B50()
{
  return MEMORY[0x270F75648]();
}

uint64_t sub_25C662B60()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_25C662B70()
{
  return MEMORY[0x270F14AA0]();
}

uint64_t sub_25C662B80()
{
  return MEMORY[0x270F14CF0]();
}

uint64_t sub_25C662B90()
{
  return MEMORY[0x270F14E98]();
}

uint64_t sub_25C662BA0()
{
  return MEMORY[0x270F14EA0]();
}

uint64_t sub_25C662BB0()
{
  return MEMORY[0x270F14EA8]();
}

uint64_t sub_25C662BC0()
{
  return MEMORY[0x270F14EB0]();
}

uint64_t sub_25C662BD0()
{
  return MEMORY[0x270F14EC8]();
}

uint64_t sub_25C662BE0()
{
  return MEMORY[0x270F14ED0]();
}

uint64_t sub_25C662BF0()
{
  return MEMORY[0x270F14ED8]();
}

uint64_t sub_25C662C00()
{
  return MEMORY[0x270F14EE0]();
}

uint64_t sub_25C662C10()
{
  return MEMORY[0x270F14EE8]();
}

uint64_t sub_25C662C20()
{
  return MEMORY[0x270F64408]();
}

uint64_t sub_25C662C30()
{
  return MEMORY[0x270F64410]();
}

uint64_t sub_25C662C40()
{
  return MEMORY[0x270F64418]();
}

uint64_t sub_25C662C50()
{
  return MEMORY[0x270F64420]();
}

uint64_t sub_25C662C60()
{
  return MEMORY[0x270F64428]();
}

uint64_t sub_25C662C70()
{
  return MEMORY[0x270F64430]();
}

uint64_t sub_25C662C80()
{
  return MEMORY[0x270F64438]();
}

uint64_t sub_25C662C90()
{
  return MEMORY[0x270F64440]();
}

uint64_t sub_25C662CA0()
{
  return MEMORY[0x270F64448]();
}

uint64_t sub_25C662CB0()
{
  return MEMORY[0x270F64450]();
}

uint64_t sub_25C662CC0()
{
  return MEMORY[0x270F64458]();
}

uint64_t sub_25C662CD0()
{
  return MEMORY[0x270F64460]();
}

uint64_t sub_25C662CE0()
{
  return MEMORY[0x270F64468]();
}

uint64_t sub_25C662CF0()
{
  return MEMORY[0x270F64470]();
}

uint64_t sub_25C662D00()
{
  return MEMORY[0x270F64478]();
}

uint64_t sub_25C662D10()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C662D20()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C662D30()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_25C662D40()
{
  return MEMORY[0x270EFED30]();
}

uint64_t sub_25C662D50()
{
  return MEMORY[0x270EFED38]();
}

uint64_t sub_25C662D60()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_25C662D70()
{
  return MEMORY[0x270EFED68]();
}

uint64_t sub_25C662D80()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_25C662D90()
{
  return MEMORY[0x270EFF140]();
}

uint64_t sub_25C662DA0()
{
  return MEMORY[0x270EFF158]();
}

uint64_t sub_25C662DB0()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_25C662DC0()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_25C662DD0()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_25C662DE0()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_25C662DF0()
{
  return MEMORY[0x270EFFC90]();
}

uint64_t sub_25C662E00()
{
  return MEMORY[0x270EFFCA0]();
}

uint64_t sub_25C662E10()
{
  return MEMORY[0x270EFFCB8]();
}

uint64_t sub_25C662E20()
{
  return MEMORY[0x270EFFCC0]();
}

uint64_t sub_25C662E30()
{
  return MEMORY[0x270EFFCF8]();
}

uint64_t sub_25C662E40()
{
  return MEMORY[0x270EFFD10]();
}

uint64_t sub_25C662E50()
{
  return MEMORY[0x270EFFD18]();
}

uint64_t sub_25C662E70()
{
  return MEMORY[0x270EFFE90]();
}

uint64_t sub_25C662E80()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_25C662E90()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_25C662EA0()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_25C662EB0()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_25C662EC0()
{
  return MEMORY[0x270F75870]();
}

uint64_t sub_25C662ED0()
{
  return MEMORY[0x270F75880]();
}

uint64_t sub_25C662EE0()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_25C662EF0()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_25C662F00()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_25C662F10()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_25C662F20()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_25C662F30()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_25C662F40()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_25C662F50()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_25C662F60()
{
  return MEMORY[0x270F00DC0]();
}

uint64_t sub_25C662F70()
{
  return MEMORY[0x270F00E18]();
}

uint64_t sub_25C662F80()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_25C662F90()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_25C662FA0()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_25C662FB0()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_25C662FC0()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_25C662FD0()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_25C662FE0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25C662FF0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25C663000()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_25C663010()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_25C663020()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_25C663030()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_25C663040()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_25C663050()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_25C663060()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_25C663070()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_25C663080()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_25C663090()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25C6630A0()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_25C6630B0()
{
  return MEMORY[0x270F01598]();
}

uint64_t sub_25C6630C0()
{
  return MEMORY[0x270F015A8]();
}

uint64_t sub_25C6630D0()
{
  return MEMORY[0x270F015E0]();
}

uint64_t sub_25C6630E0()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_25C6630F0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_25C663100()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_25C663110()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_25C663120()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25C663130()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_25C663140()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25C663150()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_25C663160()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_25C663170()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_25C663180()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_25C663190()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_25C6631A0()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_25C6631B0()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_25C6631C0()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_25C6631D0()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_25C6631E0()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_25C6631F0()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_25C663200()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25C663210()
{
  return MEMORY[0x270F03220]();
}

uint64_t sub_25C663220()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_25C663230()
{
  return MEMORY[0x270F03260]();
}

uint64_t sub_25C663240()
{
  return MEMORY[0x270F75950]();
}

uint64_t sub_25C663250()
{
  return MEMORY[0x270F75960]();
}

uint64_t sub_25C663260()
{
  return MEMORY[0x270F75998]();
}

uint64_t sub_25C663270()
{
  return MEMORY[0x270F759A0]();
}

uint64_t sub_25C663280()
{
  return MEMORY[0x270F759C8]();
}

uint64_t sub_25C663290()
{
  return MEMORY[0x270F75A00]();
}

uint64_t sub_25C6632A0()
{
  return MEMORY[0x270F75A70]();
}

uint64_t sub_25C6632B0()
{
  return MEMORY[0x270F75AB0]();
}

uint64_t sub_25C6632C0()
{
  return MEMORY[0x270F14EF0]();
}

uint64_t sub_25C6632D0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25C6632E0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25C6632F0()
{
  return MEMORY[0x270F03540]();
}

uint64_t sub_25C663300()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_25C663310()
{
  return MEMORY[0x270F036A8]();
}

uint64_t sub_25C663320()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25C663330()
{
  return MEMORY[0x270F03750]();
}

uint64_t sub_25C663340()
{
  return MEMORY[0x270F038B8]();
}

uint64_t sub_25C663350()
{
  return MEMORY[0x270F040A8]();
}

uint64_t sub_25C663360()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_25C663370()
{
  return MEMORY[0x270F041B0]();
}

uint64_t sub_25C663380()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_25C663390()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_25C6633A0()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_25C6633B0()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_25C6633C0()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_25C6633D0()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_25C6633E0()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_25C6633F0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_25C663400()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_25C663410()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_25C663420()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_25C663430()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_25C663440()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_25C663450()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_25C663460()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_25C663470()
{
  return MEMORY[0x270F052B8]();
}

uint64_t sub_25C663480()
{
  return MEMORY[0x270F75AC8]();
}

uint64_t sub_25C663490()
{
  return MEMORY[0x270F75AD0]();
}

uint64_t sub_25C6634A0()
{
  return MEMORY[0x270F75C30]();
}

uint64_t sub_25C6634B0()
{
  return MEMORY[0x270F75C60]();
}

uint64_t sub_25C6634C0()
{
  return MEMORY[0x270F75C80]();
}

uint64_t sub_25C6634D0()
{
  return MEMORY[0x270F75C90]();
}

uint64_t sub_25C6634E0()
{
  return MEMORY[0x270F75C98]();
}

uint64_t sub_25C6634F0()
{
  return MEMORY[0x270F75CA0]();
}

uint64_t sub_25C663500()
{
  return MEMORY[0x270F75CE8]();
}

uint64_t sub_25C663510()
{
  return MEMORY[0x270F75CF0]();
}

uint64_t sub_25C663520()
{
  return MEMORY[0x270F75D40]();
}

uint64_t sub_25C663530()
{
  return MEMORY[0x270F75D48]();
}

uint64_t sub_25C663540()
{
  return MEMORY[0x270F75D90]();
}

uint64_t sub_25C663550()
{
  return MEMORY[0x270F75E08]();
}

uint64_t sub_25C663560()
{
  return MEMORY[0x270F75E18]();
}

uint64_t sub_25C663570()
{
  return MEMORY[0x270F75E28]();
}

uint64_t sub_25C663580()
{
  return MEMORY[0x270F75E40]();
}

uint64_t sub_25C663590()
{
  return MEMORY[0x270F75E48]();
}

uint64_t sub_25C6635A0()
{
  return MEMORY[0x270F75E58]();
}

uint64_t sub_25C6635B0()
{
  return MEMORY[0x270F75E70]();
}

uint64_t sub_25C6635C0()
{
  return MEMORY[0x270F75E80]();
}

uint64_t sub_25C6635D0()
{
  return MEMORY[0x270F75EA8]();
}

uint64_t sub_25C6635E0()
{
  return MEMORY[0x270F76008]();
}

uint64_t sub_25C6635F0()
{
  return MEMORY[0x270F76010]();
}

uint64_t sub_25C663600()
{
  return MEMORY[0x270F76020]();
}

uint64_t sub_25C663610()
{
  return MEMORY[0x270F76028]();
}

uint64_t sub_25C663620()
{
  return MEMORY[0x270F76030]();
}

uint64_t sub_25C663630()
{
  return MEMORY[0x270F76038]();
}

uint64_t sub_25C663640()
{
  return MEMORY[0x270F76040]();
}

uint64_t sub_25C663650()
{
  return MEMORY[0x270F76080]();
}

uint64_t sub_25C663660()
{
  return MEMORY[0x270F760A0]();
}

uint64_t sub_25C663670()
{
  return MEMORY[0x270F760B0]();
}

uint64_t sub_25C663680()
{
  return MEMORY[0x270F760B8]();
}

uint64_t sub_25C663690()
{
  return MEMORY[0x270F760C0]();
}

uint64_t sub_25C6636A0()
{
  return MEMORY[0x270F76118]();
}

uint64_t sub_25C6636B0()
{
  return MEMORY[0x270F76120]();
}

uint64_t sub_25C6636C0()
{
  return MEMORY[0x270F761B0]();
}

uint64_t sub_25C6636D0()
{
  return MEMORY[0x270F761C8]();
}

uint64_t sub_25C6636E0()
{
  return MEMORY[0x270F76200]();
}

uint64_t sub_25C6636F0()
{
  return MEMORY[0x270F76210]();
}

uint64_t sub_25C663700()
{
  return MEMORY[0x270F76220]();
}

uint64_t sub_25C663710()
{
  return MEMORY[0x270F76280]();
}

uint64_t sub_25C663720()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25C663730()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C663740()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C663750()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C663760()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25C663770()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25C663780()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25C6637A0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25C6637B0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25C6637C0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25C6637D0()
{
  return MEMORY[0x270F64480]();
}

uint64_t sub_25C6637E0()
{
  return MEMORY[0x270F64488]();
}

uint64_t sub_25C6637F0()
{
  return MEMORY[0x270F762F8]();
}

uint64_t sub_25C663800()
{
  return MEMORY[0x270F76300]();
}

uint64_t sub_25C663810()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25C663820()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C663830()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C663840()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C663850()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C663860()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C663870()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25C663880()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25C663890()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C6638A0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25C6638B0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C6638C0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25C6638D0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25C6638E0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25C6638F0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25C663900()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C663910()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C663920()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t CUIKStringForRecurrenceRule()
{
  return MEMORY[0x270F14E88]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}