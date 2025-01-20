id sub_234AD35A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  void *v15;
  uint64_t vars8;

  v15 = (void *)swift_allocObject();
  v15[2] = a4;
  v15[3] = a5;
  v15[4] = a6;
  *(void *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  *(void *)(a8 + 16) = a3;
  *(void *)(a8 + 24) = a7;
  *(void *)(a8 + 32) = a4;
  *(void *)(a8 + 40) = a5;
  *(void *)(a8 + 48) = a6;
  *(void *)(a8 + 56) = sub_234AD5B08;
  *(void *)(a8 + 64) = v15;
  *(unsigned char *)(a8 + 72) = 0;
  swift_retain();
  swift_retain();
  return a6;
}

uint64_t sub_234AD366C@<X0>(uint64_t a1@<X8>)
{
  return sub_234AD2204(*(void **)v1, *(void **)(v1 + 8), *(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_234AD3678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_234B38808();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v12 = (char *)v16 - v11;
  v16[0] = a1;
  v16[1] = a2;
  v16[2] = a3;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_2687D7CA0);
  MEMORY[0x237DCBA80](&v17, v13);
  v14 = v17;
  if (v17)
  {
    sub_234B3BC08();

    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v9, v6);
  }
  else
  {
    MEMORY[0x237DC9300](0, 0xE000000000000000);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D1930);
  swift_allocObject();
  return sub_234B38D38();
}

uint64_t sub_234AD37E4()
{
  uint64_t v1 = (uint64_t)v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D1930);
  sub_23493A4EC((uint64_t)&qword_2687D19A0);
  uint64_t v2 = sub_234B39488();
  uint64_t v3 = *v0;
  uint64_t v4 = v0[1];
  uint64_t v5 = v0[2];
  uint64_t v6 = swift_allocObject();
  memcpy((void *)(v6 + 16), (const void *)v1, 0x49uLL);
  uint64_t v7 = *(void **)(v1 + 24);
  uint64_t v8 = (void *)*MEMORY[0x263F85828];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_234AD6D48(v1);
  type metadata accessor for WorkflowEditorOptions(0);
  sub_234AD5930((uint64_t)&qword_2687D20D0);
  *(void *)&__src[0] = v2;
  BYTE8(__src[0]) = 2;
  __src[1] = 0uLL;
  *(void *)&__src[2] = v3;
  *((void *)&__src[2] + 1) = v4;
  LOWORD(__src[3]) = 256;
  BYTE2(__src[3]) = 0;
  *((void *)&__src[3] + 1) = 0;
  LOBYTE(__src[4]) = 0;
  *((void *)&__src[4] + 1) = v5;
  __src[5] = xmmword_234B72B40;
  *(void *)&__src[6] = sub_234AD6D40;
  *((void *)&__src[6] + 1) = v6;
  *(void *)&__src[7] = v7;
  *((void *)&__src[7] + 1) = v8;
  __src[8] = xmmword_234B72B50;
  *(void *)&__src[9] = sub_234B39958();
  *((void *)&__src[9] + 1) = v9;
  __dst[0] = *(_OWORD *)(v1 + 32);
  *(void *)&__dst[1] = *(void *)(v1 + 48);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2687D7CA0);
  MEMORY[0x237DCBA80](&v13, v10);
  uint64_t v11 = swift_allocObject();
  memcpy((void *)(v11 + 16), (const void *)v1, 0x49uLL);
  sub_234AD6D48(v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7D68);
  sub_234A0B4A0();
  sub_234AD6E50();
  sub_234B3AB48();
  swift_release();

  memcpy(__dst, __src, 0xA0uLL);
  return sub_234A18034((uint64_t)__dst);
}

uint64_t sub_234AD3A8C()
{
  uint64_t v0 = sub_234B38808();
  MEMORY[0x270FA5388](v0 - 8);
  sub_23491E3D4(0, (unint64_t *)&unk_2687D3B98);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D1930);
  sub_23493A4EC((uint64_t)&qword_2687D19A0);
  sub_234B39488();
  sub_234B38DC8();
  swift_release();
  sub_234B3BC18();
  __swift_instantiateConcreteTypeFromMangledName(qword_2687D7CA0);
  return sub_234B3AF48();
}

uint64_t sub_234AD3BD4(uint64_t a1)
{
  uint64_t v2 = sub_234B38808();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v12 - v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D1930);
  sub_23493A4EC((uint64_t)&qword_2687D19A0);
  sub_234B39488();
  long long v12 = *(_OWORD *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2687D7CA0);
  MEMORY[0x237DCBA80](&v14, v9);
  uint64_t v10 = v14;
  if (v14)
  {
    sub_234B3BC08();

    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v5, v2);
  }
  else
  {
    MEMORY[0x237DC9300](0, 0xE000000000000000);
  }
  sub_234B38DD8();
  return swift_release();
}

uint64_t sub_234AD3D90()
{
  memcpy(v2, v0, sizeof(v2));
  return sub_234AD37E4();
}

uint64_t sub_234AD3DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v75 = a3;
  id v76 = a4;
  uint64_t v74 = a2;
  uint64_t v78 = a5;
  uint64_t v79 = a1;
  uint64_t v5 = sub_234B38378();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_234B38478();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D3560);
  MEMORY[0x270FA5388](v11 - 8);
  v77 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7D48);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_234B720E0;
  v14 = (void *)*MEMORY[0x263F87350];
  uint64_t v15 = MEMORY[0x263F8D310];
  *(void *)(inited + 32) = *MEMORY[0x263F87350];
  *(void *)(inited + 40) = 0x6E61656C6F6F62;
  *(void *)(inited + 48) = 0xE700000000000000;
  v16 = (void *)*MEMORY[0x263F87318];
  *(void *)(inited + 64) = v15;
  *(void *)(inited + 72) = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7F20);
  *(void *)(inited + 80) = &unk_26E79D138;
  v18 = (void *)*MEMORY[0x263F87310];
  uint64_t v73 = v17;
  *(void *)(inited + 104) = v17;
  *(void *)(inited + 112) = v18;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687CF5D0);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_234B6FFC0;
  id v20 = v14;
  id v21 = v16;
  id v22 = v18;
  uint64_t v23 = sub_234B3B5E8();
  uint64_t v25 = v24;
  id v26 = (id)sub_234B3B5E8();
  uint64_t v28 = v27;
  sub_234B38458();
  if (qword_2687CE508 != -1) {
    goto LABEL_17;
  }
  while (1)
  {
    id v29 = objc_msgSend((id)qword_2687D07B0, sel_bundleURL);
    sub_234B38358();

    id v30 = objc_allocWithZone(MEMORY[0x263F08DB0]);
    *(void *)(v19 + 32) = sub_2349E2378(v23, v25, (uint64_t)v26, v28, 0, 0, (uint64_t)v10, (uint64_t)v7);
    uint64_t v31 = sub_234B3B5E8();
    uint64_t v28 = v32;
    uint64_t v33 = sub_234B3B5E8();
    uint64_t v35 = v34;
    sub_234B38458();
    id v26 = objc_msgSend((id)qword_2687D07B0, sel_bundleURL);
    sub_234B38358();

    id v36 = objc_allocWithZone(MEMORY[0x263F08DB0]);
    *(void *)(v19 + 40) = sub_2349E2378(v31, v28, v33, v35, 0, 0, (uint64_t)v10, (uint64_t)v7);
    *(void *)&long long v82 = v19;
    sub_234B3B748();
    uint64_t v37 = v82;
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7D90);
    *(void *)(inited + 120) = v37;
    v39 = (void *)*MEMORY[0x263F872E0];
    *(void *)(inited + 144) = v38;
    *(void *)(inited + 152) = v39;
    *(void *)(inited + 160) = 0x65736C6166;
    *(void *)(inited + 168) = 0xE500000000000000;
    v40 = (void *)*MEMORY[0x263F87300];
    *(void *)(inited + 184) = MEMORY[0x263F8D310];
    *(void *)(inited + 192) = v40;
    sub_23491E3D4(0, &qword_2687D7D98);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    id v42 = v39;
    id v43 = v40;
    id v44 = objc_msgSend(ObjCClassFromMetadata, sel_allInsertableVariableTypes);
    type metadata accessor for WFVariableType(0);
    sub_234AD5930((uint64_t)&qword_2687CEC10);
    uint64_t v45 = sub_234B3B8F8();

    uint64_t v25 = v79;
    uint64_t v7 = (char *)sub_234ADEF48(v79, v45);
    uint64_t v10 = (char *)*((void *)v7 + 2);
    if (!v10) {
      break;
    }
    uint64_t v72 = inited;
    *(void *)&long long v82 = MEMORY[0x263F8EE78];
    sub_234952608();
    uint64_t v23 = v82;
    uint64_t v19 = sub_234AD9A2C((uint64_t)v7);
    uint64_t inited = v46;
    int v48 = v47 & 1;
    *(void *)&long long v80 = v7 + 56;
    while ((v19 & 0x8000000000000000) == 0 && v19 < 1 << v7[32])
    {
      if (((*(void *)(v80 + (((unint64_t)v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
        goto LABEL_15;
      }
      if (*((_DWORD *)v7 + 9) != inited) {
        goto LABEL_16;
      }
      LODWORD(v81) = v48;
      uint64_t v28 = sub_234B3B588();
      uint64_t v50 = v49;
      *(void *)&long long v82 = v23;
      uint64_t v25 = (uint64_t)v7;
      unint64_t v51 = *(void *)(v23 + 16);
      id v26 = (id)(v51 + 1);
      if (v51 >= *(void *)(v23 + 24) >> 1)
      {
        sub_234952608();
        uint64_t v23 = v82;
      }
      *(void *)(v23 + 16) = v26;
      uint64_t v52 = v23 + 16 * v51;
      *(void *)(v52 + 32) = v28;
      *(void *)(v52 + 40) = v50;
      uint64_t v53 = sub_234AD9944(v19, inited, v81 & 1, v25);
      uint64_t v19 = v53;
      uint64_t inited = v54;
      int v48 = v55 & 1;
      --v10;
      uint64_t v7 = (char *)v25;
      if (!v10)
      {
        sub_234967CD4(v53, v54, v48);
        swift_bridgeObjectRelease();
        uint64_t v25 = v79;
        uint64_t inited = v72;
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    swift_once();
  }
  swift_bridgeObjectRelease();
  uint64_t v23 = MEMORY[0x263F8EE78];
LABEL_13:
  sub_23491E3D4(0, (unint64_t *)&unk_2687D1BC0);
  *(void *)(inited + 224) = v73;
  *(void *)(inited + 200) = v23;
  _s3__C3KeyVMa_0(0);
  sub_234AD5930((uint64_t)&qword_2687D7D60);
  sub_234B3B3D8();
  id v56 = sub_23499C1A0();
  id v81 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F86B20]), sel_initWithDefinition_, v56);

  sub_234B3B878();
  id v57 = v76;
  id v58 = v76;
  swift_bridgeObjectRetain();
  uint64_t v59 = v74;
  swift_retain();
  uint64_t v60 = v75;
  swift_retain();
  uint64_t v61 = v25;
  uint64_t v62 = sub_234B3B868();
  v63 = (void *)swift_allocObject();
  uint64_t v64 = MEMORY[0x263F8F500];
  v63[2] = v62;
  v63[3] = v64;
  v63[4] = v61;
  v63[5] = v59;
  v63[6] = v60;
  v63[7] = v57;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v65 = v58;
  uint64_t v66 = sub_234B3B868();
  v67 = (void *)swift_allocObject();
  v67[2] = v66;
  v67[3] = v64;
  v67[4] = v61;
  v67[5] = v59;
  v67[6] = v60;
  v67[7] = v57;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D1BD0);
  sub_234B3AF98();
  long long v80 = v82;
  uint64_t v68 = v83;
  type metadata accessor for BindingParameterStateDataSource();
  uint64_t v69 = swift_allocObject();
  *(_OWORD *)(v69 + 16) = v80;
  *(void *)(v69 + 32) = v68;
  type metadata accessor for ParameterStateStore();
  swift_allocObject();
  sub_234A97D20(v69);
  uint64_t v70 = (uint64_t)v77;
  sub_2349E68F4();
  return sub_23491E378(v70, v78, (uint64_t *)&unk_2687D3560);
}

void sub_234AD45D8(void *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7DA0);
  MEMORY[0x237DCBA80](&v5, v2);
  uint64_t v3 = v5;
  if (v5)
  {
    id v4 = sub_234AD4648();
  }
  else
  {
    id v4 = 0;
  }
  *a1 = v4;
}

id sub_234AD4648()
{
  id v1 = objc_msgSend(v0, sel_variable);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F86F00]), sel_initWithVariable_, v1);
  }
  else
  {
    id v4 = objc_msgSend(v0, sel_value);
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = objc_msgSend(v4, sel_number);

      if (v6)
      {
        objc_msgSend(v6, sel_BOOLValue);
      }
    }
    uint64_t v2 = (void *)sub_234B3B548();
    swift_bridgeObjectRelease();
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F86F00]), sel_initWithValue_, v2);
  }
  id v7 = v3;

  return v7;
}

uint64_t sub_234AD4754(void *a1)
{
  if (*a1 && (self, swift_dynamicCastObjCClass())) {
    sub_234AD4800();
  }
  else {
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F86948]), sel_initWithBoolValue_, 0);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7DA0);
  return sub_234B3AF48();
}

id sub_234AD4800()
{
  id v1 = objc_msgSend(v0, sel_variable);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F86948]), sel_initWithVariable_, v1);

    return v3;
  }
  else
  {
    id v5 = objc_msgSend(v0, sel_value);
    if (!v5)
    {
      sub_23491E3D4(0, (unint64_t *)&unk_2687D2030);
      id v5 = (id)sub_234B3BCF8();
    }
    uint64_t v6 = sub_234B3B588();
    uint64_t v8 = v7;

    if (v6 == 1702195828 && v8 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      char v10 = 1;
    }
    else
    {
      char v10 = sub_234B3C288();
      swift_bridgeObjectRelease();
    }
    id v11 = objc_allocWithZone(MEMORY[0x263F86948]);
    return objc_msgSend(v11, sel_initWithBoolValue_, v10 & 1);
  }
}

uint64_t sub_234AD4958@<X0>(uint64_t a1@<X8>)
{
  return sub_234AD3DD4(*(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t sub_234AD4964@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  id v55 = a4;
  uint64_t v54 = a3;
  uint64_t v53 = a2;
  uint64_t v57 = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D37B0);
  MEMORY[0x270FA5388](v6 - 8);
  id v56 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7D48);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_234B6B870;
  uint64_t v9 = (void *)*MEMORY[0x263F87350];
  uint64_t v10 = MEMORY[0x263F8D310];
  *(void *)(inited + 32) = *MEMORY[0x263F87350];
  *(void *)(inited + 40) = 0x656C626169726176;
  *(void *)(inited + 48) = 0xE800000000000000;
  id v11 = (void *)*MEMORY[0x263F87300];
  *(void *)(inited + 64) = v10;
  *(void *)(inited + 72) = v11;
  uint64_t v51 = inited;
  sub_23491E3D4(0, (unint64_t *)&unk_2687D7D50);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v13 = v9;
  id v14 = v11;
  id v15 = objc_msgSend(ObjCClassFromMetadata, sel_allInsertableVariableTypes);
  type metadata accessor for WFVariableType(0);
  sub_234AD5930((uint64_t)&qword_2687CEC10);
  uint64_t v16 = sub_234B3B8F8();

  uint64_t v52 = a1;
  uint64_t v17 = sub_234ADEF48(a1, v16);
  uint64_t v18 = *(void *)(v17 + 16);
  if (v18)
  {
    *(void *)&long long v59 = MEMORY[0x263F8EE78];
    sub_234952608();
    uint64_t v19 = v59;
    uint64_t result = sub_234AD9A2C(v17);
    uint64_t v21 = result;
    uint64_t v23 = v22;
    char v25 = v24 & 1;
    *(void *)&long long v58 = v17 + 56;
    while ((v21 & 0x8000000000000000) == 0 && v21 < 1 << *(unsigned char *)(v17 + 32))
    {
      if (((*(void *)(v58 + (((unint64_t)v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
        goto LABEL_14;
      }
      if (*(_DWORD *)(v17 + 36) != v23) {
        goto LABEL_15;
      }
      uint64_t v26 = sub_234B3B588();
      uint64_t v28 = v27;
      *(void *)&long long v59 = v19;
      unint64_t v29 = *(void *)(v19 + 16);
      if (v29 >= *(void *)(v19 + 24) >> 1)
      {
        sub_234952608();
        uint64_t v19 = v59;
      }
      *(void *)(v19 + 16) = v29 + 1;
      uint64_t v30 = v19 + 16 * v29;
      *(void *)(v30 + 32) = v26;
      *(void *)(v30 + 40) = v28;
      uint64_t result = sub_234AD9944(v21, v23, v25 & 1, v17);
      uint64_t v21 = result;
      uint64_t v23 = v31;
      char v25 = v32 & 1;
      if (!--v18)
      {
        sub_234967CD4(result, v31, v32 & 1);
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = MEMORY[0x263F8EE78];
LABEL_12:
    sub_23491E3D4(0, (unint64_t *)&unk_2687D1BC0);
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7F20);
    uint64_t v34 = v51;
    *(void *)(v51 + 104) = v33;
    *(void *)(v34 + 80) = v19;
    _s3__C3KeyVMa_0(0);
    sub_234AD5930((uint64_t)&qword_2687D7D60);
    sub_234B3B3D8();
    id v35 = sub_23499C1A0();
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F86FB8]), sel_initWithDefinition_, v35);

    sub_234B3B878();
    id v36 = v55;
    id v37 = v55;
    uint64_t v38 = v52;
    swift_bridgeObjectRetain();
    uint64_t v39 = v53;
    swift_retain();
    uint64_t v40 = v54;
    swift_retain();
    uint64_t v41 = sub_234B3B868();
    id v42 = (void *)swift_allocObject();
    uint64_t v43 = MEMORY[0x263F8F500];
    v42[2] = v41;
    v42[3] = v43;
    v42[4] = v38;
    v42[5] = v39;
    v42[6] = v40;
    v42[7] = v36;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    id v44 = v37;
    uint64_t v45 = sub_234B3B868();
    uint64_t v46 = (void *)swift_allocObject();
    v46[2] = v45;
    v46[3] = v43;
    v46[4] = v38;
    v46[5] = v39;
    v46[6] = v40;
    v46[7] = v36;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687D1BD0);
    sub_234B3AF98();
    long long v58 = v59;
    uint64_t v47 = v60;
    type metadata accessor for BindingParameterStateDataSource();
    uint64_t v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = v58;
    *(void *)(v48 + 32) = v47;
    type metadata accessor for ParameterStateStore();
    swift_allocObject();
    sub_234A97D20(v48);
    uint64_t v49 = (uint64_t)v56;
    sub_2349E6AE0();
    return sub_23491E378(v49, v57, (uint64_t *)&unk_2687D37B0);
  }
  return result;
}

void *sub_234AD4ED0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7DA8);
  uint64_t result = MEMORY[0x237DCBA80](&v4, v2);
  *a1 = v4;
  return result;
}

uint64_t sub_234AD4F20(void *a1)
{
  if (*a1)
  {
    self;
    if (swift_dynamicCastObjCClass()) {
      swift_unknownObjectRetain();
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7DA8);
  return sub_234B3AF48();
}

uint64_t sub_234AD4FC0@<X0>(uint64_t a1@<X8>)
{
  return sub_234AD4964(*(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t sub_234AD4FCC()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for CollectionPropertyListItemConfiguration()
{
  return self;
}

uint64_t sub_234AD5028()
{
  sub_234B3BD78();
  uint64_t v0 = sub_234B3AFD8();
  MEMORY[0x237DCBA80](&v2, v0);
  return v2;
}

uint64_t sub_234AD5084()
{
  return sub_234B3AF48();
}

uint64_t sub_234AD50E4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CollectionPropertyListItemConfiguration();
  uint64_t result = sub_234B391E8();
  *a1 = result;
  return result;
}

uint64_t destroy for PropertyListValueEditorView(uint64_t a1)
{
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PropertyListValueEditorView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v5 = (void *)a2[2];
  uint64_t v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  swift_retain();
  swift_retain();
  id v6 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PropertyListValueEditorView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PropertyListValueEditorView(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_release();

  *(_OWORD *)(a1 + 16) = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PropertyListValueEditorView()
{
  return &type metadata for PropertyListValueEditorView;
}

uint64_t sub_234AD52B4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_234AD52D0()
{
  unint64_t result = qword_2687D7BF8;
  if (!qword_2687D7BF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D7B68);
    sub_234AD57F8((uint64_t)&unk_2687D7C00);
    sub_234AD53DC((uint64_t)&unk_2687D7C10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D7BF8);
  }
  return result;
}

unint64_t sub_234AD5390()
{
  unint64_t result = qword_2687D7C08;
  if (!qword_2687D7C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D7C08);
  }
  return result;
}

unint64_t sub_234AD53DC(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_36_0(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    sub_23493A4EC(v5);
    sub_234AD5930((uint64_t)&unk_2687D0040);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_234AD54A8()
{
  unint64_t result = qword_2687D7C28;
  if (!qword_2687D7C28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D7B40);
    sub_234AD53DC((uint64_t)&unk_2687D7BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D7C28);
  }
  return result;
}

unint64_t sub_234AD5544()
{
  return sub_234AD5580((uint64_t)&unk_2687D7C30);
}

unint64_t sub_234AD5580(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_36_0(a1);
  if (!result)
  {
    id v6 = v5;
    uint64_t v7 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v7();
    v6();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_234AD5604()
{
  unint64_t result = qword_2687D7C38;
  if (!qword_2687D7C38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D7BB8);
    sub_234AD57F8((uint64_t)&unk_2687D7C40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D7C38);
  }
  return result;
}

unint64_t sub_234AD569C()
{
  unint64_t result = qword_2687D7C48;
  if (!qword_2687D7C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D7C48);
  }
  return result;
}

unint64_t sub_234AD56E8()
{
  unint64_t result = qword_2687D7C50;
  if (!qword_2687D7C50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D7B90);
    sub_234AD57F8((uint64_t)&unk_2687D7C58);
    sub_234AD57F8((uint64_t)&unk_2687D7C68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D7C50);
  }
  return result;
}

unint64_t sub_234AD57AC()
{
  unint64_t result = qword_2687D7C60;
  if (!qword_2687D7C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D7C60);
  }
  return result;
}

unint64_t sub_234AD57F8(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_36_0(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    sub_234AD5930((uint64_t)&unk_2687D0040);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_234AD58A8()
{
  unint64_t result = qword_2687D7C70;
  if (!qword_2687D7C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D7C70);
  }
  return result;
}

unint64_t sub_234AD58F4()
{
  return sub_234AD5580((uint64_t)&unk_2687D7C78);
}

unint64_t sub_234AD5930(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_36_0(a1);
  if (!result)
  {
    v4(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_234AD5974(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  sub_2349335A4();
  sub_2349335A4();
  return a1;
}

uint64_t sub_234AD5A30(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void **)(a1 + 48);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  sub_2349335A4();
  return a1;
}

uint64_t sub_234AD5AC0()
{
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_234AD5B08()
{
  return sub_234AD3678(v0[2], v0[3], v0[4]);
}

uint64_t sub_234AD5B14(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_release();
}

void *sub_234AD5B68(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v6 = v4;
  swift_retain();
  return a1;
}

void *sub_234AD5BD4(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a1[3];
  uint64_t v5 = (void *)a2[3];
  a1[3] = v5;
  id v6 = v5;

  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  return a1;
}

uint64_t sub_234AD5C80(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  uint64_t v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t sub_234AD5CF0(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_234AD5D30(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for CollectionValueEditor()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for VariableValueEditor()
{
  return &type metadata for VariableValueEditor;
}

void _s14WorkflowEditor19VariableValueEditorVwxx_0(uint64_t a1)
{
  OUTLINED_FUNCTION_36_0(a1);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(v1 + 24);
}

void *initializeWithCopy for VariableConfigurationCoercionPickerView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v5 = v4;
  return a1;
}

void *_s14WorkflowEditor19VariableValueEditorVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a1[3];
  id v5 = (void *)a2[3];
  a1[3] = v5;
  id v6 = v5;

  return a1;
}

uint64_t assignWithTake for VariableConfigurationCoercionPickerView(uint64_t a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *a2;
  swift_release();
  swift_release();
  uint64_t v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  return a1;
}

ValueMetadata *type metadata accessor for BooleanValueEditor()
{
  return &type metadata for BooleanValueEditor;
}

uint64_t destroy for StringValueEditor(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  return sub_2349335A4();
}

uint64_t initializeWithCopy for StringValueEditor(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v7 = *(void **)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a2 + 64);
  char v9 = *(unsigned char *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v10 = v4;
  swift_retain();
  swift_retain();
  id v11 = v7;
  sub_234933458();
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = v8;
  *(unsigned char *)(a1 + 72) = v9;
  return a1;
}

uint64_t assignWithCopy for StringValueEditor(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = v2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)v2[3];
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  *(void *)(a1 + 32) = v2[4];
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = v2[5];
  swift_retain();
  swift_release();
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = (void *)v2[6];
  *(void *)(a1 + 48) = v8;
  id v9 = v8;

  uint64_t v10 = v2[7];
  uint64_t v11 = v2[8];
  LOBYTE(v2) = *((unsigned char *)v2 + 72);
  sub_234933458();
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(unsigned char *)(a1 + 72) = (_BYTE)v2;
  sub_2349335A4();
  return a1;
}

uint64_t assignWithTake for StringValueEditor(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  swift_release();
  uint64_t v4 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  char v5 = *(unsigned char *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 72) = v5;
  sub_2349335A4();
  return a1;
}

ValueMetadata *type metadata accessor for StringValueEditor()
{
  return &type metadata for StringValueEditor;
}

unint64_t sub_234AD61EC()
{
  return sub_234AD5580((uint64_t)&unk_2687D7D30);
}

uint64_t sub_234AD623C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_234AD6258()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_234AD6274()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_234AD6290()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_234AD62D4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7D48);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_234B6B870;
  uint64_t v2 = (void *)*MEMORY[0x263F87350];
  uint64_t v3 = MEMORY[0x263F8D310];
  *(void *)(inited + 32) = *MEMORY[0x263F87350];
  *(void *)(inited + 40) = 0x656C626169726176;
  *(void *)(inited + 48) = 0xE800000000000000;
  uint64_t v4 = (void *)*MEMORY[0x263F87300];
  *(void *)(inited + 64) = v3;
  *(void *)(inited + 72) = v4;
  sub_23491E3D4(0, (unint64_t *)&unk_2687D7D50);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v6 = v2;
  id v7 = v4;
  id v8 = objc_msgSend(ObjCClassFromMetadata, sel_allInsertableVariableTypes);
  type metadata accessor for WFVariableType(0);
  sub_234AD5930((uint64_t)&qword_2687CEC10);
  uint64_t v9 = sub_234B3B8F8();

  uint64_t v10 = sub_234ADEF48(*v0, v9);
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    uint64_t v28 = inited;
    uint64_t v29 = MEMORY[0x263F8EE78];
    sub_234952608();
    uint64_t v12 = v29;
    uint64_t result = sub_234AD9A2C(v10);
    uint64_t v14 = result;
    uint64_t v16 = v15;
    char v18 = v17 & 1;
    while ((v14 & 0x8000000000000000) == 0 && v14 < 1 << *(unsigned char *)(v10 + 32))
    {
      if (((*(void *)(v10 + 56 + (((unint64_t)v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
        goto LABEL_14;
      }
      if (*(_DWORD *)(v10 + 36) != v16) {
        goto LABEL_15;
      }
      uint64_t v19 = sub_234B3B588();
      uint64_t v21 = v20;
      unint64_t v22 = *(void *)(v29 + 16);
      if (v22 >= *(void *)(v29 + 24) >> 1) {
        sub_234952608();
      }
      *(void *)(v29 + 16) = v22 + 1;
      uint64_t v23 = v29 + 16 * v22;
      *(void *)(v23 + 32) = v19;
      *(void *)(v23 + 40) = v21;
      uint64_t result = sub_234AD9944(v14, v16, v18 & 1, v10);
      uint64_t v14 = result;
      uint64_t v16 = v24;
      char v18 = v25 & 1;
      if (!--v11)
      {
        sub_234967CD4(result, v24, v25 & 1);
        swift_bridgeObjectRelease();
        uint64_t inited = v28;
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_12:
    sub_23491E3D4(0, (unint64_t *)&unk_2687D1BC0);
    *(void *)(inited + 104) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7F20);
    *(void *)(inited + 80) = v12;
    _s3__C3KeyVMa_0(0);
    sub_234AD5930((uint64_t)&qword_2687D7D60);
    sub_234B3B3D8();
    id v26 = sub_23499C1A0();
    id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F86FB8]), sel_initWithDefinition_, v26);

    return (uint64_t)v27;
  }
  return result;
}

uint64_t sub_234AD6634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D3560);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_234AD62D4();
  uint64_t v7 = *v2;
  long long v27 = *(_OWORD *)(v2 + 1);
  uint64_t v28 = v2[3];
  uint64_t v30 = v27;
  uint64_t v31 = v7;
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = sub_234B3BD78();
  (*(void (**)(id *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 32))(&v29, &v28, v9);
  uint64_t v10 = v2[4];
  v21[1] = v2[5];
  sub_234B3B878();
  sub_23494D470((uint64_t)&v31);
  swift_retain();
  sub_234967DE4((uint64_t)&v30);
  sub_234967E10(&v29);
  swift_retain();
  uint64_t v11 = sub_234B3B868();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v13;
  *(void *)(v12 + 32) = v8;
  long long v14 = *((_OWORD *)v2 + 1);
  *(_OWORD *)(v12 + 40) = *(_OWORD *)v2;
  *(_OWORD *)(v12 + 56) = v14;
  *(_OWORD *)(v12 + 72) = *((_OWORD *)v2 + 2);
  sub_23494D470((uint64_t)&v31);
  swift_retain();
  sub_234967DE4((uint64_t)&v30);
  sub_234967E10(&v29);
  swift_retain();
  uint64_t v15 = sub_234B3B868();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = v13;
  *(void *)(v16 + 32) = v8;
  long long v17 = *((_OWORD *)v2 + 1);
  *(_OWORD *)(v16 + 40) = *(_OWORD *)v2;
  *(_OWORD *)(v16 + 56) = v17;
  *(_OWORD *)(v16 + 72) = *((_OWORD *)v2 + 2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D1BD0);
  sub_234B3AF98();
  long long v22 = v25;
  uint64_t v18 = v26;
  type metadata accessor for BindingParameterStateDataSource();
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = v22;
  *(void *)(v19 + 32) = v18;
  type metadata accessor for ParameterStateStore();
  swift_allocObject();
  sub_234A97D20(v19);
  sub_234AD6B00();
  if (v10)
  {
    swift_retain();
    sub_2349E68F4();
    return sub_23491E378((uint64_t)v6, v24, (uint64_t *)&unk_2687D3560);
  }
  else
  {
    type metadata accessor for CollectionPropertyListItemConfiguration();
    sub_234AD5930((uint64_t)&unk_2687D7C80);
    uint64_t result = sub_234B39948();
    __break(1u);
  }
  return result;
}

uint64_t sub_234AD696C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CollectionValueEditor();
  uint64_t result = sub_234AD5028();
  *a1 = result;
  return result;
}

uint64_t sub_234AD69A4(void *a1)
{
  if (!*a1)
  {
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF8C0]), sel_init);
    objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithValue_, v5);

LABEL_9:
    type metadata accessor for CollectionValueEditor();
    return sub_234AD5084();
  }
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (!v1)
  {
    if (swift_dynamicCastUnknownClass()) {
      swift_unknownObjectRetain();
    }
    goto LABEL_9;
  }
  uint64_t v2 = (void *)v1;
  swift_unknownObjectRetain();
  id v3 = objc_msgSend(v2, sel_variable);
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithVariable_, v3);

  type metadata accessor for CollectionValueEditor();
  sub_234AD5084();
  return swift_unknownObjectRelease();
}

uint64_t sub_234AD6B00()
{
  uint64_t v0 = sub_234AD5028();
  if (v0)
  {
    uint64_t v1 = (void *)v0;
    self;
    uint64_t v2 = (void *)swift_dynamicCastObjCClass();
    if (v2)
    {
      id v3 = objc_msgSend(v2, sel_values);
      uint64_t v4 = &qword_2687D7D40;
LABEL_8:
      sub_23491E3D4(0, v4);
      unint64_t v7 = sub_234B3B718();

      if (v7 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = sub_234B3C1B8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      uint64_t v9 = sub_234A3BD14(v8);

      return v9;
    }
  }
  uint64_t v5 = sub_234AD5028();
  if (v5)
  {
    uint64_t v1 = (void *)v5;
    self;
    id v6 = (void *)swift_dynamicCastObjCClass();
    if (v6)
    {
      id v3 = objc_msgSend(v6, sel_keyValuePairs);
      uint64_t v4 = (unint64_t *)&unk_2687D02C0;
      goto LABEL_8;
    }
  }
  return sub_234A3BD14(0);
}

uint64_t sub_234AD6C78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_234AD6634(a1, a2);
}

uint64_t sub_234AD6CB8@<X0>(uint64_t *a1@<X8>)
{
  return sub_234AD696C(a1);
}

uint64_t objectdestroy_9Tm_2()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_234AD6D2C(void *a1)
{
  return sub_234AD69A4(a1);
}

uint64_t sub_234AD6D40()
{
  return sub_234AD3A8C();
}

uint64_t sub_234AD6D48(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  id v3 = *(id *)(a1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v4 = v2;
  swift_retain();
  swift_retain();
  sub_234933458();
  return a1;
}

uint64_t objectdestroy_15Tm()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  sub_2349335A4();
  return swift_deallocObject();
}

uint64_t sub_234AD6E48()
{
  return sub_234AD3BD4(v0 + 16);
}

unint64_t sub_234AD6E50()
{
  unint64_t result = qword_2687D7D78;
  if (!qword_2687D7D78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D7D68);
    sub_234AD6EC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D7D78);
  }
  return result;
}

unint64_t sub_234AD6EC4()
{
  unint64_t result = qword_2687D7D80;
  if (!qword_2687D7D80)
  {
    sub_23491E3D4(255, (unint64_t *)&unk_2687D3B98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D7D80);
  }
  return result;
}

uint64_t sub_234AD6F28()
{
  return sub_234AD6F78((uint64_t (*)(void, void, void, void, void, void))sub_234AD45D8);
}

uint64_t sub_234AD6F44(uint64_t a1)
{
  return sub_234AD7004(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_234AD4754);
}

uint64_t sub_234AD6F60()
{
  return sub_234AD6F78((uint64_t (*)(void, void, void, void, void, void))sub_234AD4ED0);
}

uint64_t sub_234AD6F78(uint64_t (*a1)(void, void, void, void, void, void))
{
  return a1(v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t objectdestroy_21Tm_1()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_234AD6FEC(uint64_t a1)
{
  return sub_234AD7004(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_234AD4F20);
}

uint64_t sub_234AD7004(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

unint64_t sub_234AD701C()
{
  return sub_23493A4EC((uint64_t)&unk_2687D7DB0);
}

uint64_t sub_234AD7058()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_234AD70C8()
{
  return sub_23493A4EC((uint64_t)&unk_2687D7DB0);
}

unint64_t sub_234AD7104()
{
  return sub_23493A4EC((uint64_t)&unk_2687D7DB8);
}

uint64_t OUTLINED_FUNCTION_0_23@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_29()
{
  sub_234AD5544();
  sub_234AD58F4();
  return sub_234B39F88();
}

uint64_t OUTLINED_FUNCTION_4_24()
{
  *(void *)(v3 - 296) = v1;
  *(void *)(v3 - 288) = v0;
  *(void *)(v3 - 280) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_5_26()
{
  return sub_234B39F88();
}

uint64_t OUTLINED_FUNCTION_6_27@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a2 - 256);
  return sub_23491B7A8(a1, v4, v2);
}

uint64_t OUTLINED_FUNCTION_8_27()
{
  uint64_t v2 = *(void *)(v0 - 192);
  uint64_t v3 = *(void *)(v0 - 184);
  uint64_t v4 = *(void **)(v0 - 176);
  return sub_234A0B9A8(v2, v3, v4);
}

uint64_t OUTLINED_FUNCTION_9_23()
{
  return sub_234B3AF68();
}

uint64_t OUTLINED_FUNCTION_10_21()
{
  return sub_234B3AF78();
}

void OUTLINED_FUNCTION_11_21()
{
  *(void *)(v3 - 192) = v1;
  *(void *)(v3 - 184) = v0;
  *(void *)(v3 - 176) = v2;
  JUMPOUT(0x237DCBA80);
}

uint64_t OUTLINED_FUNCTION_13_21()
{
  return sub_234B39F88();
}

uint64_t OUTLINED_FUNCTION_14_21()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_15_16()
{
  *(void *)(v3 - 296) = v1;
  *(void *)(v3 - 288) = v0;
  *(void *)(v3 - 280) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_16_17()
{
  return sub_234B3AF68();
}

uint64_t OUTLINED_FUNCTION_17_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_16()
{
  return swift_storeEnumTagMultiPayload();
}

id OUTLINED_FUNCTION_20_13()
{
  uint64_t v3 = *(void **)(v1 - 296);
  return [v3 (SEL)(v0 + 2072)];
}

uint64_t OUTLINED_FUNCTION_21_11()
{
  return sub_234B3A968();
}

void OUTLINED_FUNCTION_23_9()
{
  *(void *)(v3 - 296) = v0;
  *(void *)(v3 - 288) = v1;
  *(void *)(v3 - 280) = v2;
}

void OUTLINED_FUNCTION_24_8()
{
  *(void *)(v3 - 296) = v0;
  *(void *)(v3 - 288) = v1;
  *(void *)(v3 - 280) = v2;
}

uint64_t OUTLINED_FUNCTION_25_9(uint64_t a1)
{
  return sub_23491B7A8(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_28_10()
{
  return sub_234B39F88();
}

uint64_t OUTLINED_FUNCTION_29_9()
{
  uint64_t v2 = *(void *)(v0 - 192);
  uint64_t v3 = *(void *)(v0 - 184);
  uint64_t v4 = *(void **)(v0 - 176);
  return sub_234A0B9A8(v2, v3, v4);
}

id OUTLINED_FUNCTION_30_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  return sub_234AD35A4(v6, v9, v8, a4, a5, a6, v7, v10 - 192);
}

uint64_t OUTLINED_FUNCTION_31_8()
{
  return sub_234915B14(v1, v0);
}

uint64_t sub_234AD74F4(unint64_t a1)
{
  uint64_t v7 = MEMORY[0x263F8EE78];
  uint64_t v2 = a1 >> 62;
  if (a1 >> 62) {
    goto LABEL_16;
  }
  while (1)
  {
    sub_234B3C088();
    if (v2) {
      break;
    }
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      return v7;
    }
LABEL_6:
    for (uint64_t i = 4; ; ++i)
    {
      uint64_t v2 = i - 4;
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x237DCCB60](i - 4, a1);
      }
      else {
        swift_unknownObjectRetain();
      }
      uint64_t v5 = i - 3;
      if (__OFADD__(v2, 1)) {
        break;
      }
      self;
      OUTLINED_FUNCTION_2_29();
      if (!swift_dynamicCastObjCClass())
      {
        swift_unknownObjectRelease();
        swift_release();
        return 0;
      }
      sub_234B3C058();
      sub_234B3C098();
      sub_234B3C0A8();
      sub_234B3C068();
      if (v5 == v3) {
        return v7;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    sub_234B3C1B8();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_234B3C1B8();
  swift_bridgeObjectRelease();
  if (v3) {
    goto LABEL_6;
  }
  return v7;
}

uint64_t sub_234AD767C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    sub_234952568();
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v8;
    do
    {
      swift_bridgeObjectRetain_n();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D2AA0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687D3BB0);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_234952568();
        uint64_t v2 = v8;
      }
      unint64_t v5 = *(void *)(v2 + 16);
      if (v5 >= *(void *)(v2 + 24) >> 1)
      {
        sub_234952568();
        uint64_t v2 = v8;
      }
      *(void *)(v2 + 16) = v5 + 1;
      *(void *)(v2 + 8 * v5 + 32) = v7;
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_234AD77C0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_2349528A8(0, v1, 0);
    uint64_t v2 = v9;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2349528A8(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_2349528A8(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      *(void *)(v2 + 16) = v6 + 1;
      sub_234964030(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_234AD78E8(uint64_t a1)
{
  uint64_t v1 = a1 + 56;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 56);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  uint64_t v7 = MEMORY[0x263F8EE78];
  while (v4)
  {
    v4 &= v4 - 1;
LABEL_22:
    id v11 = (id)CNContactPropertyKeyFromWFContactPropertyID();
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v19 = sub_234B3B588();
      uint64_t v14 = v13;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2349D1930();
        uint64_t v7 = v17;
      }
      unint64_t v15 = *(void *)(v7 + 16);
      if (v15 >= *(void *)(v7 + 24) >> 1)
      {
        sub_2349D1930();
        uint64_t v7 = v18;
      }
      *(void *)(v7 + 16) = v15 + 1;
      uint64_t v16 = v7 + 16 * v15;
      *(void *)(v16 + 32) = v19;
      *(void *)(v16 + 40) = v14;
    }
  }
  int64_t v8 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v8 >= v5) {
    goto LABEL_28;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v8);
  ++v6;
  if (v9) {
    goto LABEL_21;
  }
  int64_t v6 = v8 + 1;
  if (v8 + 1 >= v5) {
    goto LABEL_28;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v6);
  if (v9) {
    goto LABEL_21;
  }
  int64_t v6 = v8 + 2;
  if (v8 + 2 >= v5) {
    goto LABEL_28;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v6);
  if (v9) {
    goto LABEL_21;
  }
  int64_t v6 = v8 + 3;
  if (v8 + 3 >= v5) {
    goto LABEL_28;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v6);
  if (v9)
  {
LABEL_21:
    uint64_t v4 = (v9 - 1) & v9;
    goto LABEL_22;
  }
  int64_t v10 = v8 + 4;
  if (v10 >= v5)
  {
LABEL_28:
    swift_release();
    return;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v10);
  if (v9)
  {
    int64_t v6 = v10;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v6 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v6 >= v5) {
      goto LABEL_28;
    }
    uint64_t v9 = *(void *)(v1 + 8 * v6);
    ++v10;
    if (v9) {
      goto LABEL_21;
    }
  }
LABEL_30:
  __break(1u);
}

uint64_t sub_234AD7AE0()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = qword_2687CF4C0;
  if (!objc_msgSend(*(id *)(v1 + qword_2687CF4C0), sel_allowsMultipleValues))
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEBE0]), sel_init);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7EB0);
    sub_234B3A3C8();
    objc_msgSend(v3, sel_setDelegate_, v36);

    id v22 = *(id *)(v1 + v2);
    uint64_t v23 = sub_23491CD94();
    sub_234AD78E8(v23);
    uint64_t v25 = v24;

    swift_bridgeObjectRelease();
    if ((WFCNContactIsAuthorizedToAccessContact() & 1) != 0 || *(void *)(v25 + 16)) {
      sub_234AD98E4(v25, v3);
    }
    sub_234AD77C0(v25);
    uint64_t v26 = (void *)sub_234B3B6F8();
    swift_bridgeObjectRelease();
    id v27 = (id)WFPredicateForEnablingPerson();

    objc_msgSend(v3, sel_setPredicateForEnablingContact_, v27);
    sub_234AD77C0(v25);
    swift_bridgeObjectRelease();
    uint64_t v28 = (void *)sub_234B3B6F8();
    swift_bridgeObjectRelease();
    id v29 = (id)WFPredicateForSelectionOfPerson();

    objc_msgSend(v3, sel_setPredicateForSelectionOfContact_, v29);
    if (objc_msgSend(v3, sel_respondsToSelector_, sel__prepareViewController)) {
      objc_msgSend(v3, sel__prepareViewController);
    }
    return (uint64_t)v3;
  }
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_init);
  objc_msgSend(v3, sel_setModalPresentationStyle_, 2);
  id v4 = objc_msgSend(objc_allocWithZone((Class)WFRecipientFieldViewController), sel_init);
  long long v37 = *(_OWORD *)(v0 + 16);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687CF5E0);
  MEMORY[0x237DCBA80](v39, v5);
  if (v39[0])
  {
    id v6 = v39[0];
    unint64_t v7 = sub_234AD9878(v6);
    if (v7)
    {
      uint64_t v8 = sub_234AD74F4(v7);
      swift_bridgeObjectRelease();
      if (v8)
      {
        sub_23491E3D4(0, (unint64_t *)&unk_2687D0D50);
        uint64_t v9 = sub_234B3B6F8();
        swift_bridgeObjectRelease();
        objc_msgSend(v4, sel_setEntries_, v9);

        id v6 = (id)v9;
      }
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7EB0);
  sub_234B3A3C8();
  objc_msgSend(v4, sel_setDelegate_, (void)v37);

  id v10 = *(id *)(v1 + v2);
  uint64_t v11 = sub_23491CD94();

  uint64_t v12 = *(void *)(v11 + 16);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    unint64_t v21 = MEMORY[0x263F8EE78];
LABEL_21:
    sub_234ADE340(v21);
    sub_23491E3D4(0, &qword_2687D6360);
    sub_234967E88();
    uint64_t v30 = (void *)sub_234B3B8E8();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setSupportedPersonProperties_, v30);

    objc_msgSend(v4, sel_setAllowsCustomHandles_, objc_msgSend(*(id *)(v1 + v2), sel_allowsCustomHandles));
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687CF5D0);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_234B6BBE0;
    *(void *)(v31 + 32) = v4;
    sub_234B3B748();
    sub_23491E3D4(0, (unint64_t *)&qword_2687D7EB8);
    id v32 = v4;
    uint64_t v33 = (void *)sub_234B3B6F8();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setViewControllers_, v33);

    return (uint64_t)v3;
  }
  uint64_t v34 = v2;
  id v35 = v3;
  unint64_t v38 = MEMORY[0x263F8EE78];
  sub_234B3C088();
  uint64_t result = sub_234AD9ACC(v11);
  int64_t v14 = result;
  int v16 = v15;
  char v18 = v17 & 1;
  while ((v14 & 0x8000000000000000) == 0 && v14 < 1 << *(unsigned char *)(v11 + 32))
  {
    if (((*(void *)(v11 + 56 + (((unint64_t)v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
      goto LABEL_24;
    }
    if (*(_DWORD *)(v11 + 36) != v16) {
      goto LABEL_25;
    }
    objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInt_, *(unsigned int *)(*(void *)(v11 + 48) + 4 * v14));
    sub_234B3C058();
    sub_234B3C098();
    sub_234B3C0A8();
    sub_234B3C068();
    uint64_t result = sub_234AD9948(v14, v16, v18 & 1, v11);
    int64_t v14 = result;
    int v16 = v19;
    char v18 = v20 & 1;
    if (!--v12)
    {
      sub_234967CD4(result, v19, v20 & 1);
      unint64_t v21 = v38;
      swift_bridgeObjectRelease();
      id v3 = v35;
      uint64_t v2 = v34;
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

id sub_234AD8058()
{
  uint64_t v2 = type metadata accessor for ContactPickerView(0);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_16_3();
  type metadata accessor for ContactPickerView.Coordinator(0);
  sub_234AD9814(v1, v0);
  return sub_234AD80D8(v0);
}

id sub_234AD80D8(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  sub_234AD9814(a1, (uint64_t)v3 + OBJC_IVAR____TtCV14WorkflowEditor17ContactPickerView11Coordinator_parent);
  v6.receiver = v3;
  v6.super_class = v1;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  sub_234AD9A70(a1);
  return v4;
}

uint64_t sub_234AD814C()
{
  uint64_t v1 = sub_234B398B8();
  MEMORY[0x270FA5388](v1 - 8);
  OUTLINED_FUNCTION_16_3();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D0BE0);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_18();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = v0 + OBJC_IVAR____TtCV14WorkflowEditor17ContactPickerView11Coordinator_parent;
  uint64_t v8 = *(void (**)(uint64_t))(v0
                                      + OBJC_IVAR____TtCV14WorkflowEditor17ContactPickerView11Coordinator_parent
                                      + 48);
  if (v8)
  {
    uint64_t v9 = swift_retain();
    v8(v9);
    return sub_2349159D0((uint64_t)v8);
  }
  else
  {
    long long v11 = *(_OWORD *)(v7 + 80);
    v17[0] = *(_OWORD *)(v7 + 64);
    v17[1] = v11;
    char v18 = *(unsigned char *)(v7 + 96);
    sub_2349612A0((uint64_t)v17, (uint64_t)v19);
    sub_23491E32C((uint64_t)v19, (void (*)(void, void, void, void, void))sub_23491E320);
    sub_23497E740();
    uint64_t v13 = v12;
    int v15 = v14;
    uint64_t v16 = sub_23491E32C((uint64_t)v17, (void (*)(void, void, void, void, void))sub_23491E36C);
    if (v13)
    {
      v15(v16);
      swift_release();
      return swift_release();
    }
    else
    {
      type metadata accessor for ContactPickerView(0);
      sub_23497E8BC();
      MEMORY[0x237DCBA80](v2);
      sub_234B398A8();
      sub_234B3AF48();
      return sub_234915B14(v6, &qword_2687D0BE0);
    }
  }
}

uint64_t sub_234AD8394(uint64_t a1, void *a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtCV14WorkflowEditor17ContactPickerView11Coordinator_parent;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687CF5D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_234B6BBE0;
  *(void *)(inited + 32) = a2;
  uint64_t v10 = inited;
  sub_234B3B748();
  v9[2] = v4;
  id v6 = a2;
  unint64_t v7 = sub_23491D060((void (*)(char *))sub_23491E300, (uint64_t)v9, v10);
  sub_23491D500(v7);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_234AD84CC(uint64_t a1, void *a2)
{
  return sub_23491D930(a2);
}

uint64_t sub_234AD8570(void *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_234B398B8();
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_18();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D0BE0);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_18();
  uint64_t v11 = v10 - v9;
  type metadata accessor for ContactPickerView(0);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_18();
  uint64_t v15 = v14 - v13;
  char v31 = a2;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(a1, sel_commitRemainingText);
    id v16 = objc_msgSend(a1, sel_entries);
    sub_23491E3D4(0, (unint64_t *)&unk_2687D0D50);
    OUTLINED_FUNCTION_2_29();
    unint64_t v17 = sub_234B3B718();

    uint64_t v18 = v3 + OBJC_IVAR____TtCV14WorkflowEditor17ContactPickerView11Coordinator_parent;
    sub_234AD9814(v3 + OBJC_IVAR____TtCV14WorkflowEditor17ContactPickerView11Coordinator_parent, v15);
    objc_msgSend(*(id *)(*(void *)(v18 + 8) + qword_2687CF4C0), sel_multipleStateClass);
    swift_getObjCClassMetadata();
    sub_23491E3D4(0, &qword_2687CF5E8);
    OUTLINED_FUNCTION_2_29();
    if (swift_dynamicCastMetatype())
    {
      swift_bridgeObjectRetain();
      if (v17 >> 62)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2687CEDC0);
        OUTLINED_FUNCTION_2_29();
        sub_234B3C168();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_234B3C298();
      }
      swift_bridgeObjectRelease();
      id v19 = sub_234966DA0();
    }
    else
    {
      swift_bridgeObjectRelease();
      id v19 = 0;
    }
    uint64_t v20 = *(void *)(v15 + 32);
    long long v34 = *(_OWORD *)(v15 + 16);
    uint64_t v35 = v20;
    *(void *)&v32[0] = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687CF5E0);
    sub_234B3AF48();
    sub_234AD9A70(v15);
  }
  uint64_t v21 = v3 + OBJC_IVAR____TtCV14WorkflowEditor17ContactPickerView11Coordinator_parent;
  id v22 = *(void (**)(uint64_t))(v3
                                       + OBJC_IVAR____TtCV14WorkflowEditor17ContactPickerView11Coordinator_parent
                                       + 48);
  if (v22)
  {
    uint64_t v23 = swift_retain();
    v22(v23);
    return sub_2349159D0((uint64_t)v22);
  }
  else
  {
    long long v25 = *(_OWORD *)(v21 + 80);
    v32[0] = *(_OWORD *)(v21 + 64);
    v32[1] = v25;
    char v33 = *(unsigned char *)(v21 + 96);
    sub_2349612A0((uint64_t)v32, (uint64_t)&v34);
    sub_23491E32C((uint64_t)&v34, (void (*)(void, void, void, void, void))sub_23491E320);
    sub_23497E740();
    id v27 = v26;
    id v29 = v28;
    uint64_t v30 = sub_23491E32C((uint64_t)v32, (void (*)(void, void, void, void, void))sub_23491E36C);
    if (v27)
    {
      if (v31) {
        v29(v30);
      }
      else {
        v27(v30);
      }
      swift_release();
      return swift_release();
    }
    else
    {
      sub_23497E8BC();
      MEMORY[0x237DCBA80](v7);
      sub_234B398A8();
      sub_234B3AF48();
      return sub_234915B14(v11, &qword_2687D0BE0);
    }
  }
}

id sub_234AD8994()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContactPickerView.Coordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_234AD89DC()
{
  return type metadata accessor for ContactPickerView.Coordinator(0);
}

uint64_t type metadata accessor for ContactPickerView.Coordinator(uint64_t a1)
{
  return sub_23493EBA4(a1, (uint64_t *)&unk_2687D7E88);
}

uint64_t sub_234AD8A04()
{
  uint64_t result = type metadata accessor for ContactPickerView(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for ContactPickerView(uint64_t a1)
{
  return sub_23493EBA4(a1, (uint64_t *)&unk_2687D7E98);
}

void *sub_234AD8AB4(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = (void *)a2[4];
    uint64_t v10 = (void *)a2[5];
    a1[4] = v9;
    a1[5] = v10;
    uint64_t v12 = a2 + 6;
    uint64_t v11 = a2[6];
    id v13 = v7;
    swift_retain();
    swift_retain();
    id v14 = v9;
    id v15 = v10;
    if (v11)
    {
      uint64_t v16 = a2[7];
      v4[6] = v11;
      v4[7] = v16;
      swift_retain();
    }
    else
    {
      *((_OWORD *)v4 + 3) = *v12;
    }
    uint64_t v18 = a2[8];
    uint64_t v19 = a2[9];
    uint64_t v20 = a2[10];
    uint64_t v21 = a2[11];
    char v22 = *((unsigned char *)a2 + 96);
    sub_23491E320(v18, v19, v20, v21, v22);
    v4[8] = v18;
    v4[9] = v19;
    v4[10] = v20;
    v4[11] = v21;
    *((unsigned char *)v4 + 96) = v22;
    uint64_t v23 = *(int *)(a3 + 36);
    uint64_t v24 = (void *)((char *)v4 + v23);
    long long v25 = (uint64_t *)((char *)a2 + v23);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D0840);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *uint64_t v24 = *v25;
    if (EnumCaseMultiPayload == 1)
    {
      v24[1] = v25[1];
      swift_retain();
      swift_retain();
      uint64_t v27 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2687D0BE0) + 32);
      uint64_t v28 = (char *)v24 + v27;
      id v29 = (char *)v25 + v27;
      uint64_t v30 = sub_234B398B8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_234AD8CA4(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();

  if (*(void *)(a1 + 48)) {
    swift_release();
  }
  sub_23491E36C(*(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(unsigned char *)(a1 + 96));
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D0840);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v7 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2687D0BE0) + 32);
    uint64_t v8 = sub_234B398B8();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    return v9(v7, v8);
  }
  return result;
}

uint64_t sub_234AD8DB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void **)(a2 + 32);
  uint64_t v9 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  uint64_t v11 = (_OWORD *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 48);
  id v12 = v6;
  swift_retain();
  swift_retain();
  id v13 = v8;
  id v14 = v9;
  if (v10)
  {
    uint64_t v15 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v10;
    *(void *)(a1 + 56) = v15;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 48) = *v11;
  }
  uint64_t v16 = *(void *)(a2 + 64);
  uint64_t v17 = *(void *)(a2 + 72);
  uint64_t v18 = *(void *)(a2 + 80);
  uint64_t v19 = *(void *)(a2 + 88);
  char v20 = *(unsigned char *)(a2 + 96);
  sub_23491E320(v16, v17, v18, v19, v20);
  *(void *)(a1 + 64) = v16;
  *(void *)(a1 + 72) = v17;
  *(void *)(a1 + 80) = v18;
  *(void *)(a1 + 88) = v19;
  *(unsigned char *)(a1 + 96) = v20;
  uint64_t v21 = *(int *)(a3 + 36);
  char v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D0840);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *char v22 = *v23;
  if (EnumCaseMultiPayload == 1)
  {
    v22[1] = v23[1];
    swift_retain();
    swift_retain();
    uint64_t v25 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2687D0BE0) + 32);
    uint64_t v26 = (char *)v22 + v25;
    uint64_t v27 = (char *)v23 + v25;
    uint64_t v28 = sub_234B398B8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  }
  else
  {
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_234AD8F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v6;
  id v8 = v6;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v10;
  id v11 = v10;

  id v12 = *(void **)(a1 + 40);
  id v13 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v13;
  id v14 = v13;

  uint64_t v15 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48))
  {
    if (v15)
    {
      uint64_t v16 = *(void *)(a2 + 56);
      *(void *)(a1 + 48) = v15;
      *(void *)(a1 + 56) = v16;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v15)
  {
    uint64_t v17 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v15;
    *(void *)(a1 + 56) = v17;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
LABEL_8:
  uint64_t v18 = *(void *)(a2 + 64);
  uint64_t v19 = *(void *)(a2 + 72);
  uint64_t v20 = *(void *)(a2 + 80);
  uint64_t v21 = *(void *)(a2 + 88);
  char v22 = *(unsigned char *)(a2 + 96);
  sub_23491E320(v18, v19, v20, v21, v22);
  uint64_t v23 = *(void *)(a1 + 64);
  uint64_t v24 = *(void *)(a1 + 72);
  uint64_t v25 = *(void *)(a1 + 80);
  uint64_t v26 = *(void *)(a1 + 88);
  char v27 = *(unsigned char *)(a1 + 96);
  *(void *)(a1 + 64) = v18;
  *(void *)(a1 + 72) = v19;
  *(void *)(a1 + 80) = v20;
  *(void *)(a1 + 88) = v21;
  *(unsigned char *)(a1 + 96) = v22;
  sub_23491E36C(v23, v24, v25, v26, v27);
  if (a1 != a2)
  {
    uint64_t v28 = *(int *)(a3 + 36);
    id v29 = (void *)(a1 + v28);
    uint64_t v30 = (void *)(a2 + v28);
    sub_234915B14(a1 + v28, (uint64_t *)&unk_2687D0840);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D0840);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *id v29 = *v30;
    if (EnumCaseMultiPayload == 1)
    {
      v29[1] = v30[1];
      swift_retain();
      swift_retain();
      uint64_t v32 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2687D0BE0) + 32);
      char v33 = (char *)v29 + v32;
      long long v34 = (char *)v30 + v32;
      uint64_t v35 = sub_234B398B8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_234AD9170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  if (v6)
  {
    uint64_t v7 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v6;
    *(void *)(a1 + 56) = v7;
  }
  else
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  }
  long long v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v8;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v10 = (void *)(a1 + v9);
  id v11 = (void *)(a2 + v9);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D0840);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v13;
    uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2687D0BE0) + 32);
    uint64_t v15 = (char *)v10 + v14;
    uint64_t v16 = (char *)v11 + v14;
    uint64_t v17 = sub_234B398B8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  return a1;
}

uint64_t sub_234AD92A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  long long v8 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  uint64_t v9 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  uint64_t v10 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48))
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a2 + 56);
      *(void *)(a1 + 48) = v10;
      *(void *)(a1 + 56) = v11;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v10;
    *(void *)(a1 + 56) = v12;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
LABEL_8:
  char v13 = *(unsigned char *)(a2 + 96);
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 80);
  uint64_t v17 = *(void *)(a1 + 88);
  char v18 = *(unsigned char *)(a1 + 96);
  long long v19 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v19;
  *(unsigned char *)(a1 + 96) = v13;
  sub_23491E36C(v14, v15, v16, v17, v18);
  if (a1 != a2)
  {
    uint64_t v20 = *(int *)(a3 + 36);
    uint64_t v21 = (void *)(a1 + v20);
    char v22 = (void *)(a2 + v20);
    sub_234915B14(a1 + v20, (uint64_t *)&unk_2687D0840);
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D0840);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = v22[1];
      *uint64_t v21 = *v22;
      v21[1] = v24;
      uint64_t v25 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2687D0BE0) + 32);
      uint64_t v26 = (char *)v21 + v25;
      char v27 = (char *)v22 + v25;
      uint64_t v28 = sub_234B398B8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_234AD9478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_234AD948C);
}

uint64_t sub_234AD948C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D0850);
    uint64_t v9 = a1 + *(int *)(a3 + 36);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_234AD9518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_234AD952C);
}

uint64_t sub_234AD952C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D0850);
    uint64_t v8 = v5 + *(int *)(a4 + 36);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_234AD95B0()
{
  sub_234960E80();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

id sub_234AD9674@<X0>(void *a1@<X8>)
{
  id result = sub_234AD8058();
  *a1 = result;
  return result;
}

uint64_t sub_234AD969C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_234AD9A30((unint64_t *)&unk_2687D7EC0);
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_234AD971C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_234AD9A30((unint64_t *)&unk_2687D7EC0);
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_234AD979C()
{
}

uint64_t sub_234AD97E0()
{
  return sub_234AD9A30(&qword_2687D7EA8);
}

uint64_t sub_234AD9814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactPickerView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_234AD9878(void *a1)
{
  id v2 = objc_msgSend(a1, sel_parameterStates);

  if (!v2) {
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CEDC0);
  uint64_t v3 = sub_234B3B718();

  return v3;
}

void sub_234AD98E4(uint64_t a1, void *a2)
{
  id v3 = (id)sub_234B3B6F8();
  objc_msgSend(a2, sel_setDisplayedPropertyKeys_, v3);
}

int64_t sub_234AD9948(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (id result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    unint64_t v10 = *(void *)(v6 + 8 * v9);
    if (v10) {
      return __clz(__rbit64(v10)) + (v9 << 6);
    }
    unint64_t v11 = (unint64_t)(result + 63) >> 6;
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      unint64_t v10 = *(void *)(v6 + 8 * v9);
      if (v10) {
        return __clz(__rbit64(v10)) + (v9 << 6);
      }
      while (v5 + 3 < v11)
      {
        unint64_t v10 = *(void *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_234AD9A30(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ContactPickerView(255);
    OUTLINED_FUNCTION_2_29();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_234AD9A70(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ContactPickerView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_234AD9ACC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t OUTLINED_FUNCTION_2_29()
{
  return v0;
}

uint64_t sub_234AD9B58(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_234AD9B70(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t))sub_234ADBB94);
}

uint64_t sub_234AD9B70(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, unint64_t))
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_234B3C2A8();
  swift_unknownObjectRetain_n();
  uint64_t v11 = swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  uint64_t v12 = *(void *)(v11 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v12 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    uint64_t v10 = a5(a1, a2, a3, a4);
    goto LABEL_9;
  }
  uint64_t v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v10;
}

uint64_t WFContactFieldParameter.view(with:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D7ED0);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_19_2();
  uint64_t v4 = sub_234AD9E3C();
  uint64_t v6 = v5;
  sub_234B3B878();
  swift_retain();
  uint64_t v7 = sub_234B3B868();
  unint64_t v8 = (void *)OUTLINED_FUNCTION_11();
  uint64_t v9 = MEMORY[0x263F8F500];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = a1;
  swift_retain();
  id v10 = v1;
  uint64_t v11 = sub_234B3B868();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = v9;
  v12[4] = a1;
  v12[5] = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D66B0);
  sub_234B3AF98();
  id v13 = v10;
  swift_retain();
  id v14 = v13;
  sub_234A3A5B0((uint64_t)v14, v4, v6, 0, 0, 1, v18, v19, v20, (uint64_t)v14, a1, v16, v17, v18, v19, v20, v21, v22, v23,
    v24,
    v25,
    v26,
    v27);
  sub_2349158F4((unint64_t *)&unk_2687D7EE0, (uint64_t *)&unk_2687D7ED0);
  return sub_234B3AF28();
}

uint64_t sub_234AD9E3C()
{
  if (objc_msgSend(v0, sel_hidesLabel)) {
    return 0;
  }
  id v2 = objc_msgSend(v0, sel_localizedLabel);
  uint64_t v1 = sub_234B3B588();

  return v1;
}

uint64_t sub_234AD9EB4@<X0>(void *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_234B38998();
  if (!result) {
    goto LABEL_5;
  }
  self;
  uint64_t v3 = (void *)swift_dynamicCastObjCClass();
  if (!v3)
  {
    uint64_t result = swift_unknownObjectRelease();
LABEL_5:
    id v4 = 0;
    goto LABEL_6;
  }
  id v4 = objc_msgSend(v3, sel_variable);
  uint64_t result = swift_unknownObjectRelease();
LABEL_6:
  *a1 = v4;
  return result;
}

uint64_t sub_234AD9F4C@<X0>(void *a1@<X8>)
{
  return sub_234AD9EB4(a1);
}

void sub_234AD9F58(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (*a1)
  {
    id v6 = *a1;
    objc_msgSend(a5, sel_multipleStateClass);
    swift_getObjCClassMetadata();
    sub_23491E3D4(0, &qword_2687CF5E8);
    if (swift_dynamicCastMetatype()) {
      objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithVariable_, v6);
    }
    swift_getObjectType();
    sub_234B389A8();
  }
  else
  {
    swift_getObjectType();
    sub_234B389A8();
  }
}

uint64_t sub_234ADA064()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

void sub_234ADA0AC(id *a1)
{
  sub_234AD9F58(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_234ADA0B8(void *a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D35E0);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7F28);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_19_2();
  if (sub_234ADA3B8())
  {
    sub_234B3B878();
    id v9 = a1;
    swift_retain();
    uint64_t v10 = sub_234B3B868();
    uint64_t v11 = (void *)OUTLINED_FUNCTION_11();
    uint64_t v12 = MEMORY[0x263F8F500];
    v11[2] = v10;
    v11[3] = v12;
    v11[4] = a2;
    swift_retain();
    uint64_t v13 = sub_234B3B868();
    id v14 = (void *)OUTLINED_FUNCTION_11();
    v14[2] = v13;
    v14[3] = v12;
    v14[4] = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687D0D40);
    sub_234B3AF98();
    *(_OWORD *)uint64_t v23 = *(_OWORD *)&v23[3];
    uint64_t v15 = v23[5];
    id v16 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2687CECC0));
    id v17 = v9;
    sub_2349E67F0(v17);
    sub_2349158F4(&qword_2687CECC8, &qword_2687CECC0);
    uint64_t v18 = sub_234B39738();
    uint64_t v20 = v19;

    *(void *)uint64_t v2 = v18;
    *(void *)(v2 + 8) = v20;
    *(_OWORD *)(v2 + 16) = *(_OWORD *)v23;
    *(void *)(v2 + 32) = v15;
    swift_storeEnumTagMultiPayload();
    sub_234967B6C();
    sub_2349158F4(&qword_2687D7F38, (uint64_t *)&unk_2687D35E0);
    return OUTLINED_FUNCTION_5_27();
  }
  else
  {
    id v22 = a1;
    swift_retain();
    sub_2349E6AEC();
    sub_234ADC238((uint64_t)v7, v2);
    swift_storeEnumTagMultiPayload();
    sub_234967B6C();
    sub_2349158F4(&qword_2687D7F38, (uint64_t *)&unk_2687D35E0);
    OUTLINED_FUNCTION_5_27();
    return sub_234ADC2A0((uint64_t)v7);
  }
}

id sub_234ADA3B8()
{
  if ((objc_msgSend(v0, sel_allowsMultipleValues) & 1) == 0)
  {
    id result = objc_msgSend(v0, sel_allowsTextEntry);
    if (!result) {
      return result;
    }
    uint64_t v2 = sub_23491E2A0(v0);
    swift_bridgeObjectRelease();
    if (!v2) {
      return 0;
    }
  }
  return (id)(objc_msgSend(v0, sel_isRangedSizeArray) ^ 1);
}

uint64_t sub_234ADA42C@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_234B38998();
  if (result)
  {
    self;
    uint64_t result = swift_dynamicCastObjCClass();
    if (!result)
    {
      swift_unknownObjectRelease();
      uint64_t result = 0;
    }
  }
  *a1 = result;
  return result;
}

uint64_t sub_234ADA49C(void **a1)
{
  uint64_t v1 = *a1;
  swift_getObjectType();
  id v2 = v1;
  return sub_234B389A8();
}

void sub_234ADA4EC(uint64_t a1)
{
  if (a1)
  {
    self;
    uint64_t v1 = (void *)swift_dynamicCastObjCClass();
    if (v1)
    {
      swift_unknownObjectRetain();
      id v2 = objc_msgSend(v1, sel_value);
      if (v2)
      {
        sub_23491E3D4(0, &qword_2687D29A8);
        sub_234B3B708();
      }
      swift_unknownObjectRelease();
    }
  }
}

unint64_t sub_234ADAA3C(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
    __break(1u);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v4 = *(void *)(a3 + 16);
  if (v4 < result || (uint64_t)v4 < v3) {
    goto LABEL_11;
  }
  if ((v3 & 0x8000000000000000) == 0) {
    return swift_bridgeObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_234ADAAB8()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_234B3B668();
  sub_234B3B628();
  return v1;
}

id sub_234ADAB38(void *a1)
{
  id v1 = a1;
  uint64_t v2 = swift_unknownObjectRetain();
  sub_234ADA4EC(v2);
  uint64_t v4 = v3;
  swift_unknownObjectRelease();

  if (v4)
  {
    uint64_t v5 = (void *)sub_234B3B548();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

id WFContactFieldParameter.moduleSummarySlot(for:)(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_23491E3D4(0, (unint64_t *)&qword_2687D0370);
  id v4 = objc_msgSend(v1, sel_localizedLabel);
  uint64_t v5 = sub_234B3B588();
  uint64_t v7 = v6;

  uint64_t v8 = sub_23494ECB4(v1);
  uint64_t v10 = v9;
  uint64_t v11 = (void *)sub_234B3B548();
  id v12 = sub_23494DC3C(v5, v7, v8, v10, v11);
  if (a1)
  {
    self;
    uint64_t v13 = swift_dynamicCastObjCClass();
    if (v13)
    {
      id v14 = (void *)v13;
      swift_unknownObjectRetain();
      id v15 = objc_msgSend(v14, sel_variable);
      if (v15)
      {
        id v16 = v15;
        objc_msgSend(v12, sel_populateWithVariable_, v15);
      }
      else
      {
        id v21 = objc_msgSend(v2, sel_labelForState_, v14);
        objc_msgSend(v12, sel_populateWithString_, v21);
      }
      swift_unknownObjectRelease();
    }
    else
    {
      self;
      uint64_t v17 = swift_dynamicCastObjCClass();
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        swift_unknownObjectRetain_n();
        sub_234ADBE34(v18);
        if (v19)
        {
          uint64_t v20 = (void *)sub_234B3B548();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v20 = 0;
        }
        objc_msgSend(v12, sel_populateWithString_, v20);
        swift_unknownObjectRelease();
      }
    }
  }
  return v12;
}

id sub_234ADADB0(void *a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  id v5 = a1;
  id v6 = WFContactFieldParameter.moduleSummarySlot(for:)(a3);
  swift_unknownObjectRelease();

  return v6;
}

uint64_t WFContactFieldParameter.moduleSummaryShowsAddButton(for:)(uint64_t result)
{
  if (result)
  {
    self;
    uint64_t result = swift_dynamicCastObjCClass();
    if (result)
    {
      uint64_t v2 = (void *)result;
      swift_unknownObjectRetain();
      id v3 = objc_msgSend(v2, sel_value);
      if (v3)
      {
        id v4 = v3;
        if (objc_msgSend(v1, sel_allowsMultipleValues))
        {
          id v5 = objc_msgSend(v4, sel_count);

          swift_unknownObjectRelease();
          return (uint64_t)v5 > 0;
        }
      }
      swift_unknownObjectRelease();
      return 0;
    }
  }
  return result;
}

uint64_t sub_234ADAEDC(void *a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  id v5 = a1;
  char v6 = WFContactFieldParameter.moduleSummaryShowsAddButton(for:)(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

id WFContactFieldParameter.defaultStateForNewArrayElement()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F33790]);
  return objc_msgSend(v0, sel_init);
}

id sub_234ADAF6C(void *a1)
{
  id v1 = a1;
  id v2 = WFContactFieldParameter.defaultStateForNewArrayElement()();

  return v2;
}

uint64_t static WFContactFieldParameter.moduleSummaryEditorClass()()
{
  return type metadata accessor for ContactFieldParameterSummaryEditor();
}

uint64_t sub_234ADAFB8()
{
  static WFContactFieldParameter.moduleSummaryEditorClass()();
  return swift_getObjCClassFromMetadata();
}

void sub_234ADAFE0(uint64_t a1)
{
  id v2 = *(void **)(v1
                + OBJC_IVAR____TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor_modal);
  *(void *)(v1
            + OBJC_IVAR____TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor_modal) = a1;
}

void sub_234ADAFF4(uint64_t a1)
{
  id v2 = *(void **)(v1
                + OBJC_IVAR____TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor_lastValue);
  *(void *)(v1
            + OBJC_IVAR____TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor_lastValue) = a1;
}

void sub_234ADB008(void *a1, void *a2)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for SummaryModal());
  char v6 = v2;
  id v7 = a1;
  sub_234911CFC();
  sub_234ADAFE0(v8);
  uint64_t v9 = *(void **)&v6[OBJC_IVAR____TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor_modal];
  if (v9)
  {
    id v10 = v9;
    sub_234912E6C(a2);
  }
}

uint64_t sub_234ADB14C()
{
  v1[17] = v0;
  sub_234B3B878();
  v1[18] = sub_234B3B868();
  uint64_t v3 = sub_234B3B818();
  v1[19] = v3;
  v1[20] = v2;
  return MEMORY[0x270FA2498](sub_234ADB1E4, v3, v2);
}

uint64_t sub_234ADB1E4()
{
  uint64_t v1 = *(void *)(v0 + 136);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_234ADB2E4;
  uint64_t v2 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_234AE960C;
  *(void *)(v0 + 104) = &block_descriptor_7;
  *(void *)(v0 + 112) = v2;
  uint64_t v3 = type metadata accessor for ContactFieldParameterSummaryEditor();
  *(void *)(v0 + 120) = v1;
  *(void *)(v0 + 128) = v3;
  objc_msgSendSuper2((objc_super *)(v0 + 120), sel_cancelEditingWithCompletionHandler_, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_234ADB2E4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5();
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 152);
  return MEMORY[0x270FA2498](sub_234ADB3C4, v2, v1);
}

uint64_t sub_234ADB3C4()
{
  OUTLINED_FUNCTION_1_2();
  uint64_t v1 = *(void *)(v0 + 136);
  swift_release();
  uint64_t v2 = *(void **)(v1
                + OBJC_IVAR____TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor_modal);
  if (v2)
  {
    id v3 = v2;
    sub_234913028();
  }
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_234ADB4BC(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_234B3B878();
  v2[4] = sub_234B3B868();
  uint64_t v4 = sub_234B3B818();
  return MEMORY[0x270FA2498](sub_234ADB554, v4, v3);
}

uint64_t sub_234ADB554()
{
  OUTLINED_FUNCTION_1_2();
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_23494E4E0;
  return sub_234ADB14C();
}

uint64_t sub_234ADB600()
{
  uint64_t v0 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_234B3B878();
  swift_retain();
  uint64_t v1 = sub_234B3B868();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_11();
  uint64_t v3 = MEMORY[0x263F8F500];
  v2[2] = v1;
  v2[3] = v3;
  v2[4] = v0;
  swift_release();
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v5 = sub_234B3B868();
  uint64_t v6 = (void *)OUTLINED_FUNCTION_11();
  v6[2] = v5;
  v6[3] = v3;
  v6[4] = v4;
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D0D40);
  sub_234B3AF98();
  return v8;
}

void sub_234ADB74C(uint64_t a1@<X2>, void *a2@<X8>)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = (char *)MEMORY[0x237DCE350](v3);
  if (!v4) {
    goto LABEL_10;
  }
  uint64_t v5 = v4;
  id v6 = *(id *)&v4[OBJC_IVAR____TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor_lastValue];
  if (!v6)
  {
    id v8 = objc_msgSend(v4, sel_initialArrayState);
    if (v8 && (v9 = v8, id v10 = objc_msgSend(v8, sel_value), v9, v10))
    {
      id v11 = objc_msgSend(v5, sel_parameter);
      objc_msgSend(v11, sel_multipleStateClass);

      swift_getObjCClassMetadata();
      sub_23491E3D4(0, &qword_2687CF5E8);
      if (swift_dynamicCastMetatype())
      {
        id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithValue_, v10);

        goto LABEL_11;
      }
    }
    else
    {
    }
LABEL_10:
    id v6 = 0;
    goto LABEL_11;
  }
  id v7 = v6;

LABEL_11:
  *a2 = v6;
}

void sub_234ADB8AC(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a4 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x237DCE350](v5);
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = v4;
    sub_234ADAFF4((uint64_t)v4);
  }
  swift_beginAccess();
  uint64_t v9 = (void *)MEMORY[0x237DCE350](v5);
  if (v9)
  {
    id v10 = v9;
    objc_msgSend(v9, sel_commitState_, v4);
  }
}

id sub_234ADB94C(void *a1, uint64_t a2, char a3)
{
  *(void *)&v3[OBJC_IVAR____TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor_modal] = 0;
  *(void *)&v3[OBJC_IVAR____TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor_lastValue] = 0;
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for ContactFieldParameterSummaryEditor();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithParameter_arrayIndex_processing_, a1, a2, a3 & 1);

  return v7;
}

id sub_234ADBA14()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContactFieldParameterSummaryEditor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_234ADBA98(unint64_t a1)
{
  return sub_234ADBC70(a1, MEMORY[0x263F8DC70]);
}

uint64_t sub_234ADBAB0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D05E0);
  uint64_t v3 = swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size_0((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 80);
  uint64_t v5 = sub_234ADC00C(&v7, (char *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_234964040();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

void sub_234ADBB94(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 > 0)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687CF5D0);
      id v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size_0(v8);
      v8[2] = v5;
      v8[3] = (2 * ((uint64_t)(v9 - 32) / 8)) | 1;
    }
    if (v4 != a3)
    {
      sub_2349D4CF0(a2 + 8 * a3, v5);
      return;
    }
    goto LABEL_9;
  }
}

void *sub_234ADBC58(unint64_t a1)
{
  return sub_234ADBC70(a1, (void (*)(void *, uint64_t, unint64_t))sub_23495DF9C);
}

void *sub_234ADBC70(unint64_t a1, void (*a2)(void *, uint64_t, unint64_t))
{
  if (a1 >> 62) {
    goto LABEL_8;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v4 <= 0)
    {
      uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687CF5D0);
      uint64_t v5 = (void *)swift_allocObject();
      size_t v6 = _swift_stdlib_malloc_size_0(v5);
      v5[2] = v4;
      v5[3] = (2 * ((uint64_t)(v6 - 32) / 8)) | 1;
    }
    swift_bridgeObjectRetain();
    a2(v5 + 4, v4, a1);
    a2 = v7;
    swift_bridgeObjectRelease();
    if (a2 == (void (*)(void *, uint64_t, unint64_t))v4) {
      break;
    }
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_234B3C1B8();
    swift_bridgeObjectRelease();
    if (!v4) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v5;
}

void sub_234ADBD74(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 > 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687D3B90);
      uint64_t v7 = (void *)swift_allocObject();
      size_t v8 = _swift_stdlib_malloc_size_0(v7);
      v7[2] = v5;
      v7[3] = 2 * ((uint64_t)(v8 - 32) / 16);
    }
    if (v4 != a3)
    {
      sub_2349D3AA0();
      return;
    }
    goto LABEL_9;
  }
}

uint64_t sub_234ADBE34(void *a1)
{
  id v2 = objc_msgSend(a1, sel_wfName);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_234B3B588();

  return v3;
}

uint64_t type metadata accessor for ContactFieldParameterSummaryEditor()
{
  return self;
}

uint64_t sub_234ADBEC8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_234ADBF04(void *a1@<X8>)
{
  sub_234ADB74C(*(void *)(v1 + 32), a1);
}

void sub_234ADBF14(void **a1)
{
  sub_234ADB8AC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_234ADBF20()
{
  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_234ADBF60()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *unint64_t v4 = v1;
  v4[1] = sub_23494EF04;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2687D7F00 + dword_2687D7F00);
  return v5(v2, v3);
}

void *sub_234ADC00C(void *result, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v13 = 0;
LABEL_36:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v13;
  }
  if (!a3)
  {
    int64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  id v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v22 = -1 << *(unsigned char *)(a4 + 32);
  while (v9)
  {
    unint64_t v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v16 = v15 | (v12 << 6);
LABEL_23:
    ++v13;
    sub_2349B4F20(*(void *)(a4 + 48) + 48 * v16, (uint64_t)__src);
    uint64_t v20 = (_OWORD *)(*(void *)(a4 + 56) + 32 * v16);
    long long v21 = v20[1];
    __src[3] = *v20;
    __src[4] = v21;
    memcpy(__dst, __src, sizeof(__dst));
    uint64_t result = memcpy(v11, __dst, 0x50uLL);
    v11 += 80;
    if (v13 == a3)
    {
      uint64_t v13 = a3;
LABEL_35:
      uint64_t v7 = v22;
      goto LABEL_36;
    }
  }
  int64_t v17 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v17 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v17);
  if (v18) {
    goto LABEL_22;
  }
  int64_t v19 = v12 + 2;
  ++v12;
  if (v17 + 1 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_15;
  }
  int64_t v12 = v17 + 1;
  if (v17 + 2 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * (v17 + 2));
  if (v18)
  {
    v17 += 2;
    goto LABEL_22;
  }
  int64_t v12 = v17 + 2;
  if (v17 + 3 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * (v17 + 3));
  if (v18)
  {
    v17 += 3;
    goto LABEL_22;
  }
  int64_t v19 = v17 + 4;
  int64_t v12 = v17 + 3;
  if (v17 + 4 >= v14)
  {
LABEL_34:
    unint64_t v9 = 0;
    goto LABEL_35;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_15:
    int64_t v17 = v19;
LABEL_22:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      int64_t v12 = v14 - 1;
      goto LABEL_34;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_234ADC238(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D35E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_234ADC2A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D35E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_234ADC304@<X0>(uint64_t *a1@<X8>)
{
  return sub_234ADA42C(a1);
}

uint64_t sub_234ADC314(void **a1)
{
  return sub_234ADA49C(a1);
}

uint64_t OUTLINED_FUNCTION_5_27()
{
  return sub_234B39F88();
}

uint64_t sub_234ADC340()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_234B39298();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_234ADC3B4()
{
  return sub_234B392A8();
}

uint64_t sub_234ADC424()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_234B39298();
  swift_release();
  return swift_release();
}

uint64_t sub_234ADC49C()
{
  return sub_234B392A8();
}

uint64_t sub_234ADC50C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D4480);
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2_30(v5, v19);
  sub_234B38598();
  uint64_t result = sub_234ADC340();
  uint64_t v7 = result;
  int64_t v8 = 0;
  uint64_t v9 = result + 56;
  uint64_t v10 = 1 << *(unsigned char *)(result + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(result + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (v12)
  {
    unint64_t v14 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    unint64_t v15 = v14 | (v8 << 6);
LABEL_20:
    OUTLINED_FUNCTION_3_30(*(void *)(*(void *)(v7 + 48) + 8 * v15));
    uint64_t result = (uint64_t)v20;
    if (v20)
    {
      sub_234985C00(v20);
      uint64_t result = sub_234B38558();
    }
  }
  int64_t v16 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v16 >= v13) {
    goto LABEL_22;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v16);
  ++v8;
  if (v17) {
    goto LABEL_19;
  }
  int64_t v8 = v16 + 1;
  if (v16 + 1 >= v13) {
    goto LABEL_22;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v8);
  if (v17) {
    goto LABEL_19;
  }
  int64_t v8 = v16 + 2;
  if (v16 + 2 >= v13) {
    goto LABEL_22;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v8);
  if (v17)
  {
LABEL_19:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v8 << 6);
    goto LABEL_20;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13)
  {
LABEL_22:
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  }
  unint64_t v17 = *(void *)(v9 + 8 * v18);
  if (v17)
  {
    int64_t v8 = v18;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v8 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v8 >= v13) {
      goto LABEL_22;
    }
    unint64_t v17 = *(void *)(v9 + 8 * v8);
    ++v18;
    if (v17) {
      goto LABEL_19;
    }
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_234ADC6E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D4480);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_10_7();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_234B39298();
    swift_release();
    swift_release();
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, v1, v3);
  }
  else
  {
    sub_2349D1550();
    return sub_234B38BB8();
  }
}

uint64_t sub_234ADC830()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D4480);
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_10_7();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_234B39298();
  swift_release();
  swift_release();
  if (!v7) {
    return 0;
  }
  sub_234ADC6E4(v0);
  sub_234B38C08();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  uint64_t v5 = v8;
  sub_234985C00(v7);
  return v5;
}

uint64_t sub_234ADC958(void **a1, char a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D4480);
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_234B385A8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v17 = (char *)&v40 - v16;
  int64_t v18 = *a1;
  if (!a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687D05C8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_234B6B860;
    *(void *)(inited + 32) = v18;
    sub_234A34C3C(inited);
    sub_234ADC3B4();
    goto LABEL_23;
  }
  if (a2 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v19 = (void (*)(void **, void))sub_234B39288();
    sub_234A3138C((uint64_t)&v46, (uint64_t)v18);
    v19(v45, 0);
    swift_release();
    swift_release();
LABEL_23:
    v45[0] = v18;
    return sub_234ADC49C();
  }
  uint64_t v43 = v15;
  uint64_t v44 = v6;
  sub_234ADC50C();
  uint64_t v21 = sub_234ADC830();
  char v23 = v22;
  sub_234ADC6E4((uint64_t)v9);
  sub_234A21F24();
  id v42 = v24;
  if (v25 & 1) != 0 || (uint64_t v26 = sub_234ADCDE8(), (v27) || (v41 = v26, v46 = v18, sub_234B38C08(), !v45[0]))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    char v33 = (void (*)(void **, void))sub_234B39288();
    sub_234A3138C((uint64_t)&v46, (uint64_t)v18);
    v33(v45, 0);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v17, v10);
LABEL_22:
    (*(void (**)(char *, uint64_t))(v44 + 8))(v9, v4);
    goto LABEL_23;
  }
  uint64_t v28 = (char *)v45[2];
  uint64_t result = (uint64_t)sub_234985C00(v45[0]);
  if ((v23 & 1) == 0)
  {
    uint64_t result = sub_234B38588();
    if (result)
    {
LABEL_19:
      if (sub_234B38588())
      {
        sub_234B38568();
      }
      else
      {
        if ((uint64_t)v28 >= v21) {
          long long v34 = (void *)v21;
        }
        else {
          long long v34 = v28;
        }
        if ((uint64_t)v28 <= v21) {
          uint64_t v35 = (void *)v21;
        }
        else {
          uint64_t v35 = v28;
        }
        v45[0] = v34;
        v45[1] = v35;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7F80);
        sub_234ADDED0();
        sub_234B38548();
      }
      uint64_t v36 = v43;
      uint64_t v37 = (*(uint64_t (**)(char *, char *, uint64_t))(v43 + 16))(v14, v17, v10);
      id v42 = (char *)&v40;
      MEMORY[0x270FA5388](v37);
      *(&v40 - 2) = (uint64_t)v9;
      uint64_t v38 = sub_23491D2C0((void (*)(uint64_t *__return_ptr, uint64_t *))sub_234ADDF24);
      uint64_t v39 = *(void (**)(char *, uint64_t))(v36 + 8);
      v39(v14, v10);
      sub_234ADE370(v38);
      sub_234ADC3B4();
      v39(v17, v10);
      goto LABEL_22;
    }
  }
  int64_t v30 = v28 - v42;
  if (__OFSUB__(v28, v42))
  {
    __break(1u);
    goto LABEL_33;
  }
  if (v30 < 0)
  {
    BOOL v31 = __OFSUB__(0, v30);
    int64_t v30 = v42 - v28;
    if (v31) {
      goto LABEL_34;
    }
  }
  uint64_t v32 = (uint64_t)&v28[-v41];
  if (__OFSUB__(v28, v41))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if ((v32 & 0x8000000000000000) == 0 || (BOOL v31 = __OFSUB__(0, v32), v32 = v41 - (void)v28, !v31))
  {
    if (v30 >= v32) {
      uint64_t v21 = v41;
    }
    else {
      uint64_t v21 = (uint64_t)v42;
    }
    goto LABEL_19;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_234ADCDE8()
{
  uint64_t v1 = sub_234B384E8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v44 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v33 - v5;
  uint64_t v7 = sub_234B385A8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D4440);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = v8;
  uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v39 = v8 + 16;
  v38(v10, v0, v7);
  uint64_t v15 = (void (*)(uint64_t))MEMORY[0x263F07978];
  sub_234ADDF44(&qword_2687D4008, MEMORY[0x263F07978]);
  uint64_t v40 = v10;
  sub_234B3B688();
  uint64_t v16 = &v14[*(int *)(v12 + 44)];
  uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v37 = v2 + 16;
  v36(v6, v16, v1);
  sub_234ADDF44(qword_2687CF620, v15);
  unint64_t v17 = v44;
  sub_234B3B998();
  uint64_t v35 = sub_234ADDF44(&qword_2687D4448, MEMORY[0x263F07948]);
  int v18 = sub_234B3B498();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v2 + 8);
  v19(v17, v1);
  uint64_t v41 = v6;
  uint64_t v42 = v2 + 8;
  v19(v6, v1);
  uint64_t v20 = 0;
  if ((v18 & 1) == 0)
  {
    v33[1] = v18;
    uint64_t v21 = (void (*)(unsigned char *, void))sub_234B3B9C8();
    uint64_t v20 = *v22;
    v21(v45, 0);
    char v23 = v40;
    v38(v40, (uint64_t)v14, v7);
    sub_234B3B9A8();
    uint64_t v24 = *(void (**)(char *, uint64_t))(v43 + 8);
    v43 += 8;
    long long v34 = v24;
    v24(v23, v7);
    char v25 = v41;
    while (1)
    {
      v36(v25, v16, v1);
      uint64_t v26 = v44;
      sub_234B3B998();
      char v27 = sub_234B3B498();
      v19(v26, v1);
      v19(v25, v1);
      if (v27) {
        break;
      }
      uint64_t v28 = (void (*)(unsigned char *, void))sub_234B3B9C8();
      uint64_t v30 = *v29;
      v28(v45, 0);
      BOOL v31 = v40;
      v38(v40, (uint64_t)v14, v7);
      sub_234B3B9A8();
      v34(v31, v7);
      if (v20 <= v30) {
        uint64_t v20 = v30;
      }
    }
  }
  sub_234ADDF8C((uint64_t)v14);
  return v20;
}

void sub_234ADD2B0(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D4480);
  sub_234B38C28();
  swift_release();

  *a1 = v3;
}

uint64_t sub_234ADD328(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v2 = (void (*)(void *, void))sub_234B39288();
  sub_234AE4A68(v1, &v9);
  v2(v8, 0);
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_234B39298();
  swift_release();
  uint64_t result = swift_release();
  if (!v8[0] || v1 != v8[0]) {
    return result;
  }
  uint64_t v4 = sub_234ADC340();
  uint64_t result = sub_234AD9A2C(v4);
  if (v6)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  if (*(_DWORD *)(v4 + 36) != v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (result == 1 << *(unsigned char *)(v4 + 32))
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = 0;
  }
  else
  {
    sub_234AD0D4C(result, v5, v4, v8);
    swift_bridgeObjectRelease();
    uint64_t v7 = v8[0];
  }
  v8[0] = v7;
  return sub_234ADC49C();
}

uint64_t sub_234ADD4A8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v0 = (void (*)(void *, void))sub_234B39288();
  uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  *uint64_t v2 = MEMORY[0x263F8EE88];
  v0(v4, 0);
  swift_release();
  swift_release();
  v4[0] = 0;
  return sub_234ADC49C();
}

uint64_t sub_234ADD560()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D4480);
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2_30(v5, v11);
  uint64_t v6 = sub_234B38BA8();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v7 = (void (*)(void **, void))sub_234B39288();
  *uint64_t v8 = sub_234ADDBD0(v6, *v8);
  swift_bridgeObjectRelease();
  v7(&v12, 0);
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_234B39298();
  swift_release();
  swift_release();
  if (v12)
  {
    OUTLINED_FUNCTION_3_30((uint64_t)v12);
    uint64_t v9 = v12;
    sub_234985C00(v12);
    if (!v9)
    {
      uint64_t v12 = 0;
      sub_234ADC49C();
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
}

uint64_t sub_234ADD708()
{
  swift_weakDestroy();
  uint64_t v1 = v0 + OBJC_IVAR____TtC14WorkflowEditor28WorkflowSelectionCoordinator__selectedActions;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7F78);
  OUTLINED_FUNCTION_5_9();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = v0 + OBJC_IVAR____TtC14WorkflowEditor28WorkflowSelectionCoordinator__lastSelectedAction;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D4338);
  OUTLINED_FUNCTION_5_9();
  (*(void (**)(uint64_t))(v4 + 8))(v3);
  return v0;
}

uint64_t sub_234ADD7A8()
{
  sub_234ADD708();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_234ADD800()
{
  return type metadata accessor for WorkflowSelectionCoordinator();
}

uint64_t type metadata accessor for WorkflowSelectionCoordinator()
{
  uint64_t result = qword_2687D7F50;
  if (!qword_2687D7F50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_234ADD850()
{
  sub_234949608(319, &qword_2687D7F60, &qword_2687D46A8);
  if (v0 <= 0x3F)
  {
    sub_234949608(319, &qword_2687D7F68, &qword_2687D7F70);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_234ADD944()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D4338);
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_10_7();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7F78);
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_weakInit();
  uint64_t v12 = v0 + OBJC_IVAR____TtC14WorkflowEditor28WorkflowSelectionCoordinator__selectedActions;
  uint64_t v16 = MEMORY[0x263F8EE88];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D46A8);
  sub_234B39258();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v12, v11, v6);
  uint64_t v13 = v0 + OBJC_IVAR____TtC14WorkflowEditor28WorkflowSelectionCoordinator__lastSelectedAction;
  uint64_t v16 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7F70);
  sub_234B39258();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v13, v1, v2);
  return v0;
}

uint64_t sub_234ADDAC0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for WorkflowSelectionCoordinator();
  uint64_t result = sub_234B391E8();
  *a1 = result;
  return result;
}

uint64_t sub_234ADDB00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_234ADC340();
  *a1 = result;
  return result;
}

uint64_t sub_234ADDB2C()
{
  return sub_234ADC3B4();
}

uint64_t sub_234ADDB5C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_234ADC424();
  *a1 = v3;
  return result;
}

uint64_t sub_234ADDB98()
{
  return sub_234ADC49C();
}

uint64_t sub_234ADDBD0(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    uint64_t v6 = (void *)((char *)v10 - ((8 * v5 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_234A334FC(0, v5, v6);
    uint64_t v7 = sub_234ADDD6C(v6, v5, v3, a2);
    swift_release();
  }
  else
  {
    uint64_t v8 = (unint64_t *)swift_slowAlloc();
    sub_234A334FC(0, v5, v8);
    uint64_t v7 = sub_234ADDD6C(v8, v5, v3, a2);
    swift_release();
    MEMORY[0x237DCE1F0](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_234ADDD6C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a3 + 16);
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = a4 + 56;
    uint64_t v10 = a3 + 32;
    while (1)
    {
      uint64_t v11 = *(void *)(v10 + 8 * v8);
      sub_234B3C308();
      sub_234B3C318();
      uint64_t result = sub_234B3C368();
      uint64_t v13 = -1 << *(unsigned char *)(a4 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = 1 << v14;
      if (((1 << v14) & *(void *)(v9 + 8 * (v14 >> 6))) != 0)
      {
        uint64_t v17 = *(void *)(a4 + 48);
        if (*(void *)(v17 + 8 * v14) == v11)
        {
LABEL_10:
          unint64_t v20 = a1[v15];
          a1[v15] = v16 | v20;
          if ((v16 & v20) == 0 && __OFADD__(v7++, 1))
          {
            __break(1u);
            return result;
          }
        }
        else
        {
          for (unint64_t i = v14 + 1; ; unint64_t i = v19 + 1)
          {
            unint64_t v19 = i & ~v13;
            if (((*(void *)(v9 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
              break;
            }
            if (*(void *)(v17 + 8 * v19) == v11)
            {
              unint64_t v15 = v19 >> 6;
              uint64_t v16 = 1 << v19;
              goto LABEL_10;
            }
          }
        }
      }
      if (++v8 == v6) {
        goto LABEL_15;
      }
    }
  }
  uint64_t v7 = 0;
LABEL_15:
  swift_retain();
  return sub_234AE55E8(a1, a2, v7, a4);
}

unint64_t sub_234ADDED0()
{
  unint64_t result = qword_2687D7F88;
  if (!qword_2687D7F88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D7F80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D7F88);
  }
  return result;
}

void sub_234ADDF24(void *a1@<X8>)
{
}

uint64_t sub_234ADDF44(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_234ADDF8C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D4440);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_30@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v3 = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_234ADC6E4((uint64_t)v3);
}

uint64_t OUTLINED_FUNCTION_3_30@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 128) = a1;
  return sub_234B38C08();
}

uint64_t sub_234ADE038(void *a1)
{
  uint64_t v2 = sub_234B382F8();
  uint64_t v9 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x263F8EE78];
  id v5 = a1;
  sub_234B3BA38();

  sub_234AE8500(&qword_2687D1FE8, MEMORY[0x263F06DC0]);
  sub_234B3BD88();
  while (v14)
  {
    sub_234964030(&v13, v12);
    sub_234963FD4((uint64_t)v12, (uint64_t)v10);
    sub_23491E3D4(0, &qword_2687D8110);
    if ((swift_dynamicCast() & 1) == 0) {
      uint64_t v11 = 0;
    }
    uint64_t v6 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    if (v11)
    {
      MEMORY[0x237DCC230](v6);
      if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_234B3B758();
      }
      sub_234B3B798();
      sub_234B3B748();
    }
    sub_234B3BD88();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v4, v2);
  return v15;
}

uint64_t sub_234ADE26C(uint64_t a1)
{
  type metadata accessor for WFContactPropertyID(0);
  sub_234AE8500(&qword_2687D80D0, type metadata accessor for WFContactPropertyID);
  uint64_t v2 = sub_234B3B908();
  uint64_t v9 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = *(unsigned int *)(a1 + 4 * i + 32);
      sub_234A312A8((uint64_t)v8, v5);
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    uint64_t v6 = v2;
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_234ADE340(unint64_t a1)
{
  return sub_234ADE46C(a1, &qword_2687D6360, 0x263F08A18, (unint64_t *)&qword_2687D0D60, (void (*)(id *, id))sub_234A31370);
}

uint64_t sub_234ADE370(uint64_t a1)
{
  sub_2349D1550();
  uint64_t v2 = sub_234B3B908();
  uint64_t v9 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = *(void *)(a1 + 8 * i + 32);
      sub_234A3138C((uint64_t)&v8, v5);
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    uint64_t v6 = v2;
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_234ADE40C(unint64_t a1)
{
  return sub_234ADE46C(a1, (unint64_t *)qword_2687D4460, 0x263F86D60, (unint64_t *)&qword_2687D10D0, (void (*)(id *, id))sub_234A31604);
}

uint64_t sub_234ADE43C(unint64_t a1)
{
  return sub_234ADE46C(a1, (unint64_t *)&qword_2687D1290, 0x263F86860, &qword_2687D4488, (void (*)(id *, id))sub_234A31620);
}

uint64_t sub_234ADE46C(unint64_t a1, unint64_t *a2, uint64_t a3, unint64_t *a4, void (*a5)(id *, id))
{
  unint64_t v9 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_234B3C1B8();
    swift_bridgeObjectRelease();
  }
  sub_23491E3D4(0, a2);
  sub_234A25CBC(a4, a2);
  uint64_t result = sub_234B3B908();
  uint64_t v11 = result;
  uint64_t v16 = result;
  if (!v9)
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12) {
      goto LABEL_5;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return v11;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_234B3C1B8();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v12) {
    goto LABEL_13;
  }
LABEL_5:
  if (v12 >= 1)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v14 = (id)MEMORY[0x237DCCB60](i, a1);
      }
      else {
        id v14 = *(id *)(a1 + 8 * i + 32);
      }
      a5(&v15, v14);
    }
    swift_bridgeObjectRelease();
    return v16;
  }
  __break(1u);
  return result;
}

void sub_234ADE5E0(uint64_t a1)
{
  sub_2349D1550();
  uint64_t v11 = sub_234B3B908();
  sub_234AE55B0(a1, v12);
  OUTLINED_FUNCTION_25_10();
  if (!v4) {
    goto LABEL_3;
  }
LABEL_2:
  OUTLINED_FUNCTION_23_10();
  while (1)
  {
    sub_234A3138C((uint64_t)v10, *(void *)(*(void *)(a1 + 48) + 8 * v6));
    if (v4) {
      goto LABEL_2;
    }
LABEL_3:
    uint64_t v7 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v7 >= v2) {
      goto LABEL_20;
    }
    if (!*(void *)(v1 + 8 * v7))
    {
      if (v3 + 2 >= v2) {
        goto LABEL_20;
      }
      if (!*(void *)(v1 + 8 * (v3 + 2)))
      {
        if (v3 + 3 >= v2) {
          goto LABEL_20;
        }
        if (!*(void *)(v1 + 8 * (v3 + 3)))
        {
          if (v3 + 4 >= v2) {
            goto LABEL_20;
          }
          if (!*(void *)(v1 + 8 * (v3 + 4)))
          {
            if (v3 + 5 >= v2) {
              goto LABEL_20;
            }
            if (!*(void *)(v1 + 8 * (v3 + 5)))
            {
              uint64_t v8 = v3 + 6;
              while (v8 < v2)
              {
                if (*(void *)(v1 + 8 * v8++)) {
                  goto LABEL_17;
                }
              }
LABEL_20:
              swift_release();
              return;
            }
          }
        }
      }
    }
LABEL_17:
    OUTLINED_FUNCTION_22_13();
  }
  __break(1u);
}

void sub_234ADE70C(uint64_t a1)
{
  uint64_t v3 = sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
  sub_234A25CBC((unint64_t *)&qword_2687D10D0, (unint64_t *)qword_2687D4460);
  v8[1] = (id)sub_234B3B908();
  sub_234AE55B0(a1, v9);
  OUTLINED_FUNCTION_25_10();
  if (!v1) {
    goto LABEL_3;
  }
LABEL_2:
  OUTLINED_FUNCTION_23_10();
  while (1)
  {
    sub_234A31604(v8, *(id *)(*(void *)(a1 + 56) + 8 * v4));

    if (v1) {
      goto LABEL_2;
    }
LABEL_3:
    uint64_t v5 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v5 >= 0x263F86D60) {
      goto LABEL_20;
    }
    if (!qword_2687D4460[v5])
    {
      if (v3 + 2 >= 0x263F86D60) {
        goto LABEL_20;
      }
      if (!qword_2687D4460[v3 + 2])
      {
        if (v3 + 3 >= 0x263F86D60) {
          goto LABEL_20;
        }
        if (!qword_2687D4460[v3 + 3])
        {
          if (v3 + 4 >= 0x263F86D60) {
            goto LABEL_20;
          }
          if (!qword_2687D4460[v3 + 4])
          {
            if (v3 + 5 >= 0x263F86D60) {
              goto LABEL_20;
            }
            if (!qword_2687D4460[v3 + 5])
            {
              uint64_t v6 = v3 + 6;
              while (v6 < 0x263F86D60)
              {
                if (qword_2687D4460[v6++]) {
                  goto LABEL_17;
                }
              }
LABEL_20:
              swift_release();
              return;
            }
          }
        }
      }
    }
LABEL_17:
    OUTLINED_FUNCTION_22_13();
  }
  __break(1u);
}

void sub_234ADE878()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = v1;
  uint64_t v3 = sub_234B38438();
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v19 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D3F00);
  MEMORY[0x270FA5388](v12 - 8);
  OUTLINED_FUNCTION_24_1();
  sub_234AE8500((unint64_t *)&unk_2687D80F0, MEMORY[0x263F07508]);
  uint64_t v22 = sub_234B3B908();
  uint64_t v19 = v2;
  uint64_t v13 = *(void *)(v2 + 16);
  if (v13)
  {
    uint64_t v14 = v5 + 16;
    id v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    uint64_t v16 = v19 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v20 = *(void *)(v14 + 56);
    uint64_t v21 = v15;
    uint64_t v17 = (void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    int v18 = (void (**)(char *, uint64_t))(v14 - 8);
    while (1)
    {
      v21(v0, v16, v3);
      __swift_storeEnumTagSinglePayload(v0, 0, 1, v3);
      if (__swift_getEnumTagSinglePayload(v0, 1, v3) == 1) {
        break;
      }
      (*v17)(v8, v0, v3);
      sub_234A318EC();
      (*v18)(v11, v3);
      v16 += v20;
      if (!--v13) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    __swift_storeEnumTagSinglePayload(v0, 1, 1, v3);
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_234ADEA9C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6)
  {
    while (1)
    {
      unint64_t v7 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v8 = (id)MEMORY[0x237DCCB60](v7, a1);
LABEL_7:
        uint64_t v9 = v8;
        unint64_t v10 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          goto LABEL_20;
        }
        if (!swift_dynamicCastObjCProtocolConditional()) {
          goto LABEL_15;
        }
        id v11 = [v9 key];
        if (!v11)
        {
          sub_234B3B588();
          id v11 = (id)sub_234B3B548();
          swift_bridgeObjectRelease();
        }
        uint64_t v12 = self;
        unsigned __int8 v13 = sub_234AE7C28(a2, a3, (uint64_t)v11, v12);

        if (v13)
        {
          id v14 = v9;
          MEMORY[0x237DCC230]();
          if (*(void *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_234B3B758();
          }
          sub_234B3B798();
          sub_234B3B748();
        }
        else
        {
LABEL_15:
          sub_234B3C058();
          sub_234B3C098();
          sub_234B3C0A8();
          sub_234B3C068();
        }
        ++v7;
        if (v10 == v6)
        {
          uint64_t v15 = v19;
          goto LABEL_23;
        }
      }
      if (v7 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      uint64_t v6 = sub_234B3C1B8();
      if (!v6) {
        goto LABEL_22;
      }
    }
    id v8 = *(id *)(a1 + 8 * v7 + 32);
    goto LABEL_7;
  }
LABEL_22:
  uint64_t v15 = MEMORY[0x263F8EE78];
LABEL_23:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_234ADECCC(unint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v6 = a1;
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      unint64_t v9 = v6 & 0xC000000000000001;
      unint64_t v16 = v6;
      uint64_t v17 = v6 & 0xFFFFFFFFFFFFFF8;
      uint64_t v15 = v7;
      while (v9)
      {
        id v10 = (id)MEMORY[0x237DCCB60](v8, v6);
LABEL_7:
        id v11 = v10;
        unint64_t v12 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        int v18 = v10;
        sub_234AE3E50(&v18, a2);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return a3;
        }
        if (v13)
        {
          sub_234B3C058();
          sub_234B3C098();
          sub_234B3C0A8();
          sub_234B3C068();
          uint64_t v7 = v15;
          unint64_t v6 = v16;
        }
        else
        {
        }
        ++v8;
        if (v12 == v7)
        {
          a3 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v17 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = sub_234B3C1B8();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v10 = *(id *)(v6 + 8 * v8 + 32);
    goto LABEL_7;
  }
LABEL_19:
  a3 = MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  return a3;
}

uint64_t sub_234ADEE74()
{
  uint64_t v0 = sub_234AE076C();
  return OUTLINED_FUNCTION_2_3(v0);
}

uint64_t sub_234ADEEA0()
{
  return sub_234ADF8A8();
}

uint64_t sub_234ADEEC8()
{
  uint64_t v0 = sub_234AE0780();
  return OUTLINED_FUNCTION_2_3(v0);
}

id sub_234ADEEF4()
{
  return sub_234ADF914();
}

uint64_t sub_234ADEF1C(uint64_t a1, uint64_t a2)
{
  return sub_234ADEF74(a1, a2, (void (*)(void))sub_234AE5D38, (uint64_t (*)(void))sub_234AE63A8);
}

uint64_t sub_234ADEF48(uint64_t a1, uint64_t a2)
{
  return sub_234ADEF74(a1, a2, (void (*)(void))sub_234AE5EC0, (uint64_t (*)(void))sub_234AE6758);
}

uint64_t sub_234ADEF74(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(void))
{
  if (*(void *)(a1 + 16) <= *(void *)(a2 + 16) >> 3)
  {
    a3();
    return a2;
  }
  else
  {
    return a4();
  }
}

uint64_t sub_234ADEFE0(uint64_t a1, uint64_t a2)
{
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v4 = sub_234B3BEF8();
  }
  else {
    uint64_t v4 = *(void *)(a1 + 16);
  }
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (v4 > *(void *)(a2 + 16) >> 3) {
      goto LABEL_11;
    }
LABEL_14:
    sub_234AE6058(a1);
    return a2;
  }
  if (a2 < 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if (sub_234B3BEF8() / 8 >= v4) {
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_234B3BEF8();
  sub_234A31BB4(v5, v6, v7, v8, v9, v10, v11, v12, v16, v17, v18);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  a2 = v14;
LABEL_11:
  return sub_234AE6C40(a1, a2);
}

void ActionViewModel.__allocating_init(_:)()
{
  id v1 = objc_allocWithZone(v0);
  ActionViewModel.init(_:)();
}

id ActionViewModel.action.getter()
{
  return *(id *)(v0 + OBJC_IVAR___WFActionViewModel_action);
}

void ActionViewModel.init(_:)()
{
  OUTLINED_FUNCTION_9();
  uint64_t v42 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7F98);
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_19_2();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7FA0);
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_17_5();
  uint64_t v10 = &v0[OBJC_IVAR___WFActionViewModel_parameterSummary];
  *(_OWORD *)uint64_t v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((void *)v10 + 4) = 0;
  uint64_t v11 = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR___WFActionViewModel_additionalParameterSummaries] = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR___WFActionViewModel_showMoreParameters] = v11;
  uint64_t v12 = &v0[OBJC_IVAR___WFActionViewModel__resourceError];
  uint64_t v45 = 0;
  uint64_t v13 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7FC8);
  sub_234B39258();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v12, v1, v6);
  uint64_t v45 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D14E0);
  sub_234B39258();
  uint64_t v14 = *(void (**)(uint64_t))(v4 + 32);
  uint64_t v15 = OUTLINED_FUNCTION_35_6();
  v14(v15);
  uint64_t v45 = v11;
  sub_234B39258();
  uint64_t v16 = OUTLINED_FUNCTION_35_6();
  v14(v16);
  uint64_t v17 = OBJC_IVAR___WFActionViewModel_onParameterStateChange;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D7FE8);
  swift_allocObject();
  *(void *)&v13[v17] = sub_234B39208();
  uint64_t v18 = OBJC_IVAR___WFActionViewModel_onVisibleParametersChange;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D7FF0);
  swift_allocObject();
  *(void *)&v13[v18] = sub_234B39208();
  *(void *)&v13[OBJC_IVAR___WFActionViewModel_action] = v42;
  id v19 = v42;
  id v20 = objc_msgSend(v19, sel_visibleParametersWithProcessing_, 0);
  sub_23491E3D4(0, (unint64_t *)&qword_2687D4460);
  uint64_t v21 = sub_234B3B718();

  *(void *)&v13[OBJC_IVAR___WFActionViewModel_visibleParameters] = v21;
  id v22 = objc_msgSend(v19, sel_parameters);
  unint64_t v23 = sub_234B3B718();

  uint64_t v24 = sub_234ADE46C(v23, (unint64_t *)&qword_2687D4460, 0x263F86D60, (unint64_t *)&qword_2687D10D0, (void (*)(id *, id))sub_234A31604);
  unint64_t v25 = swift_bridgeObjectRetain();
  *(void *)&v13[OBJC_IVAR___WFActionViewModel_observingParameters] = sub_234ADF768(v25, v24);
  id v26 = objc_msgSend(v19, sel_identifier);
  if (!v26)
  {
    sub_234B3B588();
    id v26 = (id)sub_234B3B548();
    swift_bridgeObjectRelease();
  }
  WFActionIsFavorite();

  OUTLINED_FUNCTION_32_3();
  sub_234B39258();
  swift_endAccess();
  objc_msgSend(v19, sel_parameterCollapsingBehavior);
  OUTLINED_FUNCTION_32_3();
  sub_234B39258();
  swift_endAccess();
  unsigned __int8 v27 = objc_msgSend(v19, sel_isOutputExpandedInEditor);
  OUTLINED_FUNCTION_32_3();
  unsigned __int8 v44 = v27;
  sub_234B39258();
  swift_endAccess();

  v43.receiver = v13;
  v43.super_class = (Class)type metadata accessor for ActionViewModel();
  id v28 = objc_msgSendSuper2(&v43, sel_init);
  sub_234AE1590();
  sub_234AE1BBC();
  objc_msgSend(v19, sel_addEventObserver_, v28);
  id v29 = objc_msgSend(v19, sel_resourceManager);
  objc_msgSend(v29, sel_addTarget_selector_, v28, sel_resourcesDidChange_);

  id v30 = objc_msgSend(v19, sel_parameters);
  unint64_t v31 = sub_234B3B718();

  if (!(v31 >> 62))
  {
    uint64_t v32 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v32) {
      goto LABEL_5;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v37 = self;
    id v38 = objc_msgSend(v37, sel_defaultCenter);
    objc_msgSend(v38, sel_addObserver_selector_name_object_, v28, sel_favoritesDidChange_, *MEMORY[0x263F870C0], 0);

    id v39 = objc_msgSend(v37, sel_defaultCenter);
    uint64_t v40 = *MEMORY[0x263F838E8];
    id v41 = v28;
    objc_msgSend(v39, sel_addObserver_selector_name_object_, v41, sel_pasteboardDidChange, v40, 0);

    OUTLINED_FUNCTION_10();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_234B3C1B8();
  swift_bridgeObjectRelease();
  if (!v32) {
    goto LABEL_11;
  }
LABEL_5:
  if (v32 >= 1)
  {
    uint64_t v33 = 0;
    do
    {
      if ((v31 & 0xC000000000000001) != 0) {
        id v34 = (id)MEMORY[0x237DCCB60](v33, v31);
      }
      else {
        id v34 = *(id *)(v31 + 8 * v33 + 32);
      }
      uint64_t v35 = v34;
      ++v33;
      objc_msgSend(v34, sel_addEventObserver_, v28);
      id v36 = objc_msgSend(v35, sel_resourceManager);
      objc_msgSend(v36, sel_addTarget_selector_, v28, sel_resourcesDidChange_);
    }
    while (v32 != v33);
    goto LABEL_11;
  }
  __break(1u);
}

unint64_t sub_234ADF768(unint64_t result, uint64_t a2)
{
  uint64_t v2 = a2;
  unint64_t v3 = result;
  uint64_t v8 = a2;
  if (!(result >> 62))
  {
    uint64_t v4 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return v2;
  }
  uint64_t result = sub_234B3C1B8();
  uint64_t v4 = result;
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x237DCCB60](i, v3);
      }
      else {
        id v6 = *(id *)(v3 + 8 * i + 32);
      }
      sub_234A31604(&v7, v6);
    }
    swift_bridgeObjectRelease();
    return v8;
  }
  __break(1u);
  return result;
}

void sub_234ADF848()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  OUTLINED_FUNCTION_32_9();
  sub_234AE06D0();
}

uint64_t sub_234ADF8A8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_234B392A8();
}

id sub_234ADF914()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  OUTLINED_FUNCTION_32_9();
  return objc_msgSend(*(id *)&v0[OBJC_IVAR___WFActionViewModel_action], sel_setOutputExpandedInEditor_, sub_234AE0780() & 1);
}

void ActionViewModel.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_18_3();
  a20 = v22;
  a21 = v23;
  uint64_t v24 = OBJC_IVAR___WFActionViewModel_action;
  unint64_t v25 = *(void **)&v21[OBJC_IVAR___WFActionViewModel_action];
  objc_msgSend(v25, sel_removeEventObserver_, v21);
  id v26 = objc_msgSend(v25, sel_resourceManager);
  objc_msgSend(v26, sel_removeTarget_selector_, v21, sel_resourcesDidChange_);

  id v27 = objc_msgSend(*(id *)&v21[v24], sel_parameters);
  sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
  unint64_t v28 = sub_234B3B718();

  if (!(v28 >> 62))
  {
    uint64_t v29 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v29) {
      goto LABEL_3;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    id v34 = self;
    id v35 = objc_msgSend(v34, sel_defaultCenter);
    objc_msgSend(v35, sel_removeObserver_name_object_, v21, *MEMORY[0x263F870C0], 0);

    id v36 = objc_msgSend(v34, sel_defaultCenter);
    objc_msgSend(v36, sel_removeObserver_name_object_, v21, *MEMORY[0x263F838E8], 0);

    uint64_t v37 = (objc_class *)type metadata accessor for ActionViewModel();
    a9.receiver = v21;
    a9.super_class = v37;
    objc_msgSendSuper2(&a9, sel_dealloc);
    OUTLINED_FUNCTION_15_4();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_234B3C1B8();
  swift_bridgeObjectRelease();
  if (!v29) {
    goto LABEL_9;
  }
LABEL_3:
  if (v29 >= 1)
  {
    uint64_t v30 = 0;
    do
    {
      if ((v28 & 0xC000000000000001) != 0) {
        id v31 = (id)MEMORY[0x237DCCB60](v30, v28);
      }
      else {
        id v31 = *(id *)(v28 + 8 * v30 + 32);
      }
      uint64_t v32 = v31;
      ++v30;
      objc_msgSend(v31, sel_removeEventObserver_, v21);
      id v33 = objc_msgSend(v32, sel_resourceManager);
      objc_msgSend(v33, sel_removeTarget_selector_, v21, sel_resourcesDidChange_);
    }
    while (v29 != v30);
    goto LABEL_9;
  }
  __break(1u);
}

#error "234ADFBEC: call analysis failed (funcsize=10)"

uint64_t sub_234ADFDB8()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___WFActionViewModel_action), sel_localizedName);
  uint64_t v2 = sub_234B3B588();

  return v2;
}

BOOL sub_234ADFE18()
{
  self;
  OUTLINED_FUNCTION_40_3();
  uint64_t v0 = (void *)swift_dynamicCastObjCClass();
  return v0 && objc_msgSend(v0, sel_mode);
}

void sub_234ADFE74(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR___WFActionViewModel_observingParameters;
  swift_bridgeObjectRetain();
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_234ADEFE0(v5, a1);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v2 + v4);
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_234ADEFE0(a1, v7);
  if ((v6 & 0xC000000000000001) != 0)
  {
    sub_234B3BEB8();
    sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
    sub_234A25CBC((unint64_t *)&qword_2687D10D0, (unint64_t *)qword_2687D4460);
    sub_234B3B928();
    uint64_t v6 = v45;
    uint64_t v42 = v46;
    uint64_t v9 = v47;
    int64_t v10 = v48;
    unint64_t v11 = v49;
  }
  else
  {
    int64_t v10 = 0;
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    uint64_t v42 = v6 + 56;
    uint64_t v9 = ~v12;
    uint64_t v13 = -v12;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v11 = v14 & *(void *)(v6 + 56);
  }
  uint64_t v38 = v9;
  int64_t v40 = (unint64_t)(v9 + 64) >> 6;
  if (v6 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v11)
    {
      uint64_t v15 = (v11 - 1) & v11;
      unint64_t v16 = __clz(__rbit64(v11)) | (v10 << 6);
      int64_t v17 = v10;
      goto LABEL_27;
    }
    int64_t v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
LABEL_61:
      __break(1u);
      return;
    }
    if (v20 >= v40) {
      goto LABEL_30;
    }
    unint64_t v21 = *(void *)(v42 + 8 * v20);
    int64_t v17 = v10 + 1;
    if (!v21)
    {
      int64_t v17 = v10 + 2;
      if (v10 + 2 >= v40) {
        goto LABEL_30;
      }
      unint64_t v21 = *(void *)(v42 + 8 * v17);
      if (!v21)
      {
        int64_t v17 = v10 + 3;
        if (v10 + 3 >= v40) {
          goto LABEL_30;
        }
        unint64_t v21 = *(void *)(v42 + 8 * v17);
        if (!v21)
        {
          int64_t v17 = v10 + 4;
          if (v10 + 4 >= v40) {
            goto LABEL_30;
          }
          unint64_t v21 = *(void *)(v42 + 8 * v17);
          if (!v21) {
            break;
          }
        }
      }
    }
LABEL_26:
    uint64_t v15 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v17 << 6);
LABEL_27:
    id v19 = *(id *)(*(void *)(v6 + 48) + 8 * v16);
    if (!v19) {
      goto LABEL_30;
    }
    while (1)
    {
      objc_msgSend(v19, sel_removeEventObserver_, v2, v38);
      id v23 = objc_msgSend(v19, sel_resourceManager);
      objc_msgSend(v23, sel_removeTarget_selector_, v2, sel_resourcesDidChange_);

      int64_t v10 = v17;
      unint64_t v11 = v15;
      if ((v6 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      uint64_t v18 = sub_234B3BF28();
      if (v18)
      {
        unsigned __int8 v44 = (void *)v18;
        sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v19 = v50;
        swift_unknownObjectRelease();
        int64_t v17 = v10;
        uint64_t v15 = v11;
        if (v50) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  int64_t v22 = v10 + 5;
  while (v22 < v40)
  {
    unint64_t v21 = *(void *)(v42 + 8 * v22++);
    if (v21)
    {
      int64_t v17 = v22 - 1;
      goto LABEL_26;
    }
  }
LABEL_30:
  sub_234964040();
  if ((v8 & 0xC000000000000001) != 0)
  {
    sub_234B3BEB8();
    sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
    sub_234A25CBC((unint64_t *)&qword_2687D10D0, (unint64_t *)qword_2687D4460);
    sub_234B3B928();
    uint64_t v8 = (uint64_t)v50;
    uint64_t v43 = v51;
    uint64_t v24 = v52;
    int64_t v25 = v53;
    unint64_t v26 = v54;
  }
  else
  {
    int64_t v25 = 0;
    uint64_t v27 = -1 << *(unsigned char *)(v8 + 32);
    uint64_t v43 = v8 + 56;
    uint64_t v24 = ~v27;
    uint64_t v28 = -v27;
    if (v28 < 64) {
      uint64_t v29 = ~(-1 << v28);
    }
    else {
      uint64_t v29 = -1;
    }
    unint64_t v26 = v29 & *(void *)(v8 + 56);
  }
  int64_t v41 = (unint64_t)(v24 + 64) >> 6;
  uint64_t v39 = v24;
  if (v8 < 0) {
    goto LABEL_39;
  }
LABEL_37:
  if (v26)
  {
    uint64_t v30 = (v26 - 1) & v26;
    unint64_t v31 = __clz(__rbit64(v26)) | (v25 << 6);
    int64_t v32 = v25;
LABEL_56:
    id v33 = *(id *)(*(void *)(v8 + 48) + 8 * v31);
    if (!v33) {
      goto LABEL_59;
    }
    while (1)
    {
      objc_msgSend(v33, sel_addEventObserver_, v2, v39);
      id v37 = objc_msgSend(v33, sel_resourceManager);
      objc_msgSend(v37, sel_addTarget_selector_, v2, sel_resourcesDidChange_);

      int64_t v25 = v32;
      unint64_t v26 = v30;
      if ((v8 & 0x8000000000000000) == 0) {
        goto LABEL_37;
      }
LABEL_39:
      if (sub_234B3BF28())
      {
        sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v33 = v44;
        swift_unknownObjectRelease();
        int64_t v32 = v25;
        uint64_t v30 = v26;
        if (v44) {
          continue;
        }
      }
      goto LABEL_59;
    }
  }
  int64_t v34 = v25 + 1;
  if (__OFADD__(v25, 1)) {
    goto LABEL_61;
  }
  if (v34 >= v41) {
    goto LABEL_59;
  }
  unint64_t v35 = *(void *)(v43 + 8 * v34);
  int64_t v32 = v25 + 1;
  if (v35) {
    goto LABEL_55;
  }
  int64_t v32 = v25 + 2;
  if (v25 + 2 >= v41) {
    goto LABEL_59;
  }
  unint64_t v35 = *(void *)(v43 + 8 * v32);
  if (v35) {
    goto LABEL_55;
  }
  int64_t v32 = v25 + 3;
  if (v25 + 3 >= v41) {
    goto LABEL_59;
  }
  unint64_t v35 = *(void *)(v43 + 8 * v32);
  if (v35) {
    goto LABEL_55;
  }
  int64_t v32 = v25 + 4;
  if (v25 + 4 >= v41) {
    goto LABEL_59;
  }
  unint64_t v35 = *(void *)(v43 + 8 * v32);
  if (v35)
  {
LABEL_55:
    uint64_t v30 = (v35 - 1) & v35;
    unint64_t v31 = __clz(__rbit64(v35)) + (v32 << 6);
    goto LABEL_56;
  }
  int64_t v36 = v25 + 5;
  while (v36 < v41)
  {
    unint64_t v35 = *(void *)(v43 + 8 * v36++);
    if (v35)
    {
      int64_t v32 = v36 - 1;
      goto LABEL_55;
    }
  }
LABEL_59:
  sub_234964040();
}

uint64_t sub_234AE044C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___WFActionViewModel_observingParameters);
  *(void *)(v1 + OBJC_IVAR___WFActionViewModel_observingParameters) = a1;
  sub_234ADFE74(v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_234AE0494()
{
  swift_bridgeObjectRetain();
  sub_234B391F8();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___WFActionViewModel_action), sel_parameters);
  sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
  unint64_t v2 = sub_234B3B718();

  uint64_t v3 = sub_234ADE46C(v2, (unint64_t *)qword_2687D4460, 0x263F86D60, (unint64_t *)&qword_2687D10D0, (void (*)(id *, id))sub_234A31604);
  unint64_t v4 = swift_bridgeObjectRetain();
  unint64_t v5 = sub_234ADF768(v4, v3);
  return sub_234AE044C(v5);
}

uint64_t sub_234AE05A0(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___WFActionViewModel_visibleParameters) = a1;
  swift_bridgeObjectRelease();
  return sub_234AE0494();
}

uint64_t sub_234AE05DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___WFActionViewModel_parameterSummary + 16);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___WFActionViewModel_parameterSummary + 24);
  sub_234AE866C(a1, v1 + OBJC_IVAR___WFActionViewModel_parameterSummary, &qword_2687D80D8);
  uint64_t v4 = OUTLINED_FUNCTION_25_2();
  return sub_234AE86C4(v4, v5, v2, v3);
}

uint64_t sub_234AE064C(uint64_t a1)
{
  return OUTLINED_FUNCTION_13_20(a1);
}

uint64_t sub_234AE0658(uint64_t a1)
{
  return OUTLINED_FUNCTION_13_20(a1);
}

uint64_t sub_234AE0664()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___WFActionViewModel_action), sel_localizedDiscontinuedDescription);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_234B3B588();
  }
  return OUTLINED_FUNCTION_25_2();
}

void sub_234AE06D0()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___WFActionViewModel_action), sel_identifier);
  if (!v1)
  {
    sub_234B3B588();
    id v1 = (id)sub_234B3B548();
    swift_bridgeObjectRelease();
  }
  sub_234AE0758();
  WFActionSetFavorite();
}

uint64_t sub_234AE0758()
{
  return sub_234AE0794();
}

uint64_t sub_234AE076C()
{
  return sub_234AE0794();
}

uint64_t sub_234AE0780()
{
  return sub_234AE0794();
}

uint64_t sub_234AE0794()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_234B39298();
  swift_release();
  swift_release();
  return v1;
}

id (*sub_234AE0800(uint64_t a1))()
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = sub_234AE0780() & 1;
  return sub_234AE084C;
}

id sub_234AE084C()
{
  return sub_234ADF914();
}

uint64_t sub_234AE0874(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFED0);
  double v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, double))(v6 + 16))(v5, a1, v3);
  return sub_234AE09A0((uint64_t)v5);
}

uint64_t sub_234AE0944()
{
  return swift_endAccess();
}

uint64_t sub_234AE09A0(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFED0);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_19_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, a1, v3);
  OUTLINED_FUNCTION_32_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFEC8);
  sub_234B39278();
  swift_endAccess();
  OUTLINED_FUNCTION_7_24();
  return v7();
}

void (*sub_234AE0A84(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFED0);
  v3[4] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[5] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[6] = malloc(v6);
  v3[7] = malloc(v6);
  OUTLINED_FUNCTION_32_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFEC8);
  sub_234B39268();
  swift_endAccess();
  return sub_234AE0B7C;
}

void sub_234AE0B7C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 48);
  uint64_t v4 = *(void **)(*(void *)a1 + 56);
  if (a2)
  {
    uint64_t v5 = v2[4];
    uint64_t v6 = v2[5];
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 48), v4, v5);
    sub_234AE09A0((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    sub_234AE09A0(*(void *)(*(void *)a1 + 56));
  }
  free(v4);
  free(v3);
  free(v2);
}

void sub_234AE0C30()
{
  OUTLINED_FUNCTION_9();
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___WFActionViewModel_action), sel_disabledOnPlatforms);
  type metadata accessor for WFExecutionPlatform(0);
  OUTLINED_FUNCTION_2_29();
  uint64_t v2 = sub_234B3B718();

  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = self;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = *(id *)(v2 + 8 * v5 + 32);
      id v7 = objc_msgSend(v4, sel_currentDevice);
      objc_msgSend(v7, sel_idiom);

      id v8 = (id)WFExecutionPlatformForDeviceIdiom();
      uint64_t v9 = sub_234B3B588();
      uint64_t v11 = v10;
      if (v9 == sub_234B3B588() && v11 == v12) {
        break;
      }
      char v14 = sub_234B3C288();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v14) {
        goto LABEL_13;
      }
      if (v3 == ++v5)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_14;
      }
    }

    swift_bridgeObjectRelease_n();
LABEL_13:
    swift_bridgeObjectRelease_n();
    uint64_t v15 = self;
    uint64_t v16 = *MEMORY[0x263F874B0];
    id v17 = objc_msgSend(v4, sel_currentDevice);
    id v18 = objc_msgSend(v17, sel_idiom);

    id v19 = objc_msgSend(v15, sel_wf_unsupportedActionErrorWithType_platformIdiom_, v16, v18);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
LABEL_14:
  OUTLINED_FUNCTION_10();
}

BOOL sub_234AE0E24()
{
  uint64_t v1 = v0;
  sub_234B39058();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_10_22();
  v3();
  char v4 = sub_234B39048();
  OUTLINED_FUNCTION_7_24();
  v5();
  if ((v4 & 1) == 0) {
    return 0;
  }
  id v6 = *(void **)(v0 + OBJC_IVAR___WFActionViewModel_action);
  if ((objc_msgSend(*(id *)(v1 + OBJC_IVAR___WFActionViewModel_action), sel_inputPassthrough) & 1) == 0)
  {
    uint64_t v7 = *(void *)(sub_234B3BD38() + 16);
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
  }
  id v8 = objc_msgSend(v6, sel_providedVariableNames);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = sub_234B3B718();

    uint64_t v11 = *(void *)(v10 + 16);
    swift_bridgeObjectRelease();
    if (v11) {
      return 1;
    }
  }
  self;
  OUTLINED_FUNCTION_2_29();
  uint64_t v12 = (void *)swift_dynamicCastObjCClass();
  return v12 && objc_msgSend(v12, sel_mode) != (id)2;
}

uint64_t sub_234AE0F8C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_234B39298();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_234AE1000()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_234B392A8();
}

uint64_t sub_234AE106C()
{
  return sub_234A30744();
}

uint64_t sub_234AE1080()
{
  return sub_234942B70();
}

uint64_t sub_234AE1094()
{
  return sub_234A30744();
}

uint64_t sub_234AE10A8()
{
  return sub_234942B70();
}

uint64_t ActionViewModel.onParameterStateChange.getter()
{
  return OUTLINED_FUNCTION_20_14();
}

uint64_t ActionViewModel.onVisibleParametersChange.getter()
{
  return OUTLINED_FUNCTION_20_14();
}

void sub_234AE10D4()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = sub_234B39178();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_9();
  id v6 = *(void **)&v0[OBJC_IVAR___WFActionViewModel_action];
  id v7 = objc_msgSend(v6, sel_visibleParametersWithProcessing_, 0);
  sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
  OUTLINED_FUNCTION_40_3();
  unint64_t v8 = sub_234B3B718();

  swift_bridgeObjectRetain();
  char v9 = sub_2349AB824();
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
    sub_234B39068();
    swift_bridgeObjectRetain_n();
    uint64_t v11 = v0;
    uint64_t v12 = sub_234B39168();
    os_log_type_t v13 = sub_234B3BA58();
    if (os_log_type_enabled(v12, v13))
    {
      os_log_type_t v34 = v13;
      int64_t v36 = v6;
      uint64_t v38 = v11;
      char v14 = (_DWORD *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      unint64_t v35 = v14;
      _DWORD *v14 = 136315394;
      id v37 = v12;
      if (v8 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v15 = sub_234B3C1B8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v15 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v16 = MEMORY[0x263F8EE78];
      if (v15)
      {
        uint64_t v33 = v1;
        uint64_t v39 = MEMORY[0x263F8EE78];
        sub_234952608();
        if (v15 < 0)
        {
          __break(1u);
          return;
        }
        uint64_t v17 = 0;
        uint64_t v16 = v39;
        do
        {
          if ((v8 & 0xC000000000000001) != 0) {
            id v18 = (id)MEMORY[0x237DCCB60](v17, v8);
          }
          else {
            id v18 = *(id *)(v8 + 8 * v17 + 32);
          }
          id v19 = v18;
          id v20 = [v19 key];
          uint64_t v21 = sub_234B3B588();
          uint64_t v23 = v22;

          unint64_t v24 = *(void *)(v39 + 16);
          if (v24 >= *(void *)(v39 + 24) >> 1) {
            sub_234952608();
          }
          ++v17;
          *(void *)(v39 + 16) = v24 + 1;
          uint64_t v25 = v39 + 16 * v24;
          *(void *)(v25 + 32) = v21;
          *(void *)(v25 + 40) = v23;
        }
        while (v15 != v17);
        uint64_t v1 = v33;
      }
      uint64_t v26 = MEMORY[0x237DCC280](v16, MEMORY[0x263F8D310]);
      unint64_t v28 = v27;
      swift_bridgeObjectRelease();
      sub_234AE42B0(v26, v28, &v40);
      sub_234B3BD98();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *((_WORD *)v35 + 6) = 2080;
      id v29 = objc_msgSend(v36, sel_identifier);
      uint64_t v30 = sub_234B3B588();
      unint64_t v32 = v31;

      sub_234AE42B0(v30, v32, &v40);
      sub_234B3BD98();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23490C000, v37, v34, "Visible parameters changed to %s, in action: %s", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_9_5();
      OUTLINED_FUNCTION_9_5();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
    type metadata accessor for ActionViewModel();
    sub_234AE8500((unint64_t *)&unk_2687D8030, (void (*)(uint64_t))type metadata accessor for ActionViewModel);
    OUTLINED_FUNCTION_40_3();
    sub_234B391E8();
    sub_234B39228();
    swift_release();
    sub_234AE05A0(v8);
    OUTLINED_FUNCTION_10();
    return;
  }
  OUTLINED_FUNCTION_10();
  swift_bridgeObjectRelease();
}

void sub_234AE1590()
{
  uint64_t v1 = v0;
  unint64_t v2 = *(void *)(v0 + OBJC_IVAR___WFActionViewModel_visibleParameters);
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR___WFActionViewModel_action);
  swift_bridgeObjectRetain();
  char v4 = objc_msgSend(v3, sel_displaysParameterSummary);
  id v5 = objc_msgSend(v3, sel_parameterSummary);
  id v6 = objc_msgSend(v3, sel_additionalParameterSummaries);
  sub_23491E3D4(0, &qword_2687D8118);
  unint64_t v7 = sub_234B3B718();

  unint64_t v24 = v5;
  sub_234AE18A8(v2, v4, v5, v7, (uint64_t)v3, v25);
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR___WFActionViewModel_parameterSummary);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR___WFActionViewModel_parameterSummary + 8);
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR___WFActionViewModel_parameterSummary + 16);
  uint64_t v10 = *(void *)(v1 + OBJC_IVAR___WFActionViewModel_parameterSummary + 24);
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR___WFActionViewModel_parameterSummary + 32);
  sub_234AE866C((uint64_t)v25, (uint64_t)v26, &qword_2687D80D8);
  uint64_t v14 = v25[0];
  uint64_t v13 = v25[1];
  uint64_t v15 = v25[2];
  uint64_t v16 = v25[3];
  uint64_t v23 = v25[4];
  if (!v10)
  {
    sub_234AE866C((uint64_t)v26, (uint64_t)v29, &qword_2687D80D8);
    if (!v30) {
      goto LABEL_7;
    }
LABEL_6:
    OUTLINED_FUNCTION_7_25();
    sub_234AE8714(v26);
    OUTLINED_FUNCTION_27_7();
    sub_234AE86C4(v14, v13, v15, v16);
LABEL_9:
    type metadata accessor for ActionViewModel();
    sub_234AE8500((unint64_t *)&unk_2687D8030, (void (*)(uint64_t))type metadata accessor for ActionViewModel);
    sub_234B391E8();
    sub_234B39228();
    swift_release();
    sub_234AE8714(v26);
    sub_234AE05DC((uint64_t)v26);
    uint64_t v21 = swift_bridgeObjectRetain();
    sub_234AE064C(v21);
    uint64_t v22 = swift_bridgeObjectRetain();
    sub_234AE0658(v22);
    goto LABEL_10;
  }
  sub_234AE866C((uint64_t)v26, (uint64_t)v29, &qword_2687D80D8);
  if (!v30) {
    goto LABEL_6;
  }
  v27[0] = v9;
  v27[1] = v8;
  v27[2] = v11;
  v27[3] = v10;
  v27[4] = v12;
  v28[0] = v14;
  v28[1] = v13;
  v28[2] = v15;
  v28[3] = v16;
  v28[4] = v23;
  OUTLINED_FUNCTION_7_25();
  OUTLINED_FUNCTION_7_25();
  sub_234AE8714(v26);
  char v17 = sub_234AE3BD0(v27, v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27_7();
  if ((v17 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_7:
  swift_bridgeObjectRetain();
  sub_2349ABA7C();
  char v19 = v18;
  swift_bridgeObjectRelease();
  if ((v19 & 1) == 0) {
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  char v20 = sub_2349AB824();
  swift_bridgeObjectRelease();
  if ((v20 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_10:
  sub_234AE8748(v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

id sub_234AE18A8@<X0>(unint64_t a1@<X0>, char a2@<W1>, void *a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v50 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v8 = MEMORY[0x263F8EE78];
  uint64_t v47 = MEMORY[0x263F8EE78];
  if ((a2 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = MEMORY[0x263F8EE78];
LABEL_25:
    id result = (id)sub_234ADECCC(a1, (uint64_t *)&v48, (uint64_t)&v47);
    *a6 = 0;
    a6[1] = 0;
    a6[2] = v13;
    a6[3] = v15;
    a6[4] = v16;
    a6[5] = v17;
    a6[6] = result;
    return result;
  }
  if (a3)
  {
    swift_bridgeObjectRetain();
    id result = objc_msgSend(a3, sel_localizedFormatStringWithAction_, a5);
    if (result)
    {
      uint64_t v12 = result;
      uint64_t v13 = sub_234B3B588();
      uint64_t v15 = v14;

      v46[0] = v8;
      swift_bridgeObjectRetain();
      id result = (id)sub_234ADEA9C(a1, v13, v15, v46);
      a1 = (unint64_t)result;
      uint64_t v16 = v46[0];
      long long v48 = 0uLL;
      *(void *)&long long v49 = v13;
      *((void *)&v49 + 1) = v15;
      uint64_t v50 = v46[0];
      goto LABEL_8;
    }
  }
  else
  {
    id result = (id)swift_bridgeObjectRetain();
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
LABEL_8:
  if (a4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_234B3C1B8();
    id result = (id)swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
  if (!v18) {
    goto LABEL_25;
  }
  uint64_t v42 = v18;
  if (v18 >= 1)
  {
    uint64_t v37 = v16;
    uint64_t v38 = v15;
    uint64_t v39 = v13;
    uint64_t v40 = a6;
    unint64_t v43 = a4 & 0xC000000000000001;
    swift_bridgeObjectRetain();
    uint64_t v19 = 0;
    unint64_t v41 = a4;
    char v20 = &selRef_systemTimeZone;
    uint64_t v21 = v42;
    do
    {
      if (v43) {
        id v22 = (id)MEMORY[0x237DCCB60](v19, a4);
      }
      else {
        id v22 = *(id *)(a4 + 8 * v19 + 32);
      }
      uint64_t v23 = v22;
      id v24 = objc_msgSend(v22, v20[295], a5);
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = sub_234B3B588();
        uint64_t v28 = v27;

        v46[0] = MEMORY[0x263F8EE78];
        swift_bridgeObjectRetain();
        uint64_t v29 = sub_234ADEA9C(a1, v26, v28, v46);
        uint64_t v30 = v46[0];
        uint64_t v45 = sub_234AE7B20(v23);
        uint64_t v32 = v31;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2349D1CD0();
          uint64_t v17 = v35;
        }
        unint64_t v33 = *(void *)(v17 + 16);
        if (v33 >= *(void *)(v17 + 24) >> 1)
        {
          sub_2349D1CD0();
          uint64_t v17 = v36;
        }
        *(void *)(v17 + 16) = v33 + 1;
        os_log_type_t v34 = (void *)(v17 + 40 * v33);
        v34[4] = v45;
        v34[5] = v32;
        v34[6] = v26;
        v34[7] = v28;
        v34[8] = v30;

        uint64_t v47 = v17;
        a1 = v29;
        a4 = v41;
        uint64_t v21 = v42;
        char v20 = &selRef_systemTimeZone;
      }
      else
      {
      }
      ++v19;
    }
    while (v21 != v19);
    swift_bridgeObjectRelease();
    uint64_t v13 = v39;
    a6 = v40;
    uint64_t v16 = v37;
    uint64_t v15 = v38;
    goto LABEL_25;
  }
  __break(1u);
  return result;
}

void sub_234AE1BBC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___WFActionViewModel_action);
  unint64_t v2 = &selRef_systemTimeZone;
  id v3 = objc_msgSend(v1, sel_resourceManager);
  unint64_t v4 = (unint64_t)objc_msgSend(v3, sel_unavailableResources);

  if (!v4)
  {
    __break(1u);
    return;
  }
  uint64_t v5 = sub_234ADE038((void *)v4);

  unint64_t v25 = MEMORY[0x263F8EE78];
  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0) {
      unint64_t v4 = v5;
    }
    else {
      unint64_t v4 = v5 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_234B3C1B8();
    if (v6) {
      goto LABEL_4;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    unint64_t v4 = MEMORY[0x263F8EE78];
    goto LABEL_20;
  }
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_19;
  }
LABEL_4:
  if (v6 < 1)
  {
    __break(1u);
    goto LABEL_49;
  }
  unint64_t v7 = v1;
  for (uint64_t i = 0; i != v6; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v9 = (id)MEMORY[0x237DCCB60](i, v5);
    }
    else {
      id v9 = *(id *)(v5 + 8 * i + 32);
    }
    uint64_t v10 = v9;
    id v11 = objc_msgSend(v9, sel_availabilityError);

    if (v11)
    {
      MEMORY[0x237DCC230]();
      if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_234B3B758();
      }
      sub_234B3B798();
      sub_234B3B748();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v1 = v7;
  unint64_t v2 = &selRef_systemTimeZone;
  unint64_t v4 = v25;
LABEL_20:
  swift_bridgeObjectRelease();
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_234B3C1B8();
    swift_bridgeObjectRelease();
    if (v14)
    {
LABEL_22:
      sub_23495D834(0, (v4 & 0xC000000000000001) == 0);
      if ((v4 & 0xC000000000000001) == 0)
      {
        id v12 = *(id *)(v4 + 32);
LABEL_24:
        id v24 = v12;
        swift_bridgeObjectRelease();
        id v13 = v24;
        goto LABEL_27;
      }
LABEL_49:
      id v12 = (id)MEMORY[0x237DCCB60](0, v4);
      goto LABEL_24;
    }
  }
  else if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  id v24 = 0;
LABEL_27:
  id v15 = (id)sub_234AE0F8C();
  if (!v24)
  {
    if (!v15) {
      goto LABEL_35;
    }

    uint64_t v16 = 0;
LABEL_34:
    id v17 = v16;
    sub_234AE1000();
    goto LABEL_35;
  }
  swift_unknownObjectRelease();

  if (!v15)
  {
    uint64_t v16 = v24;
    goto LABEL_34;
  }
  uint64_t v16 = v24;
  if (v24 != v15) {
    goto LABEL_34;
  }
LABEL_35:
  uint64_t v18 = sub_234AE7B84([v1 v2[276]]);
  if (v18) {
    sub_234AE1F8C(v18, (SEL *)&selRef_canLogOut);
  }
  sub_234AE106C();
  sub_2349ABDE4();
  char v20 = v19;
  swift_bridgeObjectRelease();
  if (v20) {
    swift_bridgeObjectRelease();
  }
  else {
    sub_234AE1080();
  }
  uint64_t v21 = sub_234AE7B84([v1 v2[276]]);
  if (v21) {
    sub_234AE1F8C(v21, (SEL *)&selRef_supportsMultipleAccounts);
  }
  sub_234AE1094();
  sub_2349ABDE4();
  char v23 = v22;
  swift_bridgeObjectRelease();
  if (v23) {
    swift_bridgeObjectRelease();
  }
  else {
    sub_234AE10A8();
  }
}

void sub_234AE1F8C(uint64_t a1, SEL *a2)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_234B3BEB8();
    sub_23491E3D4(0, &qword_2687D14F8);
    sub_234A25CBC(&qword_2687D14F0, &qword_2687D14F8);
    sub_234B3B928();
    uint64_t v3 = v21;
    uint64_t v19 = v22;
    uint64_t v4 = v23;
    int64_t v5 = v24;
    unint64_t v6 = v25;
  }
  else
  {
    int64_t v5 = 0;
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v19 = a1 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(a1 + 56);
  }
  uint64_t v18 = v4;
  int64_t v10 = (unint64_t)(v4 + 64) >> 6;
  if (v3 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v6)
    {
      uint64_t v11 = (v6 - 1) & v6;
      unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
      int64_t v13 = v5;
      goto LABEL_29;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v15 >= v10) {
      goto LABEL_35;
    }
    unint64_t v16 = *(void *)(v19 + 8 * v15);
    int64_t v13 = v5 + 1;
    if (!v16)
    {
      int64_t v13 = v5 + 2;
      if (v5 + 2 >= v10) {
        goto LABEL_35;
      }
      unint64_t v16 = *(void *)(v19 + 8 * v13);
      if (!v16)
      {
        int64_t v13 = v5 + 3;
        if (v5 + 3 >= v10) {
          goto LABEL_35;
        }
        unint64_t v16 = *(void *)(v19 + 8 * v13);
        if (!v16)
        {
          int64_t v13 = v5 + 4;
          if (v5 + 4 >= v10) {
            goto LABEL_35;
          }
          unint64_t v16 = *(void *)(v19 + 8 * v13);
          if (!v16)
          {
            int64_t v13 = v5 + 5;
            if (v5 + 5 >= v10) {
              goto LABEL_35;
            }
            unint64_t v16 = *(void *)(v19 + 8 * v13);
            if (!v16)
            {
              int64_t v17 = v5 + 6;
              while (v17 < v10)
              {
                unint64_t v16 = *(void *)(v19 + 8 * v17++);
                if (v16)
                {
                  int64_t v13 = v17 - 1;
                  goto LABEL_28;
                }
              }
LABEL_35:
              sub_234964040();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v11 = (v16 - 1) & v16;
    unint64_t v12 = __clz(__rbit64(v16)) + (v13 << 6);
LABEL_29:
    id v14 = *(id *)(*(void *)(v3 + 48) + 8 * v12);
    if (!v14) {
      goto LABEL_35;
    }
    while (1)
    {
      if (objc_msgSend(v14, *a2, v18))
      {
        sub_234B3C058();
        sub_234B3C098();
        sub_234B3C0A8();
        sub_234B3C068();
      }
      else
      {
      }
      int64_t v5 = v13;
      unint64_t v6 = v11;
      if ((v3 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_234B3BF28())
      {
        sub_23491E3D4(0, &qword_2687D14F8);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v14 = v20;
        swift_unknownObjectRelease();
        int64_t v13 = v5;
        uint64_t v11 = v6;
        if (v20) {
          continue;
        }
      }
      goto LABEL_35;
    }
  }
  __break(1u);
}

void sub_234AE228C()
{
  OUTLINED_FUNCTION_9();
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = sub_234B39178();
  OUTLINED_FUNCTION_0_0();
  uint64_t v27 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_24_1();
  uint64_t v11 = sub_234B3B298();
  OUTLINED_FUNCTION_0_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_6_9();
  sub_23491E3D4(0, (unint64_t *)&qword_2687CFFC0);
  *uint64_t v1 = sub_234B3BB08();
  OUTLINED_FUNCTION_10_22();
  v15();
  char v16 = sub_234B3B2B8();
  (*(void (**)(uint64_t *, uint64_t))(v13 + 8))(v1, v11);
  if (v16)
  {
    sub_234B39068();
    swift_bridgeObjectRetain_n();
    id v17 = v7;
    uint64_t v18 = sub_234B39168();
    os_log_type_t v19 = sub_234B3BA58();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      v28[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315394;
      swift_bridgeObjectRetain();
      sub_234AE42B0(v5, v3, v28);
      sub_234B3BD98();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v20 + 12) = 2080;
      unint64_t v21 = v3;
      id v22 = objc_msgSend(v17, sel_identifier);
      uint64_t v23 = sub_234B3B588();
      uint64_t v26 = v8;
      unint64_t v25 = v24;

      unint64_t v3 = v21;
      sub_234AE42B0(v23, v25, v28);
      sub_234B3BD98();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23490C000, v18, v19, "Parameter state changed for key: %s, in action: %s", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_9_5();
      OUTLINED_FUNCTION_9_5();

      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v0, v26);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v0, v8);
    }
    sub_234AE10D4();
    sub_234AE1590();
    v28[0] = v5;
    v28[1] = v3;
    sub_234B391F8();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    __break(1u);
  }
}

void sub_234AE2654()
{
}

void sub_234AE26C8()
{
}

void sub_234AE273C()
{
  OUTLINED_FUNCTION_9();
  unint64_t v3 = v2;
  uint64_t v4 = sub_234B39178();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_18_18();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_17_5();
  char v9 = sub_23491E3D4(0, (unint64_t *)&qword_2687CFFC0);
  *uint64_t v1 = sub_234B3BB08();
  OUTLINED_FUNCTION_10_22();
  v10();
  sub_234B3B2B8();
  uint64_t v11 = OUTLINED_FUNCTION_15_17();
  v12(v11);
  if (v9)
  {
    sub_234B39068();
    id v13 = v3;
    uint64_t v14 = sub_234B39168();
    os_log_type_t v15 = sub_234B3BA58();
    if (os_log_type_enabled(v14, v15))
    {
      char v16 = (uint8_t *)OUTLINED_FUNCTION_11_22();
      uint64_t v22 = OUTLINED_FUNCTION_14_6();
      *(_DWORD *)char v16 = 136315138;
      id v17 = objc_msgSend(v13, sel_identifier);
      uint64_t v18 = sub_234B3B588();
      unint64_t v20 = v19;

      uint64_t v21 = sub_234AE42B0(v18, v20, &v22);
      OUTLINED_FUNCTION_57(v21);
      sub_234B3BD98();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23490C000, v14, v15, "Action visible parameters changed: %s", v16, 0xCu);
      OUTLINED_FUNCTION_44_4();
      OUTLINED_FUNCTION_9_5();
      OUTLINED_FUNCTION_9_5();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0, v4);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0, v4);
    }
    sub_234AE10D4();
    sub_234AE1590();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    __break(1u);
  }
}

void sub_234AE2A24()
{
}

void sub_234AE2A98()
{
}

void sub_234AE2AA4()
{
  OUTLINED_FUNCTION_9();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_234B39178();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = OUTLINED_FUNCTION_18_18();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_18();
  os_log_type_t v15 = (uint64_t *)(v14 - v13);
  sub_23491E3D4(0, (unint64_t *)&qword_2687CFFC0);
  *os_log_type_t v15 = sub_234B3BB08();
  OUTLINED_FUNCTION_10_22();
  v16();
  char v17 = sub_234B3B2B8();
  (*(void (**)(uint64_t *, uint64_t))(v11 + 8))(v15, v9);
  if (v17)
  {
    sub_234B39068();
    id v18 = v4;
    unint64_t v19 = sub_234B39168();
    os_log_type_t v20 = sub_234B3BA58();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)OUTLINED_FUNCTION_11_22();
      uint64_t v28 = OUTLINED_FUNCTION_14_6();
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t v27 = v5;
      id v22 = objc_msgSend(v18, sel_identifier);
      uint64_t v23 = sub_234B3B588();
      unint64_t v25 = v24;

      uint64_t v26 = sub_234AE42B0(v23, v25, &v28);
      OUTLINED_FUNCTION_57(v26);
      sub_234B3BD98();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23490C000, v19, v20, v2, v21, 0xCu);
      OUTLINED_FUNCTION_44_4();
      OUTLINED_FUNCTION_9_5();
      OUTLINED_FUNCTION_9_5();

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0, v27);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0, v5);
    }
    type metadata accessor for ActionViewModel();
    sub_234AE8500((unint64_t *)&unk_2687D8030, (void (*)(uint64_t))type metadata accessor for ActionViewModel);
    sub_234B391E8();
    sub_234B39228();
    swift_release();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    __break(1u);
  }
}

void sub_234AE2E00()
{
  OUTLINED_FUNCTION_9();
  unint64_t v3 = v0;
  uint64_t v5 = v4;
  uint64_t v6 = sub_234B39178();
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  os_log_type_t v10 = OUTLINED_FUNCTION_6_28();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_17_5();
  char v12 = sub_23491E3D4(0, (unint64_t *)&qword_2687CFFC0);
  *unint64_t v2 = sub_234B3BB08();
  OUTLINED_FUNCTION_10_22();
  v13();
  sub_234B3B2B8();
  uint64_t v14 = OUTLINED_FUNCTION_15_17();
  v15(v14);
  if (v12)
  {
    sub_234B39068();
    id v16 = v5;
    id v17 = v3;
    id v18 = v16;
    unint64_t v19 = (char *)v17;
    os_log_type_t v20 = sub_234B39168();
    os_log_type_t v21 = sub_234B3BA58();
    if (OUTLINED_FUNCTION_33_5(v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315394;
      id v23 = [v18 key];
      uint64_t v24 = sub_234B3B588();
      unint64_t v26 = v25;

      sub_234AE42B0(v24, v26, &v33);
      sub_234B3BD98();

      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2080;
      id v27 = objc_msgSend(*(id *)&v19[OBJC_IVAR___WFActionViewModel_action], sel_identifier);
      uint64_t v28 = sub_234B3B588();
      unint64_t v30 = v29;

      sub_234AE42B0(v28, v30, &v33);
      sub_234B3BD98();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23490C000, v20, v10, "Parameter attributes changed: %s, in action: %s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_9_5();
      OUTLINED_FUNCTION_9_5();

      uint64_t v31 = OUTLINED_FUNCTION_12_21();
      v32(v31);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
    }
    sub_234AE10D4();
    sub_234AE1590();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    __break(1u);
  }
}

void sub_234AE3184()
{
  OUTLINED_FUNCTION_9();
  unint64_t v2 = v0;
  sub_234B39178();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6_28();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_24_1();
  char v5 = sub_23491E3D4(0, (unint64_t *)&qword_2687CFFC0);
  *uint64_t v1 = sub_234B3BB08();
  OUTLINED_FUNCTION_10_22();
  v6();
  sub_234B3B2B8();
  uint64_t v7 = OUTLINED_FUNCTION_16_18();
  v8(v7);
  if (v5)
  {
    sub_234B39068();
    uint64_t v9 = v2;
    os_log_type_t v10 = (void *)sub_234B39168();
    os_log_type_t v11 = sub_234B3BA58();
    if (OUTLINED_FUNCTION_33_5(v11))
    {
      OUTLINED_FUNCTION_11_22();
      uint64_t v23 = OUTLINED_FUNCTION_14_6();
      OUTLINED_FUNCTION_26_9(4.8149e-34);
      id v12 = objc_msgSend(*(id *)&v9[OBJC_IVAR___WFActionViewModel_action], sel_identifier);
      uint64_t v13 = sub_234B3B588();
      unint64_t v15 = v14;

      uint64_t v16 = sub_234AE42B0(v13, v15, &v23);
      OUTLINED_FUNCTION_21_12(v16);

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_41_3(&dword_23490C000, v17, v18, "Resources changed in action: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_9_5();
      OUTLINED_FUNCTION_9_5();

      uint64_t v19 = OUTLINED_FUNCTION_12_21();
      v20(v19);
    }
    else
    {

      uint64_t v21 = OUTLINED_FUNCTION_42_3();
      v22(v21);
    }
    sub_234AE10D4();
    sub_234AE1590();
    sub_234AE1BBC();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    __break(1u);
  }
}

void sub_234AE3420()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_234B3B298();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_18();
  uint64_t v8 = (uint64_t *)(v7 - v6);
  sub_23491E3D4(0, (unint64_t *)&qword_2687CFFC0);
  *uint64_t v8 = sub_234B3BB08();
  OUTLINED_FUNCTION_10_22();
  v9();
  char v10 = sub_234B3B2B8();
  (*(void (**)(uint64_t *, uint64_t))(v4 + 8))(v8, v2);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    return;
  }
  uint64_t v11 = sub_234B38238();
  if (!v11)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    goto LABEL_7;
  }
  uint64_t v12 = v11;
  *(void *)&long long v25 = sub_234B3B588();
  *((void *)&v25 + 1) = v13;
  sub_234B3BF88();
  sub_234A41F68((uint64_t)v24, v12, &v25);
  swift_bridgeObjectRelease();
  sub_23499D6D4((uint64_t)v24);
  if (!*((void *)&v26 + 1))
  {
LABEL_7:
    sub_23496C714((uint64_t)&v25);
    goto LABEL_8;
  }
  if (swift_dynamicCast())
  {
    uint64_t v15 = v24[0];
    uint64_t v14 = v24[1];
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v15 = 0;
  uint64_t v14 = 0;
LABEL_9:
  uint64_t v16 = *(void **)(v1 + OBJC_IVAR___WFActionViewModel_action);
  id v17 = objc_msgSend(v16, sel_identifier);
  uint64_t v18 = sub_234B3B588();
  uint64_t v20 = v19;

  if (!v14)
  {
    swift_bridgeObjectRelease();
    return;
  }
  if (v15 == v18 && v14 == v20)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v22 = sub_234B3C288();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0) {
      return;
    }
  }
  id v23 = objc_msgSend(v16, sel_identifier);
  if (!v23)
  {
    sub_234B3B588();
    id v23 = (id)sub_234B3B548();
    swift_bridgeObjectRelease();
  }
  WFActionIsFavorite();

  sub_234ADF848();
}

void sub_234AE37A0()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = v0;
  sub_234B39178();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6_28();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_24_1();
  char v5 = sub_23491E3D4(0, (unint64_t *)&qword_2687CFFC0);
  *uint64_t v1 = sub_234B3BB08();
  OUTLINED_FUNCTION_10_22();
  v6();
  sub_234B3B2B8();
  uint64_t v7 = OUTLINED_FUNCTION_16_18();
  v8(v7);
  if (v5)
  {
    sub_234B39068();
    uint64_t v9 = v2;
    char v10 = (void *)sub_234B39168();
    os_log_type_t v11 = sub_234B3BA58();
    if (OUTLINED_FUNCTION_33_5(v11))
    {
      OUTLINED_FUNCTION_11_22();
      uint64_t v23 = OUTLINED_FUNCTION_14_6();
      OUTLINED_FUNCTION_26_9(4.8149e-34);
      id v12 = objc_msgSend(*(id *)&v9[OBJC_IVAR___WFActionViewModel_action], sel_identifier);
      uint64_t v13 = sub_234B3B588();
      unint64_t v15 = v14;

      uint64_t v16 = sub_234AE42B0(v13, v15, &v23);
      OUTLINED_FUNCTION_21_12(v16);

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_41_3(&dword_23490C000, v17, v18, "Pasteboard changed, reloading action: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_9_5();
      OUTLINED_FUNCTION_9_5();

      uint64_t v19 = OUTLINED_FUNCTION_12_21();
      v20(v19);
    }
    else
    {

      uint64_t v21 = OUTLINED_FUNCTION_42_3();
      v22(v21);
    }
    type metadata accessor for ActionViewModel();
    sub_234AE8500((unint64_t *)&unk_2687D8030, (void (*)(uint64_t))type metadata accessor for ActionViewModel);
    OUTLINED_FUNCTION_40_3();
    sub_234B391E8();
    sub_234B39228();
    swift_release();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    __break(1u);
  }
}

id ActionViewModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ActionViewModel.init()()
{
}

uint64_t sub_234AE3AE4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ActionViewModel();
  uint64_t result = sub_234B391E8();
  *a1 = result;
  return result;
}

uint64_t sub_234AE3B24()
{
  sub_234AE866C(v0, (uint64_t)v4, &qword_2687D0DD8);
  sub_234AE866C((uint64_t)v4, (uint64_t)v5, &qword_2687D0DD8);
  if (v5[1]) {
    sub_234B3B5F8();
  }
  swift_bridgeObjectRetain();
  sub_234B3B5F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v1 = OUTLINED_FUNCTION_25_2();
  sub_234AE7C80(v1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_234AE3BD0(void *a1, void *a2)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a2[1];
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    BOOL v6 = *a1 == *a2 && v4 == v5;
    if (!v6 && (sub_234B3C288() & 1) == 0) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  BOOL v7 = a1[2] == a2[2] && a1[3] == a2[3];
  if (!v7 && (sub_234B3C288() & 1) == 0) {
    return 0;
  }
  return sub_2349AB824();
}

uint64_t sub_234AE3C74()
{
  sub_234B3C308();
  sub_234AE866C(v0, (uint64_t)v4, &qword_2687D0DD8);
  sub_234AE866C((uint64_t)v4, (uint64_t)v5, &qword_2687D0DD8);
  if (v5[1]) {
    sub_234B3B5F8();
  }
  swift_bridgeObjectRetain();
  sub_234B3B5F8();
  swift_bridgeObjectRelease();
  unint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  sub_234AE7C80((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_234B3C368();
}

uint64_t sub_234AE3D34()
{
  return sub_234AE3C74();
}

uint64_t sub_234AE3D70()
{
  return sub_234AE3B24();
}

uint64_t sub_234AE3DAC()
{
  uint64_t v1 = *(void *)(v0 + 8);
  unint64_t v2 = *(void *)(v0 + 32);
  sub_234B3C308();
  if (v1) {
    sub_234B3B5F8();
  }
  swift_bridgeObjectRetain();
  sub_234B3B5F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_234AE7C80((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  return sub_234B3C368();
}

void sub_234AE3E50(void **a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  self;
  id v35 = (id)swift_dynamicCastObjCClass();
  if (v35)
  {
    uint64_t v4 = *a2;
    uint64_t v5 = a2[1];
    uint64_t v7 = a2[2];
    uint64_t v6 = a2[3];
    uint64_t v8 = a2[4];
    if (v6)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687D8120);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_234B6B860;
      *(void *)(v9 + 32) = v4;
      *(void *)(v9 + 40) = v5;
      *(void *)(v9 + 48) = v7;
      *(void *)(v9 + 56) = v6;
      *(void *)(v9 + 64) = v8;
    }
    else
    {
      uint64_t v9 = MEMORY[0x263F8EE78];
    }
    uint64_t v36 = v9;
    id v10 = v3;
    sub_234985260(v4, v5, v7, v6);
    swift_bridgeObjectRetain();
    sub_23495C674();
    uint64_t v11 = v36;
    uint64_t v30 = *(void *)(v36 + 16);
    if (v30)
    {
      unint64_t v12 = 0;
      uint64_t v31 = v10;
      while (v12 < *(void *)(v11 + 16))
      {
        unint64_t v13 = *(void *)(v36 + 32 + 40 * v12 + 32);
        unint64_t v32 = v12;
        if (v13 >> 62)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          uint64_t v14 = sub_234B3C1B8();
          if (v14)
          {
LABEL_10:
            unint64_t v33 = v13;
            unint64_t v34 = v13 & 0xC000000000000001;
            uint64_t v15 = 4;
            while (1)
            {
              id v16 = v34 ? (id)MEMORY[0x237DCCB60](v15 - 4, v13) : *(id *)(v13 + 8 * v15);
              uint64_t v17 = v15 - 3;
              if (__OFADD__(v15 - 4, 1)) {
                break;
              }
              uint64_t v18 = v14;
              uint64_t v19 = v16;
              id v20 = [v16 key];
              uint64_t v21 = sub_234B3B588();
              uint64_t v23 = v22;

              id v24 = objc_msgSend(v35, sel_multipleValueParameterKey);
              uint64_t v25 = sub_234B3B588();
              uint64_t v27 = v26;

              BOOL v28 = v21 == v25 && v23 == v27;
              if (v28)
              {
                swift_bridgeObjectRelease();

                swift_bridgeObjectRelease();
LABEL_29:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();

                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease();
                return;
              }
              char v29 = sub_234B3C288();

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v29) {
                goto LABEL_29;
              }
              ++v15;
              uint64_t v14 = v18;
              BOOL v28 = v17 == v18;
              unint64_t v13 = v33;
              if (v28) {
                goto LABEL_22;
              }
            }
            __break(1u);
            break;
          }
        }
        else
        {
          uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          if (v14) {
            goto LABEL_10;
          }
        }
LABEL_22:
        unint64_t v12 = v32 + 1;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        uint64_t v11 = v36;
        id v10 = v31;
        if (v32 + 1 == v30) {
          goto LABEL_26;
        }
      }
      __break(1u);
    }
    else
    {
LABEL_26:

      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_234AE418C(id *a1)
{
  id v1 = *a1;
  return sub_234AE1000();
}

uint64_t sub_234AE41BC()
{
  return sub_234AE1080();
}

uint64_t sub_234AE41E8()
{
  return sub_234AE10A8();
}

uint64_t type metadata accessor for ActionViewModel()
{
  uint64_t result = qword_2687D80A0;
  if (!qword_2687D80A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_234AE425C()
{
  uint64_t v0 = sub_234AE0780();
  return OUTLINED_FUNCTION_2_3(v0);
}

id sub_234AE4288()
{
  return sub_234ADF914();
}

uint64_t sub_234AE42B0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_234AE4384(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_234963FD4((uint64_t)v12, *a3);
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
      sub_234963FD4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_234AE4384(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_234AE44DC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_234B3BDA8();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_234AE45B4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_234B3C038();
    if (!v8)
    {
      uint64_t result = sub_234B3C148();
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

void *sub_234AE44DC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_234B3C208();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_234AE45B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_234AE464C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_234AE4828(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_234AE4828((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_234AE464C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_234B3B648();
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
  unint64_t v3 = sub_234AE47C0(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_234B3BFE8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_234B3C208();
  __break(1u);
LABEL_14:
  uint64_t result = sub_234B3C148();
  __break(1u);
  return result;
}

void *sub_234AE47C0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D8100);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size_0(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_234AE4828(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D8100);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size_0(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_234AE49D8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_234AE4900(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_234AE4900(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_234B3C208();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_234AE49D8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_234B3C208();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_234AE4A68@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *v2;
  sub_234B3C308();
  sub_234B3C318();
  uint64_t result = sub_234B3C368();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = result & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_9:
    *a2 = 0;
    return result;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a1)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_9;
      }
    }
    while (*(void *)(v9 + 8 * v8) != a1);
  }
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_14_22();
  if (!v12)
  {
    sub_234A336B0();
    uint64_t v11 = v13;
  }
  *a2 = *(void *)(*(void *)(v11 + 48) + 8 * v8);
  sub_234AE50A0(v8);
  *uint64_t v2 = v13;
  return swift_bridgeObjectRelease();
}

uint64_t sub_234AE4B80()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_234B3B588();
  sub_234B3C308();
  swift_bridgeObjectRetain();
  sub_234B3B5F8();
  uint64_t v3 = sub_234B3C368();
  swift_bridgeObjectRelease();
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = v3 & ~v4;
  OUTLINED_FUNCTION_65_1();
  if ((v6 & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v7 = sub_234B3B588();
  uint64_t v9 = v8;
  if (v7 == sub_234B3B588() && v9 == v10)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v12 = OUTLINED_FUNCTION_32_6();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = ~v4;
      do
      {
        unint64_t v5 = (v5 + 1) & v13;
        OUTLINED_FUNCTION_65_1();
        if ((v14 & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v15 = sub_234B3B588();
        uint64_t v17 = v16;
        if (v15 == sub_234B3B588() && v17 == v18) {
          goto LABEL_16;
        }
        char v20 = OUTLINED_FUNCTION_32_6();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v20 & 1) == 0);
    }
  }
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_14_22();
  if (!v23)
  {
    sub_234A339DC();
    uint64_t v22 = v25;
  }
  uint64_t v21 = *(void *)(*(void *)(v22 + 48) + 8 * v5);
  sub_234AE5240(v5);
  *id v1 = v25;
  swift_bridgeObjectRelease();
  return v21;
}

void sub_234AE4D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void sub_234AE4D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_18_3();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v16 = *v10;
  if ((*v10 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v17 = v15;
    char v18 = sub_234B3BF38();

    if (v18) {
      sub_234AE4F2C();
    }
  }
  else
  {
    uint64_t v19 = v11;
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_234B3BCB8();
    uint64_t v21 = -1 << *(unsigned char *)(v16 + 32);
    unint64_t v22 = v20 & ~v21;
    OUTLINED_FUNCTION_46_3();
    if (v23)
    {
      sub_23491E3D4(0, v13);
      id v24 = *(id *)(*(void *)(v16 + 48) + 8 * v22);
      char v25 = sub_234B3BCC8();

      if (v25)
      {
LABEL_9:
        swift_bridgeObjectRelease();
        swift_isUniquelyReferenced_nonNull_native();
        OUTLINED_FUNCTION_14_22();
        if (!v30) {
          v19();
        }
        sub_234AE5418(v22);
        *uint64_t v10 = a10;
      }
      else
      {
        uint64_t v26 = ~v21;
        while (1)
        {
          unint64_t v22 = (v22 + 1) & v26;
          OUTLINED_FUNCTION_46_3();
          if ((v27 & 1) == 0) {
            break;
          }
          id v28 = *(id *)(*(void *)(v16 + 48) + 8 * v22);
          char v29 = sub_234B3BCC8();

          if (v29) {
            goto LABEL_9;
          }
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_4();
}

void sub_234AE4F2C()
{
  OUTLINED_FUNCTION_18_3();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  unint64_t v5 = v0;
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_234B3BEF8();
  uint64_t v7 = swift_unknownObjectRetain();
  uint64_t v8 = v4(v7, v6);
  swift_retain();
  uint64_t v9 = sub_234B3BCB8();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v11 = v9 & ~v10;
  OUTLINED_FUNCTION_47_2();
  if (v12)
  {
    sub_23491E3D4(0, v2);
    id v13 = *(id *)(*(void *)(v8 + 48) + 8 * v11);
    char v14 = sub_234B3BCC8();

    if (v14)
    {
LABEL_6:
      swift_release();
      sub_234AE5418(v11);
      if (sub_234B3BCC8())
      {
        *unint64_t v5 = v8;
        OUTLINED_FUNCTION_15_4();
        return;
      }
      __break(1u);
    }
    else
    {
      uint64_t v15 = ~v10;
      while (1)
      {
        unint64_t v11 = (v11 + 1) & v15;
        OUTLINED_FUNCTION_47_2();
        if ((v16 & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v8 + 48) + 8 * v11);
        char v18 = sub_234B3BCC8();

        if (v18) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  swift_release();
  __break(1u);
}

unint64_t sub_234AE50A0(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_234B3BE88();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_234B3C308();
        sub_234B3C318();
        uint64_t v10 = sub_234B3C368() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 >= v9 && v2 >= v10)
          {
LABEL_15:
            uint64_t v13 = *(void *)(v3 + 48);
            char v14 = (void *)(v13 + 8 * v2);
            uint64_t v15 = (void *)(v13 + 8 * v6);
            BOOL v16 = v2 != v6 || v14 >= v15 + 1;
            int64_t v2 = v6;
            if (v16)
            {
              void *v14 = *v15;
              int64_t v2 = v6;
            }
          }
        }
        else if (v10 >= v9 || v2 >= v10)
        {
          goto LABEL_15;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v17 = *(void *)(v3 + 16);
  BOOL v18 = __OFSUB__(v17, 1);
  uint64_t v19 = v17 - 1;
  if (v18)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v19;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_234AE5240(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_234B3BE88();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        uint64_t v10 = *(void **)(*(void *)(v3 + 48) + 8 * v6);
        sub_234B3B588();
        sub_234B3C308();
        id v11 = v10;
        sub_234B3B5F8();
        uint64_t v12 = sub_234B3C368();

        swift_bridgeObjectRelease();
        unint64_t v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= (uint64_t)v13)
          {
LABEL_15:
            uint64_t v16 = *(void *)(v3 + 48);
            uint64_t v17 = (void *)(v16 + 8 * v2);
            BOOL v18 = (void *)(v16 + 8 * v6);
            BOOL v19 = v2 != v6 || v17 >= v18 + 1;
            int64_t v2 = v6;
            if (v19)
            {
              void *v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= (uint64_t)v13)
        {
          goto LABEL_15;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v22;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_234AE5418(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_234B3BE88();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        uint64_t v11 = sub_234B3BCB8();

        unint64_t v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= (uint64_t)v12)
          {
LABEL_15:
            uint64_t v15 = *(void *)(v3 + 48);
            uint64_t v16 = (void *)(v15 + 8 * v2);
            uint64_t v17 = (void *)(v15 + 8 * v6);
            BOOL v18 = v2 != v6 || v16 >= v17 + 1;
            int64_t v2 = v6;
            if (v18)
            {
              void *v16 = *v17;
              int64_t v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= (uint64_t)v12)
        {
          goto LABEL_15;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_234AE55B0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_234AE55E8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_35:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D80E0);
  uint64_t result = sub_234B3BFC8();
  uint64_t v9 = result;
  id v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_35;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_35;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_35;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v4 + 48) + 8 * v14);
    sub_234B3C308();
    sub_234B3C318();
    uint64_t result = sub_234B3C368();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) == 0)
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      while (++v21 != v24 || (v23 & 1) == 0)
      {
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
        if (v26 != -1)
        {
          unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_38;
    }
    if (!v5) {
      goto LABEL_35;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_35;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_35;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_234AE584C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_35:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D4700);
  uint64_t result = sub_234B3BFC8();
  uint64_t v9 = result;
  int v30 = a1;
  uint64_t v31 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= v31) {
      goto LABEL_35;
    }
    unint64_t v16 = v30[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= v31) {
        goto LABEL_35;
      }
      unint64_t v16 = v30[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= v31) {
          goto LABEL_35;
        }
        unint64_t v16 = v30[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = *(void **)(*(void *)(v4 + 48) + 8 * v14);
    sub_234B3B588();
    sub_234B3C308();
    id v19 = v18;
    sub_234B3B5F8();
    uint64_t v20 = sub_234B3C368();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v21 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) == 0)
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      while (++v23 != v26 || (v25 & 1) == 0)
      {
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v23);
        if (v28 != -1)
        {
          unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(void *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    *(void *)(*(void *)(v9 + 48) + 8 * v24) = v19;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_38;
    }
    if (!v5) {
      goto LABEL_35;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= v31) {
    goto LABEL_35;
  }
  unint64_t v16 = v30[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v31) {
      goto LABEL_35;
    }
    unint64_t v16 = v30[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_234AE5AE0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_35:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D4668);
  uint64_t result = sub_234B3BFC8();
  uint64_t v9 = result;
  uint64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_35;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_35;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_35;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    id v18 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = sub_234B3BCB8();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) == 0)
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      while (++v21 != v24 || (v23 & 1) == 0)
      {
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
        if (v26 != -1)
        {
          unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_38;
    }
    if (!v5) {
      goto LABEL_35;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_35;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_35;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_234AE5D38(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  if (!v6) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v9 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v8 << 6))
  {
    uint64_t result = sub_234AE4A68(*(void *)(*(void *)(v2 + 48) + 8 * i), &v14);
    if (v6) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v11 >= v7) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v3 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v12 = *(void *)(v3 + 8 * v8);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_21:
    unint64_t v6 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 4;
  if (v13 < v7)
  {
    unint64_t v12 = *(void *)(v3 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_21;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_21;
  }
LABEL_24:
  return swift_release();
}

void sub_234AE5EC0(uint64_t a1)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return;
  }
  uint64_t v3 = a1 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  if (!v6) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v9 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v8 << 6))
  {
    id v14 = *(id *)(*(void *)(a1 + 48) + 8 * i);
    uint64_t v15 = (void *)sub_234AE4B80();

    if (v6) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return;
    }
    if (v11 >= v7) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v3 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v12 = *(void *)(v3 + 8 * v8);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_21:
    unint64_t v6 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 4;
  if (v13 < v7)
  {
    unint64_t v12 = *(void *)(v3 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_21;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_21;
  }
LABEL_24:
  swift_release();
}

void sub_234AE6058(uint64_t a1)
{
  if ((*(void *)v1 & 0xC000000000000001) != 0)
  {
    if (!sub_234B3BEF8()) {
      return;
    }
LABEL_5:
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_234B3BEB8();
      sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
      sub_234A25CBC((unint64_t *)&qword_2687D10D0, (unint64_t *)qword_2687D4460);
      sub_234B3B928();
      a1 = v26;
      uint64_t v24 = v27;
      uint64_t v3 = v28;
      int64_t v4 = v29;
      unint64_t v5 = v30;
    }
    else
    {
      uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
      uint64_t v24 = a1 + 56;
      uint64_t v3 = ~v6;
      uint64_t v7 = -v6;
      if (v7 < 64) {
        uint64_t v8 = ~(-1 << v7);
      }
      else {
        uint64_t v8 = -1;
      }
      unint64_t v5 = v8 & *(void *)(a1 + 56);
      swift_bridgeObjectRetain();
      int64_t v4 = 0;
    }
    uint64_t v21 = v3;
    int64_t v23 = (unint64_t)(v3 + 64) >> 6;
    uint64_t v22 = MEMORY[0x263F8EE50] + 8;
    if (a1 < 0) {
      goto LABEL_14;
    }
    while (1)
    {
      if (v5)
      {
        uint64_t v9 = (v5 - 1) & v5;
        unint64_t v10 = __clz(__rbit64(v5)) | (v4 << 6);
        int64_t v11 = v4;
      }
      else
      {
        int64_t v16 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          return;
        }
        if (v16 >= v23) {
          goto LABEL_36;
        }
        unint64_t v17 = *(void *)(v24 + 8 * v16);
        int64_t v11 = v4 + 1;
        if (!v17)
        {
          int64_t v11 = v4 + 2;
          if (v4 + 2 >= v23) {
            goto LABEL_36;
          }
          unint64_t v17 = *(void *)(v24 + 8 * v11);
          if (!v17)
          {
            int64_t v11 = v4 + 3;
            if (v4 + 3 >= v23) {
              goto LABEL_36;
            }
            unint64_t v17 = *(void *)(v24 + 8 * v11);
            if (!v17)
            {
              int64_t v11 = v4 + 4;
              if (v4 + 4 >= v23) {
                goto LABEL_36;
              }
              unint64_t v17 = *(void *)(v24 + 8 * v11);
              if (!v17)
              {
                int64_t v11 = v4 + 5;
                if (v4 + 5 >= v23) {
                  goto LABEL_36;
                }
                unint64_t v17 = *(void *)(v24 + 8 * v11);
                if (!v17)
                {
                  int64_t v18 = v4 + 6;
                  while (v18 < v23)
                  {
                    unint64_t v17 = *(void *)(v24 + 8 * v18++);
                    if (v17)
                    {
                      int64_t v11 = v18 - 1;
                      goto LABEL_32;
                    }
                  }
LABEL_36:
                  sub_234964040();
                  return;
                }
              }
            }
          }
        }
LABEL_32:
        uint64_t v9 = (v17 - 1) & v17;
        unint64_t v10 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      id v12 = *(id *)(*(void *)(a1 + 48) + 8 * v10);
      if (!v12) {
        goto LABEL_36;
      }
      while (1)
      {
        sub_234AE4D7C((uint64_t)v12, (uint64_t)qword_2687D4460, 0x263F86D60, (uint64_t)sub_234A339D0, (uint64_t)sub_234A31BB4, v13, v14, v15, v21, v22);
        unint64_t v20 = v19;

        int64_t v4 = v11;
        unint64_t v5 = v9;
        if ((a1 & 0x8000000000000000) == 0) {
          break;
        }
LABEL_14:
        if (sub_234B3BF28())
        {
          sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v12 = v25;
          swift_unknownObjectRelease();
          int64_t v11 = v4;
          uint64_t v9 = v5;
          if (v25) {
            continue;
          }
        }
        goto LABEL_36;
      }
    }
  }
  if (*(void *)(*(void *)v1 + 16)) {
    goto LABEL_5;
  }
}

uint64_t sub_234AE63A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  v33[5] = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 16))
  {
    int64_t v4 = 0;
    uint64_t v6 = a1 + 56;
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v32 = ~v7;
    if (-v7 < 64) {
      uint64_t v8 = ~(-1 << -(char)v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & v5;
    int64_t v10 = (unint64_t)(63 - v7) >> 6;
    uint64_t v11 = a2 + 56;
    while (1)
    {
      do
      {
        if (v9)
        {
          unint64_t v12 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          unint64_t v13 = v12 | (v4 << 6);
        }
        else
        {
          int64_t v14 = v4 + 1;
          if (__OFADD__(v4, 1))
          {
            __break(1u);
            goto LABEL_37;
          }
          if (v14 >= v10) {
            goto LABEL_35;
          }
          unint64_t v15 = *(void *)(v6 + 8 * v14);
          int64_t v16 = v4 + 1;
          if (!v15)
          {
            int64_t v16 = v4 + 2;
            if (v4 + 2 >= v10) {
              goto LABEL_35;
            }
            unint64_t v15 = *(void *)(v6 + 8 * v16);
            if (!v15)
            {
              int64_t v16 = v4 + 3;
              if (v4 + 3 >= v10) {
                goto LABEL_35;
              }
              unint64_t v15 = *(void *)(v6 + 8 * v16);
              if (!v15)
              {
                int64_t v16 = v4 + 4;
                if (v4 + 4 >= v10) {
                  goto LABEL_35;
                }
                unint64_t v15 = *(void *)(v6 + 8 * v16);
                if (!v15)
                {
                  int64_t v17 = v4 + 5;
                  if (v4 + 5 >= v10)
                  {
LABEL_35:
                    swift_bridgeObjectRetain();
                    sub_234964040();
                    return v2;
                  }
                  unint64_t v15 = *(void *)(v6 + 8 * v17);
                  if (!v15)
                  {
                    while (1)
                    {
                      int64_t v16 = v17 + 1;
                      if (__OFADD__(v17, 1)) {
                        break;
                      }
                      if (v16 >= v10) {
                        goto LABEL_35;
                      }
                      unint64_t v15 = *(void *)(v6 + 8 * v16);
                      ++v17;
                      if (v15) {
                        goto LABEL_23;
                      }
                    }
LABEL_37:
                    __break(1u);
                  }
                  int64_t v16 = v4 + 5;
                }
              }
            }
          }
LABEL_23:
          unint64_t v9 = (v15 - 1) & v15;
          unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
          int64_t v4 = v16;
        }
        uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8 * v13);
        sub_234B3C308();
        sub_234B3C318();
        uint64_t v19 = sub_234B3C368();
        uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v21 = v19 & ~v20;
      }
      while (((*(void *)(v11 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0);
      uint64_t v22 = *(void *)(v2 + 48);
      if (*(void *)(v22 + 8 * v21) == v18) {
        break;
      }
      while (1)
      {
        unint64_t v21 = (v21 + 1) & ~v20;
        if (((*(void *)(v11 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          break;
        }
        if (*(void *)(v22 + 8 * v21) == v18) {
          goto LABEL_28;
        }
      }
    }
LABEL_28:
    v33[0] = a1;
    v33[1] = v6;
    _DWORD v33[2] = v32;
    v33[3] = v4;
    v33[4] = v9;
    unint64_t v23 = (unint64_t)(63 - v20) >> 6;
    size_t v24 = 8 * v23;
    uint64_t isStackAllocationSafe = swift_bridgeObjectRetain();
    if (v23 < 0x81 || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x270FA5388](isStackAllocationSafe);
      uint64_t v27 = (char *)&v31 - v26;
      memcpy((char *)&v31 - v26, (const void *)(v2 + 56), v24);
      uint64_t v28 = sub_234AE719C((uint64_t)v27, v23, v2, v21, v33);
      swift_release();
      sub_234964040();
    }
    else
    {
      uint64_t v29 = (void *)swift_slowAlloc();
      memcpy(v29, (const void *)(v2 + 56), v24);
      uint64_t v28 = sub_234AE719C((uint64_t)v29, v23, v2, v21, v33);
      swift_release();
      sub_234964040();
      MEMORY[0x237DCE1F0](v29, -1, -1);
    }
    return v28;
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_234AE6758(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  v47[5] = *MEMORY[0x263EF8340];
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v44 = a1 + 56;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v42 = ~v4;
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & v3;
  int64_t v43 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = a2 + 56;
  uint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v45 = v8;
  int64_t v46 = 0;
  if (!v6) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v10 = v9 | (v46 << 6);
  while (1)
  {
    unint64_t v15 = *(void **)(*(void *)(v8 + 48) + 8 * v10);
    sub_234B3B588();
    sub_234B3C308();
    id v16 = v15;
    sub_234B3B5F8();
    uint64_t v17 = sub_234B3C368();
    swift_bridgeObjectRelease();
    uint64_t v18 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v19 = v17 & ~v18;
    if (((*(void *)(v7 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
      goto LABEL_37;
    }
    uint64_t v20 = sub_234B3B588();
    uint64_t v22 = v21;
    if (v20 == sub_234B3B588() && v22 == v23) {
      break;
    }
    char v25 = sub_234B3C288();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v25) {
      goto LABEL_41;
    }
    uint64_t v26 = ~v18;
    while (1)
    {
      unint64_t v19 = (v19 + 1) & v26;
      if (((*(void *)(v7 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
        break;
      }
      uint64_t v27 = sub_234B3B588();
      uint64_t v29 = v28;
      if (v27 == sub_234B3B588() && v29 == v30) {
        goto LABEL_40;
      }
      char v32 = sub_234B3C288();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v32) {
        goto LABEL_41;
      }
    }
LABEL_37:

    uint64_t v8 = v45;
    if (v6) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v11 = v46 + 1;
    if (__OFADD__(v46, 1))
    {
      __break(1u);
      goto LABEL_49;
    }
    if (v11 >= v43) {
      goto LABEL_47;
    }
    unint64_t v12 = *(void *)(v44 + 8 * v11);
    int64_t v13 = v46 + 1;
    if (!v12)
    {
      int64_t v13 = v46 + 2;
      if (v46 + 2 >= v43) {
        goto LABEL_47;
      }
      unint64_t v12 = *(void *)(v44 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v46 + 3;
        if (v46 + 3 >= v43) {
          goto LABEL_47;
        }
        unint64_t v12 = *(void *)(v44 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v46 + 4;
          if (v46 + 4 >= v43) {
            goto LABEL_47;
          }
          unint64_t v12 = *(void *)(v44 + 8 * v13);
          if (!v12)
          {
            int64_t v14 = v46 + 5;
            if (v46 + 5 >= v43)
            {
LABEL_47:
              sub_234964040();
              return v2;
            }
            unint64_t v12 = *(void *)(v44 + 8 * v14);
            if (!v12)
            {
              while (1)
              {
                int64_t v13 = v14 + 1;
                if (__OFADD__(v14, 1)) {
                  break;
                }
                if (v13 >= v43) {
                  goto LABEL_47;
                }
                unint64_t v12 = *(void *)(v44 + 8 * v13);
                ++v14;
                if (v12) {
                  goto LABEL_22;
                }
              }
LABEL_49:
              __break(1u);
            }
            int64_t v13 = v46 + 5;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v46 = v13;
  }
LABEL_40:
  swift_bridgeObjectRelease_n();
LABEL_41:

  v47[0] = v45;
  v47[1] = v44;
  v47[2] = v42;
  v47[3] = v46;
  v47[4] = v6;
  char v34 = *(unsigned char *)(v2 + 32);
  unint64_t v35 = (unint64_t)((1 << v34) + 63) >> 6;
  size_t v36 = 8 * v35;
  if ((v34 & 0x3Fu) < 0xE
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    memcpy((char *)&v42 - ((v36 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v36);
    sub_234AE7410((unint64_t *)((char *)&v42 - ((v36 + 15) & 0x3FFFFFFFFFFFFFF0)), v35, v2, v19, v47);
    uint64_t v38 = v37;
    swift_release();
    sub_234964040();
  }
  else
  {
    uint64_t v39 = (void *)swift_slowAlloc();
    memcpy(v39, (const void *)(v2 + 56), v36);
    sub_234AE7410((unint64_t *)v39, v35, v2, v19, v47);
    uint64_t v38 = v40;
    swift_release();
    sub_234964040();
    MEMORY[0x237DCE1F0](v39, -1, -1);
  }
  return v38;
}

uint64_t sub_234AE6C40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v51 = *MEMORY[0x263EF8340];
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_234B3BEB8();
    sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
    sub_234A25CBC((unint64_t *)&qword_2687D10D0, (unint64_t *)qword_2687D4460);
    sub_234B3B928();
    uint64_t v3 = v46;
    uint64_t v4 = v47;
    uint64_t v6 = v48;
    int64_t v5 = v49;
    unint64_t v7 = v50;
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v4 = a1 + 56;
    uint64_t v6 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    int64_t v5 = 0;
  }
  uint64_t v41 = v3;
  uint64_t v42 = v4;
  uint64_t v43 = v6;
  int64_t v44 = v5;
  unint64_t v45 = v7;
  uint64_t v11 = v2 + 56;
  if (v3 < 0) {
    goto LABEL_15;
  }
LABEL_10:
  if (v7)
  {
    uint64_t v12 = (v7 - 1) & v7;
    unint64_t v13 = __clz(__rbit64(v7)) | (v5 << 6);
LABEL_12:
    int64_t v14 = *(void **)(*(void *)(v3 + 48) + 8 * v13);
    id v15 = v14;
    goto LABEL_13;
  }
  int64_t v25 = v5 + 1;
  if (__OFADD__(v5, 1)) {
    __break(1u);
  }
  int64_t v26 = (unint64_t)(v6 + 64) >> 6;
  if (v25 >= v26)
  {
    int64_t v14 = 0;
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  unint64_t v27 = *(void *)(v42 + 8 * v25);
  if (v27)
  {
LABEL_28:
    uint64_t v12 = (v27 - 1) & v27;
    unint64_t v13 = __clz(__rbit64(v27)) + (v25 << 6);
    int64_t v5 = v25;
    goto LABEL_12;
  }
  int64_t v28 = v5 + 2;
  if (v5 + 2 >= v26) {
    goto LABEL_44;
  }
  unint64_t v27 = *(void *)(v42 + 8 * v28);
  if (v27)
  {
LABEL_32:
    int64_t v25 = v28;
    goto LABEL_28;
  }
  if (v5 + 3 >= v26) {
    goto LABEL_45;
  }
  unint64_t v27 = *(void *)(v42 + 8 * (v5 + 3));
  if (v27)
  {
    int64_t v25 = v5 + 3;
    goto LABEL_28;
  }
  int64_t v28 = v5 + 4;
  if (v5 + 4 < v26)
  {
    unint64_t v27 = *(void *)(v42 + 8 * v28);
    if (v27) {
      goto LABEL_32;
    }
    int64_t v25 = v5 + 5;
    if (v5 + 5 < v26)
    {
      unint64_t v27 = *(void *)(v42 + 8 * v25);
      if (v27) {
        goto LABEL_28;
      }
      int64_t v25 = v26 - 1;
      int64_t v29 = v5 + 6;
      while (v29 < v26)
      {
        unint64_t v27 = *(void *)(v42 + 8 * v29++);
        if (v27)
        {
          int64_t v25 = v29 - 1;
          goto LABEL_28;
        }
      }
LABEL_44:
      int64_t v14 = 0;
      uint64_t v12 = 0;
      int64_t v5 = v25;
      goto LABEL_13;
    }
LABEL_45:
    int64_t v14 = 0;
    uint64_t v12 = 0;
    int64_t v5 = v28;
    goto LABEL_13;
  }
  int64_t v14 = 0;
  uint64_t v12 = 0;
  v5 += 3;
LABEL_13:
  int64_t v44 = v5;
  unint64_t v45 = v12;
  if (!v14)
  {
LABEL_53:
    sub_234964040();
    return v2;
  }
  while (1)
  {
    uint64_t v17 = sub_234B3BCB8();
    uint64_t v18 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v19 = v17 & ~v18;
    if ((*(void *)(v11 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19)) {
      break;
    }
LABEL_23:

    uint64_t v3 = v41;
    uint64_t v6 = v43;
    int64_t v5 = v44;
    unint64_t v7 = v45;
    if ((v41 & 0x8000000000000000) == 0) {
      goto LABEL_10;
    }
LABEL_15:
    uint64_t v16 = sub_234B3BF28();
    if (v16)
    {
      uint64_t v39 = v16;
      sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      int64_t v14 = v40;
      swift_unknownObjectRelease();
      if (v40) {
        continue;
      }
    }
    goto LABEL_53;
  }
  sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
  id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v19);
  char v21 = sub_234B3BCC8();

  if ((v21 & 1) == 0)
  {
    uint64_t v22 = ~v18;
    do
    {
      unint64_t v19 = (v19 + 1) & v22;
      if (((*(void *)(v11 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
        goto LABEL_23;
      }
      id v23 = *(id *)(*(void *)(v2 + 48) + 8 * v19);
      char v24 = sub_234B3BCC8();
    }
    while ((v24 & 1) == 0);
  }

  char v31 = *(unsigned char *)(v2 + 32);
  unint64_t v32 = (unint64_t)((1 << v31) + 63) >> 6;
  size_t v33 = 8 * v32;
  if ((v31 & 0x3Fu) < 0xE
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    memcpy((char *)&v39 - ((v33 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v33);
    sub_234AE77AC((unint64_t *)((char *)&v39 - ((v33 + 15) & 0x3FFFFFFFFFFFFFF0)), v32, v2, v19, &v41);
    uint64_t v35 = v34;
    swift_release();
    sub_234964040();
  }
  else
  {
    size_t v36 = (void *)swift_slowAlloc();
    memcpy(v36, (const void *)(v2 + 56), v33);
    sub_234AE77AC((unint64_t *)v36, v32, v2, v19, &v41);
    uint64_t v35 = v37;
    swift_release();
    sub_234964040();
    MEMORY[0x237DCE1F0](v36, -1, -1);
  }
  return v35;
}

uint64_t sub_234AE719C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  unint64_t v7 = (unint64_t *)result;
  uint64_t v8 = *(void *)(a3 + 16);
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v9 = v8 - 1;
  uint64_t v10 = a3 + 56;
  while (1)
  {
    int64_t v11 = a5[3];
    unint64_t v12 = a5[4];
    if (!v12) {
      break;
    }
    uint64_t v13 = (v12 - 1) & v12;
    unint64_t v14 = __clz(__rbit64(v12)) | (v11 << 6);
LABEL_14:
    uint64_t v21 = *(void *)(*(void *)(*a5 + 48) + 8 * v14);
    a5[3] = v11;
    a5[4] = v13;
    sub_234B3C308();
    sub_234B3C318();
    uint64_t result = sub_234B3C368();
    uint64_t v22 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    uint64_t v25 = 1 << v23;
    if (((1 << v23) & *(void *)(v10 + 8 * (v23 >> 6))) != 0)
    {
      uint64_t v26 = *(void *)(a3 + 48);
      if (*(void *)(v26 + 8 * v23) == v21)
      {
LABEL_21:
        unint64_t v29 = v7[v24];
        v7[v24] = v29 & ~v25;
        if ((v25 & v29) != 0)
        {
          if (__OFSUB__(v9--, 1)) {
            goto LABEL_37;
          }
          if (!v9) {
            return MEMORY[0x263F8EE88];
          }
        }
      }
      else
      {
        for (unint64_t i = v23 + 1; ; unint64_t i = v28 + 1)
        {
          unint64_t v28 = i & ~v22;
          if (((*(void *)(v10 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) == 0) {
            break;
          }
          if (*(void *)(v26 + 8 * v28) == v21)
          {
            unint64_t v24 = v28 >> 6;
            uint64_t v25 = 1 << v28;
            goto LABEL_21;
          }
        }
      }
    }
  }
  int64_t v15 = v11 + 1;
  if (!__OFADD__(v11, 1))
  {
    int64_t v16 = (unint64_t)(a5[2] + 64) >> 6;
    int64_t v17 = a5[3];
    if (v15 >= v16) {
      goto LABEL_34;
    }
    uint64_t v18 = a5[1];
    unint64_t v19 = *(void *)(v18 + 8 * v15);
    if (v19) {
      goto LABEL_13;
    }
    int64_t v20 = v11 + 2;
    int64_t v17 = v11 + 1;
    if (v11 + 2 >= v16) {
      goto LABEL_34;
    }
    unint64_t v19 = *(void *)(v18 + 8 * v20);
    if (!v19)
    {
      int64_t v17 = v11 + 2;
      if (v11 + 3 >= v16) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v18 + 8 * (v11 + 3));
      if (v19)
      {
        int64_t v15 = v11 + 3;
        goto LABEL_13;
      }
      int64_t v20 = v11 + 4;
      int64_t v17 = v11 + 3;
      if (v11 + 4 >= v16) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v18 + 8 * v20);
      if (!v19)
      {
        int64_t v15 = v11 + 5;
        int64_t v17 = v11 + 4;
        if (v11 + 5 >= v16) {
          goto LABEL_34;
        }
        unint64_t v19 = *(void *)(v18 + 8 * v15);
        if (!v19)
        {
          int64_t v31 = v11 + 6;
          while (v31 < v16)
          {
            unint64_t v19 = *(void *)(v18 + 8 * v31++);
            if (v19)
            {
              int64_t v15 = v31 - 1;
              goto LABEL_13;
            }
          }
          int64_t v17 = v16 - 1;
LABEL_34:
          a5[3] = v17;
          a5[4] = 0;
          swift_retain();
          return sub_234AE55E8(v7, a2, v9, a3);
        }
        goto LABEL_13;
      }
    }
    int64_t v15 = v20;
LABEL_13:
    uint64_t v13 = (v19 - 1) & v19;
    unint64_t v14 = __clz(__rbit64(v19)) + (v15 << 6);
    int64_t v11 = v15;
    goto LABEL_14;
  }
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

void sub_234AE7410(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v7 = v6 - 1;
  uint64_t v45 = a3 + 56;
  while (2)
  {
    uint64_t v42 = v7;
    do
    {
      while (1)
      {
        int64_t v8 = a5[3];
        unint64_t v9 = a5[4];
        if (v9)
        {
          uint64_t v10 = (v9 - 1) & v9;
          unint64_t v11 = __clz(__rbit64(v9)) | (v8 << 6);
          goto LABEL_15;
        }
        int64_t v12 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
          goto LABEL_50;
        }
        int64_t v13 = (unint64_t)(a5[2] + 64) >> 6;
        int64_t v14 = a5[3];
        if (v12 >= v13) {
          goto LABEL_48;
        }
        uint64_t v15 = a5[1];
        unint64_t v16 = *(void *)(v15 + 8 * v12);
        if (!v16)
        {
          int64_t v17 = v8 + 2;
          int64_t v14 = v8 + 1;
          if (v8 + 2 >= v13) {
            goto LABEL_48;
          }
          unint64_t v16 = *(void *)(v15 + 8 * v17);
          if (!v16)
          {
            int64_t v14 = v8 + 2;
            if (v8 + 3 >= v13) {
              goto LABEL_48;
            }
            unint64_t v16 = *(void *)(v15 + 8 * (v8 + 3));
            if (v16)
            {
              int64_t v12 = v8 + 3;
              goto LABEL_14;
            }
            int64_t v17 = v8 + 4;
            int64_t v14 = v8 + 3;
            if (v8 + 4 >= v13) {
              goto LABEL_48;
            }
            unint64_t v16 = *(void *)(v15 + 8 * v17);
            if (!v16)
            {
              int64_t v12 = v8 + 5;
              int64_t v14 = v8 + 4;
              if (v8 + 5 >= v13) {
                goto LABEL_48;
              }
              unint64_t v16 = *(void *)(v15 + 8 * v12);
              if (!v16)
              {
                int64_t v40 = v8 + 6;
                while (v40 < v13)
                {
                  unint64_t v16 = *(void *)(v15 + 8 * v40++);
                  if (v16)
                  {
                    int64_t v12 = v40 - 1;
                    goto LABEL_14;
                  }
                }
                int64_t v14 = v13 - 1;
LABEL_48:
                a5[3] = v14;
                a5[4] = 0;
                swift_retain();
                sub_234AE584C(a1, a2, v42, a3);
                return;
              }
              goto LABEL_14;
            }
          }
          int64_t v12 = v17;
        }
LABEL_14:
        uint64_t v10 = (v16 - 1) & v16;
        unint64_t v11 = __clz(__rbit64(v16)) + (v12 << 6);
        int64_t v8 = v12;
LABEL_15:
        uint64_t v18 = *(void **)(*(void *)(*a5 + 48) + 8 * v11);
        a5[3] = v8;
        a5[4] = v10;
        sub_234B3B588();
        sub_234B3C308();
        id v44 = v18;
        sub_234B3B5F8();
        uint64_t v19 = sub_234B3C368();
        swift_bridgeObjectRelease();
        uint64_t v20 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v21 = v19 & ~v20;
        unint64_t v22 = v21 >> 6;
        uint64_t v23 = 1 << v21;
        if (((1 << v21) & *(void *)(v45 + 8 * (v21 >> 6))) == 0) {
          goto LABEL_29;
        }
        uint64_t v24 = sub_234B3B588();
        uint64_t v26 = v25;
        if (v24 == sub_234B3B588() && v26 == v27)
        {
          swift_bridgeObjectRelease_n();
          break;
        }
        char v29 = sub_234B3C288();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v29) {
          break;
        }
        uint64_t v30 = ~v20;
        for (unint64_t i = v21 + 1; ; unint64_t i = v32 + 1)
        {
          unint64_t v32 = i & v30;
          if (((*(void *)(v45 + (((i & v30) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v30)) & 1) == 0) {
            break;
          }
          uint64_t v33 = sub_234B3B588();
          uint64_t v35 = v34;
          if (v33 == sub_234B3B588() && v35 == v36)
          {
            swift_bridgeObjectRelease_n();
LABEL_35:

            unint64_t v22 = v32 >> 6;
            uint64_t v23 = 1 << v32;
            goto LABEL_32;
          }
          char v38 = sub_234B3C288();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v38) {
            goto LABEL_35;
          }
        }
LABEL_29:
      }
LABEL_32:
      unint64_t v39 = a1[v22];
      a1[v22] = v39 & ~v23;
    }
    while ((v23 & v39) == 0);
    uint64_t v7 = v42 - 1;
    if (__OFSUB__(v42, 1))
    {
LABEL_50:
      __break(1u);
      return;
    }
    if (v42 != 1) {
      continue;
    }
    break;
  }
}

void sub_234AE77AC(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  int64_t v5 = a5;
  uint64_t v7 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v37 = a3 + 56;
  while (2)
  {
    uint64_t v34 = v8;
    do
    {
      while (1)
      {
        if ((*v5 & 0x8000000000000000) == 0)
        {
          int64_t v10 = v5[3];
          unint64_t v9 = v5[4];
          if (v9)
          {
            uint64_t v11 = (v9 - 1) & v9;
            unint64_t v12 = __clz(__rbit64(v9)) | (v10 << 6);
LABEL_6:
            int64_t v13 = *(void **)(*(void *)(*v5 + 48) + 8 * v12);
            id v14 = v13;
            goto LABEL_7;
          }
          int64_t v27 = v10 + 1;
          if (__OFADD__(v10, 1))
          {
            __break(1u);
            goto LABEL_47;
          }
          int64_t v28 = (unint64_t)(v5[2] + 64) >> 6;
          if (v27 >= v28)
          {
            int64_t v13 = 0;
            uint64_t v11 = 0;
            goto LABEL_7;
          }
          uint64_t v29 = v5[1];
          unint64_t v30 = *(void *)(v29 + 8 * v27);
          if (v30)
          {
LABEL_22:
            uint64_t v11 = (v30 - 1) & v30;
            unint64_t v12 = __clz(__rbit64(v30)) + (v27 << 6);
            int64_t v10 = v27;
            goto LABEL_6;
          }
          if (v10 + 2 < v28)
          {
            unint64_t v30 = *(void *)(v29 + 8 * (v10 + 2));
            if (v30)
            {
              int64_t v27 = v10 + 2;
              goto LABEL_22;
            }
            if (v10 + 3 >= v28)
            {
              int64_t v13 = 0;
              uint64_t v11 = 0;
              v10 += 2;
              goto LABEL_7;
            }
            unint64_t v30 = *(void *)(v29 + 8 * (v10 + 3));
            if (v30)
            {
              int64_t v27 = v10 + 3;
              goto LABEL_22;
            }
            int64_t v27 = v10 + 4;
            if (v10 + 4 >= v28)
            {
              int64_t v13 = 0;
              uint64_t v11 = 0;
              v10 += 3;
LABEL_7:
              v5[3] = v10;
              v5[4] = v11;
              if (!v13) {
                goto LABEL_45;
              }
              goto LABEL_11;
            }
            unint64_t v30 = *(void *)(v29 + 8 * v27);
            if (v30) {
              goto LABEL_22;
            }
            int64_t v27 = v28 - 1;
            int64_t v32 = v10 + 5;
            while (v32 < v28)
            {
              unint64_t v30 = *(void *)(v29 + 8 * v32++);
              if (v30)
              {
                int64_t v27 = v32 - 1;
                goto LABEL_22;
              }
            }
          }
          int64_t v13 = 0;
          uint64_t v11 = 0;
          int64_t v10 = v27;
          goto LABEL_7;
        }
        if (!sub_234B3BF28()
          || (sub_23491E3D4(0, (unint64_t *)qword_2687D4460),
              swift_unknownObjectRetain(),
              swift_dynamicCast(),
              int64_t v13 = v38,
              swift_unknownObjectRelease(),
              !v38))
        {
LABEL_45:
          swift_retain();
          sub_234AE5AE0(a1, a2, v34, a3);
          return;
        }
LABEL_11:
        uint64_t v15 = sub_234B3BCB8();
        uint64_t v16 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v17 = v15 & ~v16;
        unint64_t v18 = v17 >> 6;
        uint64_t v19 = 1 << v17;
        if (((1 << v17) & *(void *)(v37 + 8 * (v17 >> 6))) == 0) {
          goto LABEL_18;
        }
        sub_23491E3D4(0, (unint64_t *)qword_2687D4460);
        id v20 = *(id *)(*(void *)(a3 + 48) + 8 * v17);
        char v21 = sub_234B3BCC8();

        if (v21) {
          break;
        }
        uint64_t v22 = ~v16;
        for (unint64_t i = v17 + 1; ; unint64_t i = v24 + 1)
        {
          unint64_t v24 = i & v22;
          if (((*(void *)(v37 + (((i & v22) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v22)) & 1) == 0) {
            break;
          }
          id v25 = *(id *)(*(void *)(a3 + 48) + 8 * v24);
          char v26 = sub_234B3BCC8();

          if (v26)
          {

            unint64_t v18 = v24 >> 6;
            uint64_t v19 = 1 << v24;
            goto LABEL_25;
          }
        }
LABEL_18:

        int64_t v5 = a5;
      }

LABEL_25:
      int64_t v5 = a5;
      unint64_t v31 = a1[v18];
      a1[v18] = v31 & ~v19;
    }
    while ((v19 & v31) == 0);
    uint64_t v8 = v34 - 1;
    if (__OFSUB__(v34, 1))
    {
LABEL_47:
      __break(1u);
      return;
    }
    if (v34 != 1) {
      continue;
    }
    break;
  }
}

uint64_t sub_234AE7B20(void *a1)
{
  id v1 = objc_msgSend(a1, sel_localizedTitle);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_234B3B588();

  return v3;
}

uint64_t sub_234AE7B84(void *a1)
{
  id v2 = objc_msgSend(a1, sel_accessResources);

  if (!v2) {
    return 0;
  }
  sub_23491E3D4(0, &qword_2687D14F8);
  sub_234A25CBC(&qword_2687D14F0, &qword_2687D14F8);
  uint64_t v3 = sub_234B3B8F8();

  return v3;
}

id sub_234AE7C28(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (void *)sub_234B3B548();
  id v7 = objc_msgSend(a4, sel_formatString_containsParameterKey_, v6, a3);

  return v7;
}

void sub_234AE7C80(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2 >> 62;
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_234B3C1B8();
    swift_bridgeObjectRelease();
  }
  sub_234B3C318();
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_234B3C1B8();
    swift_bridgeObjectRelease();
    if (!v4) {
      return;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((a2 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x237DCCB60](i, a2);
      }
      else {
        id v6 = *(id *)(a2 + 8 * i + 32);
      }
      id v7 = v6;
      sub_234B3BCD8();
    }
  }
}

uint64_t sub_234AE7D84()
{
  return sub_234AE0944();
}

uint64_t sub_234AE7DAC()
{
  return type metadata accessor for ActionViewModel();
}

void sub_234AE7DB4()
{
  sub_234AE828C();
  if (v0 <= 0x3F)
  {
    sub_234AE82D8(319, &qword_2687D80B8, &qword_2687D7FC8);
    if (v1 <= 0x3F)
    {
      sub_234AE82D8(319, &qword_2687D80C0, &qword_2687D14E0);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for ActionViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActionViewModel);
}

uint64_t dispatch thunk of ActionViewModel.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of ActionViewModel.showOutput.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of ActionViewModel.showOutput.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of ActionViewModel.showOutput.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of ActionViewModel.$showOutput.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of ActionViewModel.$showOutput.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of ActionViewModel.$showOutput.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of ActionViewModel.canProduceOutput()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of ActionViewModel.action(_:parameterStateDidChangeForKey:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of ActionViewModel.actionIconDidChange(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of ActionViewModel.actionNameDidChange(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of ActionViewModel.actionVisibleParametersDidChange(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of ActionViewModel.actionOutputDetailsDidChange(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of ActionViewModel.actionReloadAuxiliaryButton(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of ActionViewModel.parameterAttributesDidChange(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x300))();
}

void sub_234AE828C()
{
  if (!qword_2687D00D0)
  {
    unint64_t v0 = sub_234B392B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2687D00D0);
    }
  }
}

void sub_234AE82D8(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    OUTLINED_FUNCTION_2_29();
    unint64_t v4 = sub_234B392B8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t destroy for ActionSummarySection()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ActionSummarySection(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ActionSummarySection(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ActionSummarySection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ActionSummarySection()
{
  return &type metadata for ActionSummarySection;
}

unint64_t sub_234AE84B4()
{
  unint64_t result = qword_2687D80C8;
  if (!qword_2687D80C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D80C8);
  }
  return result;
}

uint64_t sub_234AE8500(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    OUTLINED_FUNCTION_2_29();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_234AE8544()
{
  OUTLINED_FUNCTION_14_2();
  uint64_t result = sub_234AE1094();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_234AE8570()
{
  OUTLINED_FUNCTION_14_2();
  uint64_t result = sub_234AE106C();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_234AE859C()
{
  OUTLINED_FUNCTION_14_2();
  uint64_t result = sub_234AE0F8C();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_234AE85C8()
{
  uint64_t v0 = sub_234AE076C();
  return OUTLINED_FUNCTION_2_3(v0);
}

uint64_t sub_234AE85F4()
{
  return sub_234ADF8A8();
}

uint64_t sub_234AE861C()
{
  OUTLINED_FUNCTION_14_2();
  uint64_t v0 = sub_234AE0758();
  return OUTLINED_FUNCTION_2_3(v0);
}

void sub_234AE8644()
{
}

uint64_t sub_234AE866C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4();
  uint64_t v4 = OUTLINED_FUNCTION_25_2();
  v5(v4);
  return a2;
}

uint64_t sub_234AE86C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *sub_234AE8714(uint64_t *a1)
{
  return a1;
}

uint64_t *sub_234AE8748(uint64_t *a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_6_28()
{
  return sub_234B3B298();
}

uint64_t OUTLINED_FUNCTION_7_25()
{
  return sub_234985260(v3, v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_11_22()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_12_21()
{
  return v0;
}

void OUTLINED_FUNCTION_14_22()
{
  void *v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_15_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_18()
{
  return sub_234B3B298();
}

uint64_t OUTLINED_FUNCTION_20_14()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_21_12(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_234B3BD98();
}

void OUTLINED_FUNCTION_26_9(float a1)
{
  *(void *)(v3 - 112) = v2;
  *uint64_t v1 = a1;
  *(void *)(v3 - 120) = v1 + 1;
}

uint64_t OUTLINED_FUNCTION_27_7()
{
  return sub_234AE86C4(v3, v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_32_9()
{
  return sub_234B392A8();
}

BOOL OUTLINED_FUNCTION_33_5(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_35_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40_3()
{
  return v0;
}

void OUTLINED_FUNCTION_41_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_42_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_44_4()
{
  return swift_arrayDestroy();
}

id sub_234AE8A2C()
{
  uint64_t v0 = sub_234B3ABE8();
  if (v0)
  {
    id v1 = (id)v0;
    id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F851A8]), sel_initWithCGColor_, v1);
    id v4 = objc_msgSend(v2, sel_initWithValue_, v3);
  }
  else
  {
    id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    id v1 = objc_msgSend(self, sel_whiteColor);
    id v4 = objc_msgSend(v5, sel_initWithValue_, v1);
  }

  swift_release();
  return v4;
}

uint64_t WFColorParameterState.color.getter()
{
  id v1 = objc_msgSend(v0, sel_value);
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = MEMORY[0x237DCB720](objc_msgSend(v1, sel_CGColor));

    return v3;
  }
  else
  {
    return sub_234B3AC78();
  }
}

uint64_t WFColorPickerParameter.view(with:)()
{
  sub_234AE8BE8();
  id v1 = v0;
  swift_retain();
  return sub_234B3AF28();
}

unint64_t sub_234AE8BE8()
{
  unint64_t result = qword_2687D8128;
  if (!qword_2687D8128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D8128);
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorPickerParameterRowView()
{
  return &type metadata for ColorPickerParameterRowView;
}

uint64_t sub_234AE8C48()
{
  return swift_getOpaqueTypeConformance2();
}

#error "234AE8CC0: call analysis failed (funcsize=29)"

uint64_t sub_234AE8CD8()
{
  return sub_234AE8C64(*v0, v0[1]);
}

ValueMetadata *type metadata accessor for ColorParameterView()
{
  return &type metadata for ColorParameterView;
}

uint64_t sub_234AE8CF0()
{
  return sub_2349158F4(&qword_2687D8130, &qword_2687D35C8);
}

uint64_t sub_234AE8D2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_234AE8D48()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D8138);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v5 = v0[1];
  long long v25 = *v0;
  long long v26 = v5;
  long long v6 = v0[3];
  long long v27 = v0[2];
  long long v28 = v6;
  sub_234B3B5E8();
  if (qword_2687CE508 != -1) {
    swift_once();
  }
  id v7 = (id)qword_2687D07B0;
  uint64_t v8 = (void *)sub_234B3B548();
  unint64_t v9 = (void *)sub_234B3B548();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v8, v9, 0);

  uint64_t v11 = sub_234B3B588();
  uint64_t v13 = v12;

  v24[4] = v11;
  void v24[5] = v13;
  sub_234B3B878();
  sub_234963020((uint64_t)&v25);
  sub_234963020((uint64_t)&v25);
  uint64_t v14 = sub_234B3B868();
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = MEMORY[0x263F8F500];
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v16;
  long long v17 = v26;
  *(_OWORD *)(v15 + 32) = v25;
  *(_OWORD *)(v15 + 48) = v17;
  long long v18 = v28;
  *(_OWORD *)(v15 + 64) = v27;
  *(_OWORD *)(v15 + 80) = v18;
  sub_234963020((uint64_t)&v25);
  uint64_t v19 = sub_234B3B868();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  *(void *)(v20 + 24) = v16;
  long long v21 = v26;
  *(_OWORD *)(v20 + 32) = v25;
  *(_OWORD *)(v20 + 48) = v21;
  long long v22 = v28;
  *(_OWORD *)(v20 + 64) = v27;
  *(_OWORD *)(v20 + 80) = v22;
  sub_234B3AF98();
  sub_2349F0AB8((uint64_t)&v25);
  sub_23491B698();
  sub_234B393F8();
  sub_2349158F4(&qword_2687D8140, &qword_2687D8138);
  sub_234B3A818();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_234AE9040(_OWORD *a1@<X2>, uint64_t *a2@<X8>)
{
  void (*v5)(void **__return_ptr, uint64_t);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _OWORD v10[3];

  long long v4 = a1[2];
  v10[0] = a1[1];
  v10[1] = v4;
  void v10[2] = a1[3];
  long long v5 = (void (*)(void **__return_ptr, uint64_t))v4;
  sub_234963020((uint64_t)a1);
  long long v6 = sub_234966500((uint64_t)v10);
  v5(&v9, v6);
  sub_2349665B0((uint64_t)v10);
  sub_2349F0AB8((uint64_t)a1);
  id v7 = v9;
  if (v9)
  {
    uint64_t v8 = WFColorParameterState.color.getter();
  }
  else
  {
    uint64_t v8 = sub_234B3AC78();
  }
  *a2 = v8;
}

uint64_t sub_234AE90D8(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  sub_234AE9198();
  sub_234963020((uint64_t)a4);
  swift_retain();
  id v5 = sub_234AE8A2C();
  long long v6 = a4[3];
  v10[1] = a4[2];
  void v10[2] = v6;
  v10[0] = a4[1];
  id v9 = v5;
  id v7 = (void (*)(id *))v6;
  sub_234966500((uint64_t)v10);
  v7(&v9);

  sub_2349665B0((uint64_t)v10);
  return sub_2349F0AB8((uint64_t)a4);
}

void sub_234AE917C(uint64_t *a1@<X8>)
{
  sub_234AE9040((_OWORD *)(v1 + 32), a1);
}

uint64_t sub_234AE918C(uint64_t a1)
{
  return sub_234AE90D8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (_OWORD *)(v1 + 32));
}

unint64_t sub_234AE9198()
{
  unint64_t result = qword_2687D8148;
  if (!qword_2687D8148)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2687D8148);
  }
  return result;
}

uint64_t sub_234AE91D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_234AE9258(unint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = a1;
  if (!(a1 >> 62))
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_3;
    }
LABEL_11:

    uint64_t v16 = MEMORY[0x263F8EE78];
LABEL_12:

    return v16;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_234B3C1B8();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v20 = MEMORY[0x263F8EE78];
  uint64_t result = sub_234B3C088();
  if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v18 = v4 & 0xC000000000000001;
    uint64_t v17 = sub_23491E3D4(0, (unint64_t *)&unk_2687D8180);
    uint64_t v7 = 0;
    unint64_t v8 = v4;
    do
    {
      if (v18) {
        id v9 = (id)MEMORY[0x237DCCB60](v7, v4);
      }
      else {
        id v9 = *(id *)(v4 + 8 * v7 + 32);
      }
      id v10 = v9;
      ++v7;
      id v11 = objc_msgSend(v9, sel_items, v17);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687D09A0);
      unint64_t v12 = sub_234B3B718();

      id v13 = a2;
      sub_234AE9484(v12, a2, a3);
      swift_bridgeObjectRelease();
      id v14 = sub_234AE971C();
      id v15 = objc_msgSend(v10, sel_title);
      objc_msgSend(v14, sel_setTitle_, v15);

      sub_234B3C058();
      sub_234B3C098();
      sub_234B3C0A8();
      sub_234B3C068();
      unint64_t v4 = v8;
    }
    while (v5 != v7);
    uint64_t v16 = v20;

    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_234AE9484(unint64_t a1, void *a2, void *a3)
{
  if (!(a1 >> 62))
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_3;
    }
LABEL_15:

    uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_16:

    return v12;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_234B3C1B8();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_15;
  }
LABEL_3:
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_234B3C088();
  if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x237DCCB60](v8, a1);
      }
      else {
        id v9 = *(id *)(a1 + 8 * v8 + 32);
      }
      id v10 = v9;
      BOOL v11 = a2 && objc_msgSend(v9, sel_stateIsEquivalent_, a2);
      ++v8;
      sub_234AEA6A8(v10, v11);

      sub_234B3C058();
      sub_234B3C098();
      sub_234B3C0A8();
      sub_234B3C068();
    }
    while (v6 != v8);
    uint64_t v12 = v13;

    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_234AE960C(uint64_t a1)
{
  return j__swift_continuation_resume(*(void *)(a1 + 32));
}

uint64_t sub_234AE9618(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D1870);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_234B3B8A8();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  id v8[2] = 0;
  v8[3] = 0;
  char v8[4] = a1;
  v8[5] = a2;
  id v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  void v9[4] = &unk_2687D81B0;
  void v9[5] = v8;
  sub_234AEC510((uint64_t)v6, (uint64_t)&unk_2687D81C0, (uint64_t)v9);
  return swift_release();
}

id sub_234AE971C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D1BE0);
  uint64_t v1 = (void *)sub_234B3B6F8();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithMenuElements_, v1);

  return v2;
}

uint64_t sub_234AE9798(uint64_t a1, void *a2)
{
  if (a2) {
    return sub_234AE97EC(*(void *)(a1 + 32), (uint64_t)a2);
  }
  return j__swift_continuation_throwingResume();
}

uint64_t sub_234AE97EC(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D8170);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;
  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_234AE9854(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_234AE9874(void *a1, void *a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D1870);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_234B3B8A8();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v8);
  sub_234B3B878();
  id v9 = v2;
  id v10 = a1;
  id v11 = a2;
  uint64_t v12 = sub_234B3B868();
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v9;
  v13[5] = v10;
  v13[6] = v11;
  sub_234A1A384((uint64_t)v7, (uint64_t)&unk_2687D81F8, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_234AE998C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = sub_234B3B878();
  v6[6] = sub_234B3B868();
  uint64_t v7 = (void *)swift_task_alloc();
  v6[7] = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_234AE9A40;
  return sub_234AEB3D0();
}

uint64_t sub_234AE9A40()
{
  OUTLINED_FUNCTION_27_5();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_11();
  *uint64_t v5 = v4;
  *uint64_t v5 = *v1;
  *(void *)(v4 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = sub_234B3B818();
    uint64_t v8 = v7;
    uint64_t v9 = sub_234AE9C38;
  }
  else
  {
    *(void *)(v4 + 72) = v3;
    uint64_t v6 = sub_234B3B818();
    uint64_t v8 = v10;
    uint64_t v9 = sub_234AE9BB8;
  }
  return MEMORY[0x270FA2498](v9, v6, v8);
}

uint64_t sub_234AE9BB8()
{
  OUTLINED_FUNCTION_27_2();
  uint64_t v1 = (void *)v0[9];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  swift_release();
  sub_234AEBBC0(v2, v3, (uint64_t)v1);

  OUTLINED_FUNCTION_32_1();
  return v4();
}

uint64_t sub_234AE9C38()
{
  OUTLINED_FUNCTION_27_5();
  uint64_t v1 = (void *)v0[8];
  uint64_t v2 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  swift_release();
  sub_23491E3D4(0, (unint64_t *)&unk_2687D8200);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  id v5 = v1;
  id v6 = v3;
  id v7 = sub_234AE9D6C(v1, (uint64_t)sub_23494EE08, v4);
  id v8 = objc_msgSend(v2, sel_sourceViewController);
  id v9 = (id)WFUserInterfaceFromViewController();

  objc_msgSend(v9, sel_presentAlert_, v7);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_32_1();
  return v10();
}

id sub_234AE9D6C(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)sub_234B38298();
  if (a2)
  {
    v10[4] = a2;
    v10[5] = a3;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    void v10[2] = sub_234944DB8;
    _OWORD v10[3] = &block_descriptor_52_0;
    id v7 = _Block_copy(v10);
    swift_release();
  }
  else
  {
    id v7 = 0;
  }
  id v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_alertWithError_confirmationHandler_, v6, v7);

  _Block_release(v7);
  return v8;
}

unint64_t sub_234AE9ECC()
{
  id v1 = OUTLINED_FUNCTION_6_29();
  unsigned int v2 = objc_msgSend(v1, sel_preferContextMenu);

  if (!v2) {
    return 0;
  }
  id v3 = OUTLINED_FUNCTION_6_29();
  self;
  uint64_t v4 = (void *)swift_dynamicCastObjCClass();
  if (!v4
    || (id v5 = v4, !objc_msgSend(v4, sel_isAsynchronous))
    || objc_msgSend(v5, sel_possibleStatesLoadingState) == (id)2
    && !objc_msgSend(v5, sel_shouldAlwaysReloadPossibleStates))
  {

    id v11 = sub_234AEA4C0();
    unint64_t v10 = sub_234AEA5E8(v11);

    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_234B3C1B8();
      swift_bridgeObjectRelease();
      if (v13) {
        return v10;
      }
    }
    else if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      return v10;
    }
    swift_bridgeObjectRelease();
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687CF5D0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_234B6BBE0;
  sub_23491E3D4(0, &qword_2687D1BE8);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  *(void *)(v7 + 24) = v0;
  id v8 = v3;
  id v9 = v0;
  *(void *)(v6 + 32) = sub_234B3BBD8();
  sub_234B3B748();
  unint64_t v10 = v6;

  return v10;
}

uint64_t sub_234AEA0AC(uint64_t a1, uint64_t a2)
{
  v2[15] = a1;
  v2[16] = a2;
  sub_234B3B878();
  v2[17] = sub_234B3B868();
  uint64_t v4 = sub_234B3B818();
  v2[18] = v4;
  v2[19] = v3;
  return MEMORY[0x270FA2498](sub_234AEA144, v4, v3);
}

uint64_t sub_234AEA144()
{
  OUTLINED_FUNCTION_27_2();
  id v1 = (void *)v0[15];
  v0[2] = v0;
  v0[3] = sub_234AEA234;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_234AE9798;
  v0[13] = &block_descriptor_41;
  v0[14] = v2;
  objc_msgSend(v1, sel_loadPossibleStatesWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_234AEA234()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_3_11();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  uint64_t v4 = v3[6];
  *(void *)(v1 + 160) = v4;
  uint64_t v5 = v3[19];
  uint64_t v6 = v3[18];
  if (v4) {
    uint64_t v7 = sub_234AEA3A8;
  }
  else {
    uint64_t v7 = sub_234AEA338;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_234AEA338()
{
  OUTLINED_FUNCTION_1_2();
  swift_release();
  id v0 = sub_234AEA4C0();
  sub_234AEA5E8(v0);

  uint64_t v1 = OUTLINED_FUNCTION_8_28();
  return v2(v1);
}

uint64_t sub_234AEA3A8()
{
  OUTLINED_FUNCTION_27_2();
  uint64_t v1 = *(void **)(v0 + 160);
  swift_release();
  swift_willThrow();

  id v2 = sub_234AEA4C0();
  sub_234AEA5E8(v2);

  uint64_t v3 = OUTLINED_FUNCTION_8_28();
  return v4(v3);
}

id sub_234AEA4C0()
{
  id v0 = OUTLINED_FUNCTION_6_29();
  self;
  uint64_t v1 = (void *)swift_dynamicCastObjCClass();
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_possibleStatesCollection);

    if (v2) {
      return v2;
    }
  }
  else
  {
  }
  id v3 = OUTLINED_FUNCTION_6_29();
  if (sub_234AEC81C(v3))
  {
    id v4 = objc_allocWithZone(MEMORY[0x263F0FCB8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687D09A0);
    uint64_t v5 = (void *)sub_234B3B6F8();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v4, sel_initWithItems_, v5);
  }
  else
  {
    id v7 = objc_allocWithZone(MEMORY[0x263F0FCB8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687D09A0);
    uint64_t v5 = (void *)sub_234B3B6F8();
    id v6 = objc_msgSend(v7, sel_initWithItems_, v5);
  }
  id v2 = v6;

  return v2;
}

uint64_t sub_234AEA5E8(void *a1)
{
  id v3 = objc_msgSend(v1, sel_currentState);
  id v4 = objc_msgSend(a1, sel_sections);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D0E00);
  unint64_t v5 = sub_234B3B718();

  id v6 = v3;
  uint64_t v7 = sub_234AE9258(v5, v3, v1);
  swift_bridgeObjectRelease();

  return v7;
}

id sub_234AEA6A8(void *a1, uint64_t a2)
{
  id v3 = v2;
  id v6 = OUTLINED_FUNCTION_14_23();
  id v7 = objc_msgSend(v6, sel_localizedLabelForPossibleState_, a1);

  if (v7)
  {
    uint64_t v8 = sub_234B3B588();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0xE000000000000000;
  }
  id v11 = OUTLINED_FUNCTION_14_23();
  id v12 = objc_msgSend(v11, sel_localizedSubtitleLabelForPossibleState_, a1);

  if (v12)
  {
    uint64_t v13 = sub_234B3B588();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
  }
  id v16 = OUTLINED_FUNCTION_14_23();
  id v17 = objc_msgSend(v16, sel_accessoryIconForPossibleState_, a1);

  if (!v17)
  {
    id v18 = OUTLINED_FUNCTION_14_23();
    id v19 = objc_msgSend(v18, sel_accessoryImageForPossibleState_, a1);

    if (v19)
    {
      long long v25 = v19;
      sub_234AEA89C(&v25, &v24);

      id v17 = v24;
    }
    else
    {
      id v17 = 0;
    }
  }
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v3;
  *(void *)(v20 + 24) = a1;
  objc_allocWithZone(MEMORY[0x263F879B8]);
  id v21 = v3;
  id v22 = a1;
  return sub_234AEC238(v8, v10, v13, v15, v17, a2, (uint64_t)sub_234AEC8C0, v20);
}

id sub_234AEA89C@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  id v3 = *a1;
  uint64_t v4 = sub_234AEC8C8(*a1);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    id v8 = objc_msgSend(v3, sel_tintColor);
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_colorWithAlphaComponent_, 0.125);
      id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F852F8]), sel_initWithColor_, v10);

      id v12 = objc_allocWithZone(MEMORY[0x263F85438]);
      id result = sub_234AEC1C0(v6, v7, v9, v11);
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v14 = sub_234AEC8C8(v3);
  if (v15)
  {
    uint64_t v16 = v14;
    uint64_t v17 = v15;
    id v18 = objc_msgSend(self, sel_clearBackground);
    id v19 = objc_allocWithZone(MEMORY[0x263F85438]);
    id result = sub_2349A5038(v16, v17, v18);
  }
  else
  {
    id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F85310]), sel_initWithImage_, v3);
  }
LABEL_8:
  *a2 = result;
  return result;
}

id sub_234AEAA08(void *a1, uint64_t a2)
{
  objc_msgSend(a1, sel_commitState_, a2);
  return objc_msgSend(a1, sel_completeEditing);
}

void sub_234AEAA54(uint64_t a1)
{
  id v2 = OUTLINED_FUNCTION_11_23();
  self;
  uint64_t v3 = OUTLINED_FUNCTION_12_22();

  if (v3
    || (id v4 = OUTLINED_FUNCTION_11_23(),
        self,
        uint64_t v5 = OUTLINED_FUNCTION_12_22(),
        v4,
        v5))
  {
    id v6 = OUTLINED_FUNCTION_11_23();
    unsigned __int8 v7 = objc_msgSend(v6, sel_wf_supportsSearch);

    if ((v7 & 1) != 0
      || (id v8 = OUTLINED_FUNCTION_11_23(),
          unsigned int v9 = objc_msgSend(v8, sel_isRangedSizeArray),
          v8,
          v9))
    {
      sub_234AEBBC0(0, a1, 0);
    }
  }
}

uint64_t sub_234AEABB8()
{
  OUTLINED_FUNCTION_1_2();
  v1[25] = v0;
  sub_234B3B878();
  v1[26] = sub_234B3B868();
  uint64_t v3 = sub_234B3B818();
  v1[27] = v3;
  v1[28] = v2;
  return MEMORY[0x270FA2498](sub_234AEAC4C, v3, v2);
}

uint64_t sub_234AEAC4C()
{
  OUTLINED_FUNCTION_27_2();
  id v1 = objc_msgSend(*(id *)(v0 + 200), sel_parameter);
  unsigned int v2 = objc_msgSend(v1, sel_liveUpdatesPossibleStatesInEditor);

  if (v2)
  {
    id v3 = objc_msgSend(*(id *)(v0 + 200), sel_parameter);
    objc_msgSend(v3, sel_stopLiveUpdatingPossibleStates);
  }
  uint64_t v4 = *(void *)(v0 + 200);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_234AEAD9C;
  swift_continuation_init();
  *(void *)(v0 + 144) = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_15_18(COERCE_DOUBLE(0x40000000));
  *(void *)(v0 + 160) = sub_234AE960C;
  *(void *)(v0 + 168) = &block_descriptor_35;
  *(void *)(v0 + 176) = v5;
  uint64_t v6 = type metadata accessor for EnumerationParameterSummaryEditor();
  *(void *)(v0 + 184) = v4;
  *(void *)(v0 + 192) = v6;
  objc_msgSendSuper2((objc_super *)(v0 + 184), sel_cancelEditingWithCompletionHandler_, v0 + 144);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_234AEAD9C()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_3_11();
  *id v1 = v0;
  uint64_t v3 = *(void *)(v2 + 224);
  uint64_t v4 = *(void *)(v2 + 216);
  return MEMORY[0x270FA2498](sub_234AEAE78, v4, v3);
}

uint64_t sub_234AEAE78()
{
  OUTLINED_FUNCTION_27_2();
  id v1 = *(void **)(v0[25] + OBJC_IVAR____TtC14WorkflowEditor33EnumerationParameterSummaryEditor_valuePicker);
  v0[29] = v1;
  if (v1)
  {
    v0[10] = v0;
    v0[11] = sub_234AEAFBC;
    swift_continuation_init();
    v0[18] = MEMORY[0x263EF8330];
    OUTLINED_FUNCTION_15_18(COERCE_DOUBLE(0x40000000));
    v0[20] = sub_234AE960C;
    v0[21] = &block_descriptor_36;
    v0[22] = v2;
    objc_msgSend(v1, sel_dismissWithCompletionHandler_, v0 + 18);
    return MEMORY[0x270FA23F0](v0 + 10);
  }
  else
  {
    swift_release();
    sub_234AEBBAC(0);
    OUTLINED_FUNCTION_32_1();
    return v3();
  }
}

uint64_t sub_234AEAFBC()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_3_11();
  *id v1 = v0;
  uint64_t v3 = *(void *)(v2 + 224);
  uint64_t v4 = *(void *)(v2 + 216);
  return MEMORY[0x270FA2498](sub_234AEB098, v4, v3);
}

uint64_t sub_234AEB098()
{
  OUTLINED_FUNCTION_1_2();
  id v1 = *(void **)(v0 + 232);
  swift_release();

  sub_234AEBBAC(0);
  OUTLINED_FUNCTION_32_1();
  return v2();
}

uint64_t sub_234AEB180(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_234B3B878();
  v2[4] = sub_234B3B868();
  uint64_t v4 = sub_234B3B818();
  return MEMORY[0x270FA2498](sub_234AEB218, v4, v3);
}

uint64_t sub_234AEB218()
{
  OUTLINED_FUNCTION_1_2();
  id v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_23499A564;
  return sub_234AEABB8();
}

id sub_234AEB2C4()
{
  id v1 = OUTLINED_FUNCTION_6_29();
  unsigned int v2 = objc_msgSend(v1, sel_liveUpdatesPossibleStatesInEditor);

  if (v2)
  {
    id v3 = OUTLINED_FUNCTION_6_29();
    objc_msgSend(v3, sel_stopLiveUpdatingPossibleStates);
  }
  uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC14WorkflowEditor33EnumerationParameterSummaryEditor_valuePicker];
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v5, sel_dismissWithCompletionHandler_, 0);
    sub_234AEBBAC(0);
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for EnumerationParameterSummaryEditor();
  return objc_msgSendSuper2(&v7, sel_completeEditing);
}

uint64_t sub_234AEB3D0()
{
  OUTLINED_FUNCTION_1_2();
  v1[24] = v0;
  sub_234B3B878();
  v1[25] = sub_234B3B868();
  uint64_t v3 = sub_234B3B818();
  v1[26] = v3;
  v1[27] = v2;
  return MEMORY[0x270FA2498](sub_234AEB464, v3, v2);
}

uint64_t sub_234AEB464()
{
  OUTLINED_FUNCTION_27_2();
  id v1 = objc_msgSend(*(id *)(v0 + 192), sel_parameter);
  *(void *)(v0 + 224) = v1;
  self;
  uint64_t v2 = OUTLINED_FUNCTION_12_22();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = v0 + 80;
    *(void *)(v0 + 80) = v0;
    *(void *)(v0 + 120) = v0 + 184;
    *(void *)(v0 + 88) = sub_234AEB770;
    swift_continuation_init();
    *(void *)(v0 + 144) = MEMORY[0x263EF8330];
    OUTLINED_FUNCTION_15_18(COERCE_DOUBLE(0x40000000));
    *(void *)(v0 + 160) = sub_234AEBB48;
    *(void *)(v0 + 168) = &block_descriptor_8;
    *(void *)(v0 + 176) = v5;
    objc_msgSend(v3, sel_getStatesWithSearchTerm_completionHandler_, 0, v0 + 144);
LABEL_7:
    return MEMORY[0x270FA23F0](v4);
  }
  uint64_t v6 = *(void **)(v0 + 192);

  id v7 = objc_msgSend(v6, sel_parameter);
  unsigned int v8 = objc_msgSend(v7, sel_liveUpdatesPossibleStatesInEditor);

  if (v8)
  {
    id v9 = objc_msgSend(*(id *)(v0 + 192), sel_parameter);
    objc_msgSend(v9, sel_startLiveUpdatingPossibleStates);
  }
  id v10 = objc_msgSend(*(id *)(v0 + 192), sel_parameter);
  *(void *)(v0 + 240) = v10;
  self;
  uint64_t v11 = OUTLINED_FUNCTION_12_22();
  *(void *)(v0 + 248) = v11;
  if (v11)
  {
    id v12 = (void *)v11;
    uint64_t v4 = v0 + 16;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_234AEB8E4;
    swift_continuation_init();
    *(void *)(v0 + 144) = MEMORY[0x263EF8330];
    OUTLINED_FUNCTION_15_18(COERCE_DOUBLE(0x40000000));
    *(void *)(v0 + 160) = sub_234AE9798;
    *(void *)(v0 + 168) = &block_descriptor_6;
    *(void *)(v0 + 176) = v13;
    objc_msgSend(v12, sel_loadPossibleStatesWithCompletionHandler_, v0 + 144);
    goto LABEL_7;
  }
  uint64_t v14 = *(void **)(v0 + 192);

  swift_release();
  if (sub_234AEC81C(objc_msgSend(v14, sel_parameter)))
  {
    id v15 = objc_allocWithZone(MEMORY[0x263F0FCB8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687D09A0);
    uint64_t v16 = (void *)sub_234B3B6F8();
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_initWithItems_, v16);
  }
  uint64_t v17 = OUTLINED_FUNCTION_28_2();
  return v18(v17);
}

uint64_t sub_234AEB770()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_3_11();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  uint64_t v4 = v3[14];
  *(void *)(v1 + 232) = v4;
  uint64_t v5 = v3[27];
  uint64_t v6 = v3[26];
  if (v4) {
    id v7 = sub_234AEBA64;
  }
  else {
    id v7 = sub_234AEB874;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_234AEB874()
{
  OUTLINED_FUNCTION_1_2();

  swift_release();
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_234AEB8E4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_3_11();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  uint64_t v4 = v3[6];
  *(void *)(v1 + 256) = v4;
  uint64_t v5 = v3[27];
  uint64_t v6 = v3[26];
  if (v4) {
    id v7 = sub_234AEBAD4;
  }
  else {
    id v7 = sub_234AEB9E8;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_234AEB9E8()
{
  OUTLINED_FUNCTION_1_2();
  uint64_t v1 = *(void **)(v0 + 240);
  uint64_t v2 = *(void **)(v0 + 248);
  swift_release();
  objc_msgSend(v2, sel_possibleStatesCollection);

  uint64_t v3 = OUTLINED_FUNCTION_28_2();
  return v4(v3);
}

uint64_t sub_234AEBA64()
{
  OUTLINED_FUNCTION_27_2();
  uint64_t v1 = *(void **)(v0 + 224);
  swift_release();
  swift_willThrow();

  OUTLINED_FUNCTION_32_1();
  return v2();
}

uint64_t sub_234AEBAD4()
{
  OUTLINED_FUNCTION_27_2();
  uint64_t v1 = *(void **)(v0 + 240);
  swift_release();
  swift_willThrow();

  OUTLINED_FUNCTION_32_1();
  return v2();
}

uint64_t sub_234AEBB48(uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (a3) {
    return sub_234AE97EC(v3, (uint64_t)a3);
  }
  if (a2)
  {
    id v4 = a2;
    return sub_234AE9854(v3, (uint64_t)v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_234AEBBAC(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC14WorkflowEditor33EnumerationParameterSummaryEditor_valuePicker);
  *(void *)(v1 + OBJC_IVAR____TtC14WorkflowEditor33EnumerationParameterSummaryEditor_valuePicker) = a1;
}

void sub_234AEBBC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v17 = WFModuleSummaryEditorInitialState(v3);
  id v16 = self;
  id v4 = objc_msgSend(v3, sel_parameter);
  id v5 = objc_msgSend(v3, sel_variableProvider);
  id v6 = objc_msgSend(v3, sel_variableUIDelegate);
  unsigned __int8 v7 = objc_msgSend(v3, sel_allowsPickingVariables);
  unsigned __int8 v8 = objc_msgSend(v3, sel_isProcessing);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  long long v25 = sub_234AEC198;
  uint64_t v26 = v9;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_234A9D194;
  unint64_t v24 = &block_descriptor_36;
  id v10 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  long long v25 = sub_234AEC1B8;
  uint64_t v26 = v11;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_234AEBF7C;
  unint64_t v24 = &block_descriptor_5;
  id v12 = _Block_copy(&aBlock);
  swift_release();
  BYTE1(v15) = v8;
  LOBYTE(v15) = v7;
  id v13 = objc_msgSend(v16, sel_presentWithParameter_state_slotIdentifier_initialCollection_variableProvider_variableUIDelegate_allowsPickingVariables_processing_presentationAnchor_cancelHandler_completionHandler_, v4, v17, a1, a3, v5, v6, v15, a2, v10, v12);
  _Block_release(v12);
  _Block_release(v10);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  id v14 = v13;
  sub_234AEBBAC((uint64_t)v13);
}

void sub_234AEBE44(char a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  id v4 = (void *)MEMORY[0x237DCE350](v3);
  if (v4)
  {
    id v5 = v4;
    if (a1)
    {
      id v6 = objc_msgSend(v4, sel_currentState);
      if (v6)
      {
        unsigned __int8 v7 = v6;
        objc_msgSend(v5, sel_commitState_, v6);
      }
    }
    objc_msgSend(v5, sel_completeEditing);
  }
}

void sub_234AEBEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x237DCE350](v3);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = *(void **)(v4 + OBJC_IVAR____TtC14WorkflowEditor33EnumerationParameterSummaryEditor_valuePicker);
    if (v6) {
      objc_msgSend(v6, sel_setCurrentState_, a1);
    }
    objc_msgSend(v5, sel_commitState_, a1);
    objc_msgSend(v5, sel_completeEditing);
  }
}

void sub_234AEBF7C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

BOOL sub_234AEBFE4()
{
  return swift_dynamicCastObjCClass() == 0;
}

id sub_234AEC040(void *a1, uint64_t a2, char a3)
{
  *(void *)&v3[OBJC_IVAR____TtC14WorkflowEditor33EnumerationParameterSummaryEditor_valuePicker] = 0;
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for EnumerationParameterSummaryEditor();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithParameter_arrayIndex_processing_, a1, a2, a3 & 1);

  return v7;
}

id sub_234AEC0F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EnumerationParameterSummaryEditor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EnumerationParameterSummaryEditor()
{
  return self;
}

uint64_t sub_234AEC160()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_234AEC198(char a1)
{
  sub_234AEBE44(a1, v1);
}

uint64_t block_copy_helper_27(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_27()
{
  return swift_release();
}

void sub_234AEC1B8(uint64_t a1)
{
  sub_234AEBEE4(a1, v1);
}

id sub_234AEC1C0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = (void *)sub_234B3B548();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v4, sel_initWithSymbolName_symbolColor_background_, v7, a3, a4);

  return v8;
}

id sub_234AEC238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  objc_super v9 = v8;
  uint64_t v15 = (void *)sub_234B3B548();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    id v16 = 0;
    if (a7) {
      goto LABEL_3;
    }
LABEL_5:
    id v17 = 0;
    goto LABEL_6;
  }
  id v16 = (void *)sub_234B3B548();
  swift_bridgeObjectRelease();
  if (!a7) {
    goto LABEL_5;
  }
LABEL_3:
  v20[4] = a7;
  v20[5] = a8;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 1107296256;
  v20[2] = sub_234944DB8;
  v20[3] = &block_descriptor_14;
  id v17 = _Block_copy(v20);
  swift_release();
LABEL_6:
  id v18 = objc_msgSend(v9, sel_initWithTitle_subtitle_icon_state_handler_, v15, v16, a5, a6, v17);

  _Block_release(v17);
  return v18;
}

uint64_t sub_234AEC378(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *id v4 = v3;
  v4[1] = sub_23499D1E8;
  return v6();
}

uint64_t sub_234AEC444(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_23499D1E8;
  return v7();
}

uint64_t sub_234AEC510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_234B3B8A8();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_234AECBBC(a1);
  }
  else
  {
    sub_234B3B898();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_234B3B818();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_234AEC678(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_234AEC754;
  return v6(a1);
}

uint64_t sub_234AEC754()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_11();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_32_1();
  return v3();
}

uint64_t sub_234AEC81C(void *a1)
{
  id v2 = objc_msgSend(a1, sel_possibleStates);

  if (!v2) {
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D09A0);
  uint64_t v3 = sub_234B3B718();

  return v3;
}

uint64_t sub_234AEC888()
{
  OUTLINED_FUNCTION_50();
  return swift_deallocObject();
}

id sub_234AEC8C0()
{
  return sub_234AEAA08(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_234AEC8C8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_symbolName);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_234B3B588();

  return v3;
}

uint64_t sub_234AEC92C()
{
  _Block_release(*(const void **)(v0 + 16));

  OUTLINED_FUNCTION_50();
  return swift_deallocObject();
}

uint64_t sub_234AEC964()
{
  OUTLINED_FUNCTION_27_2();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_5_28(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_23499CFF8;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2687D8190 + dword_2687D8190);
  return v6(v1, v2);
}

uint64_t sub_234AECA0C()
{
  OUTLINED_FUNCTION_27_5();
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_5_28(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_23499D1E8;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2687D81A8 + dword_2687D81A8);
  return v7(v1, v2, v3);
}

uint64_t objectdestroy_20Tm_0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_234AECB08()
{
  OUTLINED_FUNCTION_27_5();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_5_28(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23499D1E8;
  uint64_t v3 = OUTLINED_FUNCTION_34_3();
  return v4(v3);
}

uint64_t sub_234AECBBC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D1870);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_234AECC1C()
{
  swift_release();
  OUTLINED_FUNCTION_50();
  return swift_deallocObject();
}

uint64_t sub_234AECC4C()
{
  OUTLINED_FUNCTION_27_2();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_5_28(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_23499CFF8;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2687D81C8 + dword_2687D81C8);
  return v7(v2, v3);
}

uint64_t sub_234AECCFC()
{
  OUTLINED_FUNCTION_1_2();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_5_28(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_234AECD8C;
  return sub_234AEA0AC(v1, v2);
}

uint64_t sub_234AECD8C()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_11();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = OUTLINED_FUNCTION_8_28();
  return v4(v3);
}

uint64_t sub_234AECE54()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_234AECEA4()
{
  OUTLINED_FUNCTION_27_5();
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_5_28(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_23499D1E8;
  uint64_t v6 = OUTLINED_FUNCTION_34_3();
  return sub_234AE998C(v6, v7, v8, v9, v1, v2);
}

uint64_t sub_234AECF54()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_5_28(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

id OUTLINED_FUNCTION_6_29()
{
  return [v0 (SEL)(v1 + 1465)];
}

uint64_t OUTLINED_FUNCTION_8_28()
{
  return v0;
}

id OUTLINED_FUNCTION_11_23()
{
  return [v0 (SEL)(v1 + 1465)];
}

uint64_t OUTLINED_FUNCTION_12_22()
{
  return swift_dynamicCastObjCClass();
}

id OUTLINED_FUNCTION_14_23()
{
  return [v0 (SEL)(v1 + 1465)];
}

void OUTLINED_FUNCTION_15_18(double a1)
{
  *(double *)(v1 + 152) = a1;
}

void destroy for VariableConfigurationCoercionPickerView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 24);
}

void *assignWithCopy for VariableConfigurationCoercionPickerView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a2[3];
  uint64_t v5 = (void *)a1[3];
  a1[3] = v4;
  id v6 = v4;

  return a1;
}

ValueMetadata *type metadata accessor for VariableConfigurationCoercionPickerView()
{
  return &type metadata for VariableConfigurationCoercionPickerView;
}

uint64_t sub_234AED118()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_234AED134(void *a1)
{
  uint64_t v2 = sub_234B382F8();
  uint64_t v12 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v5 = a1;
  sub_234B3BA38();

  sub_234AF2B84(&qword_2687D1FE8, MEMORY[0x263F06DC0]);
  sub_234B3BD88();
  if (v16)
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
    do
    {
      sub_234964030(&v15, v14);
      sub_234963FD4((uint64_t)v14, (uint64_t)v13);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D4FE0);
      if ((swift_dynamicCast() & 1) == 0) {
        uint64_t v17 = 0;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      uint64_t v7 = v17;
      if (v17)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2349D22FC();
          uint64_t v6 = v9;
        }
        unint64_t v8 = *(void *)(v6 + 16);
        if (v8 >= *(void *)(v6 + 24) >> 1)
        {
          sub_2349D22FC();
          uint64_t v6 = v10;
        }
        *(void *)(v6 + 16) = v8 + 1;
        *(void *)(v6 + 8 * v8 + 32) = v7;
      }
      sub_234B3BD88();
    }
    while (v16);
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v4, v2);
  return v6;
}

uint64_t sub_234AED380()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D0910);
  sub_234B3ADB8();
  return v1;
}

uint64_t sub_234AED3D8()
{
  return sub_234B3ADC8();
}

double sub_234AED434()
{
  char v0 = sub_234AED380();
  double result = -90.0;
  if ((v0 & 1) == 0) {
    return 0.0;
  }
  return result;
}

uint64_t sub_234AED460@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v35 = MEMORY[0x263F1A830];
  uint64_t v36 = MEMORY[0x263F1B6B0];
  uint64_t v27 = *(void *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D62E0);
  sub_234B39828();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D82A8);
  swift_getTupleTypeMetadata();
  sub_234B3B1E8();
  uint64_t v26 = MEMORY[0x263F1BAD0];
  swift_getWitnessTable();
  sub_234B3AE78();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D2D70);
  sub_234B39828();
  uint64_t v23 = MEMORY[0x263F1B650];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v43 = sub_2349158F4((unint64_t *)&unk_2687D3790, &qword_2687D2D70);
  swift_getWitnessTable();
  uint64_t v35 = sub_234B3AE58();
  uint64_t v36 = sub_234B39898();
  uint64_t v37 = swift_getWitnessTable();
  uint64_t v38 = sub_234AF2B84((unint64_t *)&qword_2687D65F0, MEMORY[0x263F18FD0]);
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v3 = a1;
  uint64_t v21 = a1;
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(v3 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D82B0);
  swift_getTupleTypeMetadata3();
  sub_234B3B1E8();
  swift_getWitnessTable();
  sub_234B3AE78();
  sub_234B39828();
  uint64_t v40 = swift_getWitnessTable();
  uint64_t v41 = v43;
  swift_getWitnessTable();
  uint64_t v35 = sub_234B3AE58();
  uint64_t v37 = swift_getWitnessTable();
  uint64_t v6 = swift_getOpaqueTypeMetadata2();
  uint64_t v7 = v21;
  uint64_t v8 = *(void *)(v21 + 48);
  uint64_t v35 = v4;
  uint64_t v36 = AssociatedTypeWitness;
  uint64_t v37 = v6;
  uint64_t v38 = v5;
  uint64_t v39 = v8;
  sub_234B3B028();
  sub_234B3BD78();
  swift_getTupleTypeMetadata2();
  sub_234B3B1E8();
  uint64_t v9 = sub_234B3ACF8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&AssociatedTypeWitness - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  long long v15 = (char *)&AssociatedTypeWitness - v14;
  uint64_t v28 = v27;
  uint64_t v29 = v4;
  uint64_t v30 = *(void *)(v7 + 32);
  uint64_t v31 = v5;
  uint64_t v32 = v8;
  uint64_t v33 = v24;
  uint64_t v16 = swift_getWitnessTable();
  sub_234B3ACE8();
  uint64_t v34 = v16;
  uint64_t v17 = swift_getWitnessTable();
  sub_2349E676C(v12, v9, v17);
  id v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v12, v9);
  sub_2349E676C(v15, v9, v17);
  return ((uint64_t (*)(char *, uint64_t))v18)(v15, v9);
}

uint64_t sub_234AED998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v134 = a4;
  uint64_t v125 = a1;
  uint64_t v132 = a6;
  uint64_t v111 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  v113 = (char *)v102 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D82B0);
  swift_getTupleTypeMetadata3();
  sub_234B3B1E8();
  uint64_t v139 = MEMORY[0x263F1BAD0];
  swift_getWitnessTable();
  sub_234B3AE78();
  v138 = (char *)__swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D2D70);
  sub_234B39828();
  uint64_t v137 = MEMORY[0x263F1B650];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v123 = sub_2349158F4((unint64_t *)&unk_2687D3790, &qword_2687D2D70);
  uint64_t v163 = WitnessTable;
  uint64_t v164 = v123;
  uint64_t v122 = MEMORY[0x263F18E48];
  swift_getWitnessTable();
  uint64_t v16 = sub_234B3AE58();
  uint64_t v17 = sub_234B39898();
  v126 = (char *)MEMORY[0x263F1B5F8];
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v19 = sub_234AF2B84((unint64_t *)&qword_2687D65F0, MEMORY[0x263F18FD0]);
  uint64_t v141 = v16;
  uint64_t v158 = v16;
  uint64_t v159 = v17;
  uint64_t v140 = v18;
  uint64_t v160 = v18;
  uint64_t v161 = v19;
  uint64_t v20 = v19;
  uint64_t v144 = v19;
  uint64_t KeyPath = MEMORY[0x263F1A938];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v135 = v13;
  uint64_t v158 = v13;
  uint64_t v159 = AssociatedTypeWitness;
  uint64_t v108 = OpaqueTypeMetadata2;
  uint64_t v160 = OpaqueTypeMetadata2;
  uint64_t v161 = v11;
  uint64_t v136 = v11;
  uint64_t v133 = a5;
  uint64_t v162 = a5;
  uint64_t v22 = sub_234B3B028();
  uint64_t v110 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  v107 = (char *)v102 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v109 = (char *)v102 - v25;
  uint64_t v130 = v26;
  uint64_t v131 = sub_234B3BD78();
  uint64_t v127 = *(void *)(v131 - 8);
  MEMORY[0x270FA5388](v131);
  uint64_t v129 = (uint64_t)v102 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v128 = (uint64_t)v102 - v29;
  uint64_t v30 = swift_checkMetadataState();
  uint64_t v143 = v30;
  uint64_t v124 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  v121 = (char *)v102 - v31;
  uint64_t v158 = a2;
  uint64_t v159 = v13;
  uint64_t v160 = a4;
  uint64_t v161 = v11;
  uint64_t v162 = a5;
  uint64_t v32 = type metadata accessor for FlatteningPicker();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(void *)(v33 + 64);
  MEMORY[0x270FA5388](v32);
  v106 = (char *)v102 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)v102 - v36;
  uint64_t v158 = MEMORY[0x263F1A830];
  uint64_t v159 = MEMORY[0x263F1B6B0];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D62E0);
  uint64_t v160 = sub_234B39828();
  uint64_t v161 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D82A8);
  swift_getTupleTypeMetadata();
  sub_234B3B1E8();
  swift_getWitnessTable();
  sub_234B3AE78();
  uint64_t v38 = sub_234B39828();
  v157[3] = swift_getWitnessTable();
  v157[4] = v123;
  uint64_t v119 = v38;
  uint64_t v122 = swift_getWitnessTable();
  uint64_t v39 = sub_234B3AE58();
  uint64_t v118 = v39;
  uint64_t v123 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  v116 = (char *)v102 - v40;
  uint64_t v117 = swift_getWitnessTable();
  uint64_t v158 = v39;
  uint64_t v159 = v30;
  uint64_t v160 = v117;
  uint64_t v161 = v20;
  uint64_t v139 = swift_getOpaqueTypeMetadata2();
  uint64_t v137 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  v126 = (char *)v102 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v42);
  v114 = (char *)v102 - v43;
  double v45 = MEMORY[0x270FA5388](v44);
  v138 = (char *)v102 - v46;
  uint64_t v142 = v33;
  uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v33 + 16);
  uint64_t v48 = v37;
  int64_t v49 = v37;
  uint64_t v50 = v125;
  uint64_t v51 = v32;
  uint64_t v115 = v32;
  uint64_t v104 = v33 + 16;
  v103 = v47;
  ((void (*)(char *, uint64_t, uint64_t, double))v47)(v49, v125, v32, v45);
  uint64_t v52 = *(unsigned __int8 *)(v33 + 80);
  uint64_t v53 = (v52 + 56) & ~v52;
  v102[1] = v53 + v34;
  v102[0] = v52 | 7;
  unint64_t v54 = (void *)swift_allocObject();
  uint64_t v55 = a2;
  uint64_t v56 = v135;
  v54[2] = a2;
  v54[3] = v56;
  uint64_t v57 = v134;
  uint64_t v58 = v136;
  v54[4] = v134;
  v54[5] = v58;
  uint64_t v59 = v133;
  v54[6] = v133;
  uint64_t v105 = v53;
  uint64_t v60 = (char *)v54 + v53;
  uint64_t v61 = *(void (**)(char *, char *, uint64_t))(v142 + 32);
  v142 += 32;
  v61(v60, v48, v51);
  uint64_t v112 = v55;
  uint64_t v145 = v55;
  uint64_t v146 = v56;
  uint64_t v147 = v57;
  uint64_t v148 = v58;
  uint64_t v149 = v59;
  uint64_t v150 = v50;
  uint64_t v62 = v50;
  v63 = v116;
  uint64_t v64 = v144;
  sub_234B3AE28();
  id v65 = v121;
  sub_234B39888();
  uint64_t v66 = v114;
  uint64_t v67 = v118;
  uint64_t v68 = v143;
  uint64_t v69 = v117;
  sub_234B3A798();
  (*(void (**)(char *, uint64_t))(v124 + 8))(v65, v68);
  (*(void (**)(char *, uint64_t))(v123 + 8))(v63, v67);
  uint64_t v158 = v67;
  uint64_t v159 = v68;
  uint64_t v160 = v69;
  uint64_t v161 = v64;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v71 = v139;
  uint64_t v122 = OpaqueTypeConformance2;
  sub_2349E676C(v66, v139, OpaqueTypeConformance2);
  uint64_t v72 = *(void (**)(char *, uint64_t))(v137 + 8);
  uint64_t v124 = v137 + 8;
  uint64_t v123 = (uint64_t)v72;
  v72(v66, v71);
  uint64_t v73 = v115;
  uint64_t v74 = v62;
  if (sub_234AED380())
  {
    uint64_t v75 = v129;
    __swift_storeEnumTagSinglePayload(v129, 1, 1, v130);
    uint64_t v158 = v141;
    uint64_t v159 = v143;
    uint64_t v160 = v140;
    uint64_t v161 = v144;
    uint64_t v151 = swift_getOpaqueTypeConformance2();
    swift_getWitnessTable();
  }
  else
  {
    v77 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v111 + 16);
    v121 = (char *)v61;
    uint64_t v78 = v135;
    uint64_t v79 = v77(v113, v62, v135);
    MEMORY[0x270FA5388](v79);
    uint64_t v80 = v112;
    v102[-6] = v112;
    v102[-5] = v78;
    uint64_t v81 = v134;
    uint64_t v82 = v136;
    v102[-4] = v134;
    v102[-3] = v82;
    uint64_t v83 = v133;
    uint64_t KeyPath = swift_getKeyPath();
    v84 = v106;
    v103(v106, v74, v73);
    v85 = (void *)swift_allocObject();
    v85[2] = v80;
    v85[3] = v78;
    v85[4] = v81;
    v85[5] = v82;
    v86 = (char *)v85 + v105;
    v85[6] = v83;
    ((void (*)(char *, char *, uint64_t))v121)(v86, v84, v73);
    uint64_t v158 = v141;
    uint64_t v159 = v143;
    uint64_t v160 = v140;
    uint64_t v161 = v144;
    uint64_t v87 = swift_getOpaqueTypeConformance2();
    uint64_t v101 = v87;
    v88 = v107;
    sub_234B3B008();
    v157[2] = v87;
    uint64_t v89 = v130;
    uint64_t v90 = swift_getWitnessTable();
    v91 = v109;
    sub_2349E676C(v88, v89, v90);
    v92 = *(void (**)(char *, uint64_t))(v110 + 8);
    v92(v88, v89);
    uint64_t v75 = v129;
    sub_2349E676C(v91, v89, v90);
    v92(v91, v89);
    __swift_storeEnumTagSinglePayload(v75, 0, 1, v89);
  }
  uint64_t v76 = v128;
  sub_234A88E64(v75, v128);
  uint64_t v93 = v127;
  v94 = *(void (**)(uint64_t, uint64_t))(v127 + 8);
  uint64_t v95 = v131;
  v94(v75, v131);
  v96 = v126;
  v97 = v138;
  uint64_t v98 = v139;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v126, v138, v139);
  v157[0] = v96;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v93 + 16))(v75, v76, v95);
  v157[1] = v75;
  v156[0] = v98;
  v156[1] = v95;
  uint64_t v154 = v122;
  uint64_t v158 = v141;
  uint64_t v159 = v143;
  uint64_t v160 = v140;
  uint64_t v161 = v144;
  uint64_t v153 = swift_getOpaqueTypeConformance2();
  uint64_t v152 = swift_getWitnessTable();
  uint64_t v155 = swift_getWitnessTable();
  sub_234A88CF8((uint64_t)v157, 2, (uint64_t)v156);
  v94(v76, v95);
  v99 = (uint64_t (*)(char *, uint64_t))v123;
  ((void (*)(char *, uint64_t))v123)(v97, v98);
  v94(v75, v95);
  return v99(v96, v98);
}

uint64_t sub_234AEE964()
{
  return swift_release();
}

uint64_t sub_234AEE9D8()
{
  return swift_release();
}

uint64_t sub_234AEEA98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v27 = a5;
  uint64_t v28 = a6;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a1;
  uint64_t v29 = a7;
  uint64_t v38 = MEMORY[0x263F1A830];
  uint64_t v39 = MEMORY[0x263F1B6B0];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D62E0);
  uint64_t v40 = sub_234B39828();
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D82A8);
  swift_getTupleTypeMetadata();
  sub_234B3B1E8();
  swift_getWitnessTable();
  uint64_t v8 = sub_234B3AE78();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - v10;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D2D70);
  uint64_t v12 = sub_234B39828();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  long long v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v24 - v17;
  uint64_t v30 = a2;
  uint64_t v31 = v24;
  uint64_t v32 = v25;
  uint64_t v33 = v27;
  uint64_t v34 = v28;
  uint64_t v35 = v26;
  sub_234A81278();
  sub_234B3AE68();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_234A80EB4();
  sub_234A53330();
  sub_234B3A7F8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v20 = sub_2349158F4((unint64_t *)&unk_2687D3790, &qword_2687D2D70);
  uint64_t v36 = WitnessTable;
  uint64_t v37 = v20;
  uint64_t v21 = swift_getWitnessTable();
  sub_2349E676C(v15, v12, v21);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v13 + 8);
  v22(v15, v12);
  sub_2349E676C(v18, v12, v21);
  return ((uint64_t (*)(char *, uint64_t))v22)(v18, v12);
}

uint64_t sub_234AEEE1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(void, void)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v63 = a6;
  uint64_t v57 = a4;
  uint64_t v59 = a7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  long long v15 = (char *)&v53 - v14;
  uint64_t v58 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D62E0);
  uint64_t v65 = sub_234B39828();
  uint64_t v55 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v64 = (char *)&v53 - v22;
  uint64_t v71 = a2;
  uint64_t v72 = a3;
  uint64_t v73 = (uint64_t)a4;
  uint64_t v74 = a5;
  uint64_t v75 = v63;
  uint64_t v23 = type metadata accessor for FlatteningPicker();
  uint64_t v24 = (uint64_t *)(a1 + *(int *)(v23 + 64));
  uint64_t v25 = v24[1];
  uint64_t v71 = *v24;
  uint64_t v72 = v25;
  sub_23491B698();
  swift_bridgeObjectRetain();
  uint64_t v63 = sub_234B3A628();
  uint64_t v62 = v26;
  uint64_t v56 = v27;
  int v61 = v28 & 1;
  uint64_t v29 = *(int *)(v23 + 68);
  uint64_t v53 = a1;
  uint64_t v30 = *(void (**)(char *))(a1 + v29);
  uint64_t v31 = sub_234B3AFD8();
  MEMORY[0x237DCBA80](v31);
  v30(v15);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, AssociatedTypeWitness);
  sub_234B3ACB8();
  uint64_t v32 = v57;
  sub_234B3A888();
  swift_release();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v18, a2);
  uint64_t v33 = sub_2349158F4((unint64_t *)&unk_2687D1060, &qword_2687D62E0);
  v85[4] = v32;
  v85[5] = v33;
  uint64_t v34 = v65;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v60 = v20;
  sub_2349E676C(v20, v34, WitnessTable);
  uint64_t v35 = v55;
  uint64_t v57 = *(void (**)(void, void))(v55 + 8);
  uint64_t v58 = v55 + 8;
  v57(v20, v34);
  uint64_t v36 = sub_234B3AD08();
  sub_234B3A538();
  sub_234B3A4B8();
  uint64_t v37 = sub_234B3A508();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v39 = sub_234B3ACB8();
  uint64_t v40 = swift_getKeyPath();
  double v41 = sub_234AED434() * 0.0174532925;
  sub_234B3B228();
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v46 = v63;
  uint64_t v47 = v62;
  uint64_t v81 = v63;
  uint64_t v82 = v62;
  LOBYTE(v25) = v61;
  char v83 = v61;
  uint64_t v79 = 0;
  char v80 = 1;
  uint64_t v84 = v56;
  v85[0] = &v81;
  v85[1] = &v79;
  uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  int64_t v49 = v60;
  v48(v60, v64, v65);
  uint64_t v71 = v36;
  uint64_t v72 = KeyPath;
  uint64_t v73 = v37;
  uint64_t v74 = v40;
  uint64_t v75 = v39;
  double v76 = v41;
  uint64_t v77 = v43;
  uint64_t v78 = v45;
  v85[2] = v49;
  v85[3] = &v71;
  sub_23491B740(v46, v47, v25);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v70[0] = MEMORY[0x263F1A830];
  v70[1] = MEMORY[0x263F1B6B0];
  uint64_t v50 = v65;
  v70[2] = v65;
  v70[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D82A8);
  uint64_t v66 = MEMORY[0x263F1A820];
  uint64_t v67 = MEMORY[0x263F1B698];
  uint64_t v68 = WitnessTable;
  unint64_t v69 = sub_234AF3284();
  sub_234A88CF8((uint64_t)v85, 4, (uint64_t)v70);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v51 = (void (*)(char *, uint64_t))v57;
  v57(v64, v50);
  sub_23491B730(v63, v62, v61);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v51(v60, v50);
  sub_23491B730(v81, v82, v83);
  return swift_bridgeObjectRelease();
}

uint64_t sub_234AEF544@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v75 = a7;
  uint64_t v80 = a5;
  uint64_t v60 = a2;
  uint64_t v85 = a1;
  uint64_t v83 = a8;
  uint64_t v14 = sub_234B39898();
  uint64_t v65 = v14;
  uint64_t v82 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v81 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = a6;
  uint64_t v79 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v84 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v77 = *(void *)(v84 + 64);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v17 = (char *)&v56 - v16;
  uint64_t v59 = (char *)&v56 - v16;
  uint64_t v95 = a3;
  uint64_t v96 = a4;
  uint64_t v97 = a5;
  uint64_t v98 = a6;
  uint64_t v99 = a7;
  uint64_t v18 = type metadata accessor for FlatteningPicker();
  uint64_t v57 = v18;
  uint64_t v74 = *(void *)(v18 - 8);
  uint64_t v19 = *(void *)(v74 + 64);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v56 - v20;
  uint64_t v58 = (char *)&v56 - v20;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D82B0);
  swift_getTupleTypeMetadata3();
  sub_234B3B1E8();
  swift_getWitnessTable();
  sub_234B3AE78();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D2D70);
  uint64_t v22 = sub_234B39828();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v24 = sub_2349158F4((unint64_t *)&unk_2687D3790, &qword_2687D2D70);
  uint64_t v93 = WitnessTable;
  uint64_t v94 = v24;
  uint64_t v72 = v22;
  uint64_t v71 = swift_getWitnessTable();
  uint64_t v25 = sub_234B3AE58();
  uint64_t v66 = v25;
  uint64_t v73 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v67 = (char *)&v56 - v26;
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v64 = v27;
  uint64_t v63 = sub_234AF2B84((unint64_t *)&qword_2687D65F0, MEMORY[0x263F18FD0]);
  uint64_t v95 = v25;
  uint64_t v96 = v14;
  uint64_t v97 = v27;
  uint64_t v98 = v63;
  uint64_t v68 = MEMORY[0x263F1A938];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v70 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  int v61 = (char *)&v56 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v30 = MEMORY[0x270FA5388](v29);
  uint64_t v62 = (char *)&v56 - v31;
  uint64_t v32 = v74;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v74 + 16))(v21, a2, v18, v30);
  uint64_t v33 = v84;
  uint64_t v34 = AssociatedTypeWitness;
  (*(void (**)(char *, uint64_t, uint64_t))(v84 + 16))(v17, v85, AssociatedTypeWitness);
  uint64_t v35 = v32;
  unint64_t v36 = (*(unsigned __int8 *)(v32 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  unint64_t v37 = (v19 + v36 + *(unsigned __int8 *)(v33 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v38 = (char *)swift_allocObject();
  uint64_t v39 = a3;
  uint64_t v40 = v79;
  *((void *)v38 + 2) = a3;
  *((void *)v38 + 3) = v40;
  uint64_t v41 = v80;
  uint64_t v42 = v78;
  *((void *)v38 + 4) = v80;
  *((void *)v38 + 5) = v42;
  uint64_t v43 = v75;
  *((void *)v38 + 6) = v75;
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(&v38[v36], v58, v57);
  (*(void (**)(char *, char *, uint64_t))(v84 + 32))(&v38[v37], v59, v34);
  uint64_t v86 = v39;
  uint64_t v87 = v40;
  uint64_t v88 = v41;
  uint64_t v89 = v42;
  uint64_t v90 = v43;
  uint64_t v91 = v60;
  uint64_t v92 = v85;
  uint64_t v44 = v67;
  sub_234B3AE28();
  uint64_t v45 = v81;
  sub_234B39888();
  uint64_t v46 = v61;
  uint64_t v47 = v66;
  uint64_t v48 = v65;
  uint64_t v49 = v64;
  uint64_t v50 = v63;
  sub_234B3A798();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v45, v48);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v44, v47);
  uint64_t v95 = v47;
  uint64_t v96 = v48;
  uint64_t v97 = v49;
  uint64_t v98 = v50;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v52 = v62;
  uint64_t v53 = OpaqueTypeMetadata2;
  sub_2349E676C(v46, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  unint64_t v54 = *(void (**)(char *, uint64_t))(v70 + 8);
  v54(v46, v53);
  sub_2349E676C(v52, v53, OpaqueTypeConformance2);
  return ((uint64_t (*)(char *, uint64_t))v54)(v52, v53);
}

uint64_t sub_234AEFD0C()
{
  return swift_release();
}

uint64_t sub_234AEFD84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v17[0] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v15 = (char *)v17 - v14;
  v17[1] = a3;
  _OWORD v17[2] = a4;
  v17[3] = a5;
  v17[4] = a6;
  v17[5] = a7;
  type metadata accessor for FlatteningPicker();
  (*(void (**)(char *, void, uint64_t))(v13 + 16))(v15, v17[0], AssociatedTypeWitness);
  sub_234B3AFD8();
  sub_234B3AF48();
  return sub_234AED3D8();
}

uint64_t sub_234AEFEE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v29 = a6;
  uint64_t v30 = a7;
  uint64_t v27 = a5;
  uint64_t v28 = a2;
  uint64_t v26 = a1;
  uint64_t v32 = a8;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D82B0);
  swift_getTupleTypeMetadata3();
  sub_234B3B1E8();
  swift_getWitnessTable();
  uint64_t v10 = sub_234B3AE78();
  uint64_t v31 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v25 - v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D2D70);
  uint64_t v13 = sub_234B39828();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v25 - v18;
  uint64_t v33 = a3;
  uint64_t v34 = a4;
  uint64_t v35 = v27;
  uint64_t v36 = v29;
  uint64_t v37 = v30;
  uint64_t v38 = v26;
  uint64_t v39 = v28;
  sub_234A81278();
  sub_234B3AE68();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_234A80EB4();
  sub_234A53330();
  sub_234B3A7F8();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v10);
  uint64_t v21 = sub_2349158F4((unint64_t *)&unk_2687D3790, &qword_2687D2D70);
  uint64_t v40 = WitnessTable;
  uint64_t v41 = v21;
  uint64_t v22 = swift_getWitnessTable();
  sub_2349E676C(v16, v13, v22);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v14 + 8);
  v23(v16, v13);
  sub_2349E676C(v19, v13, v22);
  return ((uint64_t (*)(char *, uint64_t))v23)(v19, v13);
}

uint64_t sub_234AF024C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v36 = a1;
  uint64_t v45 = a8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v39 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v16 = (char *)&v36 - v15;
  uint64_t v46 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v36 - v21;
  uint64_t v54 = a3;
  uint64_t v55 = a4;
  uint64_t v56 = a5;
  uint64_t v57 = a6;
  uint64_t v58 = a7;
  uint64_t v23 = type metadata accessor for FlatteningPicker();
  (*(void (**)(uint64_t))(a1 + *(int *)(v23 + 68)))(v37);
  uint64_t v43 = v22;
  uint64_t v44 = a5;
  sub_2349E676C(v19, a3, a5);
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t))(v46 + 8);
  uint64_t v40 = v19;
  uint64_t v41 = a3;
  uint64_t v42 = v24;
  uint64_t v38 = v46 + 8;
  v24(v19, a3);
  uint64_t v25 = sub_234B3AFD8();
  MEMORY[0x237DCBA80](v25);
  LOBYTE(v23) = sub_234B3B498();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v16, AssociatedTypeWitness);
  uint64_t v26 = 0;
  uint64_t KeyPath = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  if (v23)
  {
    uint64_t v26 = sub_234B3AD08();
    sub_234B3A488();
    sub_234B3A4D8();
    uint64_t v28 = sub_234B3A508();
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v30 = sub_234B3AC08();
    uint64_t v29 = swift_getKeyPath();
  }
  uint64_t v31 = v40;
  uint64_t v32 = v43;
  uint64_t v33 = v41;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v40, v43, v41);
  uint64_t v51 = 0;
  char v52 = 1;
  v53[0] = v31;
  v53[1] = &v51;
  uint64_t v54 = v26;
  uint64_t v55 = KeyPath;
  uint64_t v56 = v28;
  uint64_t v57 = v29;
  uint64_t v58 = v30;
  v53[2] = &v54;
  sub_234A062B0(v26);
  v50[0] = v33;
  v50[1] = MEMORY[0x263F1B6B0];
  v50[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D82B0);
  uint64_t v47 = v44;
  uint64_t v48 = MEMORY[0x263F1B698];
  unint64_t v49 = sub_234AF31A8();
  sub_234A88CF8((uint64_t)v53, 3, (uint64_t)v50);
  sub_234A06320(v26);
  uint64_t v34 = v42;
  v42(v32, v33);
  sub_234A06320(v54);
  return v34(v31, v33);
}

__n128 sub_234AF0670@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  sub_234B3B5E8();
  sub_234B3B5E8();
  if (qword_2687CE508 != -1) {
    swift_once();
  }
  id v4 = (id)qword_2687D07B0;
  uint64_t v5 = (void *)sub_234B3B548();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_234B3B548();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, v6, 0);

  uint64_t v8 = sub_234B3B588();
  unint64_t v10 = v9;

  uint64_t v11 = sub_234AF0844(a1);
  __swift_instantiateConcreteTypeFromMangledName(qword_2687D8210);
  sub_234B3AF78();
  sub_234B3ADA8();
  a2->n128_u64[0] = v11;
  a2->n128_u64[1] = v13;
  __n128 result = v14;
  a2[1] = v14;
  a2[2].n128_u64[0] = v8;
  a2[2].n128_u64[1] = v10;
  a2[3].n128_u64[0] = (unint64_t)sub_234AF0B4C;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u8[0] = v13;
  a2[4].n128_u64[1] = v14.n128_u64[0];
  return result;
}

uint64_t sub_234AF0844(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9B0]), sel_init);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(void *)(a1 + 8 * v4++ + 32);
      uint64_t v24 = v5;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D4FE0);
      objc_msgSend(v2, sel_addObject_, sub_234B3C2C8());
      swift_unknownObjectRelease();
      id v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_allSupportedItemClasses);
      objc_msgSend(v2, sel_unionOrderedSet_, v6);
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
  }
  uint64_t v7 = sub_234AED134(v2);
  uint64_t v8 = *(void *)(v7 + 16);
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (v8)
  {
    unint64_t v10 = (uint64_t *)(v7 + 32);
    do
    {
      uint64_t v11 = *v10;
      id v12 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedTypeDescription);
      uint64_t v13 = sub_234B3B588();
      unint64_t v15 = v14;

      swift_bridgeObjectRelease();
      uint64_t v16 = HIBYTE(v15) & 0xF;
      if ((v15 & 0x2000000000000000) == 0) {
        uint64_t v16 = v13 & 0xFFFFFFFFFFFFLL;
      }
      if (v16)
      {
        uint64_t v24 = v9;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2349528C8(0, *(void *)(v9 + 16) + 1, 1);
          uint64_t v9 = v24;
        }
        unint64_t v18 = *(void *)(v9 + 16);
        unint64_t v17 = *(void *)(v9 + 24);
        if (v18 >= v17 >> 1)
        {
          sub_2349528C8(v17 > 1, v18 + 1, 1);
          uint64_t v9 = v24;
        }
        *(void *)(v9 + 16) = v18 + 1;
        *(void *)(v9 + 8 * v18 + 32) = v11;
      }
      ++v10;
      --v8;
    }
    while (v8);
  }
  swift_bridgeObjectRelease();
  uint64_t v24 = v9;
  swift_retain();
  sub_234AF0C14(&v24);
  swift_release();
  uint64_t v19 = *(void *)(v24 + 16);
  if (v19)
  {
    uint64_t v24 = MEMORY[0x263F8EE78];
    sub_234B3C088();
    uint64_t v20 = 0;
    do
    {
      uint64_t v21 = v20 + 1;
      objc_msgSend(objc_allocWithZone(MEMORY[0x263F869B0]), sel_initWithCoercionItemClass_, swift_getObjCClassFromMetadata());
      sub_234B3C058();
      sub_234B3C098();
      sub_234B3C0A8();
      sub_234B3C068();
      uint64_t v20 = v21;
    }
    while (v19 != v21);
    uint64_t v22 = v24;
    swift_release();
  }
  else
  {
    swift_release();

    return MEMORY[0x263F8EE78];
  }
  return v22;
}

uint64_t sub_234AF0B4C@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  objc_msgSend(*a1, sel_coercionItemClass);
  swift_getObjCClassMetadata();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t result = (uint64_t)objc_msgSend(ObjCClassFromMetadata, sel_respondsToSelector_, sel_localizedTypeDescription);
  if (result)
  {
    id v5 = objc_msgSend(ObjCClassFromMetadata, sel_localizedTypeDescription);
    sub_234B3B588();

    sub_23491B698();
    uint64_t result = sub_234B3A628();
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v6;
    *(unsigned char *)(a2 + 16) = v7 & 1;
    *(void *)(a2 + 24) = v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

double sub_234AF0C08@<D0>(__n128 *a1@<X8>)
{
  *(void *)&double result = sub_234AF0670(*v1, a1).n128_u64[0];
  return result;
}

uint64_t sub_234AF0C14(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_234A563A8();
    uint64_t v2 = v3;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  uint64_t result = sub_234AF0C80(v6);
  *a1 = v2;
  return result;
}

uint64_t sub_234AF0C80(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_234B3C248();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_126;
    }
    if (v3) {
      return sub_234AF1478(0, v3, 1, a1);
    }
    return result;
  }
  uint64_t v5 = result;
  uint64_t result = sub_234A547B4(v3 / 2);
  uint64_t v92 = result;
  uint64_t v97 = v3;
  uint64_t v98 = v6;
  uint64_t v89 = a1;
  if (v3 <= 0) {
    goto LABEL_90;
  }
  uint64_t v91 = v5;
  uint64_t v7 = 0;
  uint64_t v99 = *a1;
  uint64_t v88 = *a1 - 8;
  uint64_t v8 = MEMORY[0x263F8EE78];
  uint64_t v9 = &selRef_systemTimeZone;
  while (1)
  {
    uint64_t v10 = v7;
    uint64_t v11 = v7 + 1;
    if (v7 + 1 < v3)
    {
      id v12 = [(id)swift_getObjCClassFromMetadata() v9[6]];
      sub_234B3B588();

      id v13 = [(id)swift_getObjCClassFromMetadata() (SEL)v9 + 1557];
      sub_234B3B588();

      sub_23491B698();
      uint64_t v94 = sub_234B3BDE8();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v11 = v10 + 2;
      if (v10 + 2 < v3)
      {
        uint64_t v14 = v10;
        while (1)
        {
          id v15 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedTypeDescription);
          sub_234B3B588();

          id v16 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedTypeDescription);
          sub_234B3B588();

          uint64_t v17 = sub_234B3BDE8();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if ((v94 == -1) == (v17 != -1)) {
            break;
          }
          uint64_t v18 = v14 + 3;
          ++v14;
          uint64_t v3 = v97;
          if (v18 >= v97)
          {
            uint64_t v11 = v97;
            goto LABEL_11;
          }
        }
        uint64_t v11 = v14 + 2;
        uint64_t v3 = v97;
      }
LABEL_11:
      uint64_t v9 = &selRef_systemTimeZone;
      if (v94 == -1)
      {
        if (v11 < v10) {
          goto LABEL_129;
        }
        if (v10 < v11)
        {
          uint64_t v19 = (uint64_t *)(v88 + 8 * v11);
          uint64_t v20 = v11;
          uint64_t v21 = v10;
          uint64_t v22 = (uint64_t *)(v99 + 8 * v10);
          do
          {
            if (v21 != --v20)
            {
              if (!v99) {
                goto LABEL_133;
              }
              uint64_t v23 = *v22;
              *uint64_t v22 = *v19;
              *uint64_t v19 = v23;
            }
            ++v21;
            --v19;
            ++v22;
          }
          while (v21 < v20);
        }
      }
    }
    if (v11 < v3)
    {
      if (__OFSUB__(v11, v10)) {
        goto LABEL_125;
      }
      if (v11 - v10 < v91)
      {
        if (__OFADD__(v10, v91)) {
          goto LABEL_127;
        }
        if (v10 + v91 >= v3) {
          uint64_t v24 = v3;
        }
        else {
          uint64_t v24 = v10 + v91;
        }
        if (v24 < v10)
        {
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
          goto LABEL_130;
        }
        if (v11 != v24)
        {
          uint64_t v90 = v8;
          uint64_t v25 = (uint64_t *)(v88 + 8 * v11);
          uint64_t v93 = v10;
          uint64_t v95 = v24;
          do
          {
            uint64_t v26 = v10;
            uint64_t v27 = v25;
            do
            {
              id v28 = [(id)swift_getObjCClassFromMetadata() v9[6]];
              sub_234B3B588();

              id v29 = [(id)swift_getObjCClassFromMetadata() v9[6]];
              sub_234B3B588();

              sub_23491B698();
              uint64_t v30 = sub_234B3BDE8();
              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
              if (v30 != -1) {
                break;
              }
              if (!v99) {
                goto LABEL_131;
              }
              uint64_t v31 = *v27;
              uint64_t result = v27[1];
              *uint64_t v27 = result;
              v27[1] = v31;
              --v27;
              ++v26;
            }
            while (v11 != v26);
            ++v11;
            ++v25;
            uint64_t v10 = v93;
          }
          while (v11 != v95);
          uint64_t v11 = v95;
          uint64_t v8 = v90;
        }
      }
    }
    if (v11 < v10) {
      goto LABEL_124;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_234A55E0C(0, *(void *)(v8 + 16) + 1, 1, (char *)v8);
      uint64_t v8 = result;
    }
    unint64_t v33 = *(void *)(v8 + 16);
    unint64_t v32 = *(void *)(v8 + 24);
    unint64_t v34 = v33 + 1;
    if (v33 >= v32 >> 1)
    {
      uint64_t result = (uint64_t)sub_234A55E0C((char *)(v32 > 1), v33 + 1, 1, (char *)v8);
      uint64_t v8 = result;
    }
    *(void *)(v8 + 16) = v34;
    uint64_t v3 = v8 + 32;
    uint64_t v35 = (uint64_t *)(v8 + 32 + 16 * v33);
    *uint64_t v35 = v10;
    v35[1] = v11;
    uint64_t v96 = v11;
    if (v33) {
      break;
    }
    unint64_t v34 = 1;
LABEL_83:
    uint64_t v7 = v96;
    uint64_t v3 = v97;
    if (v96 >= v97) {
      goto LABEL_91;
    }
  }
  while (1)
  {
    unint64_t v36 = v34 - 1;
    if (v34 >= 4)
    {
      unint64_t v41 = v3 + 16 * v34;
      uint64_t v42 = *(void *)(v41 - 64);
      uint64_t v43 = *(void *)(v41 - 56);
      BOOL v47 = __OFSUB__(v43, v42);
      uint64_t v44 = v43 - v42;
      if (v47) {
        goto LABEL_109;
      }
      uint64_t v46 = *(void *)(v41 - 48);
      uint64_t v45 = *(void *)(v41 - 40);
      BOOL v47 = __OFSUB__(v45, v46);
      uint64_t v39 = v45 - v46;
      char v40 = v47;
      if (v47) {
        goto LABEL_110;
      }
      unint64_t v48 = v34 - 2;
      unint64_t v49 = (uint64_t *)(v3 + 16 * (v34 - 2));
      uint64_t v51 = *v49;
      uint64_t v50 = v49[1];
      BOOL v47 = __OFSUB__(v50, v51);
      uint64_t v52 = v50 - v51;
      if (v47) {
        goto LABEL_111;
      }
      BOOL v47 = __OFADD__(v39, v52);
      uint64_t v53 = v39 + v52;
      if (v47) {
        goto LABEL_113;
      }
      if (v53 >= v44)
      {
        uint64_t v71 = (uint64_t *)(v3 + 16 * v36);
        uint64_t v73 = *v71;
        uint64_t v72 = v71[1];
        BOOL v47 = __OFSUB__(v72, v73);
        uint64_t v74 = v72 - v73;
        if (v47) {
          goto LABEL_119;
        }
        BOOL v64 = v39 < v74;
        goto LABEL_72;
      }
    }
    else
    {
      if (v34 != 3)
      {
        uint64_t v65 = *(void *)(v8 + 32);
        uint64_t v66 = *(void *)(v8 + 40);
        BOOL v47 = __OFSUB__(v66, v65);
        uint64_t v58 = v66 - v65;
        char v59 = v47;
        goto LABEL_66;
      }
      uint64_t v38 = *(void *)(v8 + 32);
      uint64_t v37 = *(void *)(v8 + 40);
      BOOL v47 = __OFSUB__(v37, v38);
      uint64_t v39 = v37 - v38;
      char v40 = v47;
    }
    if (v40) {
      goto LABEL_112;
    }
    unint64_t v48 = v34 - 2;
    uint64_t v54 = (uint64_t *)(v3 + 16 * (v34 - 2));
    uint64_t v56 = *v54;
    uint64_t v55 = v54[1];
    BOOL v57 = __OFSUB__(v55, v56);
    uint64_t v58 = v55 - v56;
    char v59 = v57;
    if (v57) {
      goto LABEL_114;
    }
    uint64_t v60 = (uint64_t *)(v3 + 16 * v36);
    uint64_t v62 = *v60;
    uint64_t v61 = v60[1];
    BOOL v47 = __OFSUB__(v61, v62);
    uint64_t v63 = v61 - v62;
    if (v47) {
      goto LABEL_116;
    }
    if (__OFADD__(v58, v63)) {
      goto LABEL_118;
    }
    if (v58 + v63 >= v39)
    {
      BOOL v64 = v39 < v63;
LABEL_72:
      if (v64) {
        unint64_t v36 = v48;
      }
      goto LABEL_74;
    }
LABEL_66:
    if (v59) {
      goto LABEL_115;
    }
    uint64_t v67 = (uint64_t *)(v3 + 16 * v36);
    uint64_t v69 = *v67;
    uint64_t v68 = v67[1];
    BOOL v47 = __OFSUB__(v68, v69);
    uint64_t v70 = v68 - v69;
    if (v47) {
      goto LABEL_117;
    }
    if (v70 < v58) {
      goto LABEL_83;
    }
LABEL_74:
    unint64_t v75 = v36 - 1;
    if (v36 - 1 >= v34)
    {
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
      goto LABEL_120;
    }
    if (!v99) {
      goto LABEL_132;
    }
    uint64_t v76 = v8;
    uint64_t v77 = (uint64_t *)(v3 + 16 * v75);
    uint64_t v78 = *v77;
    uint64_t v79 = (void *)(v3 + 16 * v36);
    uint64_t v80 = v79[1];
    uint64_t result = sub_234AF15D4((char *)(v99 + 8 * *v77), (char *)(v99 + 8 * *v79), v99 + 8 * v80, v98);
    if (v1) {
      break;
    }
    if (v80 < v78) {
      goto LABEL_106;
    }
    if (v36 > *(void *)(v76 + 16)) {
      goto LABEL_107;
    }
    uint64_t *v77 = v78;
    *(void *)(v3 + 16 * v75 + 8) = v80;
    unint64_t v81 = *(void *)(v76 + 16);
    if (v36 >= v81) {
      goto LABEL_108;
    }
    uint64_t v8 = v76;
    unint64_t v34 = v81 - 1;
    uint64_t result = (uint64_t)memmove((void *)(v3 + 16 * v36), v79 + 2, 16 * (v81 - 1 - v36));
    *(void *)(v76 + 16) = v81 - 1;
    uint64_t v9 = &selRef_systemTimeZone;
    if (v81 <= 2) {
      goto LABEL_83;
    }
  }
LABEL_88:
  uint64_t result = swift_bridgeObjectRelease();
  if (v97 >= -1) {
    goto LABEL_103;
  }
  __break(1u);
LABEL_90:
  uint64_t v8 = MEMORY[0x263F8EE78];
  unint64_t v34 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_91:
  if (v34 >= 2)
  {
    uint64_t v82 = *v89;
    while (1)
    {
      unint64_t v83 = v34 - 2;
      if (v34 < 2) {
        break;
      }
      if (!v82) {
        goto LABEL_134;
      }
      uint64_t v3 = v34 - 1;
      uint64_t v84 = *(void *)(v8 + 32 + 16 * v83);
      uint64_t v85 = *(void *)(v8 + 32 + 16 * (v34 - 1) + 8);
      uint64_t result = sub_234AF15D4((char *)(v82 + 8 * v84), (char *)(v82 + 8 * *(void *)(v8 + 32 + 16 * (v34 - 1))), v82 + 8 * v85, v98);
      if (v1) {
        goto LABEL_88;
      }
      if (v85 < v84) {
        goto LABEL_121;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_234A55F04();
        uint64_t v8 = result;
      }
      if (v83 >= *(void *)(v8 + 16)) {
        goto LABEL_122;
      }
      uint64_t v86 = (void *)(v8 + 32 + 16 * v83);
      void *v86 = v84;
      v86[1] = v85;
      unint64_t v87 = *(void *)(v8 + 16);
      if (v34 > v87) {
        goto LABEL_123;
      }
      uint64_t result = (uint64_t)memmove((void *)(v8 + 32 + 16 * v3), (const void *)(v8 + 32 + 16 * v34), 16 * (v87 - v34));
      *(void *)(v8 + 16) = v87 - 1;
      unint64_t v34 = v87 - 1;
      uint64_t v3 = v97;
      if (v87 <= 2) {
        goto LABEL_102;
      }
    }
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    __break(1u);
LABEL_127:
    __break(1u);
    goto LABEL_128;
  }
LABEL_102:
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 >= -1)
  {
LABEL_103:
    *(void *)(v92 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
LABEL_130:
  __break(1u);
LABEL_131:
  __break(1u);
LABEL_132:
  __break(1u);
LABEL_133:
  __break(1u);
LABEL_134:
  __break(1u);
  return result;
}

uint64_t sub_234AF1478(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v12 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v14 = *a4;
    uint64_t v5 = (uint64_t *)(*a4 + 8 * a3 - 8);
    while (2)
    {
      uint64_t v6 = v12;
      id v13 = v5;
      do
      {
        id v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedTypeDescription);
        sub_234B3B588();

        id v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedTypeDescription);
        sub_234B3B588();

        sub_23491B698();
        uint64_t v9 = sub_234B3BDE8();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v9 != -1) {
          break;
        }
        if (!v14)
        {
          __break(1u);
          return result;
        }
        uint64_t v10 = *v5;
        uint64_t result = v5[1];
        *uint64_t v5 = result;
        v5[1] = v10;
        --v5;
        ++v6;
      }
      while (v4 != v6);
      ++v4;
      uint64_t v5 = v13 + 1;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_234AF15D4(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v6 = a2;
  id v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = a3 - (void)a2;
  uint64_t v10 = (a2 - a1) / 8;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 8;
  if (v10 >= v11)
  {
    sub_2349D33DC(a2, (uint64_t)(a3 - (void)a2) / 8, a4);
    uint64_t v12 = &a4[8 * v11];
    if (v7 >= v6 || v9 < 8)
    {
      uint64_t v14 = a4;
      goto LABEL_41;
    }
    uint64_t v23 = (char *)(a3 - 8);
    while (1)
    {
      unint64_t v34 = v23 + 8;
      unint64_t v35 = (unint64_t)v12;
      uint64_t v24 = v12 - 8;
      uint64_t v25 = v6 - 8;
      id v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedTypeDescription);
      sub_234B3B588();

      id v27 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedTypeDescription);
      sub_234B3B588();

      sub_23491B698();
      uint64_t v28 = sub_234B3BDE8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v28 == -1)
      {
        uint64_t v12 = (char *)v35;
        BOOL v32 = v34 != v6 || v23 >= v6;
        v6 -= 8;
        uint64_t v30 = a4;
        if (!v32) {
          goto LABEL_31;
        }
      }
      else
      {
        BOOL v29 = v34 != (char *)v35 || (unint64_t)v23 >= v35;
        uint64_t v25 = v24;
        uint64_t v12 = v24;
        uint64_t v30 = a4;
        if (!v29) {
          goto LABEL_31;
        }
      }
      *(void *)uint64_t v23 = *(void *)v25;
LABEL_31:
      v23 -= 8;
      if (v6 <= v7 || v12 <= v30)
      {
        uint64_t v14 = a4;
        goto LABEL_41;
      }
    }
  }
  sub_2349D33DC(a1, (a2 - a1) / 8, a4);
  uint64_t v12 = &a4[8 * v10];
  BOOL v13 = (unint64_t)v6 >= a3 || v8 < 8;
  uint64_t v14 = a4;
  if (!v13)
  {
    unint64_t v36 = a3;
    do
    {
      unint64_t v15 = (unint64_t)v12;
      id v16 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedTypeDescription);
      sub_234B3B588();

      id v17 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_localizedTypeDescription);
      sub_234B3B588();

      sub_23491B698();
      uint64_t v18 = sub_234B3BDE8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v18 == -1)
      {
        uint64_t v19 = v6;
        BOOL v20 = v7 == v6;
        v6 += 8;
      }
      else
      {
        uint64_t v19 = v14;
        BOOL v20 = v7 == v14;
        v14 += 8;
      }
      uint64_t v12 = (char *)v15;
      if (!v20) {
        *(void *)id v7 = *(void *)v19;
      }
      v7 += 8;
    }
    while ((unint64_t)v14 < v15 && (unint64_t)v6 < v36);
  }
  uint64_t v6 = v7;
LABEL_41:
  sub_2349D33DC(v14, (v12 - v14) / 8, v6);
  return 1;
}

uint64_t sub_234AF18DC()
{
  uint64_t v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    uint64_t v0 = sub_234B3AFD8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return v0;
}

void *sub_234AF1A04(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = (v10 | 7) + v7;
  uint64_t v12 = ((v10 + 16) & ~v10) + *(void *)(v9 + 64);
  unsigned int v13 = v10 | *(_DWORD *)(v6 + 80) & 0xF8;
  if (v13 > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0
    || ((((((v12 + (v11 & ~(v10 | 7)) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
     + 16 > 0x18)
  {
    uint64_t v16 = *a2;
    *a1 = v16;
    BOOL v32 = (void *)(v16 + (((v13 | 7) + 16) & ~(unint64_t)(v13 | 7)));
  }
  else
  {
    uint64_t v17 = ~(v10 | 7);
    uint64_t v34 = AssociatedTypeWitness;
    (*(void (**)(void *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    unint64_t v35 = a1;
    unint64_t v18 = ((unint64_t)a1 + v11) & v17;
    unint64_t v19 = ((unint64_t)a2 + v11) & v17;
    *(void *)unint64_t v18 = *(void *)v19;
    BOOL v20 = (void *)((v18 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v21 = (void *)((v19 + 15) & 0xFFFFFFFFFFFFFFF8);
    *BOOL v20 = *v21;
    uint64_t v22 = ((unint64_t)v20 + v10 + 8) & ~v10;
    uint64_t v23 = ((unint64_t)v21 + v10 + 8) & ~v10;
    uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    swift_retain();
    swift_retain();
    v24(v22, v23, v34);
    uint64_t v25 = (void *)(((v18 | 7) + v12) & 0xFFFFFFFFFFFFFFF8);
    id v26 = (void *)(((v19 | 7) + v12) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v25 = *v26;
    v25[1] = v26[1];
    id v27 = (void *)(((unint64_t)v25 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v28 = (void *)(((unint64_t)v26 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v29 = v28[1];
    *id v27 = *v28;
    v27[1] = v29;
    unint64_t v30 = ((unint64_t)v27 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v31 = ((unint64_t)v28 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v30 = *(unsigned char *)v31;
    *(void *)(v30 + 8) = *(void *)(v31 + 8);
    swift_bridgeObjectRetain();
    BOOL v32 = v35;
    swift_retain();
  }
  swift_retain();
  return v32;
}

uint64_t sub_234AF1C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 24) - 8) + 8;
  (*(void (**)(uint64_t, void))v3)(a1, *(void *)(a2 + 24));
  uint64_t v4 = *(void *)(v3 + 56) + a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))((v7 + ((((v4 + (v7 | 7)) & ~(v7 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v7, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_234AF1DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 24));
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v10 = v8 + 16;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = (v11 | 7) + v6;
  uint64_t v14 = (void *)((v12 + a2) & ~(v11 | 7));
  unsigned int v13 = (void *)((v12 + a1) & ~(v11 | 7));
  *unsigned int v13 = *v14;
  unint64_t v15 = (void *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v15 = *v16;
  uint64_t v17 = ((unint64_t)v15 + v11 + 8) & ~v11;
  uint64_t v18 = ((unint64_t)v16 + v11 + 8) & ~v11;
  swift_retain();
  swift_retain();
  v9(v17, v18, AssociatedTypeWitness);
  uint64_t v19 = *(void *)(v10 + 48) + ((v11 + 16) & ~v11) + 7;
  BOOL v20 = (void *)(((unint64_t)v13 + v19) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = (void *)(((unint64_t)v14 + v19) & 0xFFFFFFFFFFFFFFF8);
  *BOOL v20 = *v21;
  v20[1] = v21[1];
  uint64_t v22 = (void *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = (void *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  unint64_t v25 = ((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = ((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v25 = *(unsigned char *)v26;
  *(void *)(v25 + 8) = *(void *)(v26 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_234AF1FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 24));
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + v6;
  uint64_t v11 = (void *)((v10 + a1) & ~(v9 | 7));
  uint64_t v12 = (void *)((v10 + a2) & ~(v9 | 7));
  *uint64_t v11 = *v12;
  swift_retain();
  swift_release();
  unsigned int v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unsigned int v13 = *v14;
  swift_retain();
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, AssociatedTypeWitness);
  uint64_t v15 = *(void *)(v8 + 64) + ((v9 + 16) & ~v9) + 7;
  uint64_t v16 = (void *)(((unint64_t)v11 + v15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (void *)(((unint64_t)v12 + v15) & 0xFFFFFFFFFFFFFFF8);
  void *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = (void *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (void *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v20 = v19[1];
  void *v18 = *v19;
  v18[1] = v20;
  swift_retain();
  swift_release();
  unint64_t v21 = ((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = ((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v21 = *(unsigned char *)v22;
  *(void *)(v21 + 8) = *(void *)(v22 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_234AF21B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 24));
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32);
  uint64_t v10 = v8 + 32;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = (v11 | 7) + v6;
  unsigned int v13 = (void *)((v12 + a1) & ~(v11 | 7));
  uint64_t v14 = (void *)((v12 + a2) & ~(v11 | 7));
  *unsigned int v13 = *v14;
  uint64_t v15 = (void *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  v9(((unint64_t)v15 + v11 + 8) & ~v11, ((unint64_t)v16 + v11 + 8) & ~v11, AssociatedTypeWitness);
  uint64_t v17 = *(void *)(v10 + 32) + ((v11 + 16) & ~v11) + 7;
  uint64_t v18 = (_OWORD *)(((unint64_t)v13 + v17) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (_OWORD *)(((unint64_t)v14 + v17) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v18 = *v19;
  uint64_t v20 = (_OWORD *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v21 = (_OWORD *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v20 = *v21;
  *(_OWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_234AF231C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 24));
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + v6;
  uint64_t v11 = (void *)((v10 + a1) & ~(v9 | 7));
  uint64_t v12 = (void *)((v10 + a2) & ~(v9 | 7));
  *uint64_t v11 = *v12;
  swift_release();
  unsigned int v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unsigned int v13 = *v14;
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, AssociatedTypeWitness);
  uint64_t v15 = *(void *)(v8 + 64) + ((v9 + 16) & ~v9) + 7;
  uint64_t v16 = (void *)(((unint64_t)v11 + v15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (void *)(((unint64_t)v12 + v15) & 0xFFFFFFFFFFFFFFF8);
  void *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRelease();
  uint64_t v18 = (_OWORD *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v19 = ((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8;
  long long v20 = *(_OWORD *)v19;
  v19 += 23;
  _OWORD *v18 = v20;
  swift_release();
  unint64_t v21 = ((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v21 = *(unsigned char *)(v19 & 0xFFFFFFFFFFFFFFF8);
  *(void *)(v21 + 8) = *(void *)((v19 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_release();
  return a1;
}

uint64_t sub_234AF24E4(int *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= 0x7FFFFFFF) {
    unsigned int v11 = 0x7FFFFFFF;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  if (v11 <= v7) {
    unsigned int v12 = v7;
  }
  else {
    unsigned int v12 = v11;
  }
  uint64_t v13 = *(unsigned __int8 *)(v9 + 80);
  if (!a2) {
    return 0;
  }
  uint64_t v14 = AssociatedTypeWitness;
  uint64_t v15 = v13 | 7;
  uint64_t v16 = (v13 | 7) + *(void *)(v6 + 64);
  if (v12 < a2)
  {
    unint64_t v17 = ((((((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + ((v13 + 16) & ~v13) + (v16 & ~v15) + 7) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)
          + 23) & 0xFFFFFFFFFFFFFFF8)
        + 16;
    uint64_t v18 = v17 & 0xFFFFFFF8;
    if ((v17 & 0xFFFFFFF8) != 0) {
      unsigned int v19 = 2;
    }
    else {
      unsigned int v19 = a2 - v12 + 1;
    }
    if (v19 >= 0x10000) {
      LODWORD(v20) = 4;
    }
    else {
      LODWORD(v20) = 2;
    }
    if (v19 < 0x100) {
      LODWORD(v20) = 1;
    }
    if (v19 >= 2) {
      uint64_t v20 = v20;
    }
    else {
      uint64_t v20 = 0;
    }
    switch(v20)
    {
      case 1:
        int v21 = *((unsigned __int8 *)a1 + v17);
        if (!v21) {
          break;
        }
        goto LABEL_25;
      case 2:
        int v21 = *(unsigned __int16 *)((char *)a1 + v17);
        if (v21) {
          goto LABEL_25;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x234AF274CLL);
      case 4:
        int v21 = *(int *)((char *)a1 + v17);
        if (!v21) {
          break;
        }
LABEL_25:
        int v23 = v21 - 1;
        if (v18)
        {
          int v23 = 0;
          int v24 = *a1;
        }
        else
        {
          int v24 = 0;
        }
        return v12 + (v24 | v23) + 1;
      default:
        break;
    }
  }
  if (v7 >= v11)
  {
    uint64_t v27 = (uint64_t)a1;
    uint64_t v10 = v7;
    uint64_t v14 = v5;
  }
  else
  {
    unint64_t v25 = (unint64_t *)(((((unint64_t)a1 + v16) & ~v15) + 15) & 0xFFFFFFFFFFFFFFF8);
    if ((v10 & 0x80000000) == 0)
    {
      unint64_t v26 = *v25;
      if (v26 >= 0xFFFFFFFF) {
        LODWORD(v26) = -1;
      }
      return (v26 + 1);
    }
    uint64_t v27 = ((unint64_t)v25 + v13 + 8) & ~v13;
  }
  return __swift_getEnumTagSinglePayload(v27, v10, v14);
}

void sub_234AF2760(_DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  if (v12 <= 0x7FFFFFFF) {
    unsigned int v13 = 0x7FFFFFFF;
  }
  else {
    unsigned int v13 = *(_DWORD *)(v11 + 84);
  }
  if (v13 <= v9) {
    unsigned int v14 = v9;
  }
  else {
    unsigned int v14 = v13;
  }
  uint64_t v15 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v16 = (v15 | 7) + *(void *)(v8 + 64);
  size_t v17 = ((v15 + 16) & ~v15) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  unint64_t v18 = ((((((v17 + (v16 & ~(v15 | 7)) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v14 >= a3)
  {
    int v21 = 0;
  }
  else
  {
    if (((((((v17 + (v16 & ~(v15 | 7)) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v19 = a3 - v14 + 1;
    }
    else {
      unsigned int v19 = 2;
    }
    if (v19 >= 0x10000) {
      int v20 = 4;
    }
    else {
      int v20 = 2;
    }
    if (v19 < 0x100) {
      int v20 = 1;
    }
    if (v19 >= 2) {
      int v21 = v20;
    }
    else {
      int v21 = 0;
    }
  }
  if (a2 > v14)
  {
    if (((((((v17 + (v16 & ~(v15 | 7)) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v22 = a2 - v14;
    }
    else {
      int v22 = 1;
    }
    if (((((((v17 + (v16 & ~(v15 | 7)) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v23 = ~v14 + a2;
      bzero(a1, ((((((v17 + (v16 & ~(v15 | 7)) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)+ 16);
      *a1 = v23;
    }
    switch(v21)
    {
      case 1:
        *((unsigned char *)a1 + v18) = v22;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v18) = v22;
        return;
      case 3:
        goto LABEL_62;
      case 4:
        *(_DWORD *)((char *)a1 + v18) = v22;
        return;
      default:
        return;
    }
  }
  switch(v21)
  {
    case 1:
      *((unsigned char *)a1 + v18) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)((char *)a1 + v18) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_62:
      __break(1u);
      JUMPOUT(0x234AF2AACLL);
    case 4:
      *(_DWORD *)((char *)a1 + v18) = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (!a2) {
        return;
      }
LABEL_35:
      if (v9 >= v13)
      {
        uint64_t v28 = (uint64_t)a1;
        uint64_t v29 = a2;
        uint64_t v12 = v9;
        uint64_t AssociatedTypeWitness = v7;
      }
      else
      {
        int v24 = (unsigned char *)(((unint64_t)a1 + v16) & ~(v15 | 7));
        if (v13 < a2)
        {
          if (v17 <= 3) {
            int v25 = ~(-1 << (8 * v17));
          }
          else {
            int v25 = -1;
          }
          if (v17)
          {
            int v26 = v25 & (~v13 + a2);
            if (v17 <= 3) {
              int v27 = v17;
            }
            else {
              int v27 = 4;
            }
            bzero(v24, v17);
            switch(v27)
            {
              case 2:
                *(_WORD *)int v24 = v26;
                break;
              case 3:
                *(_WORD *)int v24 = v26;
                v24[2] = BYTE2(v26);
                break;
              case 4:
                *(_DWORD *)int v24 = v26;
                break;
              default:
                *int v24 = v26;
                break;
            }
          }
          return;
        }
        unint64_t v30 = (void *)((unint64_t)(v24 + 15) & 0xFFFFFFFFFFFFFFF8);
        if ((v12 & 0x80000000) == 0)
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v31 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v31 = (a2 - 1);
          }
          *unint64_t v30 = v31;
          return;
        }
        uint64_t v28 = ((unint64_t)v30 + v15 + 8) & ~v15;
        uint64_t v29 = a2;
      }
      __swift_storeEnumTagSinglePayload(v28, v29, v12, AssociatedTypeWitness);
      return;
  }
}

uint64_t type metadata accessor for FlatteningPicker()
{
  return swift_getGenericMetadata();
}

uint64_t sub_234AF2AFC()
{
  return sub_2349158F4(&qword_2687D8298, &qword_2687D82A0);
}

uint64_t sub_234AF2B38()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_234AF2B84(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_234AF2BCC()
{
  return sub_234AF326C((uint64_t (*)(void, void, void, void, void, void))sub_234AED998);
}

uint64_t sub_234AF2BE8()
{
  uint64_t v0 = OUTLINED_FUNCTION_2_31();
  OUTLINED_FUNCTION_1_0(v0);
  return sub_234AEE964();
}

uint64_t sub_234AF2C58()
{
  return sub_234AF326C((uint64_t (*)(void, void, void, void, void, void))sub_234AEEA98);
}

uint64_t objectdestroyTm_20()
{
  type metadata accessor for FlatteningPicker();
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_4_25();
  OUTLINED_FUNCTION_5_29();
  v0();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_3_31();
  swift_getAssociatedTypeWitness();
  sub_234B3AFD8();
  OUTLINED_FUNCTION_4_25();
  OUTLINED_FUNCTION_5_29();
  v1();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_234AF2DE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v9 = v2[6];
  uint64_t v10 = type metadata accessor for FlatteningPicker();
  OUTLINED_FUNCTION_1_0(v10);
  uint64_t v12 = (uint64_t)v2 + ((*(unsigned __int8 *)(v11 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  return sub_234AEF544(a1, v12, v5, v6, v7, v8, v9, a2);
}

uint64_t sub_234AF2E8C()
{
  type metadata accessor for FlatteningPicker();
  OUTLINED_FUNCTION_1_10();
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v5 = v3 + *(void *)(v4 + 64);
  OUTLINED_FUNCTION_3_31();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v8 = (v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  OUTLINED_FUNCTION_4_25();
  OUTLINED_FUNCTION_5_29();
  v9();
  unint64_t v10 = v1 + v3 + *(int *)(v0 + 68);
  swift_release();
  swift_release();
  unint64_t v11 = v10 + *(int *)(sub_234B3AFD8() + 32);
  uint64_t v12 = *(void (**)(unint64_t, uint64_t))(v7 + 8);
  v12(v11, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v12(v1 + v8, AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t sub_234AF3068()
{
  OUTLINED_FUNCTION_2_31();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_1_0(AssociatedTypeWitness);
  return sub_234AEFD0C();
}

uint64_t sub_234AF315C()
{
  return sub_234AF318C((uint64_t (*)(void, void, void, void, void, void, void))sub_234AEFEE8);
}

uint64_t sub_234AF3174()
{
  return sub_234AF318C((uint64_t (*)(void, void, void, void, void, void, void))sub_234AF024C);
}

uint64_t sub_234AF318C(uint64_t (*a1)(void, void, void, void, void, void, void))
{
  return a1(v1[7], v1[8], v1[2], v1[3], v1[4], v1[5], v1[6]);
}

unint64_t sub_234AF31A8()
{
  unint64_t result = qword_2687D82B8;
  if (!qword_2687D82B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D82B0);
    sub_2349FCE24();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D82B8);
  }
  return result;
}

uint64_t sub_234AF322C()
{
  return sub_234AEFD84(v0[7], v0[8], v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_234AF3254()
{
  return sub_234AF326C((uint64_t (*)(void, void, void, void, void, void))sub_234AEEE1C);
}

uint64_t sub_234AF326C(uint64_t (*a1)(void, void, void, void, void, void))
{
  return a1(v1[7], v1[2], v1[3], v1[4], v1[5], v1[6]);
}

unint64_t sub_234AF3284()
{
  unint64_t result = qword_2687D82C0;
  if (!qword_2687D82C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D82A8);
    sub_2349FCE24();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D82C0);
  }
  return result;
}

uint64_t sub_234AF3300()
{
  return sub_234AEE9D8();
}

uint64_t sub_234AF3324()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_2_31()
{
  return type metadata accessor for FlatteningPicker();
}

uint64_t OUTLINED_FUNCTION_7_26()
{
  return 255;
}

uint64_t sub_234AF3748()
{
  uint64_t result = sub_234B38608();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_234AF37E0()
{
  return swift_release();
}

uint64_t sub_234AF38D0(uint64_t a1)
{
  uint64_t v3 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x50);
  OUTLINED_FUNCTION_3();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (char *)v10 - v7;
  *(void *)&long long v11 = sub_234AF3BE0();
  sub_234B3B7F8();
  swift_getWitnessTable();
  sub_234B3B948();
  swift_bridgeObjectRelease();
  long long v11 = v12;
  v10[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D6320);
  uint64_t result = sub_234B3B9E8();
  if (result)
  {
    *(void *)&long long v12 = sub_234AF3BE0();
    sub_234B3B7D8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    return sub_234AF3C68();
  }
  return result;
}

uint64_t sub_234AF3A44(uint64_t a1)
{
  uint64_t v2 = sub_234B385A8();
  OUTLINED_FUNCTION_3();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D2990);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_234B6B860;
  *(void *)(v8 + 32) = a1;
  uint64_t v11 = v8;
  sub_234AF4040();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D3F90);
  sub_234AF4090();
  sub_234B3BE78();
  uint64_t v11 = sub_234AF3BE0();
  sub_234B3B7F8();
  swift_getWitnessTable();
  sub_234B3B488();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  return sub_234AF3C68();
}

uint64_t sub_234AF3BE0()
{
  sub_234B3B7F8();
  uint64_t v0 = sub_234B3AFD8();
  MEMORY[0x237DCBA80](&v2, v0);
  return v2;
}

uint64_t sub_234AF3C68()
{
  return sub_234AF3DF0();
}

uint64_t sub_234AF3CFC()
{
  sub_234B3B7F8();
  sub_234B3AFD8();
  sub_234B3AF78();
  return v1;
}

uint64_t sub_234AF3D88()
{
  sub_234AF3BE0();
  uint64_t v0 = MEMORY[0x237DCC2F0]();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_234AF3DF0()
{
  type metadata accessor for ListParameterOutlineContent();
  swift_getWitnessTable();
  sub_234B391E8();
  sub_234B39228();
  return swift_release();
}

void sub_234AF3E98()
{
}

void sub_234AF3EC8()
{
}

id sub_234AF3ED8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ListParameterOutlineContent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_234AF3F4C(uint64_t a1)
{
  uint64_t v1 = a1 + qword_2687E7EF0;
  uint64_t v2 = sub_234B38608();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t type metadata accessor for ListParameterOutlineContent()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_234AF3FFC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ListParameterOutlineContent();
  uint64_t result = sub_234B391E8();
  *a1 = result;
  return result;
}

unint64_t sub_234AF4040()
{
  unint64_t result = qword_2687D2328[0];
  if (!qword_2687D2328[0])
  {
    sub_234B385A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2687D2328);
  }
  return result;
}

unint64_t sub_234AF4090()
{
  unint64_t result = qword_2687D3F98;
  if (!qword_2687D3F98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D3F90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D3F98);
  }
  return result;
}

uint64_t sub_234AF40E4(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_26(a1);
}

uint64_t sub_234AF40F0(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_26(a1);
}

id ParameterHostingView.__allocating_init(frame:)()
{
  OUTLINED_FUNCTION_4_26();
  id v1 = objc_allocWithZone(v0);
  double v4 = OUTLINED_FUNCTION_3_32();
  return objc_msgSend(v2, v3, v4);
}

char *ParameterHostingView.init(frame:)()
{
  OUTLINED_FUNCTION_4_26();
  *(void *)&v0[OBJC_IVAR___WFParameterHostingView_initialState] = 0;
  *(void *)&v0[OBJC_IVAR___WFParameterHostingView_updatedState] = 0;
  id v1 = v0;
  sub_234B3AF28();
  id v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2687D8360));
  *(void *)&v1[OBJC_IVAR___WFParameterHostingView_hostingController] = sub_234B38EE8();

  type metadata accessor for ParameterHostingView();
  double v3 = OUTLINED_FUNCTION_3_32();
  uint64_t v6 = (char *)objc_msgSendSuper2(v4, v5, v3);
  uint64_t v7 = *(void **)&v6[OBJC_IVAR___WFParameterHostingView_hostingController];
  uint64_t v8 = v6;
  id v9 = objc_msgSend(v7, sel_view);
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v10, sel_setBackgroundColor_, v11);

    objc_msgSend(v8, sel_addSubview_, v10);
  }

  return v8;
}

uint64_t type metadata accessor for ParameterHostingView()
{
  return self;
}

void sub_234AF42DC()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for ParameterHostingView();
  objc_msgSendSuper2(&v4, sel_layoutSubviews);
  id v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR___WFParameterHostingView_hostingController], sel_view);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v0, sel_bounds);
    CGRectGetWidth(v5);
    CGSizeMake(v3);
    sub_234B39E58();
    objc_msgSend(v2, sel_frame);
    objc_msgSend(v2, sel_setFrame_);
  }
  else
  {
    __break(1u);
  }
}

void sub_234AF43FC()
{
  *(void *)&v0[OBJC_IVAR___WFParameterHostingView_initialState] = 0;
  *(void *)&v0[OBJC_IVAR___WFParameterHostingView_updatedState] = 0;

  sub_234B3C158();
  __break(1u);
}

uint64_t sub_234AF4490()
{
  return sub_234B39E58();
}

uint64_t sub_234AF4510(void *a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  sub_234AF4930(a1, a2, a3, a4, a5, (uint64_t)v8, 1, a6, a7);
  return sub_234915B14((uint64_t)v8, &qword_2687CFE20);
}

uint64_t sub_234AF4650(void *a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v16 = a9;
  sub_23491B7A8(a7, (uint64_t)&v25, (uint64_t *)&unk_2687CF600);
  if (v26)
  {
    sub_234964030(&v25, v24);
    int v26 = &unk_26E79E6D0;
    int v27 = &off_26E79E770;
    uint64_t v17 = a2;
    uint64_t v18 = a5;
    uint64_t v19 = swift_allocObject();
    *(void *)&long long v25 = v19;
    sub_234964030(v24, (_OWORD *)(v19 + 24));
    *(void *)(v19 + 16) = a6;
    int v20 = a8;
    *(void *)(v19 + 56) = a8;
    a5 = v18;
    a2 = v17;
    uint64_t v16 = a9;
  }
  else
  {
    sub_234915B14((uint64_t)&v25, (uint64_t *)&unk_2687CF600);
    int v26 = &unk_26E79E758;
    int v27 = &off_26E79E788;
    *(void *)&long long v25 = a6;
    int v20 = a8;
    *((void *)&v25 + 1) = a8;
  }
  sub_2349B6EBC((uint64_t)&v25, (uint64_t)v24);
  id v21 = v20;
  sub_234AF4930(a1, a2, a3 & 1, a4 & 1, a5, (uint64_t)v24, 0, v16, a10);
  sub_234915B14((uint64_t)v24, &qword_2687CFE20);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
}

uint64_t sub_234AF4930(void *a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9)
{
  *(void *)&long long v71 = a8;
  int v90 = a7;
  uint64_t v91 = a6;
  v70[1] = a5;
  int v78 = a3;
  int v79 = a4;
  id v73 = a1;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D1090);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_44();
  uint64_t v86 = v11;
  uint64_t v12 = type metadata accessor for ParameterRowView();
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D8378) - 8;
  MEMORY[0x270FA5388](v76);
  OUTLINED_FUNCTION_44();
  uint64_t v74 = v16;
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D8380) - 8;
  MEMORY[0x270FA5388](v77);
  OUTLINED_FUNCTION_44();
  uint64_t v75 = v17;
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D8388) - 8;
  MEMORY[0x270FA5388](v82);
  OUTLINED_FUNCTION_44();
  uint64_t v80 = v18;
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D8390) - 8;
  MEMORY[0x270FA5388](v84);
  OUTLINED_FUNCTION_44();
  uint64_t v81 = v19;
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D8398) - 8;
  MEMORY[0x270FA5388](v87);
  OUTLINED_FUNCTION_44();
  uint64_t v85 = v20;
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D83A0);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v21);
  uint64_t v88 = (uint64_t)v70 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v83 = (uint64_t)v70 - v24;
  uint64_t v25 = swift_unknownObjectRetain();
  sub_234AF40E4(v25);
  sub_234AF40F0(0);
  uint64_t v26 = swift_allocObject();
  uint64_t v72 = v9;
  swift_unknownObjectWeakInit();
  sub_234B3B878();
  swift_retain();
  uint64_t v27 = sub_234B3B868();
  uint64_t v28 = (void *)swift_allocObject();
  uint64_t v29 = MEMORY[0x263F8F500];
  uint64_t v28[2] = v27;
  v28[3] = v29;
  v28[4] = v26;
  swift_release();
  uint64_t v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  swift_retain();
  uint64_t v31 = sub_234B3B868();
  BOOL v32 = (void *)swift_allocObject();
  _OWORD v32[2] = v31;
  v32[3] = v29;
  uint64_t v33 = v71;
  v32[4] = v30;
  v32[5] = v33;
  v32[6] = a9;
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D1BD0);
  sub_234B3AF98();
  long long v71 = v92;
  uint64_t v34 = v93;
  type metadata accessor for BindingParameterStateDataSource();
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = v71;
  *(void *)(v35 + 32) = v34;
  type metadata accessor for ParameterStateStore();
  swift_allocObject();
  unint64_t v36 = sub_234A97D20(v35);
  LODWORD(v71) = *(void *)(v91 + 24) == 0;
  id v37 = objc_allocWithZone((Class)type metadata accessor for WorkflowEditorOptions(0));
  swift_unknownObjectRetain();
  id v38 = v73;
  swift_retain();
  id v39 = objc_msgSend(v37, sel_init);
  swift_unknownObjectWeakInit();
  v15[56] = sub_234B39398() & 1;
  *((void *)v15 + 8) = v40;
  v15[72] = v41 & 1;
  uint64_t v42 = (uint64_t *)&v15[*(int *)(v13 + 60)];
  *uint64_t v42 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687D1740);
  swift_storeEnumTagMultiPayload();
  uint64_t v43 = &v15[*(int *)(v13 + 64)];
  *(void *)uint64_t v43 = swift_getKeyPath();
  v43[8] = 0;
  *(void *)uint64_t v15 = v38;
  *((void *)v15 + 1) = v36;
  v15[16] = v78;
  v15[17] = v79;
  *((void *)v15 + 3) = 0;
  *((_WORD *)v15 + 16) = 1;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  *((void *)v15 + 6) = v39;
  id v44 = [v38 key];
  uint64_t v45 = sub_234B3B588();
  uint64_t v47 = v46;

  uint64_t v48 = v74;
  sub_234A78050((uint64_t)v15, v74);
  unint64_t v49 = (uint64_t *)(v48 + *(int *)(v76 + 60));
  *unint64_t v49 = v45;
  v49[1] = v47;
  sub_234A780B4((uint64_t)v15);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v51 = sub_234B39878();
  uint64_t v52 = v86;
  __swift_storeEnumTagSinglePayload(v86, 1, 1, v51);
  uint64_t v53 = v75;
  uint64_t v54 = (uint64_t *)(v75 + *(int *)(v77 + 44));
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D2618);
  sub_23491B7A8(v52, (uint64_t)v54 + *(int *)(v55 + 28), (uint64_t *)&unk_2687D1090);
  *uint64_t v54 = KeyPath;
  sub_23491B7A8(v48, v53, &qword_2687D8378);
  sub_234915B14(v52, (uint64_t *)&unk_2687D1090);
  sub_234915B14(v48, &qword_2687D8378);
  uint64_t v56 = swift_getKeyPath();
  uint64_t v57 = v80;
  uint64_t v58 = (uint64_t *)(v80 + *(int *)(v82 + 44));
  sub_23491B7A8(v91, (uint64_t)(v58 + 1), &qword_2687CFE20);
  *uint64_t v58 = v56;
  sub_234AF57F4(v53, v57);
  uint64_t v59 = swift_getKeyPath();
  uint64_t v60 = v81;
  sub_23491B7A8(v57, v81, &qword_2687D8388);
  uint64_t v61 = v60 + *(int *)(v84 + 44);
  *(void *)uint64_t v61 = v59;
  *(unsigned char *)(v61 + 8) = v71;
  sub_234915B14(v57, &qword_2687D8388);
  uint64_t v62 = swift_getKeyPath();
  id v63 = (id)WFUserInterfaceFromViewController();
  uint64_t v64 = v85;
  sub_23491B7A8(v60, v85, &qword_2687D8390);
  uint64_t v65 = (uint64_t *)(v64 + *(int *)(v87 + 44));
  *uint64_t v65 = v62;
  v65[1] = (uint64_t)v63;
  sub_234915B14(v60, &qword_2687D8390);
  uint64_t v66 = swift_getKeyPath();
  uint64_t v67 = v83;
  sub_23491B7A8(v64, v83, &qword_2687D8398);
  uint64_t v68 = v67 + *(int *)(v89 + 36);
  *(void *)uint64_t v68 = v66;
  *(unsigned char *)(v68 + 8) = v90;
  sub_234915B14(v64, &qword_2687D8398);
  sub_23491B7A8(v67, v88, (uint64_t *)&unk_2687D83A0);
  sub_234AF586C();
  *(void *)&long long v92 = sub_234B3AF28();
  sub_234B39E98();
  swift_release();
  return sub_234915B14(v67, (uint64_t *)&unk_2687D83A0);
}

uint64_t sub_234AF513C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  return swift_deallocObject();
}

void sub_234AF517C(uint64_t a1@<X2>, void *a2@<X8>)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x237DCE350](v3);
  if (!v4
    || (CGRect v5 = (void *)v4,
        uint64_t v6 = *(void *)(v4 + OBJC_IVAR___WFParameterHostingView_updatedState),
        swift_unknownObjectRetain(),
        v5,
        !v6))
  {
    swift_beginAccess();
    uint64_t v7 = MEMORY[0x237DCE350](v3);
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v6 = *(void *)(v7 + OBJC_IVAR___WFParameterHostingView_initialState);
      swift_unknownObjectRetain();
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  *a2 = v6;
}

uint64_t sub_234AF5238(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, void))
{
  uint64_t v6 = *a1;
  uint64_t v7 = a4 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x237DCE350](v7);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = swift_unknownObjectRetain();
    sub_234AF40F0(v10);
  }
  return a5(v6, 0);
}

void sub_234AF532C()
{
}

void sub_234AF537C(void *a1)
{
  if (a1)
  {
    id v2 = *(void **)(v1 + OBJC_IVAR___WFParameterHostingView_hostingController);
    id v10 = a1;
    id v3 = objc_msgSend(v2, sel_parentViewController);
    if (!v3) {
      goto LABEL_5;
    }
    uint64_t v4 = v3;
    sub_234AF56C0();
    id v9 = v10;
    id v5 = v4;
    LOBYTE(v4) = sub_234B3BCC8();

    if (v4)
    {
      uint64_t v6 = v9;
    }
    else
    {
LABEL_5:
      objc_msgSend(v10, sel_addChildViewController_, v2);
      objc_msgSend(v2, sel_didMoveToParentViewController_, v10);
      uint64_t v6 = v10;
    }
  }
  else
  {
    uint64_t v7 = *(void **)(v1 + OBJC_IVAR___WFParameterHostingView_hostingController);
    id v8 = objc_msgSend(v7, sel_parentViewController);

    if (v8)
    {
      objc_msgSend(v7, sel_willMoveToParentViewController_, 0);
      sub_234B3AF28();
      sub_234B39E98();
      objc_msgSend(v7, sel_removeFromParentViewController);
    }
  }
}

id ParameterHostingView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ParameterHostingView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ParameterHostingView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ParameterHostingView);
}

uint64_t dispatch thunk of ParameterHostingView.configureViewForRuntimeUI(parameter:state:processing:shouldFocus:variableProvider:updateBlock:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ParameterHostingView.configureConfigurationUIView(parameter:state:processing:shouldFocus:variableProvider:widgetFamily:fillProvider:overridingCellBackgroundColor:updateBlock:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ParameterHostingView.attachToParentViewController(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ParameterHostingView.detachFromParentViewController()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t sub_234AF566C()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_234AF56A4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unint64_t sub_234AF56C0()
{
  unint64_t result = qword_2687D7EB8;
  if (!qword_2687D7EB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2687D7EB8);
  }
  return result;
}

uint64_t sub_234AF5700()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_234AF5738()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_234AF5778(void *a1@<X8>)
{
  sub_234AF517C(*(void *)(v1 + 32), a1);
}

uint64_t sub_234AF5784()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_234AF57CC(uint64_t *a1)
{
  return sub_234AF5238(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(uint64_t (**)(uint64_t, void))(v1 + 40));
}

uint64_t sub_234AF57F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687D8380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_234AF586C()
{
  unint64_t result = qword_2687D83B0;
  if (!qword_2687D83B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2687D83A0);
    sub_234AF590C();
    sub_2349158F4(&qword_2687CFDF0, (uint64_t *)&unk_2687D8400);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D83B0);
  }
  return result;
}

unint64_t sub_234AF590C()
{
  unint64_t result = qword_2687D83B8;
  if (!qword_2687D83B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D8398);
    sub_234AF59AC();
    sub_2349158F4(&qword_2687D44E8, &qword_2687D44F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D83B8);
  }
  return result;
}

unint64_t sub_234AF59AC()
{
  unint64_t result = qword_2687D83C0;
  if (!qword_2687D83C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D8390);
    sub_234AF5A4C();
    sub_2349158F4((unint64_t *)&unk_2687CFDE0, &qword_2687D1580);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D83C0);
  }
  return result;
}

unint64_t sub_234AF5A4C()
{
  unint64_t result = qword_2687D83C8;
  if (!qword_2687D83C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D8388);
    sub_234AF5AEC();
    sub_2349158F4(&qword_2687D83E8, (uint64_t *)&unk_2687D83F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D83C8);
  }
  return result;
}

unint64_t sub_234AF5AEC()
{
  unint64_t result = qword_2687D83D0;
  if (!qword_2687D83D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687D8380);
    sub_2349158F4((unint64_t *)&unk_2687D83D8, &qword_2687D8378);
    sub_2349158F4(&qword_2687D2610, &qword_2687D2618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687D83D0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_26(uint64_t a1)
{
  *(void *)(v2 + v1) = a1;
  return swift_unknownObjectRelease();
}

double OUTLINED_FUNCTION_3_32()
{
  return v0;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_2687E7BD0 == -1)
  {
    if (qword_2687E7BD8) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_2687E7BD0, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_2687E7BD8) {
      return _availability_version_check();
    }
  }
  if (qword_2687E7BC8 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_2687E7BC8, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_2687E7BBC > a3) {
    return 1;
  }
  return dword_2687E7BBC >= a3 && dword_2687E7BC0 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = qword_2687E7BD8;
  if (qword_2687E7BD8) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x263EF8368])
    {
      uint64_t v1 = MEMORY[0x270FA5398];
      qword_2687E7BD8 = MEMORY[0x270FA5398];
    }
    if (!v1 || result != 0)
    {
      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        uint64_t v4 = *(unsigned __int8 **)result;
        unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          id v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            uint64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                id v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  id v10 = (uint64_t (*)(uint64_t))result;
                  unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        unint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x237DCD7E0](v13);
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
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_2687E7BBC, &dword_2687E7BC0);
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

uint64_t __WorkflowUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WorkflowUILibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t WFTextFieldKeyboardAppearanceFromTraitCollection(void *a1)
{
  uint64_t v1 = [a1 userInterfaceStyle];
  if (v1 == 1) {
    return 2;
  }
  else {
    return v1 == 2;
  }
}

void sub_234AFE33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WFLocalizedString(void *a1)
{
  id v1 = a1;
  BOOL v2 = WFCurrentBundle();
  id v3 = [v2 localizedStringForKey:v1 value:v1 table:0];

  return v3;
}

id WFCurrentBundle()
{
  if (WFCurrentBundle_onceToken != -1) {
    dispatch_once(&WFCurrentBundle_onceToken, &__block_literal_global_387);
  }
  double v0 = (void *)WFCurrentBundle_bundle;
  return v0;
}

void __WFCurrentBundle_block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(&v4, 0, sizeof(v4));
  if (dladdr(WFCurrentBundle, &v4) && v4.dli_fname)
  {
    double v0 = [objc_alloc(NSURL) initFileURLWithFileSystemRepresentation:v4.dli_fname isDirectory:0 relativeToURL:0];
    id v1 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    uint64_t v2 = [MEMORY[0x263F086E0] bundleWithURL:v1];
    id v3 = (void *)WFCurrentBundle_bundle;
    WFCurrentBundle_bundle = v2;
  }
  else
  {
    double v0 = getWFGeneralLogObject();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v6 = "WFCurrentBundle_block_invoke";
      _os_log_impl(&dword_23490C000, v0, OS_LOG_TYPE_ERROR, "%s WFLocalizedString failed to locate current bundle", buf, 0xCu);
    }
  }
}

void sub_234AFF5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WFShouldShowAddButtonForParameter(void *a1, int a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a3;
  if ([v7 isRangedSizeArray]
    && [v7 arrayMaxCountForWidgetFamily:3] <= a4)
  {
    uint64_t v12 = 0;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [v7 moduleSummaryShowsAddButtonForState:v8];
LABEL_14:
      uint64_t v12 = v9;
      goto LABEL_15;
    }
    id v10 = v8;
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v13 = v11;

    uint64_t v14 = [v13 variable];

    uint64_t v12 = 0;
    if (a2 && !v14)
    {
      uint64_t v9 = [v7 allowsMultipleValues];
      goto LABEL_14;
    }
  }
LABEL_15:

  return v12;
}

void sub_234B03680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234B03BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WFCatalystContentServiceXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E7E0E28];
}

uint64_t WFCatalystContentHostXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E7DFB20];
}

void sub_234B078A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234B07BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234B08078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234B089B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234B08AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234B08D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234B08DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234B08E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234B08F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234B08FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234B09084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234B0918C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234B09288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234B09344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234B093EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234B09504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234B095B4(_Unwind_Exception *a1)
{
  Dl_info v4 = v3;

  _Unwind_Resume(a1);
}

Class initHUShortcutsTriggerViewUtilities()
{
  if (HomeUILibrary_sOnce != -1) {
    dispatch_once(&HomeUILibrary_sOnce, &__block_literal_global_1634);
  }
  Class result = objc_getClass("HUShortcutsTriggerViewUtilities");
  classHUShortcutsTriggerViewUtilities = (uint64_t)result;
  getHUShortcutsTriggerViewUtilitiesClass = (uint64_t (*)())HUShortcutsTriggerViewUtilitiesFunction;
  return result;
}

id HUShortcutsTriggerViewUtilitiesFunction()
{
  return (id)classHUShortcutsTriggerViewUtilities;
}

void *__HomeUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/HomeUI.framework/HomeUI", 2);
  HomeUILibrary_sLib = (uint64_t)result;
  return result;
}

Class initHUTriggerActionFlow()
{
  if (HomeUILibrary_sOnce != -1) {
    dispatch_once(&HomeUILibrary_sOnce, &__block_literal_global_1634);
  }
  Class result = objc_getClass("HUTriggerActionFlow");
  classHUTriggerActionFlow = (uint64_t)result;
  getHUTriggerActionFlowClass = (uint64_t (*)())HUTriggerActionFlowFunction;
  return result;
}

id HUTriggerActionFlowFunction()
{
  return (id)classHUTriggerActionFlow;
}

Class initHUTriggerBuilderContext()
{
  if (HomeLibrary_sOnce != -1) {
    dispatch_once(&HomeLibrary_sOnce, &__block_literal_global_236);
  }
  Class result = objc_getClass("HUTriggerBuilderContext");
  classHUTriggerBuilderContext = (uint64_t)result;
  getHUTriggerBuilderContextClass = (uint64_t (*)())HUTriggerBuilderContextFunction;
  return result;
}

id HUTriggerBuilderContextFunction()
{
  return (id)classHUTriggerBuilderContext;
}

void *__HomeLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Home.framework/Home", 2);
  HomeLibrary_sLib = (uint64_t)result;
  return result;
}

Class initHFPlaceholderTriggerBuilder()
{
  if (HomeUILibrary_sOnce != -1) {
    dispatch_once(&HomeUILibrary_sOnce, &__block_literal_global_1634);
  }
  Class result = objc_getClass("HFPlaceholderTriggerBuilder");
  classHFPlaceholderTriggerBuilder = (uint64_t)result;
  getHFPlaceholderTriggerBuilderClass = (uint64_t (*)())HFPlaceholderTriggerBuilderFunction;
  return result;
}

id HFPlaceholderTriggerBuilderFunction()
{
  return (id)classHFPlaceholderTriggerBuilder;
}

Class initHUTriggerSummaryViewController()
{
  if (HomeUILibrary_sOnce != -1) {
    dispatch_once(&HomeUILibrary_sOnce, &__block_literal_global_1634);
  }
  Class result = objc_getClass("HUTriggerSummaryViewController");
  classHUTriggerSummaryViewController = (uint64_t)result;
  getHUTriggerSummaryViewControllerClass = (uint64_t (*)())HUTriggerSummaryViewControllerFunction;
  return result;
}

id HUTriggerSummaryViewControllerFunction()
{
  return (id)classHUTriggerSummaryViewController;
}

id WFAttributedTextFromSerializedTagString(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x263F089B8]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v16 = v3;
  unint64_t v6 = [v3 componentsSeparatedByString:@","];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 length])
        {
          uint64_t v12 = [(WFValueTextAttachment *)[WFTagTextAttachment alloc] initWithData:0 ofType:0];
          [(WFValueTextAttachment *)v12 setAttributes:v4];
          [(WFValueTextAttachment *)v12 setStringValue:v11];
          id v13 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v12];
          [v5 appendAttributedString:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  if (v4) {
    objc_msgSend(v5, "addAttributes:range:", v4, 0, objc_msgSend(v5, "length"));
  }
  uint64_t v14 = (void *)[v5 copy];

  return v14;
}

id WFSerializedTagStringFromAttributedText(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *MEMORY[0x263F814A0];
  uint64_t v4 = [v1 length];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _OWORD v8[2] = __WFSerializedTagStringFromAttributedText_block_invoke;
  v8[3] = &unk_264BFD140;
  id v9 = v2;
  id v5 = v2;
  objc_msgSend(v1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v4, 0, v8);

  unint64_t v6 = [v5 componentsJoinedByString:@","];

  return v6;
}

void __WFSerializedTagStringFromAttributedText_block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v5 stringValue];
    [v3 addObject:v4];
  }
}

uint64_t WFActionType()
{
  return [MEMORY[0x263F1D920] exportedTypeWithIdentifier:@"com.apple.shortcuts.action"];
}

id WFAttributedStringFromContactEntries(void *a1, void *a2, int a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    uint64_t v21 = v7;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [(WFValueTextAttachment *)[WFContactTextAttachment alloc] initWithData:0 ofType:0];
        [(WFValueTextAttachment *)v14 setAttributes:v6];
        uint64_t v15 = [v13 type];
        if (v15 == 2)
        {
          if (!a3) {
            goto LABEL_16;
          }
          uint64_t v16 = [v13 emailAddress];
          uint64_t v17 = [v16 address];
        }
        else
        {
          if (v15 != 1)
          {
            if (v15) {
              goto LABEL_16;
            }
            uint64_t v16 = [v13 contact];
            [(WFContactTextAttachment *)v14 setValue:v16];
            goto LABEL_15;
          }
          if (!a3) {
            goto LABEL_16;
          }
          uint64_t v16 = [v13 phoneNumber];
          uint64_t v17 = [v16 string];
        }
        long long v18 = (void *)v17;
        [(WFValueTextAttachment *)v14 setStringValue:v17];

        uint64_t v7 = v21;
LABEL_15:

        long long v19 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v14];
        [v7 appendAttributedString:v19];

LABEL_16:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  if (v6) {
    objc_msgSend(v7, "addAttributes:range:", v6, 0, objc_msgSend(v7, "length"));
  }

  return v7;
}

id WFContactStateFromAttributedString(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F869F8];
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v4 = WFContactEntriesFromAttributedString(v2);

  id v5 = (void *)[v3 initWithParameterStates:v4];
  return v5;
}

id WFContactEntriesFromAttributedString(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new();
  uint64_t v3 = *MEMORY[0x263F814A0];
  uint64_t v4 = [v1 length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __WFContactEntriesFromAttributedString_block_invoke;
  v7[3] = &unk_264BFD1A8;
  id v5 = v2;
  id v8 = v5;
  objc_msgSend(v1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v4, 0, v7);

  return v5;
}

void __WFContactEntriesFromAttributedString_block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v9 value];

    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = objc_alloc(MEMORY[0x263F33790]);
    if (v3)
    {
      id v6 = [v9 value];
      uint64_t v7 = [v5 initWithContact:v6];
    }
    else
    {
      id v6 = [v9 stringValue];
      uint64_t v7 = [v5 initWithHandleString:v6];
    }
    id v8 = (void *)v7;
    [v4 addObject:v7];
  }
}

void sub_234B0F364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234B14CF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_234B1569C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234B164D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class WFModuleSummaryEditorClassForParameterClass(Class a1)
{
  if (objc_opt_respondsToSelector())
  {
    Class v2 = [(objc_class *)a1 moduleSummaryEditorClass];
  }
  else if (a1)
  {
    while (1)
    {
      uint64_t v3 = NSStringFromClass(a1);
      uint64_t v4 = [v3 stringByAppendingString:@"SummaryEditor"];
      Class v5 = NSClassFromString(v4);

      if ([(objc_class *)v5 isSubclassOfClass:objc_opt_class()]) {
        break;
      }
      Class v2 = (Class)[(objc_class *)a1 superclass];
      a1 = v2;
      if (!v2) {
        goto LABEL_9;
      }
    }
    Class v2 = v5;
  }
  else
  {
    Class v2 = 0;
  }
LABEL_9:
  return v2;
}

void sub_234B19C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234B1A6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_234B1BBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234B1BE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234B1C548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234B25710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234B25E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234B26B8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_234B26FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initHUShortcutsTriggerViewUtilities_4833()
{
  if (HomeUILibrary_sOnce_4834 != -1) {
    dispatch_once(&HomeUILibrary_sOnce_4834, &__block_literal_global_4835);
  }
  Class result = objc_getClass("HUShortcutsTriggerViewUtilities");
  classHUShortcutsTriggerViewUtilities_4836 = (uint64_t)result;
  getHUShortcutsTriggerViewUtilitiesClass_4831 = (uint64_t (*)())HUShortcutsTriggerViewUtilitiesFunction_4838;
  return result;
}

id HUShortcutsTriggerViewUtilitiesFunction_4838()
{
  return (id)classHUShortcutsTriggerViewUtilities_4836;
}

void *__HomeUILibrary_block_invoke_4841()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/HomeUI.framework/HomeUI", 2);
  HomeUILibrary_sLib_4842 = (uint64_t)result;
  return result;
}

Class initHUShortcutsTriggerViewAccessoryPickerConfiguration()
{
  if (HomeUILibrary_sOnce_4834 != -1) {
    dispatch_once(&HomeUILibrary_sOnce_4834, &__block_literal_global_4835);
  }
  Class result = objc_getClass("HUShortcutsTriggerViewAccessoryPickerConfiguration");
  classHUShortcutsTriggerViewAccessoryPickerConfiguration = (uint64_t)result;
  getHUShortcutsTriggerViewAccessoryPickerConfigurationClass = (uint64_t (*)())HUShortcutsTriggerViewAccessoryPickerConfigurationFunction;
  return result;
}

id HUShortcutsTriggerViewAccessoryPickerConfigurationFunction()
{
  return (id)classHUShortcutsTriggerViewAccessoryPickerConfiguration;
}

uint64_t WFParameterStateIsMultipleValue(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL WFParameterStateIsVariable(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v3 = v1;
  uint64_t v4 = v3;
  if (isKindOfClass)
  {
    if (v3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        Class v5 = v4;
      }
      else {
        Class v5 = 0;
      }
    }
    else
    {
      Class v5 = 0;
    }
    id v7 = v5;

    id v8 = [v7 value];

    if ([v8 count])
    {
      uint64_t v14 = 0;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x2020000000;
      char v17 = 1;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __WFParameterStateIsVariable_block_invoke;
      v13[3] = &unk_264BFD7B8;
      v13[4] = &v14;
      [v8 enumerateObjectsUsingBlock:v13];
      BOOL v9 = *((unsigned char *)v15 + 24) != 0;
      _Block_object_dispose(&v14, 8);
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    if (v3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v6 = v4;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    id v10 = v6;

    uint64_t v11 = [v10 variable];

    BOOL v9 = v11 != 0;
  }

  return v9;
}

void sub_234B28F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __WFParameterStateIsVariable_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    uint64_t result = WFParameterStateIsVariable(a2);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    uint64_t result = 0;
  }
  *(unsigned char *)(v6 + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

id WFMultipleParameterStateValues(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      Class v2 = v1;
    }
    else {
      Class v2 = 0;
    }
  }
  else
  {
    Class v2 = 0;
  }
  id v3 = v2;
  uint64_t v4 = [v3 parameterStates];

  if (v4) {
    Class v5 = v4;
  }
  else {
    Class v5 = (void *)MEMORY[0x263EFFA68];
  }
  id v6 = v5;

  return v6;
}

id WFModuleSummaryEditorInitialState(void *a1)
{
  id v1 = a1;
  Class v2 = [v1 initialArrayState];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [v1 initialState];
  }
  Class v5 = v4;

  return v5;
}

id WFMultipleParameterStateMake(objc_class *a1, void *a2)
{
  id v3 = a2;
  if ([(objc_class *)a1 isSubclassOfClass:objc_opt_class()]) {
    id v4 = (void *)[[a1 alloc] initWithParameterStates:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id getWFWFContactComposeRecipientLogObject()
{
  if (getWFWFContactComposeRecipientLogObject_onceToken != -1) {
    dispatch_once(&getWFWFContactComposeRecipientLogObject_onceToken, &__block_literal_global_161);
  }
  double v0 = (void *)getWFWFContactComposeRecipientLogObject_log;
  return v0;
}

void __getWFWFContactComposeRecipientLogObject_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F85748], "WFContactComposeRecipient");
  id v1 = (void *)getWFWFContactComposeRecipientLogObject_log;
  getWFWFContactComposeRecipientLogObject_log = (uint64_t)v0;
}

id getWFWFContactFieldEntryLogObject()
{
  if (getWFWFContactFieldEntryLogObject_onceToken != -1) {
    dispatch_once(&getWFWFContactFieldEntryLogObject_onceToken, &__block_literal_global_5284);
  }
  os_log_t v0 = (void *)getWFWFContactFieldEntryLogObject_log;
  return v0;
}

void __getWFWFContactFieldEntryLogObject_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F85748], "WFContactFieldEntry");
  id v1 = (void *)getWFWFContactFieldEntryLogObject_log;
  getWFWFContactFieldEntryLogObject_log = (uint64_t)v0;
}

uint64_t __WFContactForSpecificHandle_block_invoke(uint64_t a1, void *a2)
{
  Class v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

id WFEnforceClass(void *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (v3 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    Class v5 = getWFGeneralLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315906;
      BOOL v9 = "WFEnforceClass";
      __int16 v10 = 2114;
      id v11 = v3;
      __int16 v12 = 2114;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2114;
      uint64_t v15 = a2;
      id v6 = v13;
      _os_log_impl(&dword_23490C000, v5, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v8, 0x2Au);
    }
    id v4 = 0;
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

id CLPlacemarkFromMapItem(void *a1)
{
  id v1 = a1;
  Class v2 = [v1 placemark];
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = [v1 placemark];
  Class v5 = [v4 addressDictionary];
  id v6 = [v3 dictionaryWithDictionary:v5];

  id v7 = [v6 objectForKeyedSubscript:@"Name"];
  if (!v7)
  {
    int v8 = [v1 name];

    if (!v8) {
      goto LABEL_5;
    }
    id v7 = [v1 name];
    [v6 setObject:v7 forKeyedSubscript:@"Name"];
  }

LABEL_5:
  id v9 = objc_alloc(MEMORY[0x263F00AA8]);
  __int16 v10 = [v2 location];
  id v11 = [v2 region];
  __int16 v12 = [v2 areasOfInterest];
  id v13 = (void *)[v9 initWithLocation:v10 addressDictionary:v6 region:v11 areasOfInterest:v12];

  return v13;
}

id MKMapItemWithPlacemark(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F109E0];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithPlacemark:v2];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F10960]) initWithPlacemark:v3];
  Class v5 = [v2 name];

  [v4 setName:v5];
  return v4;
}

void sub_234B3419C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234B34348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_234B34430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234B344D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234B345E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234B34854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_234B34A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v12 = v11;

  _Unwind_Resume(a1);
}

void sub_234B34C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_234B34DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v14 = v12;

  _Unwind_Resume(a1);
}

void sub_234B34F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234B3509C(_Unwind_Exception *a1)
{
  Class v5 = v3;

  _Unwind_Resume(a1);
}

void sub_234B36434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_234B37F78()
{
  return MEMORY[0x270EE0AA8]();
}

uint64_t sub_234B37F88()
{
  return MEMORY[0x270EE0AB0]();
}

uint64_t sub_234B37F98()
{
  return MEMORY[0x270EE0AB8]();
}

uint64_t sub_234B37FA8()
{
  return MEMORY[0x270EE0BA8]();
}

uint64_t sub_234B37FC8()
{
  return MEMORY[0x270EE0C80]();
}

uint64_t sub_234B37FD8()
{
  return MEMORY[0x270EE0CB0]();
}

uint64_t sub_234B37FE8()
{
  return MEMORY[0x270EE0CC0]();
}

uint64_t sub_234B37FF8()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_234B38028()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_234B38038()
{
  return MEMORY[0x270EE0F98]();
}

uint64_t sub_234B38048()
{
  return MEMORY[0x270EE11C0]();
}

uint64_t sub_234B38058()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_234B38068()
{
  return MEMORY[0x270EE11E0]();
}

uint64_t sub_234B38078()
{
  return MEMORY[0x270EE11F8]();
}

uint64_t sub_234B38088()
{
  return MEMORY[0x270EE1300]();
}

uint64_t sub_234B38098()
{
  return MEMORY[0x270EE1540]();
}

uint64_t sub_234B380A8()
{
  return MEMORY[0x270EE1548]();
}

uint64_t sub_234B380B8()
{
  return MEMORY[0x270EE1550]();
}

uint64_t sub_234B380C8()
{
  return MEMORY[0x270EE1588]();
}

uint64_t sub_234B380D8()
{
  return MEMORY[0x270EE15A0]();
}

uint64_t sub_234B380E8()
{
  return MEMORY[0x270EE18D8]();
}

uint64_t sub_234B380F8()
{
  return MEMORY[0x270EE18E8]();
}

uint64_t sub_234B38108()
{
  return MEMORY[0x270EE1900]();
}

uint64_t sub_234B38118()
{
  return MEMORY[0x270EE1918]();
}

uint64_t sub_234B38128()
{
  return MEMORY[0x270EE1938]();
}

uint64_t sub_234B38148()
{
  return MEMORY[0x270EE1A20]();
}

uint64_t sub_234B38158()
{
  return MEMORY[0x270EE1A50]();
}

uint64_t sub_234B38168()
{
  return MEMORY[0x270EE1AB0]();
}

uint64_t sub_234B38178()
{
  return MEMORY[0x270EE1AB8]();
}

uint64_t sub_234B38188()
{
  return MEMORY[0x270EE1AC0]();
}

uint64_t sub_234B38198()
{
  return MEMORY[0x270EE1AD0]();
}

uint64_t sub_234B381A8()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_234B381B8()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t sub_234B381C8()
{
  return MEMORY[0x270EE1CB0]();
}

uint64_t sub_234B381D8()
{
  return MEMORY[0x270EE1CC0]();
}

uint64_t sub_234B381E8()
{
  return MEMORY[0x270EE1D28]();
}

uint64_t sub_234B381F8()
{
  return MEMORY[0x270EE1D30]();
}

uint64_t sub_234B38218()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_234B38228()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_234B38238()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_234B38248()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_234B38258()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_234B38268()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_234B38278()
{
  return MEMORY[0x270EEEEF0]();
}

uint64_t sub_234B38288()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_234B38298()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_234B382A8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_234B382B8()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_234B382C8()
{
  return MEMORY[0x270EEF888]();
}

uint64_t sub_234B382D8()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_234B382E8()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_234B382F8()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_234B38308()
{
  return MEMORY[0x270EEFBA8]();
}

uint64_t sub_234B38318()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_234B38328()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_234B38338()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_234B38348()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_234B38358()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_234B38368()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_234B38378()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_234B38388()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_234B38398()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_234B383A8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_234B383B8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_234B383C8()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_234B383D8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_234B383E8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_234B383F8()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_234B38408()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_234B38418()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_234B38428()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_234B38438()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_234B38448()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_234B38458()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_234B38468()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_234B38478()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_234B38488()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_234B38498()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_234B384A8()
{
  return MEMORY[0x270EF1400]();
}

uint64_t sub_234B384B8()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_234B384C8()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_234B384D8()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_234B384E8()
{
  return MEMORY[0x270EF1458]();
}

uint64_t sub_234B384F8()
{
  return MEMORY[0x270EF1460]();
}

uint64_t sub_234B38508()
{
  return MEMORY[0x270EF1490]();
}

uint64_t sub_234B38518()
{
  return MEMORY[0x270EF1498]();
}

uint64_t sub_234B38528()
{
  return MEMORY[0x270EF14A0]();
}

uint64_t sub_234B38538()
{
  return MEMORY[0x270EF14B8]();
}

uint64_t sub_234B38548()
{
  return MEMORY[0x270EF14D0]();
}

uint64_t sub_234B38558()
{
  return MEMORY[0x270EF14D8]();
}

uint64_t sub_234B38568()
{
  return MEMORY[0x270EF14E8]();
}

uint64_t sub_234B38578()
{
  return MEMORY[0x270EF14F8]();
}

uint64_t sub_234B38588()
{
  return MEMORY[0x270EF1510]();
}

uint64_t sub_234B38598()
{
  return MEMORY[0x270EF1538]();
}

uint64_t sub_234B385A8()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_234B385B8()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_234B385C8()
{
  return MEMORY[0x270EF15E8]();
}

uint64_t sub_234B385D8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_234B385E8()
{
  return MEMORY[0x270EF1728]();
}

uint64_t sub_234B385F8()
{
  return MEMORY[0x270EF1730]();
}

uint64_t sub_234B38608()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_234B38618()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_234B38628()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_234B38638()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_234B38648()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_234B38658()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_234B38668()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_234B38678()
{
  return MEMORY[0x270F85B10]();
}

uint64_t sub_234B38688()
{
  return MEMORY[0x270F85B18]();
}

uint64_t sub_234B38698()
{
  return MEMORY[0x270F85BA0]();
}

uint64_t sub_234B386A8()
{
  return MEMORY[0x270F85BA8]();
}

uint64_t sub_234B386B8()
{
  return MEMORY[0x270F85BB8]();
}

uint64_t sub_234B386C8()
{
  return MEMORY[0x270F85BC0]();
}

uint64_t sub_234B386D8()
{
  return MEMORY[0x270F85BC8]();
}

uint64_t sub_234B386E8()
{
  return MEMORY[0x270F85BD0]();
}

uint64_t sub_234B386F8()
{
  return MEMORY[0x270F85BD8]();
}

uint64_t sub_234B38708()
{
  return MEMORY[0x270F85BE0]();
}

uint64_t sub_234B38718()
{
  return MEMORY[0x270F85C00]();
}

uint64_t sub_234B38728()
{
  return MEMORY[0x270F85C08]();
}

uint64_t sub_234B38738()
{
  return MEMORY[0x270F85C18]();
}

uint64_t sub_234B38748()
{
  return MEMORY[0x270F85CB0]();
}

uint64_t sub_234B38758()
{
  return MEMORY[0x270F85CB8]();
}

uint64_t sub_234B38768()
{
  return MEMORY[0x270F85CC0]();
}

uint64_t sub_234B38778()
{
  return MEMORY[0x270F85CC8]();
}

uint64_t sub_234B38788()
{
  return MEMORY[0x270F85CD0]();
}

uint64_t sub_234B38798()
{
  return MEMORY[0x270F85CD8]();
}

uint64_t sub_234B387A8()
{
  return MEMORY[0x270F85CE0]();
}

uint64_t sub_234B387B8()
{
  return MEMORY[0x270F85CE8]();
}

uint64_t sub_234B387C8()
{
  return MEMORY[0x270F85CF0]();
}

uint64_t sub_234B387D8()
{
  return MEMORY[0x270F85CF8]();
}

uint64_t sub_234B387E8()
{
  return MEMORY[0x270F85D00]();
}

uint64_t sub_234B387F8()
{
  return MEMORY[0x270F85D08]();
}

uint64_t sub_234B38808()
{
  return MEMORY[0x270F85D10]();
}

uint64_t sub_234B38818()
{
  return MEMORY[0x270F85D50]();
}

uint64_t sub_234B38828()
{
  return MEMORY[0x270F85D58]();
}

uint64_t sub_234B38838()
{
  return MEMORY[0x270F85D90]();
}

uint64_t sub_234B38848()
{
  return MEMORY[0x270F85D98]();
}

uint64_t sub_234B38858()
{
  return MEMORY[0x270F85DA0]();
}

uint64_t sub_234B38868()
{
  return MEMORY[0x270F85DA8]();
}

uint64_t sub_234B38878()
{
  return MEMORY[0x270F85DB0]();
}

uint64_t sub_234B38888()
{
  return MEMORY[0x270F85DB8]();
}

uint64_t sub_234B38898()
{
  return MEMORY[0x270F85DC0]();
}

uint64_t sub_234B388A8()
{
  return MEMORY[0x270F85DC8]();
}

uint64_t sub_234B388B8()
{
  return MEMORY[0x270F85DD0]();
}

uint64_t sub_234B388C8()
{
  return MEMORY[0x270F85DD8]();
}

uint64_t sub_234B388D8()
{
  return MEMORY[0x270F85DE0]();
}

uint64_t sub_234B388E8()
{
  return MEMORY[0x270F85DE8]();
}

uint64_t sub_234B388F8()
{
  return MEMORY[0x270F85DF0]();
}

uint64_t sub_234B38908()
{
  return MEMORY[0x270F85DF8]();
}

uint64_t sub_234B38918()
{
  return MEMORY[0x270F85E30]();
}

uint64_t sub_234B38928()
{
  return MEMORY[0x270F85E88]();
}

uint64_t sub_234B38938()
{
  return MEMORY[0x270F85E98]();
}

uint64_t sub_234B38948()
{
  return MEMORY[0x270F85EC8]();
}

uint64_t sub_234B38958()
{
  return MEMORY[0x270F85F30]();
}

uint64_t sub_234B38968()
{
  return MEMORY[0x270F85F38]();
}

uint64_t sub_234B38978()
{
  return MEMORY[0x270F85F40]();
}

uint64_t sub_234B38988()
{
  return MEMORY[0x270F85F48]();
}

uint64_t sub_234B38998()
{
  return MEMORY[0x270F85F50]();
}

uint64_t sub_234B389A8()
{
  return MEMORY[0x270F85F58]();
}

uint64_t sub_234B389D8()
{
  return MEMORY[0x270F85F70]();
}

uint64_t sub_234B389E8()
{
  return MEMORY[0x270F85F78]();
}

uint64_t sub_234B389F8()
{
  return MEMORY[0x270F85F88]();
}

uint64_t sub_234B38A08()
{
  return MEMORY[0x270F85F90]();
}

uint64_t sub_234B38A18()
{
  return MEMORY[0x270F85FC0]();
}

uint64_t sub_234B38A28()
{
  return MEMORY[0x270F85FC8]();
}

uint64_t sub_234B38A38()
{
  return MEMORY[0x270F86010]();
}

uint64_t sub_234B38A48()
{
  return MEMORY[0x270F86018]();
}

uint64_t sub_234B38A58()
{
  return MEMORY[0x270F86020]();
}

uint64_t sub_234B38A68()
{
  return MEMORY[0x270F86028]();
}

uint64_t sub_234B38A78()
{
  return MEMORY[0x270F86030]();
}

uint64_t sub_234B38A88()
{
  return MEMORY[0x270F86038]();
}

uint64_t sub_234B38A98()
{
  return MEMORY[0x270F86048]();
}

uint64_t sub_234B38AA8()
{
  return MEMORY[0x270F86050]();
}

uint64_t sub_234B38AB8()
{
  return MEMORY[0x270F86058]();
}

uint64_t sub_234B38AC8()
{
  return MEMORY[0x270F86320]();
}

uint64_t sub_234B38AD8()
{
  return MEMORY[0x270F86328]();
}

uint64_t sub_234B38AE8()
{
  return MEMORY[0x270F86360]();
}

uint64_t sub_234B38AF8()
{
  return MEMORY[0x270F86368]();
}

uint64_t sub_234B38B08()
{
  return MEMORY[0x270F86370]();
}

uint64_t sub_234B38B18()
{
  return MEMORY[0x270F86378]();
}

uint64_t sub_234B38B28()
{
  return MEMORY[0x270F86390]();
}

uint64_t sub_234B38B38()
{
  return MEMORY[0x270F86398]();
}

uint64_t sub_234B38B48()
{
  return MEMORY[0x270F863A0]();
}

uint64_t sub_234B38B58()
{
  return MEMORY[0x270F863A8]();
}

uint64_t sub_234B38B68()
{
  return MEMORY[0x270F863B0]();
}

uint64_t sub_234B38B78()
{
  return MEMORY[0x270F863B8]();
}

uint64_t sub_234B38B88()
{
  return MEMORY[0x270F863C0]();
}

uint64_t sub_234B38B98()
{
  return MEMORY[0x270F863C8]();
}

uint64_t sub_234B38BA8()
{
  return MEMORY[0x270F863D0]();
}

uint64_t sub_234B38BB8()
{
  return MEMORY[0x270F863E0]();
}

uint64_t sub_234B38BC8()
{
  return MEMORY[0x270F863F0]();
}

uint64_t sub_234B38BD8()
{
  return MEMORY[0x270F863F8]();
}

uint64_t sub_234B38BE8()
{
  return MEMORY[0x270F86418]();
}

uint64_t sub_234B38BF8()
{
  return MEMORY[0x270F86428]();
}

uint64_t sub_234B38C08()
{
  return MEMORY[0x270F86430]();
}

uint64_t sub_234B38C18()
{
  return MEMORY[0x270F86438]();
}

uint64_t sub_234B38C28()
{
  return MEMORY[0x270F86440]();
}

uint64_t sub_234B38C38()
{
  return MEMORY[0x270F86458]();
}

uint64_t sub_234B38C48()
{
  return MEMORY[0x270F86468]();
}

uint64_t sub_234B38C58()
{
  return MEMORY[0x270F86470]();
}

uint64_t sub_234B38C68()
{
  return MEMORY[0x270F864A0]();
}

uint64_t sub_234B38C78()
{
  return MEMORY[0x270F864A8]();
}

uint64_t sub_234B38C88()
{
  return MEMORY[0x270F864B0]();
}

uint64_t sub_234B38C98()
{
  return MEMORY[0x270F864B8]();
}

uint64_t sub_234B38CA8()
{
  return MEMORY[0x270F864C8]();
}

uint64_t sub_234B38CB8()
{
  return MEMORY[0x270F864E0]();
}

uint64_t sub_234B38CC8()
{
  return MEMORY[0x270F864E8]();
}

uint64_t sub_234B38CD8()
{
  return MEMORY[0x270F864F0]();
}

uint64_t sub_234B38CE8()
{
  return MEMORY[0x270F86510]();
}

uint64_t sub_234B38CF8()
{
  return MEMORY[0x270F86518]();
}

uint64_t sub_234B38D08()
{
  return MEMORY[0x270F86520]();
}

uint64_t sub_234B38D18()
{
  return MEMORY[0x270F86528]();
}

uint64_t sub_234B38D28()
{
  return MEMORY[0x270F86530]();
}

uint64_t sub_234B38D38()
{
  return MEMORY[0x270F86538]();
}

uint64_t sub_234B38D48()
{
  return MEMORY[0x270F86540]();
}

uint64_t sub_234B38D58()
{
  return MEMORY[0x270F86548]();
}

uint64_t sub_234B38D68()
{
  return MEMORY[0x270F86550]();
}

uint64_t sub_234B38D78()
{
  return MEMORY[0x270F86558]();
}

uint64_t sub_234B38D88()
{
  return MEMORY[0x270F86560]();
}

uint64_t sub_234B38D98()
{
  return MEMORY[0x270F86568]();
}

uint64_t sub_234B38DA8()
{
  return MEMORY[0x270F86570]();
}

uint64_t sub_234B38DB8()
{
  return MEMORY[0x270F86578]();
}

uint64_t sub_234B38DC8()
{
  return MEMORY[0x270F86580]();
}

uint64_t sub_234B38DD8()
{
  return MEMORY[0x270F86588]();
}

uint64_t sub_234B38DE8()
{
  return MEMORY[0x270F86590]();
}

uint64_t sub_234B38DF8()
{
  return MEMORY[0x270F86598]();
}

uint64_t sub_234B38E08()
{
  return MEMORY[0x270F865A0]();
}

uint64_t sub_234B38E18()
{
  return MEMORY[0x270F865A8]();
}

uint64_t sub_234B38E28()
{
  return MEMORY[0x270F865B0]();
}

uint64_t sub_234B38E38()
{
  return MEMORY[0x270F865B8]();
}

uint64_t sub_234B38E48()
{
  return MEMORY[0x270F865C0]();
}

uint64_t sub_234B38E58()
{
  return MEMORY[0x270F865C8]();
}

uint64_t sub_234B38E68()
{
  return MEMORY[0x270F865D0]();
}

uint64_t sub_234B38E78()
{
  return MEMORY[0x270F865D8]();
}

uint64_t sub_234B38E88()
{
  return MEMORY[0x270F865E0]();
}

uint64_t sub_234B38E98()
{
  return MEMORY[0x270F865E8]();
}

uint64_t sub_234B38EA8()
{
  return MEMORY[0x270F865F0]();
}

uint64_t sub_234B38EB8()
{
  return MEMORY[0x270F865F8]();
}

uint64_t sub_234B38EC8()
{
  return MEMORY[0x270F86600]();
}

uint64_t sub_234B38ED8()
{
  return MEMORY[0x270F86608]();
}

uint64_t sub_234B38EE8()
{
  return MEMORY[0x270F86610]();
}

uint64_t sub_234B38EF8()
{
  return MEMORY[0x270F86618]();
}

uint64_t sub_234B38F08()
{
  return MEMORY[0x270F86620]();
}

uint64_t sub_234B38F18()
{
  return MEMORY[0x270F86628]();
}

uint64_t sub_234B38F28()
{
  return MEMORY[0x270F86630]();
}

uint64_t sub_234B38F38()
{
  return MEMORY[0x270F86638]();
}

uint64_t sub_234B38F48()
{
  return MEMORY[0x270F86640]();
}

uint64_t sub_234B38F58()
{
  return MEMORY[0x270F86648]();
}

uint64_t sub_234B38F68()
{
  return MEMORY[0x270F86658]();
}

uint64_t sub_234B38F78()
{
  return MEMORY[0x270F86660]();
}

uint64_t sub_234B38F88()
{
  return MEMORY[0x270F86668]();
}

uint64_t sub_234B38F98()
{
  return MEMORY[0x270F86938]();
}

uint64_t sub_234B38FA8()
{
  return MEMORY[0x270F86A28]();
}

uint64_t sub_234B38FB8()
{
  return MEMORY[0x270F86A38]();
}

uint64_t sub_234B38FC8()
{
  return MEMORY[0x270F86A40]();
}

uint64_t sub_234B38FD8()
{
  return MEMORY[0x270F86A48]();
}

uint64_t sub_234B38FE8()
{
  return MEMORY[0x270F845D8]();
}

uint64_t sub_234B38FF8()
{
  return MEMORY[0x270F845E0]();
}

uint64_t sub_234B39008()
{
  return MEMORY[0x270F845F0]();
}

uint64_t sub_234B39018()
{
  return MEMORY[0x270F845F8]();
}

uint64_t sub_234B39028()
{
  return MEMORY[0x270F84600]();
}

uint64_t sub_234B39038()
{
  return MEMORY[0x270F84608]();
}

uint64_t sub_234B39048()
{
  return MEMORY[0x270F846A8]();
}

uint64_t sub_234B39058()
{
  return MEMORY[0x270F846B0]();
}

uint64_t sub_234B39068()
{
  return MEMORY[0x270F847B0]();
}

uint64_t sub_234B39078()
{
  return MEMORY[0x270FA16A0]();
}

uint64_t sub_234B39088()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_234B39098()
{
  return MEMORY[0x270FA1820]();
}

uint64_t sub_234B390A8()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_234B390B8()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_234B390C8()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_234B390D8()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_234B390E8()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_234B390F8()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_234B39108()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_234B39118()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_234B39128()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_234B39138()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_234B39148()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_234B39158()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_234B39168()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_234B39178()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_234B39188()
{
  return MEMORY[0x270F81D20]();
}

uint64_t sub_234B39198()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_234B391A8()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_234B391B8()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_234B391C8()
{
  return MEMORY[0x270EE3C18]();
}

uint64_t sub_234B391D8()
{
  return MEMORY[0x270EFEB58]();
}

uint64_t sub_234B391E8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_234B391F8()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_234B39208()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_234B39218()
{
  return MEMORY[0x270EE3CC0]();
}

uint64_t sub_234B39228()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_234B39238()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_234B39248()
{
  return MEMORY[0x270EE3D90]();
}

uint64_t sub_234B39258()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_234B39268()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_234B39278()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_234B39288()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_234B39298()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_234B392A8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_234B392B8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_234B392C8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_234B392D8()
{
  return MEMORY[0x270EFEC00]();
}

uint64_t sub_234B392E8()
{
  return MEMORY[0x270EFEC20]();
}

uint64_t sub_234B392F8()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_234B39308()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_234B39318()
{
  return MEMORY[0x270EFEC90]();
}

uint64_t sub_234B39328()
{
  return MEMORY[0x270EFEC98]();
}

uint64_t sub_234B39338()
{
  return MEMORY[0x270EFECA0]();
}

uint64_t sub_234B39348()
{
  return MEMORY[0x270EFECA8]();
}

uint64_t sub_234B39358()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_234B39368()
{
  return MEMORY[0x270EFED30]();
}

uint64_t sub_234B39378()
{
  return MEMORY[0x270EFED38]();
}

uint64_t sub_234B39388()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_234B39398()
{
  return MEMORY[0x270EFED68]();
}

uint64_t sub_234B393A8()
{
  return MEMORY[0x270EFED70]();
}

uint64_t sub_234B393B8()
{
  return MEMORY[0x270EFEDA0]();
}

uint64_t sub_234B393C8()
{
  return MEMORY[0x270EFEDA8]();
}

uint64_t sub_234B393D8()
{
  return MEMORY[0x270EFEDF0]();
}

uint64_t sub_234B393F8()
{
  return MEMORY[0x270EFEF08]();
}

uint64_t sub_234B39408()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_234B39418()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_234B39428()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_234B39438()
{
  return MEMORY[0x270EFF048]();
}

uint64_t sub_234B39448()
{
  return MEMORY[0x270EFF078]();
}

uint64_t sub_234B39458()
{
  return MEMORY[0x270EFF090]();
}

uint64_t sub_234B39468()
{
  return MEMORY[0x270EFF098]();
}

uint64_t sub_234B39478()
{
  return MEMORY[0x270EFF100]();
}

uint64_t sub_234B39488()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_234B39498()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_234B394B8()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_234B394C8()
{
  return MEMORY[0x270EFF180]();
}

uint64_t sub_234B394D8()
{
  return MEMORY[0x270EFF2A0]();
}

uint64_t sub_234B394E8()
{
  return MEMORY[0x270EFF2B8]();
}

uint64_t sub_234B394F8()
{
  return MEMORY[0x270EFF2C0]();
}

uint64_t sub_234B39508()
{
  return MEMORY[0x270EFF3F8]();
}

uint64_t sub_234B39518()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_234B39528()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_234B39538()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_234B39548()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_234B39558()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_234B39568()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_234B39578()
{
  return MEMORY[0x270EFF5E8]();
}

uint64_t sub_234B39588()
{
  return MEMORY[0x270EFF620]();
}

uint64_t sub_234B39598()
{
  return MEMORY[0x270EFF640]();
}

uint64_t sub_234B395A8()
{
  return MEMORY[0x270EFF648]();
}

uint64_t sub_234B395B8()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_234B395C8()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_234B395D8()
{
  return MEMORY[0x270EFF688]();
}

uint64_t sub_234B395E8()
{
  return MEMORY[0x270EFF690]();
}

uint64_t sub_234B395F8()
{
  return MEMORY[0x270EFF698]();
}

uint64_t sub_234B39608()
{
  return MEMORY[0x270EFF6C0]();
}

uint64_t sub_234B39618()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_234B39628()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_234B39638()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_234B39648()
{
  return MEMORY[0x270EFF700]();
}

uint64_t sub_234B39658()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_234B39668()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_234B39678()
{
  return MEMORY[0x270F86670]();
}

uint64_t sub_234B39688()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_234B39698()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_234B396A8()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_234B396C8()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t sub_234B396D8()
{
  return MEMORY[0x270EFFA10]();
}

uint64_t sub_234B396E8()
{
  return MEMORY[0x270EFFAA0]();
}

uint64_t sub_234B396F8()
{
  return MEMORY[0x270EFFAA8]();
}

uint64_t sub_234B39708()
{
  return MEMORY[0x270EFFB58]();
}

uint64_t sub_234B39718()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_234B39728()
{
  return MEMORY[0x270EFFB70]();
}

uint64_t sub_234B39738()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_234B39748()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_234B39758()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_234B39768()
{
  return MEMORY[0x270EFFBB8]();
}

uint64_t sub_234B39778()
{
  return MEMORY[0x270EFFBC0]();
}

uint64_t sub_234B39788()
{
  return MEMORY[0x270EFFC90]();
}

uint64_t sub_234B39798()
{
  return MEMORY[0x270EFFCA0]();
}

uint64_t sub_234B397B8()
{
  return MEMORY[0x270EFFE90]();
}

uint64_t sub_234B397C8()
{
  return MEMORY[0x270EFFEA8]();
}

uint64_t sub_234B397D8()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_234B397E8()
{
  return MEMORY[0x270F000D0]();
}

uint64_t sub_234B397F8()
{
  return MEMORY[0x270F00110]();
}

uint64_t sub_234B39808()
{
  return MEMORY[0x270F00118]();
}

uint64_t sub_234B39818()
{
  return MEMORY[0x270F00148]();
}

uint64_t sub_234B39828()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_234B39838()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_234B39848()
{
  return MEMORY[0x270F001D8]();
}

uint64_t sub_234B39858()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_234B39868()
{
  return MEMORY[0x270F00268]();
}

uint64_t sub_234B39878()
{
  return MEMORY[0x270F00270]();
}

uint64_t sub_234B39888()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_234B39898()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_234B398A8()
{
  return MEMORY[0x270F00528]();
}

uint64_t sub_234B398B8()
{
  return MEMORY[0x270F00530]();
}

uint64_t sub_234B398C8()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_234B398D8()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_234B398E8()
{
  return MEMORY[0x270F005D0]();
}

uint64_t sub_234B398F8()
{
  return MEMORY[0x270F005F8]();
}

uint64_t sub_234B39908()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_234B39918()
{
  return MEMORY[0x270F00708]();
}

uint64_t sub_234B39928()
{
  return MEMORY[0x270F00720]();
}

uint64_t sub_234B39938()
{
  return MEMORY[0x270F00738]();
}

uint64_t sub_234B39948()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_234B39958()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_234B39968()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_234B39978()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_234B39988()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_234B39998()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_234B399A8()
{
  return MEMORY[0x270F00920]();
}

uint64_t sub_234B399B8()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_234B399C8()
{
  return MEMORY[0x270F00948]();
}

uint64_t sub_234B399D8()
{
  return MEMORY[0x270F00978]();
}

uint64_t sub_234B399E8()
{
  return MEMORY[0x270F00980]();
}

uint64_t sub_234B399F8()
{
  return MEMORY[0x270F86688]();
}

uint64_t sub_234B39A08()
{
  return MEMORY[0x270F86690]();
}

uint64_t sub_234B39A18()
{
  return MEMORY[0x270F86698]();
}

uint64_t sub_234B39A28()
{
  return MEMORY[0x270F866A0]();
}

uint64_t sub_234B39A38()
{
  return MEMORY[0x270F866B8]();
}

uint64_t sub_234B39A48()
{
  return MEMORY[0x270F866C0]();
}

uint64_t sub_234B39A58()
{
  return MEMORY[0x270F866C8]();
}

uint64_t sub_234B39A68()
{
  return MEMORY[0x270F866D0]();
}

uint64_t sub_234B39A78()
{
  return MEMORY[0x270F866D8]();
}

uint64_t sub_234B39A88()
{
  return MEMORY[0x270F866E0]();
}

uint64_t sub_234B39A98()
{
  return MEMORY[0x270F866E8]();
}

uint64_t sub_234B39AA8()
{
  return MEMORY[0x270F866F0]();
}

uint64_t sub_234B39AB8()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_234B39AC8()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_234B39AD8()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_234B39AE8()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_234B39AF8()
{
  return MEMORY[0x270F00AC0]();
}

uint64_t sub_234B39B08()
{
  return MEMORY[0x270F00BC8]();
}

uint64_t sub_234B39B18()
{
  return MEMORY[0x270F00BD0]();
}

uint64_t sub_234B39B28()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_234B39B38()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_234B39B48()
{
  return MEMORY[0x270F00BF8]();
}

uint64_t sub_234B39B58()
{
  return MEMORY[0x270F00C00]();
}

uint64_t sub_234B39B68()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_234B39B78()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_234B39B88()
{
  return MEMORY[0x270F00D00]();
}

uint64_t sub_234B39B98()
{
  return MEMORY[0x270F00D08]();
}

uint64_t sub_234B39BA8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_234B39BB8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_234B39BC8()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_234B39BD8()
{
  return MEMORY[0x270F00E28]();
}

uint64_t sub_234B39BE8()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_234B39BF8()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_234B39C08()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_234B39C18()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_234B39C28()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_234B39C38()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_234B39C48()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_234B39C58()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_234B39C68()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_234B39C78()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_234B39C88()
{
  return MEMORY[0x270F00FE8]();
}

uint64_t sub_234B39C98()
{
  return MEMORY[0x270F00FF8]();
}

uint64_t sub_234B39CA8()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_234B39CB8()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_234B39CC8()
{
  return MEMORY[0x270F01198]();
}

uint64_t sub_234B39CD8()
{
  return MEMORY[0x270F011A0]();
}

uint64_t sub_234B39CE8()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_234B39CF8()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_234B39D08()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_234B39D18()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_234B39D28()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_234B39D38()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_234B39D48()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_234B39D58()
{
  return MEMORY[0x270F012E0]();
}

uint64_t sub_234B39D68()
{
  return MEMORY[0x270F012F0]();
}

uint64_t sub_234B39D78()
{
  return MEMORY[0x270F01300]();
}

uint64_t sub_234B39D88()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_234B39D98()
{
  return MEMORY[0x270F013D0]();
}

uint64_t sub_234B39DA8()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_234B39DB8()
{
  return MEMORY[0x270F01498]();
}

uint64_t sub_234B39DC8()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_234B39DD8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_234B39DE8()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_234B39DF8()
{
  return MEMORY[0x270F015E0]();
}

uint64_t sub_234B39E08()
{
  return MEMORY[0x270F015F8]();
}

uint64_t sub_234B39E18()
{
  return MEMORY[0x270F01608]();
}

uint64_t sub_234B39E28()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_234B39E38()
{
  return MEMORY[0x270F01640]();
}

uint64_t sub_234B39E48()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_234B39E58()
{
  return MEMORY[0x270F01650]();
}

uint64_t sub_234B39E68()
{
  return MEMORY[0x270F01688]();
}

uint64_t sub_234B39E78()
{
  return MEMORY[0x270F01690]();
}

uint64_t sub_234B39E88()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_234B39E98()
{
  return MEMORY[0x270F016C8]();
}

uint64_t sub_234B39EA8()
{
  return MEMORY[0x270F016D0]();
}

uint64_t sub_234B39EB8()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_234B39EC8()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_234B39ED8()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_234B39EF8()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_234B39F08()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_234B39F18()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_234B39F28()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_234B39F38()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_234B39F48()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_234B39F68()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_234B39F88()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_234B39F98()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_234B39FA8()
{
  return MEMORY[0x270F01878]();
}

uint64_t sub_234B39FB8()
{
  return MEMORY[0x270F01880]();
}

uint64_t sub_234B39FC8()
{
  return MEMORY[0x270F01888]();
}

uint64_t sub_234B39FD8()
{
  return MEMORY[0x270F01890]();
}

uint64_t sub_234B39FE8()
{
  return MEMORY[0x270F01898]();
}

uint64_t sub_234B39FF8()
{
  return MEMORY[0x270F018A0]();
}

uint64_t sub_234B3A008()
{
  return MEMORY[0x270F018F0]();
}

uint64_t sub_234B3A018()
{
  return MEMORY[0x270F019A8]();
}

uint64_t sub_234B3A028()
{
  return MEMORY[0x270F019B0]();
}

uint64_t sub_234B3A038()
{
  return MEMORY[0x270F019F8]();
}

uint64_t sub_234B3A048()
{
  return MEMORY[0x270F01A00]();
}

uint64_t sub_234B3A058()
{
  return MEMORY[0x270F01A28]();
}

uint64_t sub_234B3A068()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_234B3A078()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_234B3A088()
{
  return MEMORY[0x270F01A88]();
}

uint64_t sub_234B3A098()
{
  return MEMORY[0x270F01A90]();
}

uint64_t sub_234B3A0A8()
{
  return MEMORY[0x270F01B20]();
}

uint64_t sub_234B3A0B8()
{
  return MEMORY[0x270F01B30]();
}

uint64_t sub_234B3A0C8()
{
  return MEMORY[0x270F01B80]();
}

uint64_t sub_234B3A0D8()
{
  return MEMORY[0x270F01B88]();
}

uint64_t sub_234B3A0E8()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_234B3A0F8()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_234B3A108()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_234B3A118()
{
  return MEMORY[0x270F01C80]();
}

uint64_t sub_234B3A128()
{
  return MEMORY[0x270F01C88]();
}

uint64_t sub_234B3A138()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_234B3A148()
{
  return MEMORY[0x270F01E68]();
}

uint64_t sub_234B3A158()
{
  return MEMORY[0x270F01E78]();
}

uint64_t sub_234B3A168()
{
  return MEMORY[0x270F01F00]();
}

uint64_t sub_234B3A178()
{
  return MEMORY[0x270F01F10]();
}

uint64_t sub_234B3A188()
{
  return MEMORY[0x270F01F30]();
}

uint64_t sub_234B3A198()
{
  return MEMORY[0x270F01F40]();
}

uint64_t sub_234B3A1A8()
{
  return MEMORY[0x270F01F90]();
}

uint64_t sub_234B3A1B8()
{
  return MEMORY[0x270F02078]();
}

uint64_t sub_234B3A1C8()
{
  return MEMORY[0x270F020C0]();
}

uint64_t sub_234B3A1D8()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_234B3A1E8()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_234B3A1F8()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_234B3A208()
{
  return MEMORY[0x270F02138]();
}

uint64_t sub_234B3A218()
{
  return MEMORY[0x270F02140]();
}

uint64_t sub_234B3A228()
{
  return MEMORY[0x270F021E0]();
}

uint64_t sub_234B3A238()
{
  return MEMORY[0x270F021E8]();
}

uint64_t sub_234B3A248()
{
  return MEMORY[0x270F02260]();
}

uint64_t sub_234B3A258()
{
  return MEMORY[0x270F02278]();
}

uint64_t sub_234B3A268()
{
  return MEMORY[0x270F02280]();
}

uint64_t sub_234B3A278()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_234B3A288()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_234B3A298()
{
  return MEMORY[0x270F02390]();
}

uint64_t sub_234B3A2A8()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_234B3A2B8()
{
  return MEMORY[0x270F023B8]();
}

uint64_t sub_234B3A2C8()
{
  return MEMORY[0x270F023C0]();
}

uint64_t sub_234B3A2D8()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_234B3A2E8()
{
  return MEMORY[0x270F02420]();
}

uint64_t sub_234B3A2F8()
{
  return MEMORY[0x270F02438]();
}

uint64_t sub_234B3A308()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_234B3A318()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_234B3A328()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_234B3A348()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_234B3A358()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_234B3A368()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_234B3A388()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_234B3A398()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_234B3A3A8()
{
  return MEMORY[0x270F028E0]();
}

uint64_t sub_234B3A3B8()
{
  return MEMORY[0x270F028F8]();
}

uint64_t sub_234B3A3C8()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_234B3A3D8()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_234B3A3E8()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_234B3A3F8()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_234B3A408()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_234B3A418()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_234B3A428()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_234B3A438()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_234B3A448()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_234B3A458()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_234B3A468()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_234B3A478()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_234B3A488()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_234B3A498()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_234B3A4A8()
{
  return MEMORY[0x270F02BE8]();
}

uint64_t sub_234B3A4B8()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_234B3A4C8()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_234B3A4D8()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_234B3A4E8()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_234B3A4F8()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_234B3A508()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_234B3A518()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_234B3A528()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_234B3A538()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_234B3A548()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_234B3A558()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_234B3A568()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_234B3A578()
{
  return MEMORY[0x270F02DC0]();
}

uint64_t sub_234B3A588()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_234B3A598()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_234B3A5A8()
{
  return MEMORY[0x270F02E08]();
}

uint64_t sub_234B3A5B8()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_234B3A5C8()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_234B3A5D8()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_234B3A5E8()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_234B3A5F8()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_234B3A608()
{
  return MEMORY[0x270F03138]();
}

uint64_t sub_234B3A618()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_234B3A628()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_234B3A638()
{
  return MEMORY[0x270F07E80]();
}

uint64_t sub_234B3A648()
{
  return MEMORY[0x270F866F8]();
}

uint64_t sub_234B3A658()
{
  return MEMORY[0x270F86700]();
}

uint64_t sub_234B3A668()
{
  return MEMORY[0x270F86708]();
}

uint64_t sub_234B3A678()
{
  return MEMORY[0x270F86710]();
}

uint64_t sub_234B3A688()
{
  return MEMORY[0x270F86718]();
}

uint64_t sub_234B3A698()
{
  return MEMORY[0x270F86720]();
}

uint64_t sub_234B3A6A8()
{
  return MEMORY[0x270F86738]();
}

uint64_t sub_234B3A6B8()
{
  return MEMORY[0x270F86740]();
}

uint64_t sub_234B3A6C8()
{
  return MEMORY[0x270F86748]();
}

uint64_t sub_234B3A6D8()
{
  return MEMORY[0x270F86750]();
}

uint64_t sub_234B3A6E8()
{
  return MEMORY[0x270F86758]();
}

uint64_t sub_234B3A6F8()
{
  return MEMORY[0x270F86760]();
}

uint64_t sub_234B3A708()
{
  return MEMORY[0x270F86768]();
}

uint64_t sub_234B3A718()
{
  return MEMORY[0x270F86A78]();
}

uint64_t sub_234B3A728()
{
  return MEMORY[0x270F03290]();
}

uint64_t sub_234B3A738()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_234B3A748()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_234B3A758()
{
  return MEMORY[0x270F03318]();
}

uint64_t sub_234B3A768()
{
  return MEMORY[0x270F03378]();
}

uint64_t sub_234B3A778()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_234B3A788()
{
  return MEMORY[0x270F033D8]();
}

uint64_t sub_234B3A798()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_234B3A7A8()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_234B3A7B8()
{
  return MEMORY[0x270F03480]();
}

uint64_t sub_234B3A7C8()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_234B3A7D8()
{
  return MEMORY[0x270F03500]();
}

uint64_t sub_234B3A7E8()
{
  return MEMORY[0x270F03548]();
}

uint64_t sub_234B3A7F8()
{
  return MEMORY[0x270F03580]();
}

uint64_t sub_234B3A808()
{
  return MEMORY[0x270F03590]();
}

uint64_t sub_234B3A818()
{
  return MEMORY[0x270F035C0]();
}

uint64_t sub_234B3A828()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_234B3A838()
{
  return MEMORY[0x270F03660]();
}

uint64_t sub_234B3A848()
{
  return MEMORY[0x270F03690]();
}

uint64_t sub_234B3A858()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_234B3A868()
{
  return MEMORY[0x270F03728]();
}

uint64_t sub_234B3A878()
{
  return MEMORY[0x270F03780]();
}

uint64_t sub_234B3A888()
{
  return MEMORY[0x270F037A0]();
}

uint64_t sub_234B3A898()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_234B3A8A8()
{
  return MEMORY[0x270F03920]();
}

uint64_t sub_234B3A8B8()
{
  return MEMORY[0x270F03938]();
}

uint64_t sub_234B3A8C8()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_234B3A8D8()
{
  return MEMORY[0x270F039D8]();
}

uint64_t sub_234B3A8E8()
{
  return MEMORY[0x270F03A88]();
}

uint64_t sub_234B3A8F8()
{
  return MEMORY[0x270F03AE0]();
}

uint64_t sub_234B3A908()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_234B3A918()
{
  return MEMORY[0x270F03B70]();
}

uint64_t sub_234B3A928()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_234B3A938()
{
  return MEMORY[0x270F03C58]();
}

uint64_t sub_234B3A948()
{
  return MEMORY[0x270F03CA8]();
}

uint64_t sub_234B3A958()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_234B3A968()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_234B3A978()
{
  return MEMORY[0x270F03D48]();
}

uint64_t sub_234B3A988()
{
  return MEMORY[0x270F03E10]();
}

uint64_t sub_234B3A998()
{
  return MEMORY[0x270F03E18]();
}

uint64_t sub_234B3A9A8()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_234B3A9B8()
{
  return MEMORY[0x270F03E80]();
}

uint64_t sub_234B3A9C8()
{
  return MEMORY[0x270F03EA0]();
}

uint64_t sub_234B3A9D8()
{
  return MEMORY[0x270F03F10]();
}

uint64_t sub_234B3A9E8()
{
  return MEMORY[0x270F03F70]();
}

uint64_t sub_234B3A9F8()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_234B3AA08()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_234B3AA18()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_234B3AA28()
{
  return MEMORY[0x270F04010]();
}

uint64_t sub_234B3AA38()
{
  return MEMORY[0x270F04038]();
}

uint64_t sub_234B3AA48()
{
  return MEMORY[0x270F04058]();
}

uint64_t sub_234B3AA58()
{
  return MEMORY[0x270F04060]();
}

uint64_t sub_234B3AA68()
{
  return MEMORY[0x270F04070]();
}

uint64_t sub_234B3AA78()
{
  return MEMORY[0x270F04080]();
}

uint64_t sub_234B3AA88()
{
  return MEMORY[0x270F04088]();
}

uint64_t sub_234B3AA98()
{
  return MEMORY[0x270F040A8]();
}

uint64_t sub_234B3AAA8()
{
  return MEMORY[0x270F040D8]();
}

uint64_t sub_234B3AAB8()
{
  return MEMORY[0x270F040E0]();
}

uint64_t sub_234B3AAC8()
{
  return MEMORY[0x270F040F8]();
}

uint64_t sub_234B3AAD8()
{
  return MEMORY[0x270F04100]();
}

uint64_t sub_234B3AAE8()
{
  return MEMORY[0x270F04108]();
}

uint64_t sub_234B3AAF8()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_234B3AB08()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_234B3AB18()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_234B3AB28()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_234B3AB38()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_234B3AB48()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_234B3AB58()
{
  return MEMORY[0x270F041A8]();
}

uint64_t sub_234B3AB68()
{
  return MEMORY[0x270F041B0]();
}

uint64_t sub_234B3AB78()
{
  return MEMORY[0x270F04218]();
}

uint64_t sub_234B3AB88()
{
  return MEMORY[0x270F04240]();
}

uint64_t sub_234B3AB98()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_234B3ABA8()
{
  return MEMORY[0x270F04290]();
}

uint64_t sub_234B3ABB8()
{
  return MEMORY[0x270F042A8]();
}

uint64_t sub_234B3ABC8()
{
  return MEMORY[0x270F86770]();
}

uint64_t sub_234B3ABD8()
{
  return MEMORY[0x270F04360]();
}

uint64_t sub_234B3ABE8()
{
  return MEMORY[0x270F04368]();
}

uint64_t sub_234B3ABF8()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_234B3AC08()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_234B3AC18()
{
  return MEMORY[0x270F86A80]();
}

uint64_t sub_234B3AC28()
{
  return MEMORY[0x270F043C0]();
}

uint64_t sub_234B3AC38()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_234B3AC48()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_234B3AC58()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_234B3AC68()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_234B3AC78()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_234B3AC88()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_234B3AC98()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_234B3ACA8()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_234B3ACB8()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_234B3ACC8()
{
  return MEMORY[0x270F04588]();
}

uint64_t sub_234B3ACD8()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_234B3ACE8()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_234B3ACF8()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_234B3AD08()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_234B3AD18()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_234B3AD28()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_234B3AD38()
{
  return MEMORY[0x270F86A88]();
}

uint64_t sub_234B3AD48()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_234B3AD58()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_234B3AD68()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_234B3AD78()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_234B3AD88()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_234B3AD98()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_234B3ADA8()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_234B3ADB8()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_234B3ADC8()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_234B3ADD8()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_234B3ADE8()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_234B3ADF8()
{
  return MEMORY[0x270F04868]();
}

uint64_t sub_234B3AE08()
{
  return MEMORY[0x270F04870]();
}

uint64_t sub_234B3AE18()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_234B3AE28()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_234B3AE38()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_234B3AE48()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_234B3AE58()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_234B3AE68()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_234B3AE78()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_234B3AE88()
{
  return MEMORY[0x270F04978]();
}

uint64_t sub_234B3AE98()
{
  return MEMORY[0x270F049A8]();
}

uint64_t sub_234B3AEA8()
{
  return MEMORY[0x270F04A18]();
}

uint64_t sub_234B3AEB8()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_234B3AEC8()
{
  return MEMORY[0x270F04AD0]();
}

uint64_t sub_234B3AED8()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_234B3AEE8()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_234B3AEF8()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_234B3AF08()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_234B3AF18()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_234B3AF28()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_234B3AF38()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_234B3AF48()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_234B3AF58()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_234B3AF68()
{
  return MEMORY[0x270F86778]();
}

uint64_t sub_234B3AF78()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_234B3AF88()
{
  return MEMORY[0x270F04B70]();
}

uint64_t sub_234B3AF98()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_234B3AFA8()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_234B3AFB8()
{
  return MEMORY[0x270F04BD8]();
}

uint64_t sub_234B3AFC8()
{
  return MEMORY[0x270F04BE8]();
}

uint64_t sub_234B3AFD8()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_234B3AFE8()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_234B3AFF8()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_234B3B008()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_234B3B018()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_234B3B028()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_234B3B038()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_234B3B048()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_234B3B058()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_234B3B068()
{
  return MEMORY[0x270F04D80]();
}

uint64_t sub_234B3B078()
{
  return MEMORY[0x270F04D88]();
}

uint64_t sub_234B3B088()
{
  return MEMORY[0x270F04DD8]();
}

uint64_t sub_234B3B098()
{
  return MEMORY[0x270F04E58]();
}

uint64_t sub_234B3B0A8()
{
  return MEMORY[0x270F04E60]();
}

uint64_t sub_234B3B0B8()
{
  return MEMORY[0x270F04E78]();
}

uint64_t sub_234B3B0C8()
{
  return MEMORY[0x270F04E98]();
}

uint64_t sub_234B3B0D8()
{
  return MEMORY[0x270F04F20]();
}

uint64_t sub_234B3B0E8()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_234B3B0F8()
{
  return MEMORY[0x270F05020]();
}

uint64_t sub_234B3B108()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_234B3B118()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_234B3B128()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_234B3B138()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_234B3B148()
{
  return MEMORY[0x270F050E8]();
}

uint64_t sub_234B3B158()
{
  return MEMORY[0x270F050F8]();
}

uint64_t sub_234B3B168()
{
  return MEMORY[0x270F05110]();
}

uint64_t sub_234B3B178()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_234B3B188()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_234B3B198()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_234B3B1A8()
{
  return MEMORY[0x270F051C8]();
}

uint64_t sub_234B3B1B8()
{
  return MEMORY[0x270F051D0]();
}

uint64_t sub_234B3B1C8()
{
  return MEMORY[0x270F052D0]();
}

uint64_t sub_234B3B1D8()
{
  return MEMORY[0x270F052F0]();
}

uint64_t sub_234B3B1E8()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_234B3B1F8()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_234B3B208()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_234B3B218()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_234B3B228()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_234B3B238()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_234B3B248()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_234B3B258()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_234B3B268()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_234B3B278()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_234B3B288()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_234B3B298()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_234B3B2A8()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_234B3B2B8()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_234B3B2C8()
{
  return MEMORY[0x270EFA388]();
}

uint64_t sub_234B3B2D8()
{
  return MEMORY[0x270EFA398]();
}

uint64_t sub_234B3B2E8()
{
  return MEMORY[0x270EFA3A0]();
}

uint64_t sub_234B3B2F8()
{
  return MEMORY[0x270EFA3B8]();
}

uint64_t sub_234B3B308()
{
  return MEMORY[0x270EFA3C0]();
}

uint64_t sub_234B3B318()
{
  return MEMORY[0x270EFA3D0]();
}

uint64_t sub_234B3B328()
{
  return MEMORY[0x270EFA3E0]();
}

uint64_t sub_234B3B338()
{
  return MEMORY[0x270EFA3F8]();
}

uint64_t sub_234B3B348()
{
  return MEMORY[0x270EFA438]();
}

uint64_t sub_234B3B358()
{
  return MEMORY[0x270EFA440]();
}

uint64_t sub_234B3B368()
{
  return MEMORY[0x270EFA458]();
}

uint64_t sub_234B3B378()
{
  return MEMORY[0x270EFA4B8]();
}

uint64_t sub_234B3B388()
{
  return MEMORY[0x270EFA4F0]();
}

uint64_t sub_234B3B398()
{
  return MEMORY[0x270EFA4F8]();
}

uint64_t sub_234B3B3A8()
{
  return MEMORY[0x270EFA500]();
}

uint64_t sub_234B3B3B8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_234B3B3C8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_234B3B3D8()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_234B3B3E8()
{
  return MEMORY[0x270F9D190]();
}

uint64_t sub_234B3B3F8()
{
  return MEMORY[0x270F9D1C0]();
}

uint64_t sub_234B3B408()
{
  return MEMORY[0x270F9D1C8]();
}

uint64_t sub_234B3B418()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_234B3B428()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_234B3B438()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_234B3B448()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_234B3B458()
{
  return MEMORY[0x270F9D428]();
}

uint64_t sub_234B3B468()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_234B3B478()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_234B3B488()
{
  return MEMORY[0x270F053E0]();
}

uint64_t sub_234B3B498()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_234B3B4A8()
{
  return MEMORY[0x270EE1EF0]();
}

uint64_t sub_234B3B4B8()
{
  return MEMORY[0x270EF18C0]();
}

uint64_t sub_234B3B4C8()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_234B3B4D8()
{
  return MEMORY[0x270EF18D8]();
}

uint64_t sub_234B3B4E8()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_234B3B4F8()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_234B3B508()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_234B3B518()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_234B3B528()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_234B3B538()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_234B3B548()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_234B3B558()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_234B3B568()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_234B3B578()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_234B3B588()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_234B3B598()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_234B3B5A8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_234B3B5B8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_234B3B5C8()
{
  return MEMORY[0x270F860D8]();
}

uint64_t sub_234B3B5D8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_234B3B5E8()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_234B3B5F8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_234B3B608()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_234B3B618()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_234B3B628()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_234B3B638()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_234B3B648()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_234B3B658()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_234B3B668()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_234B3B678()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_234B3B688()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_234B3B698()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_234B3B6A8()
{
  return MEMORY[0x270F9D910]();
}

uint64_t sub_234B3B6B8()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_234B3B6C8()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_234B3B6D8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_234B3B6E8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_234B3B6F8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_234B3B708()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_234B3B718()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_234B3B728()
{
  return MEMORY[0x270F9DBA8]();
}

uint64_t sub_234B3B738()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_234B3B748()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_234B3B758()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_234B3B768()
{
  return MEMORY[0x270F9DC08]();
}

uint64_t sub_234B3B778()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_234B3B788()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_234B3B798()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_234B3B7A8()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_234B3B7B8()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_234B3B7C8()
{
  return MEMORY[0x270F9DC90]();
}

uint64_t sub_234B3B7D8()
{
  return MEMORY[0x270F9DC98]();
}

uint64_t sub_234B3B7E8()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_234B3B7F8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_234B3B808()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_234B3B818()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_234B3B828()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_234B3B838()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_234B3B848()
{
  return MEMORY[0x270FA1E48]();
}

uint64_t sub_234B3B868()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_234B3B878()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_234B3B888()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_234B3B898()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_234B3B8A8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_234B3B8B8()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_234B3B8C8()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_234B3B8D8()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_234B3B8E8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_234B3B8F8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_234B3B908()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_234B3B918()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_234B3B928()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_234B3B938()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_234B3B948()
{
  return MEMORY[0x270F9E070]();
}

uint64_t sub_234B3B958()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_234B3B968()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_234B3B978()
{
  return MEMORY[0x270F9E0C0]();
}

uint64_t sub_234B3B988()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_234B3B998()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_234B3B9A8()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_234B3B9B8()
{
  return MEMORY[0x270F9E0F0]();
}

uint64_t sub_234B3B9C8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_234B3B9D8()
{
  return MEMORY[0x270F053F0]();
}

uint64_t sub_234B3B9E8()
{
  return MEMORY[0x270F9E320]();
}

uint64_t sub_234B3B9F8()
{
  return MEMORY[0x270F847E8]();
}

uint64_t sub_234B3BA08()
{
  return MEMORY[0x270F860E8]();
}

uint64_t sub_234B3BA18()
{
  return MEMORY[0x270F860F0]();
}

uint64_t sub_234B3BA28()
{
  return MEMORY[0x270F86788]();
}

uint64_t sub_234B3BA38()
{
  return MEMORY[0x270EF1E70]();
}

uint64_t sub_234B3BA48()
{
  return MEMORY[0x270EF1F00]();
}

uint64_t sub_234B3BA58()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_234B3BA68()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_234B3BA78()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_234B3BA88()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_234B3BA98()
{
  return MEMORY[0x270EF1F08]();
}

uint64_t sub_234B3BAA8()
{
  return MEMORY[0x270EF1F10]();
}

uint64_t sub_234B3BAB8()
{
  return MEMORY[0x270EFA298]();
}

uint64_t sub_234B3BAC8()
{
  return MEMORY[0x270EFA2A0]();
}

uint64_t sub_234B3BAD8()
{
  return MEMORY[0x270F86798]();
}

uint64_t sub_234B3BAE8()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_234B3BAF8()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_234B3BB08()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_234B3BB18()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_234B3BB28()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_234B3BB38()
{
  return MEMORY[0x270F18690]();
}

uint64_t sub_234B3BB48()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_234B3BB58()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_234B3BB68()
{
  return MEMORY[0x270F867A0]();
}

uint64_t sub_234B3BB78()
{
  return MEMORY[0x270F867A8]();
}

uint64_t sub_234B3BB88()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_234B3BB98()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_234B3BBA8()
{
  return MEMORY[0x270EFA510]();
}

uint64_t sub_234B3BBB8()
{
  return MEMORY[0x270EFA518]();
}

uint64_t sub_234B3BBC8()
{
  return MEMORY[0x270EFA520]();
}

uint64_t sub_234B3BBD8()
{
  return MEMORY[0x270F867B0]();
}

uint64_t sub_234B3BBE8()
{
  return MEMORY[0x270F86190]();
}

uint64_t sub_234B3BBF8()
{
  return MEMORY[0x270F86198]();
}

uint64_t sub_234B3BC08()
{
  return MEMORY[0x270F861A0]();
}

uint64_t sub_234B3BC18()
{
  return MEMORY[0x270F861A8]();
}

uint64_t sub_234B3BC28()
{
  return MEMORY[0x270F861B0]();
}

uint64_t sub_234B3BC38()
{
  return MEMORY[0x270F861B8]();
}

uint64_t sub_234B3BC48()
{
  return MEMORY[0x270F861C0]();
}

uint64_t sub_234B3BC58()
{
  return MEMORY[0x270F861C8]();
}

uint64_t sub_234B3BC68()
{
  return MEMORY[0x270F861D0]();
}

uint64_t sub_234B3BC78()
{
  return MEMORY[0x270F828E0]();
}

uint64_t sub_234B3BC88()
{
  return MEMORY[0x270EF2150]();
}

uint64_t sub_234B3BC98()
{
  return MEMORY[0x270EF2160]();
}

uint64_t sub_234B3BCA8()
{
  return MEMORY[0x270F86AB0]();
}

uint64_t sub_234B3BCB8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_234B3BCC8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_234B3BCD8()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_234B3BCE8()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_234B3BCF8()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_234B3BD18()
{
  return MEMORY[0x270F861F8]();
}

uint64_t sub_234B3BD28()
{
  return MEMORY[0x270F86208]();
}

uint64_t sub_234B3BD38()
{
  return MEMORY[0x270F86210]();
}

uint64_t sub_234B3BD48()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_234B3BD58()
{
  return MEMORY[0x270EF2310]();
}

uint64_t sub_234B3BD68()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_234B3BD78()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_234B3BD88()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_234B3BD98()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_234B3BDA8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_234B3BDB8()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_234B3BDC8()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_234B3BDD8()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_234B3BDE8()
{
  return MEMORY[0x270EF24F0]();
}

uint64_t sub_234B3BDF8()
{
  return MEMORY[0x270EF24F8]();
}

uint64_t sub_234B3BE08()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_234B3BE18()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_234B3BE28()
{
  return MEMORY[0x270F9E740]();
}

uint64_t sub_234B3BE38()
{
  return MEMORY[0x270F9E760]();
}

uint64_t sub_234B3BE48()
{
  return MEMORY[0x270F9E798]();
}

uint64_t sub_234B3BE68()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_234B3BE78()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_234B3BE88()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_234B3BE98()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_234B3BEA8()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_234B3BEB8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_234B3BEC8()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_234B3BED8()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_234B3BEE8()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_234B3BEF8()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_234B3BF08()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_234B3BF18()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_234B3BF28()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_234B3BF38()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_234B3BF48()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_234B3BF58()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_234B3BF68()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_234B3BF78()
{
  return MEMORY[0x270F9E8D8]();
}

uint64_t sub_234B3BF88()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_234B3BF98()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_234B3BFA8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_234B3BFB8()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_234B3BFC8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_234B3BFD8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_234B3BFE8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_234B3BFF8()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_234B3C008()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_234B3C018()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_234B3C028()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_234B3C038()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_234B3C058()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_234B3C068()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_234B3C078()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_234B3C088()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_234B3C098()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_234B3C0A8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_234B3C0B8()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_234B3C0C8()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_234B3C0D8()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_234B3C0E8()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_234B3C0F8()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_234B3C108()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_234B3C118()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_234B3C128()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_234B3C138()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_234B3C148()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_234B3C158()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_234B3C168()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_234B3C178()
{
  return MEMORY[0x270F9F038]();
}

uint64_t sub_234B3C188()
{
  return MEMORY[0x270F9F040]();
}

uint64_t sub_234B3C198()
{
  return MEMORY[0x270F9F048]();
}

uint64_t sub_234B3C1A8()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_234B3C1B8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_234B3C1C8()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_234B3C1D8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_234B3C1E8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_234B3C1F8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_234B3C208()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_234B3C228()
{
  return MEMORY[0x270F9F228]();
}

uint64_t sub_234B3C238()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_234B3C248()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_234B3C258()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_234B3C278()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_234B3C288()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_234B3C298()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_234B3C2A8()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_234B3C2B8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_234B3C2C8()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_234B3C2D8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_234B3C2E8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_234B3C2F8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_234B3C308()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_234B3C318()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_234B3C328()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_234B3C338()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_234B3C348()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_234B3C358()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_234B3C368()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_234B3C378()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_234B3C388()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t sub_234B3C398()
{
  return MEMORY[0x270FA0128]();
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x270EE2200](inFileURL, outSystemSoundID);
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return MEMORY[0x270EE2210](*(void *)&inSystemSoundID);
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x270F10828]();
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB970](retstr, t, sx, sy, sz);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B88](red, green, blue, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextEOClip(CGContextRef c)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x270EE67F0](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

BOOL CGImageGetShouldInterpolate(CGImageRef image)
{
  return MEMORY[0x270EE6848](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x270EE6888](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7060](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CNContactPropertyKeyFromWFContactPropertyID()
{
  return MEMORY[0x270F18698]();
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  MEMORY[0x270EF58A8]((__n128)mapPoint, *(__n128 *)&mapPoint.y);
  result.longitude = v2;
  result.latitude = v1;
  return result;
}

MKCoordinateRegion MKCoordinateRegionForMapRect(MKMapRect rect)
{
  MEMORY[0x270EF58B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.span.longitudeDelta = v4;
  result.span.latitudeDelta = v3;
  result.center.longitude = v2;
  result.center.latitude = v1;
  return result;
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  MEMORY[0x270EF58B8]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MEMORY[0x270EF58C8]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

double MKMapPointsPerMeterAtLatitude(CLLocationDegrees latitude)
{
  MEMORY[0x270EF58D0](latitude);
  return result;
}

MKMapRect MKMapRectUnion(MKMapRect rect1, MKMapRect rect2)
{
  MEMORY[0x270EF5928]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F82C80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

uint64_t VCIsInternalBuild()
{
  return MEMORY[0x270F84820]();
}

uint64_t WFActionIsFavorite()
{
  return MEMORY[0x270F86228]();
}

uint64_t WFActionSetFavorite()
{
  return MEMORY[0x270F86230]();
}

uint64_t WFAutocapitalizationTypeFromString()
{
  return MEMORY[0x270F867C0]();
}

uint64_t WFAutocorrectionTypeFromString()
{
  return MEMORY[0x270F867C8]();
}

uint64_t WFBooleanLocalizedDescriptionForHMCharacteristic()
{
  return MEMORY[0x270F86248]();
}

uint64_t WFCGColorPerceivedLightness()
{
  return MEMORY[0x270F86AB8]();
}

uint64_t WFCLLocationManagerAuthorizationStatusForWorkflowEnvironment()
{
  return MEMORY[0x270F86260]();
}

uint64_t WFCLLocationManagerWithOptions()
{
  return MEMORY[0x270F86268]();
}

uint64_t WFCNContactAuthorizationStatus()
{
  return MEMORY[0x270F186C8]();
}

uint64_t WFCNContactIsAuthorizedToAccessContact()
{
  return MEMORY[0x270F186D0]();
}

uint64_t WFContactFromCNContactProperty()
{
  return MEMORY[0x270F186E0]();
}

uint64_t WFConvertEdgeInsetsToRTLIfNeeded()
{
  return MEMORY[0x270F867D8]();
}

uint64_t WFDateFormattingGetLocalizedDefaultCustomDateFormat()
{
  return MEMORY[0x270F186F8]();
}

uint64_t WFExecutionPlatformForDeviceIdiom()
{
  return MEMORY[0x270F86288]();
}

uint64_t WFHMCharacteristicIsBooleanFormat()
{
  return MEMORY[0x270F86298]();
}

uint64_t WFKeyboardTypeFromString()
{
  return MEMORY[0x270F867E8]();
}

uint64_t WFPostAccessibilityAnnouncement()
{
  return MEMORY[0x270F867F0]();
}

uint64_t WFPredicateForEnablingPerson()
{
  return MEMORY[0x270F187D8]();
}

uint64_t WFPredicateForSelectionOfPerson()
{
  return MEMORY[0x270F187E0]();
}

uint64_t WFSerializableHomeIdentifier()
{
  return MEMORY[0x270F862D0]();
}

uint64_t WFShouldReverseLayoutDirection()
{
  return MEMORY[0x270F84878]();
}

uint64_t WFSmallVariableTitleFont()
{
  return MEMORY[0x270F86800]();
}

uint64_t WFSupportedCharacteristicsForHMService()
{
  return MEMORY[0x270F862E8]();
}

uint64_t WFTextAlignmentFromString()
{
  return MEMORY[0x270F86808]();
}

uint64_t WFTextContentTypeFromString()
{
  return MEMORY[0x270F86810]();
}

uint64_t WFUserInterfaceFromViewController()
{
  return MEMORY[0x270F86818]();
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

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x270EE55A0]();
}

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x270F83020]();
}

uint64_t _UIUpdateRequestDeactivate()
{
  return MEMORY[0x270F83028]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _availability_version_check()
{
  return MEMORY[0x270ED7F40]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

uint64_t getWFEditorLogObject()
{
  return MEMORY[0x270F848F0]();
}

uint64_t getWFGeneralLogObject()
{
  return MEMORY[0x270F84900]();
}

uint64_t getWFTriggersLogObject()
{
  return MEMORY[0x270F84928]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

void rewind(FILE *a1)
{
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x270F9AAF0](lhs, rhs);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastMetatypeUnconditional()
{
  return MEMORY[0x270FA0280]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x270FA02A0]();
}

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x270FA02A8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x270FA03D8]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x270FA2468]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x270FA05C0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x270FA05C8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x270FA0610]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x270FA0618]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x270FA0620]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}