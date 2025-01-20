uint64_t GetContactView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void (*v25)(void);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t (*v32)(void);
  uint64_t v34;
  uint64_t v35;

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5CF0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_2();
  v3 = v2 - v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5CF8);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_2();
  v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5D00);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5D08);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2();
  v34 = v12 - v11;
  v13 = sub_25C6D5780();
  OUTLINED_FUNCTION_1();
  v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_2();
  v19 = v18 - v17;
  type metadata accessor for GetContactView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_2();
  v23 = v22 - v21;
  sub_25C6A4318(v35, v22 - v21, (void (*)(void))type metadata accessor for GetContactView);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v19, v23, v13);
    sub_25C6D5760();
    v24 = (void *)sub_25C6D56D0();
    OUTLINED_FUNCTION_3();
    v25();
    *(void *)v7 = sub_25C6D5CD0();
    *(void *)(v7 + 8) = 0;
    *(unsigned char *)(v7 + 16) = 1;
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5D20);
    sub_25C6A1DC0(v24, v19, (char *)(v7 + *(int *)(v26 + 44)));
    if (qword_26A5C5CE0 != -1) {
      swift_once();
    }
    v27 = qword_26A5C7B98;
    v28 = qword_26A5C7B98;
    if (qword_26A5C5CD8 != -1)
    {
      swift_once();
      v28 = qword_26A5C7B98;
    }
    v29 = qword_26A5C7B90;
    v30 = sub_25C6D5DE0();
    sub_25C6A42C8(v7, v34, &qword_26A5C5CF8);

    v31 = v34 + *(int *)(v9 + 36);
    *(unsigned char *)v31 = v30;
    *(void *)(v31 + 8) = v27;
    *(void *)(v31 + 16) = v29;
    *(void *)(v31 + 24) = v28;
    *(void *)(v31 + 32) = v29;
    *(unsigned char *)(v31 + 40) = 0;
    sub_25C6A43C0(v7, &qword_26A5C5CF8);
    sub_25C6A42C8(v34, v3, &qword_26A5C5D08);
    swift_storeEnumTagMultiPayload();
    sub_25C6A1CD8();
    sub_25C6D5CF0();
    sub_25C6A43C0(v34, &qword_26A5C5D08);
    OUTLINED_FUNCTION_3();
    return v32();
  }
  else
  {
    sub_25C6A436C(v23, (void (*)(void))type metadata accessor for GetContactView);
    swift_storeEnumTagMultiPayload();
    sub_25C6A1CD8();
    return sub_25C6D5CF0();
  }
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

uint64_t type metadata accessor for GetContactView()
{
  uint64_t result = qword_26A5C5D28;
  if (!qword_26A5C5D28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25C6A1CD8()
{
  unint64_t result = qword_26A5C5D10;
  if (!qword_26A5C5D10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C5D08);
    sub_25C6A41AC(&qword_26A5C5D18, &qword_26A5C5CF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C5D10);
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

uint64_t sub_25C6A1DC0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v182 = a2;
  v174 = a3;
  uint64_t v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DB0);
  uint64_t v4 = MEMORY[0x270FA5388](v171);
  uint64_t v170 = (uint64_t)&v133 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v169 = (uint64_t)&v133 - v6;
  uint64_t v166 = sub_25C6D5780();
  uint64_t v165 = *(void *)(v166 - 8);
  MEMORY[0x270FA5388](v166);
  v164 = (char *)&v133 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5D00);
  uint64_t v162 = *(void *)(v163 - 8);
  MEMORY[0x270FA5388](v163);
  v161 = (char *)&v133 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  uint64_t v9 = MEMORY[0x270FA5388](ContactQuickActionButtonsView);
  v173 = (uint64_t *)((char *)&v133 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v9);
  uint64_t v172 = (uint64_t)&v133 - v11;
  uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DB8);
  MEMORY[0x270FA5388](v159);
  uint64_t v141 = (uint64_t)&v133 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DC0);
  uint64_t v13 = MEMORY[0x270FA5388](v138);
  uint64_t v139 = (uint64_t)&v133 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v137 = (uint64_t)&v133 - v16;
  MEMORY[0x270FA5388](v15);
  v140 = (char *)&v133 - v17;
  uint64_t v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DC8);
  MEMORY[0x270FA5388](v157);
  v158 = (void (**)(char *, uint64_t))((char *)&v133 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DD0);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v168 = (uint64_t)&v133 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v180 = (uint64_t)&v133 - v22;
  uint64_t v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DD8);
  uint64_t v181 = *(void *)(v175 - 8);
  MEMORY[0x270FA5388](v175);
  v147 = (char *)&v133 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DE0);
  uint64_t v24 = MEMORY[0x270FA5388](v146);
  v136 = (char *)&v133 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v143 = (char *)&v133 - v26;
  uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DE8);
  uint64_t v148 = *(void *)(v149 - 8);
  MEMORY[0x270FA5388](v149);
  v142 = (char *)&v133 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DF0);
  uint64_t v28 = MEMORY[0x270FA5388](v145);
  uint64_t v179 = (uint64_t)&v133 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v144 = (char *)&v133 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v183 = (uint64_t)&v133 - v32;
  uint64_t v33 = sub_25C6D55B0();
  MEMORY[0x270FA5388](v33 - 8);
  uint64_t v34 = sub_25C6D61C0();
  uint64_t v35 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  v37 = (char *)&v133 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DF8);
  uint64_t v178 = *(void *)(v38 - 8);
  uint64_t v39 = MEMORY[0x270FA5388](v38);
  v41 = (char *)&v133 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v39);
  v43 = (char *)&v133 - v42;
  v150 = a1;
  id v44 = objc_msgSend(a1, sel_identifier);
  sub_25C6D63D0();

  sub_25C6D55A0();
  swift_bridgeObjectRelease();
  sub_25C6D61D0();
  sub_25C6A3D84(&qword_26A5C5E00, MEMORY[0x263F77558]);
  sub_25C6D5FB0();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v34);
  v45 = *(void (**)(char *, char *, uint64_t))(v178 + 32);
  v176 = v43;
  v177 = v41;
  uint64_t v160 = v38;
  v45(v43, v41, v38);
  if (qword_26A5C5CD0 != -1) {
    swift_once();
  }
  sub_25C6D6160();
  sub_25C6D5B10();
  uint64_t v156 = v184;
  int v155 = v185;
  uint64_t v154 = v186;
  int v153 = v187;
  uint64_t v152 = v188;
  uint64_t v151 = v189;
  v46 = v150;
  uint64_t v190 = sub_25C6D6690();
  uint64_t v191 = v47;
  unint64_t v135 = sub_25C6A401C();
  uint64_t v48 = sub_25C6D5EC0();
  uint64_t v50 = v49;
  uint64_t v190 = v48;
  uint64_t v191 = v49;
  char v52 = v51 & 1;
  LOBYTE(v192) = v51 & 1;
  uint64_t v193 = v53;
  v54 = v147;
  sub_25C6D5FB0();
  sub_25C6A4068(v48, v50, v52);
  swift_bridgeObjectRelease();
  uint64_t v55 = sub_25C6D5E30();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v57 = v181;
  uint64_t v58 = (uint64_t)v143;
  uint64_t v59 = v175;
  v134 = *(void (**)(char *, char *, uint64_t))(v181 + 16);
  v134(v143, v54, v175);
  uint64_t v60 = v146;
  v61 = (uint64_t *)(v58 + *(int *)(v146 + 36));
  uint64_t *v61 = KeyPath;
  v61[1] = v55;
  v62 = *(void (**)(char *, uint64_t))(v57 + 8);
  uint64_t v181 = v57 + 8;
  v133 = v62;
  v62(v54, v59);
  sub_25C6D5E10();
  sub_25C6A4080();
  v63 = v142;
  sub_25C6D5F50();
  sub_25C6A43C0(v58, &qword_26A5C5DE0);
  if (sub_25C6D5740()) {
    uint64_t v64 = sub_25C6D6030();
  }
  else {
    uint64_t v64 = sub_25C6D6020();
  }
  uint64_t v65 = v64;
  uint64_t v66 = v148;
  uint64_t v67 = (uint64_t)v144;
  uint64_t v68 = v149;
  (*(void (**)(char *, char *, uint64_t))(v148 + 16))(v144, v63, v149);
  *(void *)(v67 + *(int *)(v145 + 36)) = v65;
  (*(void (**)(char *, uint64_t))(v66 + 8))(v63, v68);
  sub_25C6A4150(v67, v183, &qword_26A5C5DF0);
  id v69 = objc_msgSend(v46, sel_organizationName);
  uint64_t v70 = sub_25C6D63D0();
  unint64_t v72 = v71;

  swift_bridgeObjectRelease();
  uint64_t v73 = HIBYTE(v72) & 0xF;
  if ((v72 & 0x2000000000000000) == 0) {
    uint64_t v73 = v70 & 0xFFFFFFFFFFFFLL;
  }
  if (v73)
  {
    id v74 = objc_msgSend(v46, sel_organizationName);
    uint64_t v75 = sub_25C6D63D0();
    uint64_t v77 = v76;

    uint64_t v190 = v75;
    uint64_t v191 = v77;
    uint64_t v78 = sub_25C6D5EC0();
    uint64_t v80 = v79;
    uint64_t v190 = v78;
    uint64_t v191 = v79;
    char v82 = v81 & 1;
    LOBYTE(v192) = v81 & 1;
    uint64_t v193 = v83;
    sub_25C6D5FB0();
    sub_25C6A4068(v78, v80, v82);
    swift_bridgeObjectRelease();
    uint64_t v84 = sub_25C6D5DF0();
    uint64_t v85 = swift_getKeyPath();
    uint64_t v86 = (uint64_t)v136;
    uint64_t v87 = v175;
    v134(v136, v54, v175);
    v88 = (uint64_t *)(v86 + *(int *)(v60 + 36));
    uint64_t *v88 = v85;
    v88[1] = v84;
    v133(v54, v87);
    if (sub_25C6D5740()) {
      uint64_t v89 = sub_25C6D6030();
    }
    else {
      uint64_t v89 = sub_25C6D6020();
    }
    uint64_t v96 = v89;
    uint64_t v97 = (uint64_t)v140;
    uint64_t v98 = v137;
    sub_25C6A42C8(v86, v137, &qword_26A5C5DE0);
    *(void *)(v98 + *(int *)(v138 + 36)) = v96;
    sub_25C6A43C0(v86, &qword_26A5C5DE0);
    sub_25C6A4150(v98, v97, &qword_26A5C5DC0);
    if (qword_26A5C5CE0 != -1) {
      swift_once();
    }
    sub_25C6D6160();
    sub_25C6D5B10();
    uint64_t v99 = v190;
    char v100 = v191;
    uint64_t v101 = v192;
    char v102 = v193;
    long long v103 = v194;
    uint64_t v104 = v139;
    sub_25C6A42C8(v97, v139, &qword_26A5C5DC0);
    uint64_t v105 = v141;
    sub_25C6A42C8(v104, v141, &qword_26A5C5DC0);
    uint64_t v106 = v105 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E28) + 48);
    *(void *)uint64_t v106 = 0;
    *(unsigned char *)(v106 + 8) = 1;
    *(void *)(v106 + 16) = v99;
    *(unsigned char *)(v106 + 24) = v100;
    *(void *)(v106 + 32) = v101;
    *(unsigned char *)(v106 + 40) = v102;
    *(_OWORD *)(v106 + 48) = v103;
    sub_25C6A43C0(v104, &qword_26A5C5DC0);
    sub_25C6A42C8(v105, (uint64_t)v158, &qword_26A5C5DB8);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E30);
    sub_25C6A41AC(&qword_26A5C5E38, &qword_26A5C5DB8);
    sub_25C6A41F0();
    uint64_t v90 = v180;
    sub_25C6D5CF0();
    sub_25C6A43C0(v105, &qword_26A5C5DB8);
    sub_25C6A43C0(v97, &qword_26A5C5DC0);
  }
  else
  {
    uint64_t v90 = v180;
    if (qword_26A5C5CD8 != -1) {
      swift_once();
    }
    sub_25C6D6160();
    sub_25C6D5B10();
    uint64_t v91 = v190;
    char v92 = v191;
    uint64_t v93 = v192;
    char v94 = v193;
    v95 = v158;
    void *v158 = 0;
    *((unsigned char *)v95 + 8) = 1;
    v95[2] = v91;
    *((unsigned char *)v95 + 24) = v92;
    v95[4] = v93;
    *((unsigned char *)v95 + 40) = v94;
    *((_OWORD *)v95 + 3) = v194;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E30);
    sub_25C6A41AC(&qword_26A5C5E38, &qword_26A5C5DB8);
    sub_25C6A41F0();
    sub_25C6D5CF0();
  }
  v107 = v161;
  uint64_t v108 = v182;
  sub_25C6D5760();
  uint64_t v109 = v163;
  uint64_t v110 = sub_25C6D56D0();
  (*(void (**)(char *, uint64_t))(v162 + 8))(v107, v109);
  type metadata accessor for GetContactQuickActionButtonsViewModel();
  (*(void (**)(char *, uint64_t, uint64_t))(v165 + 16))(v164, v108, v166);
  sub_25C6CAE20();
  sub_25C6D6350();
  sub_25C6A3D84(&qword_26A5C5E48, MEMORY[0x263F77980]);
  uint64_t v111 = sub_25C6D5BD0();
  uint64_t v112 = (uint64_t)v173;
  uint64_t *v173 = v111;
  *(void *)(v112 + 8) = v113;
  uint64_t v114 = ContactQuickActionButtonsView;
  uint64_t v115 = sub_25C6D56C0();
  uint64_t v116 = v169;
  __swift_storeEnumTagSinglePayload(v169, 1, 1, v115);
  sub_25C6A42C8(v116, v170, &qword_26A5C5DB0);
  sub_25C6D6090();
  sub_25C6A43C0(v116, &qword_26A5C5DB0);
  *(void *)(v112 + *(int *)(v114 + 24)) = v110;
  v117 = (uint64_t *)(v112 + *(int *)(v114 + 28));
  sub_25C6A3D84(&qword_26A5C5E50, (void (*)(uint64_t))type metadata accessor for GetContactQuickActionButtonsViewModel);
  uint64_t *v117 = sub_25C6D5B80();
  v117[1] = v118;
  uint64_t v119 = v172;
  sub_25C6A4264(v112, v172);
  v121 = v177;
  uint64_t v120 = v178;
  v122 = *(void (**)(char *, char *, uint64_t))(v178 + 16);
  uint64_t v123 = v160;
  v122(v177, v176, v160);
  sub_25C6A42C8(v183, v179, &qword_26A5C5DF0);
  uint64_t v124 = v90;
  uint64_t v125 = v168;
  sub_25C6A42C8(v124, v168, &qword_26A5C5DD0);
  sub_25C6A4318(v119, v112, (void (*)(void))type metadata accessor for GetContactQuickActionButtonsView);
  v126 = v174;
  v122(v174, v121, v123);
  v127 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E58);
  v128 = &v126[v127[12]];
  *(void *)v128 = 0;
  v128[8] = 1;
  *((void *)v128 + 2) = v156;
  v128[24] = v155;
  *((void *)v128 + 4) = v154;
  v128[40] = v153;
  uint64_t v129 = v151;
  *((void *)v128 + 6) = v152;
  *((void *)v128 + 7) = v129;
  uint64_t v130 = v179;
  sub_25C6A42C8(v179, (uint64_t)&v126[v127[16]], &qword_26A5C5DF0);
  sub_25C6A42C8(v125, (uint64_t)&v126[v127[20]], &qword_26A5C5DD0);
  sub_25C6A4318(v112, (uint64_t)&v126[v127[24]], (void (*)(void))type metadata accessor for GetContactQuickActionButtonsView);
  sub_25C6A436C(v119, (void (*)(void))type metadata accessor for GetContactQuickActionButtonsView);
  sub_25C6A43C0(v180, &qword_26A5C5DD0);
  sub_25C6A43C0(v183, &qword_26A5C5DF0);
  v131 = *(void (**)(char *, uint64_t))(v120 + 8);
  v131(v176, v123);
  sub_25C6A436C(v112, (void (*)(void))type metadata accessor for GetContactQuickActionButtonsView);
  sub_25C6A43C0(v125, &qword_26A5C5DD0);
  sub_25C6A43C0(v130, &qword_26A5C5DF0);
  return ((uint64_t (*)(char *, uint64_t))v131)(v177, v123);
}

uint64_t sub_25C6A311C()
{
  return sub_25C6D5FA0();
}

uint64_t sub_25C6A3140()
{
  uint64_t v0 = sub_25C6D63D0();
  uint64_t v2 = v1;
  if (v0 == sub_25C6D63D0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25C6D6830();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25C6A31C8(uint64_t a1, uint64_t a2)
{
  return sub_25C6A3258(a1, a2, MEMORY[0x263F6CEF0], &qword_26A5C5DA8, MEMORY[0x263F6CEF0]);
}

uint64_t sub_25C6A3210(uint64_t a1, uint64_t a2)
{
  return sub_25C6A3258(a1, a2, MEMORY[0x263F6CE90], &qword_26A5C5DA0, MEMORY[0x263F6CE90]);
}

uint64_t sub_25C6A3258(uint64_t a1, uint64_t a2, void (*a3)(void), unint64_t *a4, void (*a5)(uint64_t))
{
  a3(0);
  sub_25C6A3D84(a4, a5);
  sub_25C6D6490();
  sub_25C6D6490();
  if (v12 == v10 && v13 == v11) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25C6D6830();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25C6A3338()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for GetContactView(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    swift_getEnumCaseMultiPayload();
    uint64_t v6 = sub_25C6D5780();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for GetContactView(uint64_t a1)
{
  uint64_t v2 = sub_25C6D5780();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for GetContactView(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_25C6D5780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for GetContactView(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25C6A436C(a1, (void (*)(void))type metadata accessor for GetContactView);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_25C6D5780();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for GetContactView(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_25C6D5780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for GetContactView(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25C6A436C(a1, (void (*)(void))type metadata accessor for GetContactView);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_25C6D5780();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25C6A37A0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25C6A37B0()
{
  uint64_t result = sub_25C6D5780();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_25C6A383C()
{
  unint64_t result = qword_26A5C5D38;
  if (!qword_26A5C5D38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C5D40);
    sub_25C6A1CD8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C5D38);
  }
  return result;
}

void type metadata accessor for CNActionType(uint64_t a1)
{
}

void type metadata accessor for VNImageOption(uint64_t a1)
{
}

uint64_t sub_25C6A38E0(uint64_t a1, id *a2)
{
  return sub_25C6A38F8(a1, a2);
}

uint64_t sub_25C6A38F8(uint64_t a1, id *a2)
{
  uint64_t result = sub_25C6D63B0();
  *a2 = 0;
  return result;
}

uint64_t sub_25C6A3970(uint64_t a1, id *a2)
{
  return sub_25C6A398C(a1, a2) & 1;
}

uint64_t sub_25C6A398C(uint64_t a1, id *a2)
{
  char v3 = sub_25C6D63C0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25C6A3A0C()
{
  sub_25C6D63D0();
  uint64_t v0 = sub_25C6D63A0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C6A3A44(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_25C6D63D0();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25C6A3A84()
{
  sub_25C6D63D0();
  sub_25C6D6460();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25C6A3ADC()
{
  sub_25C6D63D0();
  sub_25C6D6860();
  sub_25C6D6460();
  uint64_t v0 = sub_25C6D6870();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C6A3B50()
{
  return sub_25C6A3A44(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_25C6A3B80()
{
  return sub_25C6A3A84();
}

uint64_t sub_25C6A3B9C()
{
  return sub_25C6A3ADC();
}

uint64_t sub_25C6A3BB8()
{
  return sub_25C6A3A44(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_25C6A3BE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C6A3A0C();
  *a1 = result;
  return result;
}

uint64_t sub_25C6A3C10()
{
  return sub_25C6A3140() & 1;
}

uint64_t sub_25C6A3C38(uint64_t a1)
{
  uint64_t v2 = sub_25C6A3D84((unint64_t *)&qword_26A5C5D90, type metadata accessor for VNImageOption);
  uint64_t v3 = sub_25C6A3D84(&qword_26A5C5D98, type metadata accessor for VNImageOption);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25C6A3CF4()
{
  return sub_25C6A3D84(&qword_26A5C5D58, type metadata accessor for VNImageOption);
}

uint64_t sub_25C6A3D3C()
{
  return sub_25C6A3D84(&qword_26A5C5D60, type metadata accessor for VNImageOption);
}

uint64_t sub_25C6A3D84(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C6A3DCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25C6D63A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25C6A3E14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C6A3334(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25C6A3E40(uint64_t a1)
{
  uint64_t v2 = sub_25C6A3D84(&qword_26A5C6950, type metadata accessor for CNActionType);
  uint64_t v3 = sub_25C6A3D84(&qword_26A5C5D88, type metadata accessor for CNActionType);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25C6A3EFC()
{
  return sub_25C6A3D84(&qword_26A5C5D68, type metadata accessor for CNActionType);
}

uint64_t sub_25C6A3F44()
{
  return sub_25C6A3D84(&qword_26A5C5D70, type metadata accessor for CNActionType);
}

uint64_t sub_25C6A3F8C()
{
  return sub_25C6A3D84(&qword_26A5C5D78, type metadata accessor for CNActionType);
}

uint64_t sub_25C6A3FD4()
{
  return sub_25C6A3D84(&qword_26A5C5D80, type metadata accessor for VNImageOption);
}

unint64_t sub_25C6A401C()
{
  unint64_t result = qword_26A5C5E08;
  if (!qword_26A5C5E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C5E08);
  }
  return result;
}

uint64_t sub_25C6A4068(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_25C6A4080()
{
  unint64_t result = qword_26A5C5E10;
  if (!qword_26A5C5E10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C5DE0);
    swift_getOpaqueTypeConformance2();
    sub_25C6A41AC(&qword_26A5C5E18, &qword_26A5C5E20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C5E10);
  }
  return result;
}

uint64_t sub_25C6A4150(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25C6A41AC(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25C6A41F0()
{
  unint64_t result = qword_26A5C5E40;
  if (!qword_26A5C5E40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C5E30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C5E40);
  }
  return result;
}

uint64_t sub_25C6A4264(uint64_t a1, uint64_t a2)
{
  uint64_t ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(ContactQuickActionButtonsView - 8) + 32))(a2, a1, ContactQuickActionButtonsView);
  return a2;
}

uint64_t sub_25C6A42C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = OUTLINED_FUNCTION_4();
  v5(v4);
  return a2;
}

uint64_t sub_25C6A4318(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = OUTLINED_FUNCTION_4();
  v5(v4);
  return a2;
}

uint64_t sub_25C6A436C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  v3();
  return a1;
}

uint64_t sub_25C6A43C0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  v3();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_25C6A4420(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25C6A4440(uint64_t result, int a2, int a3)
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

void sub_25C6A447C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t OUTLINED_FUNCTION_4()
{
  return v0;
}

uint64_t sub_25C6A453C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_25C6A4550()
{
  uint64_t v1 = v0;
  sub_25C6D57B0();
  OUTLINED_FUNCTION_1();
  uint64_t v47 = v3;
  uint64_t v48 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_3_0();
  uint64_t v46 = v4;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v37 - v6;
  sub_25C6D5800();
  OUTLINED_FUNCTION_1();
  uint64_t v49 = v8;
  uint64_t v50 = v9;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3_0();
  v45 = v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v37 - v12;
  uint64_t v14 = sub_25C6D5870();
  OUTLINED_FUNCTION_1();
  uint64_t v16 = v15;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  char v21 = sub_25C6D5820();
  uint64_t v22 = *(uint64_t (**)(void))(v16 + 16);
  OUTLINED_FUNCTION_1_0();
  uint64_t v23 = v22();
  if (v21)
  {
    id v44 = v20;
    uint64_t result = MEMORY[0x26118F420](v23);
    if (!*(void *)(result + 16))
    {
      __break(1u);
      goto LABEL_12;
    }
    uint64_t v25 = v50;
    unint64_t v39 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    uint64_t v43 = v1;
    uint64_t v26 = v49;
    uint64_t v40 = *(void (**)(char *, unint64_t, uint64_t))(v50 + 16);
    uint64_t v41 = v50 + 16;
    v40(v13, result + v39, v49);
    swift_bridgeObjectRelease();
    sub_25C6D57F0();
    uint64_t v38 = *(void (**)(char *, uint64_t))(v25 + 8);
    uint64_t v50 = v25 + 8;
    v38(v13, v26);
    uint64_t v28 = v46;
    uint64_t v27 = v47;
    uint64_t v29 = v48;
    (*(void (**)(uint64_t, void, uint64_t))(v47 + 104))(v46, *MEMORY[0x263F6CEC0], v48);
    int v42 = sub_25C6A31C8((uint64_t)v7, v28);
    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v30(v28, v29);
    v30((uint64_t)v7, v29);
    uint64_t v31 = *(void (**)(void))(v16 + 8);
    OUTLINED_FUNCTION_2_0();
    v31();
    uint64_t v20 = v44;
    OUTLINED_FUNCTION_1_0();
    uint64_t v32 = v22();
    if (v42)
    {
      uint64_t result = MEMORY[0x26118F420](v32);
      if (*(void *)(result + 16))
      {
        uint64_t v33 = v45;
        uint64_t v34 = v49;
        v40(v45, result + v39, v49);
        swift_bridgeObjectRelease();
        sub_25C6D57D0();
        uint64_t v36 = v35;
        v38(v33, v34);
        OUTLINED_FUNCTION_2_0();
        v31();
        if (v36)
        {
          swift_bridgeObjectRelease();
          return 1;
        }
        return 0;
      }
LABEL_12:
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v31 = *(void (**)(void))(v16 + 8);
    OUTLINED_FUNCTION_2_0();
    v31();
    OUTLINED_FUNCTION_1_0();
    v22();
  }
  ((void (*)(char *, uint64_t))v31)(v20, v14);
  return 0;
}

uint64_t sub_25C6A48EC()
{
  if ((sub_25C6A499C() & 1) == 0) {
    return sub_25C6D6440();
  }
  sub_25C6D57D0();
  if (v0)
  {
    sub_25C6D6470();
    swift_bridgeObjectRelease();
  }
  sub_25C6D57C0();
  if (v1)
  {
    sub_25C6D6470();
    swift_bridgeObjectRelease();
    sub_25C6D6470();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_25C6A499C()
{
  uint64_t v1 = sub_25C6D5800();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25C6D57B0();
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C6D57F0();
  int v13 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v12, v7);
  if (v13 == *MEMORY[0x263F6CEC8] || v13 == *MEMORY[0x263F6CEA8] || v13 == *MEMORY[0x263F6CEB8])
  {
    sub_25C6D57D0();
    char v16 = sub_25C6D66F0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v0, v1);
    if (v16)
    {
      sub_25C6D57C0();
      char v17 = sub_25C6D66F0();
      swift_bridgeObjectRelease();
      char v18 = v17 ^ 1;
    }
    else
    {
      char v18 = 1;
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
    char v18 = 0;
  }
  return v18 & 1;
}

char *sub_25C6A4BA0(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((void *)a1 + 1) = a2[1];
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (char **)((char *)a2 + v8);
    uint64_t v11 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_25C6D5AA0();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      *(void *)uint64_t v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = &a1[v13];
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = sub_25C6D5980();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_25C6A4D10(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25C6D5AA0();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_25C6D5980();
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

void *sub_25C6A4DFC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)((char *)a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  id v11 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_25C6D5AA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
  }
  else
  {
    *uint64_t v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_25C6D5980();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  return a1;
}

uint64_t sub_25C6A4F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (void *)(a1 + v9);
    id v11 = (void *)(a2 + v9);
    sub_25C6A505C(a1 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_25C6D5AA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_25C6D5980();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

uint64_t sub_25C6A505C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_25C6A50BC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_25C6D5AA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_25C6D5980();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

void **sub_25C6A51E8(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    id v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    sub_25C6A505C((uint64_t)a1 + v7);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_25C6D5AA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_25C6D5980();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_25C6A5334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6A5348);
}

uint64_t sub_25C6A5348(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E70);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v11 = sub_25C6D5980();
      uint64_t v12 = *(int *)(a3 + 24);
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v12, a2, v11);
  }
}

uint64_t sub_25C6A5404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6A5418);
}

void *sub_25C6A5418(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E70);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = sub_25C6D5980();
      uint64_t v11 = *(int *)(a4 + 24);
    }
    return (void *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for ModifyContactAttributeIntentHandledView()
{
  uint64_t result = qword_26A5C5E78;
  if (!qword_26A5C5E78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C6A550C()
{
  sub_25C6A55E0();
  if (v0 <= 0x3F)
  {
    sub_25C6D5980();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25C6A55E0()
{
  if (!qword_26A5C5E88)
  {
    sub_25C6D5AA0();
    unint64_t v0 = sub_25C6D5AB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A5C5E88);
    }
  }
}

uint64_t sub_25C6A5638()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_25C6A5658(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_25C6D59F0();
    __swift_project_value_buffer(v2, (uint64_t)qword_26A5C6B58);
    oslog = sub_25C6D59D0();
    os_log_type_t v3 = sub_25C6D65D0();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_25C69F000, oslog, v3, "#SiriContactsActionableView could not obtain direct invocation for view press", v4, 2u);
      MEMORY[0x261190AB0](v4, -1, -1);
    }
LABEL_15:

    return;
  }
  sub_25C6A6700();
  uint64_t v5 = OUTLINED_FUNCTION_3_1();
  sub_25C6A6740(v5, v6);
  OUTLINED_FUNCTION_3_1();
  uint64_t v7 = sub_25C6D65B0();
  if (!v7)
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_25C6D59F0();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A5C6B58);
    oslog = sub_25C6D59D0();
    os_log_type_t v12 = sub_25C6D65D0();
    if (os_log_type_enabled(oslog, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_25C69F000, oslog, v12, "#SiriContactsActionableView could not convert direct invocation to actionable command", v13, 2u);
      MEMORY[0x261190AB0](v13, -1, -1);
    }
    uint64_t v14 = OUTLINED_FUNCTION_3_1();
    sub_25C6A665C(v14, v15);
    goto LABEL_15;
  }
  uint64_t v8 = (void *)v7;
  sub_25C6D6340();

  uint64_t v9 = OUTLINED_FUNCTION_3_1();

  sub_25C6A665C(v9, v10);
}

uint64_t sub_25C6A5880@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v17 = a1;
  uint64_t v3 = type metadata accessor for ModifyContactAttributeIntentHandledView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E90);
  uint64_t v7 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C6A6870(v2, (uint64_t)v6, (void (*)(void))type metadata accessor for ModifyContactAttributeIntentHandledView);
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = swift_allocObject();
  sub_25C6A6408((uint64_t)v6, v11 + v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E98);
  sub_25C6A41AC(&qword_26A5C5EA0, &qword_26A5C5E98);
  sub_25C6D61F0();
  sub_25C6A6870(v15[1], (uint64_t)v6, (void (*)(void))type metadata accessor for ModifyContactAttributeIntentHandledView);
  uint64_t v12 = swift_allocObject();
  sub_25C6A6408((uint64_t)v6, v12 + v10);
  sub_25C6A41AC(&qword_26A5C5EA8, &qword_26A5C5E90);
  uint64_t v13 = v16;
  sub_25C6D5F90();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v13);
}

uint64_t sub_25C6A5B20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v73 = a2;
  uint64_t v72 = sub_25C6D5580();
  uint64_t v70 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v66 = (char *)v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_25C6D6280();
  uint64_t v60 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v59 = (char *)v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_25C6D62A0();
  uint64_t v68 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  v56 = (char *)v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5EB8);
  uint64_t v71 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v58 = (char *)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5EC0);
  uint64_t v65 = *(void *)(v67 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v67);
  v61 = (char *)v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v63 = (char *)v55 - v9;
  uint64_t v10 = sub_25C6D5E40();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ModifyContactAttributeBodyView();
  uint64_t v15 = v14 - 8;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v57 = (uint64_t)v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (void *)((char *)v55 - v18);
  uint64_t v20 = a1 + *(int *)(type metadata accessor for ModifyContactAttributeIntentHandledView() + 24);
  v55[1] = v20;
  char v21 = (char *)v19 + *(int *)(v15 + 36);
  uint64_t v22 = sub_25C6D5980();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v21, v20, v22);
  sub_25C6D6350();
  sub_25C6A6828(&qword_26A5C5E48, MEMORY[0x263F77980]);
  *uint64_t v19 = sub_25C6D5BD0();
  v19[1] = v23;
  uint64_t v74 = 0x402E000000000000;
  uint64_t v24 = *MEMORY[0x263F1A6C8];
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 104);
  v25(v13, v24, v10);
  sub_25C6A6798();
  sub_25C6D5AE0();
  uint64_t v74 = 0x4031000000000000;
  v25(v13, v24, v10);
  sub_25C6D5AE0();
  uint64_t v74 = sub_25C6CA3E4();
  uint64_t v75 = v26;
  sub_25C6A401C();
  uint64_t v27 = sub_25C6D5EC0();
  uint64_t v29 = v28;
  char v31 = v30;
  uint64_t v33 = v32;
  uint64_t v76 = MEMORY[0x263F1A830];
  uint64_t v77 = MEMORY[0x263F77348];
  uint64_t v34 = swift_allocObject();
  uint64_t v74 = v34;
  *(void *)(v34 + 16) = v27;
  *(void *)(v34 + 24) = v29;
  *(unsigned char *)(v34 + 32) = v31 & 1;
  *(void *)(v34 + 40) = v33;
  (*(void (**)(char *, void, uint64_t))(v60 + 104))(v59, *MEMORY[0x263F77780], v62);
  uint64_t v35 = v56;
  sub_25C6D6290();
  uint64_t v36 = v70;
  uint64_t v37 = v66;
  uint64_t v38 = v72;
  (*(void (**)(char *, void, uint64_t))(v70 + 104))(v66, *MEMORY[0x263F76980], v72);
  uint64_t v39 = sub_25C6A6828(&qword_26A5C5ED0, MEMORY[0x263F77798]);
  uint64_t v40 = v58;
  uint64_t v41 = v64;
  sub_25C6D5EF0();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v35, v41);
  uint64_t v74 = v41;
  uint64_t v75 = v39;
  swift_getOpaqueTypeConformance2();
  int v42 = v61;
  uint64_t v43 = v69;
  sub_25C6D5F00();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v40, v43);
  uint64_t v44 = v65;
  v45 = v63;
  uint64_t v46 = v67;
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v63, v42, v67);
  uint64_t v47 = v57;
  sub_25C6A6870((uint64_t)v19, v57, (void (*)(void))type metadata accessor for ModifyContactAttributeBodyView);
  uint64_t v48 = v44;
  uint64_t v49 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  uint64_t v50 = v46;
  v49(v42, v45, v46);
  uint64_t v51 = v73;
  sub_25C6A6870(v47, v73, (void (*)(void))type metadata accessor for ModifyContactAttributeBodyView);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5ED8);
  v49((char *)(v51 + *(int *)(v52 + 48)), v42, v50);
  uint64_t v53 = *(void (**)(char *, uint64_t))(v48 + 8);
  v53(v45, v50);
  sub_25C6A68D0((uint64_t)v19);
  v53(v42, v50);
  return sub_25C6A68D0(v47);
}

uint64_t sub_25C6A6318(id *a1)
{
  type metadata accessor for ModifyContactAttributeIntentHandledView();
  uint64_t v2 = sub_25C6D58F0();
  if (*a1)
  {
    uint64_t v4 = v2;
    unint64_t v5 = v3;
    id v6 = *a1;
    sub_25C6A5658(v4, v5);

    return sub_25C6A665C(v4, v5);
  }
  else
  {
    sub_25C6D6350();
    sub_25C6A6828(&qword_26A5C5E48, MEMORY[0x263F77980]);
    uint64_t result = sub_25C6D5BC0();
    __break(1u);
  }
  return result;
}

uint64_t sub_25C6A6408(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModifyContactAttributeIntentHandledView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C6A646C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ModifyContactAttributeIntentHandledView();
  OUTLINED_FUNCTION_1_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_25C6A5B20(v5, a1);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = type metadata accessor for ModifyContactAttributeIntentHandledView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25C6D5AA0();
    OUTLINED_FUNCTION_0();
    (*(void (**)(uint64_t))(v6 + 8))(v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 24);
  sub_25C6D5980();
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v8 + 8))(v7);

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25C6A661C()
{
  uint64_t v1 = type metadata accessor for ModifyContactAttributeIntentHandledView();
  OUTLINED_FUNCTION_1_1(v1);
  uint64_t v3 = (id *)(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));

  return sub_25C6A6318(v3);
}

uint64_t sub_25C6A665C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25C6A6670(a1, a2);
  }
  return a1;
}

uint64_t sub_25C6A6670(uint64_t a1, unint64_t a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_25C6A6700()
{
  unint64_t result = qword_26A5C5EB0;
  if (!qword_26A5C5EB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5C5EB0);
  }
  return result;
}

uint64_t sub_25C6A6740(uint64_t a1, unint64_t a2)
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

unint64_t sub_25C6A6798()
{
  unint64_t result = qword_26A5C5EC8;
  if (!qword_26A5C5EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C5EC8);
  }
  return result;
}

uint64_t sub_25C6A67E4()
{
  sub_25C6A4068(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25C6A6828(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C6A6870(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C6A68D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ModifyContactAttributeBodyView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C6A692C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

uint64_t sub_25C6A69E4()
{
  return sub_25C6D5BE0();
}

uint64_t sub_25C6A6A08(uint64_t a1)
{
  sub_25C6D5AA0();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4 - v3, a1);
  return sub_25C6D5BF0();
}

uint64_t ModifyContactAttributeView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v52 = a1;
  uint64_t v53 = type metadata accessor for ModifyContactAttributeIntentHandledView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_2_1();
  uint64_t v44 = (uint64_t *)(v4 - v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v46 = (uint64_t)&v44 - v7;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5EE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2();
  uint64_t v51 = v10 - v9;
  uint64_t v50 = type metadata accessor for ModifyContactAttributeConfirmationView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_2_1();
  uint64_t v14 = (uint64_t *)(v12 - v13);
  MEMORY[0x270FA5388](v15);
  uint64_t v45 = (uint64_t)&v44 - v16;
  uint64_t v17 = sub_25C6D5980();
  OUTLINED_FUNCTION_1();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_2_1();
  uint64_t v23 = v21 - v22;
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v44 - v25;
  type metadata accessor for ModifyContactAttributeView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_2();
  uint64_t v30 = v29 - v28;
  sub_25C6A7120(v2, v29 - v28, (void (*)(void))type metadata accessor for ModifyContactAttributeView);
  LODWORD(v2) = swift_getEnumCaseMultiPayload();
  char v31 = *(void (**)(void))(v19 + 32);
  uint64_t v32 = v30;
  uint64_t v33 = v17;
  ((void (*)(char *, uint64_t, uint64_t))v31)(v26, v32, v17);
  uint64_t v48 = v19;
  uint64_t v49 = v26;
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v23, v26, v17);
  sub_25C6D6350();
  sub_25C6A7078(&qword_26A5C5E48, MEMORY[0x263F77980]);
  uint64_t v34 = sub_25C6D5BD0();
  uint64_t v36 = v34;
  uint64_t v37 = v35;
  if (v2 == 1)
  {
    uint64_t v38 = (uint64_t)v44;
    *uint64_t v44 = v34;
    *(void *)(v38 + 8) = v35;
    uint64_t v39 = (uint64_t *)(v38 + *(int *)(v53 + 20));
    *uint64_t v39 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_4_0();
    v31();
    uint64_t v40 = v46;
    sub_25C6A70C0(v38, v46, (void (*)(void))type metadata accessor for ModifyContactAttributeIntentHandledView);
    sub_25C6A7120(v40, v51, (void (*)(void))type metadata accessor for ModifyContactAttributeIntentHandledView);
    swift_storeEnumTagMultiPayload();
    sub_25C6A7078(&qword_26A5C5EE8, (void (*)(uint64_t))type metadata accessor for ModifyContactAttributeConfirmationView);
    sub_25C6A7078(&qword_26A5C5EF0, (void (*)(uint64_t))type metadata accessor for ModifyContactAttributeIntentHandledView);
    sub_25C6D5CF0();
    uint64_t v41 = type metadata accessor for ModifyContactAttributeIntentHandledView;
  }
  else
  {
    *uint64_t v14 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
    swift_storeEnumTagMultiPayload();
    int v42 = (uint64_t *)((char *)v14 + *(int *)(v50 + 20));
    *int v42 = v36;
    v42[1] = v37;
    OUTLINED_FUNCTION_4_0();
    v31();
    uint64_t v40 = v45;
    sub_25C6A70C0((uint64_t)v14, v45, (void (*)(void))type metadata accessor for ModifyContactAttributeConfirmationView);
    sub_25C6A7120(v40, v51, (void (*)(void))type metadata accessor for ModifyContactAttributeConfirmationView);
    swift_storeEnumTagMultiPayload();
    sub_25C6A7078(&qword_26A5C5EE8, (void (*)(uint64_t))type metadata accessor for ModifyContactAttributeConfirmationView);
    sub_25C6A7078(&qword_26A5C5EF0, (void (*)(uint64_t))type metadata accessor for ModifyContactAttributeIntentHandledView);
    sub_25C6D5CF0();
    uint64_t v41 = type metadata accessor for ModifyContactAttributeConfirmationView;
  }
  sub_25C6A7440(v40, (void (*)(void))v41);
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v49, v33);
}

uint64_t type metadata accessor for ModifyContactAttributeView()
{
  uint64_t result = qword_26A5C5EF8;
  if (!qword_26A5C5EF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6A7050()
{
  return sub_25C6D5BE0();
}

uint64_t sub_25C6A7078(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C6A70C0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25C6A7120(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C6A7180()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for ModifyContactAttributeView(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    swift_getEnumCaseMultiPayload();
    uint64_t v6 = sub_25C6D5980();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ModifyContactAttributeView(uint64_t a1)
{
  uint64_t v2 = sub_25C6D5980();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for ModifyContactAttributeView(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_25C6D5980();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for ModifyContactAttributeView(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25C6A7440(a1, (void (*)(void))type metadata accessor for ModifyContactAttributeView);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_25C6D5980();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25C6A7440(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t initializeWithTake for ModifyContactAttributeView(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_25C6D5980();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for ModifyContactAttributeView(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25C6A7440(a1, (void (*)(void))type metadata accessor for ModifyContactAttributeView);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_25C6D5980();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25C6A75E4()
{
  uint64_t result = sub_25C6D5980();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_25C6A7670()
{
  unint64_t result = qword_26A5C5F08;
  if (!qword_26A5C5F08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C5F10);
    sub_25C6A7078(&qword_26A5C5EE8, (void (*)(uint64_t))type metadata accessor for ModifyContactAttributeConfirmationView);
    sub_25C6A7078(&qword_26A5C5EF0, (void (*)(uint64_t))type metadata accessor for ModifyContactAttributeIntentHandledView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C5F08);
  }
  return result;
}

uint64_t static ContactsFlowImageColorGenerator.colors(for:)(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_25C6D59F0();
    __swift_project_value_buffer(v2, (uint64_t)qword_26A5C6B58);
    uint64_t v3 = sub_25C6D59D0();
    os_log_type_t v4 = sub_25C6D65C0();
    if (os_log_type_enabled(v3, v4))
    {
      int v5 = (uint8_t *)OUTLINED_FUNCTION_3_2();
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_25C69F000, v3, v4, "ContactsFlowImageColorGenerator no imageData, falling back to default color set", v5, 2u);
      OUTLINED_FUNCTION_1_2();
    }

    return sub_25C6A78EC();
  }
  else
  {
    sub_25C6AA904(0, &qword_26A5C5F28);
    sub_25C6A6740(a1, a2);
    sub_25C6A6740(a1, a2);
    id v9 = sub_25C6A7AD4(a1, a2);
    uint64_t v10 = sub_25C6A7B4C(v9);

    sub_25C6A665C(a1, a2);
    return v10;
  }
}

void sub_25C6A78CC()
{
  qword_26A5C5F18 = 0x4010000000000000;
}

void sub_25C6A78DC()
{
  qword_26A5C5F20 = 0x4014000000000000;
}

uint64_t sub_25C6A78EC()
{
  uint64_t v0 = sub_25C6D5FE0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5F60);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25C6D7550;
  int v5 = *(void (**)(uint64_t))(v1 + 104);
  uint64_t v6 = OUTLINED_FUNCTION_0_1();
  v5(v6);
  *(void *)(v4 + 32) = MEMORY[0x26118FC60](v3, 0.505882353, 0.51372549, 0.552941176, 1.0);
  uint64_t v7 = OUTLINED_FUNCTION_0_1();
  v5(v7);
  *(void *)(v4 + 40) = MEMORY[0x26118FC60](v3, 0.525490196, 0.533333333, 0.564705882, 1.0);
  uint64_t v8 = OUTLINED_FUNCTION_0_1();
  v5(v8);
  *(void *)(v4 + 48) = MEMORY[0x26118FC60](v3, 0.545098039, 0.556862745, 0.580392157, 1.0);
  uint64_t v9 = OUTLINED_FUNCTION_0_1();
  v5(v9);
  *(void *)(v4 + 56) = MEMORY[0x26118FC60](v3, 0.584313725, 0.588235294, 0.603921569, 1.0);
  uint64_t v10 = OUTLINED_FUNCTION_0_1();
  v5(v10);
  *(void *)(v4 + 64) = MEMORY[0x26118FC60](v3, 0.603921569, 0.603921569, 0.619607843, 1.0);
  uint64_t v13 = v4;
  sub_25C6D64D0();
  return v13;
}

id sub_25C6A7AD4(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  int v5 = (void *)sub_25C6D5540();
  id v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_25C6A6670(a1, a2);

  return v6;
}

uint64_t sub_25C6A7B4C(void *a1)
{
  if (!a1) {
    goto LABEL_8;
  }
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_ioSurface);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = &selRef_initWithIOSurface_;
  }
  else
  {
    id v5 = objc_msgSend(v1, sel_CGImage);
    if (!v5) {
      goto LABEL_8;
    }
    uint64_t v3 = v5;
    id v4 = &selRef_initWithCGImage_;
  }
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00650]), *v4, v3);

  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = sub_25C6A7F00(v7);

    return v8;
  }
LABEL_8:
  if (qword_26A5C5CC0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_25C6D59F0();
  __swift_project_value_buffer(v10, (uint64_t)qword_26A5C6B58);
  uint64_t v11 = sub_25C6D59D0();
  os_log_type_t v12 = sub_25C6D65C0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_25C69F000, v11, v12, "ContactsFlowImageColorGenerator couldn't get CIImage from UIImage base, falling back to default color set", v13, 2u);
    MEMORY[0x261190AB0](v13, -1, -1);
  }

  return sub_25C6A78EC();
}

uint64_t static ContactsFlowImageColorGenerator.shouldDisplayLightText(against:)(uint64_t a1)
{
  sub_25C6A7D30(a1);
  sub_25C6D6030();
  char v1 = sub_25C6D5FF0();
  swift_release();
  swift_release();
  return v1 & 1;
}

uint64_t sub_25C6A7D30(uint64_t a1)
{
  if (qword_26A5C5CC0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C6D59F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A5C6B58);
  uint64_t v3 = sub_25C6D59D0();
  os_log_type_t v4 = sub_25C6D65C0();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)OUTLINED_FUNCTION_3_2();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_25C69F000, v3, v4, "ContactsFlowImageColorGenerator idealTextColor", v5, 2u);
    OUTLINED_FUNCTION_1_2();
  }

  sub_25C6A9AB4(a1);
  sub_25C6D6030();
  double v6 = sub_25C6A9820();
  swift_release();
  id v7 = sub_25C6D59D0();
  os_log_type_t v8 = sub_25C6D65C0();
  BOOL v9 = os_log_type_enabled(v7, v8);
  if (v6 <= 0.45)
  {
    if (v9)
    {
      os_log_type_t v12 = (uint8_t *)OUTLINED_FUNCTION_3_2();
      *(_WORD *)os_log_type_t v12 = 0;
      _os_log_impl(&dword_25C69F000, v7, v8, "ContactsFlowImageColorGenerator idealTextColor returning dark text color", v12, 2u);
      OUTLINED_FUNCTION_1_2();
    }

    uint64_t v11 = sub_25C6D6020();
  }
  else
  {
    if (v9)
    {
      uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_3_2();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_25C69F000, v7, v8, "ContactsFlowImageColorGenerator idealTextColor returning light text color", v10, 2u);
      OUTLINED_FUNCTION_1_2();
    }

    uint64_t v11 = sub_25C6D6030();
  }
  uint64_t v13 = v11;
  swift_release();
  return v13;
}

uint64_t sub_25C6A7F00(void *a1)
{
  objc_msgSend(a1, sel_extent);
  double v3 = v2;
  double v5 = v4;
  unint64_t v6 = static ContactsFlowImageColorGenerator.performSaliencyExtraction(from:)(a1);
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = static ContactsFlowImageColorGenerator.makeImageMask(from:originalScale:)(v6, v3, v5);
    id v9 = static ContactsFlowImageColorGenerator.makeThresholdImage(from:threshold:)((uint64_t)v8, 0.5);
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = objc_msgSend(self, sel_maskToAlphaFilter);
      objc_msgSend(v11, sel_setInputImage_, v10);
      id v12 = objc_msgSend(v11, sel_outputImage);

      if (v12)
      {
        id v13 = static ContactsFlowImageColorGenerator.makeSubtractedImage(baseImage:imageToSubtract:)((uint64_t)a1, (uint64_t)v12);
        if (v13)
        {
          uint64_t v14 = v13;
          id v15 = static ContactsFlowImageColorGenerator.makeGradientCGImage(from:originalSize:)(v13, v3, v5);
          uint64_t v16 = sub_25C6A8CAC(v15);

          return v16;
        }
        if (qword_26A5C5CC0 != -1) {
          swift_once();
        }
        uint64_t v31 = sub_25C6D59F0();
        __swift_project_value_buffer(v31, (uint64_t)qword_26A5C6B58);
        uint64_t v32 = sub_25C6D59D0();
        os_log_type_t v33 = sub_25C6D65C0();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v34 = 0;
          _os_log_impl(&dword_25C69F000, v32, v33, "ContactsFlowImageColorGenerator failed to extract subject from image for color sampling, falling back to default color set", v34, 2u);
          MEMORY[0x261190AB0](v34, -1, -1);
        }

        uint64_t v26 = sub_25C6A78EC();
      }
      else
      {
        if (qword_26A5C5CC0 != -1) {
          swift_once();
        }
        uint64_t v27 = sub_25C6D59F0();
        __swift_project_value_buffer(v27, (uint64_t)qword_26A5C6B58);
        uint64_t v28 = sub_25C6D59D0();
        os_log_type_t v29 = sub_25C6D65C0();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v30 = 0;
          _os_log_impl(&dword_25C69F000, v28, v29, "ContactsFlowImageColorGenerator failed to remove background from filtered image mask, falling back to default color set", v30, 2u);
          MEMORY[0x261190AB0](v30, -1, -1);
        }

        uint64_t v26 = sub_25C6A78EC();
      }
    }
    else
    {
      if (qword_26A5C5CC0 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_25C6D59F0();
      __swift_project_value_buffer(v22, (uint64_t)qword_26A5C6B58);
      uint64_t v23 = sub_25C6D59D0();
      os_log_type_t v24 = sub_25C6D65C0();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl(&dword_25C69F000, v23, v24, "ContactsFlowImageColorGenerator failed to obtain filtered image mask, falling back to default color set", v25, 2u);
        MEMORY[0x261190AB0](v25, -1, -1);
      }

      uint64_t v26 = sub_25C6A78EC();
    }
    return v26;
  }
  else
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_25C6D59F0();
    __swift_project_value_buffer(v18, (uint64_t)qword_26A5C6B58);
    uint64_t v19 = sub_25C6D59D0();
    os_log_type_t v20 = sub_25C6D65C0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_25C69F000, v19, v20, "ContactsFlowImageColorGenerator failed to obtain result from completed request, falling back to default color set", v21, 2u);
      MEMORY[0x261190AB0](v21, -1, -1);
    }

    return sub_25C6A78EC();
  }
}

unint64_t static ContactsFlowImageColorGenerator.performSaliencyExtraction(from:)(void *a1)
{
  v32[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = type metadata accessor for Signpost.OpenSignpost();
  MEMORY[0x270FA5388](v2);
  double v4 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 32;
  type metadata accessor for VNImageOption(0);
  sub_25C6A9E60();
  id v5 = a1;
  sub_25C6D6370();
  id v6 = objc_allocWithZone(MEMORY[0x263F1EF40]);
  id v7 = sub_25C6A9DC4(v5);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1EF00]), sel_init);
  objc_msgSend(v8, sel_setRevision_, 2);
  if (qword_26A5C5CB0 != -1) {
    swift_once();
  }
  id v9 = (id)qword_26A5C60E0;
  sub_25C6D59B0();
  sub_25C6D6630();
  OUTLINED_FUNCTION_2_2();
  uint64_t v10 = &v4[*(int *)(v2 + 20)];
  *(void *)uint64_t v10 = "VisionSaliencyRequest";
  *((void *)v10 + 1) = 21;
  v10[16] = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5F30);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_25C6D7560;
  *(void *)(v11 + 32) = v8;
  v32[0] = (id)v11;
  sub_25C6D64D0();
  sub_25C6AA904(0, &qword_26A5C5F38);
  id v12 = v8;
  id v13 = (void *)sub_25C6D64B0();
  swift_bridgeObjectRelease();
  v32[0] = 0;
  unsigned int v14 = objc_msgSend(v7, sel_performRequests_error_, v13, v32);

  if (v14)
  {
    id v15 = v32[0];
    unint64_t v16 = sub_25C6AA7D4(v12);
    unint64_t v17 = v16;
    if (v16)
    {
      if (v16 >> 62)
      {
        if (sub_25C6D67E0()) {
          goto LABEL_7;
        }
      }
      else if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_7:
        if ((v17 & 0xC000000000000001) != 0)
        {
          id v18 = (id)MEMORY[0x261190350](0, v17);
        }
        else
        {
          if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            __break(1u);
          }
          id v18 = *(id *)(v17 + 32);
        }
        uint64_t v19 = v18;
        swift_bridgeObjectRelease();
        unint64_t v17 = (unint64_t)objc_msgSend(v19, sel_pixelBuffer);

        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
      unint64_t v17 = 0;
    }
LABEL_19:
    sub_25C6D6620();
    OUTLINED_FUNCTION_2_2();

    sub_25C6A9EB0((uint64_t)v4);
    return v17;
  }
  id v20 = v32[0];
  uint64_t v21 = (void *)sub_25C6D54F0();

  swift_willThrow();
  sub_25C6D6620();
  OUTLINED_FUNCTION_2_2();
  sub_25C6A9EB0((uint64_t)v4);
  if (qword_26A5C5CC0 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_25C6D59F0();
  __swift_project_value_buffer(v22, (uint64_t)qword_26A5C6B58);
  id v23 = v21;
  id v24 = v21;
  uint64_t v25 = sub_25C6D59D0();
  os_log_type_t v26 = sub_25C6D65C0();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    v32[0] = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 136315138;
    swift_getErrorValue();
    uint64_t v28 = sub_25C6D6850();
    uint64_t v31 = sub_25C6A9FE8(v28, v29, (uint64_t *)v32);
    sub_25C6D6700();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C69F000, v25, v26, "ContactsFlowImageColorGenerator failed to complete image request, falling back to default color set with error: %s", v27, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();
  }
  else
  {
  }
  return 0;
}

id static ContactsFlowImageColorGenerator.makeImageMask(from:originalScale:)(uint64_t a1, double a2, double a3)
{
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00650]), sel_initWithCVPixelBuffer_, a1);
  objc_msgSend(v5, sel_extent);
  CGAffineTransformMakeScale(&v10, a2 / v6, a3 / v7);
  id v8 = objc_msgSend(v5, sel_imageByApplyingTransform_, &v10);

  return v8;
}

id static ContactsFlowImageColorGenerator.makeThresholdImage(from:threshold:)(uint64_t a1, float a2)
{
  id v4 = objc_msgSend(self, sel_colorThresholdFilter);
  objc_msgSend(v4, sel_setInputImage_, a1);
  *(float *)&double v5 = a2;
  objc_msgSend(v4, sel_setThreshold_, v5);
  id v6 = objc_msgSend(v4, sel_outputImage);

  return v6;
}

id static ContactsFlowImageColorGenerator.makeTransparencyImage(fromThreshold:)(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_maskToAlphaFilter);
  objc_msgSend(v2, sel_setInputImage_, a1);
  id v3 = objc_msgSend(v2, sel_outputImage);

  return v3;
}

id static ContactsFlowImageColorGenerator.makeSubtractedImage(baseImage:imageToSubtract:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_sourceOutCompositingFilter);
  objc_msgSend(v4, sel_setInputImage_, a1);
  objc_msgSend(v4, sel_setBackgroundImage_, a2);
  id v5 = objc_msgSend(v4, sel_outputImage);

  return v5;
}

id static ContactsFlowImageColorGenerator.makeGradientCGImage(from:originalSize:)(void *a1, double a2, double a3)
{
  id v6 = (void *)sub_25C6D63A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5F40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C6D7570;
  *(void *)(inited + 32) = 0x6469577475706E69;
  *(void *)(inited + 40) = 0xEA00000000006874;
  uint64_t v8 = MEMORY[0x263F8EF38];
  *(double *)(inited + 48) = a2;
  *(void *)(inited + 72) = v8;
  *(void *)(inited + 80) = 0x6965487475706E69;
  *(void *)(inited + 88) = 0xEB00000000746867;
  *(void *)(inited + 120) = v8;
  *(double *)(inited + 96) = a3;
  sub_25C6D6370();
  id v9 = (void *)sub_25C6D6360();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(a1, sel_imageByApplyingFilter_withInputParameters_, v6, v9);

  objc_msgSend(v10, sel_extent);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00628]), sel_init);
  id v18 = objc_msgSend(v17, sel_createCGImage_fromRect_, v10, v12, v14, 8.0, v16);

  return v18;
}

uint64_t sub_25C6A8CAC(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    size_t Width = CGImageGetWidth(v2);
    int64_t Height = CGImageGetHeight(v2);
    if (Width && Height)
    {
      double v5 = (double)Height;
      if (qword_26A5C5CA8 != -1) {
        swift_once();
      }
      if (*(double *)&qword_26A5C5F20 * 32.0 > v5) {
        double v5 = *(double *)&qword_26A5C5F20 * 32.0;
      }
      CGColorSpaceRef v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
      if (v6)
      {
        double v7 = v6;
        if (qword_26A5C5CA0 != -1) {
          swift_once();
        }
        if (v5 <= -9.22337204e18)
        {
          __break(1u);
        }
        else if (v5 < 9.22337204e18)
        {
          if ((*(void *)&v5 & 0x7FF0000000000000) != 0x7FF0000000000000
            && (qword_26A5C5F18 & 0x7FF0000000000000) != 0x7FF0000000000000)
          {
            if (*(double *)&qword_26A5C5F18 > -9.22337204e18)
            {
              if (*(double *)&qword_26A5C5F18 < 9.22337204e18)
              {
                uint64_t v9 = (uint64_t)v5;
                uint64_t v10 = (uint64_t)*(double *)&qword_26A5C5F18;
                char v1 = CGBitmapContextCreate(0, 1uLL, (uint64_t)v5, 8uLL, (uint64_t)*(double *)&qword_26A5C5F18, v7, 0x4001u);
                if (v1)
                {
                  sub_25C6D65A0();
                  Data = (char *)CGBitmapContextGetData(v1);
                  if (Data)
                  {
                    uint64_t v12 = (uint64_t)Data;
                    if (v9 >= 1)
                    {
                      uint64_t v13 = 0;
                      while (1)
                      {
                        uint64_t v14 = v13 * v10;
                        if ((unsigned __int128)(v13 * (__int128)v10) >> 64 != (v13 * v10) >> 63) {
                          goto LABEL_77;
                        }
                        double v15 = &Data[v14];
                        int v16 = Data[v14];
                        int v17 = Data[v14 + 1];
                        int v18 = Data[v14 + 3];
                        if ((v16 | v17 || v15[2]) && v18) {
                          goto LABEL_51;
                        }
                        if (v9 == ++v13)
                        {
                          uint64_t v13 = (uint64_t)v5;
                          goto LABEL_51;
                        }
                      }
                    }
                    uint64_t v13 = 0;
LABEL_51:
                    double v35 = v5 + -1.0;
                    if ((~COERCE__INT64(v5 + -1.0) & 0x7FF0000000000000) != 0)
                    {
                      if (v35 > -9.22337204e18)
                      {
                        if (v35 < 9.22337204e18)
                        {
                          uint64_t v36 = (uint64_t)v35;
                          if ((uint64_t)v35 >= 1)
                          {
                            while (1)
                            {
                              uint64_t v37 = v36 * v10;
                              if ((unsigned __int128)(v36 * (__int128)v10) >> 64 != (v36 * v10) >> 63) {
                                goto LABEL_78;
                              }
                              uint64_t v38 = &Data[v37];
                              int v39 = Data[v37];
                              int v40 = Data[v37 + 1];
                              int v41 = Data[v37 + 3];
                              if ((v39 | v40 || v38[2]) && v41) {
                                break;
                              }
                              if (v36-- <= 1)
                              {
                                uint64_t v36 = 0;
                                break;
                              }
                            }
                          }
                          uint64_t v58 = MEMORY[0x263F8EE78];
                          if (!__OFSUB__(v36, v13))
                          {
                            double v43 = ceil((double)(v36 - v13) / (*(double *)&qword_26A5C5F20 + -1.0));
                            if ((~*(void *)&v43 & 0x7FF0000000000000) != 0)
                            {
                              v56 = v1;
                              uint64_t v57 = v7;
                              if (v43 > -9.22337204e18)
                              {
                                uint64_t v55 = v2;
                                if (v43 < 9.22337204e18)
                                {
                                  if (v13 < v36)
                                  {
                                    uint64_t v44 = (uint64_t)v43;
                                    while ((unsigned __int128)(v13 * (__int128)v10) >> 64 == (v13 * v10) >> 63)
                                    {
                                      uint64_t v45 = (unsigned char *)(v12 + v13 * v10);
                                      LOBYTE(v43) = *v45;
                                      *(double *)&unint64_t v46 = (double)*(unint64_t *)&v43;
                                      double v47 = *(double *)&v46 / 255.0;
                                      LOBYTE(v46) = v45[1];
                                      *(double *)&unint64_t v48 = (double)v46;
                                      double v49 = *(double *)&v48 / 255.0;
                                      LOBYTE(v48) = v45[2];
                                      *(double *)&unint64_t v50 = (double)v48;
                                      double v51 = *(double *)&v50 / 255.0;
                                      LOBYTE(v50) = v45[3];
                                      MEMORY[0x26118FBE0](objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, v47, v49, v51, (double)v50 / 255.0, v55, v56, v57));
                                      MEMORY[0x2611900B0]();
                                      if (*(void *)(v58 + 16) >= *(void *)(v58 + 24) >> 1) {
                                        sub_25C6D64E0();
                                      }
                                      sub_25C6D6500();
                                      sub_25C6D64D0();
                                      uint64_t v52 = v13 + v44;
                                      if (__OFADD__(v13, v44)) {
                                        goto LABEL_76;
                                      }
                                      v13 += v44;
                                      if (v52 >= v36) {
                                        goto LABEL_73;
                                      }
                                    }
                                    __break(1u);
LABEL_76:
                                    __break(1u);
LABEL_77:
                                    __break(1u);
LABEL_78:
                                    __break(1u);
                                    goto LABEL_79;
                                  }
LABEL_73:
                                  unsigned int v53 = sub_25C6A9484(v36, v12);
                                  sub_25C6A9538(v53);
                                  MEMORY[0x2611900B0]();
                                  if (*(void *)(v58 + 16) < *(void *)(v58 + 24) >> 1)
                                  {
LABEL_74:
                                    sub_25C6D6500();
                                    sub_25C6D64D0();
                                    uint64_t v54 = sub_25C6A95CC(v58);
                                    swift_bridgeObjectRelease();

                                    return v54;
                                  }
LABEL_93:
                                  sub_25C6D64E0();
                                  goto LABEL_74;
                                }
LABEL_92:
                                __break(1u);
                                goto LABEL_93;
                              }
LABEL_91:
                              __break(1u);
                              goto LABEL_92;
                            }
LABEL_90:
                            __break(1u);
                            goto LABEL_91;
                          }
LABEL_89:
                          __break(1u);
                          goto LABEL_90;
                        }
LABEL_88:
                        __break(1u);
                        goto LABEL_89;
                      }
                    }
                    else
                    {
                      __break(1u);
                    }
                    __break(1u);
                    goto LABEL_88;
                  }
                }
                if (qword_26A5C5CC0 == -1) {
                  goto LABEL_40;
                }
                goto LABEL_85;
              }
LABEL_84:
              __break(1u);
LABEL_85:
              swift_once();
LABEL_40:
              uint64_t v29 = sub_25C6D59F0();
              __swift_project_value_buffer(v29, (uint64_t)qword_26A5C6B58);
              uint64_t v30 = sub_25C6D59D0();
              os_log_type_t v31 = sub_25C6D65C0();
              if (os_log_type_enabled(v30, v31))
              {
                uint64_t v32 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v32 = 0;
                _os_log_impl(&dword_25C69F000, v30, v31, "ContactsFlowImageColorGenerator rawImageData was nil after drawing, falling back to default color set", v32, 2u);
                MEMORY[0x261190AB0](v32, -1, -1);
              }

              uint64_t v33 = sub_25C6A78EC();
              goto LABEL_49;
            }
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
LABEL_82:
          __break(1u);
          goto LABEL_83;
        }
        __break(1u);
        goto LABEL_82;
      }
      if (qword_26A5C5CC0 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_25C6D59F0();
      __swift_project_value_buffer(v34, (uint64_t)qword_26A5C6B58);
      uint64_t v25 = sub_25C6D59D0();
      os_log_type_t v26 = sub_25C6D65C0();
      if (!os_log_type_enabled(v25, v26))
      {
LABEL_48:

        uint64_t v33 = sub_25C6A78EC();
LABEL_49:

        return v33;
      }
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      uint64_t v28 = "ContactsFlowImageColorGenerator failed to create sRGB color space, falling back to default color set";
    }
    else
    {
      if (qword_26A5C5CC0 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_25C6D59F0();
      __swift_project_value_buffer(v24, (uint64_t)qword_26A5C6B58);
      uint64_t v25 = sub_25C6D59D0();
      os_log_type_t v26 = sub_25C6D65C0();
      if (!os_log_type_enabled(v25, v26)) {
        goto LABEL_48;
      }
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      uint64_t v28 = "ContactsFlowImageColorGenerator cgImage had a side length 0, falling back to default color set";
    }
    _os_log_impl(&dword_25C69F000, v25, v26, v28, v27, 2u);
    MEMORY[0x261190AB0](v27, -1, -1);
    goto LABEL_48;
  }
  if (qword_26A5C5CC0 != -1) {
LABEL_79:
  }
    swift_once();
  uint64_t v19 = sub_25C6D59F0();
  __swift_project_value_buffer(v19, (uint64_t)qword_26A5C6B58);
  id v20 = sub_25C6D59D0();
  os_log_type_t v21 = sub_25C6D65C0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_25C69F000, v20, v21, "ContactsFlowImageColorGenerator no cgImage, falling back to default color set", v22, 2u);
    MEMORY[0x261190AB0](v22, -1, -1);
  }

  return sub_25C6A78EC();
}

uint64_t sub_25C6A9484(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  if (qword_26A5C5CA0 != -1) {
    unint64_t result = swift_once();
  }
  if ((~qword_26A5C5F18 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(double *)&qword_26A5C5F18 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(double *)&qword_26A5C5F18 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v4 = v3 * (uint64_t)*(double *)&qword_26A5C5F18;
  if ((unsigned __int128)(v3 * (__int128)(uint64_t)*(double *)&qword_26A5C5F18) >> 64 == v4 >> 63) {
    return *(unsigned int *)(a2 + v4);
  }
LABEL_11:
  __break(1u);
  return result;
}

void sub_25C6A9538(unsigned int a1)
{
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, (double)a1 / 255.0, (double)BYTE1(a1) / 255.0, (double)BYTE2(a1) / 255.0, (double)HIBYTE(a1) / 255.0);

  JUMPOUT(0x26118FBE0);
}

uint64_t sub_25C6A95CC(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    sub_25C6AA904(0, &qword_26A5C5F58);
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      double v11 = 0.0;
      uint64_t v12 = 0;
      double v9 = 0.0;
      double v10 = 0.0;
      double v8 = 1.0;
      swift_retain_n();
      double v5 = (void *)sub_25C6D6640();
      objc_msgSend(v5, sel_getRed_green_blue_alpha_, &v11, &v10, &v9, &v8);
      id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, v11 * 0.33 + 0.0, v10 * 0.33 + 0.0, v9 * 0.33 + 0.0, v8);
      objc_msgSend(v6, sel_getHue_saturation_brightness_alpha_, &v14, &v13, &v12, 0);
      sub_25C6D6000();
      sub_25C6D6040();
      uint64_t v7 = swift_release();
      MEMORY[0x2611900B0](v7);
      if (*(void *)(v15 + 16) >= *(void *)(v15 + 24) >> 1) {
        sub_25C6D64E0();
      }
      ++v4;
      sub_25C6D6500();
      sub_25C6D64D0();

      swift_release();
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

double sub_25C6A9820()
{
  v18[1] = *(double *)MEMORY[0x263EF8340];
  if (qword_26A5C5CC0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25C6D59F0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5C6B58);
  char v1 = sub_25C6D59D0();
  os_log_type_t v2 = sub_25C6D65C0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25C69F000, v1, v2, "ContactsFlowImageColorGenerator calculating color difference", v3, 2u);
    MEMORY[0x261190AB0](v3, -1, -1);
  }

  double v17 = 0.0;
  v18[0] = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  sub_25C6AA904(0, &qword_26A5C5F58);
  swift_retain();
  uint64_t v4 = (void *)sub_25C6D6640();
  objc_msgSend(v4, sel_getRed_green_blue_alpha_, v18, &v17, &v16, &v15);
  swift_retain();
  double v5 = (void *)sub_25C6D6640();
  objc_msgSend(v5, sel_getRed_green_blue_alpha_, &v14, &v13, &v12, &v11);
  double v6 = vabdd_f64(v18[0] * v15, v14 * v11) + vabdd_f64(v15 * v17, v11 * v13) + vabdd_f64(v15 * v16, v11 * v12);
  uint64_t v7 = sub_25C6D59D0();
  os_log_type_t v8 = sub_25C6D65C0();
  if (os_log_type_enabled(v7, v8))
  {
    double v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)double v9 = 134217984;
    sub_25C6D6700();
    _os_log_impl(&dword_25C69F000, v7, v8, "ContactsFlowImageColorGenerator color difference was %f", v9, 0xCu);
    MEMORY[0x261190AB0](v9, -1, -1);
  }

  return v6;
}

uint64_t sub_25C6A9AB4(uint64_t a1)
{
  v22[1] = *(double *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_25C6D5FE0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    double v21 = 0.0;
    v22[0] = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
    sub_25C6AA904(0, &qword_26A5C5F58);
    swift_bridgeObjectRetain();
    uint64_t v7 = 0;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      ++v7;
      swift_retain_n();
      double v12 = (void *)sub_25C6D6640();
      objc_msgSend(v12, sel_getRed_green_blue_alpha_, v22, &v21, &v20, &v19);

      swift_release();
      double v11 = v11 + v22[0];
      double v10 = v10 + v21;
      double v9 = v9 + v20;
      double v8 = v8 + v19;
    }
    while (v6 != v7);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B388], v2);
    return MEMORY[0x26118FC60](v5, v11 / (double)v6, v10 / (double)v6, v9 / (double)v6, v8 / (double)v6);
  }
  else
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25C6D59F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A5C6B58);
    double v15 = sub_25C6D59D0();
    os_log_type_t v16 = sub_25C6D65C0();
    if (os_log_type_enabled(v15, v16))
    {
      double v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v17 = 0;
      _os_log_impl(&dword_25C69F000, v15, v16, "ContactsFlowImageColorGenerator no colors provided from which to calculate mean, returning default", v17, 2u);
      MEMORY[0x261190AB0](v17, -1, -1);
    }

    return MEMORY[0x270F04410]();
  }
}

id sub_25C6A9DC4(void *a1)
{
  type metadata accessor for VNImageOption(0);
  sub_25C6A9E60();
  uint64_t v3 = (void *)sub_25C6D6360();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v1, sel_initWithCIImage_options_, a1, v3);

  return v4;
}

uint64_t sub_25C6A9E50(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

unint64_t sub_25C6A9E60()
{
  unint64_t result = qword_26A5C5D90;
  if (!qword_26A5C5D90)
  {
    type metadata accessor for VNImageOption(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C5D90);
  }
  return result;
}

uint64_t sub_25C6A9EB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Signpost.OpenSignpost();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C6A9F0C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25C6A9F48(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C6A9F70(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25C6A9FE8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25C6D6700();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25C6A9FE8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25C6AA0BC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25C6AA8A4((uint64_t)v12, *a3);
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
      sub_25C6AA8A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25C6AA0BC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25C6AA214((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25C6D6710();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25C6AA2EC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25C6D6750();
    if (!v8)
    {
      uint64_t result = sub_25C6D67D0();
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

void *sub_25C6AA214(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C6D67F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25C6AA2EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C6AA384(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25C6AA560(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25C6AA560((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C6AA384(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25C6D6480();
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
  unint64_t v3 = sub_25C6AA4F8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25C6D6730();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25C6D67F0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25C6D67D0();
  __break(1u);
  return result;
}

void *sub_25C6AA4F8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5F50);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25C6AA560(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5F50);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  double v12 = v10 + 32;
  double v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25C6AA710(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C6AA638(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25C6AA638(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C6D67F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25C6AA710(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25C6D67F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_25C6AA7A0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_25C6AA7B0(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25C6AA7D4(void *a1)
{
  id v1 = objc_msgSend(a1, sel_results);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_25C6AA904(0, &qword_26A5C5F48);
  uint64_t v3 = sub_25C6D64C0();

  return v3;
}

ValueMetadata *type metadata accessor for ContactsFlowImageColorGenerator()
{
  return &type metadata for ContactsFlowImageColorGenerator;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25C6AA8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25C6AA904(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_0_1()
{
  return v0;
}

void OUTLINED_FUNCTION_1_2()
{
  JUMPOUT(0x261190AB0);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_25C6D59A0();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_slowAlloc();
}

uint64_t GetContactAttributeMultiResultView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  type metadata accessor for GetContactAttributeMultiResultView();
  OUTLINED_FUNCTION_2_3();
  uint64_t v6 = v5;
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5F68);
  OUTLINED_FUNCTION_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  double v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C6AB7D4(v3, (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v16 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v17 = swift_allocObject();
  sub_25C6AB83C((uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5F70);
  sub_25C6AD654((uint64_t)&unk_26A5C5F78);
  sub_25C6D61F0();
  uint64_t v18 = v3 + *(int *)(v2 + 28);
  uint64_t v19 = *(void *)(v18 + *(int *)(type metadata accessor for GetContactAttributeViewModel() + 28));
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(a1, v15, v10);
  *(void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5F80) + 36)) = v19;
  double v20 = *(uint64_t (**)(char *, uint64_t))(v12 + 8);
  swift_retain();
  return v20(v15, v10);
}

uint64_t type metadata accessor for GetContactAttributeMultiResultView()
{
  uint64_t result = qword_26A5C5F88;
  if (!qword_26A5C5F88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6AABDC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v104 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5FB8);
  uint64_t v105 = *(void *)(v3 - 8);
  uint64_t v106 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v111 = (char *)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v110 = (char *)&v87 - v6;
  uint64_t ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  uint64_t v8 = ContactAttributeMultiResultView - 8;
  uint64_t v101 = *(void *)(ContactAttributeMultiResultView - 8);
  MEMORY[0x270FA5388](ContactAttributeMultiResultView);
  uint64_t v102 = v9;
  uint64_t v103 = (uint64_t)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25C6D5580();
  uint64_t v99 = *(void *)(v10 - 8);
  uint64_t v100 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v98 = (char *)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25C6D55B0();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v89 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5D00);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v87 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DD8);
  uint64_t v94 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  uint64_t v19 = (char *)&v87 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_25C6D6240();
  uint64_t v90 = *(void *)(v92 - 8);
  MEMORY[0x270FA5388](v92);
  uint64_t v87 = (char *)&v87 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5FC0);
  MEMORY[0x270FA5388](v93);
  uint64_t v91 = (char *)&v87 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5FC8);
  uint64_t v96 = *(void *)(v22 - 8);
  uint64_t v97 = v22;
  MEMORY[0x270FA5388](v22);
  v95 = (char *)&v87 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5FD0);
  uint64_t v113 = *(void *)(v108 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v108);
  v107 = (char *)&v87 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v112 = (char *)&v87 - v26;
  uint64_t v27 = *(int *)(v8 + 28);
  uint64_t v28 = *(int *)(type metadata accessor for GetContactAttributeViewModel() + 20);
  uint64_t v109 = a1;
  uint64_t v29 = a1 + v28 + v27;
  sub_25C6D5850();
  uint64_t v30 = (void *)sub_25C6D56D0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v31 = sub_25C6D6690();
  unint64_t v33 = v32;

  uint64_t v114 = v31;
  unint64_t v115 = v33;
  sub_25C6A401C();
  uint64_t v34 = sub_25C6D5EC0();
  uint64_t v36 = v35;
  uint64_t v114 = v34;
  unint64_t v115 = v35;
  char v38 = v37 & 1;
  LOBYTE(v116) = v37 & 1;
  unint64_t v117 = v39;
  uint64_t v40 = MEMORY[0x263F1A830];
  unint64_t v41 = MEMORY[0x263F1A820];
  sub_25C6D5FB0();
  char v42 = v38;
  double v43 = v87;
  sub_25C6A4068(v34, v36, v42);
  swift_bridgeObjectRelease();
  uint64_t v114 = v40;
  unint64_t v115 = v41;
  swift_getOpaqueTypeConformance2();
  uint64_t v44 = v88;
  uint64_t v45 = sub_25C6D5ED0();
  (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v44);
  unint64_t v118 = MEMORY[0x263F774B0];
  unint64_t v117 = MEMORY[0x263F1B720];
  uint64_t v114 = v45;
  uint64_t v141 = 0;
  long long v139 = 0u;
  long long v140 = 0u;
  uint64_t v138 = 0;
  long long v136 = 0u;
  long long v137 = 0u;
  uint64_t v135 = 0;
  long long v133 = 0u;
  long long v134 = 0u;
  uint64_t v132 = 0;
  long long v130 = 0u;
  long long v131 = 0u;
  uint64_t v129 = 0;
  long long v127 = 0u;
  long long v128 = 0u;
  uint64_t v126 = 0;
  long long v124 = 0u;
  long long v125 = 0u;
  uint64_t v123 = 0;
  long long v121 = 0u;
  long long v122 = 0u;
  uint64_t v94 = v29;
  sub_25C6D5830();
  sub_25C6D55A0();
  swift_bridgeObjectRelease();
  v120[3] = sub_25C6D61C0();
  v120[4] = MEMORY[0x263F77548];
  __swift_allocate_boxed_opaque_existential_1(v120);
  sub_25C6D61D0();
  sub_25C6D6230();
  if (qword_26A5C5CC8 != -1) {
    swift_once();
  }
  uint64_t v46 = qword_26A5C7B80;
  char v47 = sub_25C6D5DE0();
  uint64_t v48 = v90;
  uint64_t v49 = (uint64_t)v91;
  uint64_t v50 = v92;
  (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v91, v43, v92);
  uint64_t v51 = v93;
  uint64_t v52 = v49 + *(int *)(v93 + 36);
  *(unsigned char *)uint64_t v52 = v47;
  *(void *)(v52 + 8) = v46;
  *(void *)(v52 + 16) = 0;
  *(void *)(v52 + 24) = v46;
  *(void *)(v52 + 32) = 0;
  *(unsigned char *)(v52 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v43, v50);
  uint64_t v54 = v98;
  uint64_t v53 = v99;
  uint64_t v55 = v100;
  (*(void (**)(char *, void, uint64_t))(v99 + 104))(v98, *MEMORY[0x263F76968], v100);
  unint64_t v56 = sub_25C6AD2EC();
  uint64_t v57 = v95;
  sub_25C6D5EF0();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v55);
  sub_25C6AD398(v49);
  uint64_t v58 = v103;
  sub_25C6AB7D4(v109, v103);
  unint64_t v59 = (*(unsigned __int8 *)(v101 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80);
  uint64_t v60 = swift_allocObject();
  sub_25C6AB83C(v58, v60 + v59);
  uint64_t v114 = v51;
  unint64_t v115 = v56;
  uint64_t v102 = MEMORY[0x263F77398];
  swift_getOpaqueTypeConformance2();
  v61 = v107;
  uint64_t v62 = v97;
  sub_25C6D5F90();
  swift_release();
  (*(void (**)(char *, uint64_t))(v96 + 8))(v57, v62);
  uint64_t v63 = (*(uint64_t (**)(char *, char *, uint64_t))(v113 + 32))(v112, v61, v108);
  *(void *)&long long v139 = MEMORY[0x26118F420](v63);
  sub_25C6AB7D4(v109, v58);
  uint64_t v64 = swift_allocObject();
  sub_25C6AB83C(v58, v64 + v59);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5FE8);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5FF0);
  sub_25C6AD654((uint64_t)&unk_26A5C5FF8);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6000);
  uint64_t v66 = sub_25C6D62E0();
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6008);
  unint64_t v68 = sub_25C6AD6E0((uint64_t)&unk_26A5C6010);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6018);
  unint64_t v70 = sub_25C6AD5B4();
  unint64_t v71 = sub_25C6AD694();
  uint64_t v114 = v66;
  unint64_t v115 = v69;
  unint64_t v116 = MEMORY[0x263F8D310];
  unint64_t v117 = v68;
  unint64_t v118 = v70;
  unint64_t v119 = v71;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v114 = v66;
  unint64_t v115 = v67;
  unint64_t v116 = v68;
  unint64_t v117 = OpaqueTypeConformance2;
  uint64_t v73 = swift_getOpaqueTypeConformance2();
  uint64_t v114 = v65;
  unint64_t v115 = v73;
  swift_getOpaqueTypeConformance2();
  sub_25C6AD6E0((uint64_t)&unk_26A5C6040);
  uint64_t v74 = v110;
  sub_25C6D6130();
  uint64_t v75 = *(void (**)(char *, char *, uint64_t))(v113 + 16);
  uint64_t v77 = v107;
  uint64_t v76 = v108;
  v75(v107, v112, v108);
  uint64_t v79 = v105;
  uint64_t v78 = v106;
  uint64_t v80 = *(void (**)(char *, char *, uint64_t))(v105 + 16);
  v80(v111, v74, v106);
  char v81 = v104;
  v75(v104, v77, v76);
  char v82 = &v81[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6048) + 48)];
  uint64_t v83 = v111;
  v80(v82, v111, v78);
  uint64_t v84 = *(void (**)(char *, uint64_t))(v79 + 8);
  v84(v110, v78);
  uint64_t v85 = *(void (**)(char *, uint64_t))(v113 + 8);
  v85(v112, v76);
  v84(v83, v78);
  return ((uint64_t (*)(char *, uint64_t))v85)(v77, v76);
}

uint64_t sub_25C6AB7D4(uint64_t a1, uint64_t a2)
{
  uint64_t ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(ContactAttributeMultiResultView - 8) + 16))(a2, a1, ContactAttributeMultiResultView);
  return a2;
}

uint64_t sub_25C6AB83C(uint64_t a1, uint64_t a2)
{
  uint64_t ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(ContactAttributeMultiResultView - 8) + 32))(a2, a1, ContactAttributeMultiResultView);
  return a2;
}

uint64_t sub_25C6AB8A0()
{
  uint64_t ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  OUTLINED_FUNCTION_1_1(ContactAttributeMultiResultView);
  uint64_t v2 = OUTLINED_FUNCTION_4_1(*(unsigned __int8 *)(v1 + 80));

  return sub_25C6AABDC(v2, v3);
}

uint64_t sub_25C6AB8E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C6AB900()
{
  uint64_t v0 = sub_25C6D58C0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeMultiResultView();
  type metadata accessor for GetContactAttributeViewModel();
  sub_25C6D57A0();
  uint64_t v4 = sub_25C6D5890();
  unint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_25C6B28C4(v4, v6);
  return sub_25C6A665C(v4, v6);
}

uint64_t sub_25C6ABA20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v19[1] = a2;
  uint64_t v3 = sub_25C6D5580();
  v19[0] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6000);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C6ABCB4(a1, (uint64_t)v10);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F76970], v3);
  uint64_t v11 = sub_25C6D62E0();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6008);
  unint64_t v13 = sub_25C6AD6E0((uint64_t)&unk_26A5C6010);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6018);
  unint64_t v15 = sub_25C6AD5B4();
  unint64_t v16 = sub_25C6AD694();
  uint64_t v20 = v11;
  uint64_t v21 = v14;
  unint64_t v22 = MEMORY[0x263F8D310];
  unint64_t v23 = v13;
  unint64_t v24 = v15;
  unint64_t v25 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v11;
  uint64_t v21 = v12;
  unint64_t v22 = v13;
  unint64_t v23 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_25C6D5EF0();
  (*(void (**)(char *, void))(v4 + 8))(v6, v19[0]);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_25C6ABCB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25C6D62E0();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6000);
  OUTLINED_FUNCTION_1();
  uint64_t v39 = v4;
  uint64_t v40 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_7();
  uint64_t v38 = v5;
  sub_25C6D57D0();
  sub_25C6A401C();
  uint64_t v6 = sub_25C6D5EC0();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  type metadata accessor for GetContactAttributeMultiResultView();
  type metadata accessor for GetContactAttributeViewModel();
  swift_retain();
  uint64_t v11 = sub_25C6D5EA0();
  uint64_t v13 = v12;
  char v15 = v14;
  uint64_t v17 = v16;
  sub_25C6A4068(v6, v8, v10);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = v11;
  *(void *)(v43 + 24) = v13;
  *(unsigned char *)(v43 + 32) = v15 & 1;
  *(void *)(v43 + 40) = v17;
  sub_25C6B2B48();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v22 = (v20 >> 40) & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6050);
  sub_25C6AD768();
  sub_25C6D5ED0();
  sub_25C6ADA88(v19, v21, v22);
  uint64_t v23 = sub_25C6B3834(a1);
  uint64_t v25 = v24;
  LODWORD(v22) = BYTE3(v24) & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C60C0);
  sub_25C6AD93C((uint64_t)&unk_26A5C60C8);
  sub_25C6D5ED0();
  sub_25C6ADB60(v23, v25, v22);
  sub_25C6D57C0();
  uint64_t v26 = sub_25C6D5EC0();
  uint64_t v28 = v27;
  LOBYTE(v22) = v29 & 1;
  sub_25C6D6040();
  uint64_t v30 = sub_25C6D5EA0();
  uint64_t v32 = v31;
  LOBYTE(v13) = v33;
  uint64_t v35 = v34;
  sub_25C6A4068(v26, v28, v22);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = v30;
  *(void *)(v44 + 24) = v32;
  *(unsigned char *)(v44 + 32) = v13 & 1;
  *(void *)(v44 + 40) = v35;
  sub_25C6D62D0();
  sub_25C6A499C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6008);
  sub_25C6AD6E0((uint64_t)&unk_26A5C6010);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6018);
  sub_25C6AD5B4();
  sub_25C6AD694();
  swift_getOpaqueTypeConformance2();
  sub_25C6D5F20();
  OUTLINED_FUNCTION_3();
  v36();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(a2, v38, v40);
}

uint64_t sub_25C6AC224(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_25C6D5800();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(&v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], a2, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v4 + 32))(v7 + v6, &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v3);
  uint64_t v10 = a2;
  sub_25C6D62E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6018);
  sub_25C6AD6E0((uint64_t)&unk_26A5C6010);
  sub_25C6AD5B4();
  sub_25C6AD694();
  sub_25C6D5FC0();
  return swift_release();
}

uint64_t sub_25C6AC404@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C6A48EC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C6AC430@<X0>(uint64_t a1@<X8>)
{
  uint64_t v17 = sub_25C6D5CE0();
  if (qword_26A5C5CC8 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_26A5C7B80;
  sub_25C6AC580((uint64_t)v18);
  uint64_t v2 = v18[0];
  uint64_t v3 = v18[1];
  char v4 = v19;
  uint64_t v5 = v20;
  uint64_t v6 = v21;
  uint64_t v7 = v22;
  char v8 = v23;
  uint64_t v9 = v24;
  if (qword_26A5C5CD0 != -1) {
    swift_once();
  }
  char v10 = sub_25C6D5DE0();
  uint64_t result = sub_25C6D5A80();
  *(void *)a1 = v17;
  *(void *)(a1 + 8) = v16;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = v7;
  *(unsigned char *)(a1 + 72) = v8;
  *(void *)(a1 + 80) = v9;
  *(unsigned char *)(a1 + 88) = v10;
  *(void *)(a1 + 96) = v12;
  *(void *)(a1 + 104) = v13;
  *(void *)(a1 + 112) = v14;
  *(void *)(a1 + 120) = v15;
  *(unsigned char *)(a1 + 128) = 0;
  return result;
}

uint64_t sub_25C6AC580@<X0>(uint64_t a1@<X8>)
{
  sub_25C6D57D0();
  sub_25C6A401C();
  uint64_t v2 = sub_25C6D5EC0();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_25C6D57C0();
  uint64_t v9 = sub_25C6D5EC0();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 48) = v12 & 1;
  *(void *)(a1 + 56) = v14;
  sub_25C6ADC54(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_25C6ADC54(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_25C6A4068(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_25C6A4068(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

char *initializeBufferWithCopyOfBuffer for GetContactAttributeMultiResultView(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
  }
  else
  {
    *((void *)a1 + 1) = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    char v7 = &a1[v6];
    uint64_t v8 = (uint64_t)a2 + v6;
    long long v9 = *(_OWORD *)((char *)a2 + v6 + 24);
    *(_OWORD *)&a1[v6 + 24] = v9;
    uint64_t v10 = v9;
    uint64_t v11 = **(void (***)(char *, uint64_t, uint64_t))(v9 - 8);
    char v12 = v5;
    v11(v7, v8, v10);
    ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
    uint64_t v14 = ContactAttributeViewModel[5];
    uint64_t v15 = &v7[v14];
    uint64_t v16 = v8 + v14;
    uint64_t v17 = sub_25C6D5870();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = ContactAttributeViewModel[6];
    char v19 = &v7[v18];
    uint64_t v20 = v8 + v18;
    uint64_t v21 = sub_25C6D5AA0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    *(void *)&v7[ContactAttributeViewModel[7]] = *(void *)(v8 + ContactAttributeViewModel[7]);
  }
  swift_retain();
  return a1;
}

uint64_t destroy for GetContactAttributeMultiResultView(id *a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 20);
  __swift_destroy_boxed_opaque_existential_0(v4);
  uint64_t ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  uint64_t v6 = v4 + *(int *)(ContactAttributeViewModel + 20);
  uint64_t v7 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v4 + *(int *)(ContactAttributeViewModel + 24);
  uint64_t v9 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return swift_release();
}

void *initializeWithCopy for GetContactAttributeMultiResultView(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v5;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  long long v9 = *(_OWORD *)(a2 + v6 + 24);
  *(_OWORD *)((char *)a1 + v6 + 24) = v9;
  uint64_t v10 = v9;
  uint64_t v11 = **(void (***)(char *, uint64_t, uint64_t))(v9 - 8);
  id v12 = v4;
  v11(v7, v8, v10);
  uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  uint64_t v14 = ContactAttributeViewModel[5];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = v8 + v14;
  uint64_t v17 = sub_25C6D5870();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  uint64_t v18 = ContactAttributeViewModel[6];
  char v19 = &v7[v18];
  uint64_t v20 = v8 + v18;
  uint64_t v21 = sub_25C6D5AA0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  *(void *)&v7[ContactAttributeViewModel[7]] = *(void *)(v8 + ContactAttributeViewModel[7]);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GetContactAttributeMultiResultView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = (uint64_t *)(a2 + v9);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + v9), v11);
  uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  uint64_t v13 = ContactAttributeViewModel[5];
  uint64_t v14 = v10 + v13;
  uint64_t v15 = (char *)v11 + v13;
  uint64_t v16 = sub_25C6D5870();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = ContactAttributeViewModel[6];
  uint64_t v18 = v10 + v17;
  char v19 = (char *)v11 + v17;
  uint64_t v20 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  *(void *)(v10 + ContactAttributeViewModel[7]) = *(uint64_t *)((char *)v11 + ContactAttributeViewModel[7]);
  swift_retain();
  swift_release();
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
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
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

_OWORD *initializeWithTake for GetContactAttributeMultiResultView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  *((void *)v5 + 4) = *(void *)((char *)a2 + v4 + 32);
  long long v7 = *(_OWORD *)((char *)a2 + v4 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)((char *)a2 + v4);
  *((_OWORD *)v5 + 1) = v7;
  uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  uint64_t v9 = ContactAttributeViewModel[5];
  uint64_t v10 = &v5[v9];
  uint64_t v11 = &v6[v9];
  uint64_t v12 = sub_25C6D5870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = ContactAttributeViewModel[6];
  uint64_t v14 = &v5[v13];
  uint64_t v15 = &v6[v13];
  uint64_t v16 = sub_25C6D5AA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  *(void *)&v5[ContactAttributeViewModel[7]] = *(void *)&v6[ContactAttributeViewModel[7]];
  return a1;
}

uint64_t assignWithTake for GetContactAttributeMultiResultView(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  __swift_destroy_boxed_opaque_existential_0(a1 + v7);
  long long v10 = *((_OWORD *)v9 + 1);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *((void *)v9 + 4);
  uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  uint64_t v12 = ContactAttributeViewModel[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = &v9[v12];
  uint64_t v15 = sub_25C6D5870();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = ContactAttributeViewModel[6];
  uint64_t v17 = v8 + v16;
  uint64_t v18 = &v9[v16];
  uint64_t v19 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  *(void *)(v8 + ContactAttributeViewModel[7]) = *(void *)&v9[ContactAttributeViewModel[7]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeMultiResultView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6AD000);
}

uint64_t sub_25C6AD000(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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
    uint64_t ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
    uint64_t v10 = (uint64_t)a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v10, a2, ContactAttributeViewModel);
  }
}

uint64_t storeEnumTagSinglePayload for GetContactAttributeMultiResultView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6AD0A8);
}

void *sub_25C6AD0A8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, ContactAttributeViewModel);
  }
  return result;
}

uint64_t sub_25C6AD128()
{
  uint64_t result = type metadata accessor for GetContactAttributeViewModel();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_25C6AD1C4()
{
  unint64_t result = qword_26A5C5F98;
  if (!qword_26A5C5F98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C5F80);
    sub_25C6AD654((uint64_t)&unk_26A5C5FA0);
    sub_25C6AD654((uint64_t)&qword_26A5C5FA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C5F98);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_25C6AD2EC()
{
  unint64_t result = qword_26A5C5FD8;
  if (!qword_26A5C5FD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C5FC0);
    sub_25C6AD6E0((uint64_t)&unk_26A5C5FE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C5FD8);
  }
  return result;
}

uint64_t sub_25C6AD398(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5FC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C6AD3FC()
{
  uint64_t ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  OUTLINED_FUNCTION_1_1(ContactAttributeMultiResultView);

  return sub_25C6AB900();
}

uint64_t objectdestroyTm_0()
{
  type metadata accessor for GetContactAttributeMultiResultView();
  OUTLINED_FUNCTION_2_3();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  uint64_t v10 = v0 + v7;

  __swift_destroy_boxed_opaque_existential_0(v10 + *(int *)(v1 + 28));
  type metadata accessor for GetContactAttributeViewModel();
  sub_25C6D5870();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v11();
  sub_25C6D5AA0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v12();
  swift_release();

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_25C6AD554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  OUTLINED_FUNCTION_1_1(ContactAttributeMultiResultView);

  return sub_25C6ABA20(a1, a2);
}

unint64_t sub_25C6AD5B4()
{
  unint64_t result = qword_26A5C6020;
  if (!qword_26A5C6020)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6018);
    sub_25C6AD654((uint64_t)&unk_26A5C6028);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6020);
  }
  return result;
}

unint64_t sub_25C6AD654(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25C6AD694()
{
  unint64_t result = qword_26A5C6038;
  if (!qword_26A5C6038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6038);
  }
  return result;
}

unint64_t sub_25C6AD6E0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_25C6AD724()
{
  sub_25C6A4068(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_25C6AD768()
{
  unint64_t result = qword_26A5C6058;
  if (!qword_26A5C6058)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6050);
    sub_25C6AD81C((uint64_t)&unk_26A5C6060);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6058);
  }
  return result;
}

unint64_t sub_25C6AD81C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5(a1);
  if (!result)
  {
    uint64_t v6 = v5;
    uint64_t v7 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v7();
    v6();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25C6AD8A0()
{
  unint64_t result = qword_26A5C6070;
  if (!qword_26A5C6070)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6078);
    sub_25C6AD914();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6070);
  }
  return result;
}

unint64_t sub_25C6AD914()
{
  return sub_25C6AD93C((uint64_t)&unk_26A5C6080);
}

unint64_t sub_25C6AD93C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25C6AD9B8()
{
  unint64_t result = qword_26A5C6090;
  if (!qword_26A5C6090)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6098);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6090);
  }
  return result;
}

unint64_t sub_25C6ADA24()
{
  return sub_25C6AD81C((uint64_t)&unk_26A5C60A0);
}

unint64_t sub_25C6ADA60()
{
  return sub_25C6AD93C((uint64_t)&unk_26A5C60B0);
}

uint64_t sub_25C6ADA88(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return sub_25C6ADA98(result, a2, BYTE4(a2) & 1);
  }
  return result;
}

uint64_t sub_25C6ADA98(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return sub_25C6ADAC0(a1, a2, BYTE3(a2) & 1);
  }
  else {
    return sub_25C6ADAAC(a1, a2);
  }
}

uint64_t sub_25C6ADAAC(uint64_t a1, uint64_t a2)
{
  return sub_25C6ADAB4(a1, a2, BYTE1(a2) & 1);
}

uint64_t sub_25C6ADAB4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25C6ADAC0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return sub_25C6ADAD4(a1, a2, BYTE2(a2) & 1);
  }
  else {
    return sub_25C6ADAB4(a1, a2, BYTE1(a2) & 1);
  }
}

uint64_t sub_25C6ADAD4(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return sub_25C6ADAB4(result, a2, BYTE1(a2) & 1);
  }
  return result;
}

unint64_t sub_25C6ADAE4()
{
  unint64_t result = qword_26A5C60D0;
  if (!qword_26A5C60D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C60D8);
    sub_25C6AD914();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C60D0);
  }
  return result;
}

uint64_t sub_25C6ADB60(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return sub_25C6ADB70(result, a2, BYTE2(a2) & 1);
  }
  return result;
}

uint64_t sub_25C6ADB70(uint64_t result, uint64_t a2, char a3)
{
  if (a3) {
    return sub_25C6ADAB4(result, a2, BYTE1(a2) & 1);
  }
  return result;
}

uint64_t sub_25C6ADB80(uint64_t a1)
{
  return sub_25C6AC224(a1, *(void *)(v1 + 16));
}

uint64_t sub_25C6ADB88()
{
  sub_25C6D5800();
  OUTLINED_FUNCTION_3_3();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 56);
  uint64_t v4 = v2 | 7;
  OUTLINED_FUNCTION_3();
  v5();

  return MEMORY[0x270FA0238](v0, v3, v4);
}

uint64_t sub_25C6ADC08()
{
  uint64_t v0 = sub_25C6D5800();
  OUTLINED_FUNCTION_1_1(v0);
  OUTLINED_FUNCTION_4_1(*(unsigned __int8 *)(v1 + 80));

  return sub_25C6AC404(v2);
}

uint64_t sub_25C6ADC4C@<X0>(uint64_t a1@<X8>)
{
  return sub_25C6AC430(a1);
}

uint64_t sub_25C6ADC54(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t OUTLINED_FUNCTION_4_1@<X0>(uint64_t a1@<X8>)
{
  return v1 + ((a1 + 16) & ~a1);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t static Signpost.begin(_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  char v5 = *((unsigned char *)a1 + 16);
  if (qword_26A5C5CB0 != -1) {
    swift_once();
  }
  id v6 = (id)qword_26A5C60E0;
  sub_25C6D59B0();
  sub_25C6D6630();
  sub_25C6D59A0();
  uint64_t result = type metadata accessor for Signpost.OpenSignpost();
  uint64_t v8 = a2 + *(int *)(result + 20);
  *(void *)uint64_t v8 = v3;
  *(void *)(v8 + 8) = v4;
  *(unsigned char *)(v8 + 16) = v5;
  return result;
}

uint64_t sub_25C6ADD84()
{
  sub_25C6AE4E8();
  uint64_t result = sub_25C6D66D0();
  qword_26A5C60E0 = result;
  return result;
}

uint64_t type metadata accessor for Signpost.OpenSignpost()
{
  uint64_t result = qword_26A5C60E8;
  if (!qword_26A5C60E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id static Signpost.contactsLog.getter()
{
  if (qword_26A5C5CB0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26A5C60E0;

  return v0;
}

Swift::Void __swiftcall Signpost.OpenSignpost.end()()
{
  sub_25C6D6620();
  if (qword_26A5C5CB0 != -1) {
    swift_once();
  }
  type metadata accessor for Signpost.OpenSignpost();

  sub_25C6D59A0();
}

void static SignpostName.relationshipLabelKeyForValue.getter(uint64_t a1@<X8>)
{
}

void static SignpostName.relationshipLabelValueForKey.getter(uint64_t a1@<X8>)
{
}

void static SignpostName.toSiriKitIntent.getter(uint64_t a1@<X8>)
{
}

void static SignpostName.makeFlowForParse.getter(uint64_t a1@<X8>)
{
}

void static SignpostName.contactsIntentHandler.getter(uint64_t a1@<X8>)
{
}

void static SignpostName.prewarmVision.getter(uint64_t a1@<X8>)
{
}

void static SignpostName.visionSaliencyRequest.getter(uint64_t a1@<X8>)
{
}

ValueMetadata *type metadata accessor for Signpost()
{
  return &type metadata for Signpost;
}

uint64_t *initializeBufferWithCopyOfBuffer for Signpost.OpenSignpost(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25C6D59C0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
    unsigned char v9[16] = v10[16];
  }
  return a1;
}

uint64_t destroy for Signpost.OpenSignpost(uint64_t a1)
{
  uint64_t v2 = sub_25C6D59C0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for Signpost.OpenSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C6D59C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  return a1;
}

uint64_t assignWithCopy for Signpost.OpenSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C6D59C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  return a1;
}

uint64_t initializeWithTake for Signpost.OpenSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C6D59C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  return a1;
}

uint64_t assignWithTake for Signpost.OpenSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C6D59C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for Signpost.OpenSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6AE33C);
}

uint64_t sub_25C6AE33C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C6D59C0();

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for Signpost.OpenSignpost(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6AE398);
}

uint64_t sub_25C6AE398(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C6D59C0();

  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_25C6AE3E4()
{
  uint64_t result = sub_25C6D59C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SignpostName(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SignpostName(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SignpostName()
{
  return &type metadata for SignpostName;
}

unint64_t sub_25C6AE4E8()
{
  unint64_t result = qword_26A5C60F8;
  if (!qword_26A5C60F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5C60F8);
  }
  return result;
}

void OUTLINED_FUNCTION_0_2(uint64_t a1@<X8>)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = 2;
}

uint64_t sub_25C6AE538()
{
  sub_25C6D5E40();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = v0;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_3_4();
  if (qword_26A5C5CE8 != -1) {
    swift_once();
  }
  char v3 = *(void (**)(uint64_t))(v1 + 104);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  v3(v4);
  sub_25C6A6798();
  OUTLINED_FUNCTION_6();
  type metadata accessor for SiriContactsGCAButtonStyle();
  if (qword_26A5C5CE0 != -1) {
    swift_once();
  }
  uint64_t v5 = OUTLINED_FUNCTION_5_0();
  v3(v5);
  return OUTLINED_FUNCTION_6();
}

uint64_t sub_25C6AE680@<X0>(uint64_t a1@<X8>)
{
  sub_25C6D5CB0();
  OUTLINED_FUNCTION_1();
  uint64_t v59 = v2;
  uint64_t v60 = v3;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_7();
  uint64_t v58 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6120);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v8 = v7 - v6;
  uint64_t v47 = sub_25C6D5D70();
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_3_4();
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6128) - 8;
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_2();
  uint64_t v14 = v13 - v12;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6130) - 8;
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v15);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6138) - 8;
  MEMORY[0x270FA5388](v53);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v16);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6140) - 8;
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_2();
  uint64_t v19 = v18 - v17;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6148) - 8;
  MEMORY[0x270FA5388](v48);
  OUTLINED_FUNCTION_2();
  uint64_t v22 = v21 - v20;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6150) - 8;
  MEMORY[0x270FA5388](v51);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v23);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6158);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6160);
  OUTLINED_FUNCTION_1();
  uint64_t v56 = v27;
  uint64_t v57 = v26;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_7();
  uint64_t v55 = v28;
  sub_25C6D5D80();
  type metadata accessor for SiriContactsGCAButtonStyle();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  sub_25C6D5AF0();
  uint64_t v29 = sub_25C6D5E00();
  __swift_storeEnumTagSinglePayload(v8, 1, 1, v29);
  uint64_t v30 = sub_25C6D5E20();
  sub_25C6AF7F4(v8, &qword_26A5C6120);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v14, v1, v47);
  uint64_t v32 = (uint64_t *)(v14 + *(int *)(v43 + 44));
  *uint64_t v32 = KeyPath;
  v32[1] = v30;
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v47);
  sub_25C6D5AF0();
  sub_25C6D5AF0();
  sub_25C6D6160();
  sub_25C6D5B10();
  sub_25C6AF3C8(v14, v45, &qword_26A5C6128);
  char v33 = (_OWORD *)(v45 + *(int *)(v50 + 44));
  *char v33 = v62;
  v33[1] = v63;
  v33[2] = v64;
  sub_25C6AF7F4(v14, &qword_26A5C6128);
  LODWORD(KeyPath) = sub_25C6D5D10();
  LOBYTE(v30) = sub_25C6D5DE0();
  sub_25C6AF3C8(v45, v44, &qword_26A5C6130);
  uint64_t v34 = v44 + *(int *)(v53 + 44);
  *(_DWORD *)uint64_t v34 = KeyPath;
  *(unsigned char *)(v34 + 4) = v30;
  sub_25C6AF7F4(v45, &qword_26A5C6130);
  sub_25C6AF3C8(v44, v19, &qword_26A5C6138);
  *(_WORD *)(v19 + *(int *)(v52 + 44)) = 256;
  sub_25C6AF7F4(v44, &qword_26A5C6138);
  sub_25C6AF3C8(v19, v22, &qword_26A5C6140);
  *(unsigned char *)(v22 + *(int *)(v48 + 44)) = 0;
  sub_25C6AF7F4(v19, &qword_26A5C6140);
  if (sub_25C6D5D90()) {
    double v35 = 0.5;
  }
  else {
    double v35 = 0.8;
  }
  sub_25C6AF3C8(v22, v46, &qword_26A5C6148);
  *(double *)(v46 + *(int *)(v51 + 44)) = v35;
  sub_25C6AF7F4(v22, &qword_26A5C6148);
  if (sub_25C6D5D90()) {
    double v36 = 0.98;
  }
  else {
    double v36 = 1.0;
  }
  sub_25C6D6170();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  sub_25C6AF3C8(v46, v49, &qword_26A5C6150);
  uint64_t v41 = v49 + *(int *)(v54 + 36);
  *(double *)uint64_t v41 = v36;
  *(double *)(v41 + 8) = v36;
  *(void *)(v41 + 16) = v38;
  *(void *)(v41 + 24) = v40;
  sub_25C6AF7F4(v46, &qword_26A5C6150);
  sub_25C6D5CA0();
  sub_25C6AF454(&qword_26A5C6168, &qword_26A5C6158, (void (*)(void))sub_25C6AF424);
  sub_25C6AF7AC(&qword_26A5C61D8, MEMORY[0x263F197E0]);
  sub_25C6D5F60();
  (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v58, v59);
  sub_25C6AF7F4(v49, &qword_26A5C6158);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))(a1, v55, v57);
}

uint64_t type metadata accessor for SiriContactsGCAButtonStyle()
{
  uint64_t result = qword_26A5C6108;
  if (!qword_26A5C6108) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_25C6AEDF8(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t sub_25C6AEEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);

  return v7(v5, v4);
}

uint64_t sub_25C6AEF88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_25C6AF024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_25C6AF0C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_25C6AF15C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_25C6AF1F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6AF20C);
}

uint64_t sub_25C6AF20C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_25C6AF258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6AF26C);
}

uint64_t sub_25C6AF26C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);

  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_25C6AF2BC()
{
  sub_25C6AF348();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25C6AF348()
{
  if (!qword_26A5C6118)
  {
    sub_25C6A6798();
    unint64_t v0 = sub_25C6D5B00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A5C6118);
    }
  }
}

uint64_t sub_25C6AF3A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C6AF3C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C6AF424()
{
  return sub_25C6AF454(&qword_26A5C6170, &qword_26A5C6150, (void (*)(void))sub_25C6AF4D0);
}

uint64_t sub_25C6AF454(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25C6AF4D0()
{
  unint64_t result = qword_26A5C6178;
  if (!qword_26A5C6178)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6148);
    sub_25C6AF570();
    sub_25C6A41AC(&qword_26A5C61C8, &qword_26A5C61D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6178);
  }
  return result;
}

unint64_t sub_25C6AF570()
{
  unint64_t result = qword_26A5C6180;
  if (!qword_26A5C6180)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6140);
    sub_25C6AF610();
    sub_25C6A41AC(&qword_26A5C61B8, &qword_26A5C61C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6180);
  }
  return result;
}

unint64_t sub_25C6AF610()
{
  unint64_t result = qword_26A5C6188;
  if (!qword_26A5C6188)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6138);
    sub_25C6AF454(&qword_26A5C6190, &qword_26A5C6130, (void (*)(void))sub_25C6AF6DC);
    sub_25C6A41AC(&qword_26A5C61A8, &qword_26A5C61B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6188);
  }
  return result;
}

unint64_t sub_25C6AF6DC()
{
  unint64_t result = qword_26A5C6198;
  if (!qword_26A5C6198)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6128);
    sub_25C6AF7AC(&qword_26A5C61A0, MEMORY[0x263F1A0D0]);
    sub_25C6A41AC(&qword_26A5C5E18, &qword_26A5C5E20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6198);
  }
  return result;
}

uint64_t sub_25C6AF7AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C6AF7F4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25C6AF848()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_25C6D5AE0();
}

void OUTLINED_FUNCTION_7_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

ValueMetadata *type metadata accessor for SiriContactsEqualWidthHStack()
{
  return &type metadata for SiriContactsEqualWidthHStack;
}

unint64_t sub_25C6AF990()
{
  unint64_t result = qword_26A5C61E0;
  if (!qword_26A5C61E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C61E0);
  }
  return result;
}

BOOL sub_25C6AF9DC()
{
  sub_25C6D5B60();
  sub_25C6B07C4();
  sub_25C6D6540();
  sub_25C6D6570();
  return v2 == v1;
}

uint64_t sub_25C6AFA48(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = sub_25C6AF9DC();
  if ((result & 1) == 0)
  {
    sub_25C6AFBAC(a5);
    double v10 = v9;
    uint64_t v11 = sub_25C6B0144();
    MEMORY[0x270FA5388](v11);
    OUTLINED_FUNCTION_0_3();
    sub_25C6B01B4((void (*)(uint64_t *__return_ptr, uint64_t *))sub_25C6B0814, v12, v13, v14);
    uint64_t v16 = *(void *)(v15 + 16);
    if (v16)
    {
      uint64_t v17 = (double *)(v15 + 32);
      double v18 = 0.0;
      do
      {
        double v19 = *v17++;
        double v18 = v18 + v19;
        --v16;
      }
      while (v16);
    }
    swift_bridgeObjectRelease();
    sub_25C6D5B60();
    sub_25C6B07C4();
    sub_25C6D6540();
    sub_25C6D6570();
    uint64_t result = OUTLINED_FUNCTION_1_3();
    if ((a2 & 1) != 0 || v10 >= *(double *)&a1)
    {
      sub_25C6D6540();
      sub_25C6D6570();
      return OUTLINED_FUNCTION_1_3();
    }
  }
  return result;
}

uint64_t sub_25C6AFBAC(uint64_t a1)
{
  *(void *)&v26.f64[0] = sub_25C6D5B50();
  uint64_t v2 = *(void *)(*(void *)&v26.f64[0] - 8);
  MEMORY[0x270FA5388](*(void *)&v26.f64[0]);
  uint64_t v4 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C6D5B60();
  sub_25C6B07C4();
  uint64_t v5 = sub_25C6D6550();
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v29 = MEMORY[0x263F8EE78];
    sub_25C6CFDA8(0, v5 & ~(v5 >> 63), 0);
    uint64_t result = sub_25C6D6540();
    if (v8 < 0)
    {
      __break(1u);
      return result;
    }
    v25[1] = a1;
    do
    {
      double v10 = (void (*)(char *, void))sub_25C6D6590();
      float64_t v11 = v26.f64[0];
      (*(void (**)(char *))(v2 + 16))(v4);
      v10(v28, 0);
      sub_25C6D5B90();
      v28[0] = v12 & 1;
      char v27 = v13 & 1;
      sub_25C6D5B20();
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      (*(void (**)(char *, float64_t))(v2 + 8))(v4, COERCE_FLOAT64_T(*(void *)&v11));
      uint64_t v7 = v29;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25C6CFDA8(0, *(void *)(v7 + 16) + 1, 1);
        uint64_t v7 = v29;
      }
      unint64_t v19 = *(void *)(v7 + 16);
      unint64_t v18 = *(void *)(v7 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_25C6CFDA8(v18 > 1, v19 + 1, 1);
        uint64_t v7 = v29;
      }
      *(void *)(v7 + 16) = v19 + 1;
      uint64_t v20 = v7 + 16 * v19;
      *(void *)(v20 + 32) = v15;
      *(void *)(v20 + 40) = v17;
      sub_25C6D6580();
      --v8;
    }
    while (v8);
  }
  uint64_t v21 = *(void *)(v7 + 16);
  if (v21)
  {
    uint64_t v22 = (float64x2_t *)(v7 + 32);
    float64x2_t v23 = 0uLL;
    do
    {
      float64x2_t v24 = *v22++;
      float64x2_t v23 = (float64x2_t)vbslq_s8((int8x16_t)vcgeq_f64(v24, v23), (int8x16_t)v24, (int8x16_t)v23);
      --v21;
    }
    while (v21);
    float64x2_t v26 = v23;
  }
  else
  {
    v6.f64[0] = 0.0;
    float64x2_t v26 = v6;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C6AFE50(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_25C6D5B50();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  float64_t v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_25C6AF9DC();
  if ((result & 1) == 0)
  {
    sub_25C6AFBAC(a5);
    double v14 = v13;
    uint64_t v16 = v15;
    uint64_t v17 = sub_25C6B0144();
    MEMORY[0x270FA5388](v17);
    OUTLINED_FUNCTION_0_3();
    sub_25C6B01B4((void (*)(uint64_t *__return_ptr, uint64_t *))sub_25C6B07A4, v18, v19, v20);
    uint64_t v22 = v21;
    if ((a2 & 1) == 0 && v14 < *(double *)&a1)
    {
      uint64_t v23 = *(void *)(v21 + 16);
      if (v23)
      {
        float64x2_t v24 = (double *)(v21 + 32);
        double v25 = 0.0;
        do
        {
          double v26 = *v24++;
          double v25 = v25 + v26;
          --v23;
        }
        while (v23);
      }
      else
      {
        double v25 = 0.0;
      }
      double v27 = *(double *)&a1 - v25;
      sub_25C6D5B60();
      sub_25C6B07C4();
      sub_25C6D6540();
      sub_25C6D6570();
      double v14 = v27 / (double)sub_25C6D6560();
    }
    v39.origin.x = OUTLINED_FUNCTION_2_4();
    double MinX = CGRectGetMinX(v39);
    uint64_t result = sub_25C6B0144();
    if (result == v29) {
      return swift_bridgeObjectRelease();
    }
    uint64_t v30 = result;
    uint64_t v31 = v29;
    if (v29 < result)
    {
      __break(1u);
    }
    else if (result < v29)
    {
      if ((result & 0x8000000000000000) == 0)
      {
        unint64_t v32 = *(void *)(v22 + 16);
        if (result < v32 && v29 - 1 < v32)
        {
          v36[1] = v16;
          double v34 = MinX + v14 * 0.5;
          double v35 = (void (**)(char *, uint64_t))(v9 + 8);
          do
          {
            sub_25C6D5B70();
            v40.origin.x = OUTLINED_FUNCTION_2_4();
            CGRectGetMidY(v40);
            sub_25C6D6170();
            char v38 = 0;
            char v37 = 0;
            sub_25C6D5B30();
            (*v35)(v11, v8);
            double v34 = v34 + v14 + *(double *)(v22 + 8 * v30++ + 32);
          }
          while (v31 != v30);
          return swift_bridgeObjectRelease();
        }
LABEL_25:
        __break(1u);
        return result;
      }
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    __break(1u);
    goto LABEL_24;
  }
  return result;
}

uint64_t sub_25C6B0144()
{
  sub_25C6D5B60();
  sub_25C6B07C4();
  sub_25C6D6540();
  sub_25C6D6570();
  uint64_t result = v2;
  if (v1 < v2) {
    __break(1u);
  }
  return result;
}

void sub_25C6B01B4(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4 - a3;
  if (__OFSUB__(a4, a3)) {
    goto LABEL_18;
  }
  uint64_t v6 = v4;
  if (v5)
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    sub_25C6CFDC8(0, v5 & ~(v5 >> 63), 0);
    if (v5 < 0)
    {
LABEL_19:
      __break(1u);
      return;
    }
    uint64_t v10 = v17;
    uint64_t v11 = a3;
    while (a4 != v11)
    {
      uint64_t v15 = v11;
      a1(&v16, &v15);
      if (v6)
      {
        swift_release();
        return;
      }
      uint64_t v6 = 0;
      uint64_t v12 = v16;
      uint64_t v17 = v10;
      unint64_t v14 = *(void *)(v10 + 16);
      unint64_t v13 = *(void *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_25C6CFDC8(v13 > 1, v14 + 1, 1);
        uint64_t v10 = v17;
      }
      *(void *)(v10 + 16) = v14 + 1;
      *(void *)(v10 + 8 * v14 + 32) = v12;
      if (a4 < a3) {
        goto LABEL_16;
      }
      if (v11 >= a4) {
        goto LABEL_17;
      }
      if (a4 == ++v11) {
        return;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
}

uint64_t sub_25C6B0304@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v3 = sub_25C6D5AD0();
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  double v25 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - v6;
  uint64_t v24 = sub_25C6D5B50();
  uint64_t v8 = *(void *)(v24 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v24);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v24 - v12;
  uint64_t v14 = *a1;
  sub_25C6D5B60();
  sub_25C6B07C4();
  sub_25C6D6540();
  sub_25C6D6570();
  uint64_t result = sub_25C6D6560();
  if (__OFSUB__(result, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v16 = 0;
    if (v14 < result - 1)
    {
      sub_25C6D5B70();
      sub_25C6D5B40();
      uint64_t v17 = *(void (**)(char *, uint64_t))(v8 + 8);
      uint64_t v18 = v13;
      uint64_t v19 = v24;
      v17(v18, v24);
      sub_25C6D5B70();
      uint64_t v20 = v25;
      sub_25C6D5B40();
      v17(v11, v19);
      sub_25C6D5AC0();
      uint64_t v16 = v21;
      uint64_t v22 = v27;
      uint64_t v23 = *(void (**)(char *, uint64_t))(v26 + 8);
      v23(v20, v27);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v23)(v7, v22);
    }
    *uint64_t v28 = v16;
  }
  return result;
}

uint64_t sub_25C6B05C0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25C6AFA48(a1, a2 & 1, a3, a4, a5);
}

uint64_t sub_25C6B05D0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25C6AFE50(a1, a2 & 1, a3, a4, a5);
}

uint64_t sub_25C6B05E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_25C6B0650(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B668]);
}

uint64_t sub_25C6B0618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_25C6B0650(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B670]);
}

uint64_t sub_25C6B0650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_25C6B0698(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25C6D5A60();
  return sub_25C6B0708;
}

void sub_25C6B0708(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

unint64_t sub_25C6B0758()
{
  unint64_t result = qword_26A5C61E8;
  if (!qword_26A5C61E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C61E8);
  }
  return result;
}

uint64_t sub_25C6B07A4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_25C6B0304(a1, a2);
}

unint64_t sub_25C6B07C4()
{
  unint64_t result = qword_26A5C61F0;
  if (!qword_26A5C61F0)
  {
    sub_25C6D5B60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C61F0);
  }
  return result;
}

uint64_t sub_25C6B0814@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_25C6B07A4(a1, a2);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return sub_25C6D6560();
}

double OUTLINED_FUNCTION_2_4()
{
  return v0;
}

uint64_t sub_25C6B0878(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for GetContactQuickActionPrimitiveButtonStyle(uint64_t a1)
{
  return sub_25C6B0894(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_25C6B0894(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t _s14SiriContactsUI41GetContactQuickActionPrimitiveButtonStyleVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_25C6B0878(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  *(_WORD *)(a1 + 9) = *(_WORD *)(a2 + 9);
  return a1;
}

uint64_t assignWithCopy for GetContactQuickActionPrimitiveButtonStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_25C6B0878(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_25C6B0894(v6, v7);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(unsigned char *)(a1 + 10) = *(unsigned char *)(a2 + 10);
  return a1;
}

uint64_t __swift_memcpy11_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 7) = *(_DWORD *)((char *)a2 + 7);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for GetContactQuickActionPrimitiveButtonStyle(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_25C6B0894(v6, v7);
  *(unsigned char *)(a1 + 9) = *((unsigned char *)a2 + 9);
  *(unsigned char *)(a1 + 10) = *((unsigned char *)a2 + 10);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactQuickActionPrimitiveButtonStyle(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 11))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GetContactQuickActionPrimitiveButtonStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 10) = 0;
    *(_WORD *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 11) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 11) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GetContactQuickActionPrimitiveButtonStyle()
{
  return &type metadata for GetContactQuickActionPrimitiveButtonStyle;
}

uint64_t sub_25C6B0A5C()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_25C6B0A78()
{
  if (qword_26A5C5CD8 != -1) {
    swift_once();
  }
  double result = *(double *)&qword_26A5C7B90;
  qword_26A5C61F8 = qword_26A5C7B90;
  return result;
}

uint64_t sub_25C6B0ACC@<X0>(uint64_t a1@<X1>, int a2@<W2>, uint64_t a3@<X8>)
{
  int v208 = a2;
  uint64_t v201 = a1;
  uint64_t v207 = a3;
  int v200 = a2 & 1;
  uint64_t ContactQuickActionButtonLabelStyle = type metadata accessor for GetContactQuickActionButtonLabelStyle(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v4);
  uint64_t v180 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6200);
  OUTLINED_FUNCTION_1();
  uint64_t v179 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v7);
  uint64_t v177 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6208);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6210);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v11);
  uint64_t v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6218);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v13);
  uint64_t v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6220);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v15);
  uint64_t v185 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6228);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v17);
  uint64_t v206 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6230);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_7_0((uint64_t)&v163 - v20);
  uint64_t v204 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6238);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_7();
  uint64_t v205 = v22;
  OUTLINED_FUNCTION_15();
  sub_25C6D5AA0();
  OUTLINED_FUNCTION_1();
  uint64_t v202 = v24;
  uint64_t v203 = v23;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_7_0((uint64_t)&v163 - v26);
  sub_25C6D5CC0();
  OUTLINED_FUNCTION_1();
  uint64_t v193 = v28;
  uint64_t v194 = v27;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_7();
  uint64_t v192 = v29;
  OUTLINED_FUNCTION_15();
  uint64_t v191 = sub_25C6D5BA0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_7();
  uint64_t v196 = v31;
  OUTLINED_FUNCTION_15();
  sub_25C6D6150();
  OUTLINED_FUNCTION_1();
  uint64_t v197 = v33;
  uint64_t v198 = v32;
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_7();
  uint64_t v195 = v34;
  OUTLINED_FUNCTION_15();
  uint64_t v165 = sub_25C6D5E40();
  OUTLINED_FUNCTION_1();
  uint64_t v164 = v35;
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_2();
  uint64_t v39 = v38 - v37;
  uint64_t ContactQuickActionButtonLabelStyleIconOnly = type metadata accessor for GetContactQuickActionButtonLabelStyleIconOnly(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_2();
  uint64_t v43 = v42 - v41;
  sub_25C6D5DA0();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_2();
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6240);
  OUTLINED_FUNCTION_1();
  uint64_t v46 = v45;
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_2();
  uint64_t v50 = v49 - v48;
  uint64_t v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6248);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v51);
  OUTLINED_FUNCTION_2();
  uint64_t v54 = v53 - v52;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6250);
  MEMORY[0x270FA5388](v55 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v58 = v57 - v56;
  uint64_t v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6258);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v59);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v60);
  uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6260);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v61);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v62);
  uint64_t v199 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6268);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v63);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v64);
  OUTLINED_FUNCTION_7_0((uint64_t)&v163 - v65);
  sub_25C6D5DB0();
  if ((v208 & 0x100) != 0)
  {
    if (qword_26A5C5CE0 != -1) {
      swift_once();
    }
    uint64_t v209 = qword_26A5C7B98;
    (*(void (**)(uint64_t, void, uint64_t))(v164 + 104))(v39, *MEMORY[0x263F1A6C8], v165);
    sub_25C6A6798();
    sub_25C6D5AE0();
    sub_25C6B21FC((uint64_t)&unk_26A5C6270);
    sub_25C6B21FC((uint64_t)&unk_26A5C62B8);
    sub_25C6D5F60();
    sub_25C6B261C(v43, (void (*)(void))type metadata accessor for GetContactQuickActionButtonLabelStyleIconOnly);
    uint64_t v118 = OUTLINED_FUNCTION_14();
    v119(v118);
    if (qword_26A5C5CD8 != -1) {
      swift_once();
    }
    uint64_t v120 = qword_26A5C7B90;
    char v121 = sub_25C6D5DE0();
    uint64_t v122 = v168;
    OUTLINED_FUNCTION_9();
    v123();
    uint64_t v124 = v54 + *(int *)(v166 + 36);
    *(unsigned char *)uint64_t v124 = v121;
    *(void *)(v124 + 8) = v120;
    *(void *)(v124 + 16) = v120;
    *(void *)(v124 + 24) = v120;
    *(void *)(v124 + 32) = v120;
    *(unsigned char *)(v124 + 40) = 0;
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v50, v122);
    uint64_t v160 = sub_25C6D6160();
    uint64_t v162 = v125;
    uint64_t v126 = OUTLINED_FUNCTION_7_1();
    uint64_t v127 = v54;
    sub_25C6B1B70(*(double *)&v126, v128, v129, v130, v131, v132, v133, v134, v135, 0.0, 1, 0.0, 1, v160, v162, &qword_26A5C6248, &qword_26A5C6250);
    sub_25C6AF7F4(v54, &qword_26A5C6248);
    uint64_t v136 = OUTLINED_FUNCTION_13();
    sub_25C6B0894(v127, (char)&qword_26A5C6248);
    if (v136) {
      double v137 = 1.0;
    }
    else {
      double v137 = 0.5;
    }
    uint64_t v138 = v171;
    sub_25C6AF3C8(v58, v171, &qword_26A5C6250);
    *(double *)(v138 + *(int *)(v169 + 36)) = v137;
    sub_25C6AF7F4(v58, &qword_26A5C6250);
    sub_25C6D6140();
    if (qword_26A5C5CB8 != -1) {
      swift_once();
    }
    uint64_t v139 = OUTLINED_FUNCTION_10();
    v140(v139);
    uint64_t v141 = OUTLINED_FUNCTION_6_0();
    v142(v141);
    uint64_t v143 = OUTLINED_FUNCTION_12();
    v144(v143);
    uint64_t v145 = OUTLINED_FUNCTION_5_1(*(int *)(v170 + 36));
    v146(v145);
    uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6280);
    OUTLINED_FUNCTION_18(v147);
    *(_WORD *)(v136 + *(int *)(v127 + 56)) = 256;
    sub_25C6AF3C8(v138, v58, &qword_26A5C6258);
    sub_25C6B261C(v122, MEMORY[0x263F19048]);
    uint64_t v148 = OUTLINED_FUNCTION_8();
    v149(v148);
    sub_25C6AF7F4(v138, &qword_26A5C6258);
    uint64_t KeyPath = swift_getKeyPath();
    OUTLINED_FUNCTION_19();
    v151(v186);
    uint64_t v152 = v172;
    int v153 = (uint64_t *)(v172 + *(int *)(v199 + 36));
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6288);
    OUTLINED_FUNCTION_9();
    v154();
    *int v153 = KeyPath;
    sub_25C6AF3C8(v58, v152, &qword_26A5C6260);
    uint64_t v155 = OUTLINED_FUNCTION_8();
    v156(v155);
    sub_25C6AF7F4(v58, &qword_26A5C6260);
    unint64_t v115 = &qword_26A5C6268;
    uint64_t v157 = v173;
    sub_25C6A4150(v152, v173, &qword_26A5C6268);
    sub_25C6AF3C8(v157, v205, &qword_26A5C6268);
    swift_storeEnumTagMultiPayload();
    sub_25C6B2240((uint64_t)&unk_26A5C6290);
    sub_25C6B2240((uint64_t)&unk_26A5C62D0);
    sub_25C6D5CF0();
    uint64_t v117 = v157;
  }
  else
  {
    uint64_t v66 = v175;
    sub_25C6C7B8C();
    sub_25C6B21FC((uint64_t)&unk_26A5C6270);
    sub_25C6B21FC((uint64_t)&unk_26A5C6278);
    uint64_t v67 = v174;
    sub_25C6D5F60();
    sub_25C6B261C(v66, (void (*)(void))type metadata accessor for GetContactQuickActionButtonLabelStyle);
    uint64_t v68 = OUTLINED_FUNCTION_14();
    v69(v68);
    if (qword_26A5C5CD8 != -1) {
      swift_once();
    }
    uint64_t v70 = qword_26A5C7B90;
    uint64_t v71 = qword_26A5C7B90;
    uint64_t v72 = v188;
    if (qword_26A5C5CC8 != -1)
    {
      swift_once();
      uint64_t v71 = qword_26A5C7B90;
    }
    uint64_t v73 = qword_26A5C7B80;
    char v74 = sub_25C6D5DE0();
    uint64_t v75 = v179;
    uint64_t v76 = v181;
    uint64_t v77 = v180;
    OUTLINED_FUNCTION_9();
    v78();
    uint64_t v79 = v76 + *(int *)(v177 + 36);
    *(unsigned char *)uint64_t v79 = v74;
    *(void *)(v79 + 8) = v70;
    *(void *)(v79 + 16) = v73;
    *(void *)(v79 + 24) = v71;
    *(void *)(v79 + 32) = v73;
    *(unsigned char *)(v79 + 40) = 0;
    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v67, v77);
    uint64_t v159 = sub_25C6D6160();
    uint64_t v161 = v80;
    uint64_t v81 = v182;
    uint64_t v82 = OUTLINED_FUNCTION_7_1();
    uint64_t v83 = v76;
    sub_25C6B1B70(*(double *)&v82, v84, v85, v86, v87, v88, v89, v90, v91, 0.0, 1, 0.0, 1, v159, v161, &qword_26A5C6208, &qword_26A5C6210);
    sub_25C6AF7F4(v76, &qword_26A5C6208);
    uint64_t v92 = swift_getKeyPath();
    uint64_t v93 = v184;
    sub_25C6AF3C8(v81, v184, &qword_26A5C6210);
    uint64_t v94 = v93 + *(int *)(v178 + 36);
    *(void *)uint64_t v94 = v92;
    *(void *)(v94 + 8) = 1;
    *(unsigned char *)(v94 + 16) = 0;
    sub_25C6AF7F4(v81, &qword_26A5C6210);
    LOBYTE(v92) = OUTLINED_FUNCTION_13();
    sub_25C6B0894(v83, 1);
    if (v92) {
      double v95 = 1.0;
    }
    else {
      double v95 = 0.5;
    }
    sub_25C6AF3C8(v93, v72, &qword_26A5C6218);
    *(double *)(v72 + *(int *)(v183 + 36)) = v95;
    sub_25C6AF7F4(v93, &qword_26A5C6218);
    sub_25C6D6140();
    if (qword_26A5C5CB8 != -1) {
      swift_once();
    }
    uint64_t v96 = OUTLINED_FUNCTION_10();
    v97(v96);
    uint64_t v98 = OUTLINED_FUNCTION_6_0();
    v99(v98);
    uint64_t v100 = OUTLINED_FUNCTION_12();
    v101(v100);
    uint64_t v102 = OUTLINED_FUNCTION_5_1(*(int *)(v185 + 36));
    v103(v102);
    uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6280);
    OUTLINED_FUNCTION_18(v104);
    *(_WORD *)((char *)&qword_26A5C6218 + *(int *)(v83 + 56)) = 256;
    sub_25C6AF3C8(v72, v81, &qword_26A5C6220);
    sub_25C6B261C(v93, MEMORY[0x263F19048]);
    uint64_t v105 = OUTLINED_FUNCTION_8();
    v106(v105);
    sub_25C6AF7F4(v72, &qword_26A5C6220);
    uint64_t v107 = swift_getKeyPath();
    uint64_t v109 = v202;
    uint64_t v108 = v203;
    OUTLINED_FUNCTION_19();
    uint64_t v110 = v187;
    v111(v187);
    uint64_t v112 = v189;
    uint64_t v113 = (uint64_t *)(v189 + *(int *)(v206 + 36));
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6288);
    OUTLINED_FUNCTION_9();
    v114();
    *uint64_t v113 = v107;
    sub_25C6AF3C8(v81, v112, &qword_26A5C6228);
    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v110, v108);
    sub_25C6AF7F4(v81, &qword_26A5C6228);
    unint64_t v115 = &qword_26A5C6230;
    uint64_t v116 = v190;
    sub_25C6A4150(v112, v190, &qword_26A5C6230);
    sub_25C6AF3C8(v116, v205, &qword_26A5C6230);
    swift_storeEnumTagMultiPayload();
    sub_25C6B2240((uint64_t)&unk_26A5C6290);
    sub_25C6B2240((uint64_t)&unk_26A5C62D0);
    sub_25C6D5CF0();
    uint64_t v117 = v116;
  }
  return sub_25C6AF7F4(v117, v115);
}

void *sub_25C6B1B70@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25C6D65E0();
    uint64_t v28 = (void *)sub_25C6D5DC0();
    sub_25C6D5990();

    uint64_t v19 = a17;
  }
  sub_25C6D5BB0();
  sub_25C6AF3C8(v17, a9, a16);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  return memcpy((void *)(a9 + *(int *)(v29 + 36)), __src, 0x70uLL);
}

uint64_t sub_25C6B1D20@<X0>(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + 10)) {
    int v2 = 0x10000;
  }
  else {
    int v2 = 0;
  }
  if (*(unsigned char *)(v1 + 9)) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  return sub_25C6B0ACC(*(void *)v1, v2 | v3 | *(unsigned __int8 *)(v1 + 8), a1);
}

uint64_t sub_25C6B1D5C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_25C6D5C90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_25C6D65E0();
  uint64_t v9 = sub_25C6D5DC0();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v15 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v14 = sub_25C6A9FE8(1819242306, 0xE400000000000000, &v15);
    sub_25C6D6700();
    _os_log_impl(&dword_25C69F000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261190AB0](v12, -1, -1);
    MEMORY[0x261190AB0](v11, -1, -1);
  }

  sub_25C6D5C80();
  swift_getAtKeyPath();
  sub_25C6B0894(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_25C6B1F68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C6D5BA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25C6B1FD4()
{
  unint64_t result = qword_26A5C6298;
  if (!qword_26A5C6298)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6260);
    sub_25C6B2478((uint64_t)&unk_26A5C62A0);
    sub_25C6AD654((uint64_t)&unk_26A5C62C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6298);
  }
  return result;
}

unint64_t sub_25C6B20A0()
{
  return sub_25C6B2478((uint64_t)&unk_26A5C62A8);
}

unint64_t sub_25C6B20D0()
{
  unint64_t result = qword_26A5C62B0;
  if (!qword_26A5C62B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6248);
    sub_25C6D5DA0();
    type metadata accessor for GetContactQuickActionButtonLabelStyleIconOnly(255);
    sub_25C6B21FC((uint64_t)&unk_26A5C6270);
    sub_25C6B21FC((uint64_t)&unk_26A5C62B8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C62B0);
  }
  return result;
}

unint64_t sub_25C6B21FC(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25C6B2240(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    sub_25C6AD654((uint64_t)&qword_26A5C62C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25C6B22E0()
{
  unint64_t result = qword_26A5C62D8;
  if (!qword_26A5C62D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6228);
    sub_25C6B2478((uint64_t)&unk_26A5C62E0);
    sub_25C6AD654((uint64_t)&unk_26A5C62C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C62D8);
  }
  return result;
}

unint64_t sub_25C6B23AC()
{
  unint64_t result = qword_26A5C62E8;
  if (!qword_26A5C62E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6218);
    sub_25C6B2478((uint64_t)&unk_26A5C62F0);
    sub_25C6AD654((uint64_t)&unk_26A5C6300);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C62E8);
  }
  return result;
}

unint64_t sub_25C6B2478(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25C6B24F0()
{
  unint64_t result = qword_26A5C62F8;
  if (!qword_26A5C62F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6208);
    sub_25C6D5DA0();
    type metadata accessor for GetContactQuickActionButtonLabelStyle(255);
    sub_25C6B21FC((uint64_t)&unk_26A5C6270);
    sub_25C6B21FC((uint64_t)&unk_26A5C6278);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C62F8);
  }
  return result;
}

uint64_t sub_25C6B261C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_25C6B2678()
{
  unint64_t result = qword_26A5C6310;
  if (!qword_26A5C6310)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6318);
    sub_25C6B2240((uint64_t)&unk_26A5C6290);
    sub_25C6B2240((uint64_t)&unk_26A5C62D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6310);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_1@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 - 256) + a1;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return *(void *)(v0 - 216) + *(int *)(*(void *)(v0 - 256) + 20);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return *(void *)(v0 - 248);
}

uint64_t OUTLINED_FUNCTION_12()
{
  *uint64_t v1 = v2;
  v1[1] = v2;
  return v0;
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t v1 = *(void *)(v0 - 176);
  int v2 = *(_DWORD *)(v0 - 180);
  sub_25C6B0878(v1, v2);
  return sub_25C6B1D5C(v1, v2);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return 0;
}

void OUTLINED_FUNCTION_16()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1)
{
  uint64_t v4 = v1 + *(int *)(a1 + 52);
  return sub_25C6B1F68(v2, v4);
}

void sub_25C6B28C8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25C6D59F0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A5C6B58);
    oslog = sub_25C6D59D0();
    os_log_type_t v4 = sub_25C6D65D0();
    if (os_log_type_enabled(oslog, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_25C69F000, oslog, v4, "#GetContactAttributeButtonableView could not obtain direct invocation for button press", v5, 2u);
      MEMORY[0x261190AB0](v5, -1, -1);
    }
LABEL_16:

    return;
  }
  sub_25C6A6700();
  sub_25C6A6740(a1, a2);
  uint64_t v8 = sub_25C6D65B0();
  if (!v8)
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25C6D59F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_26A5C6B58);
    oslog = sub_25C6D59D0();
    os_log_type_t v14 = sub_25C6D65D0();
    if (os_log_type_enabled(oslog, v14))
    {
      uint64_t v15 = (_WORD *)swift_slowAlloc();
      *uint64_t v15 = 0;
      OUTLINED_FUNCTION_33(&dword_25C69F000, v16, v17, "#GetContactAttributeButtonableView could not convert direct invocation to actionable command", v18, v19, v20, v21, v24, oslog);
      MEMORY[0x261190AB0](v15, -1, -1);
    }
    uint64_t v22 = OUTLINED_FUNCTION_3_1();
    sub_25C6A665C(v22, v23);
    goto LABEL_16;
  }
  if (*v2)
  {
    uint64_t v9 = (void *)v8;
    id v10 = *v2;
    sub_25C6D6340();

    uint64_t v11 = OUTLINED_FUNCTION_3_1();
    sub_25C6A665C(v11, v12);
  }
  else
  {
    sub_25C6D6350();
    sub_25C6B94C4((uint64_t)&qword_26A5C5E48);
    OUTLINED_FUNCTION_35();
    __break(1u);
  }
}

void sub_25C6B2B48()
{
}

void sub_25C6B2B74()
{
  OUTLINED_FUNCTION_23();
  uint64_t v109 = v2;
  uint64_t v113 = v3;
  uint64_t v114 = v0;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_7();
  uint64_t v110 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5D00);
  OUTLINED_FUNCTION_1();
  uint64_t v107 = v9;
  uint64_t v108 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2();
  char v12 = v11 - v10;
  sub_25C6D58C0();
  OUTLINED_FUNCTION_1();
  uint64_t v111 = v14;
  uint64_t v112 = v13;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3_0();
  uint64_t v105 = v15;
  OUTLINED_FUNCTION_28();
  MEMORY[0x270FA5388](v16);
  v103[1] = (char *)v103 - v17;
  OUTLINED_FUNCTION_28();
  MEMORY[0x270FA5388](v18);
  v103[2] = (char *)v103 - v19;
  OUTLINED_FUNCTION_28();
  MEMORY[0x270FA5388](v20);
  v103[3] = (char *)v103 - v21;
  type metadata accessor for GetContactAttributeViewModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_3_0();
  uint64_t v104 = v23;
  OUTLINED_FUNCTION_28();
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)v103 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)v103 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)v103 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)v103 - v34;
  uint64_t v36 = sub_25C6D57B0();
  OUTLINED_FUNCTION_1();
  uint64_t v38 = v37;
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_16_0();
  uint64_t v106 = v5;
  sub_25C6D57F0();
  v103[0] = v38;
  int v40 = (*(uint64_t (**)(uint64_t, uint64_t))(v38 + 88))(v1, v36);
  if (v40 != *MEMORY[0x263F6CED8])
  {
    uint64_t v52 = v114;
    if (v40 == *MEMORY[0x263F6CEC8])
    {
      uint64_t v53 = OUTLINED_FUNCTION_24();
      v54(v53);
      sub_25C6B9844();
      sub_25C6D57A0();
      sub_25C6B9664((uint64_t)v35, (void (*)(void))type metadata accessor for GetContactAttributeViewModel);
      uint64_t v55 = sub_25C6D5880();
      OUTLINED_FUNCTION_3();
      v56();
      uint64_t v57 = sub_25C6D57E0();
      char v12 = v58;
      if (*(void *)(v55 + 16))
      {
        unint64_t v59 = sub_25C6CA89C(v57, v58);
        if (v60) {
          OUTLINED_FUNCTION_11(v59);
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v68 = sub_25C6D5530();
      OUTLINED_FUNCTION_29(v68, v69, v70, v68);
      uint64_t v71 = v52;
      OUTLINED_FUNCTION_38();
      v72();
      OUTLINED_FUNCTION_12_0();
      sub_25C6B9280((uint64_t)v33, &qword_26A5C68F0);
      OUTLINED_FUNCTION_37();
    }
    else
    {
      if (v40 != *MEMORY[0x263F6CEA8])
      {
        if (v40 != *MEMORY[0x263F6CEB8])
        {
          uint64_t v119 = 0;
          int v120 = 0;
          __int16 v121 = 256;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6068);
          sub_25C6B62A4((uint64_t)&unk_26A5C6060);
          OUTLINED_FUNCTION_30();
          sub_25C6D5CF0();
          OUTLINED_FUNCTION_18_0();
          OUTLINED_FUNCTION_3();
          v97();
          goto LABEL_31;
        }
        uint64_t v73 = OUTLINED_FUNCTION_24();
        v74(v73);
        sub_25C6B9844();
        sub_25C6D57A0();
        sub_25C6B9664((uint64_t)v30, (void (*)(void))type metadata accessor for GetContactAttributeViewModel);
        uint64_t v55 = sub_25C6D58A0();
        OUTLINED_FUNCTION_3();
        v75();
        uint64_t v76 = sub_25C6D57E0();
        char v12 = v77;
        if (*(void *)(v55 + 16))
        {
          unint64_t v78 = sub_25C6CA89C(v76, v77);
          if (v79) {
            OUTLINED_FUNCTION_11(v78);
          }
        }
        uint64_t v71 = v52;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v98 = sub_25C6D5530();
        OUTLINED_FUNCTION_29(v98, v99, v100, v98);
        OUTLINED_FUNCTION_38();
        v101();
        OUTLINED_FUNCTION_12_0();
        sub_25C6B9280((uint64_t)v33, &qword_26A5C68F0);
        uint64_t v119 = v55;
        int v120 = v52 & 0x1FF;
        OUTLINED_FUNCTION_27();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6088);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C60B8);
        sub_25C6AD914();
        sub_25C6ADA60();
        OUTLINED_FUNCTION_6_1();
        OUTLINED_FUNCTION_14_0();
        OUTLINED_FUNCTION_36(v102);
        goto LABEL_29;
      }
      uint64_t v61 = OUTLINED_FUNCTION_24();
      v62(v61);
      sub_25C6B9844();
      sub_25C6D57A0();
      sub_25C6B9664((uint64_t)v33, (void (*)(void))type metadata accessor for GetContactAttributeViewModel);
      uint64_t v55 = sub_25C6D58B0();
      OUTLINED_FUNCTION_3();
      v63();
      uint64_t v64 = sub_25C6D57E0();
      char v12 = v65;
      if (*(void *)(v55 + 16))
      {
        unint64_t v66 = sub_25C6CA89C(v64, v65);
        if (v67) {
          OUTLINED_FUNCTION_11(v66);
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v91 = sub_25C6D5530();
      uint64_t v92 = v110;
      OUTLINED_FUNCTION_13_0(v110, v93, v94, v91);
      uint64_t v71 = v52;
      OUTLINED_FUNCTION_38();
      v95();
      OUTLINED_FUNCTION_12_0();
      sub_25C6B9280(v92, &qword_26A5C68F0);
      uint64_t v119 = v55;
      LOWORD(v120) = v52 & 0x1FF;
      BYTE2(v120) = 1;
    }
    OUTLINED_FUNCTION_27();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6088);
    sub_25C6AD914();
    sub_25C6D5CF0();
    if (BYTE2(v116)) {
      int v96 = 0x10000;
    }
    else {
      int v96 = 0;
    }
    uint64_t v119 = v115;
    int v120 = v96 | (unsigned __int16)v116;
    LOBYTE(v121) = 0;
LABEL_29:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6078);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C60A8);
    sub_25C6AD8A0();
    sub_25C6ADA24();
    OUTLINED_FUNCTION_6_1();
    uint64_t v119 = v115;
    LOBYTE(v121) = v117 != 0;
    int v120 = v116;
    HIBYTE(v121) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6068);
    sub_25C6B62A4((uint64_t)&unk_26A5C6060);
    OUTLINED_FUNCTION_30();
    sub_25C6D5CF0();
    sub_25C6ADAB4(v55, v71, v12);
    goto LABEL_30;
  }
  v113(0);
  sub_25C6B9844();
  sub_25C6D5850();
  uint64_t v41 = (void *)sub_25C6D56D0();
  OUTLINED_FUNCTION_3();
  v42();
  char v43 = sub_25C6D6680();

  sub_25C6B9664((uint64_t)v27, (void (*)(void))type metadata accessor for GetContactAttributeViewModel);
  if ((v43 & 1) == 0)
  {
    uint64_t v119 = 0;
    LOWORD(v120) = 0;
    BYTE2(v120) = 1;
LABEL_23:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6088);
    sub_25C6AD914();
    OUTLINED_FUNCTION_30();
    sub_25C6D5CF0();
    uint64_t v85 = v115;
    uint64_t v86 = (unsigned __int16)v116;
    char v12 = BYTE2(v116);
    uint64_t v119 = v115;
    LOWORD(v120) = v116;
    BYTE2(v120) = BYTE2(v116) != 0;
    HIBYTE(v120) = 1;
    sub_25C6B96B4(v115, (unsigned __int16)v116, SBYTE2(v116));
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6088);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C60B8);
    sub_25C6AD914();
    sub_25C6ADA60();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_36(v87);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6078);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C60A8);
    sub_25C6AD8A0();
    sub_25C6ADA24();
    OUTLINED_FUNCTION_6_1();
    uint64_t v88 = v115;
    uint64_t v89 = v116;
    char v90 = v117;
    uint64_t v119 = v115;
    LOBYTE(v121) = v117 != 0;
    int v120 = v116;
    HIBYTE(v121) = 0;
    sub_25C6B96C4(v115, v116, v117, (uint64_t (*)(uint64_t, uint64_t, void))sub_25C6B9704, (uint64_t (*)(uint64_t, uint64_t, void))sub_25C6B92CC, (uint64_t (*)(uint64_t, uint64_t, void))sub_25C6B96B4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6068);
    sub_25C6B62A4((uint64_t)&unk_26A5C6060);
    OUTLINED_FUNCTION_30();
    sub_25C6D5CF0();
    sub_25C6ADAD4(v85, v86, v12);
    sub_25C6B96C4(v88, v89, v90, (uint64_t (*)(uint64_t, uint64_t, void))sub_25C6ADAAC, (uint64_t (*)(uint64_t, uint64_t, void))sub_25C6ADAB4, (uint64_t (*)(uint64_t, uint64_t, void))sub_25C6ADAD4);
LABEL_30:
    OUTLINED_FUNCTION_18_0();
LABEL_31:
    LOBYTE(v115) = v12;
    OUTLINED_FUNCTION_26();
    return;
  }
  uint64_t v44 = v104;
  sub_25C6B9844();
  sub_25C6D57A0();
  sub_25C6B9664(v44, (void (*)(void))type metadata accessor for GetContactAttributeViewModel);
  uint64_t v45 = sub_25C6D58B0();
  OUTLINED_FUNCTION_3();
  v46();
  uint64_t v47 = sub_25C6B9728(v45);
  if ((v49 & 1) == 0)
  {
    if (*(_DWORD *)(v45 + 36) == v48)
    {
      if (v47 == 1 << *(unsigned char *)(v45 + 32))
      {
        swift_bridgeObjectRelease();
        uint64_t v50 = 0;
        unint64_t v51 = 0xF000000000000000;
      }
      else
      {
        sub_25C6B97A8(v118, v47, v48, 0, v45);
        uint64_t v50 = v118[0];
        unint64_t v51 = v118[1];
        swift_bridgeObjectRetain();
        sub_25C6A6740(v50, v51);
        swift_bridgeObjectRelease();
        sub_25C6A6670(v50, v51);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      uint64_t v80 = sub_25C6D5530();
      uint64_t v81 = v110;
      OUTLINED_FUNCTION_13_0(v110, v82, v83, v80);
      OUTLINED_FUNCTION_38();
      v84();
      sub_25C6A665C(v50, v51);
      sub_25C6B9280(v81, &qword_26A5C68F0);
      OUTLINED_FUNCTION_37();
      goto LABEL_23;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_25C6B3834(uint64_t a1)
{
  return sub_25C6B3860(a1, (uint64_t (*)(uint64_t))type metadata accessor for GetContactAttributeMultiResultView, (uint64_t (*)(uint64_t, unint64_t, void, unint64_t, uint64_t))sub_25C6B77F0);
}

uint64_t sub_25C6B3860(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(uint64_t, unint64_t, void, unint64_t, uint64_t))
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_25C6D57B0();
  OUTLINED_FUNCTION_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_16_0();
  sub_25C6D57F0();
  int v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 88))(v3, v10);
  if (v14 == *MEMORY[0x263F6CEC8])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6088);
    sub_25C6AD914();
    sub_25C6D5CF0();
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_19_0(v15);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C60D8);
    sub_25C6ADAE4();
    sub_25C6D5CF0();
  }
  else
  {
    if (v14 != *MEMORY[0x263F6CEA8])
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C60D8);
      sub_25C6ADAE4();
      sub_25C6D5CF0();
      OUTLINED_FUNCTION_25();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v3, v10);
      return v16;
    }
    uint64_t v17 = OUTLINED_FUNCTION_24();
    a2(v17);
    sub_25C6D57D0();
    sub_25C6D4CD8(v18, v9);
    swift_bridgeObjectRelease();
    uint64_t v16 = a3(0x69662E656E6F6870, 0xEA00000000006C6CLL, 0, 0xF000000000000000, v9);
    uint64_t v20 = v19;
    unsigned int v21 = (v19 >> 8) & 1;
    sub_25C6B9280(v9, &qword_26A5C68F0);
    OUTLINED_FUNCTION_27();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6088);
    sub_25C6AD914();
    sub_25C6D5CF0();
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_19_0(v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C60D8);
    sub_25C6ADAE4();
    sub_25C6D5CF0();
    sub_25C6ADAB4(v16, v20, v21);
  }
  OUTLINED_FUNCTION_25();
  return v16;
}

uint64_t sub_25C6B3B90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v88 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5D00);
  uint64_t v83 = *(void *)(v2 - 8);
  uint64_t v84 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v82 = (char *)v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DD8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v85 = (char *)v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25C6D57B0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v78 - v12;
  uint64_t v14 = sub_25C6D5800();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  char v79 = (char *)v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v78 - v18;
  uint64_t v20 = v1 + *(int *)(type metadata accessor for GetContactAttributeSingleResultView() + 20);
  uint64_t ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  uint64_t v87 = v20;
  uint64_t v94 = v20 + *(int *)(ContactAttributeViewModel + 20);
  uint64_t result = MEMORY[0x26118F420]();
  if (!*(void *)(result + 16))
  {
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v80 = v5;
  uint64_t v81 = v4;
  unint64_t v89 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v91 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  uint64_t v92 = v15 + 16;
  v91(v19, result + v89, v14);
  swift_bridgeObjectRelease();
  sub_25C6D57F0();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v15 + 8);
  uint64_t v22 = v15 + 8;
  uint64_t v93 = v14;
  char v90 = v23;
  v23(v19, v14);
  uint64_t v24 = *(void (**)(char *, void, uint64_t))(v8 + 104);
  v24(v11, *MEMORY[0x263F6CEC0], v7);
  char v25 = sub_25C6A31C8((uint64_t)v13, (uint64_t)v11);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v8 + 8);
  v26(v11, v7);
  uint64_t v27 = ((uint64_t (*)(char *, uint64_t))v26)(v13, v7);
  if (v25)
  {
LABEL_3:
    uint64_t v28 = v82;
    sub_25C6D5850();
    uint64_t v29 = v84;
    uint64_t v30 = (void *)sub_25C6D56D0();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v28, v29);
    uint64_t v31 = sub_25C6D6690();
    unint64_t v33 = v32;

    uint64_t v95 = v31;
    unint64_t v96 = v33;
    sub_25C6A401C();
    uint64_t v34 = sub_25C6D5EC0();
    uint64_t v36 = v35;
    char v38 = v37 & 1;
    uint64_t v95 = *(void *)(v87 + *(int *)(ContactAttributeViewModel + 28));
    swift_retain();
    uint64_t v39 = sub_25C6D5EA0();
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    char v45 = v44 & 1;
    sub_25C6A4068(v34, v36, v38);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v95 = v39;
    unint64_t v96 = v41;
    char v97 = v45;
    uint64_t v98 = v43;
    uint64_t v46 = MEMORY[0x263F1A830];
    unint64_t v47 = MEMORY[0x263F1A820];
    int v48 = v85;
    sub_25C6D5FB0();
    sub_25C6A4068(v39, v41, v45);
    swift_bridgeObjectRelease();
    uint64_t v95 = v46;
    unint64_t v96 = v47;
    swift_getOpaqueTypeConformance2();
    uint64_t v49 = v81;
    uint64_t v50 = sub_25C6D5ED0();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v48, v49);
LABEL_15:
    uint64_t v76 = MEMORY[0x263F774B0];
    uint64_t v77 = v88;
    v88[3] = MEMORY[0x263F1B720];
    v77[4] = v76;
    *uint64_t v77 = v50;
    return result;
  }
  uint64_t result = MEMORY[0x26118F420](v27);
  if (!*(void *)(result + 16)) {
    goto LABEL_17;
  }
  v78[1] = v22;
  uint64_t v51 = v93;
  v91(v19, result + v89, v93);
  swift_bridgeObjectRelease();
  sub_25C6D57F0();
  v90(v19, v51);
  v24(v11, *MEMORY[0x263F6CED8], v7);
  char v52 = sub_25C6A31C8((uint64_t)v13, (uint64_t)v11);
  v26(v11, v7);
  uint64_t v53 = ((uint64_t (*)(char *, uint64_t))v26)(v13, v7);
  if ((v52 & 1) == 0)
  {
LABEL_8:
    uint64_t result = MEMORY[0x26118F420](v53);
    if (*(void *)(result + 16))
    {
      uint64_t v57 = v79;
      uint64_t v58 = v93;
      v91(v79, result + v89, v93);
      swift_bridgeObjectRelease();
      uint64_t v59 = sub_25C6D57D0();
      unint64_t v61 = v60;
      v90(v57, v58);
      if (v61) {
        uint64_t v62 = v59;
      }
      else {
        uint64_t v62 = 0;
      }
      unint64_t v63 = 0xE000000000000000;
      if (v61) {
        unint64_t v63 = v61;
      }
      uint64_t v95 = v62;
      unint64_t v96 = v63;
      sub_25C6A401C();
      uint64_t v64 = sub_25C6D5EC0();
      uint64_t v66 = v65;
      char v68 = v67 & 1;
      uint64_t v95 = *(void *)(v87 + *(int *)(ContactAttributeViewModel + 28));
      swift_retain();
      uint64_t v69 = sub_25C6D5EA0();
      uint64_t v71 = v70;
      uint64_t v73 = v72;
      char v75 = v74 & 1;
      sub_25C6A4068(v64, v66, v68);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v95 = v69;
      unint64_t v96 = v71;
      char v97 = v75;
      uint64_t v98 = v73;
      uint64_t v50 = sub_25C6D5ED0();
      sub_25C6A4068(v69, v71, v75);
      uint64_t result = swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  uint64_t result = MEMORY[0x26118F420](v53);
  if (*(void *)(result + 16))
  {
    uint64_t v54 = v93;
    v91(v19, result + v89, v93);
    swift_bridgeObjectRelease();
    sub_25C6D57D0();
    v90(v19, v54);
    sub_25C6D66E0();
    uint64_t v56 = v55;
    swift_bridgeObjectRelease();
    uint64_t v53 = swift_bridgeObjectRelease();
    if (!v56) {
      goto LABEL_3;
    }
    goto LABEL_8;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_25C6B43A0@<X0>(uint64_t *a1@<X8>)
{
  v158 = a1;
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5D00);
  uint64_t v144 = *(void *)(v145 - 8);
  MEMORY[0x270FA5388](v145);
  uint64_t v143 = (char *)&v134 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DD8);
  uint64_t v147 = *(void *)(v148 - 8);
  MEMORY[0x270FA5388](v148);
  uint64_t v146 = (char *)&v134 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DE0);
  MEMORY[0x270FA5388](v150);
  uint64_t v149 = (char *)&v134 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6378);
  uint64_t v138 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v142 = (char *)&v134 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6380);
  uint64_t v139 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  double v137 = (char *)&v134 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6120);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v157 = (uint64_t)&v134 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25C6D57B0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v134 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v134 - v16;
  uint64_t v18 = sub_25C6D5800();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v136 = (char *)&v134 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v141 = (char *)&v134 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  long long v140 = (char *)&v134 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v151 = (char *)&v134 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v134 - v28;
  uint64_t ContactAttributeSingleResultView = type metadata accessor for GetContactAttributeSingleResultView();
  uint64_t v30 = *(int *)(ContactAttributeSingleResultView + 20);
  uint64_t v160 = v1;
  uint64_t v31 = v1 + v30;
  uint64_t ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  uint64_t v32 = *(int *)(ContactAttributeViewModel + 20);
  uint64_t v153 = v31;
  uint64_t v166 = v31 + v32;
  uint64_t result = MEMORY[0x26118F420]();
  if (!*(void *)(result + 16))
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v135 = v5;
  uint64_t v134 = v7;
  unint64_t v162 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v163 = *(void (**)(char *, unint64_t, uint64_t))(v19 + 16);
  uint64_t v164 = v19 + 16;
  v163(v29, result + v162, v18);
  swift_bridgeObjectRelease();
  sub_25C6D57F0();
  uint64_t v35 = *(uint64_t (**)(char *, uint64_t))(v19 + 8);
  uint64_t v34 = v19 + 8;
  uint64_t v161 = v18;
  uint64_t v165 = v35;
  v35(v29, v18);
  uint64_t v36 = *MEMORY[0x263F6CEC0];
  uint64_t v154 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 104);
  v154(v15, v36, v11);
  char v37 = sub_25C6A31C8((uint64_t)v17, (uint64_t)v15);
  char v38 = *(void (**)(char *, uint64_t))(v12 + 8);
  v38(v15, v11);
  uint64_t v155 = v11;
  uint64_t v39 = ((uint64_t (*)(char *, uint64_t))v38)(v17, v11);
  if (v37)
  {
    uint64_t result = MEMORY[0x26118F420](v39);
    if (!*(void *)(result + 16))
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    uint64_t v40 = v151;
    uint64_t v159 = v34;
    uint64_t v41 = v161;
    v163(v151, result + v162, v161);
    swift_bridgeObjectRelease();
    uint64_t v42 = sub_25C6D57C0();
    uint64_t v44 = v43;
    uint64_t v45 = v41;
    uint64_t v34 = v159;
    uint64_t v39 = v165(v40, v45);
    if (v44)
    {
      uint64_t v167 = v42;
      uint64_t v168 = v44;
      sub_25C6A401C();
      uint64_t v46 = sub_25C6D5EC0();
      uint64_t v48 = v47;
      char v50 = v49 & 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
      sub_25C6D5AF0();
      uint64_t v51 = sub_25C6D5E00();
      uint64_t v52 = v157;
      __swift_storeEnumTagSinglePayload(v157, 1, 1, v51);
      sub_25C6D5E20();
      sub_25C6B9280(v52, &qword_26A5C6120);
      uint64_t v53 = sub_25C6D5EB0();
      uint64_t v55 = v54;
      char v57 = v56;
      swift_release();
      char v58 = v57 & 1;
      sub_25C6A4068(v46, v48, v50);
      swift_bridgeObjectRelease();
      uint64_t v167 = *(void *)(v153 + *(int *)(ContactAttributeViewModel + 28));
      swift_retain();
LABEL_11:
      uint64_t v77 = sub_25C6D5EA0();
      uint64_t v79 = v78;
      char v81 = v80;
      uint64_t v83 = v82;
      sub_25C6A4068(v53, v55, v58);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v84 = MEMORY[0x263F77348];
      uint64_t v85 = v158;
      v158[3] = MEMORY[0x263F1A830];
      v85[4] = v84;
      uint64_t result = swift_allocObject();
      *uint64_t v85 = result;
      *(void *)(result + 16) = v77;
      *(void *)(result + 24) = v79;
      *(unsigned char *)(result + 32) = v81 & 1;
      *(void *)(result + 40) = v83;
      return result;
    }
  }
  uint64_t result = MEMORY[0x26118F420](v39);
  if (!*(void *)(result + 16))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v59 = v161;
  v163(v29, result + v162, v161);
  swift_bridgeObjectRelease();
  sub_25C6D57F0();
  v165(v29, v59);
  uint64_t v60 = v155;
  v154(v15, *MEMORY[0x263F6CED8], v155);
  char v61 = sub_25C6A31C8((uint64_t)v17, (uint64_t)v15);
  v38(v15, v60);
  uint64_t v62 = ((uint64_t (*)(char *, uint64_t))v38)(v17, v60);
  if ((v61 & 1) == 0)
  {
    uint64_t v159 = v34;
    uint64_t v86 = v143;
    sub_25C6D5850();
    uint64_t v87 = v145;
    uint64_t v88 = (void *)sub_25C6D56D0();
    (*(void (**)(char *, uint64_t))(v144 + 8))(v86, v87);
    uint64_t v89 = sub_25C6D6690();
    uint64_t v91 = v90;

    uint64_t v167 = v89;
    uint64_t v168 = v91;
    sub_25C6A401C();
    uint64_t v92 = sub_25C6D5EC0();
    uint64_t v94 = v93;
    uint64_t v167 = v92;
    uint64_t v168 = v93;
    char v96 = v95 & 1;
    LOBYTE(v169) = v95 & 1;
    unint64_t v170 = v97;
    uint64_t v98 = v146;
    sub_25C6D5FB0();
    sub_25C6A4068(v92, v94, v96);
    swift_bridgeObjectRelease();
    uint64_t v99 = v160;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
    sub_25C6D5AF0();
    uint64_t v100 = sub_25C6D5E00();
    uint64_t v101 = v157;
    __swift_storeEnumTagSinglePayload(v157, 1, 1, v100);
    uint64_t v102 = sub_25C6D5E20();
    sub_25C6B9280(v101, &qword_26A5C6120);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v104 = v147;
    uint64_t v105 = (uint64_t)v149;
    uint64_t v106 = v148;
    (*(void (**)(char *, char *, uint64_t))(v147 + 16))(v149, v98, v148);
    uint64_t v107 = v150;
    uint64_t v108 = (uint64_t *)(v105 + *(int *)(v150 + 36));
    *uint64_t v108 = KeyPath;
    v108[1] = v102;
    uint64_t v109 = (*(uint64_t (**)(char *, uint64_t))(v104 + 8))(v98, v106);
    uint64_t result = MEMORY[0x26118F420](v109);
    if (*(void *)(result + 16))
    {
      uint64_t v110 = v141;
      v163(v141, result + v162, v59);
      swift_bridgeObjectRelease();
      sub_25C6D57C0();
      uint64_t v112 = v111;
      uint64_t v113 = v165(v110, v59);
      if (v112) {
        uint64_t v113 = swift_bridgeObjectRelease();
      }
      MEMORY[0x270FA5388](v113);
      *(&v134 - 2) = v99;
      uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DC0);
      unint64_t v115 = sub_25C6A4080();
      unint64_t v116 = sub_25C6B90E0();
      char v117 = v142;
      sub_25C6D5F20();
      uint64_t v118 = sub_25C6B9280(v105, &qword_26A5C5DE0);
      uint64_t result = MEMORY[0x26118F420](v118);
      uint64_t v119 = v135;
      if (*(void *)(result + 16))
      {
        uint64_t v120 = v161;
        __int16 v121 = v136;
        v163(v136, result + v162, v161);
        swift_bridgeObjectRelease();
        sub_25C6D57C0();
        uint64_t v123 = v122;
        uint64_t v124 = v165(v121, v120);
        if (v123) {
          uint64_t v124 = swift_bridgeObjectRelease();
        }
        MEMORY[0x270FA5388](v124);
        *(&v134 - 2) = v160;
        uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6390);
        uint64_t v167 = v107;
        uint64_t v168 = v114;
        unint64_t v169 = v115;
        unint64_t v170 = v116;
        uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
        unint64_t v127 = sub_25C6B9188();
        char v128 = v137;
        sub_25C6D5F20();
        (*(void (**)(char *, uint64_t))(v138 + 8))(v117, v119);
        uint64_t v167 = v119;
        uint64_t v168 = v125;
        unint64_t v169 = OpaqueTypeConformance2;
        unint64_t v170 = v127;
        swift_getOpaqueTypeConformance2();
        uint64_t v129 = v134;
        uint64_t v130 = sub_25C6D5ED0();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v139 + 8))(v128, v129);
        uint64_t v131 = MEMORY[0x263F774B0];
        char v132 = v158;
        v158[3] = MEMORY[0x263F1B720];
        v132[4] = v131;
        *char v132 = v130;
        return result;
      }
LABEL_25:
      __break(1u);
      return result;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t result = MEMORY[0x26118F420](v62);
  if (!*(void *)(result + 16))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v63 = v140;
  v163(v140, result + v162, v59);
  swift_bridgeObjectRelease();
  uint64_t v64 = sub_25C6D57C0();
  uint64_t v66 = v65;
  uint64_t result = v165(v63, v59);
  if (v66)
  {
    uint64_t v167 = v64;
    uint64_t v168 = v66;
    sub_25C6A401C();
    uint64_t v67 = sub_25C6D5EC0();
    uint64_t v69 = v68;
    char v71 = v70 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
    sub_25C6D5AF0();
    uint64_t v72 = sub_25C6D5E00();
    uint64_t v73 = v157;
    __swift_storeEnumTagSinglePayload(v157, 1, 1, v72);
    sub_25C6D5E20();
    sub_25C6B9280(v73, &qword_26A5C6120);
    uint64_t v53 = sub_25C6D5EB0();
    uint64_t v55 = v74;
    char v76 = v75;
    swift_release();
    char v58 = v76 & 1;
    sub_25C6A4068(v67, v69, v71);
    swift_bridgeObjectRelease();
    uint64_t v167 = sub_25C6D6040();
    goto LABEL_11;
  }
  double v133 = v158;
  v158[4] = 0;
  *(_OWORD *)double v133 = 0u;
  *((_OWORD *)v133 + 1) = 0u;
  return result;
}

uint64_t sub_25C6B52F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for GetContactAttributeSingleResultView();
  type metadata accessor for GetContactAttributeViewModel();
  uint64_t v4 = sub_25C6D6040();
  sub_25C6A42C8(a1, a2, &qword_26A5C5DE0);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DC0);
  *(void *)(a2 + *(int *)(result + 36)) = v4;
  return result;
}

uint64_t sub_25C6B5380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a2 + *(int *)(type metadata accessor for GetContactAttributeSingleResultView() + 20);
  uint64_t v6 = *(void *)(v5 + *(int *)(type metadata accessor for GetContactAttributeViewModel() + 28));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a3, a1, v7);
  *(void *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6390) + 36)) = v6;

  return swift_retain();
}

uint64_t sub_25C6B5438@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v74 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6120);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ContactAttributeSingleResultView = type metadata accessor for GetContactAttributeSingleResultView();
  MEMORY[0x270FA5388](ContactAttributeSingleResultView);
  uint64_t v75 = (uint64_t)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C6D57B0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v61 - v13;
  uint64_t v15 = sub_25C6D5800();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v64 = (char *)&v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v61 - v19;
  uint64_t v70 = ContactAttributeSingleResultView;
  uint64_t v21 = v2 + *(int *)(ContactAttributeSingleResultView + 20);
  uint64_t ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  uint64_t v22 = *(int *)(ContactAttributeViewModel + 20);
  uint64_t v63 = v21;
  uint64_t v65 = v21 + v22;
  uint64_t result = MEMORY[0x26118F420]();
  if (!*(void *)(result + 16))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v62 = v5;
  unint64_t v71 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v72 = *(void (**)(char *, unint64_t, uint64_t))(v16 + 16);
  uint64_t v73 = v16 + 16;
  v72(v20, result + v71, v15);
  swift_bridgeObjectRelease();
  sub_25C6D57F0();
  uint64_t v67 = *(void (**)(char *, uint64_t))(v16 + 8);
  uint64_t v68 = v15;
  v67(v20, v15);
  uint64_t v24 = *MEMORY[0x263F6CEC0];
  uint64_t v66 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  v66(v12, v24, v8);
  char v25 = sub_25C6A31C8((uint64_t)v14, (uint64_t)v12);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v9 + 8);
  v26(v12, v8);
  v26(v14, v8);
  uint64_t v61 = v2;
  uint64_t v27 = sub_25C6B9844();
  if (v25)
  {
    uint64_t result = sub_25C6B9664(v75, (void (*)(void))type metadata accessor for GetContactAttributeSingleResultView);
LABEL_9:
    uint64_t v60 = (_OWORD *)v74;
    *(void *)(v74 + 32) = 0;
    *uint64_t v60 = 0u;
    v60[1] = 0u;
    return result;
  }
  uint64_t result = MEMORY[0x26118F420](v27);
  if (!*(void *)(result + 16)) {
    goto LABEL_11;
  }
  uint64_t v28 = v68;
  v72(v20, result + v71, v68);
  swift_bridgeObjectRelease();
  sub_25C6D57F0();
  uint64_t v29 = v20;
  uint64_t v30 = v28;
  uint64_t v31 = v28;
  uint64_t v32 = (uint64_t (*)(char *, uint64_t))v67;
  v67(v29, v31);
  v66(v12, *MEMORY[0x263F6CED8], v8);
  char v33 = sub_25C6A31C8((uint64_t)v14, (uint64_t)v12);
  v26(v12, v8);
  v26(v14, v8);
  uint64_t result = sub_25C6B9664(v75, (void (*)(void))type metadata accessor for GetContactAttributeSingleResultView);
  if (v33) {
    goto LABEL_9;
  }
  uint64_t result = MEMORY[0x26118F420](result);
  if (*(void *)(result + 16))
  {
    uint64_t v34 = v64;
    v72(v64, result + v71, v30);
    swift_bridgeObjectRelease();
    uint64_t v35 = sub_25C6D57C0();
    uint64_t v37 = v36;
    uint64_t result = v32(v34, v30);
    if (v37)
    {
      uint64_t v76 = v35;
      uint64_t v77 = v37;
      sub_25C6A401C();
      uint64_t v38 = sub_25C6D5EC0();
      uint64_t v40 = v39;
      char v42 = v41 & 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
      sub_25C6D5AF0();
      uint64_t v43 = sub_25C6D5E00();
      uint64_t v44 = (uint64_t)v62;
      __swift_storeEnumTagSinglePayload((uint64_t)v62, 1, 1, v43);
      sub_25C6D5E20();
      sub_25C6B9280(v44, &qword_26A5C6120);
      uint64_t v45 = sub_25C6D5EB0();
      uint64_t v47 = v46;
      char v49 = v48;
      swift_release();
      char v50 = v49 & 1;
      sub_25C6A4068(v38, v40, v42);
      swift_bridgeObjectRelease();
      uint64_t v76 = sub_25C6D6040();
      uint64_t v51 = sub_25C6D5EA0();
      uint64_t v53 = v52;
      char v55 = v54;
      uint64_t v57 = v56;
      sub_25C6A4068(v45, v47, v50);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v58 = MEMORY[0x263F77348];
      uint64_t v59 = (uint64_t *)v74;
      *(void *)(v74 + 24) = MEMORY[0x263F1A830];
      v59[4] = v58;
      uint64_t result = swift_allocObject();
      *uint64_t v59 = result;
      *(void *)(result + 16) = v51;
      *(void *)(result + 24) = v53;
      *(unsigned char *)(result + 32) = v55 & 1;
      *(void *)(result + 40) = v57;
      return result;
    }
    goto LABEL_9;
  }
LABEL_12:
  __break(1u);
  return result;
}

void GetContactAttributeSingleResultView.body.getter()
{
  OUTLINED_FUNCTION_23();
  uint64_t v3 = v2;
  type metadata accessor for GetContactAttributeSingleResultView();
  OUTLINED_FUNCTION_8_0();
  uint64_t v5 = v4;
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = sub_25C6D55B0();
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_7();
  uint64_t v72 = v10;
  uint64_t v78 = (uint64_t *)sub_25C6D5800();
  OUTLINED_FUNCTION_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_2();
  uint64_t v16 = v15 - v14;
  uint64_t v68 = sub_25C6D62E0();
  OUTLINED_FUNCTION_1();
  uint64_t v66 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_7();
  uint64_t v73 = v19;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6320);
  OUTLINED_FUNCTION_1();
  uint64_t v67 = v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_7();
  uint64_t v65 = v22;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6328);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_7();
  uint64_t v70 = v24;
  sub_25C6B3B90(v79);
  uint64_t v25 = v0 + *(int *)(v1 + 28);
  uint64_t ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  uint64_t v77 = v25 + *(int *)(ContactAttributeViewModel + 20);
  uint64_t v26 = MEMORY[0x26118F420]();
  if (!*(void *)(v26 + 16))
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v59 = v25;
  uint64_t v60 = v5;
  uint64_t v61 = v7;
  uint64_t v62 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = v3;
  unint64_t v75 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v27 = v78;
  uint64_t v76 = *(void (**)(uint64_t, unint64_t, uint64_t *))(v12 + 16);
  v76(v16, v26 + v75, v78);
  swift_bridgeObjectRelease();
  uint64_t v28 = v0;
  sub_25C6B2B74();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v33 = (v31 >> 40) & 1;
  uint64_t v74 = *(void (**)(uint64_t, uint64_t *))(v12 + 8);
  v74(v16, v27);
  uint64_t v95 = v30;
  char v97 = BYTE4(v32);
  int v96 = v32;
  char v98 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6050);
  sub_25C6AD768();
  uint64_t v34 = sub_25C6D5ED0();
  uint64_t v35 = sub_25C6ADA88(v30, v32, v33);
  uint64_t v99 = MEMORY[0x263F1B720];
  uint64_t v100 = MEMORY[0x263F774B0];
  uint64_t v95 = v34;
  if (!*(void *)(MEMORY[0x26118F420](v35) + 16))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v36 = OUTLINED_FUNCTION_34();
  uint64_t v37 = v78;
  ((void (*)(uint64_t))v76)(v36);
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_25C6B3860(v16, (uint64_t (*)(uint64_t))type metadata accessor for GetContactAttributeSingleResultView, (uint64_t (*)(uint64_t, unint64_t, void, unint64_t, uint64_t))sub_25C6B8218);
  uint64_t v40 = v39;
  unsigned int v41 = BYTE3(v39) & 1;
  v74(v16, v37);
  uint64_t v89 = v38;
  char v91 = BYTE2(v40);
  __int16 v90 = v40;
  char v92 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C60C0);
  sub_25C6B6328((uint64_t)&unk_26A5C60C8);
  uint64_t v42 = sub_25C6D5ED0();
  sub_25C6ADB60(v38, v40, v41);
  uint64_t v94 = MEMORY[0x263F774B0];
  uint64_t v93 = MEMORY[0x263F1B720];
  uint64_t v89 = v42;
  uint64_t v88 = 0;
  long long v86 = 0u;
  long long v87 = 0u;
  sub_25C6B43A0(&v85);
  sub_25C6B5438((uint64_t)&v84);
  uint64_t v83 = 0;
  long long v81 = 0u;
  long long v82 = 0u;
  sub_25C6D5830();
  sub_25C6D55A0();
  swift_bridgeObjectRelease();
  v80[3] = sub_25C6D61C0();
  v80[4] = MEMORY[0x263F77548];
  __swift_allocate_boxed_opaque_existential_1(v80);
  sub_25C6D61D0();
  uint64_t v43 = sub_25C6D62D0();
  if (*(void *)(MEMORY[0x26118F420](v43) + 16))
  {
    uint64_t v44 = OUTLINED_FUNCTION_34();
    uint64_t v45 = v78;
    ((void (*)(uint64_t))v76)(v44);
    swift_bridgeObjectRelease();
    sub_25C6A499C();
    uint64_t v46 = ((uint64_t (*)(uint64_t, uint64_t *))v74)(v16, v45);
    uint64_t v78 = &v58;
    MEMORY[0x270FA5388](v46);
    *(&v58 - 2) = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6330);
    unint64_t v47 = sub_25C6B94C4((uint64_t)&unk_26A5C6010);
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6338);
    unint64_t v49 = sub_25C6B6588();
    unint64_t v50 = sub_25C6AD694();
    v79[0] = v68;
    v79[1] = v48;
    v79[2] = MEMORY[0x263F8D310];
    v79[3] = v47;
    v79[4] = v49;
    v79[5] = v50;
    swift_getOpaqueTypeConformance2();
    uint64_t v51 = v65;
    sub_25C6D5F20();
    OUTLINED_FUNCTION_3();
    v52();
    uint64_t v53 = *(void *)(v59 + *(int *)(ContactAttributeViewModel + 28));
    uint64_t v54 = v67;
    uint64_t v55 = v69;
    uint64_t v56 = v70;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16))(v70, v51, v69);
    *(void *)(v56 + *(int *)(v71 + 36)) = v53;
    uint64_t v57 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
    swift_retain();
    v57(v51, v55);
    sub_25C6B9844();
    swift_allocObject();
    sub_25C6B9A04();
    sub_25C6B6A98();
    sub_25C6D5F90();
    swift_release();
    sub_25C6B9280(v56, &qword_26A5C6328);
    OUTLINED_FUNCTION_26();
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t type metadata accessor for GetContactAttributeSingleResultView()
{
  uint64_t result = qword_26A5C6360;
  if (!qword_26A5C6360) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25C6B62A4(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5(a1);
  if (!result)
  {
    uint64_t v6 = v5;
    uint64_t v7 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v7();
    v6();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25C6B6328(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_25C6B63A4()
{
  uint64_t ContactAttributeSingleResultView = type metadata accessor for GetContactAttributeSingleResultView();
  MEMORY[0x270FA5388](ContactAttributeSingleResultView - 8);
  sub_25C6B9844();
  swift_allocObject();
  sub_25C6B9A04();
  sub_25C6D62E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6338);
  sub_25C6B94C4((uint64_t)&unk_26A5C6010);
  sub_25C6B6588();
  sub_25C6AD694();
  sub_25C6D5FC0();
  return swift_release();
}

uint64_t sub_25C6B6580()
{
  return sub_25C6B63A4();
}

unint64_t sub_25C6B6588()
{
  unint64_t result = qword_26A5C6340;
  if (!qword_26A5C6340)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6338);
    sub_25C6AD654((uint64_t)&unk_26A5C6348);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6340);
  }
  return result;
}

uint64_t sub_25C6B6628@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25C6D5800();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeSingleResultView();
  type metadata accessor for GetContactAttributeViewModel();
  uint64_t result = MEMORY[0x26118F420]();
  if (*(void *)(result + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, result + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_25C6A48EC();
    uint64_t v9 = v8;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *a1 = v7;
    a1[1] = v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25C6B676C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25C6D5CE0();
  if (qword_26A5C5CC8 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_26A5C7B80;
  sub_25C6B6864(v12);
  uint64_t v4 = v12[0];
  uint64_t v5 = v12[1];
  if (qword_26A5C5CD0 != -1) {
    swift_once();
  }
  char v6 = sub_25C6D5DE0();
  uint64_t result = sub_25C6D5A80();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v11;
  *(unsigned char *)(a1 + 80) = 0;
  return result;
}

uint64_t sub_25C6B6864@<X0>(uint64_t *a1@<X8>)
{
  sub_25C6B3B90(v5);
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t v2 = sub_25C6D6220();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  sub_25C6B5438((uint64_t)v5);
  if (v6)
  {
    __swift_project_boxed_opaque_existential_1(v5, v6);
    uint64_t v3 = sub_25C6D6220();
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  }
  else
  {
    uint64_t result = sub_25C6B9280((uint64_t)v5, &qword_26A5C6370);
    uint64_t v3 = 0;
  }
  *a1 = v2;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C6B6934()
{
  uint64_t v0 = sub_25C6D58C0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeSingleResultView();
  type metadata accessor for GetContactAttributeViewModel();
  sub_25C6D57A0();
  uint64_t v4 = sub_25C6D5890();
  unint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_25C6B28C8(v4, v6);
  return sub_25C6A665C(v4, v6);
}

uint64_t sub_25C6B6A58()
{
  uint64_t ContactAttributeSingleResultView = type metadata accessor for GetContactAttributeSingleResultView();
  OUTLINED_FUNCTION_1_1(ContactAttributeSingleResultView);

  return sub_25C6B6934();
}

unint64_t sub_25C6B6A98()
{
  unint64_t result = qword_26A5C6358;
  if (!qword_26A5C6358)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6328);
    sub_25C6D62E0();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6330);
    sub_25C6B94C4((uint64_t)&unk_26A5C6010);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6338);
    sub_25C6B6588();
    sub_25C6AD694();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_25C6AD654((uint64_t)&qword_26A5C5FA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6358);
  }
  return result;
}

uint64_t sub_25C6B6C10()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for GetContactAttributeSingleResultView(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  unint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((void *)a1 + 1) = a2[1];
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    long long v11 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)&a1[v8 + 24] = v11;
    uint64_t v12 = v11;
    uint64_t v13 = **(void (***)(char *, uint64_t, uint64_t))(v11 - 8);
    uint64_t v14 = v5;
    v13(v9, v10, v12);
    uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
    uint64_t v16 = ContactAttributeViewModel[5];
    uint64_t v17 = &v9[v16];
    uint64_t v18 = v10 + v16;
    uint64_t v19 = sub_25C6D5870();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    uint64_t v20 = ContactAttributeViewModel[6];
    uint64_t v21 = &v9[v20];
    uint64_t v22 = v10 + v20;
    uint64_t v23 = sub_25C6D5AA0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    *(void *)&v9[ContactAttributeViewModel[7]] = *(void *)(v10 + ContactAttributeViewModel[7]);
    uint64_t v24 = *(int *)(a3 + 24);
    uint64_t v25 = &a1[v24];
    uint64_t v26 = (uint64_t)a2 + v24;
    swift_retain();
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  }
  return a1;
}

uint64_t destroy for GetContactAttributeSingleResultView(id *a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 20);
  __swift_destroy_boxed_opaque_existential_0(v4);
  uint64_t ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  uint64_t v6 = v4 + *(int *)(ContactAttributeViewModel + 20);
  uint64_t v7 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v4 + *(int *)(ContactAttributeViewModel + 24);
  uint64_t v9 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_release();
  uint64_t v10 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);

  return v12(v10, v11);
}

void *initializeWithCopy for GetContactAttributeSingleResultView(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  long long v11 = *(_OWORD *)(a2 + v8 + 24);
  *(_OWORD *)((char *)a1 + v8 + 24) = v11;
  uint64_t v12 = v11;
  uint64_t v13 = **(void (***)(char *, uint64_t, uint64_t))(v11 - 8);
  id v14 = v6;
  v13(v9, v10, v12);
  uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  uint64_t v16 = ContactAttributeViewModel[5];
  uint64_t v17 = &v9[v16];
  uint64_t v18 = v10 + v16;
  uint64_t v19 = sub_25C6D5870();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  uint64_t v20 = ContactAttributeViewModel[6];
  uint64_t v21 = &v9[v20];
  uint64_t v22 = v10 + v20;
  uint64_t v23 = sub_25C6D5AA0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  *(void *)&v9[ContactAttributeViewModel[7]] = *(void *)(v10 + ContactAttributeViewModel[7]);
  uint64_t v24 = *(int *)(a3 + 24);
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = a2 + v24;
  swift_retain();
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  return a1;
}

uint64_t assignWithCopy for GetContactAttributeSingleResultView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + v9), (uint64_t *)(a2 + v9));
  uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  uint64_t v13 = ContactAttributeViewModel[5];
  uint64_t v14 = v10 + v13;
  uint64_t v15 = v11 + v13;
  uint64_t v16 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = ContactAttributeViewModel[6];
  uint64_t v18 = v10 + v17;
  uint64_t v19 = v11 + v17;
  uint64_t v20 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  *(void *)(v10 + ContactAttributeViewModel[7]) = *(void *)(v11 + ContactAttributeViewModel[7]);
  swift_retain();
  swift_release();
  uint64_t v21 = *(int *)(a3 + 24);
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 24))(v22, v23, v24);
  return a1;
}

_OWORD *initializeWithTake for GetContactAttributeSingleResultView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  *((void *)v7 + 4) = *(void *)((char *)a2 + v6 + 32);
  long long v9 = *(_OWORD *)((char *)a2 + v6 + 16);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)((char *)a2 + v6);
  *((_OWORD *)v7 + 1) = v9;
  uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  uint64_t v11 = ContactAttributeViewModel[5];
  uint64_t v12 = &v7[v11];
  uint64_t v13 = &v8[v11];
  uint64_t v14 = sub_25C6D5870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = ContactAttributeViewModel[6];
  uint64_t v16 = &v7[v15];
  uint64_t v17 = &v8[v15];
  uint64_t v18 = sub_25C6D5AA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  *(void *)&v7[ContactAttributeViewModel[7]] = *(void *)&v8[ContactAttributeViewModel[7]];
  uint64_t v19 = *(int *)(a3 + 24);
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
  return a1;
}

uint64_t assignWithTake for GetContactAttributeSingleResultView(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  long long v9 = (char *)a2 + v7;
  __swift_destroy_boxed_opaque_existential_0(a1 + v7);
  long long v10 = *((_OWORD *)v9 + 1);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *((void *)v9 + 4);
  uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  uint64_t v12 = ContactAttributeViewModel[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = &v9[v12];
  uint64_t v15 = sub_25C6D5870();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = ContactAttributeViewModel[6];
  uint64_t v17 = v8 + v16;
  uint64_t v18 = &v9[v16];
  uint64_t v19 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  *(void *)(v8 + ContactAttributeViewModel[7]) = *(void *)&v9[ContactAttributeViewModel[7]];
  swift_release();
  uint64_t v20 = *(int *)(a3 + 24);
  uint64_t v21 = a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v23 - 8) + 40))(v21, v22, v23);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeSingleResultView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6B7544);
}

uint64_t sub_25C6B7544(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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
    type metadata accessor for GetContactAttributeViewModel();
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
      uint64_t v12 = *(int *)(a3 + 24);
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for GetContactAttributeSingleResultView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6B7614);
}

void *sub_25C6B7614(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *unint64_t result = a2;
  }
  else
  {
    type metadata accessor for GetContactAttributeViewModel();
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
      uint64_t v11 = *(int *)(a4 + 24);
    }
    return (void *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_25C6B76C0()
{
  type metadata accessor for GetContactAttributeViewModel();
  if (v0 <= 0x3F)
  {
    sub_25C6AF348();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_25C6B7794()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C6B77F0(char *a1, char *a2, char *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v66 = a5;
  uint64_t v67 = a3;
  uint64_t v70 = a1;
  uint64_t v71 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_25C6D5530();
  uint64_t v68 = *(void *)(v73 - 8);
  uint64_t v9 = *(void *)(v68 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v73);
  uint64_t v11 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v62 - v12;
  uint64_t v74 = type metadata accessor for SiriContactsGCAButtonStyle();
  MEMORY[0x270FA5388](v74);
  uint64_t v69 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  uint64_t v16 = *(void *)(ContactAttributeMultiResultView - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](ContactAttributeMultiResultView - 8);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63A0);
  uint64_t v72 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63A8);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v75 = v24;
  uint64_t v76 = v22;
  if (a4 >> 60 == 15)
  {
    uint64_t v63 = v16;
    uint64_t v64 = v20;
    uint64_t v65 = v18;
    uint64_t v25 = v13;
    uint64_t v67 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v26 = v68;
    sub_25C6A42C8(v66, (uint64_t)v8, &qword_26A5C68F0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v73) != 1)
    {
      unsigned int v41 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
      uint64_t v62 = v25;
      uint64_t v42 = v8;
      uint64_t v43 = v73;
      v41(v25, v42, v73);
      sub_25C6B9844();
      uint64_t v44 = v25;
      uint64_t v45 = v43;
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v11, v44, v43);
      unint64_t v46 = (v17
           + *(unsigned __int8 *)(v26 + 80)
           + ((*(unsigned __int8 *)(v63 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
      uint64_t v47 = swift_allocObject();
      sub_25C6B9A04();
      unint64_t v48 = v47 + v46;
      uint64_t v49 = v45;
      uint64_t v50 = ((uint64_t (*)(unint64_t, char *, uint64_t))v41)(v48, v11, v45);
      MEMORY[0x270FA5388](v50);
      uint64_t v51 = v71;
      *(&v62 - 2) = v70;
      *(&v62 - 1) = v51;
      sub_25C6D61C0();
      sub_25C6B94C4((uint64_t)&qword_26A5C5E00);
      uint64_t v52 = v64;
      sub_25C6D60C0();
      uint64_t v53 = (uint64_t)v69;
      sub_25C6AE538();
      unint64_t v54 = sub_25C6AD654((uint64_t)&unk_26A5C63B0);
      unint64_t v55 = sub_25C6B94C4((uint64_t)&unk_26A5C63B8);
      uint64_t v56 = v67;
      uint64_t v57 = v65;
      uint64_t v58 = v74;
      sub_25C6D5F80();
      sub_25C6B9664(v53, (void (*)(void))type metadata accessor for SiriContactsGCAButtonStyle);
      (*(void (**)(char *, uint64_t))(v72 + 8))(v52, v57);
      uint64_t v77 = v57;
      uint64_t v78 = v58;
      unint64_t v79 = v54;
      unint64_t v80 = v55;
      swift_getOpaqueTypeConformance2();
      uint64_t v59 = v76;
      uint64_t v60 = sub_25C6D5ED0();
      (*(void (**)(char *, uint64_t))(v75 + 8))(v56, v59);
      uint64_t v81 = v60;
      LOBYTE(v82) = 1;
      swift_retain();
      sub_25C6D5CF0();
      uint64_t v81 = v77;
      __int16 v82 = v78;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6098);
      sub_25C6AD9B8();
      sub_25C6D5CF0();
      swift_release();
      uint64_t v40 = v77;
      (*(void (**)(char *, uint64_t))(v68 + 8))(v62, v49);
      return v40;
    }
    sub_25C6B9280((uint64_t)v8, &qword_26A5C68F0);
    uint64_t v81 = 0;
    __int16 v82 = 256;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6098);
    sub_25C6AD9B8();
    sub_25C6D5CF0();
  }
  else
  {
    uint64_t v27 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25C6B9844();
    unint64_t v28 = (v17 + ((*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v29 = swift_allocObject();
    sub_25C6B9A04();
    uint64_t v30 = (void *)(v29 + v28);
    unint64_t v31 = v67;
    *uint64_t v30 = v67;
    v30[1] = a4;
    uint64_t v32 = MEMORY[0x270FA5388](v31);
    uint64_t v33 = v71;
    *(&v62 - 2) = v70;
    *(&v62 - 1) = v33;
    sub_25C6A6740(v32, a4);
    sub_25C6D61C0();
    sub_25C6B94C4((uint64_t)&qword_26A5C5E00);
    sub_25C6D60C0();
    uint64_t v34 = (uint64_t)v69;
    sub_25C6AE538();
    unint64_t v35 = sub_25C6AD654((uint64_t)&unk_26A5C63B0);
    unint64_t v36 = sub_25C6B94C4((uint64_t)&unk_26A5C63B8);
    uint64_t v37 = v74;
    sub_25C6D5F80();
    sub_25C6B9664(v34, (void (*)(void))type metadata accessor for SiriContactsGCAButtonStyle);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v20, v18);
    uint64_t v77 = v18;
    uint64_t v78 = v37;
    unint64_t v79 = v35;
    unint64_t v80 = v36;
    swift_getOpaqueTypeConformance2();
    uint64_t v38 = v76;
    uint64_t v39 = sub_25C6D5ED0();
    (*(void (**)(char *, uint64_t))(v75 + 8))(v27, v38);
    uint64_t v81 = v39;
    LOBYTE(v82) = 0;
    swift_retain();
    sub_25C6D5CF0();
    uint64_t v81 = v77;
    __int16 v82 = v78;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6098);
    sub_25C6AD9B8();
    sub_25C6D5CF0();
    swift_release();
  }
  return v77;
}

uint64_t sub_25C6B8218(char *a1, char *a2, char *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v66 = a5;
  uint64_t v67 = a3;
  uint64_t v70 = a1;
  uint64_t v71 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_25C6D5530();
  uint64_t v68 = *(void *)(v73 - 8);
  uint64_t v9 = *(void *)(v68 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v73);
  uint64_t v11 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v62 - v12;
  uint64_t v74 = type metadata accessor for SiriContactsGCAButtonStyle();
  MEMORY[0x270FA5388](v74);
  uint64_t v69 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ContactAttributeSingleResultView = type metadata accessor for GetContactAttributeSingleResultView();
  uint64_t v16 = *(void *)(ContactAttributeSingleResultView - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](ContactAttributeSingleResultView - 8);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63A0);
  uint64_t v72 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63A8);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v75 = v24;
  uint64_t v76 = v22;
  if (a4 >> 60 == 15)
  {
    uint64_t v63 = v16;
    uint64_t v64 = v20;
    uint64_t v65 = v18;
    uint64_t v25 = v13;
    uint64_t v67 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v26 = v68;
    sub_25C6A42C8(v66, (uint64_t)v8, &qword_26A5C68F0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v73) != 1)
    {
      unsigned int v41 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
      uint64_t v62 = v25;
      uint64_t v42 = v8;
      uint64_t v43 = v73;
      v41(v25, v42, v73);
      sub_25C6B9844();
      uint64_t v44 = v25;
      uint64_t v45 = v43;
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v11, v44, v43);
      unint64_t v46 = (v17
           + *(unsigned __int8 *)(v26 + 80)
           + ((*(unsigned __int8 *)(v63 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
      uint64_t v47 = swift_allocObject();
      sub_25C6B9A04();
      unint64_t v48 = v47 + v46;
      uint64_t v49 = v45;
      uint64_t v50 = ((uint64_t (*)(unint64_t, char *, uint64_t))v41)(v48, v11, v45);
      MEMORY[0x270FA5388](v50);
      uint64_t v51 = v71;
      *(&v62 - 2) = v70;
      *(&v62 - 1) = v51;
      sub_25C6D61C0();
      sub_25C6B94C4((uint64_t)&qword_26A5C5E00);
      uint64_t v52 = v64;
      sub_25C6D60C0();
      uint64_t v53 = (uint64_t)v69;
      sub_25C6AE538();
      unint64_t v54 = sub_25C6AD654((uint64_t)&unk_26A5C63B0);
      unint64_t v55 = sub_25C6B94C4((uint64_t)&unk_26A5C63B8);
      uint64_t v56 = v67;
      uint64_t v57 = v65;
      uint64_t v58 = v74;
      sub_25C6D5F80();
      sub_25C6B9664(v53, (void (*)(void))type metadata accessor for SiriContactsGCAButtonStyle);
      (*(void (**)(char *, uint64_t))(v72 + 8))(v52, v57);
      uint64_t v77 = v57;
      uint64_t v78 = v58;
      unint64_t v79 = v54;
      unint64_t v80 = v55;
      swift_getOpaqueTypeConformance2();
      uint64_t v59 = v76;
      uint64_t v60 = sub_25C6D5ED0();
      (*(void (**)(char *, uint64_t))(v75 + 8))(v56, v59);
      uint64_t v81 = v60;
      LOBYTE(v82) = 1;
      swift_retain();
      sub_25C6D5CF0();
      uint64_t v81 = v77;
      __int16 v82 = v78;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6098);
      sub_25C6AD9B8();
      sub_25C6D5CF0();
      swift_release();
      uint64_t v40 = v77;
      (*(void (**)(char *, uint64_t))(v68 + 8))(v62, v49);
      return v40;
    }
    sub_25C6B9280((uint64_t)v8, &qword_26A5C68F0);
    uint64_t v81 = 0;
    __int16 v82 = 256;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6098);
    sub_25C6AD9B8();
    sub_25C6D5CF0();
  }
  else
  {
    uint64_t v27 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25C6B9844();
    unint64_t v28 = (v17 + ((*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v29 = swift_allocObject();
    sub_25C6B9A04();
    uint64_t v30 = (void *)(v29 + v28);
    unint64_t v31 = v67;
    *uint64_t v30 = v67;
    v30[1] = a4;
    uint64_t v32 = MEMORY[0x270FA5388](v31);
    uint64_t v33 = v71;
    *(&v62 - 2) = v70;
    *(&v62 - 1) = v33;
    sub_25C6A6740(v32, a4);
    sub_25C6D61C0();
    sub_25C6B94C4((uint64_t)&qword_26A5C5E00);
    sub_25C6D60C0();
    uint64_t v34 = (uint64_t)v69;
    sub_25C6AE538();
    unint64_t v35 = sub_25C6AD654((uint64_t)&unk_26A5C63B0);
    unint64_t v36 = sub_25C6B94C4((uint64_t)&unk_26A5C63B8);
    uint64_t v37 = v74;
    sub_25C6D5F80();
    sub_25C6B9664(v34, (void (*)(void))type metadata accessor for SiriContactsGCAButtonStyle);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v20, v18);
    uint64_t v77 = v18;
    uint64_t v78 = v37;
    unint64_t v79 = v35;
    unint64_t v80 = v36;
    swift_getOpaqueTypeConformance2();
    uint64_t v38 = v76;
    uint64_t v39 = sub_25C6D5ED0();
    (*(void (**)(char *, uint64_t))(v75 + 8))(v27, v38);
    uint64_t v81 = v39;
    LOBYTE(v82) = 0;
    swift_retain();
    sub_25C6D5CF0();
    uint64_t v81 = v77;
    __int16 v82 = v78;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6098);
    sub_25C6AD9B8();
    sub_25C6D5CF0();
    swift_release();
  }
  return v77;
}

void sub_25C6B8C40(id *a1, uint64_t a2, unint64_t a3)
{
  sub_25C6A6700();
  sub_25C6A6740(a2, a3);
  uint64_t v6 = sub_25C6D65B0();
  if (v6)
  {
    if (*a1)
    {
      uint64_t v7 = (void *)v6;
      id v8 = *a1;
      sub_25C6D6340();

      uint64_t v9 = OUTLINED_FUNCTION_3_1();
      sub_25C6A6670(v9, v10);
    }
    else
    {
      sub_25C6D6350();
      sub_25C6B94C4((uint64_t)&qword_26A5C5E48);
      OUTLINED_FUNCTION_35();
      __break(1u);
    }
  }
  else
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_25C6D59F0();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A5C6B58);
    oslog = sub_25C6D59D0();
    os_log_type_t v12 = sub_25C6D65D0();
    if (os_log_type_enabled(oslog, v12))
    {
      uint64_t v13 = (_WORD *)swift_slowAlloc();
      *uint64_t v13 = 0;
      OUTLINED_FUNCTION_33(&dword_25C69F000, v14, v15, "#GetContactAttributeButtonableView could not convert direct invocation to actionable command", v16, v17, v18, v19, v22, oslog);
      MEMORY[0x261190AB0](v13, -1, -1);
    }
    uint64_t v20 = OUTLINED_FUNCTION_3_1();
    sub_25C6A6670(v20, v21);
  }
}

void sub_25C6B8E00()
{
  uint64_t v1 = OUTLINED_FUNCTION_20();
  v2(v1);
  sub_25C6D4FF8(v0);
}

uint64_t objectdestroyTm_1()
{
  type metadata accessor for GetContactAttributeSingleResultView();
  OUTLINED_FUNCTION_2_3();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  uint64_t v10 = v0 + v7;

  __swift_destroy_boxed_opaque_existential_0(v10 + *(int *)(v1 + 28));
  type metadata accessor for GetContactAttributeViewModel();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v11();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v12();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v13();

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_25C6B8F70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t ContactAttributeSingleResultView = type metadata accessor for GetContactAttributeSingleResultView();
  OUTLINED_FUNCTION_1_1(ContactAttributeSingleResultView);

  return sub_25C6B6628(a1);
}

uint64_t sub_25C6B8FC0@<X0>(uint64_t a1@<X8>)
{
  return sub_25C6B676C(a1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25C6B900C()
{
  sub_25C6A4068(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25C6B9050@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C6D5C20();
  *a1 = result;
  return result;
}

uint64_t sub_25C6B907C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C6D5C20();
  *a1 = result;
  return result;
}

uint64_t sub_25C6B90A8()
{
  return sub_25C6D5C30();
}

uint64_t sub_25C6B90D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25C6B52F8(a1, a2);
}

unint64_t sub_25C6B90E0()
{
  unint64_t result = qword_26A5C6388;
  if (!qword_26A5C6388)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C5DC0);
    sub_25C6A4080();
    sub_25C6AD654((uint64_t)&qword_26A5C5FA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6388);
  }
  return result;
}

uint64_t sub_25C6B9180@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25C6B5380(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_25C6B9188()
{
  unint64_t result = qword_26A5C6398;
  if (!qword_26A5C6398)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6390);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C5DE0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C5DC0);
    sub_25C6A4080();
    sub_25C6B90E0();
    swift_getOpaqueTypeConformance2();
    sub_25C6AD654((uint64_t)&qword_26A5C5FA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6398);
  }
  return result;
}

uint64_t sub_25C6B9280(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v3();
  return a1;
}

uint64_t sub_25C6B92CC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_25C6B92D8()
{
  type metadata accessor for GetContactAttributeSingleResultView();
  OUTLINED_FUNCTION_8_0();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = sub_25C6D5530();
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = (v4 + v6 + v12) & ~v12;
  uint64_t v19 = v13 + *(void *)(v11 + 64);
  uint64_t v14 = v3 | v12 | 7;

  __swift_destroy_boxed_opaque_existential_0(v0 + v4 + *(int *)(v1 + 28));
  type metadata accessor for GetContactAttributeViewModel();
  sub_25C6D5870();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v15();
  sub_25C6D5AA0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v16();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v17();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v13, v7);

  return MEMORY[0x270FA0238](v0, v19, v14);
}

void sub_25C6B9490()
{
}

uint64_t sub_25C6B94BC()
{
  return sub_25C6D1298(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_25C6B94C4(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_5(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_25C6B9508()
{
  OUTLINED_FUNCTION_23();
  type metadata accessor for GetContactAttributeSingleResultView();
  OUTLINED_FUNCTION_2_3();
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v5 = (*(void *)(v4 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;

  __swift_destroy_boxed_opaque_existential_0(v6 + *(int *)(v1 + 28));
  type metadata accessor for GetContactAttributeViewModel();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v7();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v8();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v9();
  sub_25C6A6670(*(void *)(v0 + v5), *(void *)(v0 + v5 + 8));
  OUTLINED_FUNCTION_26();
  return MEMORY[0x270FA0238](v10, v11, v12);
}

void sub_25C6B964C()
{
}

uint64_t sub_25C6B9664(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v3();
  return a1;
}

uint64_t sub_25C6B96B4(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return sub_25C6B92CC(result, a2, BYTE1(a2) & 1);
  }
  return result;
}

uint64_t sub_25C6B96C4(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t, uint64_t, void), uint64_t (*a5)(uint64_t, uint64_t, void), uint64_t (*a6)(uint64_t, uint64_t, void))
{
  if (a3) {
    return sub_25C6B970C(a1, a2, BYTE3(a2) & 1, a5, a6);
  }
  return a4(a1, a2, WORD1(a2) & 1);
}

uint64_t sub_25C6B9704(uint64_t a1, uint64_t a2)
{
  return sub_25C6B92CC(a1, a2, BYTE1(a2) & 1);
}

uint64_t sub_25C6B970C(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t, uint64_t, void), uint64_t (*a5)(uint64_t, uint64_t, void))
{
  if (a3) {
    return a5(a1, a2, WORD1(a2) & 1);
  }
  else {
    return a4(a1, a2, (a2 >> 8) & 1);
  }
}

uint64_t sub_25C6B9728(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t *sub_25C6B97A8(uint64_t *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    unsigned int v6 = (uint64_t *)(*(void *)(a5 + 56) + 16 * a2);
    uint64_t v7 = *v6;
    unint64_t v8 = v6[1];
    *unint64_t result = *v6;
    result[1] = v8;
    swift_bridgeObjectRetain();
    sub_25C6A6740(v7, v8);
    return (uint64_t *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_25C6B9844()
{
  uint64_t v1 = OUTLINED_FUNCTION_20();
  v2(v1);
  OUTLINED_FUNCTION_0();
  uint64_t v3 = OUTLINED_FUNCTION_4();
  v4(v3);
  return v0;
}

uint64_t sub_25C6B9890()
{
  OUTLINED_FUNCTION_23();
  uint64_t v1 = (int *)(type metadata accessor for GetContactAttributeMultiResultView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = *(void *)(*(void *)v1 + 64);
  uint64_t v4 = sub_25C6D5530();
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5;
  unint64_t v7 = (v2 + v3 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v8 = (id *)(v0 + v2);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8 + v1[7]);
  type metadata accessor for GetContactAttributeViewModel();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v9();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v10();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v4);
  OUTLINED_FUNCTION_26();
  return MEMORY[0x270FA0238](v11, v12, v13);
}

uint64_t sub_25C6B9A04()
{
  uint64_t v2 = OUTLINED_FUNCTION_20();
  v3(v2);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

void sub_25C6B9A5C()
{
}

void sub_25C6B9A88(uint64_t (*a1)(void))
{
  uint64_t v1 = a1(0);
  OUTLINED_FUNCTION_9_0(v1);
  uint64_t v2 = sub_25C6D5530();
  OUTLINED_FUNCTION_1_1(v2);
  sub_25C6B8E00();
}

uint64_t sub_25C6B9B14()
{
  type metadata accessor for GetContactAttributeMultiResultView();
  OUTLINED_FUNCTION_2_3();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v6 | 7;
  unint64_t v9 = (*(void *)(v5 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = v0 + v7;

  __swift_destroy_boxed_opaque_existential_0(v10 + *(int *)(v1 + 28));
  type metadata accessor for GetContactAttributeViewModel();
  sub_25C6D5870();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v11();
  sub_25C6D5AA0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v12();
  swift_release();
  sub_25C6A6670(*(void *)(v0 + v9), *(void *)(v0 + v9 + 8));

  return MEMORY[0x270FA0238](v0, v9 + 16, v8);
}

void sub_25C6B9C48()
{
}

void sub_25C6B9C60(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  OUTLINED_FUNCTION_9_0(v2);
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v8 = (*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_25C6B8C40((id *)(v1 + v7), *(void *)(v1 + v8), *(void *)(v1 + v8 + 8));
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return sub_25C6D5CF0();
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(*(void *)(v1 + 56) + 16 * a1);
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  return sub_25C6A6740(v4, v5);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return sub_25C6A665C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return 0x2E6567617373656DLL;
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_25C6D5870();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_25C6D5AA0();
}

void OUTLINED_FUNCTION_19_0(uint64_t a1@<X8>)
{
  *(void *)(v3 - 96) = a1;
  *(unsigned char *)(v3 - 86) = BYTE2(v2);
  *(_WORD *)(v3 - 88) = v1;
  *(unsigned char *)(v3 - 85) = 0;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_25C6B92CC(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(v4 - 176);
  return __swift_storeEnumTagSinglePayload(v6, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0 - 104;
}

void OUTLINED_FUNCTION_33(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t log)
{
  _os_log_impl(a1, log, v10, a4, v11, 2u);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_25C6D5BC0();
}

void OUTLINED_FUNCTION_36(uint64_t a1@<X8>)
{
  *(void *)(v4 - 104) = a1;
  *(_DWORD *)(v4 - 96) = v2 | v1;
  *(unsigned char *)(v4 - 92) = v3;
}

void OUTLINED_FUNCTION_37()
{
  *(void *)(v2 - 104) = v0;
  *(_WORD *)(v2 - 96) = v1 & 0x1FF;
  *(unsigned char *)(v2 - 94) = 0;
}

void sub_25C6B9FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_10_0();
  a17 = v19;
  a18 = v20;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v25 = v18;
  uint64_t ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  OUTLINED_FUNCTION_14_1();
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&a9 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v31 = *(id *)(v18 + *(int *)(v28 + 28) + 8);
  unint64_t v32 = v24();

  if (v32 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_25C6D67E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v33 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  sub_25C6C0394(v25, (uint64_t)v30);
  if (!v33)
  {
    id v34 = *(id *)&v30[*(int *)(ContactQuickActionButtonsView + 28) + 8];
    v22();

    swift_bridgeObjectRelease();
  }
  sub_25C6C112C((uint64_t)v30);
  OUTLINED_FUNCTION_7_2();
}

uint64_t sub_25C6BA0F4@<X0>(unsigned char *a1@<X8>)
{
  *a1 = sub_25C6D5DD0();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63F0);
  return sub_25C6BA138(v1, (uint64_t)&a1[*(int *)(v3 + 44)]);
}

uint64_t sub_25C6BA138@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v30 = a2;
  uint64_t ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  uint64_t v4 = *(void *)(ContactQuickActionButtonsView - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](ContactQuickActionButtonsView - 8);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63F8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v29 = (uint64_t)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v28 = (uint64_t)v25 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v27 = (char *)v25 - v13;
  MEMORY[0x270FA5388](v12);
  int v15 = (char *)v25 - v14;
  uint64_t v31 = sub_25C6D56B0();
  sub_25C6C0394(a1, (uint64_t)v6);
  unint64_t v16 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v25[1] = v16 + v5;
  uint64_t v17 = swift_allocObject();
  sub_25C6A4264((uint64_t)v6, v17 + v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6400);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6408);
  sub_25C6A41AC(&qword_26A5C6410, &qword_26A5C6400);
  sub_25C6C0414();
  sub_25C6C11D4(&qword_26A5C6440, MEMORY[0x263F6CE90]);
  sub_25C6D6130();
  uint64_t v31 = sub_25C6D56A0();
  sub_25C6C0394(v26, (uint64_t)v6);
  uint64_t v18 = swift_allocObject();
  sub_25C6A4264((uint64_t)v6, v18 + v16);
  uint64_t v19 = (uint64_t)v27;
  sub_25C6D6130();
  uint64_t v20 = v28;
  sub_25C6C28BC((uint64_t)v15, v28, &qword_26A5C63F8);
  uint64_t v21 = v29;
  sub_25C6C28BC(v19, v29, &qword_26A5C63F8);
  uint64_t v22 = v30;
  sub_25C6C28BC(v20, v30, &qword_26A5C63F8);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6448);
  sub_25C6C28BC(v21, v22 + *(int *)(v23 + 48), &qword_26A5C63F8);
  sub_25C6C2BEC(v19, &qword_26A5C63F8);
  sub_25C6C2BEC((uint64_t)v15, &qword_26A5C63F8);
  sub_25C6C2BEC(v21, &qword_26A5C63F8);
  return sub_25C6C2BEC(v20, &qword_26A5C63F8);
}

uint64_t sub_25C6BA4DC@<X0>(uint64_t a1@<X0>, id *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v31 = a3;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6450);
  uint64_t v28 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6428);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6408);
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (uint64_t)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  if (*a2)
  {
    uint64_t v12 = (char *)a2 + *(int *)(ContactQuickActionButtonsView + 28);
    char v13 = *(unsigned char *)(*((void *)v12 + 1)
                   + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_shouldUseLightBackground);
    id v14 = *a2;
    sub_25C6D6330();

    *uint64_t v9 = sub_25C6D6650() & 1;
    v9[1] = v13;
    uint64_t v15 = sub_25C6BA8C4(a1, (uint64_t)&v9[*(int *)(v7 + 56)]);
    unint64_t v16 = &v9[*(int *)(v7 + 60)];
    MEMORY[0x270FA5388](v15);
    *(&v26 - 2) = (uint64_t)a2;
    *(&v26 - 1) = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6458);
    sub_25C6A41AC(&qword_26A5C6460, &qword_26A5C6458);
    sub_25C6D60C0();
    uint64_t v17 = *(void *)(*((void *)v12 + 1)
                    + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_textColor);
    uint64_t v18 = v28;
    uint64_t v19 = v30;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v16, v6, v30);
    *(void *)&v16[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6468) + 36)] = v17;
    uint64_t v20 = *(void (**)(char *, uint64_t))(v18 + 8);
    swift_retain();
    v20(v6, v19);
    LOBYTE(v17) = sub_25C6BC4D4(a1);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v22 = swift_allocObject();
    *(unsigned char *)(v22 + 16) = v17 & 1;
    uint64_t v23 = v29;
    sub_25C6C28BC((uint64_t)v9, v29, &qword_26A5C6428);
    uint64_t v24 = (uint64_t *)(v23 + *(int *)(v27 + 36));
    *uint64_t v24 = KeyPath;
    v24[1] = (uint64_t)sub_25C6C3314;
    v24[2] = v22;
    sub_25C6C2BEC((uint64_t)v9, &qword_26A5C6428);
    return sub_25C6C10C4(v23, v31);
  }
  else
  {
    sub_25C6D6350();
    sub_25C6C11D4(&qword_26A5C5E48, MEMORY[0x263F77980]);
    uint64_t result = sub_25C6D5BC0();
    __break(1u);
  }
  return result;
}

uint64_t sub_25C6BA8C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v171 = a2;
  uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6470);
  uint64_t v143 = *(void *)(v154 - 8);
  MEMORY[0x270FA5388](v154);
  v142 = (char *)&v140 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6478);
  MEMORY[0x270FA5388](v151);
  uint64_t v152 = (uint64_t)&v140 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6480);
  MEMORY[0x270FA5388](v165);
  uint64_t v153 = (char *)&v140 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6488);
  uint64_t v141 = *(void *)(v149 - 8);
  MEMORY[0x270FA5388](v149);
  long long v140 = (char *)&v140 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6490);
  MEMORY[0x270FA5388](v168);
  uint64_t v170 = (uint64_t)&v140 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6498);
  MEMORY[0x270FA5388](v162);
  uint64_t v163 = (uint64_t)&v140 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64A0);
  MEMORY[0x270FA5388](v146);
  uint64_t v147 = (uint64_t)&v140 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64A8);
  MEMORY[0x270FA5388](v169);
  v158 = (char *)&v140 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64B0);
  MEMORY[0x270FA5388](v161);
  uint64_t v148 = (char *)&v140 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64B8);
  MEMORY[0x270FA5388](v167);
  uint64_t v164 = (char *)&v140 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64C0);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v144 = (char *)&v140 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v166 = (uint64_t)&v140 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v157 = (uint64_t)&v140 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v150 = (uint64_t)&v140 - v22;
  uint64_t ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  uint64_t v24 = *(void *)(ContactQuickActionButtonsView - 8);
  uint64_t v25 = *(void *)(v24 + 64);
  MEMORY[0x270FA5388](ContactQuickActionButtonsView);
  uint64_t v26 = (char *)&v140 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64C8);
  uint64_t v159 = *(void *)(v27 - 8);
  uint64_t v160 = v27;
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  uint64_t v145 = (char *)&v140 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  unint64_t v32 = (char *)&v140 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v156 = (char *)&v140 - v34;
  MEMORY[0x270FA5388](v33);
  uint64_t v155 = (char *)&v140 - v35;
  uint64_t v36 = sub_25C6D56C0();
  uint64_t v37 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v39 = (char *)&v140 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v39, a1, v36);
  int v40 = (*(uint64_t (**)(char *, uint64_t))(v37 + 88))(v39, v36);
  int v41 = *MEMORY[0x263F6CE78];
  uint64_t v172 = (void (*)(char *, uint64_t))v3;
  if (v40 == v41)
  {
    uint64_t v42 = (id *)&v3[*(int *)(ContactQuickActionButtonsView + 28)];
    id v43 = v42[1];
    uint64_t v44 = (char *)sub_25C6CB03C();

    uint64_t v173 = v44;
    sub_25C6C0394((uint64_t)v3, (uint64_t)&v140 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v45 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
    uint64_t v46 = swift_allocObject();
    uint64_t v150 = (uint64_t)&v140 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25C6A4264(v150, v46 + v45);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64D8);
    sub_25C6A41AC(&qword_26A5C64E0, &qword_26A5C64D0);
    sub_25C6A41AC(&qword_26A5C64E8, &qword_26A5C64D8);
    sub_25C6C11D4(&qword_26A5C64F0, MEMORY[0x263F6CE58]);
    uint64_t v155 = v32;
    sub_25C6D6130();
    id v47 = v42[1];
    uint64_t v48 = sub_25C6CB164();

    uint64_t v49 = *(void *)(v48 + 16);
    swift_bridgeObjectRelease();
    if (v49)
    {
      id v50 = v47;
      sub_25C6CB164();

      uint64_t v51 = swift_bridgeObjectRetain();
      uint64_t v52 = (char *)sub_25C6C1288(v51);
      swift_bridgeObjectRelease();
      uint64_t v173 = v52;
      sub_25C6C121C(&v173);
      uint64_t v53 = (uint64_t)v158;
      swift_bridgeObjectRelease();
      swift_getKeyPath();
      uint64_t v54 = v150;
      sub_25C6C0394((uint64_t)v172, v150);
      uint64_t v55 = swift_allocObject();
      sub_25C6A4264(v54, v55 + v45);
      uint64_t v56 = swift_allocObject();
      *(void *)(v56 + 16) = sub_25C6C16F8;
      *(void *)(v56 + 24) = v55;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64F8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6500);
      sub_25C6A41AC(&qword_26A5C6508, &qword_26A5C64F8);
      sub_25C6A41AC(&qword_26A5C6510, &qword_26A5C6500);
      uint64_t v57 = v166;
      sub_25C6D6120();
      uint64_t v58 = 0;
    }
    else
    {
      uint64_t v53 = (uint64_t)v158;
      uint64_t v58 = 1;
      uint64_t v57 = v166;
    }
    char v92 = v155;
    uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6518);
    __swift_storeEnumTagSinglePayload(v57, v58, 1, v93);
    uint64_t v94 = v159;
    uint64_t v95 = v160;
    int v96 = *(void (**)(char *, char *, uint64_t))(v159 + 16);
    char v97 = v156;
    v96(v156, v92, v160);
    uint64_t v98 = v57;
    uint64_t v99 = v157;
    sub_25C6C28BC(v98, v157, &qword_26A5C64C0);
    v96((char *)v53, v97, v95);
    uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6520);
    sub_25C6C28BC(v99, v53 + *(int *)(v100 + 48), &qword_26A5C64C0);
    sub_25C6C2BEC(v99, &qword_26A5C64C0);
    uint64_t v172 = *(void (**)(char *, uint64_t))(v94 + 8);
    v172(v97, v95);
    sub_25C6C28BC(v53, v152, &qword_26A5C64A8);
    swift_storeEnumTagMultiPayload();
    sub_25C6A41AC(&qword_26A5C6538, &qword_26A5C64A8);
    sub_25C6C15D4(&qword_26A5C6550, &qword_26A5C6470, &qword_26A5C6558, &qword_26A5C6560);
    uint64_t v101 = (uint64_t)v153;
    sub_25C6D5CF0();
    sub_25C6C2BEC(v53, &qword_26A5C64A8);
    sub_25C6C28BC(v101, v163, &qword_26A5C6480);
    swift_storeEnumTagMultiPayload();
    sub_25C6C1454();
    sub_25C6C1514();
    uint64_t v102 = (uint64_t)v164;
    sub_25C6D5CF0();
    sub_25C6C2BEC(v101, &qword_26A5C6480);
    sub_25C6C28BC(v102, v170, &qword_26A5C64B8);
    swift_storeEnumTagMultiPayload();
    sub_25C6C13D8();
    sub_25C6D5CF0();
    sub_25C6C2BEC(v102, &qword_26A5C64B8);
    sub_25C6C2BEC(v166, &qword_26A5C64C0);
    return ((uint64_t (*)(char *, uint64_t))v172)(v92, v95);
  }
  else
  {
    uint64_t v59 = (char *)&v140 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v40 == *MEMORY[0x263F6CE68])
    {
      uint64_t v60 = v172;
      uint64_t v61 = (id *)((char *)v172 + *(int *)(ContactQuickActionButtonsView + 28));
      id v62 = v61[1];
      uint64_t v63 = (char *)sub_25C6CB030();

      uint64_t v173 = v63;
      sub_25C6C0394((uint64_t)v60, (uint64_t)v26);
      unint64_t v64 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      uint64_t v65 = swift_allocObject();
      sub_25C6A4264((uint64_t)v26, v65 + v64);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64D0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64D8);
      sub_25C6A41AC(&qword_26A5C64E0, &qword_26A5C64D0);
      sub_25C6A41AC(&qword_26A5C64E8, &qword_26A5C64D8);
      sub_25C6C11D4(&qword_26A5C64F0, MEMORY[0x263F6CE58]);
      sub_25C6D6130();
      id v66 = v61[1];
      uint64_t v67 = sub_25C6CB13C();

      uint64_t v68 = *(void *)(v67 + 16);
      swift_bridgeObjectRelease();
      if (v68)
      {
        id v69 = v66;
        sub_25C6CB13C();

        uint64_t v70 = swift_bridgeObjectRetain();
        uint64_t v71 = (char *)sub_25C6C1288(v70);
        swift_bridgeObjectRelease();
        uint64_t v173 = v71;
        sub_25C6C121C(&v173);
        swift_bridgeObjectRelease();
        swift_getKeyPath();
        sub_25C6C0394((uint64_t)v172, (uint64_t)v26);
        uint64_t v72 = swift_allocObject();
        sub_25C6A4264((uint64_t)v26, v72 + v64);
        uint64_t v73 = swift_allocObject();
        *(void *)(v73 + 16) = sub_25C6C181C;
        *(void *)(v73 + 24) = v72;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64F8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6500);
        sub_25C6A41AC(&qword_26A5C6508, &qword_26A5C64F8);
        sub_25C6A41AC(&qword_26A5C6510, &qword_26A5C6500);
        uint64_t v74 = v150;
        sub_25C6D6120();
        uint64_t v75 = 0;
      }
      else
      {
        uint64_t v75 = 1;
        uint64_t v74 = v150;
      }
      uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6518);
      __swift_storeEnumTagSinglePayload(v74, v75, 1, v114);
      uint64_t v115 = v159;
      uint64_t v116 = v160;
      char v117 = *(void (**)(char *, char *, uint64_t))(v159 + 16);
      uint64_t v118 = v156;
      v117(v156, v155, v160);
      uint64_t v119 = v157;
      sub_25C6C28BC(v74, v157, &qword_26A5C64C0);
      uint64_t v120 = (uint64_t)v158;
      v117(v158, v118, v116);
      uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6520);
      sub_25C6C28BC(v119, v120 + *(int *)(v121 + 48), &qword_26A5C64C0);
      sub_25C6C2BEC(v119, &qword_26A5C64C0);
      uint64_t v122 = *(void (**)(char *, uint64_t))(v115 + 8);
      v122(v118, v116);
      sub_25C6C28BC(v120, v147, &qword_26A5C64A8);
      swift_storeEnumTagMultiPayload();
      sub_25C6A41AC(&qword_26A5C6538, &qword_26A5C64A8);
      sub_25C6C15D4(&qword_26A5C6540, &qword_26A5C6488, &qword_26A5C64E8, &qword_26A5C64D8);
      uint64_t v123 = (uint64_t)v148;
      sub_25C6D5CF0();
      sub_25C6C2BEC(v120, &qword_26A5C64A8);
      sub_25C6C28BC(v123, v163, &qword_26A5C64B0);
      swift_storeEnumTagMultiPayload();
      sub_25C6C1454();
      sub_25C6C1514();
      uint64_t v124 = (uint64_t)v164;
      sub_25C6D5CF0();
      sub_25C6C2BEC(v123, &qword_26A5C64B0);
      sub_25C6C28BC(v124, v170, &qword_26A5C64B8);
      swift_storeEnumTagMultiPayload();
      sub_25C6C13D8();
      sub_25C6D5CF0();
      sub_25C6C2BEC(v124, &qword_26A5C64B8);
      sub_25C6C2BEC(v150, &qword_26A5C64C0);
      return ((uint64_t (*)(char *, uint64_t))v122)(v155, v116);
    }
    else
    {
      if (v40 != *MEMORY[0x263F6CE88])
      {
        uint64_t v104 = v172;
        if (v40 == *MEMORY[0x263F6CE70])
        {
          id v105 = objc_msgSend(*(id *)((char *)v172 + *(int *)(ContactQuickActionButtonsView + 24)), sel_emailAddresses);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6568);
          uint64_t v106 = (char *)sub_25C6D64C0();

          uint64_t v173 = v106;
          swift_getKeyPath();
          sub_25C6C0394((uint64_t)v104, (uint64_t)v59);
          unint64_t v107 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
          uint64_t v108 = swift_allocObject();
          sub_25C6A4264((uint64_t)v59, v108 + v107);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6570);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64D8);
          sub_25C6A41AC(&qword_26A5C6580, &qword_26A5C6570);
          sub_25C6A41AC(&qword_26A5C64E8, &qword_26A5C64D8);
          uint64_t v109 = v140;
          sub_25C6D6120();
          uint64_t v110 = v141;
          uint64_t v111 = v149;
          (*(void (**)(uint64_t, char *, uint64_t))(v141 + 16))(v147, v109, v149);
          swift_storeEnumTagMultiPayload();
          sub_25C6A41AC(&qword_26A5C6538, &qword_26A5C64A8);
          sub_25C6C15D4(&qword_26A5C6540, &qword_26A5C6488, &qword_26A5C64E8, &qword_26A5C64D8);
          uint64_t v112 = (uint64_t)v148;
          sub_25C6D5CF0();
          uint64_t v113 = &qword_26A5C64B0;
          sub_25C6C28BC(v112, v163, &qword_26A5C64B0);
        }
        else
        {
          if (v40 != *MEMORY[0x263F6CE80])
          {
            uint64_t result = sub_25C6D6820();
            __break(1u);
            return result;
          }
          id v125 = objc_msgSend(*(id *)((char *)v172 + *(int *)(ContactQuickActionButtonsView + 24)), sel_postalAddresses);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6568);
          uint64_t v126 = (char *)sub_25C6D64C0();

          uint64_t v173 = v126;
          swift_getKeyPath();
          sub_25C6C0394((uint64_t)v104, (uint64_t)v59);
          unint64_t v127 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
          uint64_t v128 = swift_allocObject();
          sub_25C6A4264((uint64_t)v59, v128 + v127);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6570);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6560);
          sub_25C6A41AC(&qword_26A5C6578, &qword_26A5C6570);
          sub_25C6A41AC(&qword_26A5C6558, &qword_26A5C6560);
          uint64_t v109 = v142;
          sub_25C6D6120();
          uint64_t v110 = v143;
          uint64_t v111 = v154;
          (*(void (**)(uint64_t, char *, uint64_t))(v143 + 16))(v152, v109, v154);
          swift_storeEnumTagMultiPayload();
          sub_25C6A41AC(&qword_26A5C6538, &qword_26A5C64A8);
          sub_25C6C15D4(&qword_26A5C6550, &qword_26A5C6470, &qword_26A5C6558, &qword_26A5C6560);
          uint64_t v112 = (uint64_t)v153;
          sub_25C6D5CF0();
          uint64_t v113 = &qword_26A5C6480;
          sub_25C6C28BC(v112, v163, &qword_26A5C6480);
        }
        swift_storeEnumTagMultiPayload();
        sub_25C6C1454();
        sub_25C6C1514();
        uint64_t v129 = (uint64_t)v164;
        sub_25C6D5CF0();
        sub_25C6C2BEC(v112, v113);
        sub_25C6C28BC(v129, v170, &qword_26A5C64B8);
        swift_storeEnumTagMultiPayload();
        sub_25C6C13D8();
        sub_25C6D5CF0();
        sub_25C6C2BEC(v129, &qword_26A5C64B8);
        return (*(uint64_t (**)(char *, uint64_t))(v110 + 8))(v109, v111);
      }
      uint64_t v76 = v172;
      uint64_t v77 = (id *)((char *)v172 + *(int *)(ContactQuickActionButtonsView + 28));
      id v78 = v77[1];
      unint64_t v79 = (char *)sub_25C6CB108();

      uint64_t v173 = v79;
      sub_25C6C0394((uint64_t)v76, (uint64_t)v59);
      unint64_t v80 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      uint64_t v81 = swift_allocObject();
      sub_25C6A4264((uint64_t)v59, v81 + v80);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64D0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64D8);
      sub_25C6A41AC(&qword_26A5C64E0, &qword_26A5C64D0);
      sub_25C6A41AC(&qword_26A5C64E8, &qword_26A5C64D8);
      sub_25C6C11D4(&qword_26A5C64F0, MEMORY[0x263F6CE58]);
      sub_25C6D6130();
      id v82 = v77[1];
      uint64_t v83 = sub_25C6CB18C();

      uint64_t v84 = *(void *)(v83 + 16);
      swift_bridgeObjectRelease();
      if (v84)
      {
        id v85 = v82;
        sub_25C6CB18C();

        uint64_t v86 = swift_bridgeObjectRetain();
        long long v87 = (char *)sub_25C6C1288(v86);
        swift_bridgeObjectRelease();
        uint64_t v173 = v87;
        sub_25C6C121C(&v173);
        swift_bridgeObjectRelease();
        swift_getKeyPath();
        sub_25C6C0394((uint64_t)v172, (uint64_t)v59);
        uint64_t v88 = swift_allocObject();
        sub_25C6A4264((uint64_t)v59, v88 + v80);
        uint64_t v89 = swift_allocObject();
        *(void *)(v89 + 16) = sub_25C6C1370;
        *(void *)(v89 + 24) = v88;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64F8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6500);
        sub_25C6A41AC(&qword_26A5C6508, &qword_26A5C64F8);
        sub_25C6A41AC(&qword_26A5C6510, &qword_26A5C6500);
        uint64_t v90 = (uint64_t)v144;
        sub_25C6D6120();
        uint64_t v91 = 0;
      }
      else
      {
        uint64_t v91 = 1;
        uint64_t v90 = (uint64_t)v144;
      }
      uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6518);
      __swift_storeEnumTagSinglePayload(v90, v91, 1, v130);
      uint64_t v132 = v159;
      uint64_t v131 = v160;
      double v133 = *(void (**)(char *, char *, uint64_t))(v159 + 16);
      uint64_t v134 = v156;
      uint64_t v135 = v145;
      v133(v156, v145, v160);
      uint64_t v136 = v157;
      sub_25C6C28BC(v90, v157, &qword_26A5C64C0);
      uint64_t v137 = (uint64_t)v158;
      v133(v158, v134, v131);
      uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6520);
      sub_25C6C28BC(v136, v137 + *(int *)(v138 + 48), &qword_26A5C64C0);
      sub_25C6C2BEC(v136, &qword_26A5C64C0);
      uint64_t v139 = *(void (**)(char *, uint64_t))(v132 + 8);
      v139(v134, v131);
      sub_25C6C28BC(v137, v170, &qword_26A5C64A8);
      swift_storeEnumTagMultiPayload();
      sub_25C6C13D8();
      sub_25C6A41AC(&qword_26A5C6538, &qword_26A5C64A8);
      sub_25C6D5CF0();
      sub_25C6C2BEC(v137, &qword_26A5C64A8);
      sub_25C6C2BEC(v90, &qword_26A5C64C0);
      return ((uint64_t (*)(char *, uint64_t))v139)(v135, v131);
    }
  }
}

#error "25C6BC678: call analysis failed (funcsize=164)"

uint64_t sub_25C6BC774@<X0>(uint64_t a1@<X0>, id *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v31 = a3;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6450);
  uint64_t v28 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6428);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6408);
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (uint64_t)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  if (*a2)
  {
    uint64_t v12 = (char *)a2 + *(int *)(ContactQuickActionButtonsView + 28);
    char v13 = *(unsigned char *)(*((void *)v12 + 1)
                   + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_shouldUseLightBackground);
    id v14 = *a2;
    sub_25C6D6330();

    *uint64_t v9 = sub_25C6D6650() & 1;
    v9[1] = v13;
    uint64_t v15 = sub_25C6BA8C4(a1, (uint64_t)&v9[*(int *)(v7 + 56)]);
    uint64_t v16 = &v9[*(int *)(v7 + 60)];
    MEMORY[0x270FA5388](v15);
    *(&v26 - 2) = (uint64_t)a2;
    *(&v26 - 1) = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6458);
    sub_25C6A41AC(&qword_26A5C6460, &qword_26A5C6458);
    sub_25C6D60C0();
    uint64_t v17 = *(void *)(*((void *)v12 + 1)
                    + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_textColor);
    uint64_t v18 = v28;
    uint64_t v19 = v30;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v16, v6, v30);
    *(void *)&v16[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6468) + 36)] = v17;
    uint64_t v20 = *(void (**)(char *, uint64_t))(v18 + 8);
    swift_retain();
    v20(v6, v19);
    LOBYTE(v17) = sub_25C6BC4D4(a1);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v22 = swift_allocObject();
    *(unsigned char *)(v22 + 16) = v17 & 1;
    uint64_t v23 = v29;
    sub_25C6C28BC((uint64_t)v9, v29, &qword_26A5C6428);
    uint64_t v24 = (uint64_t *)(v23 + *(int *)(v27 + 36));
    *uint64_t v24 = KeyPath;
    v24[1] = (uint64_t)sub_25C6C10AC;
    v24[2] = v22;
    sub_25C6C2BEC((uint64_t)v9, &qword_26A5C6428);
    return sub_25C6C10C4(v23, v31);
  }
  else
  {
    sub_25C6D6350();
    sub_25C6C11D4(&qword_26A5C5E48, MEMORY[0x263F77980]);
    uint64_t result = sub_25C6D5BC0();
    __break(1u);
  }
  return result;
}

uint64_t sub_25C6BCB5C(uint64_t a1)
{
  id v1 = *(id *)(a1 + *(int *)(type metadata accessor for GetContactQuickActionButtonsView(0) + 28) + 8);
  sub_25C6CB3B8();

  sub_25C6D109C();
  sub_25C6A401C();
  return sub_25C6D6080();
}

uint64_t sub_25C6BCC04()
{
  return sub_25C6D6070();
}

uint64_t sub_25C6BCCC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C6D6060();
  *a1 = result;
  return result;
}

uint64_t sub_25C6BCCF8@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25C6D67E0();
    if (v4) {
      goto LABEL_3;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4) {
    goto LABEL_7;
  }
LABEL_3:
  sub_25C6AA7B0(0, (a1 & 0xC000000000000001) == 0, a1);
  if ((a1 & 0xC000000000000001) != 0) {
    id v5 = (id)MEMORY[0x261190350](0, a1);
  }
  else {
    id v5 = *(id *)(a1 + 32);
  }
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  sub_25C6D5630();

LABEL_8:
  sub_25C6D6450();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  if (!v8 && v4)
  {
    sub_25C6AA7B0(0, (a1 & 0xC000000000000001) == 0, a1);
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      id v9 = (id)MEMORY[0x261190350](0, a1);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v9 = *(id *)(a1 + 32);
    }
    sub_25C6D5670();
  }
  sub_25C6A401C();
  uint64_t result = sub_25C6D5EC0();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v12 & 1;
  *(void *)(a2 + 24) = v13;
  return result;
}

uint64_t sub_25C6BCE8C(void **a1, uint64_t a2)
{
  uint64_t ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  uint64_t v5 = *(void *)(ContactQuickActionButtonsView - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](ContactQuickActionButtonsView - 8);
  uint64_t v7 = *a1;
  sub_25C6C0394(a2, (uint64_t)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  sub_25C6A4264((uint64_t)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v9 + v8);
  *(void *)(v9 + ((v6 + v8 + 7) & 0xFFFFFFFFFFFFFFF8)) = v7;
  uint64_t v13 = a2;
  id v14 = v7;
  id v10 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65F0);
  sub_25C6A41AC(&qword_26A5C65F8, &qword_26A5C65F0);
  return sub_25C6D60C0();
}

uint64_t sub_25C6BD014@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65B8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65C8);
  sub_25C6A41AC(&qword_26A5C65D0, &qword_26A5C65C8);
  sub_25C6D5A90();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v7 + 16))(a3, v9, v6);
  uint64_t v11 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6618) + 36);
  *(void *)uint64_t v11 = KeyPath;
  *(unsigned char *)(v11 + 8) = 0;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_25C6BD198@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = *(id *)(a1 + *(int *)(type metadata accessor for GetContactQuickActionButtonsView(0) + 28) + 8);
  id v6 = objc_msgSend(a2, sel_identifier);
  sub_25C6D63D0();

  uint64_t v7 = sub_25C6CB4F8();
  unint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = 0xE000000000000000;
  if (v9) {
    unint64_t v11 = v9;
  }
  uint64_t v27 = v10;
  unint64_t v28 = v11;
  sub_25C6A401C();
  uint64_t v12 = sub_25C6D5EC0();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  id v19 = objc_msgSend(a2, sel_value, v27, v28);
  sub_25C6D63D0();

  uint64_t v20 = sub_25C6D5EC0();
  uint64_t v22 = v21;
  char v24 = v23 & 1;
  *(void *)a3 = v12;
  *(void *)(a3 + 8) = v14;
  *(unsigned char *)(a3 + 16) = v18;
  *(void *)(a3 + 24) = v16;
  *(void *)(a3 + 32) = v20;
  *(void *)(a3 + 40) = v21;
  *(unsigned char *)(a3 + 48) = v23 & 1;
  *(void *)(a3 + 56) = v25;
  sub_25C6ADC54(v12, v14, v18);
  swift_bridgeObjectRetain();
  sub_25C6ADC54(v20, v22, v24);
  swift_bridgeObjectRetain();
  sub_25C6A4068(v20, v22, v24);
  swift_bridgeObjectRelease();
  sub_25C6A4068(v12, v14, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C6BD360@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C6D6060();
  *a1 = result;
  return result;
}

uint64_t sub_25C6BD39C(void *a1, uint64_t a2)
{
  uint64_t v5 = OUTLINED_FUNCTION_0_4();
  uint64_t v7 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_9_1(v8, v9, v10, v11, v12, v13, v14, v15, v19);
  uint64_t v16 = OUTLINED_FUNCTION_4_2();
  sub_25C6A4264(v2, v16 + a2);
  *(void *)(v16 + v7) = a1;
  id v17 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65F0);
  sub_25C6A41AC(&qword_26A5C65F8, &qword_26A5C65F0);
  return OUTLINED_FUNCTION_12_1();
}

void sub_25C6BD488(id *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DB0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v29 - v6;
  id v8 = objc_retain(*(id *)((char *)a1
                         + *(int *)(type metadata accessor for GetContactQuickActionButtonsView(0) + 28)
                         + 8));
  uint64_t v9 = sub_25C6D58B0();

  uint64_t v10 = sub_25C6D5640();
  if (*(void *)(v9 + 16) && (unint64_t v12 = sub_25C6CA89C(v10, v11), (v13 & 1) != 0))
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v9 + 56) + 16 * v12);
    uint64_t v16 = *v14;
    unint64_t v15 = v14[1];
    sub_25C6A6740(*v14, v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25C6A6700();
    uint64_t v17 = sub_25C6D65B0();
    if (v17)
    {
      char v18 = (void *)v17;
      uint64_t v19 = sub_25C6D56C0();
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v19);
      sub_25C6C28BC((uint64_t)v7, (uint64_t)v5, &qword_26A5C5DB0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
      sub_25C6D60A0();
      sub_25C6C2BEC((uint64_t)v7, &qword_26A5C5DB0);
      if (*a1)
      {
        id v20 = *a1;
        id v21 = v18;
        sub_25C6D6340();

        sub_25C6A6670(v16, v15);
      }
      else
      {
        sub_25C6D6350();
        sub_25C6C11D4(&qword_26A5C5E48, MEMORY[0x263F77980]);
        sub_25C6D5BC0();
        __break(1u);
      }
      return;
    }
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_25C6D59F0();
    __swift_project_value_buffer(v25, (uint64_t)qword_26A5C6B58);
    os_log_t v30 = (os_log_t)sub_25C6D59D0();
    os_log_type_t v26 = sub_25C6D65D0();
    if (os_log_type_enabled(v30, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_25C69F000, v30, v26, "#GetContactQuickActionButtonsView could not convert direct invocation to actionable command", v27, 2u);
      MEMORY[0x261190AB0](v27, -1, -1);
    }
    sub_25C6A6670(v16, v15);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25C6D59F0();
    __swift_project_value_buffer(v22, (uint64_t)qword_26A5C6B58);
    os_log_t v30 = (os_log_t)sub_25C6D59D0();
    os_log_type_t v23 = sub_25C6D65D0();
    if (os_log_type_enabled(v30, v23))
    {
      char v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v24 = 0;
      _os_log_impl(&dword_25C69F000, v30, v23, "#GetContactQuickActionButtonsView could not obtain direct invocation for button press", v24, 2u);
      MEMORY[0x261190AB0](v24, -1, -1);
    }
  }
  os_log_t v28 = v30;
}

uint64_t sub_25C6BD884()
{
  return sub_25C6D6070();
}

void sub_25C6BD930()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65B8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[2] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65C8);
  sub_25C6A41AC(&qword_26A5C65D0, &qword_26A5C65C8);
  sub_25C6D5A90();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(v3, v7, v4);
  uint64_t v9 = v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6618) + 36);
  *(void *)uint64_t v9 = KeyPath;
  *(unsigned char *)(v9 + 8) = 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_7_2();
}

void sub_25C6BDAA4()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v4);
  v11[1] = v3;
  sub_25C6C0394(v1, (uint64_t)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  sub_25C6A4264((uint64_t)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C64D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65A0);
  sub_25C6A41AC(&qword_26A5C64E0, &qword_26A5C64D0);
  sub_25C6A41AC(&qword_26A5C6598, &qword_26A5C65A0);
  sub_25C6C11D4(&qword_26A5C64F0, MEMORY[0x263F6CE58]);
  sub_25C6D6130();
  OUTLINED_FUNCTION_7_2();
}

uint64_t sub_25C6BDC54(void **a1, uint64_t a2)
{
  uint64_t ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  uint64_t v5 = *(void *)(ContactQuickActionButtonsView - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](ContactQuickActionButtonsView - 8);
  uint64_t v7 = *a1;
  sub_25C6C0394(a2, (uint64_t)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  sub_25C6A4264((uint64_t)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v9 + v8);
  char v13 = v7;
  id v10 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65A8);
  sub_25C6A41AC(&qword_26A5C65B0, &qword_26A5C65A8);
  return sub_25C6D60C0();
}

void sub_25C6BDDC8(uint64_t a1, void **a2)
{
  uint64_t v3 = sub_25C6D5570();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25C6D5530();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v45 - v15;
  sub_25C6D5650();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) == 1)
  {
    sub_25C6C2BEC((uint64_t)v9, &qword_26A5C68F0);
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_25C6D59F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_26A5C6B58);
    char v18 = sub_25C6D59D0();
    os_log_type_t v19 = sub_25C6D65C0();
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v20 = 0;
      _os_log_impl(&dword_25C69F000, v18, v19, "#GetContactQuickActionButtonsView message tapped but no URL available", v20, 2u);
      MEMORY[0x261190AB0](v20, -1, -1);
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v48 = v6;
    uint64_t v49 = v4;
    uint64_t v21 = sub_25C6D59F0();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A5C6B58);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
    uint64_t v22 = sub_25C6D59D0();
    os_log_type_t v23 = sub_25C6D65C0();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v50 = v3;
    if (v24)
    {
      uint64_t v25 = swift_slowAlloc();
      id v47 = a2;
      os_log_type_t v26 = (uint8_t *)v25;
      uint64_t v27 = swift_slowAlloc();
      uint64_t v52 = v27;
      *(_DWORD *)os_log_type_t v26 = 136315138;
      uint64_t v46 = v11;
      uint64_t v28 = sub_25C6D5500();
      uint64_t v51 = sub_25C6A9FE8(v28, v29, &v52);
      uint64_t v30 = v46;
      sub_25C6D6700();
      swift_bridgeObjectRelease();
      uint64_t v31 = *(void (**)(char *, uint64_t))(v30 + 8);
      v31(v14, v10);
      _os_log_impl(&dword_25C69F000, v22, v23, "#GetContactQuickActionButtonsView opening URL %s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261190AB0](v27, -1, -1);
      unint64_t v32 = v26;
      a2 = v47;
      MEMORY[0x261190AB0](v32, -1, -1);
    }
    else
    {
      uint64_t v31 = *(void (**)(char *, uint64_t))(v11 + 8);
      v31(v14, v10);
    }

    id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
    sub_25C6C23E4(v33);
    uint64_t v35 = v34;
    swift_bridgeObjectRelease();
    if (!v35)
    {
      id v36 = v33;
      uint64_t v37 = v48;
      sub_25C6D5560();
      uint64_t v38 = sub_25C6D5550();
      uint64_t v40 = v39;
      (*(void (**)(char *, uint64_t))(v49 + 8))(v37, v50);
      sub_25C6C2454(v38, v40, v36);
    }
    int v41 = (void *)sub_25C6D5510();
    objc_msgSend(v33, sel_setPunchOutUri_, v41);

    uint64_t v42 = *a2;
    if (*a2)
    {
      id v43 = v33;
      id v44 = v42;
      sub_25C6D6340();

      v31(v16, v10);
    }
    else
    {
      sub_25C6D6350();
      sub_25C6C11D4(&qword_26A5C5E48, MEMORY[0x263F77980]);
      sub_25C6D5BC0();
      __break(1u);
    }
  }
}

uint64_t sub_25C6BE374()
{
  return sub_25C6D6070();
}

uint64_t sub_25C6BE430()
{
  return sub_25C6D5A90();
}

uint64_t sub_25C6BE4B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C6D6060();
  *a1 = result;
  return result;
}

void sub_25C6BE4F4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_identifier);
  uint64_t v4 = sub_25C6D63D0();
  uint64_t v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

uint64_t sub_25C6BE54C(void **a1, uint64_t a2)
{
  uint64_t ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  uint64_t v5 = *(void *)(ContactQuickActionButtonsView - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](ContactQuickActionButtonsView - 8);
  uint64_t v7 = *a1;
  sub_25C6C0394(a2, (uint64_t)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  sub_25C6A4264((uint64_t)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v9 + v8);
  *(void *)(v9 + ((v6 + v8 + 7) & 0xFFFFFFFFFFFFFFF8)) = v7;
  uint64_t v13 = a2;
  uint64_t v14 = v7;
  id v10 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6620);
  sub_25C6A41AC(&qword_26A5C6628, &qword_26A5C6620);
  return sub_25C6D60C0();
}

void sub_25C6BE6D4()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v1 = v0;
  id v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DB0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v36 - v10;
  id v12 = objc_retain(*(id *)((char *)v5
                          + *(int *)(type metadata accessor for GetContactQuickActionButtonsView(0) + 28)
                          + 8));
  uint64_t v13 = v1();

  id v14 = objc_msgSend(v3, sel_identifier);
  uint64_t v15 = sub_25C6D63D0();
  uint64_t v17 = v16;

  if (*(void *)(v13 + 16) && (unint64_t v18 = sub_25C6CA89C(v15, v17), (v19 & 1) != 0))
  {
    id v20 = (uint64_t *)(*(void *)(v13 + 56) + 16 * v18);
    uint64_t v22 = *v20;
    unint64_t v21 = v20[1];
    sub_25C6A6740(*v20, v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25C6A6700();
    uint64_t v23 = sub_25C6D65B0();
    if (v23)
    {
      BOOL v24 = (void *)v23;
      uint64_t v25 = sub_25C6D56C0();
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v25);
      sub_25C6C28BC((uint64_t)v11, (uint64_t)v9, &qword_26A5C5DB0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
      sub_25C6D60A0();
      sub_25C6C2BEC((uint64_t)v11, &qword_26A5C5DB0);
      if (*v5)
      {
        id v26 = *v5;
        id v27 = v24;
        sub_25C6D6340();

        sub_25C6A6670(v22, v21);
        OUTLINED_FUNCTION_7_2();
      }
      else
      {
        sub_25C6D6350();
        sub_25C6C11D4(&qword_26A5C5E48, MEMORY[0x263F77980]);
        sub_25C6D5BC0();
        __break(1u);
      }
      return;
    }
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_25C6D59F0();
    __swift_project_value_buffer(v31, (uint64_t)qword_26A5C6B58);
    os_log_t v37 = (os_log_t)sub_25C6D59D0();
    os_log_type_t v32 = sub_25C6D65D0();
    if (os_log_type_enabled(v37, v32))
    {
      id v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v33 = 0;
      _os_log_impl(&dword_25C69F000, v37, v32, "#GetContactQuickActionButtonsView could not convert direct invocation to actionable command", v33, 2u);
      MEMORY[0x261190AB0](v33, -1, -1);
    }
    sub_25C6A6670(v22, v21);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_25C6D59F0();
    __swift_project_value_buffer(v28, (uint64_t)qword_26A5C6B58);
    os_log_t v37 = (os_log_t)sub_25C6D59D0();
    os_log_type_t v29 = sub_25C6D65D0();
    if (os_log_type_enabled(v37, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_25C69F000, v37, v29, "#GetContactQuickActionButtonsView could not obtain direct invocation for button press", v30, 2u);
      MEMORY[0x261190AB0](v30, -1, -1);
    }
  }
  OUTLINED_FUNCTION_7_2();
}

uint64_t sub_25C6BEAE0(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4)
{
  return sub_25C6D6070();
}

uint64_t sub_25C6BEB88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t)@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = sub_25C6D5CE0();
  *(void *)(a5 + 8) = 0;
  *(unsigned char *)(a5 + 16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return a4(a1, a2);
}

uint64_t sub_25C6BEBF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6648);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6650);
  sub_25C6A41AC(&qword_26A5C6658, &qword_26A5C6650);
  sub_25C6D5A90();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v7 + 16))(a3, v9, v6);
  uint64_t v11 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6660) + 36);
  *(void *)uint64_t v11 = KeyPath;
  *(unsigned char *)(v11 + 8) = 0;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_25C6BED7C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = *(id *)(a1 + *(int *)(type metadata accessor for GetContactQuickActionButtonsView(0) + 28) + 8);
  id v6 = objc_msgSend(a2, sel_identifier);
  sub_25C6D63D0();

  sub_25C6CB4F8();
  swift_bridgeObjectRelease();
  sub_25C6A401C();
  uint64_t v7 = sub_25C6D5EC0();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_25C6D65F0();
  uint64_t v14 = sub_25C6D5EC0();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a3 = v7;
  *(void *)(a3 + 8) = v9;
  *(unsigned char *)(a3 + 16) = v13;
  *(void *)(a3 + 24) = v11;
  *(void *)(a3 + 32) = v14;
  *(void *)(a3 + 40) = v16;
  *(unsigned char *)(a3 + 48) = v20;
  *(void *)(a3 + 56) = v18;
  *(void *)(a3 + 64) = KeyPath;
  *(void *)(a3 + 72) = 0;
  *(unsigned char *)(a3 + 80) = 1;
  sub_25C6ADC54(v7, v9, v13);
  swift_bridgeObjectRetain();
  sub_25C6ADC54(v14, v16, v20);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25C6A4068(v14, v16, v20);
  swift_release();
  swift_bridgeObjectRelease();
  sub_25C6A4068(v7, v9, v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C6BEF4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C6D6060();
  *a1 = result;
  return result;
}

void sub_25C6BEF8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_10_0();
  a17 = v18;
  a18 = v19;
  uint64_t v21 = v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DB0);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v25 = (char *)&a9 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  id v27 = (char *)&a9 - v26;
  uint64_t v28 = sub_25C6D56C0();
  __swift_storeEnumTagSinglePayload((uint64_t)v27, 1, 1, v28);
  type metadata accessor for GetContactQuickActionButtonsView(0);
  sub_25C6C28BC((uint64_t)v27, (uint64_t)v25, &qword_26A5C5DB0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
  sub_25C6D60A0();
  sub_25C6C2BEC((uint64_t)v27, &qword_26A5C5DB0);
  OUTLINED_FUNCTION_5_2();
  uint64_t v30 = *(void (**)(uint64_t))(v29 + 520);
  id v32 = v31;
  v30(v21);

  OUTLINED_FUNCTION_7_2();
}

void sub_25C6BF0D8(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_25C6D5CE0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6610);
  sub_25C6BD930();
}

uint64_t sub_25C6BF138()
{
  return sub_25C6D5E50();
}

uint64_t sub_25C6BF1E4(void *a1, uint64_t a2)
{
  uint64_t v5 = OUTLINED_FUNCTION_0_4();
  uint64_t v7 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_9_1(v8, v9, v10, v11, v12, v13, v14, v15, v19);
  uint64_t v16 = OUTLINED_FUNCTION_4_2();
  sub_25C6A4264(v2, v16 + a2);
  *(void *)(v16 + v7) = a1;
  id v17 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65A8);
  sub_25C6A41AC(&qword_26A5C65B0, &qword_26A5C65A8);
  return OUTLINED_FUNCTION_12_1();
}

void sub_25C6BF2D0(uint64_t a1, uint64_t a2)
{
  type metadata accessor for GetContactQuickActionButtonsView(0);
  OUTLINED_FUNCTION_5_2();
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 520);
  id v6 = v5;
  v4(a2);
}

uint64_t sub_25C6BF368()
{
  return sub_25C6D6070();
}

uint64_t sub_25C6BF424@<X0>(uint64_t a1@<X8>)
{
  sub_25C6D5670();
  sub_25C6D6430();
  swift_bridgeObjectRelease();
  sub_25C6A401C();
  uint64_t v2 = sub_25C6D5EC0();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_25C6D5610();
  uint64_t v9 = sub_25C6D5EC0();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 48) = v12 & 1;
  *(void *)(a1 + 56) = v14;
  sub_25C6ADC54(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_25C6ADC54(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_25C6A4068(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_25C6A4068(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C6BF564@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C6D6060();
  *a1 = result;
  return result;
}

uint64_t sub_25C6BF59C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_25C6D67E0()) {
      goto LABEL_3;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4) {
    goto LABEL_7;
  }
LABEL_3:
  sub_25C6AA7B0(0, (a1 & 0xC000000000000001) == 0, a1);
  if ((a1 & 0xC000000000000001) != 0) {
    id v5 = (id)MEMORY[0x261190350](0, a1);
  }
  else {
    id v5 = *(id *)(a1 + 32);
  }
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  sub_25C6D5670();

LABEL_8:
  sub_25C6A401C();
  uint64_t result = sub_25C6D5EC0();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v8;
  *(unsigned char *)(a2 + 16) = v9 & 1;
  *(void *)(a2 + 24) = v10;
  return result;
}

uint64_t sub_25C6BF6A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v13 = objc_allocWithZone(v6);
  uint64_t v14 = *(void *)(a4 + 24);
  uint64_t v15 = *(void *)(a4 + 32);
  uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1(a4, v14);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v19 + 16))(v18);
  uint64_t v20 = sub_25C6C2F94(a1, a2, a3, (uint64_t)v18, a5, a6, (uint64_t)v13, v14, v15);
  __swift_destroy_boxed_opaque_existential_0(a4);
  return v20;
}

id sub_25C6BF7DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MockGetContactQuickActionButtonsViewModel(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25C6BF814()
{
  return type metadata accessor for MockGetContactQuickActionButtonsViewModel(0);
}

uint64_t type metadata accessor for MockGetContactQuickActionButtonsViewModel(uint64_t a1)
{
  return sub_25C6C0238(a1, (uint64_t *)&unk_26A5C63C0);
}

uint64_t sub_25C6BF83C()
{
  return swift_updateClassMetadata2();
}

char *sub_25C6BF874(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    char v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    char v7 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v8 = a3[5];
    char v9 = &a1[v8];
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25C6D56C0();
    char v12 = v4;
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DB0);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
    *(void *)&v9[*(int *)(v14 + 28)] = *(void *)&v10[*(int *)(v14 + 28)];
    uint64_t v15 = a3[6];
    uint64_t v16 = a3[7];
    uint64_t v17 = *(char **)((char *)a2 + v15);
    *(void *)&v7[v15] = v17;
    uint64_t v18 = &v7[v16];
    uint64_t v19 = (char **)((char *)a2 + v16);
    uint64_t v20 = (void *)v19[1];
    *(void *)uint64_t v18 = *v19;
    *((void *)v18 + 1) = v20;
    swift_retain();
    id v21 = v17;
    id v22 = v20;
  }
  return v7;
}

void sub_25C6BF9FC(id *a1, int *a2)
{
  uint64_t v4 = (uint64_t)a1 + a2[5];
  uint64_t v5 = sub_25C6D56C0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
  swift_release();

  uint64_t v6 = *(id *)((char *)a1 + a2[7] + 8);
}

void *sub_25C6BFAC8(void *a1, uint64_t a2, int *a3)
{
  char v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v8 = a3[5];
  char v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = sub_25C6D56C0();
  id v12 = v7;
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DB0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
  *(void *)&v9[*(int *)(v14 + 28)] = *(void *)&v10[*(int *)(v14 + 28)];
  uint64_t v15 = a3[6];
  uint64_t v16 = a3[7];
  uint64_t v17 = *(void **)(a2 + v15);
  *(void *)((char *)a1 + v15) = v17;
  uint64_t v18 = (void *)((char *)a1 + v16);
  uint64_t v19 = (void *)(a2 + v16);
  uint64_t v20 = (void *)v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  swift_retain();
  id v21 = v17;
  id v22 = v20;
  return a1;
}

uint64_t sub_25C6BFBFC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  char v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = sub_25C6D56C0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (!EnumTagSinglePayload)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DB0);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
LABEL_7:
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
  *(void *)&v10[*(int *)(v17 + 28)] = *(void *)&v11[*(int *)(v17 + 28)];
  swift_retain();
  swift_release();
  uint64_t v18 = a3[6];
  uint64_t v19 = *(void **)(a2 + v18);
  uint64_t v20 = *(void **)(a1 + v18);
  *(void *)(a1 + v18) = v19;
  id v21 = v19;

  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  *uint64_t v23 = *v24;
  uint64_t v25 = (void *)v24[1];
  uint64_t v26 = (void *)v23[1];
  v23[1] = v25;
  id v27 = v25;

  return a1;
}

_OWORD *sub_25C6BFDE8(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  char v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C6D56C0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DB0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
  *(void *)&v7[*(int *)(v11 + 28)] = *(void *)&v8[*(int *)(v11 + 28)];
  uint64_t v12 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  return a1;
}

uint64_t sub_25C6BFEFC(uint64_t a1, void *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = a3[5];
  id v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25C6D56C0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DB0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
  *(void *)&v8[*(int *)(v15 + 28)] = *(void *)&v9[*(int *)(v15 + 28)];
  swift_release();
  uint64_t v16 = a3[6];
  uint64_t v17 = *(void **)(a1 + v16);
  *(void *)(a1 + v16) = *(void *)((char *)a2 + v16);

  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  uint64_t v23 = (void *)v19[1];
  *uint64_t v19 = v22;
  v19[1] = v21;

  return a1;
}

uint64_t sub_25C6C00CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6C00E0);
}

uint64_t sub_25C6C00E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_25C6C0174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6C0188);
}

void sub_25C6C0188(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
}

uint64_t type metadata accessor for GetContactQuickActionButtonsView(uint64_t a1)
{
  return sub_25C6C0238(a1, (uint64_t *)&unk_26A5C63D8);
}

uint64_t sub_25C6C0238(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C6C026C()
{
  sub_25C6C031C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25C6C031C()
{
  if (!qword_26A5C63E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C5DB0);
    unint64_t v0 = sub_25C6D60B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A5C63E8);
    }
  }
}

uint64_t sub_25C6C0378()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C6C0394(uint64_t a1, uint64_t a2)
{
  uint64_t ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(ContactQuickActionButtonsView - 8) + 16))(a2, a1, ContactQuickActionButtonsView);
  return a2;
}

uint64_t sub_25C6C03FC()
{
  return sub_25C6C05D0();
}

unint64_t sub_25C6C0414()
{
  unint64_t result = qword_26A5C6418;
  if (!qword_26A5C6418)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6408);
    sub_25C6A41AC(&qword_26A5C6420, &qword_26A5C6428);
    sub_25C6A41AC(&qword_26A5C6430, &qword_26A5C6438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6418);
  }
  return result;
}

uint64_t objectdestroyTm_2()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_2_5();
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  uint64_t v4 = OUTLINED_FUNCTION_18_1();
  if (!OUTLINED_FUNCTION_11_0(v4))
  {
    OUTLINED_FUNCTION_14_1();
    uint64_t v5 = OUTLINED_FUNCTION_15_1();
    v6(v5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
  swift_release();

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA0238](v7, v8, v9);
}

uint64_t sub_25C6C05B8()
{
  return sub_25C6C05D0();
}

uint64_t sub_25C6C05D0()
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v0 = OUTLINED_FUNCTION_13_1();

  return v1(v0);
}

uint64_t sub_25C6C0628()
{
  return sub_25C6BCB5C(*(void *)(v0 + 16));
}

uint64_t sub_25C6C0630(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_25C6D67D0();
    __break(1u);
  }
  else if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65E0);
    uint64_t result = sub_25C6D64F0();
    *(void *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

char *sub_25C6C06D4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25C6D67F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_25C6C0768(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25C6D67F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_25C6C07FC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25C6D67F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_25C6C0890(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25C6D67F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

uint64_t sub_25C6C092C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a2;
  if (a2 < 0 || ((unint64_t v5 = a1, a3 + 32 * v4 > a1) ? (v6 = a1 + 32 * v4 > a3) : (v6 = 0), v6))
  {
    uint64_t v8 = sub_25C6D67F0();
    __break(1u);
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8EE58] + 8;
    uint64_t v8 = a3;
  }
  return MEMORY[0x270FA01C8](v8, v5, v4, v7);
}

void *sub_25C6C0A10(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[16 * a2] > __src ? (BOOL v3 = &__src[16 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C6D67F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 16 * a2);
  }
  return result;
}

void *sub_25C6C0AEC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[8 * a2] > __src ? (BOOL v3 = &__src[8 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C6D67F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 8 * a2);
  }
  return result;
}

uint64_t sub_25C6C0BC8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (BOOL v6 = a1 + 24 * a2 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_25C6D67F0();
    __break(1u);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65E0);
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
  }
  return MEMORY[0x270FA01C8](v8, v9, v10, v7);
}

void sub_25C6C0CCC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_16_1();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_22();
    }
  }
  OUTLINED_FUNCTION_21_0();
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6668);
    uint64_t v10 = (const void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    OUTLINED_FUNCTION_20_0(v11 - 32);
  }
  int v12 = (char *)OUTLINED_FUNCTION_19_1();
  if (a1)
  {
    sub_25C6C06D4(v12, v13, v14);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C6C092C((unint64_t)v12, v13, (unint64_t)v14);
  }
  swift_release();
}

void sub_25C6C0D88(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_16_1();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_22();
    }
  }
  OUTLINED_FUNCTION_21_0();
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6688);
    uint64_t v10 = (const void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    OUTLINED_FUNCTION_20_0(v11 - 32);
  }
  int v12 = (char *)OUTLINED_FUNCTION_19_1();
  if (a1)
  {
    sub_25C6C0768(v12, v13, v14);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C6C0A10(v12, v13, v14);
  }
  swift_release();
}

void sub_25C6C0E44(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_16_1();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_22();
    }
  }
  OUTLINED_FUNCTION_21_0();
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6680);
    uint64_t v10 = (const void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    OUTLINED_FUNCTION_20_0(v11 - 32);
  }
  int v12 = (char *)OUTLINED_FUNCTION_19_1();
  if (a1)
  {
    sub_25C6C07FC(v12, v13, v14);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C6C0AEC(v12, v13, v14);
  }
  swift_release();
}

char *sub_25C6C0F00(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65E8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25C6C0890(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C6C0BC8((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_25C6C0FEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_25C6D5C60();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_25C6C1020()
{
  return sub_25C6D5C70();
}

uint64_t sub_25C6C1050@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C6D5C40();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25C6C1080()
{
  return sub_25C6D5C50();
}

unsigned char *sub_25C6C10AC(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_25C6C10C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6408);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C6C112C(uint64_t a1)
{
  uint64_t ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(ContactQuickActionButtonsView - 8) + 8))(a1, ContactQuickActionButtonsView);
  return a1;
}

void sub_25C6C118C()
{
}

uint64_t sub_25C6C11D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C6C121C(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25C6C26D4((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_25C6C1978(v5);
  *a1 = v2;
  return result;
}

void *sub_25C6C1288(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65E8);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  uint64_t v5 = sub_25C6C24B8((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25C6C2EEC();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void sub_25C6C1370()
{
}

uint64_t sub_25C6C139C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_25C6C13D8()
{
  unint64_t result = qword_26A5C6528;
  if (!qword_26A5C6528)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C64B8);
    sub_25C6C1454();
    sub_25C6C1514();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6528);
  }
  return result;
}

unint64_t sub_25C6C1454()
{
  unint64_t result = qword_26A5C6530;
  if (!qword_26A5C6530)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C64B0);
    sub_25C6A41AC(&qword_26A5C6538, &qword_26A5C64A8);
    sub_25C6C15D4(&qword_26A5C6540, &qword_26A5C6488, &qword_26A5C64E8, &qword_26A5C64D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6530);
  }
  return result;
}

unint64_t sub_25C6C1514()
{
  unint64_t result = qword_26A5C6548;
  if (!qword_26A5C6548)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6480);
    sub_25C6A41AC(&qword_26A5C6538, &qword_26A5C64A8);
    sub_25C6C15D4(&qword_26A5C6550, &qword_26A5C6470, &qword_26A5C6558, &qword_26A5C6560);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6548);
  }
  return result;
}

uint64_t sub_25C6C15D4(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_25C6A41AC(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_25C6C1674(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

uint64_t sub_25C6C1690()
{
  return sub_25C6C2A3C();
}

void sub_25C6C16AC()
{
}

void sub_25C6C16F8()
{
}

void sub_25C6C1724()
{
}

void sub_25C6C1798(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

uint64_t sub_25C6C17B4()
{
  return sub_25C6C2A3C();
}

void sub_25C6C17D0()
{
}

void sub_25C6C181C()
{
}

uint64_t sub_25C6C1848(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(v1 + 16))(*a1, a1[1], a1[2]);
}

void sub_25C6C187C()
{
}

uint64_t sub_25C6C18B4@<X0>(uint64_t a1@<X8>)
{
  return sub_25C6BCCF8(*(void *)(v1 + 16), a1);
}

void sub_25C6C18C0()
{
}

uint64_t sub_25C6C190C()
{
  return sub_25C6C2EF8((uint64_t (*)(uint64_t))sub_25C6BF2D0);
}

uint64_t sub_25C6C1924()
{
  return sub_25C6BCC04();
}

uint64_t sub_25C6C192C()
{
  return sub_25C6BE430();
}

uint64_t sub_25C6C195C@<X0>(uint64_t a1@<X8>)
{
  return sub_25C6BF424(a1);
}

uint64_t sub_25C6C1978(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_25C6D6810();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_25C6C2038(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_144;
  }
  uint64_t v5 = result;
  uint64_t result = sub_25C6C0630(v3 / 2);
  uint64_t v101 = result;
  uint64_t v102 = v3;
  __dst = v6;
  uint64_t v99 = a1;
  if (v3 <= 0)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    unint64_t v41 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_110:
    uint64_t result = v9;
    if (v41 < 2)
    {
LABEL_121:
      uint64_t result = swift_bridgeObjectRelease();
      if (v102 >= -1)
      {
        *(void *)(v101 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_149;
    }
    uint64_t v90 = *v99;
    while (1)
    {
      unint64_t v91 = v41 - 2;
      if (v41 < 2) {
        break;
      }
      if (!v90) {
        goto LABEL_153;
      }
      uint64_t v92 = result;
      uint64_t v93 = *(void *)(result + 32 + 16 * v91);
      uint64_t v94 = *(void *)(result + 32 + 16 * (v41 - 1) + 8);
      uint64_t result = sub_25C6C2118((char *)(v90 + 24 * v93), (char *)(v90 + 24 * *(void *)(result + 32 + 16 * (v41 - 1))), v90 + 24 * v94, __dst);
      if (v1) {
        goto LABEL_106;
      }
      if (v94 < v93) {
        goto LABEL_139;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_25C6C23D0(v92);
        uint64_t v92 = result;
      }
      if (v91 >= *(void *)(v92 + 16)) {
        goto LABEL_140;
      }
      uint64_t v95 = (void *)(v92 + 32 + 16 * v91);
      void *v95 = v93;
      v95[1] = v94;
      unint64_t v96 = *(void *)(v92 + 16);
      if (v41 > v96) {
        goto LABEL_141;
      }
      memmove((void *)(v92 + 32 + 16 * (v41 - 1)), (const void *)(v92 + 32 + 16 * v41), 16 * (v96 - v41));
      uint64_t result = v92;
      *(void *)(v92 + 16) = v96 - 1;
      unint64_t v41 = v96 - 1;
      if (v96 <= 2) {
        goto LABEL_121;
      }
    }
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
LABEL_144:
    __break(1u);
LABEL_145:
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
LABEL_152:
    __break(1u);
LABEL_153:
    __break(1u);
    return result;
  }
  uint64_t v100 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v97 = *a1 - 24;
  uint64_t v98 = *a1 + 8;
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v103 = v8;
  while (1)
  {
    uint64_t v10 = v7++;
    if (v7 >= v3) {
      goto LABEL_32;
    }
    size_t v11 = (uint64_t *)(v8 + 24 * v7);
    uint64_t result = *v11;
    uint64_t v12 = v11[1];
    uint64_t v13 = (void *)(v8 + 24 * v10);
    if (result == *v13 && v12 == v13[1])
    {
      uint64_t v16 = v10 + 2;
      if (v10 + 2 >= v102) {
        goto LABEL_31;
      }
      int v15 = 0;
    }
    else
    {
      uint64_t result = sub_25C6D6830();
      int v15 = result;
      uint64_t v16 = v10 + 2;
      if (v10 + 2 >= v102) {
        goto LABEL_23;
      }
    }
    uint64_t v17 = (void *)(v98 + 24 * v16);
    do
    {
      uint64_t result = *(v17 - 1);
      uint64_t v18 = (void *)(v8 + 24 * v7);
      if (result == *v18 && *v17 == v18[1])
      {
        if (v15) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t result = sub_25C6D6830();
        if ((v15 ^ result)) {
          goto LABEL_23;
        }
      }
      v17 += 3;
      uint64_t v20 = v16 + 1;
      uint64_t v7 = v16;
      uint64_t v16 = v20;
    }
    while (v20 < v102);
    uint64_t v16 = v20;
LABEL_23:
    uint64_t v7 = v16;
    if (v15)
    {
LABEL_24:
      if (v16 < v10) {
        goto LABEL_148;
      }
      if (v10 < v16)
      {
        uint64_t v21 = 24 * v16;
        uint64_t v22 = 24 * v10;
        uint64_t v23 = v16;
        uint64_t v24 = v10;
        do
        {
          if (v24 != --v23)
          {
            if (!v8) {
              goto LABEL_152;
            }
            uint64_t v25 = v8 + v22;
            uint64_t v26 = v8 + v21;
            uint64_t v27 = *(void *)(v8 + v22);
            long long v28 = *(_OWORD *)(v8 + v22 + 8);
            long long v29 = *(_OWORD *)(v8 + v21 - 24);
            *(void *)(v25 + 16) = *(void *)(v8 + v21 - 8);
            *(_OWORD *)uint64_t v25 = v29;
            *(void *)(v26 - 24) = v27;
            *(_OWORD *)(v26 - 16) = v28;
          }
          ++v24;
          v21 -= 24;
          v22 += 24;
        }
        while (v24 < v23);
      }
LABEL_31:
      uint64_t v7 = v16;
    }
LABEL_32:
    if (v7 < v102)
    {
      if (__OFSUB__(v7, v10)) {
        goto LABEL_143;
      }
      if (v7 - v10 < v100)
      {
        if (__OFADD__(v10, v100)) {
          goto LABEL_146;
        }
        if (v10 + v100 >= v102) {
          uint64_t v30 = v102;
        }
        else {
          uint64_t v30 = v10 + v100;
        }
        if (v30 < v10) {
          goto LABEL_147;
        }
        if (v7 != v30)
        {
          uint64_t v31 = v97 + 24 * v7;
          do
          {
            id v32 = (uint64_t *)(v8 + 24 * v7);
            uint64_t result = *v32;
            uint64_t v33 = v32[1];
            uint64_t v34 = v10;
            uint64_t v35 = v31;
            do
            {
              if (result == *(void *)v35 && v33 == *(void *)(v35 + 8)) {
                break;
              }
              uint64_t result = sub_25C6D6830();
              if ((result & 1) == 0) {
                break;
              }
              if (!v8) {
                goto LABEL_150;
              }
              long long v37 = *(_OWORD *)(v35 + 32);
              uint64_t v38 = *(void *)(v35 + 16);
              uint64_t result = *(void *)(v35 + 24);
              *(_OWORD *)(v35 + 24) = *(_OWORD *)v35;
              *(void *)(v35 + 40) = v38;
              *(void *)uint64_t v35 = result;
              *(_OWORD *)(v35 + 8) = v37;
              uint64_t v33 = v37;
              v35 -= 24;
              ++v34;
            }
            while (v7 != v34);
            ++v7;
            v31 += 24;
          }
          while (v7 != v30);
          uint64_t v7 = v30;
        }
      }
    }
    if (v7 < v10) {
      goto LABEL_142;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25C6C22D8(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    unint64_t v40 = *(void *)(v9 + 16);
    unint64_t v39 = *(void *)(v9 + 24);
    unint64_t v41 = v40 + 1;
    if (v40 >= v39 >> 1)
    {
      uint64_t result = (uint64_t)sub_25C6C22D8((char *)(v39 > 1), v40 + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    *(void *)(v9 + 16) = v41;
    uint64_t v42 = v9 + 32;
    id v43 = (uint64_t *)(v9 + 32 + 16 * v40);
    uint64_t *v43 = v10;
    v43[1] = v7;
    if (v40) {
      break;
    }
    unint64_t v41 = 1;
    uint64_t v8 = v103;
LABEL_101:
    uint64_t v3 = v102;
    if (v7 >= v102) {
      goto LABEL_110;
    }
  }
  uint64_t v8 = v103;
  while (1)
  {
    unint64_t v44 = v41 - 1;
    if (v41 >= 4)
    {
      unint64_t v49 = v42 + 16 * v41;
      uint64_t v50 = *(void *)(v49 - 64);
      uint64_t v51 = *(void *)(v49 - 56);
      BOOL v55 = __OFSUB__(v51, v50);
      uint64_t v52 = v51 - v50;
      if (v55) {
        goto LABEL_127;
      }
      uint64_t v54 = *(void *)(v49 - 48);
      uint64_t v53 = *(void *)(v49 - 40);
      BOOL v55 = __OFSUB__(v53, v54);
      uint64_t v47 = v53 - v54;
      char v48 = v55;
      if (v55) {
        goto LABEL_128;
      }
      unint64_t v56 = v41 - 2;
      uint64_t v57 = (uint64_t *)(v42 + 16 * (v41 - 2));
      uint64_t v59 = *v57;
      uint64_t v58 = v57[1];
      BOOL v55 = __OFSUB__(v58, v59);
      uint64_t v60 = v58 - v59;
      if (v55) {
        goto LABEL_129;
      }
      BOOL v55 = __OFADD__(v47, v60);
      uint64_t v61 = v47 + v60;
      if (v55) {
        goto LABEL_131;
      }
      if (v61 >= v52)
      {
        unint64_t v79 = (uint64_t *)(v42 + 16 * v44);
        uint64_t v81 = *v79;
        uint64_t v80 = v79[1];
        BOOL v55 = __OFSUB__(v80, v81);
        uint64_t v82 = v80 - v81;
        if (v55) {
          goto LABEL_137;
        }
        BOOL v72 = v47 < v82;
        goto LABEL_90;
      }
    }
    else
    {
      if (v41 != 3)
      {
        uint64_t v73 = *(void *)(v9 + 32);
        uint64_t v74 = *(void *)(v9 + 40);
        BOOL v55 = __OFSUB__(v74, v73);
        uint64_t v66 = v74 - v73;
        char v67 = v55;
        goto LABEL_84;
      }
      uint64_t v46 = *(void *)(v9 + 32);
      uint64_t v45 = *(void *)(v9 + 40);
      BOOL v55 = __OFSUB__(v45, v46);
      uint64_t v47 = v45 - v46;
      char v48 = v55;
    }
    if (v48) {
      goto LABEL_130;
    }
    unint64_t v56 = v41 - 2;
    id v62 = (uint64_t *)(v42 + 16 * (v41 - 2));
    uint64_t v64 = *v62;
    uint64_t v63 = v62[1];
    BOOL v65 = __OFSUB__(v63, v64);
    uint64_t v66 = v63 - v64;
    char v67 = v65;
    if (v65) {
      goto LABEL_132;
    }
    uint64_t v68 = (uint64_t *)(v42 + 16 * v44);
    uint64_t v70 = *v68;
    uint64_t v69 = v68[1];
    BOOL v55 = __OFSUB__(v69, v70);
    uint64_t v71 = v69 - v70;
    if (v55) {
      goto LABEL_134;
    }
    if (__OFADD__(v66, v71)) {
      goto LABEL_136;
    }
    if (v66 + v71 >= v47)
    {
      BOOL v72 = v47 < v71;
LABEL_90:
      if (v72) {
        unint64_t v44 = v56;
      }
      goto LABEL_92;
    }
LABEL_84:
    if (v67) {
      goto LABEL_133;
    }
    uint64_t v75 = (uint64_t *)(v42 + 16 * v44);
    uint64_t v77 = *v75;
    uint64_t v76 = v75[1];
    BOOL v55 = __OFSUB__(v76, v77);
    uint64_t v78 = v76 - v77;
    if (v55) {
      goto LABEL_135;
    }
    if (v78 < v66) {
      goto LABEL_101;
    }
LABEL_92:
    unint64_t v83 = v44 - 1;
    if (v44 - 1 >= v41)
    {
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
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
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v8) {
      goto LABEL_151;
    }
    uint64_t v84 = v8;
    id v85 = (uint64_t *)(v42 + 16 * v83);
    uint64_t v86 = *v85;
    long long v87 = (void *)(v42 + 16 * v44);
    uint64_t v88 = v87[1];
    uint64_t result = sub_25C6C2118((char *)(v84 + 24 * *v85), (char *)(v84 + 24 * *v87), v84 + 24 * v88, __dst);
    if (v1) {
      break;
    }
    if (v88 < v86) {
      goto LABEL_124;
    }
    if (v44 > *(void *)(v9 + 16)) {
      goto LABEL_125;
    }
    *id v85 = v86;
    *(void *)(v42 + 16 * v83 + 8) = v88;
    unint64_t v89 = *(void *)(v9 + 16);
    if (v44 >= v89) {
      goto LABEL_126;
    }
    unint64_t v41 = v89 - 1;
    uint64_t result = (uint64_t)memmove((void *)(v42 + 16 * v44), v87 + 2, 16 * (v89 - 1 - v44));
    *(void *)(v9 + 16) = v89 - 1;
    BOOL v72 = v89 > 2;
    uint64_t v8 = v103;
    if (!v72) {
      goto LABEL_101;
    }
  }
LABEL_106:
  uint64_t result = swift_bridgeObjectRelease();
  if (v102 < -1) {
    goto LABEL_145;
  }
  *(void *)(v101 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C6C2038(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 24 * a3 - 24;
    while (2)
    {
      uint64_t v9 = (uint64_t *)(v7 + 24 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = v8;
      do
      {
        if (result == *(void *)v12 && v10 == *(void *)(v12 + 8)) {
          break;
        }
        uint64_t result = sub_25C6D6830();
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }
        long long v14 = *(_OWORD *)(v12 + 32);
        uint64_t v15 = *(void *)(v12 + 16);
        uint64_t result = *(void *)(v12 + 24);
        *(_OWORD *)(v12 + 24) = *(_OWORD *)v12;
        *(void *)(v12 + 40) = v15;
        *(void *)uint64_t v12 = result;
        *(_OWORD *)(v12 + 8) = v14;
        uint64_t v10 = v14;
        v12 -= 24;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 24;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_25C6C2118(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 24;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 24;
  if (v9 >= v11)
  {
    sub_25C6C0890(a2, (uint64_t)(a3 - (void)a2) / 24, __dst);
    uint64_t v12 = &v4[24 * v11];
    if (v7 >= v6 || v10 < 24) {
      goto LABEL_47;
    }
    unint64_t v19 = a3 - 24;
    while (1)
    {
      uint64_t v20 = (char *)(v19 + 24);
      uint64_t v21 = v12 - 24;
      BOOL v22 = *((void *)v12 - 3) == *((void *)v6 - 3) && *((void *)v12 - 2) == *((void *)v6 - 2);
      if (v22 || (sub_25C6D6830() & 1) == 0)
      {
        BOOL v24 = v20 != v12 || v19 >= (unint64_t)v12;
        v12 -= 24;
        if (!v24) {
          goto LABEL_43;
        }
      }
      else
      {
        BOOL v23 = v20 != v6 || v19 >= (unint64_t)v6;
        uint64_t v21 = v6 - 24;
        v6 -= 24;
        if (!v23) {
          goto LABEL_43;
        }
      }
      long long v25 = *(_OWORD *)v21;
      *(void *)(v19 + 16) = *((void *)v21 + 2);
      *(_OWORD *)unint64_t v19 = v25;
LABEL_43:
      v19 -= 24;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_47;
      }
    }
  }
  sub_25C6C0890(__src, (a2 - __src) / 24, __dst);
  uint64_t v12 = &v4[24 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    while (1)
    {
      BOOL v14 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v14 && (sub_25C6D6830() & 1) != 0) {
        break;
      }
      uint64_t v15 = v4;
      BOOL v14 = v7 == v4;
      v4 += 24;
      if (!v14) {
        goto LABEL_15;
      }
LABEL_16:
      v7 += 24;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_21;
      }
    }
    uint64_t v15 = v6;
    BOOL v14 = v7 == v6;
    v6 += 24;
    if (v14) {
      goto LABEL_16;
    }
LABEL_15:
    long long v16 = *(_OWORD *)v15;
    *((void *)v7 + 2) = *((void *)v15 + 2);
    *(_OWORD *)uint64_t v7 = v16;
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v6 = v7;
LABEL_47:
  sub_25C6C0890(v4, (v12 - v4) / 24, v6);
  return 1;
}

char *sub_25C6C22D8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C65D8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25C6C23D0(uint64_t a1)
{
  return sub_25C6C22D8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25C6C23E4(void *a1)
{
  id v2 = objc_msgSend(a1, sel_aceId);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25C6D63D0();

  return v3;
}

void sub_25C6C2454(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25C6D63A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAceId_, v4);
}

uint64_t sub_25C6C24B8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)result;
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
    uint64_t v10 = 0;
LABEL_39:
    *char v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    uint64_t v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  size_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v23 = -1 << *(unsigned char *)(a4 + 32);
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    uint64_t v22 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    *size_t v11 = *v20;
    v11[1] = v21;
    void v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 3;
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          unint64_t v18 = *(void *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            int64_t v17 = v12;
            goto LABEL_18;
          }
          int64_t v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            unint64_t v9 = 0;
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
              }
              if (v17 >= v14)
              {
                unint64_t v9 = 0;
                int64_t v12 = v14 - 1;
                goto LABEL_37;
              }
              unint64_t v18 = *(void *)(v6 + 8 * v17);
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v23;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

char *sub_25C6C26D4(uint64_t a1)
{
  return sub_25C6C0F00(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t objectdestroy_81Tm()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_2_5();
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 + 64);

  uint64_t v6 = OUTLINED_FUNCTION_18_1();
  if (!OUTLINED_FUNCTION_11_0(v6))
  {
    OUTLINED_FUNCTION_14_1();
    uint64_t v7 = OUTLINED_FUNCTION_15_1();
    v8(v7);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
  swift_release();

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA0238](v9, v10, v11);
}

uint64_t sub_25C6C27DC()
{
  return sub_25C6C2EF8((uint64_t (*)(uint64_t))sub_25C6BEF8C);
}

uint64_t sub_25C6C27F4()
{
  return sub_25C6BD884();
}

void sub_25C6C2838(uint64_t a1@<X8>)
{
}

uint64_t sub_25C6C2868@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C6D5C00();
  *a1 = result;
  return result;
}

uint64_t sub_25C6C2894()
{
  return sub_25C6D5C10();
}

uint64_t sub_25C6C28BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_14_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

void sub_25C6C2920()
{
}

uint64_t sub_25C6C2938()
{
  return sub_25C6BEAE0(*(void *)(v0 + 16), *(void *)(v0 + 24), &qword_26A5C6600, &qword_26A5C6608);
}

uint64_t sub_25C6C298C@<X0>(uint64_t a1@<X8>)
{
  return sub_25C6BEB88(*(void *)(v1 + 16), *(void *)(v1 + 24), &qword_26A5C6610, (uint64_t (*)(uint64_t, uint64_t))sub_25C6BD014, a1);
}

uint64_t sub_25C6C29C4@<X0>(uint64_t a1@<X8>)
{
  return sub_25C6BD198(*(void *)(v1 + 16), *(void **)(v1 + 24), a1);
}

void sub_25C6C29CC()
{
}

uint64_t sub_25C6C2A04@<X0>(uint64_t a1@<X8>)
{
  return sub_25C6BF59C(*(void *)(v1 + 16), a1);
}

uint64_t sub_25C6C2A24()
{
  return sub_25C6C2A3C();
}

uint64_t sub_25C6C2A3C()
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v0 = OUTLINED_FUNCTION_13_1();

  return v1(v0);
}

uint64_t sub_25C6C2A94()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_2_5();
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  uint64_t v4 = OUTLINED_FUNCTION_18_1();
  if (!OUTLINED_FUNCTION_11_0(v4))
  {
    OUTLINED_FUNCTION_14_1();
    uint64_t v5 = OUTLINED_FUNCTION_15_1();
    v6(v5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C63D0);
  swift_release();

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA0238](v7, v8, v9);
}

void sub_25C6C2B78()
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v2 = *(void *)(v0 + 16);
  unint64_t v3 = (void **)(v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));

  sub_25C6BDDC8(v2, v3);
}

uint64_t sub_25C6C2BB4()
{
  return sub_25C6BE374();
}

uint64_t sub_25C6C2BBC()
{
  return sub_25C6BE430();
}

uint64_t sub_25C6C2BEC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_14_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

void sub_25C6C2C48()
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v1 = (id *)OUTLINED_FUNCTION_6_2((*(unsigned __int8 *)(v0 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80));

  sub_25C6BD488(v1);
}

uint64_t sub_25C6C2C98()
{
  return sub_25C6BD884();
}

void sub_25C6C2CE0()
{
}

void sub_25C6C2CF8()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_6_2((*(unsigned __int8 *)(v0 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80));
  sub_25C6BE6D4();
}

uint64_t sub_25C6C2D4C()
{
  return sub_25C6BEAE0(*(void *)(v0 + 16), *(void *)(v0 + 24), &qword_26A5C6630, &qword_26A5C6638);
}

uint64_t sub_25C6C2DA0@<X0>(uint64_t a1@<X8>)
{
  return sub_25C6BEB88(*(void *)(v1 + 16), *(void *)(v1 + 24), &qword_26A5C6640, (uint64_t (*)(uint64_t, uint64_t))sub_25C6BEBF8, a1);
}

uint64_t sub_25C6C2DD8@<X0>(uint64_t a1@<X8>)
{
  return sub_25C6BED7C(*(void *)(v1 + 16), *(void **)(v1 + 24), a1);
}

void sub_25C6C2DE8()
{
}

void sub_25C6C2E24()
{
}

void sub_25C6C2E6C()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_1_4();
  v2(v10, v0 + ((*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), v8, v6, v4);
  OUTLINED_FUNCTION_7_2();
}

uint64_t sub_25C6C2EE4()
{
  return sub_25C6BF368();
}

uint64_t sub_25C6C2EEC()
{
  return swift_release();
}

uint64_t sub_25C6C2EF8(uint64_t (*a1)(uint64_t))
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = OUTLINED_FUNCTION_6_2((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_25C6C2F4C()
{
  return sub_25C6BD884();
}

uint64_t sub_25C6C2F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v39 = a6;
  uint64_t v40 = a7;
  uint64_t v32 = a2;
  uint64_t v33 = a4;
  uint64_t v37 = a1;
  uint64_t v38 = a3;
  uint64_t v35 = a5;
  uint64_t v36 = a9;
  uint64_t v34 = sub_25C6D5600();
  uint64_t v11 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25C6D58C0();
  uint64_t v31 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(a8 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v16);
  uint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  BOOL v24 = (char *)&v31 - v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))((char *)&v31 - v23, v33, a8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a2, v14);
  uint64_t v26 = v34;
  uint64_t v25 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v35, v34);
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v22, v24, a8);
  sub_25C6D03E4(v37, (uint64_t)v18, v38, (uint64_t)v22, (uint64_t)v13, v39, v40, a8, v36, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39,
    v40,
    v41);
  uint64_t v28 = v27;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v24, a8);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v32, v31);
  return v28;
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

uint64_t sub_25C6C32BC()
{
  return sub_25C6A41AC(&qword_26A5C6670, &qword_26A5C6678);
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return type metadata accessor for GetContactQuickActionButtonsView(0) - 8;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return type metadata accessor for GetContactQuickActionButtonsView(0) - 8;
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return type metadata accessor for GetContactQuickActionButtonsView(0);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_6_2@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t OUTLINED_FUNCTION_9_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_25C6C0394(v9, (uint64_t)&a9 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return sub_25C6D60C0();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return v0;
}

void OUTLINED_FUNCTION_17_0()
{
  uint64_t v3 = *(void **)(v1 + *(int *)(v0 + 28) + 8);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return sub_25C6D56C0();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return v0 + 32;
}

void OUTLINED_FUNCTION_20_0(uint64_t a1@<X8>)
{
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t *sub_25C6C3578(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25C6D5AA0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (char *)a2 + v9;
    uint64_t v14 = *(void **)v12;
    uint64_t v13 = *((void *)v12 + 1);
    *uint64_t v11 = v14;
    v11[1] = v13;
    uint64_t v15 = (char *)a1 + v10;
    uint64_t v16 = (char *)a2 + v10;
    uint64_t v17 = sub_25C6D5980();
    unint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
    id v19 = v14;
    v18(v15, v16, v17);
  }
  return a1;
}

uint64_t sub_25C6C36F8(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_25C6D5AA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_25C6D5980();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

void *sub_25C6C37D8(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25C6D5AA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (char *)a2 + v7;
  uint64_t v12 = *(void **)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *uint64_t v9 = v12;
  v9[1] = v11;
  uint64_t v13 = (char *)a1 + v8;
  uint64_t v14 = (char *)a2 + v8;
  uint64_t v15 = sub_25C6D5980();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
  id v17 = v12;
  v16(v13, v14, v15);
  return a1;
}

void *sub_25C6C3908(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25C6A505C((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25C6D5AA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void **)((char *)a1 + v7);
  uint64_t v11 = *(void **)((char *)a2 + v7);
  *uint64_t v8 = v11;
  id v12 = v11;

  v8[1] = *((void *)v9 + 1);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_25C6D5980();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

char *sub_25C6C3A50(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25C6D5AA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_25C6D5980();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

char *sub_25C6C3B68(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25C6A505C((uint64_t)a1);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25C6D5AA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void **)&a1[v8];
  *(void *)uint64_t v9 = *(void *)v10;

  *((void *)v9 + 1) = *((void *)v10 + 1);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_25C6D5980();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_25C6C3CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6C3CC8);
}

uint64_t sub_25C6C3CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E70);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_10:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 2147483646)
  {
    uint64_t v8 = sub_25C6D5980();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    goto LABEL_10;
  }
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

uint64_t sub_25C6C3D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6C3D9C);
}

void sub_25C6C3D9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E70);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = a2;
      return;
    }
    uint64_t v10 = sub_25C6D5980();
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for ModifyContactAttributeConfirmationView()
{
  uint64_t result = qword_26A5C6690;
  if (!qword_26A5C6690) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C6C3E94()
{
  sub_25C6A55E0();
  if (v0 <= 0x3F)
  {
    sub_25C6D5980();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_25C6C3F64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C6C3F80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v96 = a1;
  uint64_t v93 = (void (*)(void, void, void))sub_25C6D5920();
  OUTLINED_FUNCTION_1();
  uint64_t v84 = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_8_2((uint64_t)v76 - v5);
  uint64_t v100 = sub_25C6D61B0();
  OUTLINED_FUNCTION_1();
  uint64_t v105 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_8_2((uint64_t)v76 - v9);
  uint64_t v98 = sub_25C6D61E0();
  OUTLINED_FUNCTION_1();
  uint64_t v102 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_8_2((uint64_t)v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v78 = type metadata accessor for ModifyContactAttributeConfirmationView() - 8;
  OUTLINED_FUNCTION_6_3();
  uint64_t v14 = v13;
  uint64_t v16 = *(void *)(v15 + 64);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v94 = (uint64_t)v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v76 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C66D0);
  OUTLINED_FUNCTION_1();
  uint64_t v101 = v22;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v24);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C66D8);
  OUTLINED_FUNCTION_1();
  uint64_t v104 = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v27);
  v76[0] = (char *)v76 - v28;
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C66E0);
  OUTLINED_FUNCTION_1();
  uint64_t v103 = v29;
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v31);
  uint64_t v81 = (char *)v76 - v32;
  uint64_t v88 = type metadata accessor for ModifyContactAttributeConfirmationView;
  sub_25C6C5850(v1, (uint64_t)v20, (void (*)(void))type metadata accessor for ModifyContactAttributeConfirmationView);
  uint64_t v33 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v34 = (v33 + 16) & ~v33;
  uint64_t v86 = v34 + v16;
  uint64_t v87 = v34;
  uint64_t v85 = v33 | 7;
  uint64_t v35 = swift_allocObject();
  sub_25C6C579C((uint64_t)v20, v35 + v34);
  uint64_t v107 = v1;
  uint64_t v77 = v1;
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DD8);
  uint64_t v111 = MEMORY[0x263F1A830];
  uint64_t v112 = MEMORY[0x263F1A820];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_25C6D60C0();
  char v118 = 0;
  long long v116 = 0u;
  long long v117 = 0u;
  sub_25C6D5D00();
  uint64_t v36 = sub_25C6A41AC(&qword_26A5C66E8, &qword_26A5C66D0);
  uint64_t v97 = sub_25C6C58FC(&qword_26A5C66F0, MEMORY[0x263F775B0]);
  uint64_t v37 = v21;
  uint64_t v38 = v98;
  uint64_t v39 = v36;
  v76[2] = v36;
  sub_25C6D5F70();
  OUTLINED_FUNCTION_9_2();
  uint64_t v102 = v40;
  uint64_t v80 = v41;
  OUTLINED_FUNCTION_3();
  v42();
  OUTLINED_FUNCTION_9_2();
  uint64_t v101 = v43;
  uint64_t v79 = v44;
  v76[1] = v21;
  OUTLINED_FUNCTION_3();
  v45();
  uint64_t v46 = v90;
  sub_25C6D5930();
  uint64_t v47 = v84;
  uint64_t v48 = v92;
  unint64_t v49 = v93;
  (*(void (**)(uint64_t, void, void))(v84 + 104))(v92, *MEMORY[0x263F6CF38], v93);
  char v50 = sub_25C6D5910();
  uint64_t v51 = *(void (**)(void, void))(v47 + 8);
  v51(v48, v49);
  v51(v46, v49);
  uint64_t v52 = v105;
  uint64_t v53 = *(void (**)(void, void, void))(v105 + 104);
  uint64_t v93 = v53;
  uint64_t v54 = (unsigned int *)MEMORY[0x263F774D0];
  if ((v50 & 1) == 0) {
    uint64_t v54 = (unsigned int *)MEMORY[0x263F774E0];
  }
  v53(v91, *v54, v100);
  uint64_t v111 = v37;
  uint64_t v112 = v38;
  uint64_t v113 = v39;
  uint64_t v114 = v97;
  uint64_t v55 = swift_getOpaqueTypeConformance2();
  uint64_t v56 = v99;
  sub_25C6D5EE0();
  uint64_t v57 = *(void *)(v52 + 8);
  uint64_t v105 = v52 + 8;
  uint64_t v92 = v57;
  OUTLINED_FUNCTION_3();
  v58();
  OUTLINED_FUNCTION_9_2();
  uint64_t v104 = v59;
  uint64_t v91 = v60;
  OUTLINED_FUNCTION_3();
  v61();
  uint64_t v111 = v56;
  uint64_t v112 = v55;
  swift_getOpaqueTypeConformance2();
  uint64_t v62 = sub_25C6D5ED0();
  OUTLINED_FUNCTION_9_2();
  uint64_t v103 = v63;
  uint64_t v90 = v64;
  OUTLINED_FUNCTION_3();
  v65();
  uint64_t v114 = MEMORY[0x263F1B720];
  uint64_t v115 = MEMORY[0x263F774B0];
  uint64_t v111 = v62;
  uint64_t v66 = v77;
  uint64_t v67 = v94;
  sub_25C6C5850(v77, v94, (void (*)(void))v88);
  uint64_t v68 = swift_allocObject();
  sub_25C6C579C(v67, v68 + v87);
  uint64_t v106 = v66;
  sub_25C6D60C0();
  sub_25C6D5D00();
  sub_25C6D5F70();
  OUTLINED_FUNCTION_3();
  v69();
  OUTLINED_FUNCTION_3();
  v70();
  v93(v95, *MEMORY[0x263F774D8], v100);
  sub_25C6D5EE0();
  OUTLINED_FUNCTION_3();
  v71();
  OUTLINED_FUNCTION_3();
  v72();
  uint64_t v73 = sub_25C6D5ED0();
  OUTLINED_FUNCTION_3();
  v74();
  uint64_t v110 = MEMORY[0x263F774B0];
  uint64_t v109 = MEMORY[0x263F1B720];
  uint64_t v108 = v73;
  return sub_25C6D6200();
}

uint64_t sub_25C6C4980()
{
  uint64_t v0 = sub_25C6D55C0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (uint64_t *)((char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for ModifyContactAttributeConfirmationView();
  sub_25C6D5960();
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v1 + 88))(v3, v0) != *MEMORY[0x263F6CDC8]) {
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v1 + 8))(v3, v0);
  }
  (*(void (**)(uint64_t *, uint64_t))(v1 + 96))(v3, v0);
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  sub_25C6A665C(v3[2], v3[3]);
  sub_25C6C4AD0(v4, v5);
  return sub_25C6A665C(v4, v5);
}

void sub_25C6C4AD0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25C6D59F0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A5C6B58);
    oslog = sub_25C6D59D0();
    os_log_type_t v4 = sub_25C6D65D0();
    if (os_log_type_enabled(oslog, v4))
    {
      unint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl(&dword_25C69F000, oslog, v4, "#GetContactAttributeButtonableView could not obtain direct invocation for button press", v5, 2u);
      MEMORY[0x261190AB0](v5, -1, -1);
    }
LABEL_16:

    return;
  }
  sub_25C6A6700();
  sub_25C6A6740(a1, a2);
  uint64_t v8 = sub_25C6D65B0();
  if (!v8)
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25C6D59F0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A5C6B58);
    oslog = sub_25C6D59D0();
    os_log_type_t v13 = sub_25C6D65D0();
    if (os_log_type_enabled(oslog, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_25C69F000, oslog, v13, "#GetContactAttributeButtonableView could not convert direct invocation to actionable command", v14, 2u);
      MEMORY[0x261190AB0](v14, -1, -1);
    }
    sub_25C6A665C(a1, a2);
    goto LABEL_16;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = *(void **)(v2 + *(int *)(type metadata accessor for ModifyContactAttributeConfirmationView() + 20));
  if (v10)
  {
    id v11 = v10;
    sub_25C6D6340();

    sub_25C6A665C(a1, a2);
  }
  else
  {
    sub_25C6D6350();
    sub_25C6C58FC(&qword_26A5C5E48, MEMORY[0x263F77980]);
    sub_25C6D5BC0();
    __break(1u);
  }
}

uint64_t sub_25C6C4D88()
{
  uint64_t v0 = sub_25C6D55C0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (uint64_t *)((char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for ModifyContactAttributeConfirmationView();
  sub_25C6D5960();
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v1 + 88))(v3, v0) != *MEMORY[0x263F6CDC8]) {
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v1 + 8))(v3, v0);
  }
  (*(void (**)(uint64_t *, uint64_t))(v1 + 96))(v3, v0);
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  unint64_t v7 = v3[3];
  sub_25C6A665C(v4, v5);
  sub_25C6C4AD0(v6, v7);
  return sub_25C6A665C(v6, v7);
}

uint64_t sub_25C6C4ED8(uint64_t a1, void (*a2)(void))
{
  type metadata accessor for ModifyContactAttributeConfirmationView();
  a2();
  sub_25C6A401C();
  uint64_t v3 = sub_25C6D5EC0();
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  sub_25C6D5FB0();
  sub_25C6A4068(v3, v5, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C6C4FA0()
{
  type metadata accessor for ModifyContactAttributeConfirmationView();
  OUTLINED_FUNCTION_6_3();
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v5);
  sub_25C6C5850(v0, (uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ModifyContactAttributeConfirmationView);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  sub_25C6C579C((uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C66A0);
  sub_25C6A41AC(&qword_26A5C66A8, &qword_26A5C66A0);
  return sub_25C6D61F0();
}

uint64_t sub_25C6C50D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v62 = a2;
  uint64_t v56 = sub_25C6D5580();
  uint64_t v54 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v52 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_25C6D6210();
  uint64_t v58 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v48 = (uint64_t)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C66B0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v60 = v5;
  uint64_t v61 = v6;
  MEMORY[0x270FA5388](v5);
  char v50 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C66B8);
  uint64_t v57 = *(void *)(v59 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v59);
  uint64_t v51 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v53 = (char *)&v47 - v10;
  uint64_t v11 = sub_25C6D5E40();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for ModifyContactAttributeBodyView();
  uint64_t v16 = v15 - 8;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v49 = (uint64_t)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (uint64_t *)((char *)&v47 - v19);
  uint64_t v21 = a1 + *(int *)(type metadata accessor for ModifyContactAttributeConfirmationView() + 24);
  uint64_t v22 = (char *)v20 + *(int *)(v16 + 36);
  uint64_t v23 = sub_25C6D5980();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v22, v21, v23);
  sub_25C6D6350();
  sub_25C6C58FC(&qword_26A5C5E48, MEMORY[0x263F77980]);
  *uint64_t v20 = sub_25C6D5BD0();
  v20[1] = v24;
  uint64_t v63 = 0x402E000000000000;
  uint64_t v25 = *MEMORY[0x263F1A6C8];
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 104);
  v26(v14, v25, v11);
  sub_25C6A6798();
  sub_25C6D5AE0();
  uint64_t v63 = 0x4031000000000000;
  v26(v14, v25, v11);
  sub_25C6D5AE0();
  uint64_t v27 = v48;
  sub_25C6C3F80(v48);
  uint64_t v28 = v54;
  uint64_t v29 = v52;
  uint64_t v30 = v56;
  (*(void (**)(char *, void, uint64_t))(v54 + 104))(v52, *MEMORY[0x263F76980], v56);
  uint64_t v31 = sub_25C6C58FC(&qword_26A5C66C0, MEMORY[0x263F77660]);
  uint64_t v32 = v50;
  uint64_t v33 = v55;
  sub_25C6D5EF0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v27, v33);
  uint64_t v63 = v33;
  uint64_t v64 = v31;
  swift_getOpaqueTypeConformance2();
  uint64_t v34 = v51;
  uint64_t v35 = v60;
  sub_25C6D5F10();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v32, v35);
  uint64_t v36 = v57;
  uint64_t v37 = v53;
  uint64_t v38 = v59;
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v53, v34, v59);
  uint64_t v39 = v49;
  sub_25C6C5850((uint64_t)v20, v49, (void (*)(void))type metadata accessor for ModifyContactAttributeBodyView);
  uint64_t v40 = v36;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  uint64_t v42 = v38;
  v41(v34, v37, v38);
  uint64_t v43 = v62;
  sub_25C6C5850(v39, v62, (void (*)(void))type metadata accessor for ModifyContactAttributeBodyView);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C66C8);
  v41((char *)(v43 + *(int *)(v44 + 48)), v34, v42);
  uint64_t v45 = *(void (**)(char *, uint64_t))(v40 + 8);
  v45(v37, v42);
  sub_25C6A68D0((uint64_t)v20);
  v45(v34, v42);
  return sub_25C6A68D0(v39);
}

uint64_t sub_25C6C579C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModifyContactAttributeConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C6C5800@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ModifyContactAttributeConfirmationView();
  OUTLINED_FUNCTION_1_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_25C6C50D4(v5, a1);
}

uint64_t sub_25C6C5850(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C6C58B4()
{
  return sub_25C6C5AA8((uint64_t (*)(uint64_t))sub_25C6C4980);
}

uint64_t sub_25C6C58CC()
{
  return sub_25C6C4ED8(*(void *)(v0 + 16), (void (*)(void))sub_25C6CA50C);
}

uint64_t sub_25C6C58FC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroyTm_3()
{
  uint64_t v1 = type metadata accessor for ModifyContactAttributeConfirmationView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5E68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25C6D5AA0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3();
    v5();
  }
  else
  {
    swift_release();
  }

  sub_25C6D5980();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  v6();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25C6C5A90()
{
  return sub_25C6C5AA8((uint64_t (*)(uint64_t))sub_25C6C4D88);
}

uint64_t sub_25C6C5AA8(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for ModifyContactAttributeConfirmationView();
  OUTLINED_FUNCTION_1_1(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a1(v4);
}

uint64_t sub_25C6C5AFC()
{
  return sub_25C6C4ED8(*(void *)(v0 + 16), (void (*)(void))sub_25C6CA518);
}

uint64_t sub_25C6C5B2C()
{
  return sub_25C6A41AC(&qword_26A5C66F8, &qword_26A5C6700);
}

uint64_t OUTLINED_FUNCTION_8_2@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

char *sub_25C6C5B98(char *a1, char **a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((void *)a1 + 1) = a2[1];
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = v5;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    v13(v9, v10, v12);
    v13(&a1[a3[6]], (uint64_t)a2 + a3[6], v12);
    uint64_t v14 = a3[7];
    uint64_t v15 = &a1[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = sub_25C6D5980();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  }
  return a1;
}

uint64_t sub_25C6C5CEC(id *a1, int *a2)
{
  int v4 = (char *)a1 + a2[5];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6((char *)a1 + a2[6], v5);
  uint64_t v7 = (char *)a1 + a2[7];
  uint64_t v8 = sub_25C6D5980();
  uint64_t v9 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

char *sub_25C6C5DD4(char *a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = a2 + v8;
  id v11 = v6;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  v13(v9, v10, v12);
  v13(&a1[a3[6]], a2 + a3[6], v12);
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_25C6D5980();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  return a1;
}

uint64_t sub_25C6C5ED8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = a3[5];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24);
  v13(v10, v11, v12);
  v13(a1 + a3[6], a2 + a3[6], v12);
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_25C6D5980();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

char *sub_25C6C5FEC(char *a1, char *a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  id v8 = &a2[v6];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = sub_25C6D5980();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_25C6C60EC(uint64_t a1, char *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *((void *)a2 + 1);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = &a2[v7];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v11 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + a3[6], &a2[a3[6]], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_25C6D5980();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_25C6C61FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6C6210);
}

uint64_t sub_25C6C6210(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v11 = sub_25C6D5980();
      uint64_t v12 = *(int *)(a3 + 28);
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v12, a2, v11);
  }
}

uint64_t sub_25C6C62CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6C62E0);
}

void *sub_25C6C62E0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = sub_25C6D5980();
      uint64_t v11 = *(int *)(a4 + 28);
    }
    return (void *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for ModifyContactAttributeBodyView()
{
  uint64_t result = qword_26A5C6708;
  if (!qword_26A5C6708) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C6C63D4()
{
  sub_25C6AF348();
  if (v0 <= 0x3F)
  {
    sub_25C6D5980();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_25C6C64A8()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_25C6C64C4()
{
  type metadata accessor for ModifyContactAttributeBodyView();
  uint64_t v0 = sub_25C6D5940();
  unint64_t v2 = v1;
  swift_bridgeObjectRelease();
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = v0 & 0xFFFFFFFFFFFFLL;
  }
  return v3 == 0;
}

uint64_t sub_25C6C651C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5D00);
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3_4();
  type metadata accessor for ModifyContactAttributeBodyView();
  uint64_t v5 = sub_25C6D5940();
  unint64_t v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v8) {
    return sub_25C6D5940();
  }
  sub_25C6D5950();
  uint64_t v10 = (void *)sub_25C6D56D0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  uint64_t v11 = sub_25C6D6690();

  return v11;
}

uint64_t sub_25C6C6618()
{
  sub_25C6D5920();
  OUTLINED_FUNCTION_1();
  uint64_t v115 = v2;
  uint64_t v116 = v1;
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v113 = (char *)&v106 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v114 = (char *)&v106 - v5;
  uint64_t v6 = type metadata accessor for ModifyContactAttributeBodyView();
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v118 = (uint64_t)&v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v111 = (uint64_t)&v106 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v117 = (uint64_t)&v106 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6120);
  MEMORY[0x270FA5388](v16 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6730);
  OUTLINED_FUNCTION_1();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_2();
  uint64_t v26 = v25 - v24;
  BOOL v27 = sub_25C6CA68C();
  uint64_t v28 = sub_25C6C651C();
  uint64_t v112 = v6;
  if (v27)
  {
    uint64_t v106 = v10;
    uint64_t v107 = v8;
    uint64_t v108 = v26;
    uint64_t v109 = v22;
    uint64_t v110 = v20;
    uint64_t v119 = v28;
    uint64_t v120 = v29;
    sub_25C6A401C();
    uint64_t v30 = sub_25C6D5EC0();
    uint64_t v32 = v31;
    char v34 = v33 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
    sub_25C6D5AF0();
    uint64_t v35 = sub_25C6D5E00();
    OUTLINED_FUNCTION_3_5(v35);
    sub_25C6C7750(v19);
    uint64_t v36 = sub_25C6D5EB0();
    uint64_t v38 = v37;
    char v40 = v39;
    uint64_t v41 = v0;
    swift_release();
    char v42 = v40 & 1;
    sub_25C6A4068(v30, v32, v34);
    swift_bridgeObjectRelease();
    sub_25C6D5E10();
    uint64_t v43 = sub_25C6D5E80();
    uint64_t v45 = v44;
    int v47 = v46;
    sub_25C6A4068(v36, v38, v42);
    swift_bridgeObjectRelease();
    char v48 = sub_25C6C64C4();
    uint64_t v118 = v41;
    uint64_t v49 = v41;
    uint64_t v50 = v117;
    sub_25C6C77B0(v49, v117);
    if ((v48 & 1) == 0)
    {
      uint64_t v51 = v114;
      sub_25C6D5930();
      uint64_t v52 = *MEMORY[0x263F6CF38];
      uint64_t v54 = v115;
      uint64_t v53 = v116;
      uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v115 + 104);
      LODWORD(v112) = v47;
      uint64_t v56 = v113;
      v55(v113, v52, v116);
      sub_25C6D5910();
      uint64_t v57 = *(void (**)(char *, uint64_t))(v54 + 8);
      char v48 = (char)v57;
      v57(v56, v53);
      uint64_t v58 = v53;
      uint64_t v50 = v117;
      v57(v51, v58);
    }
    sub_25C6A68D0(v50);
    OUTLINED_FUNCTION_8_3();
    uint64_t v59 = sub_25C6D5E70();
    uint64_t v61 = v60;
    char v63 = v62;
    uint64_t v65 = v64;
    sub_25C6A4068(v43, v45, v48);
    swift_bridgeObjectRelease();
    uint64_t v119 = v59;
    uint64_t v120 = v61;
    char v121 = v63 & 1;
    uint64_t v122 = v65;
    uint64_t v66 = v111;
    sub_25C6C77B0(v118, v111);
    unint64_t v67 = (*(unsigned __int8 *)(v107 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v107 + 80);
    uint64_t v68 = swift_allocObject();
    sub_25C6C7978(v66, v68 + v67);
    uint64_t v69 = MEMORY[0x263F1A830];
    uint64_t v70 = MEMORY[0x263F1A820];
    sub_25C6D5F90();
    swift_release();
    sub_25C6A4068(v119, v120, v121);
    swift_bridgeObjectRelease();
    uint64_t v119 = v69;
    uint64_t v120 = v70;
    swift_getOpaqueTypeConformance2();
    uint64_t v71 = sub_25C6D5ED0();
    OUTLINED_FUNCTION_5_3();
    v72();
  }
  else
  {
    uint64_t v119 = v28;
    uint64_t v120 = v29;
    sub_25C6A401C();
    uint64_t v73 = sub_25C6D5EC0();
    uint64_t v75 = v74;
    char v77 = v76 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
    sub_25C6D5AF0();
    uint64_t v78 = sub_25C6D5E00();
    OUTLINED_FUNCTION_3_5(v78);
    uint64_t v79 = v0;
    sub_25C6C7750(v19);
    uint64_t v80 = sub_25C6D5EB0();
    uint64_t v82 = v81;
    char v84 = v83;
    swift_release();
    char v85 = v84 & 1;
    sub_25C6A4068(v73, v75, v77);
    swift_bridgeObjectRelease();
    sub_25C6D5E10();
    uint64_t v86 = sub_25C6D5E80();
    uint64_t v88 = v87;
    sub_25C6A4068(v80, v82, v85);
    swift_bridgeObjectRelease();
    LOBYTE(v80) = sub_25C6C64C4();
    uint64_t v89 = v79;
    uint64_t v90 = v118;
    sub_25C6C77B0(v89, v118);
    char v91 = 0;
    if ((v80 & 1) == 0)
    {
      uint64_t v92 = v114;
      sub_25C6D5930();
      uint64_t v94 = v115;
      uint64_t v93 = v116;
      uint64_t v95 = v113;
      (*(void (**)(char *, void, uint64_t))(v115 + 104))(v113, *MEMORY[0x263F6CF38], v116);
      char v91 = sub_25C6D5910();
      uint64_t v96 = *(void (**)(char *, uint64_t))(v94 + 8);
      v96(v95, v93);
      uint64_t v97 = v93;
      uint64_t v90 = v118;
      v96(v92, v97);
    }
    sub_25C6A68D0(v90);
    OUTLINED_FUNCTION_8_3();
    uint64_t v98 = sub_25C6D5E70();
    uint64_t v100 = v99;
    uint64_t v102 = v101;
    char v104 = v103 & 1;
    sub_25C6A4068(v86, v88, v91);
    swift_bridgeObjectRelease();
    uint64_t v119 = v98;
    uint64_t v120 = v100;
    char v121 = v104;
    uint64_t v122 = v102;
    uint64_t v71 = sub_25C6D5ED0();
    sub_25C6A4068(v98, v100, v104);
    swift_bridgeObjectRelease();
  }
  return v71;
}

uint64_t sub_25C6C6DB0(id *a1)
{
  type metadata accessor for ModifyContactAttributeBodyView();
  uint64_t v2 = sub_25C6D5900();
  if (*a1)
  {
    uint64_t v4 = v2;
    unint64_t v5 = v3;
    id v6 = *a1;
    sub_25C6A5654(v4, v5, v6);

    return sub_25C6A665C(v4, v5);
  }
  else
  {
    sub_25C6D6350();
    sub_25C6C7A3C(&qword_26A5C5E48, MEMORY[0x263F77980]);
    uint64_t result = sub_25C6D5BC0();
    __break(1u);
  }
  return result;
}

uint64_t sub_25C6C6E98()
{
  sub_25C6D5D20();
  uint64_t v0 = sub_25C6D5EA0();
  uint64_t v2 = v1;
  char v4 = v3 & 1;
  uint64_t v5 = sub_25C6D5E90();
  sub_25C6A4068(v0, v2, v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25C6C6F78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v59 = sub_25C6D5580();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v5);
  uint64_t v6 = sub_25C6D55B0();
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6120);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_3_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5D00);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DD8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v12);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6718);
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_2();
  uint64_t v19 = v18 - v17;
  sub_25C6D62C0();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v21);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6720);
  OUTLINED_FUNCTION_1();
  uint64_t v56 = v22;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v24);
  BOOL v25 = sub_25C6C64C4();
  uint64_t v26 = sub_25C6C6618();
  uint64_t v27 = MEMORY[0x263F1B720];
  if (v25)
  {
    uint64_t v28 = MEMORY[0x263F1B718];
    sub_25C6D5FB0();
    swift_release();
    uint64_t v70 = v27;
    uint64_t v71 = v28;
    swift_getOpaqueTypeConformance2();
    uint64_t v26 = sub_25C6D5ED0();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v19, v13);
  }
  uint64_t v72 = v27;
  uint64_t v73 = MEMORY[0x263F774B0];
  uint64_t v70 = v26;
  uint64_t v69 = 0;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v66 = 0;
  long long v64 = 0u;
  long long v65 = 0u;
  if (sub_25C6C64C4())
  {
    uint64_t v63 = 0;
    long long v62 = 0u;
    long long v61 = 0u;
  }
  else
  {
    type metadata accessor for ModifyContactAttributeBodyView();
    uint64_t v53 = v3;
    sub_25C6D5950();
    uint64_t v29 = (void *)sub_25C6D56D0();
    uint64_t v30 = OUTLINED_FUNCTION_9_3();
    v31(v30);
    sub_25C6D6690();

    sub_25C6A401C();
    uint64_t v32 = sub_25C6D5EC0();
    uint64_t v34 = v33;
    char v36 = v35 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
    sub_25C6D5AF0();
    uint64_t v37 = sub_25C6D5E00();
    __swift_storeEnumTagSinglePayload(v1, 1, 1, v37);
    sub_25C6D5E20();
    sub_25C6C7750(v1);
    uint64_t v38 = sub_25C6D5EB0();
    uint64_t v40 = v39;
    char v42 = v41;
    swift_release();
    sub_25C6A4068(v32, v34, v36);
    swift_bridgeObjectRelease();
    LOBYTE(v62) = v42 & 1;
    uint64_t v43 = MEMORY[0x263F1A820];
    sub_25C6D5FB0();
    uint64_t v44 = v40;
    uint64_t v3 = v53;
    sub_25C6A4068(v38, v44, v42 & 1);
    swift_bridgeObjectRelease();
    *((void *)&v61 + 1) = v43;
    swift_getOpaqueTypeConformance2();
    uint64_t v45 = sub_25C6D5ED0();
    OUTLINED_FUNCTION_5_3();
    v46();
    uint64_t v63 = MEMORY[0x263F774B0];
    *((void *)&v62 + 1) = MEMORY[0x263F1B720];
    *(void *)&long long v61 = v45;
  }
  type metadata accessor for ModifyContactAttributeBodyView();
  sub_25C6D5950();
  int v47 = (void *)sub_25C6D56D0();
  uint64_t v48 = OUTLINED_FUNCTION_9_3();
  v49(v48);
  id v50 = objc_msgSend(v47, sel_identifier);

  sub_25C6D63D0();
  sub_25C6D55A0();
  swift_bridgeObjectRelease();
  v60[3] = sub_25C6D61C0();
  v60[4] = MEMORY[0x263F77548];
  __swift_allocate_boxed_opaque_existential_1(v60);
  sub_25C6D61D0();
  sub_25C6D62B0();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v58, *MEMORY[0x263F76980], v59);
  sub_25C6C7A3C(&qword_26A5C6728, MEMORY[0x263F777D0]);
  sub_25C6D5EF0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v58, v59);
  OUTLINED_FUNCTION_5_3();
  v51();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))(a1, v55, v57);
}

uint64_t sub_25C6C7750(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6120);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C6C77B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModifyContactAttributeBodyView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C6C7814()
{
  uint64_t v1 = (int *)(type metadata accessor for ModifyContactAttributeBodyView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v6 + v1[8], v8);
  uint64_t v10 = v6 + v1[9];
  uint64_t v11 = sub_25C6D5980();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25C6C7978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ModifyContactAttributeBodyView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C6C79DC()
{
  uint64_t v1 = *(void *)(type metadata accessor for ModifyContactAttributeBodyView() - 8);
  uint64_t v2 = (id *)(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));

  return sub_25C6C6DB0(v2);
}

uint64_t sub_25C6C7A3C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C6C7A84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_3_5(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_25C6D5E20();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return v0;
}

uint64_t sub_25C6C7B8C()
{
  sub_25C6D5E40();
  OUTLINED_FUNCTION_0_5();
  uint64_t v1 = v0;
  MEMORY[0x270FA5388](v2);
  if (qword_26A5C5CD8 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void (**)(uint64_t))(v1 + 104);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  v3(v4);
  sub_25C6A6798();
  OUTLINED_FUNCTION_6();
  type metadata accessor for GetContactQuickActionButtonLabelStyle(0);
  if (qword_26A5C5CE0 != -1) {
    swift_once();
  }
  uint64_t v5 = OUTLINED_FUNCTION_5_0();
  v3(v5);
  return OUTLINED_FUNCTION_6();
}

uint64_t sub_25C6C7CE0@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A5C5CC8 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_26A5C7B80;
  *(void *)a1 = sub_25C6D5CD0();
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6758);
  return sub_25C6C7D70(v1, a1 + *(int *)(v4 + 44));
}

uint64_t sub_25C6C7D70@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  v37[1] = a1;
  uint64_t v44 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6120);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v40 = (uint64_t)v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25C6D5D50();
  uint64_t v42 = *(void *)(v4 - 8);
  uint64_t v43 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v38 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6760) - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v41);
  uint64_t v8 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v39 = (uint64_t)v37 - v9;
  uint64_t v10 = sub_25C6D5D30();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6768);
  uint64_t v15 = v14 - 8;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v37 - v19;
  sub_25C6D5D40();
  type metadata accessor for GetContactQuickActionButtonLabelStyle(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  sub_25C6D5AF0();
  sub_25C6D6160();
  sub_25C6D5B10();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v18, v13, v10);
  uint64_t v21 = &v18[*(int *)(v15 + 44)];
  long long v22 = v46;
  *(_OWORD *)uint64_t v21 = v45;
  *((_OWORD *)v21 + 1) = v22;
  *((_OWORD *)v21 + 2) = v47;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_25C6A4150((uint64_t)v18, (uint64_t)v20, &qword_26A5C6768);
  uint64_t v23 = v38;
  sub_25C6D5D60();
  sub_25C6D5AF0();
  uint64_t v24 = sub_25C6D5E00();
  uint64_t v25 = v40;
  __swift_storeEnumTagSinglePayload(v40, 1, 1, v24);
  uint64_t v26 = sub_25C6D5E20();
  sub_25C6AF7F4(v25, &qword_26A5C6120);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v28 = v42;
  uint64_t v29 = v23;
  uint64_t v30 = v23;
  uint64_t v31 = v43;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v8, v29, v43);
  uint64_t v32 = (uint64_t *)&v8[*(int *)(v41 + 44)];
  *uint64_t v32 = KeyPath;
  v32[1] = v26;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v31);
  uint64_t v33 = v39;
  sub_25C6A4150((uint64_t)v8, v39, &qword_26A5C6760);
  sub_25C6AF3C8((uint64_t)v20, (uint64_t)v18, &qword_26A5C6768);
  sub_25C6AF3C8(v33, (uint64_t)v8, &qword_26A5C6760);
  uint64_t v34 = v44;
  sub_25C6AF3C8((uint64_t)v18, v44, &qword_26A5C6768);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6770);
  sub_25C6AF3C8((uint64_t)v8, v34 + *(int *)(v35 + 48), &qword_26A5C6760);
  sub_25C6AF7F4(v33, &qword_26A5C6760);
  sub_25C6AF7F4((uint64_t)v20, &qword_26A5C6768);
  sub_25C6AF7F4((uint64_t)v8, &qword_26A5C6760);
  return sub_25C6AF7F4((uint64_t)v18, &qword_26A5C6768);
}

uint64_t sub_25C6C8220@<X0>(uint64_t a1@<X8>)
{
  sub_25C6D5D30();
  OUTLINED_FUNCTION_0_5();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C6D5D40();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  sub_25C6D5AF0();
  sub_25C6D6160();
  sub_25C6D5B10();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))(a1, v7, v1);
  uint64_t v8 = (_OWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6768) + 36));
  long long v9 = v11[1];
  *uint64_t v8 = v11[0];
  v8[1] = v9;
  v8[2] = v11[2];
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v1);
}

uint64_t type metadata accessor for GetContactQuickActionButtonLabelStyle(uint64_t a1)
{
  return sub_25C6C0238(a1, (uint64_t *)&unk_26A5C6738);
}

uint64_t sub_25C6C8374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6C8388);
}

uint64_t sub_25C6C8388()
{
  OUTLINED_FUNCTION_5_4();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);

  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t sub_25C6C83D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6C83E4);
}

uint64_t sub_25C6C83E4()
{
  OUTLINED_FUNCTION_5_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v0 = OUTLINED_FUNCTION_4_3();

  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_25C6C8424(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_25C6C8494(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_25C6C84FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_25C6C8564(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_25C6C85CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_25C6C8634(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_25C6C869C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6C86B0);
}

uint64_t sub_25C6C86B0()
{
  OUTLINED_FUNCTION_5_4();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);

  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t sub_25C6C86F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6C870C);
}

uint64_t sub_25C6C870C()
{
  OUTLINED_FUNCTION_5_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6100);
  uint64_t v0 = OUTLINED_FUNCTION_4_3();

  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t type metadata accessor for GetContactQuickActionButtonLabelStyleIconOnly(uint64_t a1)
{
  return sub_25C6C0238(a1, (uint64_t *)&unk_26A5C6748);
}

void sub_25C6C876C()
{
  sub_25C6AF348();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_25C6C87F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C6C8814()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_25C6C883C()
{
  unint64_t result = qword_26A5C6778;
  if (!qword_26A5C6778)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6780);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6778);
  }
  return result;
}

unint64_t sub_25C6C8894()
{
  unint64_t result = qword_26A5C6788;
  if (!qword_26A5C6788)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6768);
    sub_25C6C8910();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6788);
  }
  return result;
}

unint64_t sub_25C6C8910()
{
  unint64_t result = qword_26A5C6790;
  if (!qword_26A5C6790)
  {
    sub_25C6D5D30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6790);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return v0;
}

uint64_t sub_25C6C89A0()
{
  uint64_t v0 = sub_25C6D5800();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeAgeView();
  type metadata accessor for GetContactAttributeViewModel();
  uint64_t result = MEMORY[0x26118F420]();
  if (*(void *)(result + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, result + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)), v0);
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_25C6D57D0();
    uint64_t v7 = v6;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    if (v7) {
      return v5;
    }
    else {
      return 48;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t GetContactAttributeAgeView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v85 = a1;
  uint64_t ContactAttributeAgeView = type metadata accessor for GetContactAttributeAgeView();
  uint64_t v3 = ContactAttributeAgeView - 8;
  uint64_t v81 = *(void *)(ContactAttributeAgeView - 8);
  MEMORY[0x270FA5388](ContactAttributeAgeView);
  uint64_t v82 = v4;
  uint64_t v83 = (uint64_t)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25C6D55B0();
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_7();
  uint64_t v80 = v6;
  uint64_t v71 = sub_25C6D5800();
  OUTLINED_FUNCTION_1();
  uint64_t v67 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7();
  uint64_t v70 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5D00);
  OUTLINED_FUNCTION_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5DD8);
  OUTLINED_FUNCTION_1();
  uint64_t v86 = v16;
  uint64_t v87 = v17;
  MEMORY[0x270FA5388](v16);
  sub_25C6D6300();
  OUTLINED_FUNCTION_1();
  uint64_t v73 = v19;
  uint64_t v74 = v18;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_7();
  uint64_t v72 = v20;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6798);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_7();
  uint64_t v78 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C67A0);
  OUTLINED_FUNCTION_1();
  uint64_t v76 = v24;
  uint64_t v77 = v23;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_7();
  uint64_t v75 = v25;
  uint64_t v26 = sub_25C6C89A0();
  uint64_t v108 = MEMORY[0x263F8D310];
  uint64_t v109 = MEMORY[0x263F779A8];
  uint64_t v106 = v26;
  uint64_t v107 = v27;
  uint64_t v28 = *(int *)(v3 + 28);
  uint64_t v84 = v1;
  uint64_t v29 = v1 + v28;
  uint64_t ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  uint64_t v69 = v29;
  sub_25C6D5850();
  uint64_t v30 = (void *)sub_25C6D56D0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  uint64_t v31 = sub_25C6D6690();
  uint64_t v33 = v32;

  uint64_t v101 = v31;
  uint64_t v102 = v33;
  sub_25C6A401C();
  uint64_t v34 = sub_25C6D5EC0();
  uint64_t v36 = v35;
  uint64_t v101 = v34;
  uint64_t v102 = v35;
  char v38 = v37 & 1;
  char v103 = v37 & 1;
  uint64_t v104 = v39;
  uint64_t v40 = MEMORY[0x263F1A830];
  uint64_t v41 = MEMORY[0x263F1A820];
  sub_25C6D5FB0();
  sub_25C6A4068(v34, v36, v38);
  swift_bridgeObjectRelease();
  uint64_t v101 = v40;
  uint64_t v102 = v41;
  swift_getOpaqueTypeConformance2();
  uint64_t v42 = sub_25C6D5ED0();
  OUTLINED_FUNCTION_3();
  uint64_t v44 = v43();
  uint64_t v104 = MEMORY[0x263F1B720];
  uint64_t v105 = MEMORY[0x263F774B8];
  uint64_t v101 = v42;
  uint64_t result = MEMORY[0x26118F420](v44);
  if (*(void *)(result + 16))
  {
    uint64_t v46 = v67;
    uint64_t v48 = v70;
    uint64_t v47 = v71;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v67 + 16))(v70, result + ((*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80)), v71);
    swift_bridgeObjectRelease();
    uint64_t v49 = sub_25C6D57C0();
    uint64_t v51 = v50;
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v48, v47);
    if (v51)
    {
      uint64_t v52 = MEMORY[0x263F8D310];
      *((void *)&v99 + 1) = MEMORY[0x263F8D310];
      uint64_t v53 = MEMORY[0x263F779A8];
      uint64_t v100 = MEMORY[0x263F779A8];
      *(void *)&long long v98 = v49;
      *((void *)&v98 + 1) = v51;
    }
    else
    {
      uint64_t v100 = 0;
      long long v98 = 0u;
      long long v99 = 0u;
      uint64_t v52 = MEMORY[0x263F8D310];
      uint64_t v53 = MEMORY[0x263F779A8];
    }
    uint64_t v97 = 0;
    long long v95 = 0u;
    long long v96 = 0u;
    uint64_t v94 = 0;
    long long v92 = 0u;
    long long v93 = 0u;
    uint64_t v54 = v69;
    uint64_t v55 = sub_25C6D4B70();
    if (v56)
    {
      *((void *)&v90 + 1) = v52;
      uint64_t v91 = v53;
      *(void *)&long long v89 = v55;
      *((void *)&v89 + 1) = v56;
    }
    else
    {
      uint64_t v91 = 0;
      long long v89 = 0u;
      long long v90 = 0u;
    }
    sub_25C6D5830();
    sub_25C6D55A0();
    swift_bridgeObjectRelease();
    v88[3] = sub_25C6D61C0();
    v88[4] = MEMORY[0x263F77548];
    __swift_allocate_boxed_opaque_existential_1(v88);
    sub_25C6D61D0();
    uint64_t v57 = v72;
    sub_25C6D62F0();
    uint64_t v58 = *(void *)(v54 + *(int *)(ContactAttributeViewModel + 28));
    uint64_t v60 = v73;
    uint64_t v59 = v74;
    uint64_t v61 = v78;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 16))(v78, v57, v74);
    *(void *)(v61 + *(int *)(v79 + 36)) = v58;
    long long v62 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
    swift_retain();
    v62(v57, v59);
    uint64_t v63 = v83;
    sub_25C6C9534(v84, v83);
    unint64_t v64 = (*(unsigned __int8 *)(v81 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
    uint64_t v65 = swift_allocObject();
    sub_25C6C9700(v63, v65 + v64);
    sub_25C6C97C4();
    uint64_t v66 = v75;
    sub_25C6D5F90();
    swift_release();
    sub_25C6C98E4(v61);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v76 + 32))(v85, v66, v77);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for GetContactAttributeAgeView()
{
  uint64_t result = qword_26A5C67B8;
  if (!qword_26A5C67B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C6C91C0()
{
  uint64_t v0 = sub_25C6D6320();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25C6D58C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeAgeView();
  type metadata accessor for GetContactAttributeViewModel();
  sub_25C6D57A0();
  uint64_t v8 = sub_25C6D5890();
  unint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v10 >> 60 == 15)
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_25C6D59F0();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A5C6B58);
    uint64_t v12 = sub_25C6D59D0();
    os_log_type_t v13 = sub_25C6D65D0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_25C69F000, v12, v13, "#GetContactAttributeAgeView could not obtain direct invocation for button press", v14, 2u);
      MEMORY[0x261190AB0](v14, -1, -1);
    }
  }
  else
  {
    sub_25C6A6700();
    uint64_t v15 = sub_25C6D65B0();
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      sub_25C6D6250();
      id v17 = v16;
      sub_25C6D6310();

      sub_25C6A665C(v8, v10);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }
    else
    {
      if (qword_26A5C5CC0 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_25C6D59F0();
      __swift_project_value_buffer(v18, (uint64_t)qword_26A5C6B58);
      uint64_t v19 = sub_25C6D59D0();
      os_log_type_t v20 = sub_25C6D65D0();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_25C69F000, v19, v20, "#GetContactAttributeAgeView could not convert direct invocation to actionable command", v21, 2u);
        MEMORY[0x261190AB0](v21, -1, -1);
      }
      sub_25C6A665C(v8, v10);
    }
  }
}

uint64_t sub_25C6C9534(uint64_t a1, uint64_t a2)
{
  uint64_t ContactAttributeAgeView = type metadata accessor for GetContactAttributeAgeView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(ContactAttributeAgeView - 8) + 16))(a2, a1, ContactAttributeAgeView);
  return a2;
}

uint64_t sub_25C6C9598()
{
  uint64_t v1 = (int *)(type metadata accessor for GetContactAttributeAgeView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  sub_25C6D6270();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  v7();
  __swift_destroy_boxed_opaque_existential_0(v6 + v1[7]);
  type metadata accessor for GetContactAttributeViewModel();
  sub_25C6D5870();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  v8();
  sub_25C6D5AA0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  v9();
  swift_release();

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25C6C9700(uint64_t a1, uint64_t a2)
{
  uint64_t ContactAttributeAgeView = type metadata accessor for GetContactAttributeAgeView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(ContactAttributeAgeView - 8) + 32))(a2, a1, ContactAttributeAgeView);
  return a2;
}

void sub_25C6C9764()
{
  type metadata accessor for GetContactAttributeAgeView();

  sub_25C6C91C0();
}

unint64_t sub_25C6C97C4()
{
  unint64_t result = qword_26A5C67A8;
  if (!qword_26A5C67A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6798);
    sub_25C6C9840();
    sub_25C6C9890();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C67A8);
  }
  return result;
}

unint64_t sub_25C6C9840()
{
  unint64_t result = qword_26A5C67B0;
  if (!qword_26A5C67B0)
  {
    sub_25C6D6300();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C67B0);
  }
  return result;
}

unint64_t sub_25C6C9890()
{
  unint64_t result = qword_26A5C5FA8;
  if (!qword_26A5C5FA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C5FB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C5FA8);
  }
  return result;
}

uint64_t sub_25C6C98E4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6798);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C6C9944()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for GetContactAttributeAgeView(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_25C6D6270();
    (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    unint64_t v9 = &a1[v8];
    unint64_t v10 = (char *)a2 + v8;
    long long v11 = *(_OWORD *)(v10 + 24);
    *(_OWORD *)&a1[v8 + 24] = v11;
    (**(void (***)(char *, char *))(v11 - 8))(&a1[v8], v10);
    uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
    uint64_t v13 = ContactAttributeViewModel[5];
    uint64_t v14 = &v9[v13];
    uint64_t v15 = &v10[v13];
    uint64_t v16 = sub_25C6D5870();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = ContactAttributeViewModel[6];
    uint64_t v18 = &v9[v17];
    uint64_t v19 = &v10[v17];
    uint64_t v20 = sub_25C6D5AA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    *(void *)&v9[ContactAttributeViewModel[7]] = *(void *)&v10[ContactAttributeViewModel[7]];
  }
  swift_retain();
  return a1;
}

uint64_t destroy for GetContactAttributeAgeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C6D6270();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  __swift_destroy_boxed_opaque_existential_0(v5);
  uint64_t ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  uint64_t v7 = v5 + *(int *)(ContactAttributeViewModel + 20);
  uint64_t v8 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v5 + *(int *)(ContactAttributeViewModel + 24);
  uint64_t v10 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);

  return swift_release();
}

uint64_t initializeWithCopy for GetContactAttributeAgeView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C6D6270();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(v9 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + v7, v9);
  uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  uint64_t v12 = ContactAttributeViewModel[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = ContactAttributeViewModel[6];
  uint64_t v17 = v8 + v16;
  uint64_t v18 = v9 + v16;
  uint64_t v19 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  *(void *)(v8 + ContactAttributeViewModel[7]) = *(void *)(v9 + ContactAttributeViewModel[7]);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GetContactAttributeAgeView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C6D6270();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + v7), v9);
  uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  uint64_t v11 = ContactAttributeViewModel[5];
  uint64_t v12 = v8 + v11;
  uint64_t v13 = (char *)v9 + v11;
  uint64_t v14 = sub_25C6D5870();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = ContactAttributeViewModel[6];
  uint64_t v16 = v8 + v15;
  uint64_t v17 = (char *)v9 + v15;
  uint64_t v18 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  *(void *)(v8 + ContactAttributeViewModel[7]) = *(uint64_t *)((char *)v9 + ContactAttributeViewModel[7]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for GetContactAttributeAgeView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C6D6270();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(a2 + v7 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(a2 + v7 + 32);
  uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  uint64_t v12 = ContactAttributeViewModel[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = ContactAttributeViewModel[6];
  uint64_t v17 = v8 + v16;
  uint64_t v18 = v9 + v16;
  uint64_t v19 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  *(void *)(v8 + ContactAttributeViewModel[7]) = *(void *)(v9 + ContactAttributeViewModel[7]);
  return a1;
}

uint64_t assignWithTake for GetContactAttributeAgeView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C6D6270();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  __swift_destroy_boxed_opaque_existential_0(a1 + v7);
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  uint64_t ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  uint64_t v12 = ContactAttributeViewModel[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = ContactAttributeViewModel[6];
  uint64_t v17 = v8 + v16;
  uint64_t v18 = v9 + v16;
  uint64_t v19 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  *(void *)(v8 + ContactAttributeViewModel[7]) = *(void *)(v9 + ContactAttributeViewModel[7]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeAgeView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6CA1AC);
}

uint64_t sub_25C6CA1AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C6D6270();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t ContactAttributeViewModel = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }

  return __swift_getEnumTagSinglePayload(v9, a2, ContactAttributeViewModel);
}

uint64_t storeEnumTagSinglePayload for GetContactAttributeAgeView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6CA23C);
}

uint64_t sub_25C6CA23C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25C6D6270();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t ContactAttributeViewModel = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  return __swift_storeEnumTagSinglePayload(v11, a2, a2, ContactAttributeViewModel);
}

uint64_t sub_25C6CA2C0()
{
  uint64_t result = sub_25C6D6270();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for GetContactAttributeViewModel();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C6CA388()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C6CA3E4()
{
  return sub_25C6CA524(MEMORY[0x263F6CDF0]);
}

uint64_t sub_25C6CA3F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  sub_25C6CA89C(a1, a2);
  if ((v4 & 1) == 0) {
    return 0;
  }
  OUTLINED_FUNCTION_2_6();
  return v3;
}

uint64_t sub_25C6CA438(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  sub_25C6CA914(a1);
  if ((v3 & 1) == 0) {
    return 0;
  }
  OUTLINED_FUNCTION_2_6();
  return v2;
}

void *sub_25C6CA480(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  unint64_t v3 = sub_25C6CA808(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v3);
  id v6 = v5;
  return v5;
}

uint64_t sub_25C6CA4C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_25C6CA89C(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_25C6CA50C()
{
  return sub_25C6CA524(MEMORY[0x263F6CDE8]);
}

uint64_t sub_25C6CA518()
{
  return sub_25C6CA524(MEMORY[0x263F6CE00]);
}

uint64_t sub_25C6CA524(unsigned int *a1)
{
  uint64_t v3 = sub_25C6D55D0();
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_5();
  uint64_t v7 = sub_25C6D5600();
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25C6D5970();
  uint64_t v14 = MEMORY[0x26118F200](v13);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v1, *a1, v3);
  uint64_t v15 = sub_25C6CA438(v1, v14);
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  if (!v17) {
    return sub_25C6D6440();
  }
  return v15;
}

BOOL sub_25C6CA68C()
{
  uint64_t v1 = sub_25C6D58E0();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_5();
  uint64_t v5 = sub_25C6D55C0();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C6D5960();
  int v11 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v10, v5);
  int v12 = *MEMORY[0x263F6CDC0];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  if (v11 != v12) {
    return 0;
  }
  sub_25C6D58D0();
  BOOL v13 = (*(unsigned int (**)(uint64_t, uint64_t))(v3 + 88))(v0, v1) == *MEMORY[0x263F6CF20];
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return v13;
}

unint64_t sub_25C6CA808(uint64_t a1)
{
  sub_25C6D63D0();
  sub_25C6D6860();
  sub_25C6D6460();
  uint64_t v2 = sub_25C6D6870();
  swift_bridgeObjectRelease();

  return sub_25C6CA998(a1, v2);
}

unint64_t sub_25C6CA89C(uint64_t a1, uint64_t a2)
{
  sub_25C6D6860();
  sub_25C6D6460();
  uint64_t v4 = sub_25C6D6870();

  return sub_25C6CAB10(a1, a2, v4);
}

unint64_t sub_25C6CA914(uint64_t a1)
{
  sub_25C6D55D0();
  sub_25C6CADA0(&qword_26A5C67C8);
  uint64_t v2 = sub_25C6D6380();

  return sub_25C6CABF4(a1, v2);
}

unint64_t sub_25C6CA998(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_25C6D63D0();
    uint64_t v8 = v7;
    if (v6 == sub_25C6D63D0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_25C6D6830();
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
          uint64_t v13 = sub_25C6D63D0();
          uint64_t v15 = v14;
          if (v13 == sub_25C6D63D0() && v15 == v16) {
            break;
          }
          char v18 = sub_25C6D6830();
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

unint64_t sub_25C6CAB10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25C6D6830() & 1) == 0)
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
      while (!v14 && (sub_25C6D6830() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25C6CABF4(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_25C6D55D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
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
      sub_25C6CADA0((unint64_t *)&unk_26A5C67D0);
      char v15 = sub_25C6D6390();
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

uint64_t sub_25C6CADA0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25C6D55D0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return swift_bridgeObjectRetain();
}

void sub_25C6CAE20()
{
  OUTLINED_FUNCTION_23();
  uint64_t v3 = sub_25C6D5600();
  uint64_t v4 = OUTLINED_FUNCTION_21_1(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_16_2();
  uint64_t v5 = sub_25C6D58C0();
  uint64_t v6 = OUTLINED_FUNCTION_21_1(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C5D00);
  OUTLINED_FUNCTION_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_39();
  sub_25C6D5760();
  uint64_t v14 = sub_25C6D56D0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v2, v10);
  sub_25C6D5730();
  if (sub_25C6D5740()) {
    uint64_t v15 = sub_25C6D6030();
  }
  else {
    uint64_t v15 = sub_25C6D6020();
  }
  uint64_t v16 = v15;
  sub_25C6D5770();
  id v17 = objc_msgSend(self, sel_sharedInstance);
  v19[3] = sub_25C6AA904(0, (unint64_t *)&qword_26A5C69C0);
  v19[4] = &off_2709CC788;
  v19[0] = v17;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, uint64_t, id))(v0 + 488))(v14, v9, v16, v19, v1, objc_msgSend(objc_allocWithZone(MEMORY[0x263F336C0]), sel_init));
  sub_25C6D5780();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v18();
  OUTLINED_FUNCTION_26();
}

uint64_t sub_25C6CB030()
{
  return sub_25C6CB048(MEMORY[0x263EFDEF8]);
}

uint64_t sub_25C6CB03C()
{
  return sub_25C6CB048(MEMORY[0x263EFDF18]);
}

uint64_t sub_25C6CB048(id *a1)
{
  id v1 = *a1;
  uint64_t v2 = sub_25C6CB114();
  uint64_t v3 = sub_25C6CA480((uint64_t)v1, v2);

  swift_bridgeObjectRelease();
  if (!v3
    || (id v4 = objc_msgSend(v3, sel_array),
        v3,
        uint64_t v5 = sub_25C6D64C0(),
        v4,
        uint64_t v6 = sub_25C6CD900(v5),
        swift_bridgeObjectRelease(),
        !v6))
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v6;
}

uint64_t sub_25C6CB108()
{
  return sub_25C6CB048(MEMORY[0x263EFDF38]);
}

uint64_t sub_25C6CB114()
{
  return sub_25C6CB1A0();
}

uint64_t sub_25C6CB128()
{
  return sub_25C6CB220();
}

uint64_t sub_25C6CB13C()
{
  return sub_25C6CB1A0();
}

uint64_t sub_25C6CB150()
{
  return sub_25C6CB220();
}

uint64_t sub_25C6CB164()
{
  return sub_25C6CB1A0();
}

uint64_t sub_25C6CB178()
{
  return sub_25C6CB220();
}

uint64_t sub_25C6CB18C()
{
  return sub_25C6CB1A0();
}

uint64_t sub_25C6CB1A0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25C6D5A30();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_25C6CB20C()
{
  return sub_25C6CB220();
}

uint64_t sub_25C6CB220()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_25C6D5A40();
}

uint64_t sub_25C6CB288()
{
  return sub_25C6CB2C4(MEMORY[0x263F6CDD8]);
}

uint64_t sub_25C6CB294()
{
  return sub_25C6CB2C4(MEMORY[0x263F6CDD0]);
}

uint64_t sub_25C6CB2A0()
{
  return sub_25C6CB2C4(MEMORY[0x263F6CDE0]);
}

uint64_t sub_25C6CB2AC()
{
  return sub_25C6CB2C4(MEMORY[0x263F6CE08]);
}

uint64_t sub_25C6CB2B8()
{
  return sub_25C6CB2C4(MEMORY[0x263F6CDF8]);
}

uint64_t sub_25C6CB2C4(unsigned int *a1)
{
  uint64_t v3 = sub_25C6D55D0();
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_16_2();
  uint64_t v7 = MEMORY[0x26118F200]();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v1, *a1, v3);
  uint64_t v8 = sub_25C6CA438(v1, v7);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  if (!v10) {
    return sub_25C6D6440();
  }
  return v8;
}

uint64_t sub_25C6CB3B8()
{
  uint64_t v1 = sub_25C6D56C0();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_9();
  v5();
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v0, v1);
  if (v6 == *MEMORY[0x263F6CE78]) {
    return sub_25C6CB2AC();
  }
  if (v6 == *MEMORY[0x263F6CE68]) {
    return sub_25C6CB288();
  }
  if (v6 == *MEMORY[0x263F6CE88]) {
    return sub_25C6CB2B8();
  }
  if (v6 == *MEMORY[0x263F6CE70]) {
    return sub_25C6CB2A0();
  }
  if (v6 == *MEMORY[0x263F6CE80]) {
    return sub_25C6CB294();
  }
  uint64_t result = sub_25C6D6820();
  __break(1u);
  return result;
}

uint64_t sub_25C6CB4F8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_labelCATs;
  sub_25C6D55E0();
  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRetain();
  uint64_t v2 = OUTLINED_FUNCTION_3_1();
  uint64_t v4 = sub_25C6CA3F0(v2, v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25C6CB568()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68E8);
  uint64_t v2 = OUTLINED_FUNCTION_21_1(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_40();
  sub_25C6CB6B4();
  sub_25C6CD268();
  sub_25C6CB128();
  sub_25C6D6530();
  OUTLINED_FUNCTION_23_0();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_49(v3);
  sub_25C6CE960(v0, (uint64_t)&unk_26A5C6990, (uint64_t)v3);
  swift_release();
  OUTLINED_FUNCTION_23_0();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_49(v4);
  sub_25C6CE960(v0, (uint64_t)&unk_26A5C69A0, (uint64_t)v4);
  swift_release();
  OUTLINED_FUNCTION_23_0();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_49(v5);
  sub_25C6CE960(v0, (uint64_t)&unk_26A5C69B0, (uint64_t)v5);
  return swift_release();
}

void sub_25C6CB6B4()
{
  OUTLINED_FUNCTION_23();
  uint64_t v51 = sub_25C6D56C0();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_7();
  uint64_t v50 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  uint64_t v6 = OUTLINED_FUNCTION_21_1(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3_0();
  uint64_t v49 = v7;
  OUTLINED_FUNCTION_28();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_46();
  uint64_t v43 = v9;
  unint64_t v53 = MEMORY[0x263F8EE78];
  id v10 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_contact), sel_phoneNumbers);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6568);
  unint64_t v11 = sub_25C6D64C0();

  if (v11 >> 62)
  {
    OUTLINED_FUNCTION_43();
    uint64_t v12 = sub_25C6D67E0();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_3;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    unint64_t v38 = MEMORY[0x263F8EE78];
    goto LABEL_21;
  }
  uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v12) {
    goto LABEL_20;
  }
LABEL_3:
  if (v12 < 1)
  {
    __break(1u);
    return;
  }
  uint64_t v13 = 0;
  OUTLINED_FUNCTION_58(OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_labelCATs);
  unsigned int v45 = *MEMORY[0x263F6CE68];
  uint64_t v44 = (void (**)(uint64_t, void, uint64_t))(v2 + 104);
  unint64_t v14 = 0x2654B6000uLL;
  unint64_t v15 = 0x2654B6000uLL;
  uint64_t v16 = v43;
  uint64_t v47 = v12;
  unint64_t v48 = v11;
  do
  {
    if (v46) {
      id v17 = (id)MEMORY[0x261190350](v13, v11);
    }
    else {
      id v17 = *(id *)(v11 + 8 * v13 + 32);
    }
    uint64_t v18 = v17;
    sub_25C6D0310([v17 *(SEL *)(v14 + 2120)]);
    uint64_t v52 = v13;
    if (!v19)
    {
      id v20 = [v18 *(SEL *)(v14 + 2120)];
      id v21 = [v20 *(SEL *)(v15 + 2216)];

      uint64_t v16 = v43;
      sub_25C6D63D0();
    }
    sub_25C6D6410();
    id v22 = [v18 *(SEL *)(v14 + 2120)];
    id v23 = [v22 *(SEL *)(v15 + 2216)];

    sub_25C6D63D0();
    sub_25C6D6420();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25C6D6470();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25C6D5520();
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_25C6D55E0();
    id v25 = objc_msgSend(v18, sel_identifier);
    uint64_t v26 = sub_25C6D63D0();
    uint64_t v28 = v27;

    if (*(void *)(v24 + 16) && (sub_25C6CA89C(v26, v28), (v29 & 1) != 0))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v30 = objc_msgSend(v18, sel_label);
      if (v30)
      {
        uint64_t v31 = v30;
        sub_25C6D63D0();
      }
    }
    sub_25C6D63E0();
    id v32 = [v18 *(SEL *)(v14 + 2120)];
    id v33 = [v32 *(SEL *)(v15 + 2216)];

    sub_25C6D63D0();
    (*v44)(v50, v45, v51);
    uint64_t v34 = v16;
    sub_25C6D0808(v16, v49);
    id v35 = objc_allocWithZone((Class)sub_25C6D5680());
    OUTLINED_FUNCTION_28_0();
    id v36 = (id)sub_25C6D5620();
    MEMORY[0x2611900B0]();
    OUTLINED_FUNCTION_52();
    if (v37) {
      OUTLINED_FUNCTION_48();
    }
    uint64_t v13 = v52 + 1;
    sub_25C6D6500();
    sub_25C6D64D0();

    sub_25C6B9280(v34, &qword_26A5C68F0);
    unint64_t v11 = v48;
    uint64_t v16 = v34;
    unint64_t v14 = 0x2654B6000;
    unint64_t v15 = 0x2654B6000;
  }
  while (v47 != v52 + 1);
  swift_bridgeObjectRelease();
  unint64_t v38 = v53;
LABEL_21:
  uint64_t v39 = (void *)*MEMORY[0x263EFDEF8];
  sub_25C6AA904(0, &qword_26A5C6940);
  id v40 = v39;
  sub_25C6CEC80(v38);
  swift_bridgeObjectRelease();
  id v41 = sub_25C6CEE04();
  if (v41)
  {
    sub_25C6CFF34((uint64_t)v41, v40);
  }
  else
  {
    uint64_t v42 = sub_25C6CFDE8((uint64_t)v40);

    id v40 = (id)v42;
  }

  OUTLINED_FUNCTION_26();
}

uint64_t sub_25C6CBC28()
{
  OUTLINED_FUNCTION_4_4();
  v1[9] = v0;
  uint64_t v2 = sub_25C6D6180();
  v1[10] = v2;
  OUTLINED_FUNCTION_9_0(v2);
  v1[11] = v3;
  v1[12] = OUTLINED_FUNCTION_29_0();
  uint64_t v4 = sub_25C6D61A0();
  v1[13] = v4;
  OUTLINED_FUNCTION_9_0(v4);
  v1[14] = v5;
  v1[15] = OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_27_0();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25C6CBCE4()
{
  OUTLINED_FUNCTION_4_4();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C6CBD80;
  return MEMORY[0x270F647A0]();
}

uint64_t sub_25C6CBD80()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_25_0();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 136) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_27_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C6CBE50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_7_3();
  sub_25C6AA904(0, &qword_26A5C6968);
  uint64_t v34 = sub_25C6D6600();
  uint64_t v18 = swift_allocObject();
  OUTLINED_FUNCTION_36_0(v18);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  *(void *)(v19 + 24) = v15;
  v14[6] = sub_25C6D0A48;
  v14[7] = v19;
  v14[2] = MEMORY[0x263EF8330];
  v14[3] = 1107296256;
  v14[4] = sub_25C6CF574;
  v14[5] = &block_descriptor_65;
  id v20 = _Block_copy(v17);
  swift_retain();
  sub_25C6D6190();
  v14[8] = MEMORY[0x263F8EE78];
  sub_25C6D0940(&qword_26A5C6970, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6978);
  unint64_t v21 = sub_25C6D0988();
  OUTLINED_FUNCTION_6_4(v21);
  OUTLINED_FUNCTION_17_1();
  _Block_release(v20);

  uint64_t v22 = OUTLINED_FUNCTION_15_2();
  v23(v22);
  OUTLINED_FUNCTION_3();
  v24();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_19_2();
  return v26(v25, v26, v27, v28, v29, v30, v31, v32, v34, a10, a11, a12, a13, a14);
}

uint64_t sub_25C6CC01C()
{
  OUTLINED_FUNCTION_4_4();
  v1[9] = v0;
  uint64_t v2 = sub_25C6D6180();
  v1[10] = v2;
  OUTLINED_FUNCTION_9_0(v2);
  v1[11] = v3;
  v1[12] = OUTLINED_FUNCTION_29_0();
  uint64_t v4 = sub_25C6D61A0();
  v1[13] = v4;
  OUTLINED_FUNCTION_9_0(v4);
  v1[14] = v5;
  v1[15] = OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_27_0();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25C6CC0D8()
{
  OUTLINED_FUNCTION_4_4();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C6CC174;
  return MEMORY[0x270F647A8]();
}

uint64_t sub_25C6CC174()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_25_0();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 136) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_27_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C6CC244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_7_3();
  sub_25C6AA904(0, &qword_26A5C6968);
  uint64_t v34 = sub_25C6D6600();
  uint64_t v18 = swift_allocObject();
  OUTLINED_FUNCTION_36_0(v18);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  *(void *)(v19 + 24) = v15;
  v14[6] = sub_25C6D09E0;
  v14[7] = v19;
  v14[2] = MEMORY[0x263EF8330];
  v14[3] = 1107296256;
  v14[4] = sub_25C6CF574;
  v14[5] = &block_descriptor_57;
  id v20 = _Block_copy(v17);
  swift_retain();
  sub_25C6D6190();
  v14[8] = MEMORY[0x263F8EE78];
  sub_25C6D0940(&qword_26A5C6970, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6978);
  unint64_t v21 = sub_25C6D0988();
  OUTLINED_FUNCTION_6_4(v21);
  OUTLINED_FUNCTION_17_1();
  _Block_release(v20);

  uint64_t v22 = OUTLINED_FUNCTION_15_2();
  v23(v22);
  OUTLINED_FUNCTION_3();
  v24();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_19_2();
  return v26(v25, v26, v27, v28, v29, v30, v31, v32, v34, a10, a11, a12, a13, a14);
}

uint64_t sub_25C6CC410()
{
  OUTLINED_FUNCTION_4_4();
  v1[9] = v0;
  uint64_t v2 = sub_25C6D6180();
  v1[10] = v2;
  OUTLINED_FUNCTION_9_0(v2);
  v1[11] = v3;
  v1[12] = OUTLINED_FUNCTION_29_0();
  uint64_t v4 = sub_25C6D61A0();
  v1[13] = v4;
  OUTLINED_FUNCTION_9_0(v4);
  v1[14] = v5;
  v1[15] = OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_27_0();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25C6CC4CC()
{
  OUTLINED_FUNCTION_4_4();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C6CC568;
  return MEMORY[0x270F647B0]();
}

uint64_t sub_25C6CC568()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_25_0();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 136) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_27_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C6CC638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_7_3();
  sub_25C6AA904(0, &qword_26A5C6968);
  uint64_t v34 = sub_25C6D6600();
  uint64_t v18 = swift_allocObject();
  OUTLINED_FUNCTION_36_0(v18);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  *(void *)(v19 + 24) = v15;
  v14[6] = sub_25C6D0904;
  v14[7] = v19;
  v14[2] = MEMORY[0x263EF8330];
  v14[3] = 1107296256;
  v14[4] = sub_25C6CF574;
  v14[5] = &block_descriptor_49;
  id v20 = _Block_copy(v17);
  swift_retain();
  sub_25C6D6190();
  v14[8] = MEMORY[0x263F8EE78];
  sub_25C6D0940(&qword_26A5C6970, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6978);
  unint64_t v21 = sub_25C6D0988();
  OUTLINED_FUNCTION_6_4(v21);
  OUTLINED_FUNCTION_17_1();
  _Block_release(v20);

  uint64_t v22 = OUTLINED_FUNCTION_15_2();
  v23(v22);
  OUTLINED_FUNCTION_3();
  v24();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_19_2();
  return v26(v25, v26, v27, v28, v29, v30, v31, v32, v34, a10, a11, a12, a13, a14);
}

void sub_25C6CC804()
{
  OUTLINED_FUNCTION_23();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v100 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  uint64_t v6 = OUTLINED_FUNCTION_21_1(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3_0();
  uint64_t v114 = v7;
  OUTLINED_FUNCTION_28();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_46();
  uint64_t v125 = v9;
  uint64_t v10 = sub_25C6D5720();
  OUTLINED_FUNCTION_1();
  uint64_t v117 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3_0();
  uint64_t v113 = v13;
  OUTLINED_FUNCTION_28();
  MEMORY[0x270FA5388](v14);
  uint64_t v101 = (char *)&v99 - v15;
  OUTLINED_FUNCTION_28();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_46();
  uint64_t v122 = v17;
  uint64_t v18 = sub_25C6D56C0();
  OUTLINED_FUNCTION_1();
  id v20 = v19;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v99 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (void (*)(void))((char *)&v99 - v25);
  uint64_t v27 = *MEMORY[0x263F6CE68];
  uint64_t v123 = (char *)v20[13];
  ((void (*)(char *, uint64_t, uint64_t))v123)((char *)&v99 - v25, v27, v18);
  char v28 = sub_25C6A3210(v3, (uint64_t)v26);
  uint64_t v124 = (void (*)(void))v20[1];
  OUTLINED_FUNCTION_31();
  v29();
  uint64_t v30 = (void (*)(void, void, void))v20[2];
  uint64_t v116 = v3;
  uint64_t v111 = v30;
  uint64_t v112 = v20 + 2;
  v30(v24, v3, v18);
  uint64_t v31 = (unsigned int *)MEMORY[0x263F6CE88];
  if (v28)
  {
    uint64_t v32 = v124;
    OUTLINED_FUNCTION_31();
    v32();
    ((void (*)(void (*)(void), void, uint64_t))v123)(v26, *v31, v18);
LABEL_5:
    int v115 = sub_25C6A3210(v116, (uint64_t)v26);
    OUTLINED_FUNCTION_31();
    v32();
    id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9B0]), sel_init);
    id v36 = *(void (**)(void))(v100 + 16);
    if (v36)
    {
      uint64_t v106 = v26;
      uint64_t v108 = v18;
      uint64_t v105 = OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_contact;
      uint64_t v104 = v1 + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_labelCATs;
      uint64_t v38 = v117 + 16;
      char v37 = *(void (**)(void))(v117 + 16);
      uint64_t v39 = (char *)(v100
                   + ((*(unsigned __int8 *)(v117 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v117 + 80)));
      uint64_t v102 = *(void *)(v117 + 72);
      uint64_t v118 = (void (**)(uint64_t, uint64_t))(v117 + 8);
      swift_bridgeObjectRetain();
      id v109 = v35;
      uint64_t v110 = v1;
      uint64_t v117 = v38;
      uint64_t v40 = v122;
      char v103 = v37;
      uint64_t v107 = v10;
      do
      {
        uint64_t v123 = v39;
        uint64_t v124 = v36;
        OUTLINED_FUNCTION_37_0();
        v37();
        if (sub_25C6D56F0())
        {
          sub_25C6AA904(0, &qword_26A5C6958);
          sub_25C6D5710();
          id v41 = sub_25C6CF6B0();
          uint64_t v42 = sub_25C6D0380(v41);
          uint64_t v44 = v43;
          OUTLINED_FUNCTION_37_0();
          v37();
          uint64_t v45 = v113;
          if (v44)
          {
            uint64_t v121 = v44;
            uint64_t v122 = v42;
          }
          else
          {
            uint64_t v48 = sub_25C6D5710();
            uint64_t v121 = v49;
            uint64_t v122 = v48;
          }
          OUTLINED_FUNCTION_3();
          v50();
          sub_25C6D5710();
          OUTLINED_FUNCTION_54();
          sub_25C6D6670();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v46 = sub_25C6D5710();
          uint64_t v121 = v47;
          uint64_t v122 = v46;
          sub_25C6D5710();
          OUTLINED_FUNCTION_54();
          sub_25C6D6660();
          swift_bridgeObjectRelease();
          uint64_t v45 = v113;
        }
        uint64_t v51 = sub_25C6D55E0();
        uint64_t v52 = sub_25C6D56E0();
        if (*(void *)(v51 + 16) && (unint64_t v54 = sub_25C6CA89C(v52, v53), (v55 & 1) != 0))
        {
          uint64_t v56 = (uint64_t *)(*(void *)(v51 + 56) + 16 * v54);
          uint64_t v57 = *v56;
          uint64_t v58 = v56[1];
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v57 = 0;
          uint64_t v58 = 0;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_37_0();
        v37();
        if (v58) {
          uint64_t v119 = v57;
        }
        else {
          uint64_t v119 = sub_25C6D5700();
        }
        uint64_t v120 = *v118;
        v120(v45, v10);
        sub_25C6D63F0();
        sub_25C6D5710();
        uint64_t v26 = v106;
        OUTLINED_FUNCTION_9();
        v59();
        uint64_t v60 = v125;
        sub_25C6D0808(v125, v114);
        id v61 = objc_allocWithZone((Class)sub_25C6D5680());
        OUTLINED_FUNCTION_28_0();
        long long v62 = (void *)sub_25C6D5620();
        id v35 = v109;
        objc_msgSend(v109, sel_addObject_, v62);

        uint64_t v63 = v60;
        uint64_t v10 = v107;
        sub_25C6B9280(v63, &qword_26A5C68F0);
        v120(v40, v10);
        uint64_t v39 = &v123[v102];
        id v36 = (void (*)(void))((char *)v124 - 1);
        uint64_t v1 = v110;
        char v37 = v103;
      }
      while (v124 != (void (*)(void))1);
      swift_bridgeObjectRelease();
    }
    if ((uint64_t)objc_msgSend(v35, sel_count) < 1)
    {
    }
    else
    {
      if (v115)
      {
        id v64 = (id)*MEMORY[0x263EFDF38];
        sub_25C6CB114();
        uint64_t v65 = OUTLINED_FUNCTION_51();
        uint64_t v66 = sub_25C6CA480(v65, v1);

        swift_bridgeObjectRelease();
        if (v66 && (id v67 = objc_msgSend(v66, sel_mutableCopy), v66, v67))
        {
          objc_msgSend(v67, sel_unionOrderedSet_, v35);
          swift_getKeyPath();
          swift_getKeyPath();
          id v68 = v64;
          id v69 = v67;
          OUTLINED_FUNCTION_34_0();
          sub_25C6D5A20();
          OUTLINED_FUNCTION_56();

          uint64_t v70 = OUTLINED_FUNCTION_22_0();
          v26(v70);
        }
        else
        {
          swift_getKeyPath();
          swift_getKeyPath();
          id v90 = v64;
          id v69 = v35;
          sub_25C6D5A20();
          OUTLINED_FUNCTION_56();

          ((void (*)(uint64_t *, void))v26)(&v126, 0);
        }

        swift_release();
      }
      else
      {
        sub_25C6D63F0();
        uint64_t v77 = v76;
        sub_25C6CB13C();
        uint64_t v78 = OUTLINED_FUNCTION_51();
        uint64_t v79 = sub_25C6CA4C8(v78, v77, v1);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v79)
        {
          sub_25C6AA904(0, &qword_26A5C6940);
          unint64_t v80 = OUTLINED_FUNCTION_51();
          sub_25C6CEC80(v80);
          swift_bridgeObjectRelease();
          id v81 = sub_25C6CEE04();
          objc_msgSend(v81, sel_unionOrderedSet_, v35);
          uint64_t v82 = sub_25C6D63F0();
          uint64_t v84 = v83;
          id v85 = objc_msgSend(v81, sel_array);
          uint64_t v86 = sub_25C6D64C0();

          uint64_t v87 = sub_25C6CD900(v86);
          swift_bridgeObjectRelease();
          if (!v87) {
            uint64_t v87 = MEMORY[0x263F8EE78];
          }
          swift_getKeyPath();
          swift_getKeyPath();
          OUTLINED_FUNCTION_34_0();
          uint64_t v88 = (void (*)(uint64_t))sub_25C6D5A20();
          sub_25C6CFFB4(v87, v82, v84);
          swift_bridgeObjectRelease();
          uint64_t v89 = OUTLINED_FUNCTION_22_0();
          v88(v89);

          swift_release();
        }
        else
        {
          uint64_t v91 = sub_25C6D63F0();
          uint64_t v93 = v92;
          id v94 = objc_msgSend(v35, sel_array);
          uint64_t v95 = sub_25C6D64C0();

          uint64_t v96 = sub_25C6CD900(v95);
          swift_bridgeObjectRelease();
          if (!v96) {
            uint64_t v96 = MEMORY[0x263F8EE78];
          }
          swift_getKeyPath();
          swift_getKeyPath();
          OUTLINED_FUNCTION_34_0();
          uint64_t v97 = (void (*)(uint64_t))sub_25C6D5A20();
          sub_25C6CFFB4(v96, v91, v93);
          swift_bridgeObjectRelease();
          uint64_t v98 = OUTLINED_FUNCTION_22_0();
          v97(v98);

          swift_release();
        }
      }
      swift_release();
    }
    goto LABEL_43;
  }
  uint64_t v33 = *MEMORY[0x263F6CE88];
  uint64_t v34 = (void (*)(void (*)(void), uint64_t, uint64_t))v123;
  ((void (*)(void (*)(void), uint64_t, uint64_t))v123)(v26, v33, v18);
  LODWORD(v121) = sub_25C6A3210((uint64_t)v24, (uint64_t)v26);
  uint64_t v32 = v124;
  OUTLINED_FUNCTION_31();
  v32();
  OUTLINED_FUNCTION_31();
  v32();
  if (v121)
  {
    v34(v26, v33, v18);
    goto LABEL_5;
  }
  if (qword_26A5C5CC0 != -1) {
    swift_once();
  }
  uint64_t v71 = sub_25C6D59F0();
  __swift_project_value_buffer(v71, (uint64_t)qword_26A5C6B58);
  uint64_t v72 = (void *)sub_25C6D59D0();
  os_log_type_t v73 = sub_25C6D65D0();
  if (OUTLINED_FUNCTION_33_0(v73))
  {
    *(_WORD *)OUTLINED_FUNCTION_3_2() = 0;
    OUTLINED_FUNCTION_53(&dword_25C69F000, v74, v75, "#GetContactQuickActionButtonsViewModel didn't get a FaceTimeable action type, returning");
    OUTLINED_FUNCTION_1_2();
  }

LABEL_43:
  OUTLINED_FUNCTION_26();
}

void sub_25C6CD268()
{
  OUTLINED_FUNCTION_23();
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  uint64_t v4 = OUTLINED_FUNCTION_21_1(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_7();
  uint64_t v48 = v5;
  uint64_t v47 = sub_25C6D56C0();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7();
  uint64_t v46 = v9;
  unint64_t v49 = MEMORY[0x263F8EE78];
  id v10 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_contact), sel_phoneNumbers);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6568);
  unint64_t v11 = sub_25C6D64C0();

  if (v11 >> 62)
  {
    OUTLINED_FUNCTION_43();
    uint64_t v12 = sub_25C6D67E0();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_3;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    unint64_t v35 = MEMORY[0x263F8EE78];
    goto LABEL_21;
  }
  uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v12) {
    goto LABEL_20;
  }
LABEL_3:
  if (v12 < 1)
  {
    __break(1u);
    return;
  }
  uint64_t v40 = v2;
  uint64_t v13 = 0;
  OUTLINED_FUNCTION_58(OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_labelCATs);
  uint64_t v42 = (void (**)(uint64_t, void, uint64_t))(v7 + 104);
  unsigned int v41 = *MEMORY[0x263F6CE78];
  unint64_t v14 = 0x2654B6000uLL;
  uint64_t v44 = v12;
  unint64_t v45 = v11;
  do
  {
    if (v43) {
      id v15 = (id)MEMORY[0x261190350](v13, v11);
    }
    else {
      id v15 = *(id *)(v11 + 8 * v13 + 32);
    }
    uint64_t v16 = v15;
    sub_25C6D0310(objc_msgSend(v15, *(SEL *)(v14 + 2120), v40));
    if (!v17)
    {
      id v18 = [v16 *(SEL *)(v14 + 2120)];
      id v19 = objc_msgSend(v18, sel_stringValue);

      sub_25C6D63D0();
    }
    uint64_t v20 = sub_25C6D55E0();
    id v21 = objc_msgSend(v16, sel_identifier);
    uint64_t v22 = sub_25C6D63D0();
    uint64_t v24 = v23;

    if (*(void *)(v20 + 16) && (sub_25C6CA89C(v22, v24), (v25 & 1) != 0))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v26 = objc_msgSend(v16, sel_label);
      if (v26)
      {
        uint64_t v27 = v26;
        sub_25C6D63D0();
      }
    }
    sub_25C6D6400();
    id v28 = [v16 *(SEL *)(v14 + 2120)];
    id v29 = objc_msgSend(v28, sel_stringValue);

    sub_25C6D63D0();
    (*v42)(v46, v41, v47);
    uint64_t v30 = sub_25C6D5530();
    __swift_storeEnumTagSinglePayload(v48, 1, 1, v30);
    id v31 = objc_msgSend(v16, sel_identifier);
    sub_25C6D63D0();

    id v32 = objc_allocWithZone((Class)sub_25C6D5680());
    id v33 = (id)sub_25C6D5620();
    MEMORY[0x2611900B0]();
    OUTLINED_FUNCTION_52();
    if (v34) {
      OUTLINED_FUNCTION_48();
    }
    ++v13;
    sub_25C6D6500();
    sub_25C6D64D0();

    unint64_t v11 = v45;
    unint64_t v14 = 0x2654B6000;
  }
  while (v44 != v13);
  swift_bridgeObjectRelease();
  unint64_t v35 = v49;
LABEL_21:
  id v36 = (void *)*MEMORY[0x263EFDF18];
  sub_25C6AA904(0, &qword_26A5C6940);
  id v37 = v36;
  sub_25C6CEC80(v35);
  swift_bridgeObjectRelease();
  id v38 = sub_25C6CEE04();
  if (v38)
  {
    sub_25C6CFF34((uint64_t)v38, v37);
  }
  else
  {
    uint64_t v39 = sub_25C6CFDE8((uint64_t)v37);

    id v37 = (id)v39;
  }

  OUTLINED_FUNCTION_26();
}

id sub_25C6CD730()
{
  return objc_msgSend(self, sel_supportsTelephonyCalls);
}

unint64_t sub_25C6CD75C()
{
  return (unint64_t)sub_25C6CD730() & 1;
}

void sub_25C6CD778(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_25C6CD79C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25C6CD7B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

void sub_25C6CD7C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    v6[4] = a2;
    v6[5] = a3;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 1107296256;
    v6[2] = sub_25C6CD894;
    v6[3] = &block_descriptor_96;
    uint64_t v5 = _Block_copy(v6);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v5 = 0;
  }
  objc_msgSend(v3, sel_launchAppForDialRequest_completion_, a1, v5);
  _Block_release(v5);
}

void sub_25C6CD894(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_25C6CD900(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25C6D6780();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_25C6AA8A4(i, (uint64_t)v5);
    sub_25C6D5680();
    if (!swift_dynamicCast()) {
      break;
    }
    sub_25C6D6760();
    sub_25C6D6790();
    sub_25C6D67A0();
    sub_25C6D6770();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_25C6CD9FC()
{
  return sub_25C6CB128();
}

uint64_t sub_25C6CDA28()
{
  return sub_25C6CB150();
}

uint64_t sub_25C6CDA54()
{
  return sub_25C6CB178();
}

uint64_t sub_25C6CDA80()
{
  return sub_25C6CB20C();
}

#error "25C6CDB94: call analysis failed (funcsize=70)"

id sub_25C6CDBC4()
{
  unint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_cancelableTokens];
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = (id)swift_bridgeObjectRetain_n();
    if (v2) {
      goto LABEL_3;
    }
LABEL_9:
    swift_bridgeObjectRelease_n();
    v7.receiver = v0;
    v7.super_class = (Class)type metadata accessor for GetContactQuickActionButtonsViewModel();
    return objc_msgSendSuper2(&v7, sel_dealloc);
  }
  swift_bridgeObjectRetain_n();
  id result = (id)sub_25C6D67E0();
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_9;
  }
LABEL_3:
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x261190350](i, v1);
      }
      else {
        id v5 = *(id *)(v1 + 8 * i + 32);
      }
      uint64_t v6 = v5;
      objc_msgSend(v5, sel_cancel);
    }
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C6CDECC()
{
  return type metadata accessor for GetContactQuickActionButtonsViewModel();
}

uint64_t type metadata accessor for GetContactQuickActionButtonsViewModel()
{
  uint64_t result = qword_26A5C68A0;
  if (!qword_26A5C68A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C6CDF1C()
{
  OUTLINED_FUNCTION_23();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68E8);
  uint64_t v2 = OUTLINED_FUNCTION_21_1(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_7();
  uint64_t v41 = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  uint64_t v5 = OUTLINED_FUNCTION_21_1(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_25C6D5530();
  OUTLINED_FUNCTION_1();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_46();
  uint64_t v15 = v14;
  uint64_t v16 = sub_25C6D56C0();
  OUTLINED_FUNCTION_1();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_41();
  sub_25C6D5660();
  char v20 = sub_25C6D5690();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v0, v16);
  if ((v20 & 1) == 0)
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_25C6D59F0();
    __swift_project_value_buffer(v27, (uint64_t)qword_26A5C6B58);
    uint64_t v22 = (void *)sub_25C6D59D0();
    os_log_type_t v28 = sub_25C6D65D0();
    if (!OUTLINED_FUNCTION_33_0(v28)) {
      goto LABEL_12;
    }
    *(_WORD *)OUTLINED_FUNCTION_3_2() = 0;
    id v26 = "#GetContactQuickActionButtonsViewModel performCall provided action type mismatched";
    goto LABEL_11;
  }
  sub_25C6D5650();
  if (__swift_getEnumTagSinglePayload(v8, 1, v9) != 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v15, v8, v9);
    sub_25C6AA904(0, &qword_26A5C68F8);
    OUTLINED_FUNCTION_9();
    v29();
    id v30 = sub_25C6CE390();
    if (v30)
    {
      id v31 = v30;
      if (objc_msgSend(v30, sel_isValid))
      {
        uint64_t v32 = sub_25C6D6530();
        __swift_storeEnumTagSinglePayload(v41, 1, 1, v32);
        id v33 = (void *)OUTLINED_FUNCTION_50();
        id v34 = OUTLINED_FUNCTION_49(v33);
        sub_25C6CE960(v41, (uint64_t)&unk_26A5C6908, (uint64_t)v33);

        swift_release();
LABEL_22:
        uint64_t v39 = OUTLINED_FUNCTION_3_1();
        v40(v39);
        goto LABEL_23;
      }
    }
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_25C6D59F0();
    __swift_project_value_buffer(v35, (uint64_t)qword_26A5C6B58);
    id v36 = sub_25C6D59D0();
    os_log_type_t v37 = sub_25C6D65D0();
    if (os_log_type_enabled(v36, v37))
    {
      id v38 = (uint8_t *)OUTLINED_FUNCTION_3_2();
      *(_WORD *)id v38 = 0;
      _os_log_impl(&dword_25C69F000, v36, v37, "#GetContactQuickActionButtonsViewModel performCall failed to construct dial request", v38, 2u);
      OUTLINED_FUNCTION_1_2();
    }

    goto LABEL_22;
  }
  sub_25C6B9280(v8, &qword_26A5C68F0);
  if (qword_26A5C5CC0 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_25C6D59F0();
  __swift_project_value_buffer(v21, (uint64_t)qword_26A5C6B58);
  uint64_t v22 = (void *)sub_25C6D59D0();
  os_log_type_t v23 = sub_25C6D65D0();
  if (!OUTLINED_FUNCTION_33_0(v23)) {
    goto LABEL_12;
  }
  *(_WORD *)OUTLINED_FUNCTION_3_2() = 0;
  id v26 = "#GetContactQuickActionButtonsViewModel performCall but no URL available, cannot execute";
LABEL_11:
  OUTLINED_FUNCTION_53(&dword_25C69F000, v24, v25, v26);
  OUTLINED_FUNCTION_1_2();
LABEL_12:

LABEL_23:
  OUTLINED_FUNCTION_26();
}

id sub_25C6CE390()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_25C6D5510();
  id v2 = objc_msgSend(v0, sel_initWithURL_, v1);

  sub_25C6D5530();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v3();
  return v2;
}

uint64_t sub_25C6CE41C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 152) = a4;
  return MEMORY[0x270FA2498](sub_25C6CE43C, 0, 0);
}

uint64_t sub_25C6CE43C()
{
  OUTLINED_FUNCTION_30_0();
  uint64_t v1 = v0[19];
  id v2 = objc_msgSend(self, sel_sharedInstance);
  v0[20] = v2;
  v0[2] = v0;
  v0[3] = sub_25C6CE55C;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_25C6CE898;
  v0[13] = &block_descriptor;
  v0[14] = v3;
  objc_msgSend(v2, sel_launchAppForDialRequest_completion_, v1, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_25C6CE55C()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_25_0();
  *id v2 = v1;
  *id v2 = *v0;
  *(void *)(v1 + 168) = *(void *)(v3 + 48);
  OUTLINED_FUNCTION_27_0();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_25C6CE63C()
{
  OUTLINED_FUNCTION_4_4();

  OUTLINED_FUNCTION_20_1();
  return v1();
}

uint64_t sub_25C6CE694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_18_2();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_57();
  a20 = v22;
  uint64_t v25 = (void *)v22[20];
  swift_willThrow();

  if (qword_26A5C5CC0 != -1) {
    swift_once();
  }
  id v26 = (void *)v22[21];
  uint64_t v27 = sub_25C6D59F0();
  __swift_project_value_buffer(v27, (uint64_t)qword_26A5C6B58);
  id v28 = v26;
  id v29 = v26;
  id v30 = sub_25C6D59D0();
  os_log_type_t v31 = sub_25C6D65D0();
  BOOL v32 = os_log_type_enabled(v30, v31);
  id v33 = (void *)v22[21];
  if (v32)
  {
    a9 = v22 + 10;
    id v34 = (uint8_t *)swift_slowAlloc();
    a10 = swift_slowAlloc();
    *(_DWORD *)id v34 = 136315138;
    swift_getErrorValue();
    uint64_t v35 = sub_25C6D6850();
    v22[10] = sub_25C6A9FE8(v35, v36, &a10);
    sub_25C6D6700();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C69F000, v30, v31, "#GetContactQuickActionButtonsViewModel performCall TU task caught: %s", v34, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();
  }
  else
  {
  }
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_19_2();
  return v38(v37, v38, v39, v40, v41, v42, v43, v44, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C6CE898(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = a2;
    return sub_25C6CE8F8(v2, (uint64_t)v3);
  }
  else
  {
    return j__swift_continuation_throwingResume();
  }
}

uint64_t sub_25C6CE8F8(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6920);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;

  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_25C6CE960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C6D6530();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_25C6B9280(a1, &qword_26A5C68E8);
  }
  else
  {
    sub_25C6D6520();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25C6D6510();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25C6CEAD0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C6D0CBC;
  return sub_25C6CBC28();
}

uint64_t sub_25C6CEB60()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C6D0CBC;
  return sub_25C6CC01C();
}

uint64_t sub_25C6CEBF0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C6D0CBC;
  return sub_25C6CC410();
}

void sub_25C6CEC80(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25C6D67E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_25C6CFD88(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
    {
      __break(1u);
    }
    else
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0) {
          MEMORY[0x261190350](i, a1);
        }
        else {
          id v4 = *(id *)(a1 + 8 * i + 32);
        }
        sub_25C6D5680();
        swift_dynamicCast();
        uint64_t v5 = v9;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25C6CFD88(0, *(void *)(v5 + 16) + 1, 1);
          uint64_t v5 = v9;
        }
        unint64_t v7 = *(void *)(v5 + 16);
        unint64_t v6 = *(void *)(v5 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_25C6CFD88(v6 > 1, v7 + 1, 1);
          uint64_t v5 = v9;
        }
        *(void *)(v5 + 16) = v7 + 1;
        sub_25C6D07F8(&v8, (_OWORD *)(v5 + 32 * v7 + 32));
      }
    }
  }
}

id sub_25C6CEE04()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_25C6D64B0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithArray_, v1);

  return v2;
}

void sub_25C6CEE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v65 = (uint64_t)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_25C6D56C0();
  uint64_t v6 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v63 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C6D5720();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v52 - v13;
  swift_beginAccess();
  uint64_t v15 = MEMORY[0x261190B60](a1 + 16);
  if (v15)
  {
    uint64_t v16 = (char *)v15;
    id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9B0]), sel_init);
    uint64_t v18 = *(void *)(a2 + 16);
    if (v18)
    {
      uint64_t v53 = v16;
      uint64_t v59 = &v16[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_labelCATs];
      char v20 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
      uint64_t v19 = v9 + 16;
      os_log_type_t v73 = v20;
      uint64_t v21 = a2 + ((*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64));
      uint64_t v58 = *(void *)(v19 + 56);
      uint64_t v57 = (void (**)(char *, uint64_t))(v19 - 8);
      unsigned int v55 = *MEMORY[0x263F6CE78];
      unint64_t v54 = (void (**)(char *, void, uint64_t))(v6 + 104);
      uint64_t v52 = a2;
      swift_bridgeObjectRetain();
      uint64_t v61 = v19;
      id v62 = v17;
      uint64_t v60 = v8;
      uint64_t v56 = v12;
      uint64_t v22 = v57;
      do
      {
        uint64_t v72 = v18;
        v73(v14, v21, v8);
        uint64_t v23 = sub_25C6D55E0();
        uint64_t v24 = sub_25C6D56E0();
        if (*(void *)(v23 + 16) && (unint64_t v26 = sub_25C6CA89C(v24, v25), (v27 & 1) != 0))
        {
          id v28 = (uint64_t *)(*(void *)(v23 + 56) + 16 * v26);
          uint64_t v29 = *v28;
          uint64_t v30 = v28[1];
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v29 = 0;
          uint64_t v30 = 0;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v73(v12, (uint64_t)v14, v8);
        if (v30) {
          uint64_t v70 = v29;
        }
        else {
          uint64_t v70 = sub_25C6D5700();
        }
        uint64_t v71 = *v22;
        v71(v12, v8);
        uint64_t v31 = sub_25C6D6400();
        uint64_t v68 = v32;
        uint64_t v69 = v31;
        uint64_t v33 = sub_25C6D5710();
        uint64_t v66 = v34;
        uint64_t v67 = v33;
        sub_25C6D5710();
        (*v54)(v63, v55, v64);
        uint64_t v35 = sub_25C6D5530();
        __swift_storeEnumTagSinglePayload(v65, 1, 1, v35);
        sub_25C6D56E0();
        id v36 = objc_allocWithZone((Class)sub_25C6D5680());
        uint64_t v12 = v56;
        uint64_t v8 = v60;
        uint64_t v37 = (void *)sub_25C6D5620();
        id v17 = v62;
        objc_msgSend(v62, sel_addObject_, v37);

        v71(v14, v8);
        v21 += v58;
        uint64_t v18 = v72 - 1;
      }
      while (v72 != 1);
      swift_bridgeObjectRelease();
      uint64_t v16 = v53;
    }
    if ((uint64_t)objc_msgSend(v17, sel_count) <= 0)
    {
    }
    else
    {
      id v38 = (id)*MEMORY[0x263EFDF18];
      uint64_t v39 = v16;
      uint64_t v40 = sub_25C6CB114();
      uint64_t v41 = sub_25C6CA480((uint64_t)v38, v40);

      swift_bridgeObjectRelease();
      if (v41 && (id v42 = objc_msgSend(v41, sel_mutableCopy), v41, v42))
      {
        objc_msgSend(v42, sel_unionOrderedSet_, v17);
        swift_getKeyPath();
        swift_getKeyPath();
        id v43 = v38;
        id v44 = v42;
        unint64_t v45 = (void (*)(unsigned char *, void))sub_25C6D5A20();
        sub_25C6CFF34((uint64_t)v44, v43);

        v45(v74, 0);
      }
      else
      {
        swift_getKeyPath();
        swift_getKeyPath();
        id v50 = v38;
        id v44 = v17;
        uint64_t v51 = (void (*)(unsigned char *, void))sub_25C6D5A20();
        sub_25C6CFF34((uint64_t)v44, v50);

        v51(v74, 0);
      }

      swift_release();
      swift_release();
    }
  }
  else
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_25C6D59F0();
    __swift_project_value_buffer(v46, (uint64_t)qword_26A5C6B58);
    uint64_t v47 = sub_25C6D59D0();
    os_log_type_t v48 = sub_25C6D65D0();
    if (os_log_type_enabled(v47, v48))
    {
      unint64_t v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v49 = 0;
      _os_log_impl(&dword_25C69F000, v47, v48, "#GetContactQuickActionButtonsViewModel tried to process actions but already got dealloc'ed", v49, 2u);
      MEMORY[0x261190AB0](v49, -1, -1);
    }
  }
}

uint64_t sub_25C6CF574(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_25C6CF5B8(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v5 = sub_25C6D56C0();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2();
  uint64_t v11 = v10 - v9;
  swift_beginAccess();
  uint64_t result = MEMORY[0x261190B60](a1 + 16);
  if (result)
  {
    uint64_t v13 = (void *)result;
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v11, *a3, v5);
    sub_25C6CC804();

    uint64_t v14 = OUTLINED_FUNCTION_3_1();
    return v15(v14);
  }
  return result;
}

id sub_25C6CF6B0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_25C6D63A0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithStringValue_, v1);

  return v2;
}

void sub_25C6CF724()
{
}

void sub_25C6CF764()
{
  sub_25C6D58C0();
  if (v0 <= 0x3F)
  {
    sub_25C6D5600();
    if (v1 <= 0x3F)
    {
      sub_25C6CF90C(319, &qword_26A5C68C8, &qword_26A5C68D0);
      if (v2 <= 0x3F)
      {
        sub_25C6CF90C(319, &qword_26A5C68D8, &qword_26A5C68E0);
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_25C6CF90C(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_25C6D5A50();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_25C6CF95C()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_25C6CF968@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for GetContactQuickActionButtonsViewModel();
  uint64_t result = sub_25C6D5A00();
  *a1 = result;
  return result;
}

uint64_t sub_25C6CF9AC()
{
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_26_0();
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)OUTLINED_FUNCTION_14_2(v0);
  *unint64_t v1 = v2;
  v1[1] = sub_25C6D0CBC;
  uint64_t v3 = OUTLINED_FUNCTION_5_5();
  return sub_25C6CE41C(v3, v4, v5, v6);
}

uint64_t sub_25C6CFA3C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C6CFB18;
  return v6(a1);
}

uint64_t sub_25C6CFB18()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_6();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_25_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_1();
  return v3();
}

uint64_t sub_25C6CFBE0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C6CFC18()
{
  OUTLINED_FUNCTION_30_0();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_14_2(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25C6CFCC4;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A5C6910 + dword_26A5C6910);
  return v7(v2, v3);
}

uint64_t sub_25C6CFCC4()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_6();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_25_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_1();
  return v3();
}

void sub_25C6CFD88(char a1, uint64_t a2, char a3)
{
  sub_25C6C0CCC(a1, a2, a3, *v3);
  *uint64_t v3 = v4;
}

void sub_25C6CFDA8(char a1, uint64_t a2, char a3)
{
  sub_25C6C0D88(a1, a2, a3, *v3);
  *uint64_t v3 = v4;
}

void sub_25C6CFDC8(char a1, uint64_t a2, char a3)
{
  sub_25C6C0E44(a1, a2, a3, *v3);
  *uint64_t v3 = v4;
}

uint64_t sub_25C6CFDE8(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_25C6CA808(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6948);
  sub_25C6D67B0();

  uint64_t v6 = *(void *)(*(void *)(v8 + 56) + 8 * v4);
  type metadata accessor for CNActionType(0);
  sub_25C6AA904(0, &qword_26A5C6940);
  sub_25C6D0940(&qword_26A5C6950, type metadata accessor for CNActionType);
  sub_25C6D67C0();
  *uint64_t v2 = v8;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_25C6CFF34(uint64_t a1, void *a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_25C6D0044(a1, a2);
  *uint64_t v2 = v6;

  return swift_bridgeObjectRelease();
}

uint64_t sub_25C6CFFB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_25C6D015C(a1, a2, a3);
  *uint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

void sub_25C6D0044(uint64_t a1, void *a2)
{
  uint64_t v3 = (void **)v2;
  char v5 = (void *)*v2;
  unint64_t v6 = sub_25C6CA808((uint64_t)a2);
  if (__OFADD__(v5[2], (v7 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v8 = v6;
  char v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6948);
  if ((sub_25C6D67B0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v10 = sub_25C6CA808((uint64_t)a2);
  if ((v9 & 1) != (v11 & 1))
  {
LABEL_11:
    type metadata accessor for CNActionType(0);
    sub_25C6D6840();
    __break(1u);
    return;
  }
  unint64_t v8 = v10;
LABEL_5:
  uint64_t v12 = *v3;
  if (v9)
  {
    uint64_t v13 = v12[7];

    *(void *)(v13 + 8 * v8) = a1;
  }
  else
  {
    sub_25C6D0284(v8, (uint64_t)a2, a1, v12);
    id v14 = a2;
  }
}

uint64_t sub_25C6D015C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_25C6CA89C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6960);
  if ((sub_25C6D67B0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_25C6CA89C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    uint64_t result = sub_25C6D6840();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_25C6D02C8(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_25C6D0284(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

unint64_t sub_25C6D02C8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  BOOL v5 = (void *)(a5[6] + 16 * result);
  *BOOL v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_25C6D0310(void *a1)
{
  id v2 = objc_msgSend(a1, sel_formattedStringValue);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25C6D63D0();

  return v3;
}

uint64_t sub_25C6D0380(void *a1)
{
  id v1 = objc_msgSend(a1, sel_formattedStringValue);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_25C6D63D0();

  return v3;
}

void sub_25C6D03E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_23();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v60 = v26;
  uint64_t v61 = v25;
  uint64_t v28 = v27;
  uint64_t v62 = v30;
  uint64_t v63 = v29;
  uint64_t v58 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6928);
  OUTLINED_FUNCTION_1();
  uint64_t v33 = v32;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_39();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5C6930);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_40();
  v66[3] = v22;
  v66[4] = a21;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v66);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(boxed_opaque_existential_1, v28, v22);
  *(void *)&v24[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_cancelableTokens] = MEMORY[0x263F8EE78];
  uint64_t v37 = OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_lock;
  id v38 = objc_allocWithZone(MEMORY[0x263F08958]);
  uint64_t v39 = v24;
  *(void *)&v24[v37] = objc_msgSend(v38, sel_init);
  uint64_t v40 = MEMORY[0x263F8EE80];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68D0);
  sub_25C6D5A10();
  uint64_t v41 = OUTLINED_FUNCTION_3_1();
  v42(v41);
  uint64_t v65 = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68E0);
  sub_25C6D5A10();
  id v43 = *(void (**)(uint64_t))(v33 + 32);
  uint64_t v44 = OUTLINED_FUNCTION_13_2();
  v43(v44);
  OUTLINED_FUNCTION_42();
  uint64_t v45 = OUTLINED_FUNCTION_13_2();
  v43(v45);
  OUTLINED_FUNCTION_42();
  uint64_t v46 = OUTLINED_FUNCTION_13_2();
  v43(v46);
  *(void *)&v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_contact] = v58;
  sub_25C6D0794((uint64_t)v66, (uint64_t)&v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_dialRequestPerformer]);
  uint64_t v47 = sub_25C6D58C0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v49 = v48;
  OUTLINED_FUNCTION_9();
  v50();
  id v51 = objc_allocWithZone(MEMORY[0x263F336C8]);
  id v59 = v58;
  id v52 = objc_msgSend(v51, sel_initWithDiscoveringEnvironment_, v60);
  *(void *)&v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_dataSource] = v52;
  uint64_t v53 = sub_25C6D5600();
  OUTLINED_FUNCTION_0_0();
  uint64_t v55 = v54;
  OUTLINED_FUNCTION_9();
  v56();
  *(void *)&v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_textColor] = v62;
  swift_retain();
  sub_25C6D6030();
  LOBYTE(v43) = sub_25C6D5FF0();
  swift_release();
  v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_shouldUseLightBackground] = v43 & 1;

  v64.receiver = v39;
  v64.super_class = (Class)type metadata accessor for GetContactQuickActionButtonsViewModel();
  id v57 = objc_msgSendSuper2(&v64, sel_init);
  sub_25C6CB568();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v61, v53);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v66);
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v63, v47);
  OUTLINED_FUNCTION_26();
}

uint64_t sub_25C6D0794(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_25C6D07F8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25C6D0808(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C6D0870()
{
  OUTLINED_FUNCTION_55();
  uint64_t result = sub_25C6CB13C();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_25C6D089C()
{
  OUTLINED_FUNCTION_55();
  uint64_t result = sub_25C6CB114();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_25C6D08C8()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C6D0904()
{
  return sub_25C6CF5B8(*(void *)(v0 + 16), *(void *)(v0 + 24), MEMORY[0x263F6CE88]);
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

uint64_t sub_25C6D0940(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25C6D0988()
{
  unint64_t result = qword_26A5C6980;
  if (!qword_26A5C6980)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6978);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A5C6980);
  }
  return result;
}

uint64_t sub_25C6D09E0()
{
  return sub_25C6CF5B8(*(void *)(v0 + 16), *(void *)(v0 + 24), MEMORY[0x263F6CE68]);
}

uint64_t objectdestroy_47Tm()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25C6D0A48()
{
  sub_25C6CEE7C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25C6D0A54()
{
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_26_0();
  uint64_t v0 = swift_task_alloc();
  id v1 = (void *)OUTLINED_FUNCTION_14_2(v0);
  *id v1 = v2;
  v1[1] = sub_25C6D0CBC;
  OUTLINED_FUNCTION_5_5();
  return sub_25C6CEAD0();
}

uint64_t sub_25C6D0AE8()
{
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_26_0();
  uint64_t v0 = swift_task_alloc();
  id v1 = (void *)OUTLINED_FUNCTION_14_2(v0);
  *id v1 = v2;
  v1[1] = sub_25C6CFCC4;
  OUTLINED_FUNCTION_5_5();
  return sub_25C6CEB60();
}

uint64_t objectdestroyTm_4()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25C6D0BBC()
{
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_26_0();
  uint64_t v0 = swift_task_alloc();
  id v1 = (void *)OUTLINED_FUNCTION_14_2(v0);
  *id v1 = v2;
  v1[1] = sub_25C6D0CBC;
  OUTLINED_FUNCTION_5_5();
  return sub_25C6CEBF0();
}

uint64_t sub_25C6D0C4C()
{
  OUTLINED_FUNCTION_55();
  uint64_t result = sub_25C6CB18C();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_25C6D0C78()
{
  OUTLINED_FUNCTION_55();
  uint64_t result = sub_25C6CB164();
  *uint64_t v0 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_4(uint64_t a1)
{
  return MEMORY[0x270F9E7E8](v1, v2, a1, v3, v4);
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_2(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return v0;
}

void OUTLINED_FUNCTION_17_1()
{
  JUMPOUT(0x261190220);
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_21_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0 - 120;
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_task_alloc();
}

BOOL OUTLINED_FUNCTION_33_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return v0 - 120;
}

uint64_t OUTLINED_FUNCTION_36_0(uint64_t a1)
{
  uint64_t v3 = a1 + 16;
  return MEMORY[0x270FA05F0](v3, v1);
}

uint64_t OUTLINED_FUNCTION_42()
{
  *(void *)(v1 - 128) = v0;
  return sub_25C6D5A10();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return sub_25C6D64E0();
}

id OUTLINED_FUNCTION_49(void *a1)
{
  a1[2] = 0;
  a1[3] = 0;
  a1[4] = v1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return v0;
}

void OUTLINED_FUNCTION_53(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return sub_25C6CFF34(v1, v0);
}

void OUTLINED_FUNCTION_58(uint64_t a1@<X8>)
{
  *(void *)(v3 - 176) = v1 + a1;
  *(void *)(v3 - 184) = v2 & 0xC000000000000001;
}

uint64_t sub_25C6D109C()
{
  uint64_t v1 = sub_25C6D56C0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  int v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v5 == *MEMORY[0x263F6CE78]) {
    return 0x2E6567617373656DLL;
  }
  if (v5 == *MEMORY[0x263F6CE68])
  {
    uint64_t v7 = 0x2E656E6F6870;
    return v7 & 0xFFFFFFFFFFFFLL | 0x6966000000000000;
  }
  if (v5 == *MEMORY[0x263F6CE88])
  {
    uint64_t v7 = 0x2E6F65646976;
    return v7 & 0xFFFFFFFFFFFFLL | 0x6966000000000000;
  }
  if (v5 == *MEMORY[0x263F6CE70]) {
    return 0x65706F6C65766E65;
  }
  if (v5 == *MEMORY[0x263F6CE80]) {
    return 0xD000000000000029;
  }
  uint64_t result = sub_25C6D6820();
  __break(1u);
  return result;
}

uint64_t sub_25C6D1270(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25C6D1284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_25C6D129C()
{
  uint64_t v0 = sub_25C6D55B0();
  MEMORY[0x270FA5388](v0 - 8);
  sub_25C6D5590();
  return sub_25C6D61D0();
}

uint64_t GetContactAttributeView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v145 = a1;
  uint64_t v143 = (void (*)(void))__swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6A30);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_7();
  uint64_t v144 = v2;
  uint64_t ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v4);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6A38);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_2(v6);
  uint64_t ContactAttributeViewModel = (void (*)(void))type metadata accessor for GetContactAttributeViewModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v8);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6A40);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v10);
  uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6A48);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_2(v12);
  uint64_t v115 = sub_25C6D5E40();
  OUTLINED_FUNCTION_1();
  uint64_t v113 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_2(v15);
  uint64_t ContactAttributeSingleResultView = type metadata accessor for GetContactAttributeSingleResultView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_2(v17);
  uint64_t v130 = sub_25C6D5AA0();
  OUTLINED_FUNCTION_1();
  uint64_t v129 = v18;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_8_2((uint64_t)&v108 - v22);
  uint64_t ContactAttributeAgeView = type metadata accessor for GetContactAttributeAgeView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(v24);
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6A50);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_7();
  uint64_t v139 = v26;
  uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6A58);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_7();
  uint64_t v133 = v28;
  uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6A60);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_7();
  uint64_t v134 = v30;
  uint64_t ContactView = type metadata accessor for GetContactView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v31);
  uint64_t v33 = (char *)&v108 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6A68);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_7();
  uint64_t v140 = v36;
  uint64_t v37 = sub_25C6D5870();
  OUTLINED_FUNCTION_1();
  uint64_t v39 = v38;
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_16();
  uint64_t v42 = MEMORY[0x270FA5388](v41);
  uint64_t v44 = (char *)&v108 - v43;
  uint64_t v45 = MEMORY[0x270FA5388](v42);
  uint64_t v47 = (char *)&v108 - v46;
  uint64_t v48 = MEMORY[0x270FA5388](v45);
  id v50 = (char *)&v108 - v49;
  MEMORY[0x270FA5388](v48);
  id v52 = (char *)&v108 - v51;
  type metadata accessor for GetContactAttributeView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v53);
  uint64_t v55 = (char *)&v108 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C6D2858(v142, (uint64_t)v55, (void (*)(void))type metadata accessor for GetContactAttributeView);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25C6D28AC((uint64_t)v55, (void (*)(void))type metadata accessor for GetContactAttributeView);
    swift_storeEnumTagMultiPayload();
    sub_25C6D24C4();
    return sub_25C6D5CF0();
  }
  uint64_t v110 = v34;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v52, v55, v37);
  id v57 = v52;
  uint64_t v58 = v39;
  if (sub_25C6D5790())
  {
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v50, v52, v37);
    sub_25C6D5750();
    swift_storeEnumTagMultiPayload();
    sub_25C6D2858((uint64_t)v33, v133, (void (*)(void))type metadata accessor for GetContactView);
    swift_storeEnumTagMultiPayload();
    sub_25C6D2808(&qword_26A5C6A80, (void (*)(uint64_t))type metadata accessor for GetContactView);
    sub_25C6D2808(&qword_26A5C6A88, (void (*)(uint64_t))type metadata accessor for GetContactAttributeAgeView);
    OUTLINED_FUNCTION_11_1();
    sub_25C6D5CF0();
    sub_25C6A42C8(v39, v139, &qword_26A5C6A60);
    swift_storeEnumTagMultiPayload();
    sub_25C6D2540();
    sub_25C6D261C();
    uint64_t v59 = v140;
    sub_25C6D5CF0();
    uint64_t v58 = v39;
    sub_25C6AF7F4(v39, &qword_26A5C6A60);
    sub_25C6D28AC((uint64_t)v33, (void (*)(void))type metadata accessor for GetContactView);
    uint64_t v60 = v37;
    uint64_t v61 = v144;
  }
  else
  {
    char v62 = sub_25C6A4550();
    id v109 = v52;
    if (v62)
    {
      uint64_t v63 = v52;
      objc_super v64 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
      v64(v47, v63, v37);
      id v65 = objc_msgSend(self, sel_sharedInstance);
      unint64_t v147 = sub_25C6D27C8();
      uint64_t v148 = &off_2709CC788;
      uint64_t v146 = (uint64_t)v65;
      uint64_t v66 = v128 + *(int *)(ContactAttributeAgeView + 20);
      sub_25C6D0794((uint64_t)&v146, v66);
      uint64_t v67 = ContactAttributeViewModel;
      v64((char *)(v66 + *((int *)ContactAttributeViewModel + 5)), v47, v37);
      sub_25C6D5840();
      uint64_t v68 = v129;
      OUTLINED_FUNCTION_4_5();
      uint64_t v69 = v120;
      OUTLINED_FUNCTION_12_2();
      v70();
      (*(void (**)(uint64_t, uint64_t, char *))(v68 + 32))(v66 + *((int *)v67 + 6), v69, v47);
      char v71 = sub_25C6D5840();
      uint64_t v59 = v140;
      if (v71) {
        uint64_t v72 = sub_25C6D6030();
      }
      else {
        uint64_t v72 = sub_25C6D6020();
      }
      uint64_t v81 = v72;
      (*(void (**)(char *, uint64_t))(v39 + 8))(v47, v37);
      OUTLINED_FUNCTION_9_4();
      *(void *)(v66 + v82) = v81;
      uint64_t v83 = v128;
      sub_25C6D6260();
      sub_25C6D2858(v83, v133, (void (*)(void))type metadata accessor for GetContactAttributeAgeView);
      swift_storeEnumTagMultiPayload();
      sub_25C6D2808(&qword_26A5C6A80, (void (*)(uint64_t))type metadata accessor for GetContactView);
      sub_25C6D2808(&qword_26A5C6A88, (void (*)(uint64_t))type metadata accessor for GetContactAttributeAgeView);
      OUTLINED_FUNCTION_11_1();
      sub_25C6D5CF0();
      sub_25C6A42C8(v39, v139, &qword_26A5C6A60);
      swift_storeEnumTagMultiPayload();
      sub_25C6D2540();
      sub_25C6D261C();
      sub_25C6D5CF0();
      uint64_t v58 = v39;
      sub_25C6AF7F4(v39, &qword_26A5C6A60);
      sub_25C6D28AC(v83, (void (*)(void))type metadata accessor for GetContactAttributeAgeView);
      uint64_t v60 = v37;
      uint64_t v61 = v144;
    }
    else
    {
      uint64_t v142 = v37;
      char v73 = sub_25C6D5820();
      uint64_t v74 = *(void *)(v39 + 16);
      uint64_t v61 = v144;
      uint64_t v59 = v140;
      if (v73)
      {
        OUTLINED_FUNCTION_8_4();
        ((void (*)(void))v74)();
        id v75 = objc_msgSend(self, sel_sharedInstance);
        unint64_t v147 = sub_25C6D27C8();
        uint64_t v148 = &off_2709CC788;
        uint64_t v146 = (uint64_t)v75;
        uint64_t v76 = (uint64_t)v121 + *(int *)(ContactAttributeSingleResultView + 20);
        sub_25C6D0794((uint64_t)&v146, v76);
        uint64_t v77 = ContactAttributeViewModel;
        OUTLINED_FUNCTION_8_4();
        ((void (*)(void))v74)();
        sub_25C6D5840();
        OUTLINED_FUNCTION_7_4();
        OUTLINED_FUNCTION_4_5();
        uint64_t v78 = v111;
        OUTLINED_FUNCTION_12_2();
        v79();
        (*(void (**)(uint64_t, uint64_t, char *))(v74 + 32))(v76 + *((int *)v77 + 6), v78, v44);
        if (sub_25C6D5840()) {
          uint64_t v80 = sub_25C6D6030();
        }
        else {
          uint64_t v80 = sub_25C6D6020();
        }
        uint64_t v90 = v80;
        uint64_t v60 = v142;
        (*(void (**)(char *, uint64_t))(v58 + 8))(v44, v142);
        OUTLINED_FUNCTION_9_4();
        *(void *)(v76 + v91) = v90;
        sub_25C6D6350();
        sub_25C6D2808(&qword_26A5C5E48, MEMORY[0x263F77980]);
        uint64_t v92 = sub_25C6D5BD0();
        uint64_t v145 = v58;
        uint64_t v93 = (uint64_t)v121;
        uint64_t *v121 = v92;
        *(void *)(v93 + 8) = v94;
        uint64_t v146 = 0x402E000000000000;
        (*(void (**)(uint64_t, void, uint64_t))(v113 + 104))(v114, *MEMORY[0x263F1A6C8], v115);
        sub_25C6A6798();
        sub_25C6D5AE0();
        uint64_t v143 = (void (*)(void))type metadata accessor for GetContactAttributeSingleResultView;
        sub_25C6D2858(v93, v123, (void (*)(void))type metadata accessor for GetContactAttributeSingleResultView);
        swift_storeEnumTagMultiPayload();
        sub_25C6D2808(&qword_26A5C6A98, (void (*)(uint64_t))type metadata accessor for GetContactAttributeSingleResultView);
        sub_25C6D26C8();
        uint64_t v95 = v125;
        sub_25C6D5CF0();
        sub_25C6A42C8(v95, v139, &qword_26A5C6A48);
        swift_storeEnumTagMultiPayload();
        sub_25C6D2540();
        sub_25C6D261C();
        sub_25C6D5CF0();
        sub_25C6AF7F4(v95, &qword_26A5C6A48);
        uint64_t v96 = v93;
        uint64_t v58 = v145;
        sub_25C6D28AC(v96, v143);
        id v57 = v109;
        goto LABEL_21;
      }
      OUTLINED_FUNCTION_8_4();
      ((void (*)(void))v74)();
      id v84 = objc_msgSend(self, sel_sharedInstance);
      unint64_t v147 = sub_25C6D27C8();
      uint64_t v148 = &off_2709CC788;
      uint64_t v146 = (uint64_t)v84;
      uint64_t v85 = v126;
      sub_25C6D0794((uint64_t)&v146, v126);
      uint64_t v86 = ContactAttributeViewModel;
      OUTLINED_FUNCTION_8_4();
      ((void (*)(void))v74)();
      sub_25C6D5840();
      OUTLINED_FUNCTION_7_4();
      OUTLINED_FUNCTION_4_5();
      v87(v112);
      uint64_t v88 = *(void (**)(void))(v74 + 32);
      uint64_t ContactAttributeAgeView = v85 + *((int *)v86 + 6);
      v88();
      if (sub_25C6D5840()) {
        uint64_t v89 = sub_25C6D6030();
      }
      else {
        uint64_t v89 = sub_25C6D6020();
      }
      uint64_t v97 = v89;
      uint64_t v60 = v142;
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v119, v142);
      OUTLINED_FUNCTION_9_4();
      uint64_t v98 = v126;
      *(void *)(v126 + v99) = v97;
      uint64_t v100 = v117;
      uint64_t v101 = (uint64_t)v117 + *(int *)(ContactAttributeMultiResultView + 20);
      uint64_t ContactAttributeViewModel = (void (*)(void))type metadata accessor for GetContactAttributeViewModel;
      sub_25C6D2858(v98, v101, (void (*)(void))type metadata accessor for GetContactAttributeViewModel);
      sub_25C6D6350();
      sub_25C6D2808(&qword_26A5C5E48, MEMORY[0x263F77980]);
      *uint64_t v100 = sub_25C6D5BD0();
      v100[1] = v102;
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v104 = v118;
      uint64_t v105 = (uint64_t *)(v118 + *(int *)(v124 + 36));
      uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6288);
      (*(void (**)(char *, uint64_t, uint64_t))(v129 + 16))((char *)v105 + *(int *)(v106 + 28), ContactAttributeAgeView, v130);
      *uint64_t v105 = KeyPath;
      sub_25C6AB83C((uint64_t)v100, v104);
      sub_25C6A42C8(v104, v123, &qword_26A5C6A38);
      swift_storeEnumTagMultiPayload();
      sub_25C6D2808(&qword_26A5C6A98, (void (*)(uint64_t))type metadata accessor for GetContactAttributeSingleResultView);
      sub_25C6D26C8();
      uint64_t v107 = v125;
      sub_25C6D5CF0();
      sub_25C6A42C8(v107, v139, &qword_26A5C6A48);
      swift_storeEnumTagMultiPayload();
      sub_25C6D2540();
      sub_25C6D261C();
      sub_25C6D5CF0();
      sub_25C6AF7F4(v107, &qword_26A5C6A48);
      sub_25C6AF7F4(v104, &qword_26A5C6A38);
      sub_25C6D28AC(v126, ContactAttributeViewModel);
    }
    id v57 = v109;
  }
LABEL_21:
  sub_25C6A42C8(v59, v61, &qword_26A5C6A68);
  swift_storeEnumTagMultiPayload();
  sub_25C6D24C4();
  sub_25C6D5CF0();
  sub_25C6AF7F4(v59, &qword_26A5C6A68);
  return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v57, v60);
}

uint64_t type metadata accessor for GetContactAttributeView()
{
  uint64_t result = qword_26A5C6AB0;
  if (!qword_26A5C6AB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25C6D24C4()
{
  unint64_t result = qword_26A5C6A70;
  if (!qword_26A5C6A70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6A68);
    sub_25C6D2540();
    sub_25C6D261C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6A70);
  }
  return result;
}

unint64_t sub_25C6D2540()
{
  unint64_t result = qword_26A5C6A78;
  if (!qword_26A5C6A78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6A60);
    sub_25C6D2808(&qword_26A5C6A80, (void (*)(uint64_t))type metadata accessor for GetContactView);
    sub_25C6D2808(&qword_26A5C6A88, (void (*)(uint64_t))type metadata accessor for GetContactAttributeAgeView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6A78);
  }
  return result;
}

unint64_t sub_25C6D261C()
{
  unint64_t result = qword_26A5C6A90;
  if (!qword_26A5C6A90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6A48);
    sub_25C6D2808(&qword_26A5C6A98, (void (*)(uint64_t))type metadata accessor for GetContactAttributeSingleResultView);
    sub_25C6D26C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6A90);
  }
  return result;
}

unint64_t sub_25C6D26C8()
{
  unint64_t result = qword_26A5C6AA0;
  if (!qword_26A5C6AA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6A38);
    sub_25C6D2808(&qword_26A5C6AA8, (void (*)(uint64_t))type metadata accessor for GetContactAttributeMultiResultView);
    sub_25C6D2774();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6AA0);
  }
  return result;
}

unint64_t sub_25C6D2774()
{
  unint64_t result = qword_26A5C62C8;
  if (!qword_26A5C62C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5C6288);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C62C8);
  }
  return result;
}

unint64_t sub_25C6D27C8()
{
  unint64_t result = qword_26A5C69C0;
  if (!qword_26A5C69C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5C69C0);
  }
  return result;
}

uint64_t sub_25C6D2808(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C6D2858(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = OUTLINED_FUNCTION_4();
  v5(v4);
  return a2;
}

uint64_t sub_25C6D28AC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25C6D2904()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for GetContactAttributeView(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    swift_getEnumCaseMultiPayload();
    uint64_t v6 = sub_25C6D5870();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for GetContactAttributeView(uint64_t a1)
{
  uint64_t v2 = sub_25C6D5870();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for GetContactAttributeView(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for GetContactAttributeView(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25C6D28AC(a1, (void (*)(void))type metadata accessor for GetContactAttributeView);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_25C6D5870();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for GetContactAttributeView(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for GetContactAttributeView(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25C6D28AC(a1, (void (*)(void))type metadata accessor for GetContactAttributeView);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_25C6D5870();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25C6D2D10()
{
  uint64_t result = sub_25C6D5870();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_25C6D2D9C()
{
  unint64_t result = qword_26A5C6AC0;
  if (!qword_26A5C6AC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26A5C6AC8);
    sub_25C6D24C4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6AC0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return __swift_destroy_boxed_opaque_existential_0(v0 - 128);
}

uint64_t sub_25C6D2E90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_25C6D2E98()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *sub_25C6D2F74(unsigned char *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unint64_t v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  int v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v9;
  if ((v9 | v5) > 7
    || ((v9 | *(_DWORD *)(v4 + 80)) & 0x100000) != 0
    || ((v6 + v9 + ((v5 + 2) & ~v5)) & ~(unint64_t)v9) + *(void *)(v8 + 64) > 0x18)
  {
    uint64_t v13 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v13 + (((v9 | v5) + 16) & ~(v9 | v5)));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    a1[1] = *((unsigned char *)a2 + 1);
    uint64_t v14 = (unint64_t)&a1[v5 + 2] & ~v5;
    uint64_t v15 = ((unint64_t)a2 + v5 + 2) & ~v5;
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v14, v15);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))((v14 + v6 + v10) & ~v10, (v15 + v6 + v10) & ~v10, v7);
  }
  return v3;
}

uint64_t sub_25C6D3114(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v4 = v3 + 8;
  unint64_t v5 = (a1 + *(unsigned __int8 *)(v3 + 80) + 2) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  (*(void (**)(unint64_t))(v3 + 8))(v5);
  uint64_t v6 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t))(v6 + 8);
  unint64_t v8 = (v5 + *(void *)(v4 + 56) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);

  return v7(v8);
}

unsigned char *sub_25C6D31C8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = v5 + 16;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (unint64_t)&a1[v7 + 2] & ~v7;
  uint64_t v9 = (unint64_t)&a2[v7 + 2] & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v8, v9);
  uint64_t v10 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v10 + 16))((*(void *)(v6 + 48) + *(unsigned __int8 *)(v10 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (*(void *)(v6 + 48) + *(unsigned __int8 *)(v10 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  return a1;
}

unsigned char *sub_25C6D32A4(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = v5 + 24;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (unint64_t)&a1[v7 + 2] & ~v7;
  uint64_t v9 = (unint64_t)&a2[v7 + 2] & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v8, v9);
  uint64_t v10 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v10 + 24))((*(void *)(v6 + 40) + *(unsigned __int8 *)(v10 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (*(void *)(v6 + 40) + *(unsigned __int8 *)(v10 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  return a1;
}

unsigned char *sub_25C6D3380(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = v5 + 32;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (unint64_t)&a1[v7 + 2] & ~v7;
  uint64_t v9 = (unint64_t)&a2[v7 + 2] & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(v8, v9);
  uint64_t v10 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v10 + 32))((*(void *)(v6 + 32) + *(unsigned __int8 *)(v10 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (*(void *)(v6 + 32) + *(unsigned __int8 *)(v10 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  return a1;
}

unsigned char *sub_25C6D345C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = v5 + 40;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (unint64_t)&a1[v7 + 2] & ~v7;
  uint64_t v9 = (unint64_t)&a2[v7 + 2] & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(v8, v9);
  uint64_t v10 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v10 + 40))((*(void *)(v6 + 24) + *(unsigned __int8 *)(v10 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (*(void *)(v6 + 24) + *(unsigned __int8 *)(v10 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  return a1;
}

uint64_t sub_25C6D3538(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = *(void *)(a3 + 24);
  uint64_t v9 = *(void *)(v8 - 8);
  if (v7 <= *(_DWORD *)(v9 + 84)) {
    unsigned int v10 = *(_DWORD *)(v9 + 84);
  }
  else {
    unsigned int v10 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v11 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v12 = *(void *)(*(void *)(v5 - 8) + 64);
  uint64_t v13 = *(unsigned __int8 *)(v9 + 80);
  if (v10 <= 0xFE) {
    unsigned int v14 = 254;
  }
  else {
    unsigned int v14 = v10;
  }
  if (!a2) {
    return 0;
  }
  int v15 = a2 - v14;
  if (a2 <= v14) {
    goto LABEL_28;
  }
  uint64_t v16 = ((v12 + v13 + ((v11 + 2) & ~v11)) & ~v13) + *(void *)(*(void *)(v8 - 8) + 64);
  char v17 = 8 * v16;
  if (v16 <= 3)
  {
    unsigned int v20 = ((v15 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v20))
    {
      int v18 = *(_DWORD *)&a1[v16];
      if (!v18) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v20 > 0xFF)
    {
      int v18 = *(unsigned __int16 *)&a1[v16];
      if (!*(_WORD *)&a1[v16]) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v20 < 2)
    {
LABEL_28:
      if (v10 > 0xFE)
      {
        uint64_t v27 = (unint64_t)&a1[v11 + 2] & ~v11;
        if (v7 != v14)
        {
          uint64_t v27 = (v27 + v12 + v13) & ~v13;
          uint64_t v7 = *(unsigned int *)(v9 + 84);
          uint64_t v5 = v8;
        }
        return __swift_getEnumTagSinglePayload(v27, v7, v5);
      }
      else
      {
        unsigned int v24 = *a1;
        BOOL v25 = v24 >= 2;
        int v26 = (v24 + 2147483646) & 0x7FFFFFFF;
        if (v25) {
          return (v26 + 1);
        }
        else {
          return 0;
        }
      }
    }
  }
  int v18 = a1[v16];
  if (!a1[v16]) {
    goto LABEL_28;
  }
LABEL_18:
  int v21 = (v18 - 1) << v17;
  if (v16 > 3) {
    int v21 = 0;
  }
  if (v16)
  {
    if (v16 <= 3) {
      int v22 = v16;
    }
    else {
      int v22 = 4;
    }
    switch(v22)
    {
      case 2:
        int v23 = *(unsigned __int16 *)a1;
        break;
      case 3:
        int v23 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        break;
      case 4:
        int v23 = *(_DWORD *)a1;
        break;
      default:
        int v23 = *a1;
        break;
    }
  }
  else
  {
    int v23 = 0;
  }
  return v14 + (v23 | v21) + 1;
}

void sub_25C6D3764(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(a4 + 24);
  uint64_t v10 = *(unsigned int *)(v8 + 84);
  uint64_t v11 = *(void *)(v9 - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  if (v10 <= v12) {
    unsigned int v13 = *(_DWORD *)(v11 + 84);
  }
  else {
    unsigned int v13 = *(_DWORD *)(v8 + 84);
  }
  if (v13 <= 0xFE) {
    unsigned int v14 = 254;
  }
  else {
    unsigned int v14 = v13;
  }
  uint64_t v15 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = *(void *)(*(void *)(v7 - 8) + 64);
  uint64_t v17 = *(unsigned __int8 *)(v11 + 80);
  size_t v18 = ((v16 + v17 + ((v15 + 2) & ~v15)) & ~v17) + *(void *)(*(void *)(v9 - 8) + 64);
  char v19 = 8 * v18;
  BOOL v20 = a3 >= v14;
  unsigned int v21 = a3 - v14;
  if (v21 != 0 && v20)
  {
    if (v18 <= 3)
    {
      unsigned int v25 = ((v21 + ~(-1 << v19)) >> v19) + 1;
      if (HIWORD(v25))
      {
        int v22 = 4;
      }
      else if (v25 >= 0x100)
      {
        int v22 = 2;
      }
      else
      {
        int v22 = v25 > 1;
      }
    }
    else
    {
      int v22 = 1;
    }
  }
  else
  {
    int v22 = 0;
  }
  if (v14 < a2)
  {
    unsigned int v23 = ~v14 + a2;
    if (v18 < 4)
    {
      int v24 = (v23 >> v19) + 1;
      if (v18)
      {
        int v26 = v23 & ~(-1 << v19);
        bzero(a1, v18);
        if (v18 == 3)
        {
          *(_WORD *)a1 = v26;
          a1[2] = BYTE2(v26);
        }
        else if (v18 == 2)
        {
          *(_WORD *)a1 = v26;
        }
        else
        {
          *a1 = v26;
        }
      }
    }
    else
    {
      bzero(a1, v18);
      *(_DWORD *)a1 = v23;
      int v24 = 1;
    }
    switch(v22)
    {
      case 1:
        a1[v18] = v24;
        return;
      case 2:
        *(_WORD *)&a1[v18] = v24;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&a1[v18] = v24;
        return;
      default:
        return;
    }
  }
  switch(v22)
  {
    case 1:
      a1[v18] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 2:
      *(_WORD *)&a1[v18] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x25C6D3A34);
    case 4:
      *(_DWORD *)&a1[v18] = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (a2)
      {
LABEL_27:
        if (v13 > 0xFE)
        {
          unint64_t v27 = (unint64_t)&a1[v15 + 2] & ~v15;
          if (v10 != v14)
          {
            unint64_t v27 = (v27 + v16 + v17) & ~v17;
            uint64_t v10 = v12;
            uint64_t v7 = v9;
          }
          __swift_storeEnumTagSinglePayload(v27, a2, v10, v7);
        }
        else
        {
          *a1 = a2 + 1;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for GetContactQuickActionButton(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for GetContactQuickActionButton);
}

uint64_t sub_25C6D3A74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C6D3AB8@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v31 = a2;
  uint64_t v5 = (ValueMetadata *)a1[2];
  unint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t KeyPath = a1[3];
  uint64_t v4 = KeyPath;
  uint64_t v43 = v5;
  uint64_t v44 = v6;
  unint64_t v45 = v7;
  uint64_t v8 = sub_25C6D5E60();
  OUTLINED_FUNCTION_1();
  uint64_t v30 = v9;
  MEMORY[0x270FA5388](v10);
  unint64_t v27 = (char *)&v26 - v11;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v29 = WitnessTable;
  unint64_t v28 = sub_25C6D3FA8();
  uint64_t KeyPath = v8;
  uint64_t v43 = &type metadata for GetContactQuickActionPrimitiveButtonStyle;
  uint64_t v44 = WitnessTable;
  unint64_t v45 = v28;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  char v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  unsigned int v21 = (char *)&v26 - v20;
  uint64_t v37 = v5;
  uint64_t v38 = v4;
  unint64_t v39 = v7;
  uint64_t v40 = v6;
  uint64_t v41 = v3;
  uint64_t v32 = v5;
  uint64_t v33 = v4;
  unint64_t v34 = v7;
  uint64_t v35 = v6;
  uint64_t v36 = v3;
  int v22 = v27;
  sub_25C6D5E50();
  LOBYTE(v5) = *v3;
  LOBYTE(v6) = v3[1];
  uint64_t KeyPath = swift_getKeyPath();
  LOBYTE(v43) = 0;
  BYTE1(v43) = (_BYTE)v5;
  BYTE2(v43) = v6;
  sub_25C6D5F70();
  swift_release();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v22, v8);
  unsigned int v23 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v23(v21, v19, OpaqueTypeMetadata2);
  int v24 = *(void (**)(char *, uint64_t))(v15 + 8);
  v24(v19, OpaqueTypeMetadata2);
  v23(v31, v21, OpaqueTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v24)(v21, OpaqueTypeMetadata2);
}

uint64_t sub_25C6D3D7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = v9;
  v16[1] = v10;
  v16[2] = v11;
  v16[3] = v12;
  uint64_t v13 = a1 + *(int *)(type metadata accessor for GetContactQuickActionButton(0, (uint64_t)v16) + 56);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v14(v8, v13, a2);
  v14(a3, (uint64_t)v8, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

uint64_t sub_25C6D3E90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, char *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = v9;
  v16[1] = v10;
  v16[2] = v11;
  v16[3] = v12;
  uint64_t v13 = a1 + *(int *)(type metadata accessor for GetContactQuickActionButton(0, (uint64_t)v16) + 60);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v14(v8, v13, a2);
  v14(a3, (uint64_t)v8, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

unint64_t sub_25C6D3FA8()
{
  unint64_t result = qword_26A5C6B50;
  if (!qword_26A5C6B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5C6B50);
  }
  return result;
}

uint64_t sub_25C6D3FF4()
{
  return sub_25C6D4024((uint64_t (*)(void, void, void, void, void))sub_25C6D3D7C);
}

uint64_t sub_25C6D400C()
{
  return sub_25C6D4024((uint64_t (*)(void, void, void, void, void))sub_25C6D3E90);
}

uint64_t sub_25C6D4024(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_25C6D403C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C6D5C40();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25C6D406C()
{
  return sub_25C6D5C50();
}

uint64_t sub_25C6D4094()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C6D412C()
{
  uint64_t v0 = sub_25C6D59F0();
  __swift_allocate_value_buffer(v0, qword_26A5C6B58);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5C6B58);
  return sub_25C6D59E0();
}

uint64_t static Logger.siriContacts.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A5C5CC0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C6D59F0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5C6B58);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
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

void *sub_25C6D42C8(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_25C6D5870();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)v4 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    uint64_t v15 = sub_25C6D5AA0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    *(void *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  }
  swift_retain();
  return v4;
}

uint64_t sub_25C6D442C(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return swift_release();
}

uint64_t sub_25C6D44F4(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  return a1;
}

uint64_t *sub_25C6D4604(uint64_t *a1, uint64_t *a2, int *a3)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C6D5870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_25C6D5AA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25C6D46F0(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_25C6D47D8(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C6D5870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C6D5AA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t sub_25C6D48CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C6D48E0);
}

uint64_t sub_25C6D48E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    sub_25C6D5870();
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v10 = sub_25C6D5AA0();
      uint64_t v11 = *(int *)(a3 + 24);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t sub_25C6D498C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C6D49A0);
}

uint64_t sub_25C6D49A0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    sub_25C6D5870();
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = sub_25C6D5AA0();
      uint64_t v11 = *(int *)(a4 + 24);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for GetContactAttributeViewModel()
{
  uint64_t result = qword_26A5C6B70;
  if (!qword_26A5C6B70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C6D4A90()
{
  uint64_t result = sub_25C6D5870();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C6D5AA0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C6D4B70()
{
  uint64_t v1 = sub_25C6D55D0();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3_4();
  uint64_t v5 = sub_25C6D5600();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeViewModel();
  uint64_t v11 = sub_25C6D5860();
  uint64_t v12 = MEMORY[0x26118F200](v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v0, *MEMORY[0x263F6CE10], v1);
  uint64_t v13 = sub_25C6CA438(v0, v12);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return v13;
}

uint64_t sub_25C6D4CD8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_3_4();
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v7);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8))
  {
    if (a1)
    {
      sub_25C6D6410();
      sub_25C6D6420();
      swift_bridgeObjectRetain();
      sub_25C6D6470();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25C6D5520();
      swift_bridgeObjectRelease();
      uint64_t v9 = sub_25C6D5530();
      if (__swift_getEnumTagSinglePayload(v3, 1, v9) != 1)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(a2, v3, v9);
        uint64_t v16 = a2;
        uint64_t v17 = 0;
        uint64_t v18 = 1;
        uint64_t v19 = v9;
        return __swift_storeEnumTagSinglePayload(v16, v17, v18, v19);
      }
      sub_25C6D540C(v3);
    }
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25C6D59F0();
    __swift_project_value_buffer(v10, (uint64_t)qword_26A5C6B58);
    uint64_t v11 = sub_25C6D59D0();
    os_log_type_t v12 = sub_25C6D65D0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (_WORD *)swift_slowAlloc();
      *uint64_t v13 = 0;
      OUTLINED_FUNCTION_4_6(&dword_25C69F000, v14, v15, "#GetContactAttributeViewModel callURL could not be built");
      MEMORY[0x261190AB0](v13, -1, -1);
    }

    sub_25C6D5530();
    uint64_t v16 = OUTLINED_FUNCTION_3_6();
  }
  else
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_25C6D59F0();
    __swift_project_value_buffer(v20, (uint64_t)qword_26A5C6B58);
    unsigned int v21 = sub_25C6D59D0();
    os_log_type_t v22 = sub_25C6D65D0();
    if (os_log_type_enabled(v21, v22))
    {
      unsigned int v23 = (_WORD *)swift_slowAlloc();
      *unsigned int v23 = 0;
      OUTLINED_FUNCTION_4_6(&dword_25C69F000, v24, v25, "#GetContactAttributeViewModel callURL but telephony unavailable");
      MEMORY[0x261190AB0](v23, -1, -1);
    }

    sub_25C6D5530();
    uint64_t v16 = OUTLINED_FUNCTION_3_6();
  }
  return __swift_storeEnumTagSinglePayload(v16, v17, v18, v19);
}

void sub_25C6D4FF8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25C6D5530();
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C6D51C0();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, a1, v4);
  uint64_t v10 = sub_25C6CE390();
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = v2[3];
    uint64_t v13 = v2[4];
    __swift_project_boxed_opaque_existential_1(v2, v12);
    (*(void (**)(NSObject *, void (*)(void *), void, uint64_t, uint64_t))(v13 + 16))(v11, sub_25C6D5200, 0, v12, v13);
  }
  else
  {
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25C6D59F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A5C6B58);
    uint64_t v11 = sub_25C6D59D0();
    os_log_type_t v15 = sub_25C6D65D0();
    if (os_log_type_enabled(v11, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_25C69F000, v11, v15, "#GetContactAttributeViewModel performCall failed to construct dial request", v16, 2u);
      MEMORY[0x261190AB0](v16, -1, -1);
    }
  }
}

unint64_t sub_25C6D51C0()
{
  unint64_t result = qword_26A5C68F8;
  if (!qword_26A5C68F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_26A5C68F8);
  }
  return result;
}

void sub_25C6D5200(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    if (qword_26A5C5CC0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25C6D59F0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A5C6B58);
    id v4 = a1;
    id v5 = a1;
    oslog = sub_25C6D59D0();
    os_log_type_t v6 = sub_25C6D65D0();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v12 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      swift_getErrorValue();
      uint64_t v9 = sub_25C6D6850();
      sub_25C6A9FE8(v9, v10, &v12);
      sub_25C6D6700();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25C69F000, oslog, v6, "#GetContactAttributeViewModel performCall error opening dial request %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261190AB0](v8, -1, -1);
      MEMORY[0x261190AB0](v7, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_25C6D540C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C68F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return v0;
}

void OUTLINED_FUNCTION_4_6(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void sub_25C6D54A0()
{
  qword_26A5C7B80 = 0x4010000000000000;
}

void sub_25C6D54B0()
{
  qword_26A5C7B88 = 0x4020000000000000;
}

void sub_25C6D54C0()
{
  qword_26A5C7B90 = 0x4028000000000000;
}

void sub_25C6D54D0()
{
  qword_26A5C7B98 = 0x4030000000000000;
}

void sub_25C6D54E0()
{
  qword_26A5C7BA0 = 0x4040000000000000;
}

uint64_t sub_25C6D54F0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25C6D5500()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25C6D5510()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25C6D5520()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25C6D5530()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25C6D5540()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25C6D5550()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25C6D5560()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25C6D5570()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25C6D5580()
{
  return MEMORY[0x270F741F0]();
}

uint64_t sub_25C6D5590()
{
  return MEMORY[0x270F75648]();
}

uint64_t sub_25C6D55A0()
{
  return MEMORY[0x270F75658]();
}

uint64_t sub_25C6D55B0()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_25C6D55C0()
{
  return MEMORY[0x270F644E8]();
}

uint64_t sub_25C6D55D0()
{
  return MEMORY[0x270F644F0]();
}

uint64_t sub_25C6D55E0()
{
  return MEMORY[0x270F644F8]();
}

uint64_t sub_25C6D55F0()
{
  return MEMORY[0x270F64510]();
}

uint64_t sub_25C6D5600()
{
  return MEMORY[0x270F64518]();
}

uint64_t sub_25C6D5610()
{
  return MEMORY[0x270F64530]();
}

uint64_t sub_25C6D5620()
{
  return MEMORY[0x270F64538]();
}

uint64_t sub_25C6D5630()
{
  return MEMORY[0x270F64540]();
}

uint64_t sub_25C6D5640()
{
  return MEMORY[0x270F64548]();
}

uint64_t sub_25C6D5650()
{
  return MEMORY[0x270F64550]();
}

uint64_t sub_25C6D5660()
{
  return MEMORY[0x270F64558]();
}

uint64_t sub_25C6D5670()
{
  return MEMORY[0x270F64560]();
}

uint64_t sub_25C6D5680()
{
  return MEMORY[0x270F64568]();
}

uint64_t sub_25C6D5690()
{
  return MEMORY[0x270F64570]();
}

uint64_t sub_25C6D56A0()
{
  return MEMORY[0x270F64578]();
}

uint64_t sub_25C6D56B0()
{
  return MEMORY[0x270F64580]();
}

uint64_t sub_25C6D56C0()
{
  return MEMORY[0x270F64588]();
}

uint64_t sub_25C6D56D0()
{
  return MEMORY[0x270F64598]();
}

uint64_t sub_25C6D56E0()
{
  return MEMORY[0x270F645A0]();
}

uint64_t sub_25C6D56F0()
{
  return MEMORY[0x270F645A8]();
}

uint64_t sub_25C6D5700()
{
  return MEMORY[0x270F645B0]();
}

uint64_t sub_25C6D5710()
{
  return MEMORY[0x270F645B8]();
}

uint64_t sub_25C6D5720()
{
  return MEMORY[0x270F645C0]();
}

uint64_t sub_25C6D5730()
{
  return MEMORY[0x270F645C8]();
}

uint64_t sub_25C6D5740()
{
  return MEMORY[0x270F645D0]();
}

uint64_t sub_25C6D5750()
{
  return MEMORY[0x270F645D8]();
}

uint64_t sub_25C6D5760()
{
  return MEMORY[0x270F645E8]();
}

uint64_t sub_25C6D5770()
{
  return MEMORY[0x270F645F0]();
}

uint64_t sub_25C6D5780()
{
  return MEMORY[0x270F645F8]();
}

uint64_t sub_25C6D5790()
{
  return MEMORY[0x270F64600]();
}

uint64_t sub_25C6D57A0()
{
  return MEMORY[0x270F64608]();
}

uint64_t sub_25C6D57B0()
{
  return MEMORY[0x270F64610]();
}

uint64_t sub_25C6D57C0()
{
  return MEMORY[0x270F64618]();
}

uint64_t sub_25C6D57D0()
{
  return MEMORY[0x270F64620]();
}

uint64_t sub_25C6D57E0()
{
  return MEMORY[0x270F64630]();
}

uint64_t sub_25C6D57F0()
{
  return MEMORY[0x270F64638]();
}

uint64_t sub_25C6D5800()
{
  return MEMORY[0x270F64640]();
}

uint64_t sub_25C6D5810()
{
  return MEMORY[0x270F64650]();
}

uint64_t sub_25C6D5820()
{
  return MEMORY[0x270F64658]();
}

uint64_t sub_25C6D5830()
{
  return MEMORY[0x270F64660]();
}

uint64_t sub_25C6D5840()
{
  return MEMORY[0x270F64668]();
}

uint64_t sub_25C6D5850()
{
  return MEMORY[0x270F64670]();
}

uint64_t sub_25C6D5860()
{
  return MEMORY[0x270F64678]();
}

uint64_t sub_25C6D5870()
{
  return MEMORY[0x270F64680]();
}

uint64_t sub_25C6D5880()
{
  return MEMORY[0x270F64688]();
}

uint64_t sub_25C6D5890()
{
  return MEMORY[0x270F64690]();
}

uint64_t sub_25C6D58A0()
{
  return MEMORY[0x270F646A0]();
}

uint64_t sub_25C6D58B0()
{
  return MEMORY[0x270F646A8]();
}

uint64_t sub_25C6D58C0()
{
  return MEMORY[0x270F646B0]();
}

uint64_t sub_25C6D58D0()
{
  return MEMORY[0x270F646C0]();
}

uint64_t sub_25C6D58E0()
{
  return MEMORY[0x270F646C8]();
}

uint64_t sub_25C6D58F0()
{
  return MEMORY[0x270F646D0]();
}

uint64_t sub_25C6D5900()
{
  return MEMORY[0x270F646D8]();
}

uint64_t sub_25C6D5910()
{
  return MEMORY[0x270F646E0]();
}

uint64_t sub_25C6D5920()
{
  return MEMORY[0x270F646E8]();
}

uint64_t sub_25C6D5930()
{
  return MEMORY[0x270F646F0]();
}

uint64_t sub_25C6D5940()
{
  return MEMORY[0x270F646F8]();
}

uint64_t sub_25C6D5950()
{
  return MEMORY[0x270F64700]();
}

uint64_t sub_25C6D5960()
{
  return MEMORY[0x270F64708]();
}

uint64_t sub_25C6D5970()
{
  return MEMORY[0x270F64710]();
}

uint64_t sub_25C6D5980()
{
  return MEMORY[0x270F64718]();
}

uint64_t sub_25C6D5990()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_25C6D59A0()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_25C6D59B0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_25C6D59C0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25C6D59D0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C6D59E0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25C6D59F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C6D5A00()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_25C6D5A10()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_25C6D5A20()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_25C6D5A30()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_25C6D5A40()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_25C6D5A50()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_25C6D5A60()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_25C6D5A70()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_25C6D5A80()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_25C6D5A90()
{
  return MEMORY[0x270EFED88]();
}

uint64_t sub_25C6D5AA0()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_25C6D5AB0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_25C6D5AC0()
{
  return MEMORY[0x270EFF208]();
}

uint64_t sub_25C6D5AD0()
{
  return MEMORY[0x270EFF220]();
}

uint64_t sub_25C6D5AE0()
{
  return MEMORY[0x270EFF3E0]();
}

uint64_t sub_25C6D5AF0()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_25C6D5B00()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_25C6D5B10()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_25C6D5B20()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_25C6D5B30()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_25C6D5B40()
{
  return MEMORY[0x270EFF7E0]();
}

uint64_t sub_25C6D5B50()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_25C6D5B60()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_25C6D5B70()
{
  return MEMORY[0x270EFFA60]();
}

uint64_t sub_25C6D5B80()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_25C6D5B90()
{
  return MEMORY[0x270F00538]();
}

uint64_t sub_25C6D5BA0()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_25C6D5BB0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_25C6D5BC0()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_25C6D5BD0()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_25C6D5BE0()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_25C6D5BF0()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_25C6D5C00()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_25C6D5C10()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_25C6D5C20()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_25C6D5C30()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_25C6D5C40()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_25C6D5C50()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_25C6D5C60()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_25C6D5C70()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_25C6D5C80()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25C6D5C90()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25C6D5CA0()
{
  return MEMORY[0x270F01198]();
}

uint64_t sub_25C6D5CB0()
{
  return MEMORY[0x270F011A0]();
}

uint64_t sub_25C6D5CC0()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_25C6D5CD0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25C6D5CE0()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_25C6D5CF0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_25C6D5D00()
{
  return MEMORY[0x270F75920]();
}

uint64_t sub_25C6D5D10()
{
  return MEMORY[0x270F01D10]();
}

uint64_t sub_25C6D5D20()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_25C6D5D30()
{
  return MEMORY[0x270F01FF8]();
}

uint64_t sub_25C6D5D40()
{
  return MEMORY[0x270F02000]();
}

uint64_t sub_25C6D5D50()
{
  return MEMORY[0x270F02008]();
}

uint64_t sub_25C6D5D60()
{
  return MEMORY[0x270F02010]();
}

uint64_t sub_25C6D5D70()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_25C6D5D80()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_25C6D5D90()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_25C6D5DA0()
{
  return MEMORY[0x270F02908]();
}

uint64_t sub_25C6D5DB0()
{
  return MEMORY[0x270F02910]();
}

uint64_t sub_25C6D5DC0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25C6D5DD0()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_25C6D5DE0()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25C6D5DF0()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_25C6D5E00()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_25C6D5E10()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_25C6D5E20()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_25C6D5E30()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_25C6D5E40()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_25C6D5E50()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_25C6D5E60()
{
  return MEMORY[0x270F02E08]();
}

uint64_t sub_25C6D5E70()
{
  return MEMORY[0x270F75940]();
}

uint64_t sub_25C6D5E80()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_25C6D5E90()
{
  return MEMORY[0x270F02FD8]();
}

uint64_t sub_25C6D5EA0()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_25C6D5EB0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25C6D5EC0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25C6D5ED0()
{
  return MEMORY[0x270F75950]();
}

uint64_t sub_25C6D5EE0()
{
  return MEMORY[0x270F75970]();
}

uint64_t sub_25C6D5EF0()
{
  return MEMORY[0x270F759A0]();
}

uint64_t sub_25C6D5F00()
{
  return MEMORY[0x270F759E0]();
}

uint64_t sub_25C6D5F10()
{
  return MEMORY[0x270F75A00]();
}

uint64_t sub_25C6D5F20()
{
  return MEMORY[0x270F75A90]();
}

uint64_t sub_25C6D5F30()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25C6D5F40()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25C6D5F50()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_25C6D5F60()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_25C6D5F70()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_25C6D5F80()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_25C6D5F90()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_25C6D5FA0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25C6D5FB0()
{
  return MEMORY[0x270F038B8]();
}

uint64_t sub_25C6D5FC0()
{
  return MEMORY[0x270F04200]();
}

uint64_t sub_25C6D5FD0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_25C6D5FE0()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_25C6D5FF0()
{
  return MEMORY[0x270F043C0]();
}

uint64_t sub_25C6D6000()
{
  return MEMORY[0x270F043C8]();
}

uint64_t sub_25C6D6020()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_25C6D6030()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_25C6D6040()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_25C6D6050()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_25C6D6060()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_25C6D6070()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_25C6D6080()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_25C6D6090()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_25C6D60A0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_25C6D60B0()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_25C6D60C0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_25C6D60D0()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_25C6D60E0()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_25C6D60F0()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_25C6D6100()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_25C6D6110()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_25C6D6120()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_25C6D6130()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_25C6D6140()
{
  return MEMORY[0x270F04FA0]();
}

uint64_t sub_25C6D6150()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_25C6D6160()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25C6D6170()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_25C6D6180()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25C6D6190()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25C6D61A0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25C6D61B0()
{
  return MEMORY[0x270F75AD0]();
}

uint64_t sub_25C6D61C0()
{
  return MEMORY[0x270F75B20]();
}

uint64_t sub_25C6D61D0()
{
  return MEMORY[0x270F75B38]();
}

uint64_t sub_25C6D61E0()
{
  return MEMORY[0x270F75BF8]();
}

uint64_t sub_25C6D61F0()
{
  return MEMORY[0x270F75C30]();
}

uint64_t sub_25C6D6200()
{
  return MEMORY[0x270F75C80]();
}

uint64_t sub_25C6D6210()
{
  return MEMORY[0x270F75C90]();
}

uint64_t sub_25C6D6220()
{
  return MEMORY[0x270F75D70]();
}

uint64_t sub_25C6D6230()
{
  return MEMORY[0x270F75DB8]();
}

uint64_t sub_25C6D6240()
{
  return MEMORY[0x270F75DC0]();
}

uint64_t sub_25C6D6250()
{
  return MEMORY[0x270F75E28]();
}

uint64_t sub_25C6D6260()
{
  return MEMORY[0x270F75E40]();
}

uint64_t sub_25C6D6270()
{
  return MEMORY[0x270F75E48]();
}

uint64_t sub_25C6D6280()
{
  return MEMORY[0x270F75E58]();
}

uint64_t sub_25C6D6290()
{
  return MEMORY[0x270F75E70]();
}

uint64_t sub_25C6D62A0()
{
  return MEMORY[0x270F75E80]();
}

uint64_t sub_25C6D62B0()
{
  return MEMORY[0x270F75EC8]();
}

uint64_t sub_25C6D62C0()
{
  return MEMORY[0x270F75ED0]();
}

uint64_t sub_25C6D62D0()
{
  return MEMORY[0x270F75F08]();
}

uint64_t sub_25C6D62E0()
{
  return MEMORY[0x270F75F20]();
}

uint64_t sub_25C6D62F0()
{
  return MEMORY[0x270F75FA8]();
}

uint64_t sub_25C6D6300()
{
  return MEMORY[0x270F75FB0]();
}

uint64_t sub_25C6D6310()
{
  return MEMORY[0x270F76080]();
}

uint64_t sub_25C6D6320()
{
  return MEMORY[0x270F760B0]();
}

uint64_t sub_25C6D6330()
{
  return MEMORY[0x270F76198]();
}

uint64_t sub_25C6D6340()
{
  return MEMORY[0x270F76248]();
}

uint64_t sub_25C6D6350()
{
  return MEMORY[0x270F76280]();
}

uint64_t sub_25C6D6360()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25C6D6370()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25C6D6380()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25C6D6390()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25C6D63A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C6D63B0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25C6D63C0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25C6D63D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C6D63E0()
{
  return MEMORY[0x270F64720]();
}

uint64_t sub_25C6D63F0()
{
  return MEMORY[0x270F64728]();
}

uint64_t sub_25C6D6400()
{
  return MEMORY[0x270F64730]();
}

uint64_t sub_25C6D6410()
{
  return MEMORY[0x270F64738]();
}

uint64_t sub_25C6D6420()
{
  return MEMORY[0x270F64748]();
}

uint64_t sub_25C6D6430()
{
  return MEMORY[0x270F64750]();
}

uint64_t sub_25C6D6440()
{
  return MEMORY[0x270F64758]();
}

uint64_t sub_25C6D6450()
{
  return MEMORY[0x270F64760]();
}

uint64_t sub_25C6D6460()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C6D6470()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25C6D6480()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C6D6490()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25C6D64A0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25C6D64B0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25C6D64C0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25C6D64D0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25C6D64E0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25C6D64F0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25C6D6500()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25C6D6510()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25C6D6520()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25C6D6530()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25C6D6540()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25C6D6550()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_25C6D6560()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_25C6D6570()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_25C6D6580()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25C6D6590()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25C6D65A0()
{
  return MEMORY[0x270EE5848]();
}

uint64_t sub_25C6D65B0()
{
  return MEMORY[0x270F64768]();
}

uint64_t sub_25C6D65C0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25C6D65D0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C6D65E0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25C6D65F0()
{
  return MEMORY[0x270F64770]();
}

uint64_t sub_25C6D6600()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25C6D6610()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25C6D6620()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25C6D6630()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25C6D6640()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_25C6D6650()
{
  return MEMORY[0x270F76300]();
}

uint64_t sub_25C6D6660()
{
  return MEMORY[0x270F64780]();
}

uint64_t sub_25C6D6670()
{
  return MEMORY[0x270F64788]();
}

uint64_t sub_25C6D6680()
{
  return MEMORY[0x270F64790]();
}

uint64_t sub_25C6D6690()
{
  return MEMORY[0x270F64798]();
}

uint64_t sub_25C6D66D0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25C6D66E0()
{
  return MEMORY[0x270F647C8]();
}

uint64_t sub_25C6D66F0()
{
  return MEMORY[0x270F647D0]();
}

uint64_t sub_25C6D6700()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C6D6710()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C6D6730()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C6D6740()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25C6D6750()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C6D6760()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25C6D6770()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25C6D6780()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25C6D6790()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25C6D67A0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25C6D67B0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25C6D67C0()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25C6D67D0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C6D67E0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25C6D67F0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C6D6810()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25C6D6820()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_25C6D6830()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C6D6840()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25C6D6850()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25C6D6860()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C6D6870()
{
  return MEMORY[0x270F9FC90]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}