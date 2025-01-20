uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

BOOL sub_24014EEA0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24014EEB8()
{
  return sub_240165580();
}

uint64_t sub_24014EF04()
{
  return sub_240165570();
}

uint64_t sub_24014EF38()
{
  return sub_240165580();
}

void *sub_24014EF80@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result) {
    char v2 = 2;
  }
  else {
    char v2 = 1;
  }
  if (*result == 1) {
    char v3 = 0;
  }
  else {
    char v3 = v2;
  }
  *a2 = v3;
  return result;
}

void sub_24014EFA0(void *a1@<X8>)
{
  *a1 = (*v1 & 1) == 0;
}

uint64_t sub_24014EFB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_240164C00();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t MetricTemplateView.init(dragRefresh:)@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v34 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83728);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83730);
  uint64_t v5 = *(void *)(v33 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_240164BE0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v14 = (char *)&v33 - v13;
  uint64_t v35 = sub_240164EC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83738);
  sub_240165260();
  uint64_t v15 = v37;
  *(void *)(a2 + 8) = v36;
  *(void *)(a2 + 16) = v15;
  v16 = (int *)type metadata accessor for MetricTemplateView(0);
  sub_240164BD0();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  sub_240165260();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  uint64_t v17 = v16[7];
  *(void *)(a2 + v17) = _s6People19MessagePersonStatusV0A2UIE14iconForeground05SwiftE05ColorVvg_0();
  uint64_t v18 = v16[8];
  *(void *)(a2 + v18) = sub_2401651C0();
  uint64_t v19 = v16[9];
  sub_24014F4A4();
  sub_240164E00();
  sub_240164B80();
  (*(void (**)(char *, void))(v5 + 8))(v7, v33);
  id v20 = objc_msgSend(self, sel_mainRunLoop);
  uint64_t v21 = sub_240165470();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v4, 1, 1, v21);
  uint64_t v22 = sub_240165460();

  sub_240158744((uint64_t)v4, &qword_268C83728);
  uint64_t v36 = v22;
  sub_240165450();
  sub_240158128(&qword_268C83748, MEMORY[0x263F07CE8]);
  uint64_t v23 = sub_240165010();
  swift_release();
  *(void *)(a2 + v19) = v23;
  uint64_t v24 = v16[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83750);
  uint64_t v25 = swift_allocObject();
  long long v33 = xmmword_240165A90;
  *(_OWORD *)(v25 + 16) = xmmword_240165A90;
  *(void *)(v25 + 32) = sub_240164DE0();
  *(void *)(v25 + 40) = v26;
  *(void *)(v25 + 48) = sub_240164DF0();
  *(void *)(v25 + 56) = v27;
  *(void *)(a2 + v24) = v25;
  uint64_t v28 = v16[11];
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = v33;
  *(void *)(v29 + 32) = sub_240164E90();
  *(void *)(v29 + 40) = v30;
  uint64_t result = sub_240164EA0();
  *(void *)(v29 + 48) = result;
  *(void *)(v29 + 56) = v32;
  *(void *)(a2 + v28) = v29;
  *(unsigned char *)a2 = v34;
  return result;
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

uint64_t type metadata accessor for MetricTemplateView(uint64_t a1)
{
  return sub_240157FD0(a1, (uint64_t *)&unk_268C83798);
}

unint64_t sub_24014F4A4()
{
  unint64_t result = qword_268C83740;
  if (!qword_268C83740)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C83740);
  }
  return result;
}

uint64_t sub_24014F4E4()
{
  uint64_t v48 = sub_240164C90();
  uint64_t v41 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  v44 = (char *)&v37 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83890);
  MEMORY[0x270FA5388](v1 - 8);
  v47 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_240164BE0();
  uint64_t v39 = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v50 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v37 - v7;
  uint64_t v9 = sub_240164CA0();
  uint64_t v38 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v37 - v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83930);
  uint64_t v16 = *(void *)(v4 + 72);
  uint64_t v17 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v18 = v4;
  uint64_t v40 = v4;
  uint64_t v19 = (v17 + 32) & ~v17;
  uint64_t v45 = v16;
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_240165A90;
  uint64_t v46 = v20;
  uint64_t v21 = v20 + v19;
  sub_240164C80();
  sub_240164BD0();
  uint64_t v43 = v21;
  sub_240164C50();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v18 + 8);
  v22(v8, v3);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v10 + 8);
  v23(v15, v9);
  v49 = v13;
  sub_240164C80();
  sub_240164C80();
  uint64_t v24 = v41;
  uint64_t v25 = v44;
  uint64_t v26 = v48;
  (*(void (**)(char *, void, uint64_t))(v41 + 104))(v44, *MEMORY[0x263F07870], v48);
  sub_240164BD0();
  uint64_t v27 = (uint64_t)v47;
  sub_240164C70();
  uint64_t v28 = v8;
  uint64_t v29 = v39;
  v42 = v22;
  v22(v28, v39);
  uint64_t v30 = v24;
  uint64_t v31 = v38;
  uint64_t v32 = v26;
  uint64_t v33 = v40;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v25, v32);
  v23(v15, v31);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v27, 1, v29) == 1)
  {
    int v34 = v50;
    sub_240164BD0();
    sub_240158744(v27, &qword_268C83890);
  }
  else
  {
    int v34 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 32))(v50, v27, v29);
  }
  uint64_t v35 = v49;
  sub_240164C50();
  v42(v34, v29);
  v23(v35, v31);
  return v46;
}

uint64_t sub_24014F948()
{
  uint64_t v79 = sub_240164CA0();
  uint64_t v73 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  v78 = (char *)&v72 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for ActionPoint(0);
  uint64_t v89 = *(void *)(v2 - 8);
  uint64_t v90 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v77 = (uint64_t)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v74 = (char *)&v72 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v87 = (char *)&v72 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v96 = (uint64_t)&v72 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83890);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_240164BE0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v95 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v94 = (char *)&v72 - v17;
  uint64_t v18 = type metadata accessor for MetricTemplateView(0);
  uint64_t v19 = *(int *)(v18 + 40);
  uint64_t v98 = v0;
  uint64_t v20 = *(void *)(v0 + v19);
  uint64_t v21 = MEMORY[0x263F8EE78];
  uint64_t v80 = *(void *)(v20 + 16);
  if (v80)
  {
    uint64_t v75 = v20 + 32;
    uint64_t v22 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
    uint64_t v76 = *(int *)(v18 + 44);
    v93 = (unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
    v85 = (void (**)(char *, char *, uint64_t))(v14 + 32);
    v84 = (void (**)(char *, char *, uint64_t))(v14 + 16);
    v91 = (void (**)(char *, uint64_t))(v14 + 8);
    uint64_t v72 = v20;
    swift_bridgeObjectRetain_n();
    uint64_t v23 = 0;
    unint64_t v24 = MEMORY[0x263F8EE78];
    uint64_t v92 = MEMORY[0x263F8EE58] + 8;
    v86 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
    v83 = v12;
    while (1)
    {
      uint64_t v25 = *(void *)(v98 + v76);
      uint64_t v26 = *(void *)(v25 + 16);
      if (v26) {
        break;
      }
LABEL_4:
      if (++v23 == v80)
      {
        unint64_t v57 = v24;
        swift_bridgeObjectRelease_n();
        unint64_t v58 = v57;
        uint64_t v59 = (uint64_t)v74;
        uint64_t v21 = MEMORY[0x263F8EE78];
        goto LABEL_24;
      }
    }
    unint64_t v97 = v24;
    uint64_t v82 = v23;
    uint64_t v27 = (uint64_t *)(v75 + 16 * v23);
    uint64_t v29 = *v27;
    uint64_t v28 = v27[1];
    swift_bridgeObjectRetain_n();
    uint64_t v100 = v28;
    uint64_t v30 = v29;
    swift_bridgeObjectRetain();
    uint64_t v81 = v25;
    uint64_t v31 = v25 + 40;
    uint64_t v88 = v29;
    while (1)
    {
      uint64_t v32 = *(void *)(v31 - 8);
      swift_bridgeObjectRetain();
      uint64_t v99 = v32;
      uint64_t v33 = sub_240164E80();
      uint64_t v35 = v34;
      unint64_t v36 = *(void *)(v98 + 16);
      uint64_t v101 = *(void *)(v98 + 8);
      unint64_t v102 = v36;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C837E0);
      sub_240165270();
      uint64_t v37 = v103;
      if (*(void *)(v103 + 16) && (unint64_t v38 = sub_24015EC54(v33, v35), (v39 & 1) != 0))
      {
        sub_240158548(*(void *)(v37 + 56) + 32 * v38, (uint64_t)&v104);
      }
      else
      {
        long long v104 = 0u;
        long long v105 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((void *)&v105 + 1))
      {
        int v40 = swift_dynamicCast();
        (*v22)(v12, v40 ^ 1u, 1, v13);
        if ((*v93)(v12, 1, v13) != 1)
        {
          uint64_t v41 = v94;
          (*v85)(v94, v12, v13);
          v42 = *v84;
          (*v84)(v95, v41, v13);
          uint64_t v43 = v13;
          uint64_t v44 = v100;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v45 = (uint64_t)v87;
          sub_240164BF0();
          uint64_t v46 = v90;
          v47 = (void *)(v45 + *(int *)(v90 + 20));
          void *v47 = v30;
          v47[1] = v44;
          uint64_t v13 = v43;
          uint64_t v48 = v95;
          v42((char *)(v45 + *(int *)(v46 + 24)), v95, v13);
          uint64_t v49 = sub_240165340();
          uint64_t v51 = v50;
          swift_bridgeObjectRelease();
          *(void *)&long long v104 = v49;
          *((void *)&v104 + 1) = v51;
          uint64_t v101 = 0x656E696C656D6974;
          unint64_t v102 = 0xE800000000000000;
          sub_2401584D4();
          LOBYTE(v49) = sub_2401654A0();
          v52 = *v91;
          (*v91)(v48, v13);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *(unsigned char *)(v45 + *(int *)(v46 + 28)) = (v49 & 1) == 0;
          sub_240158678(v45, v96, type metadata accessor for ActionPoint);
          if (swift_isUniquelyReferenced_nonNull_native()) {
            unint64_t v53 = v97;
          }
          else {
            unint64_t v53 = sub_24015ACB8(0, *(void *)(v97 + 16) + 1, 1, v97);
          }
          unint64_t v55 = *(void *)(v53 + 16);
          unint64_t v54 = *(void *)(v53 + 24);
          uint64_t v22 = v86;
          uint64_t v12 = v83;
          if (v55 >= v54 >> 1) {
            unint64_t v53 = sub_24015ACB8(v54 > 1, v55 + 1, 1, v53);
          }
          *(void *)(v53 + 16) = v55 + 1;
          unint64_t v56 = (*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80);
          unint64_t v97 = v53;
          sub_240158678(v96, v53 + v56 + *(void *)(v89 + 72) * v55, type metadata accessor for ActionPoint);
          v52(v94, v13);
          uint64_t v30 = v88;
          goto LABEL_9;
        }
      }
      else
      {
        sub_240158744((uint64_t)&v104, &qword_268C83898);
        (*v22)(v12, 1, 1, v13);
      }
      sub_240158744((uint64_t)v12, &qword_268C83890);
LABEL_9:
      v31 += 16;
      swift_bridgeObjectRelease();
      if (!--v26)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        unint64_t v24 = v97;
        uint64_t v23 = v82;
        goto LABEL_4;
      }
    }
  }
  unint64_t v58 = MEMORY[0x263F8EE78];
  uint64_t v59 = (uint64_t)v74;
LABEL_24:
  *(void *)&long long v104 = v21;
  uint64_t v60 = *(void *)(v58 + 16);
  uint64_t v61 = v58;
  uint64_t result = swift_bridgeObjectRetain();
  if (v60)
  {
    unint64_t v63 = 0;
    v64 = (void (**)(char *, uint64_t))(v73 + 8);
    while (v63 < *(void *)(result + 16))
    {
      unint64_t v65 = (*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80);
      uint64_t v66 = *(void *)(v89 + 72);
      sub_240158610(result + v65 + v66 * v63, v59, type metadata accessor for ActionPoint);
      v67 = v78;
      sub_240164C80();
      char v68 = sub_240164C60();
      (*v64)(v67, v79);
      if (v68)
      {
        sub_240158678(v59, v77, type metadata accessor for ActionPoint);
        uint64_t v69 = v104;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24015E7CC(0, *(void *)(v69 + 16) + 1, 1);
          uint64_t v69 = v104;
        }
        unint64_t v71 = *(void *)(v69 + 16);
        unint64_t v70 = *(void *)(v69 + 24);
        if (v71 >= v70 >> 1)
        {
          sub_24015E7CC(v70 > 1, v71 + 1, 1);
          uint64_t v69 = v104;
        }
        *(void *)(v69 + 16) = v71 + 1;
        sub_240158678(v77, v69 + v65 + v71 * v66, type metadata accessor for ActionPoint);
        uint64_t v59 = (uint64_t)v74;
      }
      else
      {
        sub_2401587E4(v59, type metadata accessor for ActionPoint);
      }
      ++v63;
      uint64_t result = v61;
      if (v60 == v63) {
        goto LABEL_35;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_35:
    swift_bridgeObjectRelease_n();
    uint64_t result = v104;
    if (!*(void *)(v104 + 16))
    {
      swift_release();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2401502B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_240164CA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v77 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_240164BE0();
  uint64_t v5 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v82 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SignalPoint(0);
  uint64_t v85 = *(void *)(v7 - 8);
  uint64_t v86 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v76 = (uint64_t)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v60 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v60 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83928);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_240164EE0();
  uint64_t v18 = *(void *)(v79 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v79);
  uint64_t v72 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x263F8EE78];
  uint64_t v92 = MEMORY[0x263F8EE78];
  uint64_t v22 = MEMORY[0x2455DFC20](v19);
  uint64_t v23 = *(void *)(v22 + 16);
  uint64_t v73 = v12;
  uint64_t v78 = v23;
  if (v23)
  {
    uint64_t v61 = v3;
    uint64_t v74 = v22 + 32;
    uint64_t v75 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    unint64_t v71 = (unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    uint64_t v66 = (void (**)(char *, char *, uint64_t))(v18 + 32);
    uint64_t v81 = v5 + 16;
    uint64_t v62 = v5;
    uint64_t v80 = (void (**)(char *, uint64_t))(v5 + 8);
    unint64_t v65 = (void (**)(char *, uint64_t))(v18 + 8);
    uint64_t v60 = v22;
    swift_bridgeObjectRetain();
    uint64_t v24 = 0;
    uint64_t v70 = MEMORY[0x263F8EE58] + 8;
    v67 = v17;
    uint64_t v64 = v2;
    uint64_t v63 = v1;
    while (1)
    {
      uint64_t v25 = (uint64_t *)(v74 + 16 * v24);
      uint64_t v27 = *v25;
      uint64_t v26 = v25[1];
      uint64_t v28 = *(void *)(v1 + 16);
      uint64_t v87 = *(void *)(v1 + 8);
      uint64_t v88 = v28;
      swift_bridgeObjectRetain_n();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C837E0);
      sub_240165270();
      uint64_t v29 = v89;
      uint64_t v30 = *(void *)(v89 + 16);
      uint64_t v84 = v27;
      if (v30 && (unint64_t v31 = sub_24015EC54(v27, v26), (v32 & 1) != 0))
      {
        sub_240158548(*(void *)(v29 + 56) + 32 * v31, (uint64_t)&v90);
      }
      else
      {
        long long v90 = 0u;
        long long v91 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((void *)&v91 + 1))
      {
        uint64_t v33 = v79;
        int v34 = swift_dynamicCast();
        (*v75)(v17, v34 ^ 1u, 1, v33);
        if ((*v71)(v17, 1, v33) != 1)
        {
          (*v66)(v72, v17, v79);
          uint64_t v35 = sub_240164ED0();
          int64_t v36 = *(void *)(v35 + 16);
          if (v36)
          {
            uint64_t v69 = v24;
            *(void *)&long long v90 = v21;
            sub_24015E808(0, v36, 0);
            unint64_t v37 = (*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
            uint64_t v68 = v35;
            unint64_t v38 = v35 + v37;
            uint64_t v39 = *(void *)(v62 + 72);
            int v40 = *(void (**)(char *, unint64_t, uint64_t))(v62 + 16);
            do
            {
              v42 = v82;
              uint64_t v41 = v83;
              v40(v82, v38, v83);
              uint64_t v43 = v86;
              v40(&v14[*(int *)(v86 + 24)], (unint64_t)v42, v41);
              swift_bridgeObjectRetain();
              sub_240164BF0();
              uint64_t v44 = &v14[*(int *)(v43 + 20)];
              *(void *)uint64_t v44 = v84;
              *((void *)v44 + 1) = v26;
              (*v80)(v42, v41);
              uint64_t v45 = v90;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_24015E808(0, *(void *)(v45 + 16) + 1, 1);
                uint64_t v45 = v90;
              }
              unint64_t v47 = *(void *)(v45 + 16);
              unint64_t v46 = *(void *)(v45 + 24);
              if (v47 >= v46 >> 1)
              {
                sub_24015E808(v46 > 1, v47 + 1, 1);
                uint64_t v45 = v90;
              }
              *(void *)(v45 + 16) = v47 + 1;
              sub_240158678((uint64_t)v14, v45+ ((*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80))+ *(void *)(v85 + 72) * v47, type metadata accessor for SignalPoint);
              v38 += v39;
              --v36;
            }
            while (v36);
            swift_bridgeObjectRelease();
            uint64_t v2 = v64;
            uint64_t v12 = v73;
            uint64_t v1 = v63;
            uint64_t v21 = MEMORY[0x263F8EE78];
            uint64_t v24 = v69;
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v45 = v21;
            uint64_t v12 = v73;
          }
          sub_240150B94(v45);
          (*v65)(v72, v79);
          uint64_t v17 = v67;
          goto LABEL_5;
        }
      }
      else
      {
        sub_240158744((uint64_t)&v90, &qword_268C83898);
        (*v75)(v17, 1, 1, v79);
      }
      sub_240158744((uint64_t)v17, &qword_268C83928);
LABEL_5:
      ++v24;
      swift_bridgeObjectRelease();
      if (v24 == v78)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v48 = v92;
        uint64_t v3 = v61;
        goto LABEL_24;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v48 = MEMORY[0x263F8EE78];
LABEL_24:
  *(void *)&long long v90 = v21;
  uint64_t v49 = *(void *)(v48 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  if (v49)
  {
    unint64_t v51 = 0;
    v52 = (void (**)(char *, uint64_t))(v3 + 8);
    while (v51 < *(void *)(v48 + 16))
    {
      unint64_t v53 = (*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80);
      uint64_t v54 = *(void *)(v85 + 72);
      sub_240158610(v48 + v53 + v54 * v51, (uint64_t)v12, type metadata accessor for SignalPoint);
      unint64_t v55 = v77;
      sub_240164C80();
      char v56 = sub_240164C60();
      (*v52)(v55, v2);
      if (v56)
      {
        sub_240158678((uint64_t)v12, v76, type metadata accessor for SignalPoint);
        uint64_t v57 = v90;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24015E808(0, *(void *)(v57 + 16) + 1, 1);
          uint64_t v57 = v90;
        }
        unint64_t v59 = *(void *)(v57 + 16);
        unint64_t v58 = *(void *)(v57 + 24);
        if (v59 >= v58 >> 1)
        {
          sub_24015E808(v58 > 1, v59 + 1, 1);
          uint64_t v57 = v90;
        }
        *(void *)(v57 + 16) = v59 + 1;
        uint64_t result = sub_240158678(v76, v57 + v53 + v59 * v54, type metadata accessor for SignalPoint);
        uint64_t v12 = v73;
      }
      else
      {
        uint64_t result = sub_2401587E4((uint64_t)v12, type metadata accessor for SignalPoint);
      }
      if (v49 == ++v51)
      {
        uint64_t v21 = v90;
        goto LABEL_36;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_36:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!*(void *)(v21 + 16))
    {
      swift_release();
      return 0;
    }
    return v21;
  }
  return result;
}

uint64_t sub_240150B94(uint64_t a1)
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
  unint64_t v3 = sub_24015ACDC(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(type metadata accessor for SignalPoint(0) - 8);
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
    unint64_t *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_240165510();
  __break(1u);
  return result;
}

uint64_t sub_240150D44()
{
  uint64_t v11 = 0;
  unint64_t v12 = 0xE000000000000000;
  uint64_t v1 = MEMORY[0x2455DFC20]();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    unint64_t v3 = (uint64_t *)(v1 + 40);
    do
    {
      uint64_t v4 = *v3;
      v10[0] = *(v3 - 1);
      v10[1] = v4;
      sub_240150E40(v10, v0, (uint64_t)&v11);
      v3 += 2;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    uint64_t v6 = v11;
    unint64_t v5 = v12;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  uint64_t v7 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0) {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_240165360();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0x2064657461647055;
  }
  return v8;
}

uint64_t sub_240150E40(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v54 = a3;
  uint64_t v69 = sub_240164CA0();
  uint64_t v62 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v68 = (char *)v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83890);
  MEMORY[0x270FA5388](v7 - 8);
  unint64_t v71 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_240164BE0();
  uint64_t v9 = *(void *)(v65 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v65);
  v67 = (char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v66 = (char *)v49 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83928);
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v15 = (char *)v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_240164EE0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *a1;
  uint64_t v20 = a1[1];
  uint64_t v22 = *(void *)(a2 + 16);
  uint64_t v72 = *(void *)(a2 + 8);
  uint64_t v73 = v22;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C837E0);
  sub_240165270();
  uint64_t v23 = v76;
  uint64_t v24 = *(void *)(v76 + 16);
  uint64_t v70 = v21;
  uint64_t v56 = v20;
  if (v24 && (unint64_t v25 = sub_24015EC54(v21, v20), (v26 & 1) != 0))
  {
    sub_240158548(*(void *)(v23 + 56) + 32 * v25, (uint64_t)&v74);
  }
  else
  {
    long long v74 = 0u;
    long long v75 = 0u;
  }
  uint64_t v27 = v65;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v75 + 1))
  {
    sub_240158744((uint64_t)&v74, &qword_268C83898);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
    return sub_240158744((uint64_t)v15, &qword_268C83928);
  }
  int v28 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v15, v28 ^ 1u, 1, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1) {
    return sub_240158744((uint64_t)v15, &qword_268C83928);
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  uint64_t result = sub_240164ED0();
  uint64_t v30 = result;
  *(void *)&long long v74 = MEMORY[0x263F8EE78];
  uint64_t v64 = *(void *)(result + 16);
  uint64_t v53 = v3;
  uint64_t v52 = v16;
  uint64_t v51 = v17;
  uint64_t v50 = v19;
  if (v64)
  {
    unint64_t v31 = 0;
    uint64_t v63 = v9 + 16;
    uint64_t v61 = v9 + 48;
    char v32 = (void (**)(char *, uint64_t, uint64_t))(v9 + 32);
    unint64_t v58 = (void (**)(char *, uint64_t))(v62 + 8);
    unint64_t v55 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
    uint64_t v62 = v9 + 56;
    v49[1] = (v9 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v33 = v70;
    uint64_t v34 = (uint64_t)v71;
    uint64_t v59 = result;
    uint64_t v60 = v9;
    while (v31 < *(void *)(v30 + 16))
    {
      unint64_t v35 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      uint64_t v36 = *(void *)(v9 + 72);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v9 + 16))(v34, v30 + v35 + v36 * v31, v27);
      uint64_t v57 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      v57(v34, 0, 1, v27);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v34, 1, v27) == 1) {
        goto LABEL_23;
      }
      uint64_t v37 = v34;
      unint64_t v38 = *v32;
      uint64_t v39 = v32;
      int v40 = v66;
      v38(v66, v37, v27);
      uint64_t v41 = v68;
      sub_240164C80();
      uint64_t v42 = v27;
      char v43 = sub_240164C60();
      (*v58)(v41, v69);
      if (v43)
      {
        v38(v67, (uint64_t)v40, v42);
        uint64_t v44 = v74;
        char v32 = v39;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24015E844(0, *(void *)(v44 + 16) + 1, 1);
          uint64_t v44 = v74;
        }
        unint64_t v46 = *(void *)(v44 + 16);
        unint64_t v45 = *(void *)(v44 + 24);
        if (v46 >= v45 >> 1)
        {
          sub_24015E844(v45 > 1, v46 + 1, 1);
          uint64_t v44 = v74;
        }
        *(void *)(v44 + 16) = v46 + 1;
        uint64_t v27 = v65;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v38)(v44 + v35 + v46 * v36, v67, v65);
        *(void *)&long long v74 = v44;
        uint64_t v34 = (uint64_t)v71;
      }
      else
      {
        uint64_t result = (*v55)(v40, v42);
        uint64_t v27 = v42;
        uint64_t v34 = (uint64_t)v71;
        char v32 = v39;
      }
      ++v31;
      uint64_t v30 = v59;
      uint64_t v9 = v60;
      uint64_t v33 = v70;
      if (v64 == v31)
      {
        v57(v34, 1, 1, v27);
        goto LABEL_23;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t v33 = v70;
    uint64_t v34 = (uint64_t)v71;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v71, 1, 1, v27);
LABEL_23:
    swift_bridgeObjectRelease();
    sub_240158744(v34, &qword_268C83890);
    uint64_t v47 = v74;
    if (*(void *)(v74 + 16))
    {
      *(void *)&long long v74 = v33;
      *((void *)&v74 + 1) = v56;
      swift_bridgeObjectRetain();
      sub_240165390();
      uint64_t v48 = *(void *)(v47 + 16);
      swift_release();
      uint64_t v72 = v48;
      sub_240165530();
      sub_240165390();
      swift_bridgeObjectRelease();
      sub_240165390();
      sub_240165390();
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v50, v52);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v52);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_2401515DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83890);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_240164BE0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2401586E0(a1, (uint64_t)v4, &qword_268C83890);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_240158744((uint64_t)v4, &qword_268C83890);
    return 0x6E776F6E6B6E55;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
    objc_msgSend(v10, sel_setTimeStyle_, 2);
    objc_msgSend(v10, sel_setDateStyle_, 1);
    uint64_t v11 = (void *)sub_240164BC0();
    id v12 = objc_msgSend(v10, sel_stringFromDate_, v11);

    uint64_t v9 = sub_240165320();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9;
}

uint64_t sub_240151800()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83890);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_240164E80();
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v0 + 16);
  v16[1] = *(void *)(v0 + 8);
  v16[2] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C837E0);
  sub_240165270();
  uint64_t v8 = v17;
  if (*(void *)(v17 + 16) && (unint64_t v9 = sub_24015EC54(v4, v6), (v10 & 1) != 0))
  {
    sub_240158548(*(void *)(v8 + 56) + 32 * v9, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v19 + 1))
  {
    uint64_t v11 = sub_240164BE0();
    int v12 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v3, v12 ^ 1u, 1, v11);
  }
  else
  {
    sub_240158744((uint64_t)&v18, &qword_268C83898);
    uint64_t v13 = sub_240164BE0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v3, 1, 1, v13);
  }
  uint64_t v14 = sub_2401515DC((uint64_t)v3);
  sub_240158744((uint64_t)v3, &qword_268C83890);
  return v14;
}

unint64_t sub_2401519F4()
{
  return 0xD000000000000017;
}

uint64_t sub_240151D70(void (*a1)(void), void (*a2)(void))
{
  a1();
  a2();
  uint64_t v4 = sub_240164E80();
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v2 + 16);
  *(void *)&long long v12 = *(void *)(v2 + 8);
  *((void *)&v12 + 1) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C837E0);
  sub_240165270();
  if (*(void *)(v11 + 16) && (unint64_t v8 = sub_24015EC54(v4, v6), (v9 & 1) != 0))
  {
    sub_240158548(*(void *)(v11 + 56) + 32 * v8, (uint64_t)&v12);
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v13 + 1))
  {
    if (swift_dynamicCast()) {
      return v11;
    }
  }
  else
  {
    sub_240158744((uint64_t)&v12, &qword_268C83898);
  }
  return 0;
}

uint64_t sub_240151EA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v2 = type metadata accessor for MetricTemplateView(0);
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C837E8);
  uint64_t v6 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  unint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83770);
  MEMORY[0x270FA5388](v27);
  char v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C837F0);
  sub_2401587A0(&qword_268C837F8, &qword_268C837F0);
  sub_2401650A0();
  uint64_t v11 = *(int *)(v3 + 44);
  uint64_t v23 = (uint64_t)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = v1;
  uint64_t v12 = *(void *)(v1 + v11);
  sub_240158610(v1, v23, type metadata accessor for MetricTemplateView);
  unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v14 = swift_allocObject();
  sub_240158678((uint64_t)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13, type metadata accessor for MetricTemplateView);
  uint64_t v15 = v25;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v8, v25);
  uint64_t v16 = v27;
  *(void *)&v10[*(int *)(v27 + 52)] = v12;
  uint64_t v17 = (uint64_t (**)(uint64_t))&v10[*(int *)(v16 + 56)];
  *uint64_t v17 = sub_2401582CC;
  v17[1] = (uint64_t (*)(uint64_t))v14;
  long long v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  swift_retain();
  v18(v8, v15);
  uint64_t v19 = v23;
  sub_240158610(v24, v23, type metadata accessor for MetricTemplateView);
  uint64_t v20 = swift_allocObject();
  sub_240158678(v19, v20 + v13, type metadata accessor for MetricTemplateView);
  sub_2401587A0(&qword_268C83778, &qword_268C83770);
  sub_240165150();
  swift_release();
  return sub_240158744((uint64_t)v10, &qword_268C83770);
}

uint64_t sub_24015220C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83810);
  uint64_t v66 = *(void *)(v64 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v64);
  uint64_t v61 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v45 - v5;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83818);
  uint64_t v65 = *(void *)(v60 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v60);
  uint64_t v59 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v45 - v9;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83820);
  uint64_t v58 = *(void *)(v57 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v57);
  uint64_t v63 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v45 - v13;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83828);
  uint64_t v55 = *(void *)(v56 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v56);
  uint64_t v62 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v54 = (char *)&v45 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v53 = (char *)&v45 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v45 - v21;
  uint64_t v71 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83830);
  sub_2401587A0(&qword_268C83838, &qword_268C83830);
  uint64_t v51 = v22;
  sub_2401652A0();
  uint64_t v70 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83840);
  sub_24015841C();
  uint64_t v50 = v14;
  sub_2401652A0();
  uint64_t v69 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83860);
  sub_2401587A0(&qword_268C83868, &qword_268C83860);
  uint64_t v49 = v10;
  sub_2401652A0();
  uint64_t v68 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83870);
  sub_2401587A0(&qword_268C83878, &qword_268C83870);
  uint64_t v48 = v6;
  sub_2401652A0();
  uint64_t v67 = a1;
  uint64_t v23 = v53;
  sub_2401652A0();
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  uint64_t v25 = v54;
  v24(v54, v22, v56);
  uint64_t v26 = (void (*)(uint64_t, char *, uint64_t))v24;
  uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
  uint64_t v27 = v57;
  v47(v63, v14, v57);
  unint64_t v46 = *(void (**)(char *, char *, uint64_t))(v65 + 16);
  uint64_t v28 = v59;
  v46(v59, v10, v60);
  unint64_t v45 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
  v45(v61, v6, v64);
  uint64_t v29 = v23;
  uint64_t v30 = v56;
  v24(v62, v29, v56);
  unint64_t v31 = v52;
  v24(v52, v25, v30);
  char v32 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268C83880);
  v47(&v31[v32[12]], v63, v27);
  uint64_t v33 = v28;
  uint64_t v34 = v60;
  v46(&v31[v32[16]], v33, v60);
  unint64_t v35 = v61;
  uint64_t v36 = v64;
  v45(&v31[v32[20]], v61, v64);
  v26((uint64_t)&v31[v32[24]], v62, v30);
  uint64_t v37 = *(void (**)(char *, uint64_t))(v55 + 8);
  uint64_t v38 = v30;
  v37(v53, v30);
  uint64_t v39 = *(void (**)(char *, uint64_t))(v66 + 8);
  v66 += 8;
  v39(v48, v36);
  int v40 = *(void (**)(char *, uint64_t))(v65 + 8);
  v65 += 8;
  uint64_t v41 = v34;
  v40(v49, v34);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v58 + 8);
  uint64_t v43 = v57;
  v42(v50, v57);
  v37(v51, v38);
  v37(v62, v38);
  v39(v35, v64);
  v40(v59, v41);
  v42(v63, v43);
  return ((uint64_t (*)(char *, uint64_t))v37)(v54, v38);
}

uint64_t sub_240152A04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83890);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2401650C0();
  uint64_t v27 = v6;
  uint64_t v28 = v5;
  uint64_t v29 = v7;
  HIDWORD(v26) = v8 & 1;
  type metadata accessor for MetricTemplateView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83788);
  sub_240165270();
  uint64_t v9 = sub_240164BE0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 0, 1, v9);
  sub_2401515DC((uint64_t)v4);
  sub_240158744((uint64_t)v4, &qword_268C83890);
  uint64_t v30 = 0x203A646564616F4CLL;
  unint64_t v31 = 0xE800000000000000;
  sub_240165390();
  swift_bridgeObjectRelease();
  sub_2401584D4();
  uint64_t v10 = sub_2401650F0();
  uint64_t v12 = v11;
  LOBYTE(v4) = v13 & 1;
  sub_240165060();
  uint64_t v14 = sub_2401650D0();
  uint64_t v16 = v15;
  char v18 = v17;
  uint64_t v20 = v19;
  swift_release();
  v18 &= 1u;
  sub_240158528(v10, v12, (char)v4);
  swift_bridgeObjectRelease();
  char v21 = BYTE4(v26);
  LOBYTE(v30) = BYTE4(v26);
  uint64_t v23 = v27;
  uint64_t v22 = v28;
  *(void *)a1 = v28;
  *(void *)(a1 + 8) = v23;
  *(unsigned char *)(a1 + 16) = v21;
  *(void *)(a1 + 24) = v29;
  *(void *)(a1 + 32) = v14;
  *(void *)(a1 + 40) = v16;
  *(unsigned char *)(a1 + 48) = v18;
  *(void *)(a1 + 56) = v20;
  uint64_t v24 = v22;
  sub_240158538(v22, v23, v21);
  swift_bridgeObjectRetain();
  sub_240158538(v14, v16, v18);
  swift_bridgeObjectRetain();
  sub_240158528(v14, v16, v18);
  swift_bridgeObjectRelease();
  sub_240158528(v24, v23, v30);
  return swift_bridgeObjectRelease();
}

uint64_t sub_240152C8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83858);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C839A0);
  sub_24015884C();
  sub_240164D00();
  sub_2401652B0();
  sub_240165020();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 16))(a2, v7, v4);
  char v8 = (_OWORD *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268C83840) + 36));
  long long v9 = v20;
  v8[4] = v19;
  v8[5] = v9;
  v8[6] = v21;
  long long v10 = v16;
  *char v8 = v15;
  v8[1] = v10;
  long long v11 = v18;
  v8[2] = v17;
  v8[3] = v11;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_240152E44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v80 = a1;
  uint64_t v95 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C839B0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  v94 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v87 = (char *)&v75 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v84 = (char *)&v75 - v8;
  MEMORY[0x270FA5388](v7);
  v106 = (char *)&v75 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83938);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  long long v90 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v85 = (char *)&v75 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v81 = (char *)&v75 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v105 = sub_240164D30();
  uint64_t v107 = *(void *)(v105 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v105);
  long long v91 = (char *)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v86 = (char *)&v75 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v82 = (void (*)(void))((char *)&v75 - v22);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v75 - v23;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C839B8);
  uint64_t v102 = *(void *)(v25 - 8);
  uint64_t v103 = v25;
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  v93 = (char *)&v75 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v92 = (char *)&v75 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v101 = (char *)&v75 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v100 = (char *)&v75 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v88 = (char *)&v75 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v89 = (char *)&v75 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  uint64_t v83 = (char *)&v75 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  uint64_t v99 = (char *)&v75 - v41;
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  uint64_t v79 = (char *)&v75 - v43;
  uint64_t v44 = MEMORY[0x270FA5388](v42);
  uint64_t v98 = (char *)&v75 - v45;
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  uint64_t v48 = (char *)&v75 - v47;
  MEMORY[0x270FA5388](v46);
  unint64_t v97 = (char *)&v75 - v49;
  sub_240165030();
  uint64_t v108 = 0xD000000000000010;
  unint64_t v109 = 0x8000000240166580;
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240165030();
  long long v75 = (void (*)(void))MEMORY[0x263F5D1B8];
  uint64_t v78 = (void (*)(void))MEMORY[0x263F5D228];
  uint64_t v50 = v80;
  uint64_t v108 = sub_240151D70(MEMORY[0x263F5D1B8], MEMORY[0x263F5D228]);
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240164D20();
  uint64_t v51 = type metadata accessor for MetricTemplateView(0);
  uint64_t v77 = *(int *)(v51 + 28);
  uint64_t v108 = *(void *)(v50 + v77);
  uint64_t v52 = v105;
  sub_240164CE0();
  uint64_t v96 = *(void (**)(char *, uint64_t))(v107 + 8);
  v107 += 8;
  v96(v24, v52);
  long long v104 = *(void (**)(char *, char *, uint64_t))(v102 + 32);
  v106 = (char *)(v102 + 32);
  v104(v97, v48, v103);
  sub_240165030();
  uint64_t v108 = 0xD000000000000011;
  unint64_t v109 = 0x80000002401665A0;
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240165030();
  uint64_t v76 = (void (*)(void))MEMORY[0x263F5D230];
  uint64_t v108 = sub_240151D70(v75, MEMORY[0x263F5D230]);
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v53 = v82;
  sub_240164D20();
  uint64_t v84 = (char *)*(int *)(v51 + 32);
  uint64_t v108 = *(void *)&v84[v50];
  uint64_t v54 = v79;
  uint64_t v55 = v105;
  sub_240164CE0();
  uint64_t v56 = v96;
  v96((char *)v53, v55);
  v104(v98, v54, v103);
  sub_240165030();
  uint64_t v108 = 0xD000000000000012;
  unint64_t v109 = 0x80000002401665C0;
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240165030();
  uint64_t v82 = (void (*)(void))MEMORY[0x263F5D1C0];
  uint64_t v108 = sub_240151D70(MEMORY[0x263F5D1C0], v78);
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v57 = v86;
  sub_240164D20();
  uint64_t v108 = *(void *)(v50 + v77);
  uint64_t v58 = v83;
  uint64_t v59 = v105;
  sub_240164CE0();
  v56(v57, v59);
  uint64_t v60 = v103;
  v104(v99, v58, v103);
  sub_240165030();
  uint64_t v108 = 0xD000000000000013;
  unint64_t v109 = 0x80000002401665E0;
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240165030();
  uint64_t v108 = sub_240151D70(v82, v76);
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v61 = v91;
  sub_240164D20();
  uint64_t v108 = *(void *)&v84[v50];
  uint64_t v62 = v88;
  sub_240164CE0();
  v96(v61, v59);
  uint64_t v63 = v89;
  v104(v89, v62, v60);
  uint64_t v64 = v102;
  uint64_t v65 = *(void (**)(char *, char *, uint64_t))(v102 + 16);
  uint64_t v66 = v100;
  uint64_t v67 = v97;
  v65(v100, v97, v60);
  uint64_t v108 = (uint64_t)v66;
  uint64_t v68 = v101;
  uint64_t v69 = v98;
  v65(v101, v98, v60);
  unint64_t v109 = (unint64_t)v68;
  uint64_t v70 = v92;
  uint64_t v71 = v99;
  v65(v92, v99, v60);
  v110 = v70;
  uint64_t v72 = v93;
  v65(v93, v63, v60);
  v111 = v72;
  sub_240153BD4(&v108, v95);
  uint64_t v73 = *(void (**)(char *, uint64_t))(v64 + 8);
  v73(v63, v60);
  v73(v71, v60);
  v73(v69, v60);
  v73(v67, v60);
  v73(v72, v60);
  v73(v70, v60);
  v73(v101, v60);
  return ((uint64_t (*)(char *, uint64_t))v73)(v100, v60);
}

uint64_t sub_240153BD4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C839C0);
  uint64_t v4 = (int *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C839B8);
  sub_240164D30();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(char *, void, uint64_t))(v8 + 16);
  v9(v6, *a1, v7);
  uint64_t v10 = &v6[v4[14]];
  v9(v10, a1[1], v7);
  uint64_t v11 = &v6[v4[18]];
  v9(v11, a1[2], v7);
  uint64_t v12 = &v6[v4[22]];
  v9(v12, a1[3], v7);
  uint64_t v13 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  uint64_t v14 = v17;
  v13(v17, v6, v7);
  v13(v14 + v4[14], v10, v7);
  v13(v14 + v4[18], v11, v7);
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v13)(v14 + v4[22], v12, v7);
}

uint64_t sub_240153DA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v84 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C838A8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v69 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83948);
  uint64_t v4 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  uint64_t v6 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83950);
  uint64_t v7 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v9 = (char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83958);
  uint64_t v73 = *(void *)(v83 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v83);
  uint64_t v12 = (char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v69 - v13;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83960);
  MEMORY[0x270FA5388](v74);
  uint64_t v16 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83968);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v82 = (uint64_t)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v81 = (char *)&v69 - v20;
  uint64_t v21 = sub_2401650C0();
  uint64_t v78 = v22;
  uint64_t v79 = v21;
  int v76 = v23;
  uint64_t v80 = v24;
  uint64_t v25 = sub_24014F948();
  if (v25)
  {
    uint64_t v85 = v25;
    uint64_t v71 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C83980);
    uint64_t v72 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C838F0);
    sub_2401587A0(&qword_268C83988, &qword_268C83980);
    uint64_t v86 = sub_240164D50();
    uint64_t v87 = MEMORY[0x263F8D310];
    uint64_t v88 = MEMORY[0x263EFCD88];
    unint64_t v89 = MEMORY[0x263EFCE58];
    swift_getOpaqueTypeConformance2();
    uint64_t v26 = v6;
    sub_240158128(&qword_268C83990, (void (*)(uint64_t))type metadata accessor for ActionPoint);
    sub_240164D10();
    uint64_t v86 = sub_24014F4E4();
    uint64_t v27 = sub_240164D60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v3, 1, 1, v27);
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83910);
    uint64_t v29 = sub_2401587A0(&qword_268C83970, &qword_268C83948);
    unint64_t v30 = sub_2401585A4();
    uint64_t v70 = v12;
    uint64_t v31 = v73;
    uint64_t v32 = v16;
    uint64_t v33 = v9;
    uint64_t v34 = v75;
    sub_240165110();
    sub_240158744((uint64_t)v3, &qword_268C838A8);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v26, v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C83998);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_240165A90;
    *(void *)(v35 + 32) = sub_240164DE0();
    *(void *)(v35 + 40) = v36;
    *(void *)(v35 + 48) = _s6People22MissedCallPersonStatusV0A2UIE14iconForeground05SwiftF05ColorVvg_0();
    *(void *)(v35 + 56) = sub_240164DF0();
    *(void *)(v35 + 64) = v37;
    *(void *)(v35 + 72) = sub_240165200();
    uint64_t v86 = v34;
    uint64_t v87 = v28;
    uint64_t v88 = v29;
    unint64_t v89 = v30;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v39 = v70;
    uint64_t v40 = v77;
    uint64_t v41 = MEMORY[0x263F8D310];
    uint64_t v42 = MEMORY[0x263EFCE58];
    sub_240165120();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v33, v40);
    uint64_t v43 = v72;
    uint64_t v44 = v83;
    (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v72, v39, v83);
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v32, v43, v44);
    swift_storeEnumTagMultiPayload();
    uint64_t v86 = v40;
    uint64_t v87 = v41;
    uint64_t v88 = MEMORY[0x263F1B440];
    unint64_t v89 = OpaqueTypeConformance2;
    uint64_t v90 = v42;
    uint64_t v91 = MEMORY[0x263F1B420];
    swift_getOpaqueTypeConformance2();
    uint64_t v45 = (uint64_t)v81;
    sub_240165040();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v43, v44);
  }
  else
  {
    sub_240165030();
    uint64_t v46 = sub_2401650E0();
    uint64_t v48 = v47;
    char v50 = v49 & 1;
    _s6People22MissedCallPersonStatusV0A2UIE12iconFontSize05SwiftF00H0Vvg_0();
    uint64_t v51 = sub_2401650D0();
    uint64_t v53 = v52;
    char v55 = v54;
    uint64_t v57 = v56;
    swift_release();
    sub_240158528(v46, v48, v50);
    swift_bridgeObjectRelease();
    *(void *)uint64_t v16 = v51;
    *((void *)v16 + 1) = v53;
    v16[16] = v55 & 1;
    *((void *)v16 + 3) = v57;
    swift_storeEnumTagMultiPayload();
    uint64_t v58 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C83910);
    uint64_t v59 = sub_2401587A0(&qword_268C83970, &qword_268C83948);
    unint64_t v60 = sub_2401585A4();
    uint64_t v86 = v75;
    uint64_t v87 = v58;
    uint64_t v88 = v59;
    unint64_t v89 = v60;
    uint64_t v61 = swift_getOpaqueTypeConformance2();
    uint64_t v86 = v77;
    uint64_t v87 = MEMORY[0x263F8D310];
    uint64_t v88 = MEMORY[0x263F1B440];
    unint64_t v89 = v61;
    uint64_t v90 = MEMORY[0x263EFCE58];
    uint64_t v91 = MEMORY[0x263F1B420];
    swift_getOpaqueTypeConformance2();
    uint64_t v45 = (uint64_t)v81;
    sub_240165040();
  }
  char v62 = v76 & 1;
  uint64_t v63 = v82;
  sub_2401586E0(v45, v82, &qword_268C83968);
  uint64_t v64 = v84;
  uint64_t v66 = v78;
  uint64_t v65 = v79;
  *uint64_t v84 = v79;
  v64[1] = v66;
  *((unsigned char *)v64 + 16) = v62;
  v64[3] = v80;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83978);
  sub_2401586E0(v63, (uint64_t)v64 + *(int *)(v67 + 48), &qword_268C83968);
  sub_240158538(v65, v66, v62);
  swift_bridgeObjectRetain();
  sub_240158744(v45, &qword_268C83968);
  sub_240158744(v63, &qword_268C83968);
  sub_240158528(v65, v66, v62);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2401546F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83938);
  uint64_t v28 = *(void *)(v3 - 8);
  uint64_t v29 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v27 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v21[2] = (char *)v21 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83940);
  MEMORY[0x270FA5388](v7 - 8);
  v21[1] = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_240164D50();
  uint64_t v26 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C838F0);
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v22 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240165030();
  uint64_t v12 = type metadata accessor for ActionPoint(0);
  sub_240164BE0();
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240165030();
  uint64_t v13 = 0x656E696C656D6954;
  if (*(unsigned char *)(a1 + *(int *)(v12 + 28)))
  {
    uint64_t v13 = 0x74736575716552;
    unint64_t v14 = 0xE700000000000000;
  }
  else
  {
    unint64_t v14 = 0xE800000000000000;
  }
  uint64_t v31 = v13;
  unint64_t v32 = v14;
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240164D40();
  sub_240165030();
  uint64_t v15 = (uint64_t *)(a1 + *(int *)(v12 + 20));
  unint64_t v16 = v15[1];
  uint64_t v31 = *v15;
  unint64_t v32 = v16;
  swift_bridgeObjectRetain();
  uint64_t v17 = v27;
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v18 = v22;
  uint64_t v19 = v24;
  sub_240164CD0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v29);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v19);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v23 + 32))(v30, v18, v25);
}

uint64_t sub_240154B48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C838A0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C838A8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C838B0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C838B8);
  uint64_t v14 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  unint64_t v16 = (char *)v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C838C0);
  uint64_t v90 = *(void *)(v92 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v92);
  unint64_t v89 = (char *)v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v91 = (char *)v77 - v19;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C838C8);
  MEMORY[0x270FA5388](v81);
  uint64_t v83 = (void *)((char *)v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C838D0);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v88 = (uint64_t)v77 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v87 = (char *)v77 - v24;
  uint64_t v25 = sub_2401650C0();
  uint64_t v84 = v26;
  uint64_t v85 = v25;
  int v82 = v27;
  uint64_t v86 = v28;
  uint64_t v80 = a1;
  uint64_t v29 = sub_2401502B0();
  if (v29)
  {
    uint64_t v97 = v29;
    v77[0] = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C838E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C838F0);
    uint64_t v78 = a2;
    sub_2401587A0(&qword_268C838F8, &qword_268C838E8);
    uint64_t v93 = sub_240164D50();
    uint64_t v94 = MEMORY[0x263F8D310];
    uint64_t v95 = MEMORY[0x263EFCD88];
    uint64_t v96 = MEMORY[0x263EFCE58];
    swift_getOpaqueTypeConformance2();
    v77[1] = v4;
    sub_240158128(&qword_268C83900, (void (*)(uint64_t))type metadata accessor for SignalPoint);
    sub_240164D10();
    uint64_t v30 = sub_2401587A0(&qword_268C83908, &qword_268C838B0);
    sub_240165100();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v97 = sub_24014F4E4();
    uint64_t v31 = sub_240164D60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v9, 1, 1, v31);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C83910);
    uint64_t v93 = v10;
    uint64_t v94 = v30;
    swift_getOpaqueTypeConformance2();
    sub_2401585A4();
    unint64_t v32 = v89;
    uint64_t v33 = v79;
    sub_240165110();
    sub_240158744((uint64_t)v9, &qword_268C838A8);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v33);
    (*(void (**)(char *, char *, uint64_t))(v90 + 32))(v91, v32, v92);
    uint64_t v93 = sub_240150D44();
    uint64_t v94 = v34;
    sub_2401584D4();
    uint64_t v35 = sub_2401650F0();
    uint64_t v37 = v36;
    LOBYTE(v33) = v38 & 1;
    _s6People22MissedCallPersonStatusV0A2UIE12iconFontSize05SwiftF00H0Vvg_0();
    uint64_t v39 = sub_2401650D0();
    uint64_t v41 = v40;
    char v43 = v42;
    swift_release();
    LOBYTE(v32) = v43 & 1;
    sub_240158528(v35, v37, v33);
    swift_bridgeObjectRelease();
    sub_240165210();
    uint64_t v44 = sub_2401650B0();
    uint64_t v46 = v45;
    LOBYTE(v37) = v47;
    swift_release();
    LOBYTE(v35) = v37 & 1;
    sub_240158528(v39, v41, (char)v32);
    swift_bridgeObjectRelease();
    uint64_t v48 = sub_2401650C0();
    uint64_t v50 = v49;
    uint64_t v52 = v51;
    LOBYTE(v33) = v53 & 1;
    sub_240158528(v44, v46, v35);
    swift_bridgeObjectRelease();
    char v54 = v89;
    uint64_t v55 = v90;
    uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v90 + 16);
    uint64_t v57 = v92;
    v56(v89, v91, v92);
    uint64_t v58 = v77[0];
    v56((char *)v77[0], v54, v57);
    uint64_t v59 = v58 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268C83920) + 48);
    *(void *)uint64_t v59 = v48;
    *(void *)(v59 + 8) = v50;
    *(unsigned char *)(v59 + 16) = v33;
    *(void *)(v59 + 24) = v52;
    sub_240158538(v48, v50, v33);
    swift_bridgeObjectRetain();
    sub_240158538(v48, v50, v33);
    swift_bridgeObjectRetain();
    sub_240158528(v48, v50, v33);
    swift_bridgeObjectRelease();
    unint64_t v60 = *(void (**)(char *, uint64_t))(v55 + 8);
    v60(v54, v57);
    sub_2401586E0(v58, (uint64_t)v83, &qword_268C838A0);
    swift_storeEnumTagMultiPayload();
    sub_2401587A0(&qword_268C838D8, &qword_268C838A0);
    uint64_t v61 = (uint64_t)v87;
    sub_240165040();
    sub_240158744(v58, &qword_268C838A0);
    uint64_t v62 = v50;
    a2 = v78;
    sub_240158528(v48, v62, v33);
    swift_bridgeObjectRelease();
    v60(v91, v92);
  }
  else
  {
    _s6People22MissedCallPersonStatusV0A2UIE12iconFontSize05SwiftF00H0Vvg_0();
    uint64_t v63 = sub_2401650D0();
    uint64_t v65 = v64;
    char v67 = v66;
    uint64_t v69 = v68;
    swift_release();
    uint64_t v70 = v83;
    uint64_t *v83 = v63;
    v70[1] = v65;
    *((unsigned char *)v70 + 16) = v67 & 1;
    v70[3] = v69;
    swift_storeEnumTagMultiPayload();
    sub_2401587A0(&qword_268C838D8, &qword_268C838A0);
    uint64_t v61 = (uint64_t)v87;
    sub_240165040();
  }
  char v71 = v82 & 1;
  uint64_t v72 = v88;
  sub_2401586E0(v61, v88, &qword_268C838D0);
  uint64_t v74 = v84;
  uint64_t v73 = v85;
  *(void *)a2 = v85;
  *(void *)(a2 + 8) = v74;
  *(unsigned char *)(a2 + 16) = v71;
  *(void *)(a2 + 24) = v86;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C838E0);
  sub_2401586E0(v72, a2 + *(int *)(v75 + 48), &qword_268C838D0);
  sub_240158538(v73, v74, v71);
  swift_bridgeObjectRetain();
  sub_240158744(v61, &qword_268C838D0);
  sub_240158744(v72, &qword_268C838D0);
  sub_240158528(v73, v74, v71);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24015555C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83938);
  uint64_t v19 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83940);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_240164D50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v17 = v6;
  uint64_t v18 = v7;
  MEMORY[0x270FA5388](v6);
  unint64_t v16 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240165030();
  uint64_t v9 = type metadata accessor for SignalPoint(0);
  sub_240164BE0();
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240165030();
  uint64_t v10 = (uint64_t *)(a1 + *(int *)(v9 + 20));
  uint64_t v12 = v10[1];
  uint64_t v22 = *v10;
  uint64_t v11 = v22;
  uint64_t v23 = v12;
  swift_bridgeObjectRetain();
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = v16;
  sub_240164D40();
  sub_240165030();
  uint64_t v22 = v11;
  uint64_t v23 = v12;
  swift_bridgeObjectRetain();
  sub_240164CF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = v17;
  sub_240164CD0();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v13, v14);
}

uint64_t sub_2401558C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2401650C0();
  uint64_t v20 = v3;
  uint64_t v21 = v2;
  uint64_t v22 = v4;
  char v19 = v5 & 1;
  sub_2401519F4();
  sub_2401584D4();
  uint64_t v6 = sub_2401650F0();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  sub_240165060();
  uint64_t v11 = sub_2401650D0();
  uint64_t v13 = v12;
  char v15 = v14;
  uint64_t v17 = v16;
  swift_release();
  v15 &= 1u;
  sub_240158528(v6, v8, v10);
  swift_bridgeObjectRelease();
  *(void *)a1 = v21;
  *(void *)(a1 + 8) = v20;
  *(unsigned char *)(a1 + 16) = v19;
  *(void *)(a1 + 24) = v22;
  *(void *)(a1 + 32) = v11;
  *(void *)(a1 + 40) = v13;
  *(unsigned char *)(a1 + 48) = v15;
  *(void *)(a1 + 56) = v17;
  sub_240158538(v21, v20, v19);
  swift_bridgeObjectRetain();
  sub_240158538(v11, v13, v15);
  swift_bridgeObjectRetain();
  sub_240158528(v11, v13, v15);
  swift_bridgeObjectRelease();
  sub_240158528(v21, v20, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_240155A58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_240164BE0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  char v9 = (char *)v13 - v8;
  uint64_t v10 = sub_240164EC0();
  uint64_t v11 = *(void *)(a2 + 16);
  v13[2] = *(void *)(a2 + 8);
  v13[3] = v11;
  v13[1] = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C837E0);
  sub_240165280();
  sub_240164BD0();
  type metadata accessor for MetricTemplateView(0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83788);
  sub_240165280();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t sub_240155BBC(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_240164BE0();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  sub_240165420();
  v1[10] = sub_240165410();
  uint64_t v4 = sub_240165400();
  return MEMORY[0x270FA2498](sub_240158B84, v4, v3);
}

uint64_t MetricTemplateView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83758);
  MEMORY[0x270FA5388](v30);
  unint64_t v32 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MetricTemplateView(0);
  uint64_t v28 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v28 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83760);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83768);
  uint64_t v29 = *(void *)(v31 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v31);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  char v14 = (char *)&v27 - v13;
  int v15 = *v1;
  sub_240151EA4((uint64_t)v9);
  if (v15 == 1)
  {
    uint64_t v27 = a1;
    sub_240158610((uint64_t)v1, (uint64_t)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for MetricTemplateView);
    unint64_t v16 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    uint64_t v17 = swift_allocObject();
    sub_240158678((uint64_t)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, type metadata accessor for MetricTemplateView);
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C83770);
    uint64_t v19 = sub_2401587A0(&qword_268C83778, &qword_268C83770);
    uint64_t v33 = v18;
    uint64_t v34 = v19;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_240165150();
    swift_release();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v21 = v29;
    uint64_t v22 = v31;
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v14, v12, v31);
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v32, v14, v22);
    swift_storeEnumTagMultiPayload();
    uint64_t v33 = v6;
    uint64_t v34 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    sub_240165040();
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v14, v22);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v32, v9, v6);
    swift_storeEnumTagMultiPayload();
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C83770);
    uint64_t v25 = sub_2401587A0(&qword_268C83778, &qword_268C83770);
    uint64_t v33 = v24;
    uint64_t v34 = v25;
    uint64_t v26 = swift_getOpaqueTypeConformance2();
    uint64_t v33 = v6;
    uint64_t v34 = v26;
    swift_getOpaqueTypeConformance2();
    sub_240165040();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
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

uint64_t sub_2401561CC(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_240164BE0();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  sub_240165420();
  v1[10] = sub_240165410();
  uint64_t v4 = sub_240165400();
  return MEMORY[0x270FA2498](sub_2401562D0, v4, v3);
}

uint64_t sub_2401562D0()
{
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v5 = v0[5];
  uint64_t v4 = v0[6];
  swift_release();
  uint64_t v6 = sub_240164EC0();
  uint64_t v7 = *(void *)(v5 + 16);
  v0[2] = *(void *)(v5 + 8);
  v0[3] = v7;
  v0[4] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C837E0);
  sub_240165280();
  sub_240164BD0();
  type metadata accessor for MetricTemplateView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83788);
  sub_240165280();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_240156400()
{
  uint64_t v2 = *(void *)(type metadata accessor for MetricTemplateView(0) - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_2401564CC;
  return sub_2401561CC(v3);
}

uint64_t sub_2401564CC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2401565C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2401565E4()
{
  return sub_240165160();
}

uint64_t *initializeBufferWithCopyOfBuffer for MetricTemplateView(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    char v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_240164BE0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    v12(v9, v10, v11);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83788);
    *(void *)&v9[*(int *)(v13 + 28)] = *(void *)&v10[*(int *)(v13 + 28)];
    uint64_t v14 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)v4 + v14) = *(uint64_t *)((char *)a2 + v14);
    uint64_t v15 = a3[10];
    *(uint64_t *)((char *)v4 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)v4 + v15) = *(uint64_t *)((char *)a2 + v15);
    *(uint64_t *)((char *)v4 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for MetricTemplateView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_240164BE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83788);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MetricTemplateView(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_240164BE0();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  v11(v8, v9, v10);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83788);
  *(void *)(v8 + *(int *)(v12 + 28)) = *(void *)(v9 + *(int *)(v12 + 28));
  uint64_t v13 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v14 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MetricTemplateView(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_240164BE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83788);
  *(void *)(v7 + *(int *)(v10 + 28)) = *(void *)(v8 + *(int *)(v10 + 28));
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MetricTemplateView(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_240164BE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83788);
  *(void *)(v7 + *(int *)(v10 + 28)) = *(void *)(v8 + *(int *)(v10 + 28));
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithTake for MetricTemplateView(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_240164BE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83788);
  *(void *)(v7 + *(int *)(v10 + 28)) = *(void *)(v8 + *(int *)(v10 + 28));
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_release();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_release();
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MetricTemplateView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_240156D24);
}

uint64_t sub_240156D24(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83788);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for MetricTemplateView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_240156DEC);
}

uint64_t sub_240156DEC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83788);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_240156E98()
{
  sub_240156F58();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_240156F58()
{
  if (!qword_268C837A8)
  {
    sub_240164BE0();
    unint64_t v0 = sub_240165290();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C837A8);
    }
  }
}

unint64_t sub_240156FB4()
{
  unint64_t result = qword_268C837B0;
  if (!qword_268C837B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C837B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C83760);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C83770);
    sub_2401587A0(&qword_268C83778, &qword_268C83770);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C837B0);
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2401570C4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2401570E4(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for ContactImage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_240157160(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_240157180(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t *sub_2401571C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_240164C00();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (char *)a2 + v9;
    uint64_t v15 = sub_240164BE0();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_2401572F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_240164C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  uint64_t v14 = sub_240164BE0();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  return a1;
}

uint64_t sub_2401573DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_240164C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_240164BE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_2401574C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_240164C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_240164BE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_240157580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_240164C00();
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
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_240164BE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_240157654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_15Tm);
}

uint64_t sub_24015766C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_16Tm);
}

uint64_t type metadata accessor for SignalPoint(uint64_t a1)
{
  return sub_240157FD0(a1, (uint64_t *)&unk_268C837C0);
}

uint64_t sub_2401576A4()
{
  uint64_t result = sub_240164C00();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_240164BE0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *sub_240157774(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_240164C00();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (void *)((char *)a1 + v8);
    uint64_t v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (char *)a2 + v9;
    uint64_t v15 = sub_240164BE0();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t sub_2401578BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_240164C00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_240164BE0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_240157974(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_240164C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  uint64_t v14 = sub_240164BE0();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_240157A6C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_240164C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_240164BE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_240157B64(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_240164C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_240164BE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_240157C38(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_240164C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_240164BE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_240157D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_240157D34);
}

uint64_t __swift_get_extra_inhabitant_index_15Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_240164C00();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_240164BE0();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_240157E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_240157E7C);
}

uint64_t __swift_store_extra_inhabitant_index_16Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_240164C00();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_240164BE0();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for ActionPoint(uint64_t a1)
{
  return sub_240157FD0(a1, (uint64_t *)&unk_268C837D0);
}

uint64_t sub_240157FD0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_240158008()
{
  uint64_t result = sub_240164C00();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_240164BE0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2401580E0()
{
  return sub_240158128(&qword_26AF51E40, MEMORY[0x263F07508]);
}

uint64_t sub_240158128(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_240158170@<X0>(char *a1@<X8>)
{
  return sub_24015220C(*(void *)(v1 + 16), a1);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for MetricTemplateView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_240164BE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83788);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_2401582CC(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for MetricTemplateView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_240155A58(a1, v4);
}

uint64_t sub_240158340()
{
  uint64_t v2 = *(void *)(type metadata accessor for MetricTemplateView(0) - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_240158B88;
  return sub_240155BBC(v3);
}

uint64_t sub_24015840C@<X0>(uint64_t a1@<X8>)
{
  return sub_240152A04(a1);
}

uint64_t sub_240158414@<X0>(uint64_t a1@<X8>)
{
  return sub_240152C8C(*(void *)(v1 + 16), a1);
}

unint64_t sub_24015841C()
{
  unint64_t result = qword_268C83848;
  if (!qword_268C83848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C83840);
    sub_2401587A0(&qword_268C83850, &qword_268C83858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C83848);
  }
  return result;
}

uint64_t sub_2401584BC@<X0>(uint64_t *a1@<X8>)
{
  return sub_240153DA4(a1);
}

uint64_t sub_2401584C4@<X0>(uint64_t a1@<X8>)
{
  return sub_240154B48(*(void *)(v1 + 16), a1);
}

uint64_t sub_2401584CC@<X0>(uint64_t a1@<X8>)
{
  return sub_2401558C8(a1);
}

unint64_t sub_2401584D4()
{
  unint64_t result = qword_268C83888;
  if (!qword_268C83888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C83888);
  }
  return result;
}

uint64_t sub_240158528(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_240158538(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_240158548(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2401585A4()
{
  unint64_t result = qword_268C83918;
  if (!qword_268C83918)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C83910);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C83918);
  }
  return result;
}

uint64_t sub_240158610(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_240158678(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2401586E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_240158744(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2401587A0(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2401587E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_240158844@<X0>(uint64_t a1@<X8>)
{
  return sub_240152E44(*(void *)(v1 + 16), a1);
}

unint64_t sub_24015884C()
{
  unint64_t result = qword_268C839A8;
  if (!qword_268C839A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C839A0);
    sub_240164D30();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C839A8);
  }
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_240158924(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ActionPoint.Action(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ActionPoint.Action(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x240158AD4);
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

uint64_t sub_240158AFC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_240158B08(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ActionPoint.Action()
{
  return &type metadata for ActionPoint.Action;
}

unint64_t sub_240158B28()
{
  unint64_t result = qword_268C839D0;
  if (!qword_268C839D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C839D0);
  }
  return result;
}

uint64_t ContactImage.avatar.getter()
{
  return swift_retain();
}

uint64_t ContactImage.avatarLuminance.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t ContactImage.avatarLuminance.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 8) = result;
  *(unsigned char *)(v2 + 16) = a2 & 1;
  return result;
}

uint64_t (*ContactImage.avatarLuminance.modify())()
{
  return nullsub_1;
}

uint64_t ContactImage.avatarSaturation.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t ContactImage.avatarSaturation.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 24) = result;
  *(unsigned char *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t (*ContactImage.avatarSaturation.modify())()
{
  return nullsub_1;
}

int64x2_t ContactImage.init(contactImageData:)@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v6 = objc_allocWithZone(MEMORY[0x263F827E8]);
  sub_2401590E4(a1, a2);
  BOOL v7 = (void *)sub_240164BA0();
  id v8 = objc_msgSend(v6, sel_initWithData_, v7);

  if (v8)
  {
    uint64_t v9 = sub_240165230();
    sub_24015913C(a1, a2);
  }
  else
  {
    sub_24015913C(a1, a2);
    uint64_t v9 = 0;
  }
  id v10 = objc_allocWithZone(MEMORY[0x263F827E8]);
  sub_2401590E4(a1, a2);
  uint64_t v11 = (void *)sub_240164BA0();
  id v12 = objc_msgSend(v10, sel_initWithData_, v11);
  sub_24015913C(a1, a2);

  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x2455E03B0]();
    v23.origin.x = 0.3;
    v23.origin.y = 0.9;
    v23.size.width = 0.4;
    v23.size.height = 0.05;
    Class isa = UIImage.crop(relativeTo:)(v23).super.isa;
    Class v15 = UIImage.resize(to:)((CGSize)__PAIR128__(0x4059000000000000, 0x4059000000000000)).super.isa;
    [(objc_class *)v15 _calculateStatistics];
    uint64_t v16 = v22;

    double v17 = v19 * 0.2126 + v20 * 0.7152 + v21 * 0.0722;
    sub_24015913C(a1, a2);
  }
  else
  {
    sub_24015913C(a1, a2);
    uint64_t v16 = 0;
    double v17 = 0.0;
  }
  *(void *)a3 = v9;
  *(double *)(a3 + 8) = v17;
  *(unsigned char *)(a3 + 16) = v12 == 0;
  *(void *)(a3 + 24) = v16;
  *(unsigned char *)(a3 + 32) = v12 == 0;
  *(_OWORD *)(a3 + 40) = xmmword_240165CD0;
  *(_OWORD *)(a3 + 56) = xmmword_240165CE0;
  int64x2_t result = vdupq_n_s64(0x4059000000000000uLL);
  *(int64x2_t *)(a3 + 72) = result;
  return result;
}

uint64_t _s6People22ContactFetcherProtocolP0A2UIE03getB9ImageData3for4size6locale10Foundation0H0VSgSo9CNContactCSg_So6CGSizeVAD06LocaleD0_ptF_0(void *a1, void *a2, double a3, double a4)
{
  if (!a1) {
    return 0;
  }
  id v8 = objc_allocWithZone(MEMORY[0x263EFEBA0]);
  id v9 = a1;
  id v10 = objc_msgSend(v8, sel_init);
  uint64_t v11 = a2[3];
  uint64_t v12 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v11);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
  uint64_t v15 = v14;
  sub_240159440((uint64_t)a2, (uint64_t)v32);
  if (v15)
  {
    uint64_t v16 = v33;
    uint64_t v17 = v34;
    __swift_project_boxed_opaque_existential_1(v32, v33);
    uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 16))(v13, v15, v16, v17);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    BOOL v19 = v18 == 2;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    BOOL v19 = 0;
  }
  double v20 = self;
  id v21 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v21, sel_scale);
  double v23 = v22;

  id v24 = objc_msgSend(v20, sel_scopeWithPointSize_scale_rightToLeft_style_backgroundStyle_, v19, 0, 0, a3, a4, v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C839D8);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_240165CF0;
  *(void *)(v25 + 32) = v9;
  v32[0] = v25;
  sub_2401653F0();
  sub_2401594F4();
  id v26 = v9;
  uint64_t v27 = (void *)sub_2401653E0();
  swift_bridgeObjectRelease();
  uint64_t v28 = (UIImage *)objc_msgSend(v10, sel_avatarImageForContacts_scope_, v27, v24);

  uint64_t v29 = UIImagePNGRepresentation(v28);
  if (!v29)
  {

    swift_unknownObjectRelease();
    return 0;
  }
  uint64_t v30 = sub_240164BB0();

  swift_unknownObjectRelease();
  return v30;
}

uint64_t sub_2401590E4(uint64_t a1, unint64_t a2)
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

uint64_t sub_24015913C(uint64_t a1, unint64_t a2)
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

uint64_t destroy for ContactImage()
{
  return swift_release();
}

uint64_t initializeWithCopy for ContactImage(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ContactImage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for ContactImage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactImage(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 88)) {
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

uint64_t storeEnumTagSinglePayload for ContactImage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 88) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 88) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactImage()
{
  return &type metadata for ContactImage;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_240159440(uint64_t a1, uint64_t a2)
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

unint64_t sub_2401594F4()
{
  unint64_t result = qword_268C839E0;
  if (!qword_268C839E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C839E0);
  }
  return result;
}

uint64_t static PeopleWidgetConstants.maxAdditionalBadges.getter()
{
  return 2;
}

double static PeopleWidgetConstants.statusBadgeSize.getter()
{
  return 24.0;
}

int64x2_t sub_240159548()
{
  int64x2_t result = vdupq_n_s64(0x4055800000000000uLL);
  xmmword_26AF51E58 = (__int128)result;
  return result;
}

double static PeopleWidgetConstants.maxContactAvatarSize.getter()
{
  if (qword_26AF51E68 != -1) {
    swift_once();
  }
  return *(double *)&xmmword_26AF51E58;
}

double static PeopleWidgetConstants.statusBadgeAccessibilitySize.getter()
{
  return 36.0;
}

void sub_2401595C4()
{
  qword_268C839E8 = 0x4040000000000000;
}

double static PeopleWidgetConstants.widgetPadding.getter()
{
  return sub_24015962C(&qword_268C83650, (uint64_t)&qword_268C839E8);
}

void sub_2401595F8()
{
  qword_268C839F0 = 0x4022000000000000;
}

double static PeopleWidgetConstants.avatarAndStatusSpacing.getter()
{
  return sub_24015962C(&qword_268C83658, (uint64_t)&qword_268C839F0);
}

double sub_24015962C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

uint64_t sub_240159668(uint64_t a1)
{
  return sub_240159C84(0.584313725, 0.580392157, 0.6, a1, &qword_268C839F8);
}

uint64_t static PeopleWidgetConstants.nameForegroundColor.getter()
{
  return sub_240159D9C(&qword_268C83660);
}

uint64_t sub_2401596B4(uint64_t a1)
{
  return sub_240159C84(0.93, 0.93, 0.93, a1, &qword_268C83A00);
}

uint64_t static PeopleWidgetConstants.kettleGradientColor.getter()
{
  return sub_240159D9C(&qword_268C83668);
}

uint64_t sub_2401596F4(uint64_t a1)
{
  return sub_240159C84(0.39, 0.39, 0.4, a1, &qword_268C83A08);
}

uint64_t static PeopleWidgetConstants.motionGradientColor.getter()
{
  return sub_240159D9C(&qword_268C83670);
}

uint64_t sub_240159738(uint64_t a1)
{
  return sub_240159C84(0.46, 0.45, 0.9, a1, &qword_268C83A10);
}

uint64_t static PeopleWidgetConstants.screenTimeGradientColor2.getter()
{
  return sub_240159D9C(&qword_268C83678);
}

uint64_t sub_240159780()
{
  uint64_t result = _s6People24AvailabilityPersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0();
  qword_268C83A18 = result;
  return result;
}

uint64_t static PeopleWidgetConstants.screenTimeGradientColor1.getter()
{
  return sub_240159D9C(&qword_268C83680);
}

uint64_t sub_2401597C4()
{
  uint64_t result = _s6People19MessagePersonStatusV0A2UIE14iconForeground05SwiftE05ColorVvg_0();
  qword_268C83A20 = result;
  return result;
}

uint64_t static PeopleWidgetConstants.askToBuyAppstoreGradientColor1.getter()
{
  return sub_240159D9C(&qword_268C83688);
}

uint64_t sub_240159808(uint64_t a1)
{
  return sub_240159C84(0.0, 0.7, 1.0, a1, &qword_268C83A28);
}

uint64_t static PeopleWidgetConstants.askToBuyAppstoreGradientColor2.getter()
{
  return sub_240159D9C(&qword_268C83690);
}

uint64_t sub_24015984C()
{
  uint64_t result = sub_2401651F0();
  qword_268C83A30 = result;
  return result;
}

uint64_t static PeopleWidgetConstants.askToBuyBooksGradientColor1.getter()
{
  return sub_240159D9C(&qword_268C83698);
}

uint64_t sub_240159890(uint64_t a1)
{
  return sub_240159C84(0.992156863, 0.615686275, 0.0, a1, &qword_268C83A38);
}

uint64_t static PeopleWidgetConstants.askToBuyBooksGradientColor2.getter()
{
  return sub_240159D9C(&qword_268C836A0);
}

uint64_t sub_2401598D4(uint64_t a1)
{
  return sub_240159C84(0.815686275, 0.255230126, 1.0, a1, &qword_268C83A40);
}

uint64_t static PeopleWidgetConstants.askToBuyITunesGradientColor1.getter()
{
  return sub_240159D9C(&qword_268C836A8);
}

uint64_t sub_240159918(uint64_t a1)
{
  return sub_240159C84(0.988235294, 0.356862745, 0.768627451, a1, &qword_268C83A48);
}

uint64_t static PeopleWidgetConstants.askToBuyITunesGradientColor2.getter()
{
  return sub_240159D9C(&qword_268C836B0);
}

uint64_t sub_240159960(uint64_t a1)
{
  return sub_240159C84(0.93, 0.93, 0.93, a1, &qword_268C83A50);
}

uint64_t static PeopleWidgetConstants.locationGradientColor2.getter()
{
  return sub_240159D9C(&qword_268C836B8);
}

uint64_t sub_2401599A0(uint64_t a1)
{
  return sub_240159C84(0.643137255, 0.858823529, 0.909803922, a1, &qword_268C83A58);
}

uint64_t static PeopleWidgetConstants.locationGradientColor1.getter()
{
  return sub_240159D9C(&qword_268C836C0);
}

uint64_t sub_2401599E8(uint64_t a1)
{
  return sub_240159C84(0.156862745, 0.274509804, 1.0, a1, &qword_268C83A60);
}

uint64_t static PeopleWidgetConstants.locationColor.getter()
{
  return sub_240159D9C(&qword_268C836C8);
}

uint64_t sub_240159A2C()
{
  uint64_t result = _s6People19MessagePersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0();
  qword_268C83A68 = result;
  return result;
}

uint64_t static PeopleWidgetConstants.onDemandDowntimeForegroundColor.getter()
{
  return sub_240159D9C(&qword_268C836D0);
}

uint64_t sub_240159A70()
{
  uint64_t result = _s6People24AvailabilityPersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0();
  qword_268C83A70 = result;
  return result;
}

uint64_t static PeopleWidgetConstants.onDemandGradientColor1.getter()
{
  return sub_240159D9C(&qword_268C836D8);
}

uint64_t sub_240159AB4(uint64_t a1)
{
  return sub_240159C84(0.458823529, 0.450980392, 0.898039216, a1, &qword_268C83A78);
}

uint64_t static PeopleWidgetConstants.onDemandGradientColor2.getter()
{
  return sub_240159D9C(&qword_268C836E0);
}

uint64_t sub_240159AFC(uint64_t a1)
{
  return sub_240159C84(0.262745098, 0.258823529, 0.639215686, a1, &qword_268C83A80);
}

uint64_t static PeopleWidgetConstants.onDemandShadow.getter()
{
  return sub_240159D9C(&qword_268C836E8);
}

uint64_t sub_240159B44(uint64_t a1)
{
  return sub_240159C84(0.196078431, 0.674509804, 0.901960784, a1, &qword_268C83A88);
}

uint64_t static PeopleWidgetConstants.subscriptionBadgeColor.getter()
{
  return sub_240159D9C(&qword_268C836F0);
}

uint64_t sub_240159B8C(uint64_t a1)
{
  return sub_240159C84(0.36, 0.97, 0.47, a1, &qword_268C83A90);
}

uint64_t static PeopleWidgetConstants.phoneGradientColor2.getter()
{
  return sub_240159D9C(&qword_268C836F8);
}

uint64_t sub_240159BD4(uint64_t a1)
{
  return sub_240159C84(0.2, 0.85, 0.31, a1, &qword_268C83A98);
}

uint64_t static PeopleWidgetConstants.phoneGradientColor1.getter()
{
  return sub_240159D9C(&qword_268C83700);
}

uint64_t sub_240159C20(uint64_t a1)
{
  return sub_240159C84(0.05, 0.75, 0.17, a1, &qword_268C83AA0);
}

uint64_t static PeopleWidgetConstants.phoneShadowColor.getter()
{
  return sub_240159D9C(&qword_268C83708);
}

uint64_t sub_240159C64(uint64_t a1)
{
  return sub_240159C84(1.0, 0.203921569, 0.164705882, a1, &qword_268C83AA8);
}

uint64_t sub_240159C84(double a1, double a2, double a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9 = sub_240165170();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v12 + 104))(v11, *MEMORY[0x263F1B388]);
  uint64_t result = MEMORY[0x2455DFF90](v11, a1, a2, a3, 1.0);
  *a5 = result;
  return result;
}

uint64_t static PeopleWidgetConstants.calendarForegroundColor.getter()
{
  return sub_240159D9C(&qword_268C83710);
}

uint64_t sub_240159D9C(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_retain();
}

float static PeopleWidgetConstants.adjustmentForWidgetSuggester.getter()
{
  return 0.1;
}

uint64_t sub_240159DF8()
{
  uint64_t v0 = sub_2401652E0();
  __swift_allocate_value_buffer(v0, qword_268C83AB0);
  __swift_project_value_buffer(v0, (uint64_t)qword_268C83AB0);
  return sub_2401652D0();
}

uint64_t static PeopleWidgetConstants.minimumTimelineRelevance.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_268C83718 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2401652E0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_268C83AB0);
  int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_240159F3C()
{
  sub_240164D80();
  uint64_t v0 = sub_240164D70();
  static StatusCompatiblePicker.statusForDisplay(from:featureFlags:)(MEMORY[0x263F8EE78], v0, (uint64_t)&unk_268C83AC8);
  return swift_release();
}

uint64_t static PeopleWidgetConstants.defaultStatusForDisplay.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_268C83720 != -1) {
    swift_once();
  }
  return sub_24015A004((uint64_t)&unk_268C83AC8, a1);
}

uint64_t sub_24015A004(uint64_t a1, uint64_t a2)
{
  return a2;
}

ValueMetadata *type metadata accessor for PeopleWidgetConstants()
{
  return &type metadata for PeopleWidgetConstants;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void ContactFetcherProtocol.contactImage(for:locale:)(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  if (qword_26AF51E68 != -1) {
    swift_once();
  }
  uint64_t v6 = _s6People22ContactFetcherProtocolP0A2UIE03getB9ImageData3for4size6locale10Foundation0H0VSgSo9CNContactCSg_So6CGSizeVAD06LocaleD0_ptF_0(a1, a2, *(double *)&xmmword_26AF51E58, *((double *)&xmmword_26AF51E58 + 1));
  if (v7 >> 60 == 15)
  {
    uint64_t v8 = 0;
    *(void *)a3 = 1;
    long long v9 = 0uLL;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(void *)(a3 + 40) = 0;
    long long v10 = 0uLL;
  }
  else
  {
    ContactImage.init(contactImageData:)(v6, v7, (uint64_t)&v15);
    uint64_t v11 = v16;
    uint64_t v12 = v17;
    uint64_t v13 = v18;
    uint64_t v14 = v19;
    long long v9 = v20;
    long long v10 = v21;
    uint64_t v8 = v22;
    *(_OWORD *)a3 = v15;
    *(void *)(a3 + 16) = v11;
    *(void *)(a3 + 24) = v12;
    *(void *)(a3 + 32) = v13;
    *(void *)(a3 + 40) = v14;
  }
  *(_OWORD *)(a3 + 48) = v9;
  *(_OWORD *)(a3 + 64) = v10;
  *(void *)(a3 + 80) = v8;
}

NSLocaleLanguageDirection __swiftcall Locale.characterDirection(forLanguage:)(Swift::String forLanguage)
{
  uint64_t v1 = sub_240164C40();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  int v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_240164C20();
  NSLocaleLanguageDirection v5 = sub_240164C30();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v5;
}

uint64_t sub_24015A2C8()
{
  uint64_t v0 = sub_240164C40();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_240164C20();
  uint64_t v4 = sub_240164C30();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t PersonInfo.person.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_240165000();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t PersonInfo.contactImage.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for PersonInfo() + 20));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  uint64_t v13 = v3[9];
  uint64_t v14 = v3[10];
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  a1[9] = v13;
  a1[10] = v14;
  return sub_24015A4E0(v4);
}

uint64_t type metadata accessor for PersonInfo()
{
  uint64_t result = qword_26AF51F10;
  if (!qword_26AF51F10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24015A4E0(uint64_t result)
{
  if (result != 1) {
    return swift_retain();
  }
  return result;
}

uint64_t PersonInfo.statusForDisplay.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PersonInfo() + 24);
  return sub_24015A004(v3, a1);
}

double PersonInfo.init(person:contactImage:)@<D0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  long long v19 = a2[1];
  long long v20 = *a2;
  long long v17 = a2[3];
  long long v18 = a2[2];
  long long v16 = a2[4];
  uint64_t v5 = *((void *)a2 + 10);
  uint64_t v6 = sub_240165000();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a3, a1, v6);
  uint64_t v8 = type metadata accessor for PersonInfo();
  uint64_t v9 = a3 + *(int *)(v8 + 20);
  *(_OWORD *)uint64_t v9 = v20;
  *(_OWORD *)(v9 + 16) = v19;
  *(_OWORD *)(v9 + 32) = v18;
  *(_OWORD *)(v9 + 48) = v17;
  *(_OWORD *)(v9 + 64) = v16;
  *(void *)(v9 + 80) = v5;
  uint64_t v10 = sub_240164FF0();
  sub_240164D80();
  uint64_t v11 = sub_240164D70();
  static StatusCompatiblePicker.statusForDisplay(from:featureFlags:)(v10, v11, (uint64_t)v21);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  uint64_t v12 = a3 + *(int *)(v8 + 24);
  long long v13 = v21[3];
  *(_OWORD *)(v12 + 32) = v21[2];
  *(_OWORD *)(v12 + 48) = v13;
  *(_OWORD *)(v12 + 64) = v21[4];
  *(void *)(v12 + 80) = v22;
  double result = *(double *)v21;
  long long v15 = v21[1];
  *(_OWORD *)uint64_t v12 = v21[0];
  *(_OWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t PersonInfo.textForLabel.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83B20);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_240165A90;
  *(void *)(inited + 32) = sub_240164FC0();
  *(void *)(inited + 40) = v2;
  uint64_t v3 = type metadata accessor for PersonInfo();
  sub_2401586E0(v0 + *(int *)(v3 + 24) + 40, (uint64_t)v18, &qword_268C83B28);
  if (v19)
  {
    __swift_project_boxed_opaque_existential_1(v18, v19);
    *(void *)(inited + 48) = sub_240164E20();
    *(void *)(inited + 56) = v4;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    uint64_t v5 = *(void *)(inited + 40);
    if (v5) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
    uint64_t v11 = *(void *)(inited + 56);
    if (!v11) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  sub_240158744((uint64_t)v18, &qword_268C83B28);
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0;
  uint64_t v5 = *(void *)(inited + 40);
  if (!v5) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v6 = *(void *)(inited + 32);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24015AF94(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v9 = v7[2];
  unint64_t v8 = v7[3];
  if (v9 >= v8 >> 1) {
    uint64_t v7 = sub_24015AF94((void *)(v8 > 1), v9 + 1, 1, v7);
  }
  v7[2] = v9 + 1;
  uint64_t v10 = &v7[2 * v9];
  v10[4] = v6;
  v10[5] = v5;
  uint64_t v11 = *(void *)(inited + 56);
  if (v11)
  {
LABEL_9:
    uint64_t v12 = *(void *)(inited + 48);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v7 = sub_24015AF94(0, v7[2] + 1, 1, v7);
    }
    unint64_t v14 = v7[2];
    unint64_t v13 = v7[3];
    if (v14 >= v13 >> 1) {
      uint64_t v7 = sub_24015AF94((void *)(v13 > 1), v14 + 1, 1, v7);
    }
    v7[2] = v14 + 1;
    long long v15 = &v7[2 * v14];
    v15[4] = v12;
    v15[5] = v11;
  }
LABEL_14:
  swift_bridgeObjectRelease();
  v18[0] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83B30);
  sub_24015A8D8();
  uint64_t v16 = sub_240165300();
  swift_bridgeObjectRelease();
  return v16;
}

unint64_t sub_24015A8D8()
{
  unint64_t result = qword_268C83B38;
  if (!qword_268C83B38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C83B30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C83B38);
  }
  return result;
}

uint64_t static PersonInfo.urlForPerson(personInfo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_240165000();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83B40);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C83B48);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  unint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v22 - v15;
  sub_2401586E0(a1, (uint64_t)v10, &qword_268C83B40);
  uint64_t v17 = type metadata accessor for PersonInfo();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v10, 1, v17) == 1)
  {
    sub_240158744((uint64_t)v10, &qword_268C83B40);
    uint64_t v18 = sub_240164B90();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
    sub_24015B0A4((uint64_t)v10);
    sub_240164FD0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v18 = sub_240164B90();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(a2, v16, v18);
    }
  }
  sub_240164FE0();
  sub_240164B90();
  uint64_t v20 = *(void *)(v18 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v14, 1, v18);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(a2, v14, v18);
    return sub_240158744((uint64_t)v16, &qword_268C83B48);
  }
  return result;
}

uint64_t sub_24015ACB8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24015AD00(a1, a2, a3, a4, &qword_268C83B78, type metadata accessor for ActionPoint, type metadata accessor for ActionPoint);
}

uint64_t sub_24015ACDC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24015AD00(a1, a2, a3, a4, &qword_268C83B70, type metadata accessor for SignalPoint, type metadata accessor for SignalPoint);
}

uint64_t sub_24015AD00(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_2401654E0();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  void v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24015C06C(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void *sub_24015AF80(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_24015BF3C(a1, a2, a3, a4, &qword_268C83B50, &qword_268C83B58);
}

void *sub_24015AF94(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C83750);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      uint64_t v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24015C2D4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24015B0A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PersonInfo();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of LocaleProtocol.languageCode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of LocaleProtocol.characterDirection(forLanguage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t *initializeBufferWithCopyOfBuffer for PersonInfo(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_240165000();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    if (*(void *)v10 == 1)
    {
      long long v11 = *((_OWORD *)v10 + 3);
      *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
      *((_OWORD *)v9 + 3) = v11;
      *((_OWORD *)v9 + 4) = *((_OWORD *)v10 + 4);
      *((void *)v9 + 10) = *((void *)v10 + 10);
      long long v12 = *((_OWORD *)v10 + 1);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v12;
    }
    else
    {
      uint64_t v14 = *((void *)v10 + 1);
      *(void *)uint64_t v9 = *(void *)v10;
      *((void *)v9 + 1) = v14;
      v9[16] = v10[16];
      *((void *)v9 + 3) = *((void *)v10 + 3);
      v9[32] = v10[32];
      *(_OWORD *)(v9 + 40) = *(_OWORD *)(v10 + 40);
      *(_OWORD *)(v9 + 56) = *(_OWORD *)(v10 + 56);
      *(_OWORD *)(v9 + 72) = *(_OWORD *)(v10 + 72);
      swift_retain();
    }
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (char *)a1 + v15;
    unint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = *((void *)v17 + 3);
    if (v18)
    {
      uint64_t v19 = *((void *)v17 + 4);
      *((void *)v16 + 3) = v18;
      *((void *)v16 + 4) = v19;
      (**(void (***)(char *, char *))(v18 - 8))(v16, v17);
    }
    else
    {
      long long v20 = *((_OWORD *)v17 + 1);
      *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
      *((_OWORD *)v16 + 1) = v20;
      *((void *)v16 + 4) = *((void *)v17 + 4);
    }
    uint64_t v21 = v16 + 40;
    unint64_t v22 = v17 + 40;
    uint64_t v23 = *((void *)v17 + 8);
    if (v23)
    {
      uint64_t v24 = *((void *)v17 + 9);
      *((void *)v16 + 8) = v23;
      *((void *)v16 + 9) = v24;
      (**(void (***)(_OWORD *, _OWORD *))(v23 - 8))(v21, v22);
    }
    else
    {
      long long v25 = *(_OWORD *)(v17 + 56);
      *uint64_t v21 = *v22;
      *(_OWORD *)(v16 + 56) = v25;
      *((void *)v16 + 9) = *((void *)v17 + 9);
    }
    *((void *)v16 + 10) = *((void *)v17 + 10);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for PersonInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_240165000();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  if (*(void *)(a1 + *(int *)(a2 + 20)) != 1) {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  if (*(void *)(v5 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v5);
  }
  if (*(void *)(v5 + 64)) {
    __swift_destroy_boxed_opaque_existential_1(v5 + 40);
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PersonInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_240165000();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  if (*(void *)v9 == 1)
  {
    long long v10 = *(_OWORD *)(v9 + 48);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v8 + 48) = v10;
    *(_OWORD *)(v8 + 64) = *(_OWORD *)(v9 + 64);
    *(void *)(v8 + 80) = *(void *)(v9 + 80);
    long long v11 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v11;
  }
  else
  {
    uint64_t v12 = *(void *)(v9 + 8);
    *(void *)uint64_t v8 = *(void *)v9;
    *(void *)(v8 + 8) = v12;
    *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
    *(void *)(v8 + 24) = *(void *)(v9 + 24);
    *(unsigned char *)(v8 + 32) = *(unsigned char *)(v9 + 32);
    *(_OWORD *)(v8 + 40) = *(_OWORD *)(v9 + 40);
    *(_OWORD *)(v8 + 56) = *(_OWORD *)(v9 + 56);
    *(_OWORD *)(v8 + 72) = *(_OWORD *)(v9 + 72);
    swift_retain();
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = *(void *)(v15 + 24);
  if (v16)
  {
    uint64_t v17 = *(void *)(v15 + 32);
    *(void *)(v14 + 24) = v16;
    *(void *)(v14 + 32) = v17;
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))(v14, v15);
  }
  else
  {
    long long v18 = *(_OWORD *)(v15 + 16);
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    *(_OWORD *)(v14 + 16) = v18;
    *(void *)(v14 + 32) = *(void *)(v15 + 32);
  }
  uint64_t v19 = (_OWORD *)(v14 + 40);
  long long v20 = (_OWORD *)(v15 + 40);
  uint64_t v21 = *(void *)(v15 + 64);
  if (v21)
  {
    uint64_t v22 = *(void *)(v15 + 72);
    *(void *)(v14 + 64) = v21;
    *(void *)(v14 + 72) = v22;
    (**(void (***)(_OWORD *, _OWORD *))(v21 - 8))(v19, v20);
  }
  else
  {
    long long v23 = *(_OWORD *)(v15 + 56);
    *uint64_t v19 = *v20;
    *(_OWORD *)(v14 + 56) = v23;
    *(void *)(v14 + 72) = *(void *)(v15 + 72);
  }
  *(void *)(v14 + 80) = *(void *)(v15 + 80);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PersonInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_240165000();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7);
  if (*(void *)(a1 + v7) == 1)
  {
    if (v10 == 1)
    {
      long long v11 = *(_OWORD *)(v9 + 16);
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
      *(_OWORD *)(v8 + 16) = v11;
      long long v12 = *(_OWORD *)(v9 + 32);
      long long v13 = *(_OWORD *)(v9 + 48);
      long long v14 = *(_OWORD *)(v9 + 64);
      *(void *)(v8 + 80) = *(void *)(v9 + 80);
      *(_OWORD *)(v8 + 48) = v13;
      *(_OWORD *)(v8 + 64) = v14;
      *(_OWORD *)(v8 + 32) = v12;
    }
    else
    {
      *(void *)uint64_t v8 = v10;
      uint64_t v19 = *(void *)(v9 + 8);
      *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
      *(void *)(v8 + 8) = v19;
      uint64_t v20 = *(void *)(v9 + 24);
      *(unsigned char *)(v8 + 32) = *(unsigned char *)(v9 + 32);
      *(void *)(v8 + 24) = v20;
      long long v21 = *(_OWORD *)(v9 + 40);
      *(_OWORD *)(v8 + 56) = *(_OWORD *)(v9 + 56);
      *(_OWORD *)(v8 + 40) = v21;
      *(_OWORD *)(v8 + 72) = *(_OWORD *)(v9 + 72);
      swift_retain();
    }
  }
  else if (v10 == 1)
  {
    sub_24015B82C(a1 + v7);
    long long v15 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v15;
    long long v17 = *(_OWORD *)(v9 + 48);
    long long v16 = *(_OWORD *)(v9 + 64);
    long long v18 = *(_OWORD *)(v9 + 32);
    *(void *)(v8 + 80) = *(void *)(v9 + 80);
    *(_OWORD *)(v8 + 48) = v17;
    *(_OWORD *)(v8 + 64) = v16;
    *(_OWORD *)(v8 + 32) = v18;
  }
  else
  {
    *(void *)uint64_t v8 = v10;
    swift_retain();
    swift_release();
    uint64_t v22 = *(void *)(v9 + 8);
    *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
    *(void *)(v8 + 8) = v22;
    uint64_t v23 = *(void *)(v9 + 24);
    *(unsigned char *)(v8 + 32) = *(unsigned char *)(v9 + 32);
    *(void *)(v8 + 24) = v23;
    *(void *)(v8 + 40) = *(void *)(v9 + 40);
    *(void *)(v8 + 48) = *(void *)(v9 + 48);
    *(void *)(v8 + 56) = *(void *)(v9 + 56);
    *(void *)(v8 + 64) = *(void *)(v9 + 64);
    *(void *)(v8 + 72) = *(void *)(v9 + 72);
    *(void *)(v8 + 80) = *(void *)(v9 + 80);
  }
  uint64_t v24 = *(int *)(a3 + 24);
  uint64_t v25 = a1 + v24;
  id v26 = (long long *)(a2 + v24);
  uint64_t v27 = *((void *)v26 + 3);
  if (*(void *)(a1 + v24 + 24))
  {
    if (v27)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)v25, (uint64_t *)v26);
      goto LABEL_15;
    }
    __swift_destroy_boxed_opaque_existential_1(v25);
  }
  else if (v27)
  {
    *(void *)(v25 + 24) = v27;
    *(void *)(v25 + 32) = *((void *)v26 + 4);
    (**(void (***)(uint64_t, long long *))(v27 - 8))(v25, v26);
    goto LABEL_15;
  }
  long long v28 = *v26;
  long long v29 = v26[1];
  *(void *)(v25 + 32) = *((void *)v26 + 4);
  *(_OWORD *)uint64_t v25 = v28;
  *(_OWORD *)(v25 + 16) = v29;
LABEL_15:
  uint64_t v30 = *((void *)v26 + 8);
  if (!*(void *)(v25 + 64))
  {
    if (v30)
    {
      *(void *)(v25 + 64) = v30;
      *(void *)(v25 + 72) = *((void *)v26 + 9);
      (**(void (***)(uint64_t, uint64_t))(v30 - 8))(v25 + 40, (uint64_t)v26 + 40);
      goto LABEL_22;
    }
LABEL_21:
    long long v31 = *(long long *)((char *)v26 + 40);
    long long v32 = *(long long *)((char *)v26 + 56);
    *(void *)(v25 + 72) = *((void *)v26 + 9);
    *(_OWORD *)(v25 + 40) = v31;
    *(_OWORD *)(v25 + 56) = v32;
    goto LABEL_22;
  }
  if (!v30)
  {
    __swift_destroy_boxed_opaque_existential_1(v25 + 40);
    goto LABEL_21;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(v25 + 40), (uint64_t *)v26 + 5);
LABEL_22:
  *(void *)(v25 + 80) = *((void *)v26 + 10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24015B82C(uint64_t a1)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        long long v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t initializeWithTake for PersonInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_240165000();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 48) = v11;
  *(_OWORD *)(v9 + 64) = *(_OWORD *)(v10 + 64);
  *(void *)(v9 + 80) = *(void *)(v10 + 80);
  long long v12 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v12;
  uint64_t v13 = a1 + v8;
  uint64_t v14 = a2 + v8;
  long long v15 = *(_OWORD *)(v14 + 48);
  *(_OWORD *)(v13 + 32) = *(_OWORD *)(v14 + 32);
  *(_OWORD *)(v13 + 48) = v15;
  *(_OWORD *)(v13 + 64) = *(_OWORD *)(v14 + 64);
  *(void *)(v13 + 80) = *(void *)(v14 + 80);
  long long v16 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v16;
  return a1;
}

uint64_t assignWithTake for PersonInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_240165000();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  if (*(void *)(a1 + v7) == 1) {
    goto LABEL_4;
  }
  if (*(void *)v9 == 1)
  {
    sub_24015B82C(v8);
LABEL_4:
    long long v10 = *(_OWORD *)(v9 + 48);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v8 + 48) = v10;
    *(_OWORD *)(v8 + 64) = *(_OWORD *)(v9 + 64);
    *(void *)(v8 + 80) = *(void *)(v9 + 80);
    long long v11 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v11;
    goto LABEL_6;
  }
  *(void *)uint64_t v8 = *(void *)v9;
  swift_release();
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  *(unsigned char *)(v8 + 32) = *(unsigned char *)(v9 + 32);
  *(_OWORD *)(v8 + 40) = *(_OWORD *)(v9 + 40);
  *(_OWORD *)(v8 + 56) = *(_OWORD *)(v9 + 56);
  *(_OWORD *)(v8 + 72) = *(_OWORD *)(v9 + 72);
LABEL_6:
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  if (*(void *)(a1 + v12 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v13);
  }
  long long v15 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v15;
  *(void *)(v13 + 32) = *(void *)(v14 + 32);
  if (*(void *)(v13 + 64)) {
    __swift_destroy_boxed_opaque_existential_1(v13 + 40);
  }
  long long v16 = *(_OWORD *)(v14 + 56);
  *(_OWORD *)(v13 + 40) = *(_OWORD *)(v14 + 40);
  *(_OWORD *)(v13 + 56) = v16;
  uint64_t v17 = *(void *)(v14 + 80);
  *(void *)(v13 + 72) = *(void *)(v14 + 72);
  *(void *)(v13 + 80) = v17;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PersonInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24015BCF0);
}

uint64_t sub_24015BCF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_240165000();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 80);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for PersonInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24015BDC8);
}

uint64_t sub_24015BDC8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_240165000();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 80) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24015BE88()
{
  uint64_t result = sub_240165000();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_24015BF28(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_24015BF3C(a1, a2, a3, a4, &qword_268C83B60, &qword_268C83B68);
}

void *sub_24015BF3C(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = a4[2];
    if (v10 <= v11) {
      uint64_t v12 = a4[2];
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      uint64_t v13 = (void *)swift_allocObject();
      size_t v14 = _swift_stdlib_malloc_size(v13);
      v13[2] = v11;
      v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
      long long v15 = v13 + 4;
      if (v8)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[5 * v11 + 4]) {
          memmove(v15, a4 + 4, 40 * v11);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x263F8EE78];
      long long v15 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24015C1C8(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_24015C06C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_240165510();
  __break(1u);
  return result;
}

uint64_t sub_24015C1C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 40 * a1 + 32;
    unint64_t v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_240165510();
  __break(1u);
  return result;
}

uint64_t sub_24015C2D4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_240165510();
  __break(1u);
  return result;
}

uint64_t static StatusCompatiblePicker.statusForDisplay(from:featureFlags:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_240164E10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24015CAB0(a1, a2, (uint64_t)v57);
  sub_2401586E0((uint64_t)v57, (uint64_t)&v51, &qword_26AF51E70);
  if (v52)
  {
    sub_24015DB80(&v51, (uint64_t)&v54);
    __swift_project_boxed_opaque_existential_1(&v54, v55);
    sub_240164E40();
    uint64_t v10 = v55;
    uint64_t v11 = v56;
    unint64_t v12 = __swift_project_boxed_opaque_existential_1(&v54, v55);
    uint64_t v52 = v10;
    uint64_t v53 = *(void *)(v11 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v51);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(boxed_opaque_existential_1, v12, v10);
    sub_24015DB80(&v51, (uint64_t)v48);
    uint64_t v14 = MEMORY[0x263F8EE80];
    LOBYTE(v12) = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v47 = v14;
    uint64_t v15 = v49;
    uint64_t v16 = v50;
    uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v48, v49);
    MEMORY[0x270FA5388](v17);
    uint64_t v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v20 + 16))(v19);
    sub_24015F6C8((uint64_t)v19, (uint64_t)v9, (char)v12, &v47, v15, v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    uint64_t v21 = v47;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
  }
  else
  {
    sub_240158744((uint64_t)&v51, &qword_26AF51E70);
    uint64_t v21 = MEMORY[0x263F8EE80];
  }
  sub_2401586E0((uint64_t)v58 + 8, (uint64_t)&v51, &qword_268C83B28);
  if (v52)
  {
    sub_24015DB80(&v51, (uint64_t)&v54);
    __swift_project_boxed_opaque_existential_1(&v54, v55);
    sub_240164E40();
    uint64_t v22 = v55;
    uint64_t v23 = v56;
    uint64_t v24 = __swift_project_boxed_opaque_existential_1(&v54, v55);
    uint64_t v52 = v22;
    uint64_t v53 = *(void *)(v23 + 8);
    uint64_t v25 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v51);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v25, v24, v22);
    sub_24015DB80(&v51, (uint64_t)v48);
    LOBYTE(v22) = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v47 = v21;
    uint64_t v26 = v49;
    uint64_t v27 = v50;
    uint64_t v28 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v48, v49);
    MEMORY[0x270FA5388](v28);
    uint64_t v30 = (char *)&v46 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v31 + 16))(v30);
    sub_24015F6C8((uint64_t)v30, (uint64_t)v9, v22, &v47, v26, v27);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    uint64_t v21 = v47;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
  }
  else
  {
    sub_240158744((uint64_t)&v51, &qword_268C83B28);
  }
  uint64_t v32 = v21 + 64;
  uint64_t v33 = 1 << *(unsigned char *)(v21 + 32);
  uint64_t v34 = -1;
  if (v33 < 64) {
    uint64_t v34 = ~(-1 << v33);
  }
  unint64_t v35 = v34 & *(void *)(v21 + 64);
  int64_t v36 = (unint64_t)(v33 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain_n();
  int64_t v38 = 0;
  while (1)
  {
    if (v35)
    {
      unint64_t v39 = __clz(__rbit64(v35));
      v35 &= v35 - 1;
      unint64_t v40 = v39 | (v38 << 6);
      goto LABEL_11;
    }
    int64_t v41 = v38 + 1;
    if (__OFADD__(v38, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v41 >= v36) {
      goto LABEL_31;
    }
    unint64_t v42 = *(void *)(v32 + 8 * v41);
    ++v38;
    if (!v42)
    {
      int64_t v38 = v41 + 1;
      if (v41 + 1 >= v36) {
        goto LABEL_31;
      }
      unint64_t v42 = *(void *)(v32 + 8 * v38);
      if (!v42)
      {
        int64_t v38 = v41 + 2;
        if (v41 + 2 >= v36) {
          goto LABEL_31;
        }
        unint64_t v42 = *(void *)(v32 + 8 * v38);
        if (!v42)
        {
          int64_t v38 = v41 + 3;
          if (v41 + 3 >= v36) {
            goto LABEL_31;
          }
          unint64_t v42 = *(void *)(v32 + 8 * v38);
          if (!v42)
          {
            int64_t v38 = v41 + 4;
            if (v41 + 4 >= v36) {
              goto LABEL_31;
            }
            unint64_t v42 = *(void *)(v32 + 8 * v38);
            if (!v42) {
              break;
            }
          }
        }
      }
    }
LABEL_30:
    unint64_t v35 = (v42 - 1) & v42;
    unint64_t v40 = __clz(__rbit64(v42)) + (v38 << 6);
LABEL_11:
    sub_240159440(*(void *)(v21 + 56) + 40 * v40, (uint64_t)&v54);
    sub_24015DB80(&v54, (uint64_t)&v51);
    sub_240164DD0();
    sub_240164DC0();
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v51);
  }
  int64_t v43 = v41 + 5;
  if (v43 >= v36)
  {
LABEL_31:
    swift_release();
    swift_bridgeObjectRelease();
    long long v44 = v58[1];
    *(_OWORD *)(a3 + 32) = v58[0];
    *(_OWORD *)(a3 + 48) = v44;
    *(_OWORD *)(a3 + 64) = v58[2];
    *(void *)(a3 + 80) = v59;
    long long v45 = v57[1];
    *(_OWORD *)a3 = v57[0];
    *(_OWORD *)(a3 + 16) = v45;
    return swift_bridgeObjectRelease();
  }
  unint64_t v42 = *(void *)(v32 + 8 * v43);
  if (v42)
  {
    int64_t v38 = v43;
    goto LABEL_30;
  }
  while (1)
  {
    int64_t v38 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v38 >= v36) {
      goto LABEL_31;
    }
    unint64_t v42 = *(void *)(v32 + 8 * v38);
    ++v43;
    if (v42) {
      goto LABEL_30;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t PersonStatusSet.badge.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2401586E0(v1, a1, &qword_26AF51E70);
}

uint64_t PersonStatusSet.text.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2401586E0(v1 + 40, a1, &qword_268C83B28);
}

uint64_t PersonStatusSet.additionalBadges.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PersonStatusSet.init(badge:text:additionalBadges:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_24015FE88(a1, a4, &qword_26AF51E70);
  uint64_t result = sub_24015FE88(a2, a4 + 40, &qword_268C83B28);
  *(void *)(a4 + 80) = a3;
  return result;
}

uint64_t sub_24015CAB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v127 = a2;
  uint64_t v5 = sub_240164CC0();
  uint64_t v121 = *(void *)(v5 - 8);
  uint64_t v122 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v116 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v117 = (char *)&v116 - v9;
  uint64_t v126 = sub_240164D90();
  uint64_t v10 = *(void *)(v126 - 8);
  MEMORY[0x270FA5388](v126);
  v125 = (char *)&v116 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_240164E10();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v128 = (char *)&v116 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v137 = (char *)&v116 - v17;
  uint64_t result = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v116 - v19;
  uint64_t v21 = *(void *)(a1 + 16);
  if (!v21)
  {
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
    *(void *)(a3 + 80) = MEMORY[0x263F8EE78];
    return result;
  }
  uint64_t v124 = v10;
  uint64_t v120 = a3;
  uint64_t v132 = a1 + 32;
  sub_240159440(a1 + 32, (uint64_t)v158);
  long long v155 = xmmword_240165A90;
  v119 = v156;
  sub_240159440((uint64_t)v158, (uint64_t)v156);
  v118 = (uint8_t *)&v157;
  os_log_t v136 = (os_log_t)(v13 + 16);
  v130 = (uint8_t *)v13;
  uint64_t v22 = (void (**)(char *, uint64_t))(v13 + 8);
  swift_bridgeObjectRetain();
  uint64_t v23 = 0;
  v116 = v8;
  v138 = (void (**)(char *, uint64_t))(v13 + 8);
  v139 = (char *)v12;
  uint64_t v123 = a1;
  uint64_t v131 = v21;
  uint64_t v135 = (uint64_t)v20;
  while (1)
  {
    uint64_t v134 = v23;
    sub_240159440(v132 + 40 * v23, (uint64_t)&v152);
    __swift_project_boxed_opaque_existential_1(v158, v158[3]);
    uint64_t v24 = sub_240164E30();
    __swift_project_boxed_opaque_existential_1(&v152, *((uint64_t *)&v153 + 1));
    uint64_t v25 = v24;
    sub_240164E40();
    uint64_t v26 = *(void *)(v24 + 16);
    uint64_t v27 = (unint64_t)v22 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    if (v26)
    {
      uint64_t v133 = (unint64_t)v22 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      uint64_t v28 = v130;
      unint64_t v29 = (v130[80] + 32) & ~(unint64_t)v130[80];
      uint64_t v30 = (void (*)(char *, uint64_t))*((void *)v130 + 2);
      uint64_t v31 = v137;
      ((void (*)(char *, unint64_t, uint64_t))v30)(v137, v25 + v29, v12);
      sub_24015FEEC(&qword_268C83B90);
      swift_bridgeObjectRetain();
      char v32 = sub_240165310();
      uint64_t v33 = v31;
      uint64_t v22 = v138;
      v140 = (void (*)(char *, uint64_t))*((void *)v28 + 1);
      v140(v33, v12);
      if (v32)
      {
        swift_bridgeObjectRelease();
        char v34 = 1;
        uint64_t v30 = v140;
        uint64_t v20 = (char *)v135;
        uint64_t v35 = v131;
      }
      else
      {
        v129 = (uint8_t *)v25;
        if (v26 != 1)
        {
          uint64_t v36 = *((void *)v130 + 9);
          uint64_t v37 = &v129[v36 + v29];
          uint64_t v27 = 1;
          while (1)
          {
            int64_t v38 = v137;
            unint64_t v39 = v139;
            ((void (*)(char *, uint8_t *, char *))v30)(v137, v37, v139);
            uint64_t v40 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              break;
            }
            char v41 = sub_240165310();
            unint64_t v42 = v38;
            char v43 = v41;
            v140(v42, (uint64_t)v39);
            if (v43)
            {
              swift_bridgeObjectRelease();
              char v34 = 1;
              goto LABEL_16;
            }
            ++v27;
            v37 += v36;
            if (v40 == v26)
            {
              swift_bridgeObjectRelease();
              char v34 = 0;
LABEL_16:
              uint64_t v12 = (uint64_t)v139;
              uint64_t v30 = v140;
              uint64_t v27 = v133;
              uint64_t v35 = v131;
              uint64_t v20 = (char *)v135;
              uint64_t v22 = v138;
              goto LABEL_17;
            }
          }
          __break(1u);
          goto LABEL_84;
        }
        swift_bridgeObjectRelease();
        char v34 = 0;
        uint64_t v30 = v140;
        uint64_t v20 = (char *)v135;
        uint64_t v35 = v131;
      }
      uint64_t v27 = v133;
LABEL_17:
      v30(v20, v12);
    }
    else
    {
      char v34 = 0;
      uint64_t v30 = *v22;
      uint64_t v35 = v131;
      (*v22)(v20, v12);
    }
    swift_bridgeObjectRelease();
    if (v34) {
      break;
    }
    uint64_t v23 = v134 + 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v152);
    if (v23 == v35)
    {
      swift_bridgeObjectRelease();
      uint64_t v37 = v118;
      *((void *)v118 + 4) = 0;
      *(_OWORD *)uint64_t v37 = 0u;
      *((_OWORD *)v37 + 1) = 0u;
      goto LABEL_23;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v37 = v118;
  sub_24015DB80(&v152, (uint64_t)v118);
LABEL_23:
  sub_2401586E0((uint64_t)v119, (uint64_t)&v152, &qword_268C83B98);
  sub_24015FE88((uint64_t)&v152, (uint64_t)&v146, &qword_268C83B98);
  if (!*((void *)&v147 + 1))
  {
    sub_240158744((uint64_t)&v146, &qword_268C83B98);
    uint64_t v46 = (char *)MEMORY[0x263F8EE78];
    goto LABEL_29;
  }
  sub_24015DB80(&v146, (uint64_t)&v149);
  sub_24015DB80(&v149, (uint64_t)&v146);
  unint64_t v39 = (char *)MEMORY[0x263F8EE78];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_84:
  }
    unint64_t v39 = (char *)sub_24015AF80(0, *((void *)v39 + 2) + 1, 1, v39);
  unint64_t v45 = *((void *)v39 + 2);
  unint64_t v44 = *((void *)v39 + 3);
  uint64_t v46 = v39;
  if (v45 >= v44 >> 1) {
    uint64_t v46 = (char *)sub_24015AF80((void *)(v44 > 1), v45 + 1, 1, v39);
  }
  *((void *)v46 + 2) = v45 + 1;
  sub_24015DB80(&v146, (uint64_t)&v46[40 * v45 + 32]);
LABEL_29:
  sub_2401586E0((uint64_t)v37, (uint64_t)&v152, &qword_268C83B98);
  sub_24015FE88((uint64_t)&v152, (uint64_t)&v146, &qword_268C83B98);
  v140 = v30;
  if (*((void *)&v147 + 1))
  {
    sub_24015DB80(&v146, (uint64_t)&v149);
    sub_24015DB80(&v149, (uint64_t)&v146);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v46 = (char *)sub_24015AF80(0, *((void *)v46 + 2) + 1, 1, v46);
    }
    unint64_t v48 = *((void *)v46 + 2);
    unint64_t v47 = *((void *)v46 + 3);
    if (v48 >= v47 >> 1) {
      uint64_t v46 = (char *)sub_24015AF80((void *)(v47 > 1), v48 + 1, 1, v46);
    }
    *((void *)v46 + 2) = v48 + 1;
    sub_24015DB80(&v146, (uint64_t)&v46[40 * v48 + 32]);
  }
  else
  {
    sub_240158744((uint64_t)&v146, &qword_268C83B98);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83B98);
  swift_arrayDestroy();
  uint64_t v49 = *((void *)v46 + 2);
  uint64_t v133 = v27;
  v137 = v46;
  if (!v49)
  {
LABEL_46:
    long long v152 = 0u;
    long long v153 = 0u;
    uint64_t v154 = 0;
    goto LABEL_47;
  }
  uint64_t v50 = (uint64_t)(v46 + 32);
  swift_bridgeObjectRetain();
  long long v51 = &qword_268C83B58;
  uint64_t v52 = &qword_268C83B68;
  uint64_t v53 = v49;
  while (2)
  {
    sub_240159440(v50, (uint64_t)&v152);
    sub_240159440((uint64_t)&v152, (uint64_t)&v143);
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(v51);
    __swift_instantiateConcreteTypeFromMangledName(v52);
    if (!swift_dynamicCast())
    {
      uint64_t v148 = 0;
      long long v146 = 0u;
      long long v147 = 0u;
      sub_240158744((uint64_t)&v146, &qword_26AF51E70);
      goto LABEL_39;
    }
    v138 = (void (**)(char *, uint64_t))v54;
    uint64_t v55 = v49;
    uint64_t v56 = v52;
    uint64_t v57 = v51;
    uint64_t v59 = *((void *)&v147 + 1);
    uint64_t v58 = v148;
    __swift_project_boxed_opaque_existential_1(&v146, *((uint64_t *)&v147 + 1));
    unint64_t v60 = *(uint64_t (**)(uint64_t, uint64_t))(v58 + 48);
    uint64_t v61 = v58;
    long long v51 = v57;
    uint64_t v52 = v56;
    uint64_t v49 = v55;
    uint64_t v62 = v60(v59, v61);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v146);
    swift_release();
    if (!v62)
    {
LABEL_39:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v152);
      v50 += 40;
      if (!--v53)
      {
        swift_bridgeObjectRelease();
        goto LABEL_46;
      }
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  sub_24015DB80(&v152, (uint64_t)&v149);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v154 = 0;
    long long v152 = 0u;
    long long v153 = 0u;
  }
LABEL_47:
  uint64_t v63 = MEMORY[0x263F8EE78];
  sub_2401586E0((uint64_t)&v152, (uint64_t)&v146, &qword_26AF51E70);
  uint64_t v64 = v124;
  uint64_t v65 = (void (***)(char *, uint64_t))(v124 + 104);
  char v66 = (unsigned int *)MEMORY[0x263F5D170];
  if (*((void *)&v147 + 1))
  {
    sub_24015DB80(&v146, (uint64_t)&v149);
    uint64_t v67 = *v66;
    uint64_t v68 = v125;
    uint64_t v69 = v126;
    v138 = *(void (***)(char *, uint64_t))(v64 + 104);
    ((void (*)(char *, uint64_t, uint64_t))v138)(v125, v67, v126);
    char v70 = sub_240164F60();
    (*(void (**)(char *, uint64_t))(v64 + 8))(v68, v69);
    if (v70)
    {
      char v71 = v117;
      sub_240164DA0();
      sub_240159440((uint64_t)&v149, (uint64_t)&v146);
      uint64_t v72 = sub_240164CB0();
      os_log_type_t v73 = sub_240165430();
      int v74 = v73;
      if (os_log_type_enabled(v72, v73))
      {
        os_log_t v136 = v72;
        uint64_t v75 = swift_slowAlloc();
        LODWORD(v134) = v74;
        int v76 = (uint8_t *)v75;
        uint64_t v135 = swift_slowAlloc();
        *(void *)&long long v143 = v135;
        *(_DWORD *)int v76 = 136315138;
        v129 = v76 + 4;
        v130 = v76;
        __swift_project_boxed_opaque_existential_1(&v146, *((uint64_t *)&v147 + 1));
        uint64_t v77 = v128;
        sub_240164E40();
        sub_24015FEEC(&qword_268C83BA8);
        uint64_t v78 = v139;
        uint64_t v79 = sub_240165530();
        unint64_t v81 = v80;
        v140(v77, (uint64_t)v78);
        v141[0] = sub_24015E174(v79, v81, (uint64_t *)&v143);
        sub_240165480();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v146);
        os_log_t v82 = v136;
        uint64_t v83 = v130;
        _os_log_impl(&dword_24014D000, v136, (os_log_type_t)v134, "Primary badge: %s", v130, 0xCu);
        uint64_t v84 = v135;
        swift_arrayDestroy();
        MEMORY[0x2455E0750](v84, -1, -1);
        MEMORY[0x2455E0750](v83, -1, -1);
      }
      else
      {

        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v146);
      }
      (*(void (**)(char *, uint64_t))(v121 + 8))(v71, v122);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v149);
    uint64_t v63 = MEMORY[0x263F8EE78];
    uint64_t v85 = v138;
  }
  else
  {
    sub_240158744((uint64_t)&v146, &qword_26AF51E70);
    uint64_t v67 = *v66;
    uint64_t v85 = *v65;
  }
  uint64_t v142 = v63;
  uint64_t v86 = v125;
  uint64_t v87 = v67;
  uint64_t v88 = v126;
  ((void (*)(char *, uint64_t, uint64_t))v85)(v125, v87, v126);
  char v89 = sub_240164F60();
  (*(void (**)(char *, uint64_t))(v124 + 8))(v86, v88);
  if (v89)
  {
    swift_bridgeObjectRetain();
    uint64_t v90 = v131;
    uint64_t v91 = v132;
    do
    {
      sub_24015DB98(v91, (uint64_t)&v152, (uint64_t)&v142);
      v91 += 40;
      --v90;
    }
    while (v90);
    swift_bridgeObjectRelease();
    uint64_t v92 = (void (**)(char *, uint64_t))v142;
    int64_t v93 = *(void *)(v142 + 16);
    if (v93)
    {
      *(void *)&long long v146 = v63;
      swift_bridgeObjectRetain();
      sub_24015E880(0, v93, 0);
      v138 = v92;
      uint64_t v94 = (uint64_t)(v92 + 4);
      do
      {
        sub_240159440(v94, (uint64_t)&v149);
        __swift_project_boxed_opaque_existential_1(&v149, *((uint64_t *)&v150 + 1));
        uint64_t v95 = v128;
        sub_240164E40();
        sub_24015FEEC(&qword_268C83BA8);
        uint64_t v96 = v139;
        uint64_t v97 = sub_240165530();
        uint64_t v99 = v98;
        v140(v95, (uint64_t)v96);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v149);
        uint64_t v100 = v146;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24015E880(0, *(void *)(v100 + 16) + 1, 1);
          uint64_t v100 = v146;
        }
        unint64_t v102 = *(void *)(v100 + 16);
        unint64_t v101 = *(void *)(v100 + 24);
        if (v102 >= v101 >> 1)
        {
          sub_24015E880(v101 > 1, v102 + 1, 1);
          uint64_t v100 = v146;
        }
        *(void *)(v100 + 16) = v102 + 1;
        uint64_t v103 = v100 + 16 * v102;
        *(void *)(v103 + 32) = v97;
        *(void *)(v103 + 40) = v99;
        v94 += 40;
        --v93;
      }
      while (v93);
      swift_bridgeObjectRelease();
      *(void *)&long long v149 = v100;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C83B30);
      sub_24015A8D8();
      uint64_t v104 = sub_240165300();
      unint64_t v106 = v105;
      swift_release();
      uint64_t v107 = v116;
      sub_240164DA0();
      swift_bridgeObjectRetain();
      uint64_t v108 = sub_240164CB0();
      os_log_type_t v109 = sub_240165430();
      if (os_log_type_enabled(v108, v109))
      {
        v110 = (uint8_t *)swift_slowAlloc();
        uint64_t v111 = swift_slowAlloc();
        *(void *)&long long v149 = v111;
        *(_DWORD *)v110 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)&long long v146 = sub_24015E174(v104, v106, (uint64_t *)&v149);
        sub_240165480();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24014D000, v108, v109, "Other badges: %s", v110, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2455E0750](v111, -1, -1);
        MEMORY[0x2455E0750](v110, -1, -1);

        (*(void (**)(char *, uint64_t))(v121 + 8))(v116, v122);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v121 + 8))(v107, v122);
      }
    }
  }
  if (v49)
  {
    uint64_t v112 = (uint64_t)(v137 + 32);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_240159440(v112, (uint64_t)&v149);
      sub_240159440((uint64_t)&v149, (uint64_t)v141);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C83B58);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BA0);
      if (swift_dynamicCast())
      {
        __swift_project_boxed_opaque_existential_1(&v143, *((uint64_t *)&v144 + 1));
        sub_240164E20();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v143);
      }
      else
      {
        uint64_t v145 = 0;
        long long v143 = 0u;
        long long v144 = 0u;
        sub_240158744((uint64_t)&v143, &qword_268C83B28);
      }
      sub_240165380();
      uint64_t v114 = v113;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v114) {
        break;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v149);
      v112 += 40;
      if (!--v49)
      {
        swift_bridgeObjectRelease();
        goto LABEL_76;
      }
    }
    swift_bridgeObjectRelease();
    sub_24015DB80(&v149, (uint64_t)&v146);
  }
  else
  {
LABEL_76:
    uint64_t v148 = 0;
    long long v146 = 0u;
    long long v147 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v147 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C83B58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BA0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      uint64_t v151 = 0;
      long long v149 = 0u;
      long long v150 = 0u;
    }
  }
  else
  {
    sub_240158744((uint64_t)&v146, &qword_268C83B98);
    long long v149 = 0u;
    long long v150 = 0u;
    uint64_t v151 = 0;
  }
  uint64_t v115 = v120;
  sub_2401586E0((uint64_t)&v152, v120, &qword_26AF51E70);
  sub_2401586E0((uint64_t)&v149, v115 + 40, &qword_268C83B28);
  *(void *)(v115 + 80) = v142;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v158);
  sub_240158744((uint64_t)&v149, &qword_268C83B28);
  swift_bridgeObjectRelease();
  return sub_240158744((uint64_t)&v152, &qword_26AF51E70);
}

uint64_t sub_24015DB80(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24015DB98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v42 = a2;
  uint64_t v6 = sub_240164E10();
  uint64_t v50 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF51E50);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF51E48);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  char v41 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v37 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v37 - v18;
  sub_240159440(a1, (uint64_t)&v45);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83B58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83B68);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v44 = 0;
    memset(v43, 0, sizeof(v43));
    return sub_240158744((uint64_t)v43, &qword_26AF51E70);
  }
  int64_t v38 = v8;
  uint64_t v40 = a3;
  sub_24015DB80(v43, (uint64_t)v47);
  uint64_t v20 = v48;
  uint64_t v21 = v49;
  __swift_project_boxed_opaque_existential_1(v47, v48);
  uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 48))(v20, v21);
  swift_release();
  if (v22)
  {
    uint64_t v39 = v3;
    __swift_project_boxed_opaque_existential_1(v47, v48);
    sub_240164E40();
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56);
    v23(v19, 0, 1, v6);
    sub_2401586E0(v42, (uint64_t)&v45, &qword_26AF51E70);
    if (v46)
    {
      __swift_project_boxed_opaque_existential_1(&v45, v46);
      sub_240164E40();
      v23(v17, 0, 1, v6);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
    }
    else
    {
      sub_240158744((uint64_t)&v45, &qword_26AF51E70);
      v23(v17, 1, 1, v6);
    }
    uint64_t v25 = (uint64_t)&v11[*(int *)(v9 + 48)];
    sub_2401586E0((uint64_t)v19, (uint64_t)v11, &qword_26AF51E48);
    sub_2401586E0((uint64_t)v17, v25, &qword_26AF51E48);
    uint64_t v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48);
    if (v26((uint64_t)v11, 1, v6) == 1)
    {
      sub_240158744((uint64_t)v17, &qword_26AF51E48);
      sub_240158744((uint64_t)v19, &qword_26AF51E48);
      if (v26(v25, 1, v6) == 1)
      {
        sub_240158744((uint64_t)v11, &qword_26AF51E48);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
      }
    }
    else
    {
      uint64_t v27 = (uint64_t)v41;
      sub_2401586E0((uint64_t)v11, (uint64_t)v41, &qword_26AF51E48);
      if (v26(v25, 1, v6) != 1)
      {
        uint64_t v29 = v50;
        uint64_t v30 = v38;
        (*(void (**)(char *, uint64_t, uint64_t))(v50 + 32))(v38, v25, v6);
        sub_24015FEEC(&qword_268C83B90);
        LODWORD(v42) = sub_240165310();
        uint64_t v31 = *(void (**)(char *, uint64_t))(v29 + 8);
        v31(v30, v6);
        sub_240158744((uint64_t)v17, &qword_26AF51E48);
        sub_240158744((uint64_t)v19, &qword_26AF51E48);
        v31(v41, v6);
        sub_240158744((uint64_t)v11, &qword_26AF51E48);
        uint64_t v28 = v40;
        if (v42) {
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
        }
LABEL_14:
        char v32 = *(void **)v28;
        unint64_t v33 = *(void *)(*(void *)v28 + 16);
        if (v33 <= 1)
        {
          sub_240159440((uint64_t)v47, (uint64_t)&v45);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(void *)uint64_t v28 = v32;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            char v32 = sub_24015BF28(0, v33 + 1, 1, v32);
            *(void *)uint64_t v28 = v32;
          }
          unint64_t v36 = v32[2];
          unint64_t v35 = v32[3];
          if (v36 >= v35 >> 1)
          {
            char v32 = sub_24015BF28((void *)(v35 > 1), v36 + 1, 1, v32);
            *(void *)uint64_t v28 = v32;
          }
          v32[2] = v36 + 1;
          sub_24015DB80(&v45, (uint64_t)&v32[5 * v36 + 4]);
        }
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
      }
      sub_240158744((uint64_t)v17, &qword_26AF51E48);
      sub_240158744((uint64_t)v19, &qword_26AF51E48);
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v27, v6);
    }
    sub_240158744((uint64_t)v11, &qword_26AF51E50);
    uint64_t v28 = v40;
    goto LABEL_14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
}

uint64_t sub_24015E174(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24015E248(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_240158548((uint64_t)v12, *a3);
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
      sub_240158548((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24015E248(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_240165490();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24015E404(a5, a6);
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
  uint64_t v8 = sub_2401654D0();
  if (!v8)
  {
    sub_2401654E0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_240165510();
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

uint64_t sub_24015E404(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24015E49C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24015E67C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24015E67C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24015E49C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24015E614(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2401654C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2401654E0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2401653A0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_240165510();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2401654E0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24015E614(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BB0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24015E67C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BB0);
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
  uint64_t result = sub_240165510();
  __break(1u);
  return result;
}

uint64_t sub_24015E7CC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24015E8A0(a1, a2, a3, (void *)*v3, &qword_268C83B78, type metadata accessor for ActionPoint);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_24015E808(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24015E8A0(a1, a2, a3, (void *)*v3, &qword_268C83B70, type metadata accessor for SignalPoint);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_24015E844(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24015E8A0(a1, a2, a3, (void *)*v3, &qword_268C83930, MEMORY[0x263F07490]);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_24015E880(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24015EAE8(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24015E8A0(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  void v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_240165510();
  __break(1u);
  return result;
}

uint64_t sub_24015EAE8(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C83750);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_240165510();
  __break(1u);
  return result;
}

unint64_t sub_24015EC54(uint64_t a1, uint64_t a2)
{
  sub_240165560();
  sub_240165350();
  uint64_t v4 = sub_240165580();
  return sub_24015ED50(a1, a2, v4);
}

unint64_t sub_24015ECCC(uint64_t a1)
{
  sub_240164E10();
  sub_24015FEEC(&qword_268C83B88);
  uint64_t v2 = sub_2401652F0();
  return sub_24015EE34(a1, v2);
}

unint64_t sub_24015ED50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_240165540() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_240165540() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24015EE34(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_240164E10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_24015FEEC(&qword_268C83B90);
      char v15 = sub_240165310();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_24015EFE0(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = sub_240164E10();
  uint64_t v5 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  int64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83B80);
  int v45 = a2;
  uint64_t v9 = sub_240165500();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
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
  int64_t v38 = v2;
  int64_t v39 = (unint64_t)(v11 + 63) >> 6;
  char v41 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  uint64_t v42 = v8;
  char v43 = v7;
  while (1)
  {
    if (v14)
    {
      unint64_t v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v39) {
      break;
    }
    uint64_t v22 = v40;
    unint64_t v23 = v40[v21];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v39) {
        goto LABEL_34;
      }
      unint64_t v23 = v40[v17];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v39)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v38;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = v40[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v17 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v39) {
              goto LABEL_34;
            }
            unint64_t v23 = v40[v17];
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v24;
      }
    }
LABEL_21:
    unint64_t v14 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_22:
    uint64_t v25 = v5;
    uint64_t v26 = *(void *)(v5 + 72);
    unint64_t v27 = *(void *)(v8 + 48) + v26 * v20;
    uint64_t v28 = v43;
    uint64_t v29 = v44;
    if (v45)
    {
      (*v46)(v43, v27, v44);
      sub_24015DB80((long long *)(*(void *)(v8 + 56) + 40 * v20), (uint64_t)v47);
    }
    else
    {
      (*v41)(v43, v27, v44);
      sub_240159440(*(void *)(v8 + 56) + 40 * v20, (uint64_t)v47);
    }
    sub_24015FEEC(&qword_268C83B88);
    uint64_t result = sub_2401652F0();
    uint64_t v30 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v15 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v31) & ~*(void *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v15 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v18 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    (*v46)((char *)(*(void *)(v10 + 48) + v26 * v18), (unint64_t)v28, v29);
    uint64_t result = sub_24015DB80(v47, *(void *)(v10 + 56) + 40 * v18);
    ++*(void *)(v10 + 16);
    uint64_t v5 = v25;
    uint64_t v8 = v42;
  }
  swift_release();
  uint64_t v3 = v38;
  uint64_t v22 = v40;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v8 + 32);
  if (v37 >= 64) {
    bzero(v22, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v37;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

void *sub_24015F41C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_240164E10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83B80);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_2401654F0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v8;
    return result;
  }
  unint64_t v23 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v24 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v25 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v26 = v3 + 16;
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
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v11);
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
    uint64_t v18 = 40 * v16;
    sub_240159440(*(void *)(v6 + 56) + v18, (uint64_t)v27);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
    uint64_t result = (void *)sub_24015DB80(v27, *(void *)(v8 + 56) + v18);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
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
    if (v11 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24015F6C8(uint64_t a1, uint64_t a2, char a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_240164E10();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = a5;
  uint64_t v37 = a6;
  uint64_t v34 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v35);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(boxed_opaque_existential_1, a1, a5);
  unint64_t v17 = (void *)*a4;
  unint64_t v19 = sub_24015ECCC(a2);
  uint64_t v20 = v17[2];
  BOOL v21 = (v18 & 1) == 0;
  uint64_t v22 = v20 + v21;
  if (__OFADD__(v20, v21))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v23 = v18;
  uint64_t v24 = v17[3];
  if (v24 >= v22 && (a3 & 1) != 0)
  {
LABEL_7:
    int64_t v25 = (void *)*a4;
    if (v23)
    {
LABEL_8:
      uint64_t v26 = v25[7] + 40 * v19;
      __swift_destroy_boxed_opaque_existential_1(v26);
      return sub_24015DB80(&v35, v26);
    }
    goto LABEL_11;
  }
  if (v24 >= v22 && (a3 & 1) == 0)
  {
    sub_24015F41C();
    goto LABEL_7;
  }
  sub_24015EFE0(v22, a3 & 1);
  unint64_t v28 = sub_24015ECCC(a2);
  if ((v23 & 1) != (v29 & 1))
  {
LABEL_14:
    uint64_t result = sub_240165550();
    __break(1u);
    return result;
  }
  unint64_t v19 = v28;
  int64_t v25 = (void *)*a4;
  if (v23) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a2, v12);
  uint64_t v30 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v35, v36);
  MEMORY[0x270FA5388](v30);
  unint64_t v32 = (char *)&v34 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v33 + 16))(v32);
  sub_24015FD7C(v19, (uint64_t)v15, (uint64_t)v32, v25, a5, v34);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t destroy for PersonStatusSet(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  if (*(void *)(a1 + 64)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PersonStatusSet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  uint64_t v7 = (_OWORD *)(a1 + 40);
  uint64_t v8 = (_OWORD *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 64);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = v9;
    *(void *)(a1 + 72) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }
  else
  {
    long long v11 = *(_OWORD *)(a2 + 56);
    _OWORD *v7 = *v8;
    *(_OWORD *)(a1 + 56) = v11;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
  }
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PersonStatusSet(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 3);
  if (*(void *)(a1 + 24))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else if (v4)
  {
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
    goto LABEL_8;
  }
  long long v5 = *a2;
  long long v6 = a2[1];
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *(_OWORD *)a1 = v5;
  *(_OWORD *)(a1 + 16) = v6;
LABEL_8:
  uint64_t v7 = *((void *)a2 + 8);
  if (!*(void *)(a1 + 64))
  {
    if (v7)
    {
      *(void *)(a1 + 64) = v7;
      *(void *)(a1 + 72) = *((void *)a2 + 9);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, (uint64_t)a2 + 40);
      goto LABEL_15;
    }
LABEL_14:
    long long v8 = *(long long *)((char *)a2 + 40);
    long long v9 = *(long long *)((char *)a2 + 56);
    *(void *)(a1 + 72) = *((void *)a2 + 9);
    *(_OWORD *)(a1 + 40) = v8;
    *(_OWORD *)(a1 + 56) = v9;
    goto LABEL_15;
  }
  if (!v7)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
    goto LABEL_14;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)a2 + 5);
LABEL_15:
  *(void *)(a1 + 80) = *((void *)a2 + 10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PersonStatusSet(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (*(void *)(a1 + 64)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  }
  long long v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PersonStatusSet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 80);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PersonStatusSet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
      *(void *)(result + 80) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PersonStatusSet()
{
  return &type metadata for PersonStatusSet;
}

ValueMetadata *type metadata accessor for StatusCompatiblePicker()
{
  return &type metadata for StatusCompatiblePicker;
}

uint64_t sub_24015FD7C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v19 = a5;
  uint64_t v20 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(boxed_opaque_existential_1, a3, a5);
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v12 = a4[6];
  uint64_t v13 = sub_240164E10();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v12 + *(void *)(*(void *)(v13 - 8) + 72) * a1, a2, v13);
  uint64_t result = sub_24015DB80(&v18, a4[7] + 40 * a1);
  uint64_t v15 = a4[2];
  BOOL v16 = __OFADD__(v15, 1);
  uint64_t v17 = v15 + 1;
  if (v16) {
    __break(1u);
  }
  else {
    a4[2] = v17;
  }
  return result;
}

uint64_t sub_24015FE88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24015FEEC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_240164E10();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

UIImage __swiftcall UIImage.crop(relativeTo:)(__C::CGRect relativeTo)
{
  CGFloat height = relativeTo.size.height;
  CGFloat width = relativeTo.size.width;
  CGFloat y = relativeTo.origin.y;
  CGFloat x = relativeTo.origin.x;
  objc_msgSend(v1, sel_size);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat v10 = CGRectGetWidth(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat v11 = CGRectGetHeight(v24);
  CGAffineTransformMakeScale(&v21, v10, v11);
  v22.CGFloat width = v7;
  v22.CGFloat height = v9;
  CGSize v12 = CGSizeApplyAffineTransform(v22, &v21);
  sub_240160404();
  id v13 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultFormat);
  objc_msgSend(v1, sel_scale);
  objc_msgSend(v13, sel_setScale_);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827A0]), sel_initWithSize_format_, v13, v12.width, v12.height);

  uint64_t v15 = (CGFloat *)swift_allocObject();
  v15[2] = x;
  v15[3] = y;
  v15[4] = width;
  v15[5] = height;
  *((void *)v15 + 6) = v1;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_240160514;
  *(void *)(v16 + 24) = v15;
  *(void *)&v21.tCGFloat x = sub_240160534;
  *(void *)&v21.tCGFloat y = v16;
  *(void *)&v21.a = MEMORY[0x263EF8330];
  *(void *)&v21.b = 1107296256;
  *(void *)&v21.c = sub_24016055C;
  *(void *)&v21.d = &block_descriptor;
  uint64_t v17 = _Block_copy(&v21);
  id v18 = v1;
  swift_retain();
  swift_release();
  id v19 = objc_msgSend(v14, sel_imageWithActions_, v17);

  _Block_release(v17);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result.super.Class isa = (Class)swift_release();
  if ((v14 & 1) == 0) {
    return (UIImage)v19;
  }
  __break(1u);
  return result;
}

UIImage __swiftcall UIImage.resize(to:)(CGSize to)
{
  double height = to.height;
  double width = to.width;
  sub_240160404();
  id v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultFormat);
  objc_msgSend(v1, sel_scale);
  objc_msgSend(v4, sel_setScale_);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827A0]), sel_initWithSize_format_, v4, width, height);

  double v6 = (double *)swift_allocObject();
  *((void *)v6 + 2) = v1;
  v6[3] = width;
  v6[4] = height;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_2401605F8;
  *(void *)(v7 + 24) = v6;
  v12[4] = sub_24016062C;
  v12[5] = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_24016055C;
  uint64_t v12[3] = &block_descriptor_13;
  double v8 = _Block_copy(v12);
  id v9 = v1;
  swift_retain();
  swift_release();
  id v10 = objc_msgSend(v5, sel_imageWithActions_, v8);

  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result.super.Class isa = (Class)swift_release();
  if ((v5 & 1) == 0) {
    return (UIImage)v10;
  }
  __break(1u);
  return result;
}

UIGraphicsImageRendererFormat __swiftcall UIImage.renderingFormat()()
{
  sub_240160404();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultFormat);
  objc_msgSend(v0, sel_scale);
  objc_msgSend(v1, sel_setScale_);
  return (UIGraphicsImageRendererFormat)v1;
}

unint64_t sub_240160404()
{
  unint64_t result = qword_268C83BB8;
  if (!qword_268C83BB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C83BB8);
  }
  return result;
}

id sub_240160444(int a1, id a2, double a3, double a4)
{
  objc_msgSend(a2, sel_size);
  CGFloat v8 = -(v7 * a3);
  objc_msgSend(a2, sel_size);
  CGAffineTransformMakeTranslation(&v12, v8, -(v9 * a4));
  v13.CGFloat x = 0.0;
  v13.CGFloat y = 0.0;
  CGPoint v10 = CGPointApplyAffineTransform(v13, &v12);
  return objc_msgSend(a2, sel_drawAtPoint_, v10.x, v10.y);
}

uint64_t sub_2401604DC()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

id sub_240160514(int a1)
{
  return sub_240160444(a1, *(id *)(v1 + 48), *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_240160524()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_240160534()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_24016055C(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2401605C0()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_2401605F8()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_drawInRect_, 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_240160614()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t WidgetFamily.chsFamily.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2401652C0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x263F1FCD8]) {
    return 1;
  }
  if (v6 == *MEMORY[0x263F1FCE0]) {
    return 2;
  }
  if (v6 == *MEMORY[0x263F1FCD0]) {
    return 3;
  }
  if (v6 == *MEMORY[0x263F1FCF8]) {
    return 4;
  }
  if (v6 != *MEMORY[0x263F1FD00])
  {
    if (v6 != *MEMORY[0x263F1FD08] && v6 != *MEMORY[0x263F1FCF0]) {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    return 1;
  }
  return 10;
}

uint64_t WidgetFamily.analyticSize.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2401652C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x263F1FCD8])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F5D1A0];
LABEL_7:
    uint64_t v11 = *v9;
    uint64_t v12 = sub_240164DB0();
    CGPoint v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);
    uint64_t v14 = a1;
    uint64_t v15 = v11;
    return v13(v14, v15, v12);
  }
  int v10 = v8;
  if (v8 == *MEMORY[0x263F1FCE0])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F5D1A8];
    goto LABEL_7;
  }
  if (v8 == *MEMORY[0x263F1FCD0])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F5D198];
    goto LABEL_7;
  }
  int v17 = *MEMORY[0x263F1FCF8];
  uint64_t v12 = sub_240164DB0();
  CGPoint v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);
  if (v10 != v17)
  {
    v13(a1, *MEMORY[0x263F5D1A0], v12);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v15 = *MEMORY[0x263F5D1B0];
  uint64_t v14 = a1;
  return v13(v14, v15, v12);
}

uint64_t sub_2401609EC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x7468676972;
  }
  else {
    uint64_t v3 = 1952867692;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x7468676972;
  }
  else {
    uint64_t v5 = 1952867692;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_240165540();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_240160A84()
{
  return sub_240165580();
}

uint64_t sub_240160AFC()
{
  sub_240165350();
  return swift_bridgeObjectRelease();
}

uint64_t sub_240160B5C()
{
  return sub_240165580();
}

double sub_240160BD0()
{
  return 0.0;
}

double BadgeStatus.iconOffset.getter()
{
  return 0.0;
}

uint64_t sub_240160BE8()
{
  return 0;
}

uint64_t BadgeStatus.useIconAsTextPrefix.getter()
{
  return 0;
}

uint64_t sub_240160BF8()
{
  return 0;
}

uint64_t BadgeStatus.accessibilityText.getter()
{
  return 0;
}

uint64_t PositionInLockScreenCircularAccessory.description.getter()
{
  if (*v0) {
    return 0x7468676972;
  }
  else {
    return 1952867692;
  }
}

uint64_t PositionInLockScreenCircularAccessory.rawValue.getter()
{
  if (*v0) {
    return 0x7468676972;
  }
  else {
    return 1952867692;
  }
}

PeopleUI::PositionInLockScreenCircularAccessory_optional __swiftcall PositionInLockScreenCircularAccessory.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  uint64_t v3 = sub_240165520();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *BOOL v2 = v5;
  return result;
}

void *static PositionInLockScreenCircularAccessory.allCases.getter()
{
  return &unk_26F3F9BA0;
}

uint64_t sub_240160CE0(char *a1, char *a2)
{
  return sub_2401609EC(*a1, *a2);
}

uint64_t sub_240160CEC()
{
  return sub_240160A84();
}

uint64_t sub_240160CF4()
{
  return sub_240160AFC();
}

uint64_t sub_240160CFC()
{
  return sub_240160B5C();
}

PeopleUI::PositionInLockScreenCircularAccessory_optional sub_240160D04(Swift::String *a1)
{
  return PositionInLockScreenCircularAccessory.init(rawValue:)(*a1);
}

uint64_t sub_240160D10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PositionInLockScreenCircularAccessory.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_240160D38()
{
  return sub_2401653D0();
}

uint64_t sub_240160D98()
{
  return sub_2401653C0();
}

void sub_240160DEC(void *a1@<X8>)
{
  *a1 = &unk_26F3F9BC8;
}

uint64_t sub_240160E00()
{
  return sub_240165240();
}

uint64_t sub_240160E1C()
{
  return sub_240165240();
}

uint64_t sub_240160E3C()
{
  if (sub_240164F20() < 1) {
    return 0;
  }
  else {
    return sub_240165240();
  }
}

uint64_t LockScreenBadgeStatus.iconForLockScreenCircularAccessory.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 8) + 48))();
}

uint64_t AvailabilityPersonStatus.accessibilityText.getter()
{
  uint64_t v0 = sub_240164EF0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  unint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)v11 - v5;
  sub_240164FA0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F5D238], v0);
  sub_24016483C(&qword_268C83BC0, MEMORY[0x263F5D240]);
  sub_2401653B0();
  sub_2401653B0();
  if (v11[2] == v11[0] && v11[3] == v11[1])
  {
    swift_bridgeObjectRelease_n();
    char v7 = *(void (**)(char *, uint64_t))(v1 + 8);
    v7(v4, v0);
    v7(v6, v0);
    return 0x4420746F4E206F44;
  }
  char v8 = sub_240165540();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v4, v0);
  v9(v6, v0);
  if (v8) {
    return 0x4420746F4E206F44;
  }
  return 0;
}

uint64_t AvailabilityPersonStatus.icon.getter()
{
  uint64_t v0 = sub_240164EF0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  unint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)v11 - v5;
  sub_240164FA0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F5D238], v0);
  sub_24016483C(&qword_268C83BC0, MEMORY[0x263F5D240]);
  sub_2401653B0();
  sub_2401653B0();
  if (v11[2] == v11[0] && v11[3] == v11[1])
  {
    swift_bridgeObjectRelease_n();
    char v7 = *(void (**)(char *, uint64_t))(v1 + 8);
    v7(v4, v0);
    v7(v6, v0);
    return sub_240165240();
  }
  char v8 = sub_240165540();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v4, v0);
  v9(v6, v0);
  if (v8) {
    return sub_240165240();
  }
  return 0;
}

uint64_t AvailabilityPersonStatus.iconBackground.getter()
{
  uint64_t v0 = sub_240164EF0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  unint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)v12 - v5;
  sub_240164FA0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F5D238], v0);
  sub_24016483C(&qword_268C83BC0, MEMORY[0x263F5D240]);
  sub_2401653B0();
  sub_2401653B0();
  if (v13 == v12[0] && v14 == v12[1])
  {
    swift_bridgeObjectRelease_n();
    char v7 = *(void (**)(char *, uint64_t))(v1 + 8);
    v7(v4, v0);
    v7(v6, v0);
  }
  else
  {
    char v8 = sub_240165540();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
    v9(v4, v0);
    v9(v6, v0);
    if ((v8 & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_240165F40;
      *(void *)(v10 + 32) = sub_2401651B0();
      goto LABEL_9;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_240165A90;
  if (qword_268C83668 != -1) {
    swift_once();
  }
  *(void *)(v10 + 32) = qword_268C83A00;
  swift_retain();
  *(void *)(v10 + 40) = _s6People19MessagePersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0();
LABEL_9:
  uint64_t v13 = v10;
  sub_2401653F0();
  return v13;
}

double AvailabilityPersonStatus.iconOffset.getter()
{
  return 0.0;
}

double sub_2401615E4()
{
  return 0.0;
}

uint64_t AskToBuyRequestPersonStatus.localizedDisplayString.getter()
{
  return sub_240161E2C(MEMORY[0x263F5D2F8], MEMORY[0x263F5D2F0], 0x7975426F546B7341, 0xE800000000000000);
}

uint64_t AskToBuyRequestPersonStatus.icon.getter()
{
  uint64_t v0 = sub_240165440();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240164FB0();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 != *MEMORY[0x263F5D340]
    && v4 != *MEMORY[0x263F5D348]
    && v4 != *MEMORY[0x263F5D350]
    && v4 != *MEMORY[0x263F5D338])
  {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return sub_240165250();
}

uint64_t AskToBuyRequestPersonStatus.iconBackground.getter()
{
  uint64_t v0 = sub_240165440();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240164FB0();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x263F5D340])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_240165A90;
    if (qword_268C83698 != -1) {
      swift_once();
    }
    *(void *)(v5 + 32) = qword_268C83A30;
    uint64_t v6 = qword_268C836A0;
    swift_retain();
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v7 = qword_268C83A38;
LABEL_24:
    *(void *)(v5 + 40) = v7;
    uint64_t v15 = v5;
    sub_2401653F0();
    uint64_t v11 = v15;
    goto LABEL_25;
  }
  if (v4 == *MEMORY[0x263F5D348])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_240165A90;
    if (qword_268C836A8 != -1) {
      swift_once();
    }
    *(void *)(v5 + 32) = qword_268C83A40;
    uint64_t v8 = qword_268C836B0;
    swift_retain();
    if (v8 != -1) {
      swift_once();
    }
    uint64_t v7 = qword_268C83A48;
    goto LABEL_24;
  }
  if (v4 == *MEMORY[0x263F5D350])
  {
LABEL_19:
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_240165A90;
    if (qword_268C83688 != -1) {
      swift_once();
    }
    *(void *)(v5 + 32) = qword_268C83A20;
    uint64_t v12 = qword_268C83690;
    swift_retain();
    if (v12 != -1) {
      swift_once();
    }
    uint64_t v7 = qword_268C83A28;
    goto LABEL_24;
  }
  if (v4 != *MEMORY[0x263F5D338])
  {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_240165A90;
  if (qword_268C836F0 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_268C83A88;
  *(void *)(v9 + 32) = qword_268C83A88;
  *(void *)(v9 + 40) = v10;
  uint64_t v15 = v9;
  sub_2401653F0();
  uint64_t v11 = v15;
  swift_retain();
LABEL_25:
  swift_retain();
  return v11;
}

uint64_t AskToBuyRequestPersonStatus.iconShadow.getter()
{
  sub_240163DF4();
  return swift_retain();
}

double AskToBuyRequestPersonStatus.iconOffset.getter()
{
  uint64_t v0 = sub_240165440();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240164FB0();
  if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) != *MEMORY[0x263F5D340]) {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return 0.0;
}

uint64_t sub_240161CB8()
{
  sub_240163DF4();
  return swift_retain();
}

double sub_240161CE0()
{
  uint64_t v0 = sub_240165440();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240164FB0();
  if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) != *MEMORY[0x263F5D340]) {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return 0.0;
}

uint64_t ScreenTimeRequestPersonStatus.localizedDisplayString.getter()
{
  return sub_240161E2C(MEMORY[0x263F5D318], MEMORY[0x263F5D310], 0x69546E6565726353, 0xEA0000000000656DLL);
}

uint64_t sub_240161E2C(void (*a1)(uint64_t), void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a4;
  CGRect v23 = a2;
  uint64_t v5 = sub_240164D90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_240164E70();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v22 - v15;
  a1(v14);
  uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v16, v9);
  if (v17 == *MEMORY[0x263F5D208])
  {
    v23(v17);
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F5D178], v5);
    char v18 = sub_240164F60();
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if (v18) {
      return 0;
    }
    else {
      return sub_240165370();
    }
  }
  else
  {
    a1(v17);
    sub_240164E60();
    uint64_t v20 = *(void (**)(char *, uint64_t))(v10 + 8);
    v20(v13, v9);
    uint64_t v19 = sub_240165370();
    swift_bridgeObjectRelease();
    v20(v16, v9);
  }
  return v19;
}

uint64_t ScreenTimeRequestPersonStatus.icon.getter()
{
  return sub_240165240();
}

uint64_t ScreenTimeRequestPersonStatus.iconBackground.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_240165A90;
  if (qword_268C83680 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_268C83A18;
  uint64_t v1 = qword_268C83678;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_268C83A10;
  sub_2401653F0();
  swift_retain();
  return v0;
}

uint64_t ScreenTimeRequestPersonStatus.iconShadow.getter()
{
  return sub_240159D9C(&qword_268C83678);
}

uint64_t sub_2401621F8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_240165A90;
  if (qword_268C83680 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_268C83A18;
  uint64_t v1 = qword_268C83678;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_268C83A10;
  sub_2401653F0();
  swift_retain();
  return v0;
}

uint64_t sub_2401622E4(uint64_t a1, uint64_t a2)
{
  return sub_240163D8C(a1, a2, &qword_268C83678);
}

uint64_t sub_240162308()
{
  return ScreenTimeRequestPersonStatus.icon.getter();
}

uint64_t ChildStatePersonStatus.accessibilityText.getter()
{
  return sub_240165370();
}

uint64_t ChildStatePersonStatus.localizedDisplayString.getter()
{
  return sub_240165370();
}

uint64_t ChildStatePersonStatus.icon.getter()
{
  return sub_240165250();
}

uint64_t ChildStatePersonStatus.iconBackground.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_240165A90;
  if (qword_268C836D8 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_268C83A70;
  uint64_t v1 = qword_268C836E0;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_268C83A78;
  sub_2401653F0();
  swift_retain();
  return v0;
}

uint64_t ChildStatePersonStatus.iconForeground.getter()
{
  return sub_240159D9C(&qword_268C836D0);
}

uint64_t ChildStatePersonStatus.iconShadow.getter()
{
  return sub_240159D9C(&qword_268C836E8);
}

uint64_t ChildStatePersonStatus.iconFontSize.getter()
{
  _s6People19MessagePersonStatusV0A2UIE12iconFontSize05SwiftE00G0Vvg_0();
  uint64_t v0 = sub_240165050();
  swift_release();
  return v0;
}

double ChildStatePersonStatus.iconOffset.getter()
{
  return 0.0;
}

uint64_t sub_2401624F0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_240165A90;
  if (qword_268C836D8 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_268C83A70;
  uint64_t v1 = qword_268C836E0;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_268C83A78;
  sub_2401653F0();
  swift_retain();
  return v0;
}

uint64_t sub_2401625DC(uint64_t a1, uint64_t a2)
{
  return sub_240163D8C(a1, a2, &qword_268C836D0);
}

uint64_t sub_240162600(uint64_t a1, uint64_t a2)
{
  return sub_240163D8C(a1, a2, &qword_268C836E8);
}

uint64_t sub_240162624()
{
  _s6People19MessagePersonStatusV0A2UIE12iconFontSize05SwiftE00G0Vvg_0();
  uint64_t v0 = sub_240165050();
  swift_release();
  return v0;
}

uint64_t sub_24016265C()
{
  return ChildStatePersonStatus.icon.getter();
}

double sub_240162674()
{
  return 0.0;
}

uint64_t sub_240162688()
{
  return sub_240165370();
}

uint64_t LocationPersonStatus.iconBackground.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_240165A90;
  if (qword_268C836C0 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_268C83A58;
  uint64_t v1 = qword_268C836B8;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_268C83A50;
  sub_2401653F0();
  swift_retain();
  return v0;
}

uint64_t LocationPersonStatus.iconForeground.getter()
{
  return sub_240159D9C(&qword_268C836C8);
}

uint64_t LocationPersonStatus.iconShadow.getter()
{
  return sub_240159D9C(&qword_268C836B8);
}

uint64_t LocationPersonStatus.icon.getter()
{
  uint64_t v0 = sub_240164D90();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240164F70();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F5D168], v0);
  char v4 = sub_240164F60();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t result = 0;
  if (v4) {
    return sub_240165240();
  }
  return result;
}

uint64_t LocationPersonStatus.iconForLockScreenCircularAccessory.getter()
{
  return sub_240165240();
}

uint64_t sub_240162928()
{
  return sub_240165240();
}

uint64_t sub_240162948()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_240165A90;
  if (qword_268C836C0 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_268C83A58;
  uint64_t v1 = qword_268C836B8;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_268C83A50;
  sub_2401653F0();
  swift_retain();
  return v0;
}

uint64_t sub_240162A34(uint64_t a1, uint64_t a2)
{
  return sub_240163D8C(a1, a2, &qword_268C836C8);
}

uint64_t sub_240162A58(uint64_t a1, uint64_t a2)
{
  return sub_240163D8C(a1, a2, &qword_268C836B8);
}

uint64_t MotionPersonStatus.accessibilityText.getter()
{
  uint64_t v0 = sub_240164E50();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240164F00();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x263F5D1F8])
  {
    unsigned int v5 = 1852732786;
  }
  else if (v4 == *MEMORY[0x263F5D1F0])
  {
    unsigned int v5 = 1818458467;
  }
  else if (v4 == *MEMORY[0x263F5D1E0])
  {
    unsigned int v5 = 1986622052;
  }
  else
  {
    if (v4 != *MEMORY[0x263F5D200])
    {
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      return 0;
    }
    unsigned int v5 = 1802264951;
  }
  return v5 | 0x676E6900000000;
}

uint64_t MotionPersonStatus.icon.getter()
{
  uint64_t v0 = sub_240164E50();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240164F00();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x263F5D1F8]) {
    return sub_240165250();
  }
  if (v4 == *MEMORY[0x263F5D1F0]
    || v4 == *MEMORY[0x263F5D1E0]
    || v4 == *MEMORY[0x263F5D200]
    || v4 == *MEMORY[0x263F5D1E8])
  {
    return sub_240165240();
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

uint64_t MotionPersonStatus.iconBackground.getter()
{
  uint64_t v0 = MotionPersonStatus.icon.getter();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  if (v0)
  {
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_240165A90;
    if (qword_268C83670 != -1) {
      swift_once();
    }
    *(void *)(v1 + 32) = qword_268C83A08;
    swift_retain();
    *(void *)(v1 + 40) = sub_2401651A0();
  }
  else
  {
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_240165F40;
    *(void *)(v1 + 32) = sub_2401651B0();
  }
  sub_2401653F0();
  return v1;
}

uint64_t MotionPersonStatus.iconForeground.getter()
{
  uint64_t v0 = MotionPersonStatus.icon.getter();
  swift_release();
  if (v0)
  {
    return _s6People19MessagePersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0();
  }
  else
  {
    return sub_2401651B0();
  }
}

uint64_t MotionPersonStatus.iconShadow.getter()
{
  return sub_240159D9C(&qword_268C83670);
}

uint64_t MotionPersonStatus.iconFontSize.getter()
{
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, 10.0, 0);
  if (UIFontForLanguage)
  {
    uint64_t v1 = UIFontForLanguage;
    sub_240165090();
    uint64_t v2 = sub_240165050();
  }
  else
  {
    _s6People19MessagePersonStatusV0A2UIE12iconFontSize05SwiftE00G0Vvg_0();
    uint64_t v2 = sub_240165050();
  }
  swift_release();
  return v2;
}

uint64_t MotionPersonStatus.iconForLockScreenCircularAccessory.getter()
{
  uint64_t v0 = sub_240164E50();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240164F00();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  BOOL v5 = v4 == *MEMORY[0x263F5D1F8] || v4 == *MEMORY[0x263F5D1F0];
  if (v5 || v4 == *MEMORY[0x263F5D1E0]) {
    return sub_240165240();
  }
  if (v4 == *MEMORY[0x263F5D200] || v4 == *MEMORY[0x263F5D1E8]) {
    return sub_240165240();
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

void MotionPersonStatus.positionInCircularAccessory.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

double MotionPersonStatus.iconOffset.getter()
{
  uint64_t v0 = sub_240164E50();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240164F00();
  if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) != *MEMORY[0x263F5D1F8]) {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return 0.0;
}

void sub_240163228(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_240163234()
{
  uint64_t v0 = MotionPersonStatus.icon.getter();
  swift_release();
  if (v0)
  {
    return _s6People19MessagePersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0();
  }
  else
  {
    return sub_2401651B0();
  }
}

uint64_t sub_24016328C(uint64_t a1, uint64_t a2)
{
  return sub_240163D8C(a1, a2, &qword_268C83670);
}

uint64_t sub_2401632B0()
{
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, 10.0, 0);
  if (UIFontForLanguage)
  {
    uint64_t v1 = UIFontForLanguage;
    sub_240165090();
    uint64_t v2 = sub_240165050();
  }
  else
  {
    _s6People19MessagePersonStatusV0A2UIE12iconFontSize05SwiftE00G0Vvg_0();
    uint64_t v2 = sub_240165050();
  }
  swift_release();
  return v2;
}

double sub_240163328()
{
  uint64_t v0 = sub_240164E50();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240164F00();
  if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) != *MEMORY[0x263F5D1F8]) {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return 0.0;
}

uint64_t MissedCallPersonStatus.localizedDisplayString.getter()
{
  uint64_t v0 = sub_240164F10();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  int v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v11 - v5;
  sub_240164F90();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F5D260], v0);
  sub_24016483C(&qword_268C83BD0, MEMORY[0x263F5D268]);
  sub_2401653B0();
  sub_2401653B0();
  if (v11[2] == v11[0] && v11[3] == v11[1])
  {
    swift_bridgeObjectRelease_n();
    uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
    v7(v4, v0);
    v7(v6, v0);
  }
  else
  {
    sub_240165540();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
    v8(v4, v0);
    v8(v6, v0);
  }
  uint64_t v9 = sub_240165370();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t MissedCallPersonStatus.icon.getter()
{
  return sub_240165240();
}

uint64_t MissedCallPersonStatus.useIconAsTextPrefix.getter()
{
  return 1;
}

uint64_t MissedCallPersonStatus.iconBackground.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_240165A90;
  if (qword_268C83700 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_268C83A98;
  uint64_t v1 = qword_268C836F8;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_268C83A90;
  sub_2401653F0();
  swift_retain();
  return v0;
}

uint64_t MissedCallPersonStatus.iconShadow.getter()
{
  return sub_240159D9C(&qword_268C83708);
}

double MissedCallPersonStatus.iconOffset.getter()
{
  return 0.0;
}

uint64_t sub_2401637F4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_240165A90;
  if (qword_268C83700 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_268C83A98;
  uint64_t v1 = qword_268C836F8;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_268C83A90;
  sub_2401653F0();
  swift_retain();
  return v0;
}

uint64_t sub_2401638E4(uint64_t a1, uint64_t a2)
{
  return sub_240163D8C(a1, a2, &qword_268C83708);
}

uint64_t sub_24016390C()
{
  return MissedCallPersonStatus.icon.getter();
}

uint64_t sub_240163924()
{
  return 1;
}

uint64_t MessagePersonStatus.icon.getter()
{
  if (sub_240164F20() < 1) {
    return 0;
  }
  else {
    return sub_240165240();
  }
}

uint64_t MessagePersonStatus.localizedDisplayString.getter()
{
  uint64_t result = sub_240164F20();
  if (result) {
    return sub_240165370();
  }
  return result;
}

uint64_t MessagePersonStatus.useIconAsTextPrefix.getter()
{
  return 1;
}

uint64_t MessagePersonStatus.iconBackground.getter()
{
  return sub_240163A68(MEMORY[0x263F1B3E0]);
}

void MessagePersonStatus.positionInCircularAccessory.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

void sub_240163A00(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_240163A10(uint64_t a1, uint64_t a2)
{
  return sub_240163CFC(a1, a2, MEMORY[0x263F1B3E0]);
}

uint64_t CalendarPersonStatus.icon.getter()
{
  return sub_240165240();
}

uint64_t CalendarPersonStatus.iconBackground.getter()
{
  return sub_240163A68(MEMORY[0x263F1B3E8]);
}

uint64_t sub_240163A68(uint64_t (*a1)(void))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_240165F40;
  *(void *)(v2 + 32) = a1();
  sub_2401653F0();
  return v2;
}

uint64_t CalendarPersonStatus.iconForeground.getter()
{
  return sub_240159D9C(&qword_268C83710);
}

uint64_t CalendarPersonStatus.localizedDisplayString.getter()
{
  uint64_t v0 = sub_240164F30();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240164F40();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x263F5D290] || v4 == *MEMORY[0x263F5D298]) {
    goto LABEL_6;
  }
  if (v4 != *MEMORY[0x263F5D288])
  {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
LABEL_6:
    sub_240165370();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BD8);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_240165F40;
    uint64_t v7 = _s6People20LocationPersonStatusV0A2UIE22localizedDisplayStringSSvg_0();
    uint64_t v9 = v8;
    *(void *)(v6 + 56) = MEMORY[0x263F8D310];
    *(void *)(v6 + 64) = sub_240164010();
    *(void *)(v6 + 32) = v7;
    *(void *)(v6 + 40) = v9;
    uint64_t v5 = sub_240165330();
    swift_bridgeObjectRelease();
    return v5;
  }
  return _s6People20LocationPersonStatusV0A2UIE22localizedDisplayStringSSvg_0();
}

double CalendarPersonStatus.iconOffset.getter()
{
  return 0.0;
}

uint64_t sub_240163CE4(uint64_t a1, uint64_t a2)
{
  return sub_240163CFC(a1, a2, MEMORY[0x263F1B3E8]);
}

uint64_t sub_240163CFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C83BC8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_240165F40;
  *(void *)(v4 + 32) = a3();
  sub_2401653F0();
  return v4;
}

uint64_t sub_240163D68(uint64_t a1, uint64_t a2)
{
  return sub_240163D8C(a1, a2, &qword_268C83710);
}

uint64_t sub_240163D8C(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_240163DDC()
{
  return CalendarPersonStatus.icon.getter();
}

uint64_t sub_240163DF4()
{
  uint64_t v0 = sub_240165440();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240164FB0();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x263F5D340])
  {
    if (qword_268C83698 != -1) {
      swift_once();
    }
    uint64_t v5 = &qword_268C83A30;
    return *v5;
  }
  if (v4 == *MEMORY[0x263F5D348])
  {
    if (qword_268C836A8 != -1) {
      swift_once();
    }
    uint64_t v5 = &qword_268C83A40;
    return *v5;
  }
  if (v4 != *MEMORY[0x263F5D350])
  {
    if (v4 == *MEMORY[0x263F5D338])
    {
      if (qword_268C836F0 != -1) {
        swift_once();
      }
      uint64_t v5 = &qword_268C83A88;
      return *v5;
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  if (qword_268C83688 != -1) {
    swift_once();
  }
  uint64_t v5 = &qword_268C83A20;
  return *v5;
}

unint64_t sub_240164010()
{
  unint64_t result = qword_268C83BE0;
  if (!qword_268C83BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C83BE0);
  }
  return result;
}

unint64_t sub_240164068()
{
  unint64_t result = qword_268C83BE8;
  if (!qword_268C83BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C83BE8);
  }
  return result;
}

unint64_t sub_2401640C0()
{
  unint64_t result = qword_268C83BF0;
  if (!qword_268C83BF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C83BF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C83BF0);
  }
  return result;
}

uint64_t sub_24016411C(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C00, MEMORY[0x263F5D2E8]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_240164174(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C08, MEMORY[0x263F5D2E8]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2401641CC(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C10, MEMORY[0x263F5D308]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_240164224()
{
  return sub_24016483C(&qword_268C83C18, MEMORY[0x263F5D308]);
}

uint64_t sub_24016426C(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C18, MEMORY[0x263F5D308]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2401642C4(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C20, MEMORY[0x263F5D328]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24016431C()
{
  return sub_24016483C(&qword_268C83C28, MEMORY[0x263F5D328]);
}

uint64_t sub_240164364(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C28, MEMORY[0x263F5D328]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2401643BC(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C30, MEMORY[0x263F5D2C8]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_240164414()
{
  return sub_24016483C(&qword_268C83C30, MEMORY[0x263F5D2C8]);
}

uint64_t sub_24016445C(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C38, MEMORY[0x263F5D2B8]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2401644B4()
{
  return sub_24016483C(&qword_268C83C40, MEMORY[0x263F5D2B8]);
}

uint64_t sub_2401644FC(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C40, MEMORY[0x263F5D2B8]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_240164554(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C48, MEMORY[0x263F5D258]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2401645AC(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C50, MEMORY[0x263F5D258]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_240164604(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C58, MEMORY[0x263F5D2D8]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24016465C()
{
  return sub_24016483C(&qword_268C83C60, MEMORY[0x263F5D2D8]);
}

uint64_t sub_2401646A4(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C60, MEMORY[0x263F5D2D8]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2401646FC(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C68, MEMORY[0x263F5D280]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_240164754()
{
  return sub_24016483C(&qword_268C83C70, MEMORY[0x263F5D280]);
}

uint64_t sub_24016479C(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C70, MEMORY[0x263F5D280]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2401647F4()
{
  return sub_24016483C(&qword_268C83C78, MEMORY[0x263F5D2A8]);
}

uint64_t sub_24016483C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_240164884(uint64_t a1)
{
  uint64_t result = sub_24016483C(&qword_268C83C78, MEMORY[0x263F5D2A8]);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of BadgeStatus.iconBackground.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BadgeStatus.iconForeground.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of BadgeStatus.iconShadow.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of BadgeStatus.iconFontSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of BadgeStatus.icon.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of BadgeStatus.iconOffset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of BadgeStatus.useIconAsTextPrefix.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of BadgeStatus.accessibilityText.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

unsigned char *storeEnumTagSinglePayload for PositionInLockScreenCircularAccessory(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x240164A48);
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

ValueMetadata *type metadata accessor for PositionInLockScreenCircularAccessory()
{
  return &type metadata for PositionInLockScreenCircularAccessory;
}

uint64_t dispatch thunk of LockScreenBadgeStatus.iconForLockScreenCircularAccessory.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of LockScreenBadgeStatus.positionInCircularAccessory.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

unint64_t sub_240164AA8()
{
  unint64_t result = qword_268C83C80;
  if (!qword_268C83C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C83C80);
  }
  return result;
}

uint64_t sub_240164B4C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_240164B80()
{
  return MEMORY[0x270F533A0]();
}

uint64_t sub_240164B90()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_240164BA0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_240164BB0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_240164BC0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_240164BD0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_240164BE0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_240164BF0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_240164C00()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_240164C10()
{
  return MEMORY[0x270EF0DF8]();
}

uint64_t sub_240164C20()
{
  return MEMORY[0x270EF0FF8]();
}

uint64_t sub_240164C30()
{
  return MEMORY[0x270EF1030]();
}

uint64_t sub_240164C40()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_240164C50()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_240164C60()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_240164C70()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_240164C80()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_240164C90()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_240164CA0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_240164CB0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_240164CC0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_240164CD0()
{
  return MEMORY[0x270EE2BB0]();
}

uint64_t sub_240164CE0()
{
  return MEMORY[0x270EE2BB8]();
}

uint64_t sub_240164CF0()
{
  return MEMORY[0x270EE2D20]();
}

uint64_t sub_240164D00()
{
  return MEMORY[0x270EE2EE8]();
}

uint64_t sub_240164D10()
{
  return MEMORY[0x270EE2F00]();
}

uint64_t sub_240164D20()
{
  return MEMORY[0x270EE2F08]();
}

uint64_t sub_240164D30()
{
  return MEMORY[0x270EE2F20]();
}

uint64_t sub_240164D40()
{
  return MEMORY[0x270EE3040]();
}

uint64_t sub_240164D50()
{
  return MEMORY[0x270EE3048]();
}

uint64_t sub_240164D60()
{
  return MEMORY[0x270EE3058]();
}

uint64_t sub_240164D70()
{
  return MEMORY[0x270F533A8]();
}

uint64_t sub_240164D80()
{
  return MEMORY[0x270F533B0]();
}

uint64_t sub_240164D90()
{
  return MEMORY[0x270F533C8]();
}

uint64_t sub_240164DA0()
{
  return MEMORY[0x270F533D8]();
}

uint64_t sub_240164DB0()
{
  return MEMORY[0x270F533E0]();
}

uint64_t sub_240164DC0()
{
  return MEMORY[0x270F533E8]();
}

uint64_t sub_240164DD0()
{
  return MEMORY[0x270F533F0]();
}

uint64_t sub_240164DE0()
{
  return MEMORY[0x270F533F8]();
}

uint64_t sub_240164DF0()
{
  return MEMORY[0x270F53400]();
}

uint64_t sub_240164E00()
{
  return MEMORY[0x270F53408]();
}

uint64_t sub_240164E10()
{
  return MEMORY[0x270F53410]();
}

uint64_t sub_240164E20()
{
  return MEMORY[0x270F53418]();
}

uint64_t sub_240164E30()
{
  return MEMORY[0x270F53420]();
}

uint64_t sub_240164E40()
{
  return MEMORY[0x270F53428]();
}

uint64_t sub_240164E50()
{
  return MEMORY[0x270F53430]();
}

uint64_t sub_240164E60()
{
  return MEMORY[0x270F53438]();
}

uint64_t sub_240164E70()
{
  return MEMORY[0x270F53440]();
}

uint64_t sub_240164E80()
{
  return MEMORY[0x270F53488]();
}

uint64_t sub_240164E90()
{
  return MEMORY[0x270F53490]();
}

uint64_t sub_240164EA0()
{
  return MEMORY[0x270F53498]();
}

uint64_t sub_240164EB0()
{
  return MEMORY[0x270F534A0]();
}

uint64_t sub_240164EC0()
{
  return MEMORY[0x270F534A8]();
}

uint64_t sub_240164ED0()
{
  return MEMORY[0x270F534B0]();
}

uint64_t sub_240164EE0()
{
  return MEMORY[0x270F534B8]();
}

uint64_t sub_240164EF0()
{
  return MEMORY[0x270F534C0]();
}

uint64_t sub_240164F00()
{
  return MEMORY[0x270F534C8]();
}

uint64_t sub_240164F10()
{
  return MEMORY[0x270F534D0]();
}

uint64_t sub_240164F20()
{
  return MEMORY[0x270F534D8]();
}

uint64_t sub_240164F30()
{
  return MEMORY[0x270F534E0]();
}

uint64_t sub_240164F40()
{
  return MEMORY[0x270F534E8]();
}

uint64_t _s6People20LocationPersonStatusV0A2UIE22localizedDisplayStringSSvg_0()
{
  return MEMORY[0x270F534F0]();
}

uint64_t sub_240164F60()
{
  return MEMORY[0x270F534F8]();
}

uint64_t sub_240164F70()
{
  return MEMORY[0x270F53500]();
}

uint64_t sub_240164F80()
{
  return MEMORY[0x270F53508]();
}

uint64_t sub_240164F90()
{
  return MEMORY[0x270F53510]();
}

uint64_t sub_240164FA0()
{
  return MEMORY[0x270F53518]();
}

uint64_t sub_240164FB0()
{
  return MEMORY[0x270F53520]();
}

uint64_t sub_240164FC0()
{
  return MEMORY[0x270F53528]();
}

uint64_t sub_240164FD0()
{
  return MEMORY[0x270F53530]();
}

uint64_t sub_240164FE0()
{
  return MEMORY[0x270F53538]();
}

uint64_t sub_240164FF0()
{
  return MEMORY[0x270F53540]();
}

uint64_t sub_240165000()
{
  return MEMORY[0x270F53548]();
}

uint64_t sub_240165010()
{
  return MEMORY[0x270EE3CC0]();
}

uint64_t sub_240165020()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_240165030()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_240165040()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_240165050()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_240165060()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t _s6People22MissedCallPersonStatusV0A2UIE12iconFontSize05SwiftF00H0Vvg_0()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t _s6People19MessagePersonStatusV0A2UIE12iconFontSize05SwiftE00G0Vvg_0()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_240165090()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_2401650A0()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_2401650B0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_2401650C0()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_2401650D0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2401650E0()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_2401650F0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_240165100()
{
  return MEMORY[0x270EE3090]();
}

uint64_t sub_240165110()
{
  return MEMORY[0x270EE3098]();
}

uint64_t sub_240165120()
{
  return MEMORY[0x270EE30F8]();
}

uint64_t sub_240165130()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_240165140()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_240165150()
{
  return MEMORY[0x270F03510]();
}

uint64_t sub_240165160()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_240165170()
{
  return MEMORY[0x270F043A8]();
}

uint64_t _s6People22MissedCallPersonStatusV0A2UIE14iconForeground05SwiftF05ColorVvg_0()
{
  return MEMORY[0x270F043E8]();
}

uint64_t _s6People19MessagePersonStatusV0A2UIE14iconForeground05SwiftE05ColorVvg_0()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_2401651A0()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_2401651B0()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_2401651C0()
{
  return MEMORY[0x270F04488]();
}

uint64_t _s6People19MessagePersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0()
{
  return MEMORY[0x270F04498]();
}

uint64_t _s6People24AvailabilityPersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0()
{
  return MEMORY[0x270F044A8]();
}

uint64_t sub_2401651F0()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_240165200()
{
  return MEMORY[0x270F044C8]();
}

uint64_t sub_240165210()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_240165220()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_240165230()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_240165240()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_240165250()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_240165260()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_240165270()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_240165280()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_240165290()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_2401652A0()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_2401652B0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2401652C0()
{
  return MEMORY[0x270F07608]();
}

uint64_t sub_2401652D0()
{
  return MEMORY[0x270F07848]();
}

uint64_t sub_2401652E0()
{
  return MEMORY[0x270F07850]();
}

uint64_t sub_2401652F0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_240165300()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_240165310()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_240165320()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_240165330()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_240165340()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_240165350()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_240165360()
{
  return MEMORY[0x270F53550]();
}

uint64_t sub_240165370()
{
  return MEMORY[0x270F53560]();
}

uint64_t sub_240165380()
{
  return MEMORY[0x270F53568]();
}

uint64_t sub_240165390()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2401653A0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2401653B0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2401653C0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2401653D0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2401653E0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2401653F0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_240165400()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_240165410()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_240165420()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_240165430()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_240165440()
{
  return MEMORY[0x270F53578]();
}

uint64_t sub_240165450()
{
  return MEMORY[0x270EF2150]();
}

uint64_t sub_240165460()
{
  return MEMORY[0x270EF2160]();
}

uint64_t sub_240165470()
{
  return MEMORY[0x270EF2310]();
}

uint64_t sub_240165480()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_240165490()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2401654A0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_2401654B0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2401654C0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2401654D0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2401654E0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2401654F0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_240165500()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_240165510()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_240165520()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_240165530()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_240165540()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_240165550()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_240165560()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_240165570()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_240165580()
{
  return MEMORY[0x270F9FC90]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  MEMORY[0x270EE7148](t, (__n128)point, *(__n128 *)&point.y);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  MEMORY[0x270EE7330](t, (__n128)size, *(__n128 *)&size.height);
  result.double height = v3;
  result.double width = v2;
  return result;
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x270EE9AD8](*(void *)&uiType, language, size);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}