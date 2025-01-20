uint64_t sub_25B8F29F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3[10] = a2;
  v3[11] = a3;
  v3[9] = a1;
  v4 = sub_25B8FFE08();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  v5 = sub_25B8FFE48();
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v6 = type metadata accessor for ReceiverDetailView();
  v3[18] = v6;
  v7 = *(void *)(v6 - 8);
  v3[19] = v7;
  v3[20] = *(void *)(v7 + 64);
  v3[21] = swift_task_alloc();
  sub_25B9000E8();
  v3[22] = sub_25B9000D8();
  v9 = sub_25B9000B8();
  return MEMORY[0x270FA2498](sub_25B8F2BB8, v9, v8);
}

uint64_t sub_25B8F2BB8()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[14];
  uint64_t v16 = v0[16];
  uint64_t v17 = v0[15];
  uint64_t v14 = v0[12];
  uint64_t v15 = v0[13];
  uint64_t v6 = v0[9];
  long long v12 = *((_OWORD *)v0 + 5);
  swift_release();
  sub_25B7D6FE4(0, (unint64_t *)&qword_26A511A80);
  v13 = (void *)sub_25B900278();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v6, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = v12;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v8 + v7, v1, v4);
  v0[6] = sub_25B8FD38C;
  v0[7] = v8;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_25B79CCE8;
  v0[5] = &block_descriptor_92;
  v9 = _Block_copy(v0 + 2);
  sub_25B8FFE28();
  v0[8] = MEMORY[0x263F8EE78];
  sub_25B8FDBAC((unint64_t *)&qword_26A513110, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A511A90);
  sub_25B792ED8((unint64_t *)&qword_26A513120, (uint64_t *)&unk_26A511A90);
  sub_25B900438();
  MEMORY[0x26116A660](0, v3, v5, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v5, v14);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v3, v17);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_25B8F2E78@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v206 = a2;
  uint64_t v199 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5150A0);
  MEMORY[0x270FA5388](v199);
  v200 = (void (*)(char *, uint64_t, uint64_t))((char *)v156 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v210 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A514EB0);
  MEMORY[0x270FA5388](v210);
  v201 = (void (**)(uint64_t, uint64_t))((char *)v156 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v189 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A514A98);
  MEMORY[0x270FA5388](v189);
  uint64_t v187 = (uint64_t)v156 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v191 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A514FD8);
  uint64_t v190 = *(void *)(v191 - 8);
  MEMORY[0x270FA5388](v191);
  v188 = (char *)v156 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A514FC8);
  uint64_t v7 = MEMORY[0x270FA5388](v198);
  v186 = (char *)v156 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v192 = (uint64_t)v156 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5150A8);
  MEMORY[0x270FA5388](v10 - 8);
  v161 = (char *)v156 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = type metadata accessor for TimerInfoView();
  MEMORY[0x270FA5388](v168);
  v160 = (char *)v156 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v174 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A514FA0);
  uint64_t v13 = MEMORY[0x270FA5388](v174);
  v158 = (char *)v156 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v164 = (uint64_t)v156 - v15;
  uint64_t v172 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5150B0);
  MEMORY[0x270FA5388](v172);
  uint64_t v173 = (uint64_t)v156 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A510AE8);
  MEMORY[0x270FA5388](v17 - 8);
  v167 = (char *)v156 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A514F90);
  MEMORY[0x270FA5388](v159);
  uint64_t v170 = (uint64_t)v156 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = sub_25B8FEF38();
  uint64_t v165 = *(void *)(v166 - 8);
  MEMORY[0x270FA5388](v166);
  v176 = (char *)v156 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_25B8FE628();
  MEMORY[0x270FA5388](v21 - 8);
  v156[1] = (char *)v156 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_25B8FFF58();
  MEMORY[0x270FA5388](v23 - 8);
  v156[0] = (char *)v156 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A513228);
  uint64_t v162 = *(void *)(v169 - 8);
  MEMORY[0x270FA5388](v169);
  v175 = (char *)v156 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A514F80);
  uint64_t v26 = MEMORY[0x270FA5388](v177);
  v157 = (char *)v156 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v163 = (uint64_t)v156 - v28;
  uint64_t v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A514F70);
  uint64_t v180 = *(void *)(v181 - 8);
  MEMORY[0x270FA5388](v181);
  v171 = (char *)v156 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5107D0);
  uint64_t v31 = MEMORY[0x270FA5388](v30 - 8);
  v178 = (char *)v156 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  v183 = (char *)v156 - v33;
  uint64_t v195 = sub_25B8FE588();
  uint64_t v194 = *(void *)(v195 - 8);
  uint64_t v34 = MEMORY[0x270FA5388](v195);
  v179 = (char *)v156 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v34);
  v193 = (char *)v156 - v36;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A514EA8);
  MEMORY[0x270FA5388](v37);
  uint64_t v182 = (uint64_t)v156 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514C00);
  uint64_t v39 = *(void *)(a1 + 24);
  uint64_t v185 = *(void *)(a1 + 16);
  uint64_t v184 = v39;
  type metadata accessor for DestinationPresentationMapView();
  sub_25B8FFD28();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A510BD8);
  sub_25B8FEBE8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A511108);
  v40 = (void *)sub_25B8FEBE8();
  uint64_t v41 = sub_25B7DAED8(&qword_26A514C10, &qword_26A514C00);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v236 = v41;
  uint64_t v237 = WitnessTable;
  uint64_t v238 = MEMORY[0x263F1BA00];
  uint64_t v43 = swift_getWitnessTable();
  uint64_t v44 = sub_25B792ED8(&qword_26A510BD0, &qword_26A510BD8);
  uint64_t v234 = v43;
  uint64_t v235 = v44;
  uint64_t v45 = swift_getWitnessTable();
  uint64_t v46 = sub_25B792ED8(&qword_26A511100, &qword_26A511108);
  uint64_t v232 = v45;
  uint64_t v233 = v46;
  uint64_t v47 = swift_getWitnessTable();
  id v214 = v40;
  uint64_t v215 = v47;
  swift_getOpaqueTypeMetadata2();
  sub_25B900388();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514EA0);
  swift_getTupleTypeMetadata2();
  uint64_t v209 = sub_25B8FFDE8();
  uint64_t v48 = sub_25B900388();
  uint64_t v197 = v37;
  uint64_t v49 = sub_25B8FF1B8();
  v50 = *(void (***)(uint64_t, uint64_t))(v49 - 8);
  uint64_t v51 = MEMORY[0x270FA5388](v49);
  v196 = (char *)v156 - v52;
  uint64_t v203 = v48;
  uint64_t v53 = *(void *)(v48 - 8);
  uint64_t v54 = MEMORY[0x270FA5388](v51);
  v56 = (void *)((char *)v156 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v54);
  v58 = (void *)((char *)v156 - v57);
  uint64_t v202 = v59;
  uint64_t v205 = sub_25B8FF1B8();
  uint64_t v204 = *(void *)(v205 - 8);
  MEMORY[0x270FA5388](v205);
  v207 = (char *)v156 - v60;
  uint64_t v61 = a1;
  uint64_t v62 = KeyPath;
  v63 = *(void **)(KeyPath + *(int *)(a1 + 36) + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v64 = v63;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  id v65 = v214;
  if (!v214) {
    goto LABEL_6;
  }
  id v66 = objc_msgSend(v214, sel_sessionType);

  if (v66 == (id)1)
  {
    v201 = v50;
    type metadata accessor for SafetyCacheDetailViewModel();
    sub_25B8FDBAC(&qword_26A5132A8, (void (*)(uint64_t))type metadata accessor for SafetyCacheDetailViewModel);
    v101 = (void *)sub_25B8FE998();
    swift_getKeyPath();
    swift_getKeyPath();
    v102 = v183;
    sub_25B8FE8D8();

    swift_release();
    uint64_t v103 = (uint64_t)v102;
    swift_release();
    uint64_t v104 = v194;
    v105 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v194 + 48);
    uint64_t v106 = v195;
    if (v105((char *)v103, 1, v195) == 1)
    {
      uint64_t v107 = v103;
      v92 = v206;
    }
    else
    {
      v200 = *(void (**)(char *, uint64_t, uint64_t))(v104 + 32);
      v200(v193, v103, v106);
      v108 = (void *)sub_25B8FE998();
      swift_getKeyPath();
      swift_getKeyPath();
      v109 = v178;
      sub_25B8FE8D8();

      uint64_t v110 = v195;
      swift_release();
      swift_release();
      if (v105(v109, 1, v110) != 1)
      {
        v117 = v179;
        v200(v179, (uint64_t)v109, v110);
        uint64_t v118 = sub_25B8EAA90(v61);
        uint64_t v93 = v205;
        uint64_t v94 = v204;
        uint64_t v114 = v203;
        uint64_t v119 = v168;
        if (v118)
        {
          MEMORY[0x270FA5388](v118);
          v156[-2] = v120;
          v156[-1] = v117;
          sub_25B8FFEE8();
          sub_25B7D6FE4(0, (unint64_t *)&qword_26A512AD0);
          uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
          id v122 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
          sub_25B8FE618();
          id v214 = (id)sub_25B8FFFA8();
          uint64_t v215 = v123;
          sub_25B797F48();
          id v214 = (id)sub_25B8FF748();
          uint64_t v215 = v124;
          char v216 = v125 & 1;
          uint64_t v217 = v126;
          sub_25B8FDBAC(&qword_26A513230, (void (*)(uint64_t))type metadata accessor for TimerInfoView);
          sub_25B8FFCE8();
          v127 = v176;
          sub_25B8FEF28();
          uint64_t v128 = v170;
          v129 = (char *)(v170 + *(int *)(v159 + 36));
          uint64_t v130 = v165;
          v200 = *(void (**)(char *, uint64_t, uint64_t))(v165 + 16);
          uint64_t v131 = v166;
          v200(v129, (uint64_t)v127, v166);
          v132 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v130 + 56);
          v132((uint64_t)v129, 0, 1, v131);
          uint64_t v133 = v162;
          (*(void (**)(uint64_t, char *, uint64_t))(v162 + 16))(v128, v175, v169);
          uint64_t KeyPath = swift_getKeyPath();
          uint64_t v134 = (uint64_t)v167;
          v200(v167, (uint64_t)v176, v131);
          v132(v134, 0, 1, v131);
          uint64_t v135 = (uint64_t)v157;
          v136 = (uint64_t *)&v157[*(int *)(v177 + 36)];
          uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A510B40);
          sub_25B7906A8(v134, (uint64_t)v136 + *(int *)(v137 + 28), &qword_26A510AE8);
          uint64_t *v136 = KeyPath;
          uint64_t v138 = v170;
          sub_25B7906A8(v170, v135, &qword_26A514F90);
          uint64_t v139 = v134;
          v140 = v179;
          sub_25B79070C(v139, &qword_26A510AE8);
          sub_25B79070C(v138, &qword_26A514F90);
          (*(void (**)(char *, uint64_t))(v130 + 8))(v176, v131);
          (*(void (**)(char *, uint64_t))(v133 + 8))(v175, v169);
          uint64_t v141 = v163;
          sub_25B792F1C(v135, v163, &qword_26A514F80);
          sub_25B7906A8(v141, v173, &qword_26A514F80);
          swift_storeEnumTagMultiPayload();
          sub_25B8FC274();
          sub_25B8FC3B4();
          v142 = v171;
          sub_25B8FF1A8();
          sub_25B79070C(v141, &qword_26A514F80);
          v74 = v207;
          uint64_t v143 = v194;
        }
        else
        {
          uint64_t v143 = v194;
          v144 = *(void (**)(char *, char *, uint64_t))(v194 + 16);
          uint64_t v145 = (uint64_t)v160;
          v144(v160, v193, v110);
          v144((char *)(v145 + *(int *)(v119 + 20)), v117, v110);
          *(unsigned char *)(v145 + *(int *)(v119 + 24)) = 0;
          sub_25B8FFA88();
          uint64_t v146 = (uint64_t)v161;
          sub_25B8FE9D8();
          uint64_t v147 = sub_25B8FE9E8();
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v147 - 8) + 56))(v146, 0, 1, v147);
          uint64_t v148 = (uint64_t)v158;
          sub_25B7906A8(v146, (uint64_t)&v158[*(int *)(v174 + 36)], &qword_26A5150A8);
          sub_25B8FCC28(v145, v148, (uint64_t (*)(void))type metadata accessor for TimerInfoView);
          sub_25B79070C(v146, &qword_26A5150A8);
          swift_release();
          sub_25B8FCC90(v145, (uint64_t (*)(void))type metadata accessor for TimerInfoView);
          uint64_t v149 = v164;
          sub_25B792F1C(v148, v164, &qword_26A514FA0);
          v140 = v179;
          sub_25B7906A8(v149, v173, &qword_26A514FA0);
          swift_storeEnumTagMultiPayload();
          sub_25B8FC274();
          sub_25B8FC3B4();
          v142 = v171;
          sub_25B8FF1A8();
          sub_25B79070C(v149, &qword_26A514FA0);
          v74 = v207;
        }
        uint64_t v150 = (uint64_t)v142;
        uint64_t v151 = v182;
        sub_25B792F1C(v150, v182, &qword_26A514F70);
        uint64_t v111 = v151;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v180 + 56))(v151, 0, 1, v181);
        v152 = *(void (**)(char *, uint64_t))(v143 + 8);
        uint64_t v153 = v195;
        v152(v140, v195);
        v152(v193, v153);
        v92 = v206;
        uint64_t v115 = (uint64_t)v196;
        uint64_t v116 = v202;
        goto LABEL_20;
      }
      (*(void (**)(char *, uint64_t))(v104 + 8))(v193, v110);
      v92 = v206;
      uint64_t v107 = (uint64_t)v109;
    }
    uint64_t v93 = v205;
    uint64_t v94 = v204;
    v74 = v207;
    uint64_t v111 = v182;
    uint64_t v112 = v181;
    uint64_t v113 = v180;
    uint64_t v114 = v203;
    uint64_t v115 = (uint64_t)v196;
    uint64_t v116 = v202;
    sub_25B79070C(v107, &qword_26A5107D0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v113 + 56))(v111, 1, 1, v112);
LABEL_20:
    uint64_t v220 = swift_getWitnessTable();
    uint64_t v154 = swift_getWitnessTable();
    unint64_t v155 = sub_25B8FC140();
    sub_25B8EA5BC(v111, v114, v197);
    uint64_t v218 = v154;
    unint64_t v219 = v155;
    swift_getWitnessTable();
    sub_25B8FC484(&qword_26A514FB8, &qword_26A514EB0, (void (*)(void))sub_25B8FC504);
    sub_25B8EA6B4(v115, v116);
    v201[1](v115, v116);
    sub_25B79070C(v111, &qword_26A514EA8);
    goto LABEL_10;
  }
  if (v66 == (id)4)
  {
    MEMORY[0x270FA5388](v67);
    uint64_t v81 = v184;
    v156[-4] = v185;
    v156[-3] = v81;
    v156[-2] = v62;
    sub_25B8FB64C(v187);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A514FE8);
    sub_25B8E8170();
    sub_25B8FC62C();
    v82 = v188;
    sub_25B8FFCE8();
    uint64_t v83 = v190;
    uint64_t v84 = (uint64_t)v186;
    uint64_t v85 = v191;
    (*(void (**)(char *, char *, uint64_t))(v190 + 16))(v186, v82, v191);
    uint64_t v86 = v84 + *(int *)(v198 + 36);
    *(unsigned char *)(v86 + 32) = 0;
    *(_OWORD *)uint64_t v86 = 0u;
    *(_OWORD *)(v86 + 16) = 0u;
    (*(void (**)(char *, uint64_t))(v83 + 8))(v82, v85);
    uint64_t v87 = v192;
    sub_25B792F1C(v84, v192, &qword_26A514FC8);
    sub_25B7906A8(v87, (uint64_t)v200, &qword_26A514FC8);
    swift_storeEnumTagMultiPayload();
    sub_25B8FC504();
    uint64_t v88 = (uint64_t)v201;
    sub_25B8FF1A8();
    uint64_t v223 = swift_getWitnessTable();
    uint64_t v89 = swift_getWitnessTable();
    unint64_t v90 = sub_25B8FC140();
    uint64_t v221 = v89;
    unint64_t v222 = v90;
    uint64_t v91 = v202;
    swift_getWitnessTable();
    sub_25B8FC484(&qword_26A514FB8, &qword_26A514EB0, (void (*)(void))sub_25B8FC504);
    v74 = v207;
    sub_25B8EA5BC(v88, v91, v210);
    sub_25B79070C(v88, &qword_26A514EB0);
    uint64_t v79 = v87;
    v80 = &qword_26A514FC8;
    goto LABEL_8;
  }
  if (v66 != (id)2)
  {
LABEL_6:
    swift_storeEnumTagMultiPayload();
    sub_25B8FC504();
    uint64_t v75 = (uint64_t)v201;
    sub_25B8FF1A8();
    uint64_t v231 = swift_getWitnessTable();
    uint64_t v76 = swift_getWitnessTable();
    unint64_t v77 = sub_25B8FC140();
    uint64_t v229 = v76;
    unint64_t v230 = v77;
    uint64_t v78 = v202;
    swift_getWitnessTable();
    sub_25B8FC484(&qword_26A514FB8, &qword_26A514EB0, (void (*)(void))sub_25B8FC504);
    v74 = v207;
    sub_25B8EA5BC(v75, v78, v210);
    uint64_t v79 = v75;
    v80 = &qword_26A514EB0;
LABEL_8:
    sub_25B79070C(v79, v80);
    goto LABEL_9;
  }
  sub_25B8F7370(a1, v56);
  uint64_t v213 = swift_getWitnessTable();
  uint64_t v68 = v203;
  uint64_t v69 = swift_getWitnessTable();
  sub_25B851864(v58, v56, v68, v69);
  v70 = *(void (**)(void *, uint64_t))(v53 + 8);
  v70(v56, v68);
  sub_25B851864(v56, v58, v68, v69);
  unint64_t v71 = sub_25B8FC140();
  uint64_t v72 = (uint64_t)v196;
  sub_25B8EA6B4((uint64_t)v56, v68);
  v70(v56, v68);
  uint64_t v211 = v69;
  unint64_t v212 = v71;
  uint64_t v73 = v202;
  swift_getWitnessTable();
  sub_25B8FC484(&qword_26A514FB8, &qword_26A514EB0, (void (*)(void))sub_25B8FC504);
  v74 = v207;
  sub_25B8EA6B4(v72, v73);
  v50[1](v72, v73);
  v70(v58, v68);
LABEL_9:
  v92 = v206;
  uint64_t v93 = v205;
  uint64_t v94 = v204;
LABEL_10:
  uint64_t v228 = swift_getWitnessTable();
  uint64_t v95 = swift_getWitnessTable();
  unint64_t v96 = sub_25B8FC140();
  uint64_t v226 = v95;
  unint64_t v227 = v96;
  uint64_t v97 = swift_getWitnessTable();
  uint64_t v98 = sub_25B8FC484(&qword_26A514FB8, &qword_26A514EB0, (void (*)(void))sub_25B8FC504);
  uint64_t v224 = v97;
  uint64_t v225 = v98;
  uint64_t v99 = swift_getWitnessTable();
  sub_25B851864(v92, v74, v93, v99);
  return (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v74, v93);
}

uint64_t sub_25B8F4C84@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  *a3 = sub_25B8FFD88();
  a3[1] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515120);
  return sub_25B8F4CE4(a1, a2, (uint64_t *)((char *)a3 + *(int *)(v7 + 44)));
}

uint64_t sub_25B8F4CE4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _OWORD *a3@<X8>)
{
  v29[0] = a1;
  v29[1] = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515128);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v29 - v8;
  uint64_t v10 = sub_25B8FFA88();
  uint64_t KeyPath = swift_getKeyPath();
  char v12 = sub_25B8FF528();
  uint64_t v47 = KeyPath;
  uint64_t v48 = v10;
  char v49 = v12;
  long long v50 = 0u;
  long long v51 = 0u;
  char v52 = 1;
  sub_25B8FFD98();
  sub_25B862904(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v30, 0.0, 1, 0.0, 1);
  swift_release();
  swift_release();
  sub_25B8FFD88();
  sub_25B8FEA78();
  uint64_t v13 = v41;
  uint64_t v14 = v43;
  uint64_t v16 = v45;
  uint64_t v15 = v46;
  char v54 = v42;
  char v53 = v44;
  *(void *)uint64_t v9 = sub_25B8FF048();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515130);
  sub_25B8F4FD8((uint64_t *)&v9[*(int *)(v17 + 44)]);
  char v18 = v54;
  char v19 = v53;
  sub_25B7906A8((uint64_t)v9, (uint64_t)v7, &qword_26A515128);
  long long v63 = v38;
  long long v64 = v39;
  long long v65 = v40;
  long long v59 = v34;
  long long v60 = v35;
  long long v61 = v36;
  long long v62 = v37;
  long long v55 = v30;
  long long v56 = v31;
  long long v57 = v32;
  long long v58 = v33;
  *(void *)&long long v66 = v13;
  BYTE8(v66) = v18;
  *(void *)&long long v67 = v14;
  BYTE8(v67) = v19;
  *(void *)&long long v68 = v16;
  *((void *)&v68 + 1) = v15;
  long long v20 = v37;
  a3[6] = v36;
  a3[7] = v20;
  long long v21 = v64;
  a3[8] = v63;
  a3[9] = v21;
  long long v22 = v58;
  a3[2] = v57;
  a3[3] = v22;
  long long v23 = v60;
  a3[4] = v59;
  a3[5] = v23;
  long long v24 = v56;
  *a3 = v55;
  a3[1] = v24;
  long long v25 = v66;
  a3[10] = v65;
  a3[11] = v25;
  long long v26 = v68;
  a3[12] = v67;
  a3[13] = v26;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515138);
  sub_25B7906A8((uint64_t)v7, (uint64_t)a3 + *(int *)(v27 + 48), &qword_26A515128);
  sub_25B86901C((uint64_t)&v55);
  sub_25B79070C((uint64_t)v9, &qword_26A515128);
  sub_25B79070C((uint64_t)v7, &qword_26A515128);
  v69[8] = v38;
  v69[9] = v39;
  v69[10] = v40;
  v69[4] = v34;
  v69[5] = v35;
  v69[6] = v36;
  v69[7] = v37;
  v69[0] = v30;
  v69[1] = v31;
  v69[2] = v32;
  v69[3] = v33;
  uint64_t v70 = v13;
  char v71 = v18;
  uint64_t v72 = v14;
  char v73 = v19;
  uint64_t v74 = v16;
  uint64_t v75 = v15;
  return sub_25B8FD43C((uint64_t)v69);
}

uint64_t sub_25B8F4FD8@<X0>(uint64_t *a1@<X8>)
{
  long long v36 = a1;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A512CD8) - 8;
  MEMORY[0x270FA5388](v35);
  long long v33 = (char *)&v31 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515140) - 8;
  uint64_t v2 = MEMORY[0x270FA5388](v34);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v32 = (uint64_t)&v31 - v5;
  uint64_t v6 = sub_25B8FE628();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_25B8FFF58();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_25B8FFF38();
  MEMORY[0x270FA5388](v8 - 8);
  sub_25B8FFF28();
  sub_25B8FFF18();
  type metadata accessor for ReceiverDetailView();
  sub_25B900358();
  sub_25B8FFF08();
  swift_bridgeObjectRelease();
  sub_25B8FFF18();
  sub_25B8FFF48();
  sub_25B7D6FE4(0, (unint64_t *)&qword_26A512AD0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B8FE618();
  uint64_t v37 = sub_25B8FFFA8();
  uint64_t v38 = v11;
  sub_25B797F48();
  uint64_t v12 = sub_25B8FF748();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_25B8FFAF8();
  uint64_t v17 = sub_25B8FF6E8();
  uint64_t v19 = v18;
  char v21 = v20;
  uint64_t v23 = v22;
  swift_release();
  char v24 = v21 & 1;
  sub_25B792FC8(v12, v14, v16);
  swift_bridgeObjectRelease();
  uint64_t v25 = (uint64_t)v33;
  sub_25B8FE9F8();
  sub_25B8FE5E8();
  sub_25B7906A8(v25, (uint64_t)v4, &qword_26A512CD8);
  *(_WORD *)&v4[*(int *)(v34 + 44)] = 257;
  sub_25B79070C(v25, &qword_26A512CD8);
  uint64_t v26 = v32;
  sub_25B792F1C((uint64_t)v4, v32, &qword_26A515140);
  sub_25B7906A8(v26, (uint64_t)v4, &qword_26A515140);
  uint64_t v27 = v36;
  *long long v36 = v17;
  v27[1] = v19;
  *((unsigned char *)v27 + 16) = v24;
  v27[3] = v23;
  uint64_t v28 = v27;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515148);
  sub_25B7906A8((uint64_t)v4, (uint64_t)v28 + *(int *)(v29 + 48), &qword_26A515140);
  sub_25B792FD8(v17, v19, v24);
  swift_bridgeObjectRetain();
  sub_25B79070C(v26, &qword_26A515140);
  sub_25B79070C((uint64_t)v4, &qword_26A515140);
  sub_25B792FC8(v17, v19, v24);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B8F541C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25B8FFA88();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v81 = v2;
  char v82 = sub_25B8FF528();
  long long v83 = 0u;
  long long v84 = 0u;
  char v85 = 1;
  sub_25B8FFD98();
  sub_25B862904(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v90, 0.0, 1, 0.0, 1);
  swift_release();
  swift_release();
  sub_25B8FFD88();
  sub_25B8FEA78();
  uint64_t v34 = v75;
  uint64_t v35 = v77;
  uint64_t v36 = *((void *)&v79 + 1);
  uint64_t v37 = v79;
  char v89 = v76;
  char v87 = v78;
  uint64_t v3 = type metadata accessor for ReceiverDetailView();
  uint64_t v4 = sub_25B8F5814(v3);
  if (v5) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = 0xE000000000000000;
  if (v5) {
    unint64_t v7 = v5;
  }
  *(void *)&v66[0] = v6;
  *((void *)&v66[0] + 1) = v7;
  sub_25B797F48();
  uint64_t v8 = sub_25B8FF748();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_25B8FFAF8();
  uint64_t v13 = sub_25B8FF6E8();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v33 = v18;
  swift_release();
  sub_25B792FC8(v8, v10, v12);
  swift_bridgeObjectRelease();
  uint64_t v19 = swift_getKeyPath();
  long long v48 = v98;
  long long v49 = v99;
  long long v50 = v100;
  long long v44 = v94;
  long long v45 = v95;
  long long v46 = v96;
  long long v47 = v97;
  long long v40 = v90;
  long long v41 = v91;
  long long v42 = v92;
  long long v43 = v93;
  long long v58 = v98;
  long long v59 = v99;
  long long v60 = v100;
  long long v54 = v94;
  long long v55 = v95;
  long long v56 = v96;
  long long v57 = v97;
  LODWORD(v39) = *(_DWORD *)v88;
  *(_DWORD *)((char *)&v39 + 3) = *(_DWORD *)&v88[3];
  char v31 = v89;
  char v32 = v87;
  LODWORD(v38) = *(_DWORD *)v86;
  *(_DWORD *)((char *)&v38 + 3) = *(_DWORD *)&v86[3];
  v51[0] = v90;
  v51[1] = v91;
  long long v52 = v92;
  long long v53 = v93;
  *(void *)&long long v61 = v75;
  BYTE8(v61) = v89;
  HIDWORD(v61) = *(_DWORD *)&v88[3];
  *(_DWORD *)((char *)&v61 + 9) = *(_DWORD *)v88;
  *(void *)&long long v62 = v77;
  BYTE8(v62) = v87;
  HIDWORD(v62) = *(_DWORD *)&v86[3];
  *(_DWORD *)((char *)&v62 + 9) = *(_DWORD *)v86;
  long long v63 = v79;
  long long v20 = v91;
  *(_OWORD *)a1 = v90;
  *(_OWORD *)(a1 + 16) = v20;
  long long v21 = v52;
  long long v22 = v53;
  long long v23 = v55;
  *(_OWORD *)(a1 + 64) = v54;
  *(_OWORD *)(a1 + 80) = v23;
  *(_OWORD *)(a1 + 32) = v21;
  *(_OWORD *)(a1 + 48) = v22;
  long long v24 = v56;
  long long v25 = v57;
  long long v26 = v59;
  *(_OWORD *)(a1 + 128) = v58;
  *(_OWORD *)(a1 + 144) = v26;
  *(_OWORD *)(a1 + 96) = v24;
  *(_OWORD *)(a1 + 112) = v25;
  long long v27 = v60;
  long long v28 = v61;
  long long v29 = v63;
  *(_OWORD *)(a1 + 192) = v62;
  *(_OWORD *)(a1 + 208) = v29;
  *(_OWORD *)(a1 + 160) = v27;
  *(_OWORD *)(a1 + 176) = v28;
  char v65 = v17 & 1;
  *(_DWORD *)(a1 + 241) = *(_DWORD *)v64;
  *(_DWORD *)(a1 + 244) = *(_DWORD *)&v64[3];
  *(void *)(a1 + 224) = v13;
  *(void *)(a1 + 232) = v15;
  *(unsigned char *)(a1 + 240) = v17 & 1;
  *(void *)(a1 + 248) = v33;
  *(void *)(a1 + 256) = v19;
  *(unsigned char *)(a1 + 264) = 1;
  sub_25B86901C((uint64_t)v51);
  sub_25B792FD8(v13, v15, v17 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25B792FC8(v13, v15, v17 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  v66[8] = v48;
  v66[9] = v49;
  v66[10] = v50;
  v66[4] = v44;
  v66[5] = v45;
  v66[6] = v46;
  v66[7] = v47;
  v66[0] = v40;
  v66[1] = v41;
  v66[2] = v42;
  v66[3] = v43;
  uint64_t v67 = v34;
  char v68 = v31;
  *(_DWORD *)uint64_t v69 = v39;
  *(_DWORD *)&v69[3] = *(_DWORD *)((char *)&v39 + 3);
  uint64_t v70 = v35;
  char v71 = v32;
  *(_DWORD *)uint64_t v72 = v38;
  *(_DWORD *)&v72[3] = *(_DWORD *)((char *)&v38 + 3);
  uint64_t v73 = v37;
  uint64_t v74 = v36;
  return sub_25B8FD43C((uint64_t)v66);
}

uint64_t sub_25B8F5814(uint64_t a1)
{
  uint64_t v3 = sub_25B8FE628();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_25B8FFF58();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_25B8FFF38();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = *(void **)(v1 + *(int *)(a1 + 36) + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v7 = v6;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  if (!v11) {
    return 0;
  }
  if (objc_msgSend(v11, sel_cacheDownloadError) == (id)47)
  {
    sub_25B8FFEE8();
  }
  else
  {
    sub_25B8FFF28();
    sub_25B8FFF18();
    sub_25B900358();
    sub_25B8FFF08();
    swift_bridgeObjectRelease();
    sub_25B8FFF18();
    sub_25B8FFF48();
  }
  sub_25B7D6FE4(0, (unint64_t *)&qword_26A512AD0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B8FE618();
  uint64_t v9 = sub_25B8FFFA8();

  return v9;
}

uint64_t sub_25B8F5D2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v181 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515158);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v194 = (uint64_t)&v145 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v145 - v6;
  uint64_t v8 = type metadata accessor for ReceiverDetailView();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v190 = (char *)&v145 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A511AA0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_25B9027D0;
  char v12 = *(void **)(a1 + *(int *)(v8 + 40));
  *(void *)(v11 + 32) = v12;
  id v207 = (id)v11;
  sub_25B900058();
  id v183 = v207;
  uint64_t v192 = v8;
  uint64_t v13 = *(void **)(a1 + *(int *)(v8 + 36) + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v14 = v13;
  id v191 = v12;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  id v15 = v207;
  if (v207)
  {
    unint64_t v16 = 0xD000000000000015;
    char v17 = (char *)objc_msgSend(v207, sel_sessionState);
    if ((unint64_t)(v17 - 3) >= 3)
    {
      if (v17 == (char *)2)
      {
        uint64_t v18 = "checkmark.circle.fill";
        goto LABEL_6;
      }
      if (v17 != (char *)9)
      {
        unint64_t v16 = 0;
        v179 = 0;
        goto LABEL_7;
      }
    }
    unint64_t v16 = 0xD00000000000001BLL;
    uint64_t v18 = "exclamationmark.circle.fill";
LABEL_6:
    v179 = (char *)((unint64_t)(v18 - 32) | 0x8000000000000000);
LABEL_7:

    goto LABEL_9;
  }
  unint64_t v16 = 0;
  v179 = 0;
LABEL_9:
  if (qword_26A510230 != -1) {
    swift_once();
  }
  uint64_t v180 = v16;
  uint64_t v164 = qword_26A513D50;
  if (qword_26A510238 != -1) {
    swift_once();
  }
  uint64_t v163 = qword_26A513D58;
  uint64_t v19 = *(void **)(a1 + *(int *)(v192 + 36) + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v20 = v19;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  id v21 = v207;
  if (v207)
  {
    unint64_t v22 = (unint64_t)objc_msgSend(v207, sel_sessionState);
    if (v22 <= 9 && ((1 << v22) & 0x238) != 0)
    {
      v178 = (void *)sub_25B8FFA48();
    }
    else
    {
      if (qword_26A510618 != -1) {
        swift_once();
      }
      v178 = (void *)qword_26A514438;
      swift_retain();
    }
  }
  else
  {
    if (qword_26A510618 != -1) {
      swift_once();
    }
    v178 = (void *)qword_26A514438;
    swift_retain();
  }
  uint64_t v182 = v7;
  v176 = (void *)sub_25B8FEF08();
  int v177 = sub_25B8FF558();
  if (qword_26A510218 != -1) {
    swift_once();
  }
  sub_25B8FE948();
  uint64_t v161 = v24;
  uint64_t v162 = v23;
  uint64_t v159 = v26;
  uint64_t v160 = v25;
  unsigned __int8 v223 = 0;
  id v27 = (id)type metadata accessor for SafetyMonitorUIUtilities();
  uint64_t v28 = v192;
  long long v29 = *(void **)(a1 + *(int *)(v192 + 36) + 8);
  swift_getKeyPath();
  uint64_t v193 = a1;
  swift_getKeyPath();
  id v30 = v29;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  id v31 = v207;
  uint64_t v32 = sub_25B900358();
  id v191 = v27;
  uint64_t v34 = static SafetyMonitorUIUtilities.receiverDetailTitleText(for:displayName:)(v31, v32, v33);
  unint64_t v188 = v35;
  uint64_t KeyPath = v34;
  swift_bridgeObjectRelease();

  uint64_t v36 = *(void **)(v193 + *(int *)(v28 + 36) + 8);
  swift_getKeyPath();
  uint64_t v37 = v193;
  swift_getKeyPath();
  id v38 = v36;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  id v39 = v207;
  uint64_t v40 = v28;
  uint64_t v186 = sub_25B900358();
  uint64_t v187 = v41;
  long long v42 = *(void **)(v37 + *(int *)(v28 + 36) + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v43 = v42;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  if (v209)
  {
    id v44 = v207;
    sub_25B7F7960((uint64_t)v207, v208, v209, v210, v211, v212, v213, v214, (void *)v215, *((uint64_t *)&v215 + 1), v216);
    long long v45 = v190;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v190, v37, v40);
    if (v44)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v45, v40);
LABEL_33:
      long long v57 = (void *)v188;
      long long v56 = (void *)KeyPath;
      goto LABEL_35;
    }
  }
  else
  {
    long long v45 = v190;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v190, v37, v40);
  }
  long long v46 = *(void **)&v45[*(int *)(v40 + 36) + 8];
  swift_getKeyPath();
  swift_getKeyPath();
  id v47 = v46;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v45, v40);
  uint64_t v48 = v209;
  if (!v209) {
    goto LABEL_33;
  }
  id v184 = v39;
  long long v49 = v208;
  uint64_t v50 = (uint64_t)v207;
  uint64_t v190 = v210;
  long long v51 = v211;
  long long v52 = v212;
  long long v53 = v213;
  long long v54 = v214;
  long long v185 = v215;
  unint64_t v55 = v216;
  id v175 = v208;
  sub_25B7F7960(v50, v49, v48, v190, v51, v52, v53, v54, (void *)v185, *((uint64_t *)&v185 + 1), v55);
  if (v49) {

  }
  long long v57 = (void *)v188;
  long long v56 = (void *)KeyPath;
  id v39 = v184;
LABEL_35:
  *(void *)&long long v185 = static SafetyMonitorUIUtilities.receiverDetailBodyText(for:displayName:isMainSourceWatch:)(v39);
  id v174 = v58;
  swift_bridgeObjectRelease();

  id v207 = v56;
  v208 = v57;
  unint64_t v188 = sub_25B797F48();
  uint64_t v59 = sub_25B8FF748();
  uint64_t v61 = v60;
  char v63 = v62 & 1;
  sub_25B8FF5D8();
  uint64_t v64 = sub_25B8FF728();
  uint64_t v66 = v65;
  char v68 = v67;
  swift_release();
  sub_25B792FC8(v59, v61, v63);
  swift_bridgeObjectRelease();
  id v69 = (id)sub_25B8FF718();
  uint64_t v190 = v70;
  id v191 = v69;
  int v151 = v71;
  id v175 = v72;
  sub_25B792FC8(v64, v66, v68 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  int v154 = sub_25B8FF558();
  if (qword_26A5102C0 != -1) {
    swift_once();
  }
  sub_25B8FE948();
  uint64_t v157 = v74;
  uint64_t v158 = v73;
  uint64_t v155 = v76;
  uint64_t v156 = v75;
  uint64_t v77 = v185;
  id v207 = (id)v185;
  id v78 = v174;
  v208 = v174;
  swift_bridgeObjectRetain();
  uint64_t v79 = sub_25B8FF748();
  uint64_t v81 = v80;
  char v83 = v82 & 1;
  sub_25B8FF5C8();
  id v184 = (id)sub_25B8FF728();
  uint64_t v187 = v84;
  unint64_t v188 = v85;
  int v147 = v86;
  swift_release();
  sub_25B792FC8(v79, v81, v83);
  swift_bridgeObjectRelease();
  uint64_t v186 = swift_getKeyPath();
  int v148 = sub_25B8FF558();
  uint64_t v87 = (uint64_t)v182;
  if (v77 || v78 != (id)0xE000000000000000)
  {
    sub_25B9006F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_25B8FE948();
  uint64_t v149 = v89;
  uint64_t v150 = v88;
  uint64_t v91 = v90;
  uint64_t v93 = v92;
  uint64_t v94 = v192;
  sub_25B8F6C84(v192, (uint64_t)&v207);
  *(void *)&long long v185 = v209;
  uint64_t v95 = (uint64_t)v210;
  uint64_t v173 = (uint64_t)v211;
  id v174 = v207;
  uint64_t v171 = (uint64_t)v213;
  uint64_t v172 = v212;
  uint64_t v169 = v215;
  uint64_t v170 = v214;
  uint64_t v167 = v216;
  uint64_t v168 = *((void *)&v215 + 1);
  uint64_t v165 = v208;
  uint64_t v166 = v217;
  uint64_t v153 = v218;
  int v152 = v219;
  int v96 = BYTE1(v219);
  if (qword_26A5102C8 != -1) {
    swift_once();
  }
  long long v97 = (unsigned char *)(v181 + 320);
  uint64_t v98 = qword_26A513E00;
  if (sub_25B8EAA90(v94))
  {
    sub_25B8F7318(v87);
    uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515160);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v99 - 8) + 56))(v87, 0, 1, v99);
  }
  else
  {
    uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515160);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v100 - 8) + 56))(v87, 1, 1, v100);
  }
  char v101 = v147 & 1;
  LODWORD(v193) = v147 & 1;
  char v102 = v151 & 1;
  v197[0] = v225[0];
  *(_DWORD *)((char *)v197 + 3) = *(_DWORD *)((char *)v225 + 3);
  v196[0] = *(_DWORD *)v224;
  *(_DWORD *)((char *)v196 + 3) = *(_DWORD *)&v224[3];
  int v103 = v223;
  char v195 = v151 & 1;
  v151 &= 1u;
  sub_25B7906A8(v87, v194, &qword_26A515158);
  HIDWORD(v201) = *(_DWORD *)((char *)v225 + 3);
  *(_DWORD *)((char *)&v201 + 9) = v225[0];
  HIDWORD(v203) = *(_DWORD *)&v224[3];
  *(_DWORD *)((char *)&v203 + 9) = *(_DWORD *)v224;
  uint64_t v104 = v181;
  *(unsigned char *)(v181 + 184) = v154;
  *(unsigned char *)(v104 + 176) = 1;
  *(unsigned char *)(v104 + 272) = 1;
  *(unsigned char *)(v104 + 280) = v148;
  *(void *)(v104 + 440) = v98;
  *long long v97 = 0;
  int v146 = v96;
  v97[113] = v96;
  v97[128] = 0;
  *(void *)&long long v198 = v183;
  uint64_t v106 = (void *)v163;
  v105 = (void *)v164;
  *((void *)&v198 + 1) = v164;
  *(void *)&long long v199 = v180;
  *((void *)&v199 + 1) = v179;
  *(void *)&long long v200 = v163;
  *((void *)&v200 + 1) = v178;
  *(void *)&long long v201 = v176;
  BYTE8(v201) = 0;
  *(void *)&long long v203 = 0;
  long long v202 = 0uLL;
  BYTE8(v203) = v177;
  uint64_t v108 = v161;
  uint64_t v107 = v162;
  *(void *)&long long v204 = v162;
  *((void *)&v204 + 1) = v161;
  uint64_t v110 = v159;
  uint64_t v109 = v160;
  *(void *)&long long v205 = v160;
  *((void *)&v205 + 1) = v159;
  LODWORD(v192) = v103;
  char v206 = v103;
  long long v112 = v203;
  long long v111 = v204;
  long long v113 = v205;
  *(unsigned char *)(v104 + 128) = v103;
  *(_OWORD *)(v104 + 96) = v111;
  *(_OWORD *)(v104 + 112) = v113;
  long long v114 = v198;
  long long v115 = v199;
  *(_OWORD *)(v104 + 64) = v202;
  *(_OWORD *)(v104 + 80) = v112;
  long long v116 = v201;
  *(_OWORD *)(v104 + 32) = v200;
  *(_OWORD *)(v104 + 48) = v116;
  *(_OWORD *)uint64_t v104 = v114;
  *(_OWORD *)(v104 + 16) = v115;
  v117 = v190;
  *(void *)(v104 + 136) = v191;
  *(void *)(v104 + 144) = v117;
  *(unsigned char *)(v104 + 152) = v102;
  uint64_t v118 = KeyPath;
  *(void *)(v104 + 160) = v175;
  *(void *)(v104 + 168) = v118;
  *(void *)&long long v114 = v157;
  *(void *)(v104 + 192) = v158;
  *(void *)(v104 + 200) = v114;
  *(void *)&long long v114 = v155;
  *(void *)(v104 + 208) = v156;
  *(void *)(v104 + 216) = v114;
  *(unsigned char *)(v104 + 224) = 0;
  uint64_t v119 = v187;
  *(void *)(v104 + 232) = v184;
  *(void *)(v104 + 240) = v119;
  *(unsigned char *)(v104 + 248) = v101;
  uint64_t v120 = v186;
  *(void *)(v104 + 256) = v188;
  *(void *)(v104 + 264) = v120;
  *(void *)&long long v114 = v149;
  *(void *)(v104 + 288) = v150;
  *(void *)(v104 + 296) = v114;
  *(void *)(v104 + 304) = v91;
  *(void *)(v104 + 312) = v93;
  v121 = v165;
  *(void *)(v104 + 328) = v174;
  *(void *)(v104 + 336) = v121;
  *(void *)(v104 + 344) = v185;
  *(void *)(v104 + 352) = v95;
  uint64_t v122 = v95;
  uint64_t v145 = v95;
  uint64_t v123 = v172;
  *(void *)(v104 + 360) = v173;
  *(void *)(v104 + 368) = v123;
  uint64_t v125 = v169;
  uint64_t v124 = v170;
  *(void *)(v104 + 376) = v171;
  *(void *)(v104 + 384) = v124;
  uint64_t v126 = v167;
  uint64_t v127 = v168;
  *(void *)(v104 + 392) = v125;
  *(void *)(v104 + 400) = v127;
  uint64_t v128 = v166;
  *(void *)(v104 + 408) = v126;
  *(void *)(v104 + 416) = v128;
  uint64_t v129 = v153;
  *(void *)(v104 + 424) = v153;
  char v130 = v152;
  *(unsigned char *)(v104 + 432) = v152;
  uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515168);
  sub_25B7906A8(v194, v104 + *(int *)(v131 + 112), &qword_26A515158);
  sub_25B8FD500((uint64_t)&v198);
  sub_25B792FD8((uint64_t)v191, (uint64_t)v190, v151);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25B792FD8((uint64_t)v184, v187, v193);
  swift_bridgeObjectRetain();
  swift_retain();
  char v132 = v146;
  uint64_t v144 = v128;
  uint64_t v142 = v127;
  uint64_t v143 = v126;
  uint64_t v141 = v125;
  uint64_t v133 = (uint64_t)v174;
  uint64_t v134 = (uint64_t)v165;
  uint64_t v135 = v122;
  uint64_t v137 = (uint64_t)v172;
  uint64_t v136 = v173;
  uint64_t v138 = (uint64_t)v170;
  uint64_t v139 = v171;
  sub_25B8FD558((uint64_t)v174, (uint64_t)v165, v185, v135, v173, (uint64_t)v172, v171, (uint64_t)v170, v141, v142, v143, v144, v129, v130, v146);
  sub_25B79070C((uint64_t)v182, &qword_26A515158);
  sub_25B79070C(v194, &qword_26A515158);
  sub_25B8FD5D8(v133, v134, v185, v145, v136, v137, v139, v138, v169, v168, v167, v166, v129, v130, v132);
  sub_25B792FC8((uint64_t)v184, v187, v193);
  swift_release();
  swift_bridgeObjectRelease();
  sub_25B792FC8((uint64_t)v191, (uint64_t)v190, v195);
  swift_release();
  swift_bridgeObjectRelease();
  id v207 = v183;
  v208 = v105;
  uint64_t v209 = v180;
  uint64_t v210 = v179;
  uint64_t v211 = v106;
  unint64_t v212 = v178;
  uint64_t v213 = v176;
  LOBYTE(v214) = 0;
  *(_DWORD *)((char *)&v214 + 1) = v197[0];
  HIDWORD(v214) = *(_DWORD *)((char *)v197 + 3);
  unint64_t v216 = 0;
  long long v215 = 0uLL;
  LOBYTE(v217) = v177;
  HIDWORD(v217) = *(_DWORD *)((char *)v196 + 3);
  *(_DWORD *)((char *)&v217 + 1) = v196[0];
  uint64_t v218 = v107;
  uint64_t v219 = v108;
  uint64_t v220 = v109;
  uint64_t v221 = v110;
  char v222 = v192;
  return sub_25B8FD658((uint64_t)&v207);
}

uint64_t sub_25B8F6C84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_25B8FE628();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_25B8FFF58();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_25B8FFF38();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = *(void **)(v2 + *(int *)(a1 + 36) + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v9 = v8;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  if (!(void)v55) {
    goto LABEL_7;
  }
  if (objc_msgSend((id)v55, sel_lowPowerModeWarningState) != (id)2)
  {

LABEL_7:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A514DF0);
    sub_25B8E9404();
    uint64_t result = sub_25B8FF1A8();
    long long v40 = v55;
    long long v41 = v57;
    long long v42 = v58;
    long long v43 = v59;
    long long v44 = v60;
    long long v45 = v61;
    goto LABEL_8;
  }
  long long v54 = (void *)v55;
  sub_25B8FFF28();
  sub_25B8FFF18();
  sub_25B900358();
  sub_25B8FFF08();
  swift_bridgeObjectRelease();
  sub_25B8FFF18();
  sub_25B8FFF48();
  sub_25B7D6FE4(0, (unint64_t *)&qword_26A512AD0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v11 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B8FE618();
  uint64_t v12 = sub_25B8FFFA8();
  uint64_t v52 = v13;
  uint64_t v53 = v12;
  sub_25B8FFB58();
  uint64_t v14 = sub_25B8FF758();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_25B8FEF98();
  uint64_t v19 = sub_25B8FF738();
  uint64_t v21 = v20;
  char v23 = v22 & 1;
  uint64_t v24 = sub_25B8FF708();
  uint64_t v50 = v25;
  uint64_t v51 = v24;
  char v49 = v26 & 1;
  sub_25B792FC8(v19, v21, v23);
  swift_bridgeObjectRelease();
  sub_25B792FC8(v14, v16, v18);
  swift_bridgeObjectRelease();
  *(void *)&long long v56 = v53;
  *((void *)&v56 + 1) = v52;
  sub_25B797F48();
  uint64_t v27 = sub_25B8FF748();
  uint64_t v29 = v28;
  LOBYTE(v19) = v30 & 1;
  uint64_t v31 = sub_25B8FF708();
  uint64_t v47 = v32;
  uint64_t v48 = v31;
  char v46 = v33 & 1;
  sub_25B792FC8(v27, v29, v19);
  swift_bridgeObjectRelease();
  sub_25B792FC8(v51, v50, v49);
  swift_bridgeObjectRelease();
  sub_25B8FF678();
  uint64_t v34 = sub_25B8FF728();
  uint64_t v36 = v35;
  LOBYTE(v29) = v37;
  swift_release();
  char v38 = v29 & 1;
  sub_25B792FC8(v48, v47, v46);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_25B8FFAF8();
  swift_getKeyPath();
  sub_25B8FF558();
  if (qword_26A5102C0 != -1) {
    swift_once();
  }
  sub_25B8FE948();
  sub_25B792FD8(v34, v36, v38);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25B792FD8(v34, v36, v38);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A514DF0);
  sub_25B8E9404();
  sub_25B8FF1A8();

  sub_25B792FC8(v34, v36, v38);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_25B792FC8(v34, v36, v38);
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  long long v40 = v56;
  long long v41 = v57;
  long long v42 = v58;
  long long v43 = v59;
  long long v44 = v60;
  long long v45 = v61;
LABEL_8:
  *(_OWORD *)a2 = v40;
  *(_OWORD *)(a2 + 16) = v41;
  *(_OWORD *)(a2 + 32) = v42;
  *(_OWORD *)(a2 + 48) = v43;
  *(_OWORD *)(a2 + 64) = v44;
  *(_OWORD *)(a2 + 80) = v45;
  *(void *)(a2 + 96) = v62;
  *(unsigned char *)(a2 + 104) = v63;
  *(unsigned char *)(a2 + 105) = v64;
  return result;
}

uint64_t sub_25B8F7318@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_25B8FF048();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515170);
  return sub_25B8FA7F0(a1 + *(int *)(v2 + 44));
}

uint64_t sub_25B8F7370@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  long long v58 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A514EA0);
  uint64_t v54 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v53 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v52 = (char *)&v44 - v6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514C00);
  type metadata accessor for DestinationPresentationMapView();
  sub_25B8FFD28();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A510BD8);
  sub_25B8FEBE8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A511108);
  uint64_t v7 = sub_25B8FEBE8();
  uint64_t v8 = sub_25B7DAED8(&qword_26A514C10, &qword_26A514C00);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v68 = v8;
  uint64_t v69 = WitnessTable;
  uint64_t v70 = MEMORY[0x263F1BA00];
  uint64_t v10 = swift_getWitnessTable();
  uint64_t v11 = sub_25B792ED8(&qword_26A510BD0, &qword_26A510BD8);
  uint64_t v66 = v10;
  uint64_t v67 = v11;
  uint64_t v12 = swift_getWitnessTable();
  uint64_t v13 = a1;
  uint64_t v14 = sub_25B792ED8(&qword_26A511100, &qword_26A511108);
  uint64_t v64 = v12;
  uint64_t v65 = v14;
  uint64_t v15 = swift_getWitnessTable();
  uint64_t v50 = v7;
  uint64_t v62 = (void *)v7;
  uint64_t v63 = v15;
  swift_getOpaqueTypeMetadata2();
  uint64_t v16 = sub_25B900388();
  uint64_t v48 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (uint64_t *)((char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v17);
  char v49 = (uint64_t *)((char *)&v44 - v20);
  uint64_t v51 = v3;
  swift_getTupleTypeMetadata2();
  uint64_t v21 = sub_25B8FFDE8();
  uint64_t v57 = sub_25B900388();
  uint64_t v55 = *(void *)(v57 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v57);
  long long v56 = (char *)&v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v44 - v24;
  if (sub_25B8F7B1C(v13))
  {
    sub_25B8F7D5C(v13, v19);
    uint64_t v62 = (void *)v50;
    uint64_t v63 = v15;
    v61[2] = swift_getOpaqueTypeConformance2();
    uint64_t v45 = swift_getWitnessTable();
    char v26 = v49;
    sub_25B851864(v49, v19, v16, v45);
    uint64_t v50 = v21;
    uint64_t v27 = v48;
    char v46 = *(void (**)(void *, uint64_t))(v48 + 8);
    v46(v19, v16);
    uint64_t v47 = v25;
    uint64_t v28 = v52;
    sub_25B8F8694();
    uint64_t v29 = v26;
    (*(void (**)(void *, void *, uint64_t))(v27 + 16))(v19, v26, v16);
    uint64_t v62 = v19;
    uint64_t v30 = v54;
    uint64_t v31 = v53;
    uint64_t v32 = v51;
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v53, v28, v51);
    uint64_t v63 = (uint64_t)v31;
    v61[0] = v16;
    v61[1] = v32;
    uint64_t v59 = v45;
    unint64_t v60 = sub_25B8FCCF8();
    char v33 = v56;
    sub_25B8EA7AC((uint64_t)&v62, 2uLL, (uint64_t)v61);
    uint64_t v34 = *(void (**)(char *, uint64_t))(v30 + 8);
    v34(v28, v32);
    uint64_t v35 = v29;
    uint64_t v36 = v55;
    char v37 = v46;
    v46(v35, v16);
    v34(v31, v32);
    v37(v19, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v33, 0, 1, v50);
    swift_getWitnessTable();
    uint64_t v25 = v47;
    uint64_t v38 = v57;
    (*(void (**)(void))(v36 + 16))();
    id v39 = *(void (**)(char *, uint64_t))(v36 + 8);
    v39(v33, v38);
  }
  else
  {
    long long v40 = v56;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v56, 1, 1, v21);
    swift_getWitnessTable();
    uint64_t v41 = v55;
    uint64_t v38 = v57;
    (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v25, v40, v57);
    id v39 = *(void (**)(char *, uint64_t))(v41 + 8);
    v39(v40, v38);
  }
  v61[3] = swift_getWitnessTable();
  uint64_t v42 = swift_getWitnessTable();
  sub_25B851864(v58, v25, v38, v42);
  return ((uint64_t (*)(char *, uint64_t))v39)(v25, v38);
}

BOOL sub_25B8F7B1C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(v1 + *(int *)(v6 + 44) + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v8 = v7;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  id v9 = v17;
  if (v17)
  {
    id v10 = objc_msgSend(v17, sel_sessionState);

    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, a1);
    if (v10 == (id)2)
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a1);
      return 1;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, a1);
  }
  uint64_t v12 = *(void **)&v5[*(int *)(a1 + 36) + 8];
  swift_getKeyPath();
  swift_getKeyPath();
  id v13 = v12;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  id v14 = v17;
  if (v17)
  {
    id v15 = objc_msgSend(v17, sel_sessionState);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a1);
    return v15 == (id)3;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a1);
    return 0;
  }
}

uint64_t sub_25B8F7D5C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v74 = a2;
  uint64_t v69 = sub_25B8FF3A8();
  uint64_t v68 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v67 = (char *)v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514C00);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v7 = type metadata accessor for DestinationPresentationMapView();
  uint64_t v62 = v4;
  uint64_t v8 = sub_25B8FFD28();
  uint64_t v65 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  long long v61 = (char *)v55 - v9;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A510BD8);
  uint64_t v10 = sub_25B8FEBE8();
  uint64_t v63 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  long long v58 = (char *)v55 - v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A511108);
  uint64_t v12 = sub_25B8FEBE8();
  uint64_t v60 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v57 = (char *)v55 - v13;
  uint64_t v14 = sub_25B7DAED8(&qword_26A514C10, &qword_26A514C00);
  uint64_t v59 = v7;
  uint64_t WitnessTable = swift_getWitnessTable();
  v55[3] = v14;
  uint64_t v84 = v14;
  uint64_t v85 = WitnessTable;
  v55[1] = WitnessTable;
  uint64_t v86 = MEMORY[0x263F1BA00];
  uint64_t v66 = v8;
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v17 = sub_25B792ED8(&qword_26A510BD0, &qword_26A510BD8);
  v55[2] = v16;
  uint64_t v82 = v16;
  uint64_t v83 = v17;
  uint64_t v64 = v10;
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v19 = v70;
  uint64_t v20 = sub_25B792ED8(&qword_26A511100, &qword_26A511108);
  v55[4] = v18;
  uint64_t v80 = v18;
  uint64_t v81 = v20;
  uint64_t v75 = swift_getWitnessTable();
  uint64_t v76 = v12;
  *(void *)&long long v87 = v12;
  *((void *)&v87 + 1) = v75;
  uint64_t v21 = v5;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v73 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v25 = (char *)v55 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  long long v56 = (char *)v55 - v26;
  uint64_t v71 = sub_25B900388();
  uint64_t v27 = *(void *)(v71 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v71);
  uint64_t v72 = (void *)((char *)v55 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)v55 - v30;
  uint64_t v32 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 16);
  swift_unknownObjectRetain();
  char v33 = (void *)v32(v6, v21);
  swift_unknownObjectRelease();

  if (v33)
  {
    MEMORY[0x270FA5388](v34);
    v55[-4] = v6;
    v55[-3] = v21;
    v55[-2] = v19;
    uint64_t v35 = v61;
    sub_25B8EA9BC((uint64_t)sub_25B8FCF68);
    *(void *)&long long v87 = sub_25B8FFA88();
    uint64_t v36 = v31;
    char v37 = v58;
    uint64_t v38 = v66;
    sub_25B8FF888();
    swift_release();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v35, v38);
    long long v87 = 0u;
    long long v88 = 0u;
    char v89 = 0;
    id v39 = v57;
    uint64_t v40 = v64;
    sub_25B8FF828();
    uint64_t v41 = v37;
    uint64_t v31 = v36;
    (*(void (**)(char *, uint64_t))(v63 + 8))(v41, v40);
    uint64_t v42 = v67;
    sub_25B8FF398();
    uint64_t v43 = v75;
    uint64_t v44 = v76;
    sub_25B8FF8F8();
    (*(void (**)(char *, uint64_t))(v68 + 8))(v42, v69);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v39, v44);
    uint64_t v78 = v44;
    uint64_t v79 = v43;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    char v46 = v56;
    sub_25B851864(v56, v25, OpaqueTypeMetadata2, OpaqueTypeConformance2);
    uint64_t v47 = v73;
    uint64_t v48 = *(void (**)(char *, uint64_t))(v73 + 8);
    v48(v25, OpaqueTypeMetadata2);
    char v49 = (char *)v72;
    sub_25B851864((char *)v72, v46, OpaqueTypeMetadata2, OpaqueTypeConformance2);
    v48(v46, OpaqueTypeMetadata2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v49, 0, 1, OpaqueTypeMetadata2);
    uint64_t v50 = v71;
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v31, v49, v71);
    uint64_t v51 = *(uint64_t (**)(char *, uint64_t))(v27 + 8);
    v51(v49, v50);
  }
  else
  {
    uint64_t v52 = (char *)v72;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v73 + 56))((char *)v72, 1, 1, OpaqueTypeMetadata2);
    uint64_t v50 = v71;
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v31, v52, v71);
    uint64_t v51 = *(uint64_t (**)(char *, uint64_t))(v27 + 8);
    v51(v52, v50);
  }
  uint64_t v78 = v76;
  uint64_t v79 = v75;
  uint64_t v77 = swift_getOpaqueTypeConformance2();
  uint64_t v53 = swift_getWitnessTable();
  sub_25B851864(v74, v31, v50, v53);
  return v51(v31, v50);
}

uint64_t sub_25B8F8694()
{
  type metadata accessor for ReceiverDetailView();
  sub_25B8F8F0C((uint64_t)&v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5150D0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5150C0);
  sub_25B792ED8(&qword_26A5150C8, &qword_26A5150C0);
  swift_getOpaqueTypeConformance2();
  return sub_25B8FFD18();
}

uint64_t sub_25B8F87A0@<X0>(void *a1@<X8>)
{
  type metadata accessor for ReceiverDetailView();
  swift_unknownObjectRetain();
  uint64_t v2 = sub_25B8EA970();
  sub_25B80A410(v2, v3, v4, (uint64_t)v18);
  swift_unknownObjectRelease();
  long long v10 = v18[2];
  long long v11 = v18[3];
  uint64_t v12 = v19;
  long long v8 = v18[0];
  long long v9 = v18[1];
  uint64_t v5 = type metadata accessor for DestinationPresentationMapView();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25B851864(v13, &v8, v5, WitnessTable);
  sub_25B8FCF74((uint64_t)v18);
  long long v8 = v13[0];
  long long v9 = v13[1];
  *(void *)&long long v10 = v14;
  BYTE8(v10) = v15;
  long long v11 = v16;
  uint64_t v12 = v17;
  sub_25B851864(a1, &v8, v5, WitnessTable);
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

double sub_25B8F8934@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25B8FE628();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_25B8FFF58();
  MEMORY[0x270FA5388](v3 - 8);
  sub_25B8FFEE8();
  sub_25B7D6FE4(0, (unint64_t *)&qword_26A512AD0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B8FE618();
  sub_25B8FFFA8();
  sub_25B797F48();
  uint64_t v6 = sub_25B8FF748();
  uint64_t v8 = v7;
  LOBYTE(ObjCClassFromMetadata) = v9;
  uint64_t v11 = v10;
  char v12 = sub_25B8FF568();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = ObjCClassFromMetadata & 1;
  *(void *)(a1 + 24) = v11;
  *(unsigned char *)(a1 + 32) = v12;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(unsigned char *)(a1 + 72) = 1;
  return result;
}

uint64_t sub_25B8F8AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v4 = sub_25B8FF3A8();
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v23 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25B8FE628();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_25B8FFF58();
  MEMORY[0x270FA5388](v7 - 8);
  sub_25B8FFEE8();
  sub_25B7D6FE4(0, (unint64_t *)&qword_26A512AD0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v9 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B8FE618();
  uint64_t v10 = sub_25B8FFFA8();
  v20[1] = v11;
  v20[2] = v10;
  type metadata accessor for SafetyMonitorUIUtilities();
  id v12 = *(id *)(v2 + *(int *)(a1 + 36) + 8);
  static SafetyMonitorUIUtilities.ETAForExpandedView(_:)((uint64_t)&v41);

  long long v13 = v41;
  long long v14 = *(_OWORD *)v42;
  uint64_t v16 = *(void *)&v42[16];
  char v15 = v42[24];
  uint64_t v17 = v43;
  LOBYTE(ObjCClassFromMetadata) = BYTE8(v43);
  v32[0] = v41;
  v32[1] = *(_OWORD *)v42;
  v32[2] = *(_OWORD *)&v42[16];
  uint64_t v33 = v43;
  char v34 = BYTE8(v43);
  uint64_t v21 = v43;
  uint64_t v22 = *(void *)&v42[24];
  sub_25B8FCE18(v41, *((uint64_t *)&v41 + 1), *(uint64_t *)v42, *(uint64_t *)&v42[8], *(uint64_t *)&v42[16], v42[24], v43, BYTE8(v43));
  v20[0] = sub_25B8FEF18();
  sub_25B8F8FB0((uint64_t)v32, (uint64_t)&v41);
  swift_bridgeObjectRelease();
  sub_25B8FCE74(v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v16, v15, v17, ObjCClassFromMetadata);
  char v40 = 1;
  char v38 = v42[0];
  char v36 = v42[24];
  *(_DWORD *)((char *)v28 + 1) = *(_DWORD *)v39;
  DWORD1(v28[0]) = *(_DWORD *)&v39[3];
  *(_DWORD *)((char *)&v28[1] + 9) = *(_DWORD *)v37;
  HIDWORD(v28[1]) = *(_DWORD *)&v37[3];
  *(_DWORD *)((char *)v30 + 1) = *(_DWORD *)v35;
  DWORD1(v30[0]) = *(_DWORD *)&v35[3];
  long long v27 = v20[0];
  LOBYTE(v28[0]) = 1;
  *(_OWORD *)((char *)v28 + 8) = v41;
  BYTE8(v28[1]) = v42[0];
  long long v29 = *(_OWORD *)&v42[8];
  LOBYTE(v30[0]) = v42[24];
  *(_OWORD *)((char *)v30 + 8) = v43;
  *(_OWORD *)((char *)&v30[1] + 8) = v44;
  *(_OWORD *)((char *)&v30[2] + 8) = v45;
  *((void *)&v30[3] + 1) = v46;
  char v31 = BYTE8(v46);
  uint64_t v18 = v23;
  sub_25B8FF398();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5150C0);
  sub_25B792ED8(&qword_26A5150C8, &qword_26A5150C0);
  sub_25B8FF8F8();
  sub_25B8FCE74(v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v16, v22, v21, ObjCClassFromMetadata);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v18, v26);
  long long v45 = v30[1];
  long long v46 = v30[2];
  long long v47 = v30[3];
  *(_OWORD *)uint64_t v42 = v28[0];
  *(_OWORD *)&v42[16] = v28[1];
  long long v43 = v29;
  long long v44 = v30[0];
  char v48 = v31;
  long long v41 = v27;
  return sub_25B8FCED0((uint64_t)&v41);
}

uint64_t sub_25B8F8F0C@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A510598 != -1) {
    swift_once();
  }
  sub_25B797F48();
  swift_bridgeObjectRetain();
  uint64_t result = sub_25B8FF748();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_25B8F8FB0@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  sub_25B797F48();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_25B8FF748();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_25B8FFAE8();
  uint64_t v22 = sub_25B8FF6E8();
  uint64_t v23 = v9;
  uint64_t v24 = v10;
  char v12 = v11;
  swift_release();
  char v13 = v12 & 1;
  sub_25B792FC8(v4, v6, v8);
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)a1;
  uint64_t v15 = *(void *)(a1 + 8);
  uint64_t v16 = *(void *)(a1 + 16);
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 48);
  *(void *)a2 = v22;
  *(void *)(a2 + 8) = v24;
  *(unsigned char *)(a2 + 16) = v13;
  *(void *)(a2 + 24) = v23;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v14;
  *(void *)(a2 + 56) = v15;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v17;
  *(void *)(a2 + 80) = v19;
  *(void *)(a2 + 88) = v18;
  *(void *)(a2 + 96) = v20;
  LOBYTE(a1) = *(unsigned char *)(a1 + 56);
  *(unsigned char *)(a2 + 104) = a1;
  sub_25B792FD8(v22, v24, v13);
  swift_bridgeObjectRetain();
  sub_25B8FCE18(v14, v15, v16, v17, v19, v18, v20, a1);
  sub_25B8FCE18(v14, v15, v16, v17, v19, v18, v20, a1);
  sub_25B8FCE74(v14, v15, v16, v17, v19, v18, v20, a1);
  sub_25B792FC8(v22, v24, v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B8F9168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v4 = sub_25B8FE978();
  uint64_t v58 = *(void *)(v4 - 8);
  uint64_t v59 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v57 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25B8FF408();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v55 = v6;
  uint64_t v56 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v52 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5111F0);
  uint64_t v48 = *(void *)(v12 - 8);
  uint64_t v49 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5151A8);
  MEMORY[0x270FA5388](v46);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5151B0);
  uint64_t v53 = *(void *)(v17 - 8);
  uint64_t v54 = v17;
  MEMORY[0x270FA5388](v17);
  long long v47 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5151B8) - 8;
  MEMORY[0x270FA5388](v51);
  uint64_t v50 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  unint64_t v20 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v21 = swift_allocObject();
  uint64_t v23 = *(void *)(a1 + 16);
  uint64_t v22 = *(void *)(a1 + 24);
  *(void *)(v21 + 16) = v23;
  *(void *)(v21 + 24) = v22;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v21 + v20, (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v61 = v23;
  uint64_t v62 = v22;
  uint64_t v63 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A511220);
  sub_25B7DAED8((unint64_t *)&qword_26A511230, &qword_26A511220);
  sub_25B8FFC08();
  id v24 = *(id *)(v2 + *(int *)(a1 + 36) + 8);
  LOBYTE(v11) = SafetyCacheViewModel.shouldAllowCalling.getter();

  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v26 = swift_allocObject();
  *(unsigned char *)(v26 + 16) = (v11 & 1) == 0;
  uint64_t v27 = v48;
  uint64_t v28 = v49;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v16, v14, v49);
  long long v29 = (uint64_t *)&v16[*(int *)(v46 + 36)];
  *long long v29 = KeyPath;
  v29[1] = (uint64_t)sub_25B8FDAD0;
  void v29[2] = v26;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v28);
  uint64_t v30 = v52;
  sub_25B8FF3F8();
  sub_25B8FDAE8();
  sub_25B8FDBAC(&qword_26A511CD8, MEMORY[0x263F1A3B8]);
  char v31 = v47;
  uint64_t v32 = v55;
  sub_25B8FF7C8();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v30, v32);
  sub_25B79070C((uint64_t)v16, &qword_26A5151A8);
  char v34 = v57;
  uint64_t v33 = v58;
  uint64_t v35 = v59;
  (*(void (**)(char *, void, uint64_t))(v58 + 104))(v57, *MEMORY[0x263F18558], v59);
  uint64_t v36 = swift_getKeyPath();
  uint64_t v37 = (uint64_t)v50;
  char v38 = (uint64_t *)&v50[*(int *)(v51 + 44)];
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A511CE0);
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))((char *)v38 + *(int *)(v39 + 28), v34, v35);
  *char v38 = v36;
  uint64_t v41 = v53;
  uint64_t v40 = v54;
  (*(void (**)(uint64_t, char *, uint64_t))(v53 + 16))(v37, v31, v54);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v31, v40);
  uint64_t v42 = sub_25B8FFA58();
  uint64_t v43 = v60;
  sub_25B7906A8(v37, v60, &qword_26A5151B8);
  *(void *)(v43 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A515188) + 36)) = v42;
  return sub_25B79070C(v37, &qword_26A5151B8);
}

void sub_25B8F980C(uint64_t a1)
{
  id v1 = *(id *)(a1 + *(int *)(type metadata accessor for ReceiverDetailView() + 36) + 8);
  SafetyCacheViewModel.callBuddy()();
}

double sub_25B8F986C@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = sub_25B8FE628();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_25B8FFF58();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_25B8FFF38();
  MEMORY[0x270FA5388](v4 - 8);
  sub_25B8FFF28();
  sub_25B8FFF18();
  type metadata accessor for ReceiverDetailView();
  sub_25B900358();
  sub_25B8FFF08();
  swift_bridgeObjectRelease();
  sub_25B8FFF18();
  sub_25B8FFF48();
  sub_25B7D6FE4(0, (unint64_t *)&qword_26A512AD0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B8FE618();
  uint64_t v35 = sub_25B8FFFA8();
  uint64_t v36 = v7;
  sub_25B797F48();
  uint64_t v8 = sub_25B8FF748();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  uint64_t v13 = sub_25B8FF718();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  sub_25B792FC8(v8, v10, v12);
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_25B8FFD88();
  sub_25B861C50(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v31, 0.0, 1, 0.0, 1, v20, v21, v13, v15, v19, v17);
  sub_25B792FC8(v13, v15, v19);
  swift_bridgeObjectRelease();
  double result = *(double *)&v32;
  long long v23 = v33;
  long long v24 = v34;
  long long v25 = v31[2];
  long long v26 = v31[3];
  long long v27 = v31[5];
  long long v28 = v31[4];
  long long v29 = v31[1];
  long long v30 = v31[0];
  a1[6] = v32;
  a1[7] = v23;
  a1[8] = v24;
  a1[2] = v25;
  a1[3] = v26;
  a1[4] = v28;
  a1[5] = v27;
  *a1 = v30;
  a1[1] = v29;
  return result;
}

uint64_t sub_25B8F9B90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v4 = sub_25B8FE978();
  uint64_t v45 = *(void *)(v4 - 8);
  uint64_t v46 = v4;
  MEMORY[0x270FA5388](v4);
  long long v44 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25B8FF008();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v41 = v6;
  uint64_t v42 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5111F0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v38 = v13;
  uint64_t v39 = v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5151A0);
  uint64_t v40 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v37 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = *(void *)(a1 + 16);
  uint64_t v21 = *(void *)(a1 + 24);
  *(void *)(v19 + 16) = v20;
  *(void *)(v19 + 24) = v21;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v19 + v18, (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v48 = v20;
  uint64_t v49 = v21;
  uint64_t v50 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A511220);
  sub_25B7DAED8((unint64_t *)&qword_26A511230, &qword_26A511220);
  sub_25B8FFC08();
  sub_25B8FEFF8();
  sub_25B792ED8(&qword_26A5111E8, &qword_26A5111F0);
  sub_25B8FDBAC(&qword_26A514D80, MEMORY[0x263F19958]);
  long long v23 = v37;
  uint64_t v22 = v38;
  uint64_t v24 = v41;
  sub_25B8FF7C8();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v10, v24);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v16, v22);
  long long v26 = v44;
  uint64_t v25 = v45;
  uint64_t v27 = v46;
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v44, *MEMORY[0x263F18558], v46);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515178);
  uint64_t v30 = v47;
  char v31 = (uint64_t *)(v47 + *(int *)(v29 + 36));
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A511CE0);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))((char *)v31 + *(int *)(v32 + 28), v26, v27);
  *char v31 = KeyPath;
  uint64_t v33 = v40;
  uint64_t v34 = v43;
  (*(void (**)(uint64_t, char *, uint64_t))(v40 + 16))(v30, v23, v43);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v23, v34);
}

void sub_25B8FA0D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5107C0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v27 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5107C8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25B8FE5F8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  long long v28 = (char *)&v26 - v12;
  uint64_t v13 = type metadata accessor for ReceiverDetailView();
  uint64_t v14 = *(void **)(a1 + *(int *)(v13 + 36) + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v15 = v14;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  id v16 = v29;
  if (v29)
  {
    id v17 = objc_msgSend(v29, sel_sessionID);

    sub_25B8FE5D8();
    unint64_t v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v18(v6, v11, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      uint64_t v19 = v28;
      v18(v28, v6, v7);
      uint64_t v20 = *(void **)(a1 + *(int *)(v13 + 36) + 8);
      uint64_t v21 = sub_25B900118();
      uint64_t v22 = (uint64_t)v27;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v27, 1, 1, v21);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v19, v7);
      unint64_t v23 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v24 = (char *)swift_allocObject();
      *((void *)v24 + 2) = 0;
      *((void *)v24 + 3) = 0;
      *((void *)v24 + 4) = v20;
      v18(&v24[v23], v11, v7);
      id v25 = v20;
      sub_25B7EA51C(v22, (uint64_t)&unk_26A510808, (uint64_t)v24);
      swift_release();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v28, v7);

      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }
  sub_25B79070C((uint64_t)v6, &qword_26A5107C8);
}

double sub_25B8FA4B0@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = sub_25B8FE628();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_25B8FFF58();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_25B8FFF38();
  MEMORY[0x270FA5388](v4 - 8);
  sub_25B8FFF28();
  sub_25B8FFF18();
  type metadata accessor for ReceiverDetailView();
  sub_25B900358();
  sub_25B8FFF08();
  swift_bridgeObjectRelease();
  sub_25B8FFF18();
  sub_25B8FFF48();
  sub_25B7D6FE4(0, (unint64_t *)&qword_26A512AD0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B8FE618();
  uint64_t v35 = sub_25B8FFFA8();
  uint64_t v36 = v7;
  sub_25B797F48();
  uint64_t v8 = sub_25B8FF748();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  uint64_t v13 = sub_25B8FF718();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  sub_25B792FC8(v8, v10, v12);
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_25B8FFD88();
  sub_25B861C50(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v31, 0.0, 1, 0.0, 1, v20, v21, v13, v15, v19, v17);
  sub_25B792FC8(v13, v15, v19);
  swift_bridgeObjectRelease();
  double result = *(double *)&v32;
  long long v23 = v33;
  long long v24 = v34;
  long long v25 = v31[2];
  long long v26 = v31[3];
  long long v27 = v31[5];
  long long v28 = v31[4];
  long long v29 = v31[1];
  long long v30 = v31[0];
  a1[6] = v32;
  a1[7] = v23;
  a1[8] = v24;
  a1[2] = v25;
  a1[3] = v26;
  a1[4] = v28;
  a1[5] = v27;
  *a1 = v30;
  a1[1] = v29;
  return result;
}

uint64_t sub_25B8FA7F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515178);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v45 = (uint64_t)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515180);
  uint64_t v4 = v3 - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v46 = (uint64_t)&v44 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515188);
  MEMORY[0x270FA5388](v9 - 8);
  char v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515190);
  uint64_t v13 = v12 - 8;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  char v18 = (char *)&v44 - v17;
  uint64_t v19 = type metadata accessor for ReceiverDetailView();
  sub_25B8F9168(v19, (uint64_t)v11);
  char v20 = sub_25B8FF558();
  sub_25B8FE948();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  sub_25B7906A8((uint64_t)v11, (uint64_t)v16, &qword_26A515188);
  long long v29 = &v16[*(int *)(v13 + 44)];
  *long long v29 = v20;
  *((void *)v29 + 1) = v22;
  *((void *)v29 + 2) = v24;
  *((void *)v29 + 3) = v26;
  *((void *)v29 + 4) = v28;
  v29[40] = 0;
  sub_25B79070C((uint64_t)v11, &qword_26A515188);
  sub_25B792F1C((uint64_t)v16, (uint64_t)v18, &qword_26A515190);
  uint64_t v30 = v45;
  sub_25B8F9B90(v19, v45);
  LOBYTE(v13) = sub_25B8FF558();
  sub_25B8FE948();
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  sub_25B7906A8(v30, (uint64_t)v7, &qword_26A515178);
  uint64_t v39 = &v7[*(int *)(v4 + 44)];
  *uint64_t v39 = v13;
  *((void *)v39 + 1) = v32;
  *((void *)v39 + 2) = v34;
  *((void *)v39 + 3) = v36;
  *((void *)v39 + 4) = v38;
  v39[40] = 0;
  sub_25B79070C(v30, &qword_26A515178);
  uint64_t v40 = v46;
  sub_25B792F1C((uint64_t)v7, v46, &qword_26A515180);
  sub_25B7906A8((uint64_t)v18, (uint64_t)v16, &qword_26A515190);
  sub_25B7906A8(v40, (uint64_t)v7, &qword_26A515180);
  uint64_t v41 = v47;
  sub_25B7906A8((uint64_t)v16, v47, &qword_26A515190);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A515198);
  sub_25B7906A8((uint64_t)v7, v41 + *(int *)(v42 + 48), &qword_26A515180);
  sub_25B79070C(v40, &qword_26A515180);
  sub_25B79070C((uint64_t)v18, &qword_26A515190);
  sub_25B79070C((uint64_t)v7, &qword_26A515180);
  return sub_25B79070C((uint64_t)v16, &qword_26A515190);
}

uint64_t sub_25B8FAB60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A511F00);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A510210 != -1) {
    swift_once();
  }
  v11[2] = qword_26A513D28;
  v11[3] = unk_26A513D30;
  uint64_t v6 = type metadata accessor for ReceiverDetailView();
  swift_bridgeObjectRetain();
  v11[0] = sub_25B8FAD24(v6);
  v11[1] = v7;
  sub_25B797F48();
  sub_25B8FEB38();
  char v8 = sub_25B8FF528();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  uint64_t v9 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A514FE8) + 36);
  *(unsigned char *)uint64_t v9 = v8;
  *(_OWORD *)(v9 + 8) = 0u;
  *(_OWORD *)(v9 + 24) = 0u;
  *(unsigned char *)(v9 + 40) = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_25B8FAD24(uint64_t a1)
{
  uint64_t v3 = sub_25B8FE628();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25B8FFF58();
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25B8FFF38();
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v72 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v77 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5107D0);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v70 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v79 = (uint64_t)&v65 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v65 - v18;
  uint64_t v20 = sub_25B8FE588();
  uint64_t v80 = *(void **)(v20 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v73 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v21);
  uint64_t v71 = (char *)&v65 - v23;
  uint64_t v24 = *(int *)(a1 + 36);
  uint64_t v76 = v1;
  uint64_t v25 = *(void **)(v1 + v24 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v26 = v25;
  sub_25B8FE8D8();

  swift_release();
  swift_release();
  uint64_t v27 = v83;
  uint64_t v74 = v8;
  uint64_t v75 = v5;
  if (!v83) {
    goto LABEL_12;
  }
  unint64_t v28 = v91;
  if (!v91)
  {
    sub_25B7F7960((uint64_t)v81, v82, v83, v84, v85, v86, v87, v88, (void *)v89, *((uint64_t *)&v89 + 1), v90);
LABEL_12:
    uint64_t v45 = v79;
    uint64_t v44 = v80;
    uint64_t v73 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v80[7];
    v73(v79, 1, 1, v20);
    uint64_t v39 = v77;
LABEL_13:
    uint64_t v46 = v20;
    uint64_t v47 = v78;
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v39, v76, a1);
    uint64_t v48 = (unsigned int (*)(char *, uint64_t, uint64_t))v44[6];
    if (v48((char *)v45, 1, v46) == 1)
    {
      uint64_t v49 = (uint64_t)v19;
      uint64_t v50 = *(void **)&v39[*(int *)(a1 + 36) + 8];
      swift_getKeyPath();
      swift_getKeyPath();
      id v51 = v50;
      sub_25B8FE8D8();

      swift_release();
      swift_release();
      id v52 = v81;
      if (v81)
      {
        id v53 = objc_msgSend(v81, sel_sessionStartDate);

        uint64_t v54 = v78;
        if (v53)
        {
          uint64_t v55 = (uint64_t)v70;
          sub_25B8FE558();

          uint64_t v56 = 0;
        }
        else
        {
          uint64_t v56 = 1;
          uint64_t v55 = (uint64_t)v70;
        }
        (*(void (**)(char *, uint64_t))(v54 + 8))(v77, a1);
        v73(v55, v56, 1, v46);
        uint64_t v19 = (char *)v49;
        sub_25B792F1C(v55, v49, &qword_26A5107D0);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v78 + 8))(v39, a1);
        uint64_t v19 = (char *)v49;
        v73(v49, 1, 1, v46);
      }
      sub_25B79070C(v79, &qword_26A5107D0);
      if (v48(v19, 1, v46) == 1) {
        goto LABEL_23;
      }
      uint64_t v57 = v80;
      uint64_t v58 = (void (*)(char *, uint64_t, uint64_t))v80[4];
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v47 + 8))(v39, a1);
      uint64_t v57 = v44;
      uint64_t v58 = (void (*)(char *, uint64_t, uint64_t))v44[4];
      v58(v19, v45, v46);
      v73((uint64_t)v19, 0, 1, v46);
      if (v48(v19, 1, v46) == 1)
      {
LABEL_23:
        sub_25B79070C((uint64_t)v19, &qword_26A5107D0);
        return 0;
      }
    }
    uint64_t v60 = v71;
    v58(v71, (uint64_t)v19, v46);
    sub_25B8FFF28();
    sub_25B8FFF18();
    uint64_t v61 = (void *)sub_25B8FE4F8();
    id v62 = objc_msgSend(v61, sel_absoluteTimeString_preposition_capitalized_, 0, 0, 0);

    sub_25B8FFF78();
    sub_25B8FFF08();
    swift_bridgeObjectRelease();
    sub_25B8FFF18();
    sub_25B8FFF48();
    sub_25B7D6FE4(0, (unint64_t *)&qword_26A512AD0);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v64 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_25B8FE618();
    uint64_t v59 = sub_25B8FFFA8();
    ((void (*)(char *, uint64_t))v57[1])(v60, v46);
    return v59;
  }
  uint64_t v66 = a1;
  uint64_t v68 = v19;
  uint64_t v69 = v20;
  uint64_t v30 = (uint64_t)v81;
  long long v29 = v82;
  uint64_t v31 = v84;
  uint64_t v32 = v85;
  uint64_t v33 = v86;
  uint64_t v34 = v87;
  uint64_t v35 = v88;
  long long v67 = v89;
  unint64_t v36 = v90;
  swift_bridgeObjectRetain();
  uint64_t result = sub_25B7F7960(v30, v29, v27, v31, v32, v33, v34, v35, (void *)v67, *((uint64_t *)&v67 + 1), v36);
  if (v28 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_25B900618();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v38 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v39 = v77;
  uint64_t v20 = v69;
  uint64_t v19 = v68;
  if (!v38)
  {
    swift_bridgeObjectRelease();
    a1 = v66;
    goto LABEL_12;
  }
  if ((v28 & 0xC000000000000001) != 0)
  {
    id v40 = (id)MEMORY[0x26116A930](0, v28);
    goto LABEL_9;
  }
  if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v40 = *(id *)(v28 + 32);
LABEL_9:
    uint64_t v41 = v40;
    swift_bridgeObjectRelease();
    id v42 = objc_msgSend(v41, sel_date);

    uint64_t v43 = (char *)v73;
    sub_25B8FE558();

    uint64_t v45 = v79;
    uint64_t v44 = v80;
    ((void (*)(uint64_t, char *, uint64_t))v80[4])(v79, v43, v20);
    uint64_t v73 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v44[7];
    v73(v45, 0, 1, v20);
    a1 = v66;
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_25B8FB64C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25B8FE628();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_25B8FFF58();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5110A8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B8FFEE8();
  sub_25B7D6FE4(0, (unint64_t *)&qword_26A512AD0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v8 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_25B8FE618();
  uint64_t v20 = sub_25B8FFFA8();
  uint64_t v21 = v9;
  sub_25B797F48();
  uint64_t v10 = sub_25B8FF748();
  uint64_t v12 = v11;
  uint64_t v20 = v10;
  uint64_t v21 = v11;
  char v14 = v13 & 1;
  char v22 = v13 & 1;
  uint64_t v23 = v15;
  sub_25B8FF938();
  sub_25B792FC8(v10, v12, v14);
  swift_bridgeObjectRelease();
  char v16 = sub_25B8FF568();
  sub_25B7906A8((uint64_t)v6, a1, &qword_26A5110A8);
  uint64_t v17 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A514A98) + 36);
  *(unsigned char *)uint64_t v17 = v16;
  *(_OWORD *)(v17 + 8) = 0u;
  *(_OWORD *)(v17 + 24) = 0u;
  *(unsigned char *)(v17 + 40) = 1;
  return sub_25B79070C((uint64_t)v6, &qword_26A5110A8);
}

unint64_t sub_25B8FB8C8()
{
  unint64_t result = qword_26A514EE8;
  if (!qword_26A514EE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514EE0);
    sub_25B8FDBAC(&qword_26A514EF0, type metadata accessor for SMReceiverSessionState);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514EE8);
  }
  return result;
}

unint64_t sub_25B8FB96C()
{
  unint64_t result = qword_26A514EF8;
  if (!qword_26A514EF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5107D0);
    sub_25B8FDBAC((unint64_t *)&unk_26A5130E0, MEMORY[0x263F07490]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514EF8);
  }
  return result;
}

uint64_t sub_25B8FBA18@<X0>(void *a1@<X8>)
{
  return sub_25B8EB62C(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_25B8FBA24@<X0>(uint64_t a1@<X8>)
{
  return sub_25B8ECAA4(*(void *)(v1 + 32), *(void *)(v1 + 24), a1);
}

uint64_t sub_25B8FBA30()
{
  return sub_25B8EE4C8(v0[4], v0[2], v0[3]);
}

uint64_t sub_25B8FBA40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(type metadata accessor for ReceiverDetailView() - 8);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return sub_25B8EE9AC(a1, v8, v5, v6, a2);
}

uint64_t sub_25B8FBADC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25B8FEE58();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25B8FBB0C()
{
  return sub_25B8FEE68();
}

unsigned char *sub_25B8FBB34(unsigned char *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_25B8FBB48()
{
  return sub_25B8FED18();
}

uint64_t sub_25B8FBB6C(uint64_t a1)
{
  uint64_t v2 = sub_25B8FE978();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return MEMORY[0x261169100](v4);
}

uint64_t sub_25B8FBC40(uint64_t a1, uint64_t a2)
{
  type metadata accessor for ReceiverDetailView();
  return sub_25B8EF68C(a1, a2);
}

void sub_25B8FBCE0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(type metadata accessor for ReceiverDetailView() - 8);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  sub_25B8EF838(a1, a2, v8, v5, v6);
}

uint64_t sub_25B8FBD84(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25B8FBDEC()
{
  return sub_25B8EE6A4(v0[4], v0[2], v0[3]);
}

uint64_t sub_25B8FBDFC()
{
  return sub_25B8FD9C4((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25B8EE8E0);
}

unint64_t sub_25B8FBE14()
{
  unint64_t result = qword_26A514F18;
  if (!qword_26A514F18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514F08);
    sub_25B8FBE90();
    sub_25B8FC0EC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514F18);
  }
  return result;
}

unint64_t sub_25B8FBE90()
{
  unint64_t result = qword_26A514F20;
  if (!qword_26A514F20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514F00);
    sub_25B8FBF30();
    sub_25B792ED8(&qword_26A510BD0, &qword_26A510BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514F20);
  }
  return result;
}

unint64_t sub_25B8FBF30()
{
  unint64_t result = qword_26A514F28;
  if (!qword_26A514F28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514F30);
    sub_25B8FBFD0();
    sub_25B792ED8(&qword_26A511100, &qword_26A511108);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514F28);
  }
  return result;
}

unint64_t sub_25B8FBFD0()
{
  unint64_t result = qword_26A514F38;
  if (!qword_26A514F38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A512C98);
    sub_25B8FC04C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514F38);
  }
  return result;
}

unint64_t sub_25B8FC04C()
{
  unint64_t result = qword_26A514F40;
  if (!qword_26A514F40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A512C90);
    sub_25B792ED8(&qword_26A514F48, &qword_26A514F50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514F40);
  }
  return result;
}

unint64_t sub_25B8FC0EC()
{
  unint64_t result = qword_26A514F58;
  if (!qword_26A514F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514F58);
  }
  return result;
}

unint64_t sub_25B8FC140()
{
  unint64_t result = qword_26A514F60;
  if (!qword_26A514F60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514EA8);
    sub_25B8FC1EC(&qword_26A514F68, &qword_26A514F70, (void (*)(void))sub_25B8FC274, (void (*)(void))sub_25B8FC3B4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514F60);
  }
  return result;
}

uint64_t sub_25B8FC1EC(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25B8FC274()
{
  unint64_t result = qword_26A514F78;
  if (!qword_26A514F78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514F80);
    sub_25B8FC314();
    sub_25B792ED8(&qword_26A510B70, &qword_26A510B40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514F78);
  }
  return result;
}

unint64_t sub_25B8FC314()
{
  unint64_t result = qword_26A514F88;
  if (!qword_26A514F88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514F90);
    sub_25B885E2C();
    sub_25B792ED8(&qword_26A510B60, &qword_26A510B68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514F88);
  }
  return result;
}

unint64_t sub_25B8FC3B4()
{
  unint64_t result = qword_26A514F98;
  if (!qword_26A514F98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514FA0);
    sub_25B8FDBAC(&qword_26A513230, (void (*)(uint64_t))type metadata accessor for TimerInfoView);
    sub_25B792ED8(&qword_26A514FA8, &qword_26A514FB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514F98);
  }
  return result;
}

uint64_t sub_25B8FC484(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25B8FC504()
{
  unint64_t result = qword_26A514FC0;
  if (!qword_26A514FC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514FC8);
    sub_25B8FC5A4();
    sub_25B792ED8(&qword_26A511100, &qword_26A511108);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514FC0);
  }
  return result;
}

unint64_t sub_25B8FC5A4()
{
  unint64_t result = qword_26A514FD0;
  if (!qword_26A514FD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514FD8);
    sub_25B8E8170();
    sub_25B8FC62C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514FD0);
  }
  return result;
}

unint64_t sub_25B8FC62C()
{
  unint64_t result = qword_26A514FE0;
  if (!qword_26A514FE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514FE8);
    sub_25B7DAED8((unint64_t *)&qword_26A511EF8, &qword_26A511F00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514FE0);
  }
  return result;
}

unint64_t sub_25B8FC6D4()
{
  unint64_t result = qword_26A514FF8;
  if (!qword_26A514FF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A515000);
    sub_25B8E7CE4();
    sub_25B792ED8(&qword_26A513360, &qword_26A513368);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A514FF8);
  }
  return result;
}

unint64_t sub_25B8FC774()
{
  unint64_t result = qword_26A515008;
  if (!qword_26A515008)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A515010);
    sub_25B8FC814();
    sub_25B792ED8(&qword_26A513360, &qword_26A513368);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A515008);
  }
  return result;
}

unint64_t sub_25B8FC814()
{
  unint64_t result = qword_26A515018;
  if (!qword_26A515018)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A515020);
    sub_25B8FC8B4();
    sub_25B792ED8(&qword_26A511100, &qword_26A511108);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A515018);
  }
  return result;
}

unint64_t sub_25B8FC8B4()
{
  unint64_t result = qword_26A515028;
  if (!qword_26A515028)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A515030);
    sub_25B8FCB74(&qword_26A515038, &qword_26A515040, &qword_26A515048, &qword_26A515050);
    sub_25B792ED8(&qword_26A510BD0, &qword_26A510BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A515028);
  }
  return result;
}

unint64_t sub_25B8FC974()
{
  unint64_t result = qword_26A515058;
  if (!qword_26A515058)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514EC0);
    sub_25B8FCA14();
    sub_25B792ED8(&qword_26A513360, &qword_26A513368);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A515058);
  }
  return result;
}

unint64_t sub_25B8FCA14()
{
  unint64_t result = qword_26A515060;
  if (!qword_26A515060)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A515068);
    sub_25B8FCAB4();
    sub_25B792ED8(&qword_26A511100, &qword_26A511108);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A515060);
  }
  return result;
}

unint64_t sub_25B8FCAB4()
{
  unint64_t result = qword_26A515070;
  if (!qword_26A515070)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A515078);
    sub_25B8FCB74(&qword_26A515080, &qword_26A515088, &qword_26A515090, &qword_26A515098);
    sub_25B792ED8(&qword_26A510BD0, &qword_26A510BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A515070);
  }
  return result;
}

uint64_t sub_25B8FCB74(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_25B792ED8(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25B8FCC14@<X0>(uint64_t a1@<X8>)
{
  return sub_25B8FAB60(a1);
}

uint64_t sub_25B8FCC28(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25B8FCC90(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_25B8FCCF8()
{
  unint64_t result = qword_26A5150B8;
  if (!qword_26A5150B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A514EA0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5150C0);
    sub_25B792ED8(&qword_26A5150C8, &qword_26A5150C0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5150B8);
  }
  return result;
}

uint64_t sub_25B8FCDE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ReceiverDetailView();
  return sub_25B8F8AE4(v2, a1);
}

uint64_t sub_25B8FCE18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, unsigned __int8 a8)
{
  if (a8 != 255) {
    return sub_25B8FCE30(a1, a2, a3, a4, a5, a6);
  }
  return a1;
}

uint64_t sub_25B8FCE30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  sub_25B792FD8(a4, a5, a6 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25B8FCE74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, unsigned __int8 a8)
{
  if (a8 != 255) {
    return sub_25B8FCE8C(a1, a2, a3, a4, a5, a6);
  }
  return a1;
}

uint64_t sub_25B8FCE8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  sub_25B792FC8(a4, a5, a6 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B8FCED0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v6 = *(void *)(a1 + 104);
  uint64_t v7 = *(void *)(a1 + 112);
  uint64_t v8 = *(void *)(a1 + 120);
  unsigned __int8 v9 = *(unsigned char *)(a1 + 128);
  sub_25B792FC8(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_25B8FCE74(v2, v3, v4, v5, v6, v7, v8, v9);
  return a1;
}

uint64_t sub_25B8FCF68@<X0>(void *a1@<X8>)
{
  return sub_25B8F87A0(a1);
}

uint64_t sub_25B8FCF74(uint64_t a1)
{
  return a1;
}

uint64_t sub_25B8FD000()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(type metadata accessor for ReceiverDetailView() - 8);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_25B7D7324;
  return sub_25B8F189C(v5, v2, v3);
}

uint64_t sub_25B8FD0EC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(type metadata accessor for ReceiverDetailView() - 8);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_25B7D7324;
  return sub_25B8F29F0(v5, v2, v3);
}

unint64_t sub_25B8FD1D4()
{
  unint64_t result = qword_26A515100;
  if (!qword_26A515100)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26A512A70);
    sub_25B8FD248();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A515100);
  }
  return result;
}

unint64_t sub_25B8FD248()
{
  unint64_t result = qword_26A515108;
  if (!qword_26A515108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A515108);
  }
  return result;
}

uint64_t sub_25B8FD2A0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(type metadata accessor for ReceiverDetailView() - 8);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_25B7D7324;
  return sub_25B8F200C(v5, v2, v3);
}

uint64_t block_copy_helper_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_15()
{
  return swift_release();
}

void *sub_25B8FD3B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25B8FFD88();
  uint64_t v4 = v3;
  sub_25B8F541C((uint64_t)v6);
  *a1 = v2;
  a1[1] = v4;
  return memcpy(a1 + 2, v6, 0x109uLL);
}

uint64_t sub_25B8FD43C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25B8FD478@<X0>(uint64_t *a1@<X8>)
{
  return sub_25B8F4C84(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

void sub_25B8FD488()
{
  uint64_t v1 = *(void *)(type metadata accessor for ReceiverDetailView() - 8);
  sub_25B8F2494(v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

uint64_t sub_25B8FD500(uint64_t a1)
{
  return a1;
}

uint64_t sub_25B8FD558(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char a15)
{
  if ((a15 & 1) == 0)
  {
    sub_25B792FD8(result, a2, a3 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_25B8FD5D8(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char a15)
{
  if ((a15 & 1) == 0)
  {
    sub_25B792FC8(result, a2, a3 & 1);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_25B8FD658(uint64_t a1)
{
  return a1;
}

uint64_t sub_25B8FD6B4()
{
  return sub_25B8FD9C4((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25B8FA0D0);
}

double sub_25B8FD6CC@<D0>(_OWORD *a1@<X8>)
{
  return sub_25B8FA4B0(a1);
}

uint64_t sub_25B8FD6D8()
{
  return sub_25B8FED18();
}

uint64_t sub_25B8FD700()
{
  uint64_t v1 = sub_25B8FE5F8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t objectdestroyTm_11()
{
  uint64_t v1 = (int *)type metadata accessor for ReceiverDetailView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5107B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25B8FEAA8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }

  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  sub_25B81A554(*(void *)(v5 + v1[15]), *(void *)(v5 + v1[15] + 8), *(unsigned char *)(v5 + v1[15] + 16));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_25B81A554(*(void *)(v5 + v1[18]), *(void *)(v5 + v1[18] + 8), *(unsigned char *)(v5 + v1[18] + 16));
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25B8FD9AC()
{
  return sub_25B8FD9C4((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25B8F980C);
}

uint64_t sub_25B8FD9C4(uint64_t (*a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(type metadata accessor for ReceiverDetailView() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1(v5, v2, v3);
}

double sub_25B8FDA5C@<D0>(_OWORD *a1@<X8>)
{
  return sub_25B8F986C(a1);
}

uint64_t sub_25B8FDA68@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25B8FEE58();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25B8FDA98()
{
  return sub_25B8FEE68();
}

uint64_t sub_25B8FDAC0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_25B8FDAD0(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_25B8FDAE8()
{
  unint64_t result = qword_26A5151C0;
  if (!qword_26A5151C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5151A8);
    sub_25B792ED8(&qword_26A5111E8, &qword_26A5111F0);
    sub_25B792ED8(&qword_26A5113E8, &qword_26A5113F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5151C0);
  }
  return result;
}

uint64_t sub_25B8FDBAC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25B8FDBF4()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_25B8FE2D8()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_25B8FE2E8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25B8FE2F8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25B8FE308()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25B8FE318()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25B8FE328()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_25B8FE338()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_25B8FE348()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_25B8FE358()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_25B8FE368()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25B8FE378()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25B8FE388()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25B8FE398()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_25B8FE3E8()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t sub_25B8FE418()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25B8FE428()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25B8FE438()
{
  return MEMORY[0x270EEFBD8]();
}

uint64_t sub_25B8FE448()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25B8FE458()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25B8FE468()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25B8FE478()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25B8FE488()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_25B8FE498()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_25B8FE4A8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25B8FE4B8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25B8FE4C8()
{
  return MEMORY[0x270EF0780]();
}

uint64_t sub_25B8FE4D8()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_25B8FE4E8()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_25B8FE4F8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25B8FE508()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_25B8FE518()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_25B8FE528()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_25B8FE538()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_25B8FE548()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_25B8FE558()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25B8FE568()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25B8FE578()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25B8FE588()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25B8FE598()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25B8FE5A8()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_25B8FE5B8()
{
  return MEMORY[0x270EF0C98]();
}

uint64_t sub_25B8FE5C8()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_25B8FE5D8()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25B8FE5E8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25B8FE5F8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25B8FE608()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_25B8FE618()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25B8FE628()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25B8FE638()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_25B8FE648()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25B8FE658()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25B8FE668()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_25B8FE678()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25B8FE688()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_25B8FE698()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_25B8FE6A8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25B8FE6B8()
{
  return MEMORY[0x270F5C358]();
}

uint64_t sub_25B8FE6C8()
{
  return MEMORY[0x270F5C360]();
}

uint64_t sub_25B8FE6D8()
{
  return MEMORY[0x270F5C368]();
}

uint64_t sub_25B8FE6E8()
{
  return MEMORY[0x270F5C370]();
}

uint64_t sub_25B8FE6F8()
{
  return MEMORY[0x270F5C378]();
}

uint64_t sub_25B8FE708()
{
  return MEMORY[0x270F5C380]();
}

uint64_t sub_25B8FE718()
{
  return MEMORY[0x270F5C388]();
}

uint64_t sub_25B8FE728()
{
  return MEMORY[0x270F5C390]();
}

uint64_t sub_25B8FE738()
{
  return MEMORY[0x270F07F30]();
}

uint64_t sub_25B8FE748()
{
  return MEMORY[0x270F07F70]();
}

uint64_t sub_25B8FE758()
{
  return MEMORY[0x270F07F78]();
}

uint64_t sub_25B8FE768()
{
  return MEMORY[0x270F07FE8]();
}

uint64_t sub_25B8FE778()
{
  return MEMORY[0x270F08078]();
}

uint64_t sub_25B8FE788()
{
  return MEMORY[0x270F08080]();
}

uint64_t sub_25B8FE798()
{
  return MEMORY[0x270F080B8]();
}

uint64_t sub_25B8FE7A8()
{
  return MEMORY[0x270F080E0]();
}

uint64_t sub_25B8FE7B8()
{
  return MEMORY[0x270F08168]();
}

uint64_t sub_25B8FE7C8()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_25B8FE7D8()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_25B8FE7E8()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_25B8FE7F8()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25B8FE808()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25B8FE818()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25B8FE828()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25B8FE838()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_25B8FE848()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_25B8FE858()
{
  return MEMORY[0x270EFEB58]();
}

uint64_t sub_25B8FE868()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_25B8FE878()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_25B8FE888()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_25B8FE898()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_25B8FE8A8()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_25B8FE8B8()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_25B8FE8C8()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_25B8FE8D8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_25B8FE8E8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_25B8FE8F8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_25B8FE908()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_25B8FE918()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_25B8FE928()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_25B8FE938()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_25B8FE948()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_25B8FE958()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_25B8FE968()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_25B8FE978()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_25B8FE988()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_25B8FE998()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_25B8FE9A8()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_25B8FE9B8()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_25B8FE9C8()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_25B8FE9D8()
{
  return MEMORY[0x270EFF320]();
}

uint64_t sub_25B8FE9E8()
{
  return MEMORY[0x270EFF328]();
}

uint64_t sub_25B8FE9F8()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_25B8FEA08()
{
  return MEMORY[0x270EFF4B8]();
}

uint64_t sub_25B8FEA18()
{
  return MEMORY[0x270EFF4D8]();
}

uint64_t sub_25B8FEA28()
{
  return MEMORY[0x270EFF4E0]();
}

uint64_t sub_25B8FEA38()
{
  return MEMORY[0x270EFF4F0]();
}

uint64_t sub_25B8FEA48()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_25B8FEA58()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_25B8FEA68()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_25B8FEA78()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_25B8FEA88()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_25B8FEA98()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_25B8FEAA8()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_25B8FEAB8()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_25B8FEAC8()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_25B8FEAE8()
{
  return MEMORY[0x270EFF818]();
}

uint64_t sub_25B8FEAF8()
{
  return MEMORY[0x270EFF838]();
}

uint64_t sub_25B8FEB08()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_25B8FEB18()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_25B8FEB28()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_25B8FEB38()
{
  return MEMORY[0x270EFFA40]();
}

uint64_t sub_25B8FEB48()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_25B8FEB58()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_25B8FEB68()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_25B8FEB78()
{
  return MEMORY[0x270EFFD20]();
}

uint64_t sub_25B8FEB88()
{
  return MEMORY[0x270EFFD28]();
}

uint64_t sub_25B8FEB98()
{
  return MEMORY[0x270EFFD68]();
}

uint64_t sub_25B8FEBA8()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_25B8FEBB8()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_25B8FEBC8()
{
  return MEMORY[0x270F000E8]();
}

uint64_t sub_25B8FEBD8()
{
  return MEMORY[0x270F00118]();
}

uint64_t sub_25B8FEBE8()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_25B8FEBF8()
{
  return MEMORY[0x270F001C0]();
}

uint64_t sub_25B8FEC08()
{
  return MEMORY[0x270F001D8]();
}

uint64_t sub_25B8FEC18()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_25B8FEC28()
{
  return MEMORY[0x270F00230]();
}

uint64_t sub_25B8FEC38()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_25B8FEC48()
{
  return MEMORY[0x270F00628]();
}

uint64_t sub_25B8FEC58()
{
  return MEMORY[0x270F00630]();
}

uint64_t sub_25B8FEC68()
{
  return MEMORY[0x270F00648]();
}

uint64_t sub_25B8FEC78()
{
  return MEMORY[0x270F00650]();
}

uint64_t sub_25B8FEC88()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_25B8FEC98()
{
  return MEMORY[0x270F006C0]();
}

uint64_t sub_25B8FECA8()
{
  return MEMORY[0x270F006C8]();
}

uint64_t sub_25B8FECB8()
{
  return MEMORY[0x270F006E0]();
}

uint64_t sub_25B8FECC8()
{
  return MEMORY[0x270F006F0]();
}

uint64_t sub_25B8FECD8()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_25B8FECE8()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_25B8FECF8()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_25B8FED08()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_25B8FED18()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_25B8FED28()
{
  return MEMORY[0x270F008F0]();
}

uint64_t sub_25B8FED38()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_25B8FED48()
{
  return MEMORY[0x270F00998]();
}

uint64_t sub_25B8FED58()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_25B8FED68()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_25B8FED78()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_25B8FED88()
{
  return MEMORY[0x270F00B28]();
}

uint64_t sub_25B8FED98()
{
  return MEMORY[0x270F00B38]();
}

uint64_t sub_25B8FEDA8()
{
  return MEMORY[0x270F00B40]();
}

uint64_t sub_25B8FEDB8()
{
  return MEMORY[0x270F00B68]();
}

uint64_t sub_25B8FEDC8()
{
  return MEMORY[0x270F00B70]();
}

uint64_t sub_25B8FEDD8()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_25B8FEDE8()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_25B8FEDF8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_25B8FEE08()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_25B8FEE18()
{
  return MEMORY[0x270F00DA8]();
}

uint64_t sub_25B8FEE28()
{
  return MEMORY[0x270F00DB8]();
}

uint64_t sub_25B8FEE38()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_25B8FEE48()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_25B8FEE58()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_25B8FEE68()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_25B8FEE78()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_25B8FEE88()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_25B8FEE98()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_25B8FEEA8()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_25B8FEEB8()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25B8FEEC8()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25B8FEED8()
{
  return MEMORY[0x270F00F50]();
}

uint64_t sub_25B8FEEE8()
{
  return MEMORY[0x270F00F68]();
}

uint64_t sub_25B8FEEF8()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_25B8FEF08()
{
  return MEMORY[0x270F01060]();
}

uint64_t sub_25B8FEF18()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_25B8FEF28()
{
  return MEMORY[0x270F011B8]();
}

uint64_t sub_25B8FEF38()
{
  return MEMORY[0x270F011D0]();
}

uint64_t sub_25B8FEF48()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_25B8FEF58()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_25B8FEF68()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_25B8FEF78()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_25B8FEF88()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_25B8FEF98()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_25B8FEFA8()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_25B8FEFB8()
{
  return MEMORY[0x270F01290]();
}

uint64_t sub_25B8FEFC8()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_25B8FEFD8()
{
  return MEMORY[0x270F01430]();
}

uint64_t sub_25B8FEFE8()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_25B8FEFF8()
{
  return MEMORY[0x270F01468]();
}

uint64_t sub_25B8FF008()
{
  return MEMORY[0x270F01470]();
}

uint64_t sub_25B8FF018()
{
  return MEMORY[0x270F014B0]();
}

uint64_t sub_25B8FF028()
{
  return MEMORY[0x270F014B8]();
}

uint64_t sub_25B8FF038()
{
  return MEMORY[0x270F014E8]();
}

uint64_t sub_25B8FF048()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25B8FF058()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_25B8FF068()
{
  return MEMORY[0x270F01608]();
}

uint64_t sub_25B8FF078()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_25B8FF088()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_25B8FF098()
{
  return MEMORY[0x270F01660]();
}

uint64_t sub_25B8FF0A8()
{
  return MEMORY[0x270F01690]();
}

uint64_t sub_25B8FF0B8()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_25B8FF0C8()
{
  return MEMORY[0x270F016D0]();
}

uint64_t sub_25B8FF0D8()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_25B8FF0E8()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_25B8FF0F8()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_25B8FF118()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_25B8FF128()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_25B8FF138()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_25B8FF148()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_25B8FF158()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_25B8FF168()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_25B8FF188()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_25B8FF198()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_25B8FF1A8()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_25B8FF1B8()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_25B8FF1C8()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_25B8FF1D8()
{
  return MEMORY[0x270F019A8]();
}

uint64_t sub_25B8FF1E8()
{
  return MEMORY[0x270F019B0]();
}

uint64_t sub_25B8FF1F8()
{
  return MEMORY[0x270F019E8]();
}

uint64_t sub_25B8FF208()
{
  return MEMORY[0x270F019F0]();
}

uint64_t sub_25B8FF218()
{
  return MEMORY[0x270F01A10]();
}

uint64_t sub_25B8FF228()
{
  return MEMORY[0x270F01A28]();
}

uint64_t sub_25B8FF238()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_25B8FF248()
{
  return MEMORY[0x270F01A68]();
}

uint64_t sub_25B8FF258()
{
  return MEMORY[0x270F01A70]();
}

uint64_t sub_25B8FF268()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_25B8FF278()
{
  return MEMORY[0x270F01B80]();
}

uint64_t sub_25B8FF288()
{
  return MEMORY[0x270F01B88]();
}

uint64_t sub_25B8FF298()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_25B8FF2A8()
{
  return MEMORY[0x270F01C10]();
}

uint64_t sub_25B8FF2B8()
{
  return MEMORY[0x270F01C18]();
}

uint64_t sub_25B8FF2C8()
{
  return MEMORY[0x270F01C20]();
}

uint64_t sub_25B8FF2D8()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_25B8FF2E8()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_25B8FF2F8()
{
  return MEMORY[0x270F01F00]();
}

uint64_t sub_25B8FF308()
{
  return MEMORY[0x270F01F10]();
}

uint64_t sub_25B8FF318()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_25B8FF328()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_25B8FF338()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_25B8FF348()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_25B8FF358()
{
  return MEMORY[0x270F02180]();
}

uint64_t sub_25B8FF368()
{
  return MEMORY[0x270F02188]();
}

uint64_t sub_25B8FF378()
{
  return MEMORY[0x270F02290]();
}

uint64_t sub_25B8FF388()
{
  return MEMORY[0x270F022A0]();
}

uint64_t sub_25B8FF398()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_25B8FF3A8()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_25B8FF3B8()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_25B8FF3C8()
{
  return MEMORY[0x270F02420]();
}

uint64_t sub_25B8FF3D8()
{
  return MEMORY[0x270F024C8]();
}

uint64_t sub_25B8FF3E8()
{
  return MEMORY[0x270F024D0]();
}

uint64_t sub_25B8FF3F8()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_25B8FF408()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_25B8FF418()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_25B8FF428()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_25B8FF438()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_25B8FF458()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_25B8FF468()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_25B8FF478()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_25B8FF498()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_25B8FF4A8()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_25B8FF4B8()
{
  return MEMORY[0x270F02888]();
}

uint64_t sub_25B8FF4C8()
{
  return MEMORY[0x270F02890]();
}

uint64_t sub_25B8FF4D8()
{
  return MEMORY[0x270F02898]();
}

uint64_t sub_25B8FF4E8()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25B8FF4F8()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_25B8FF508()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_25B8FF518()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_25B8FF528()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_25B8FF538()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25B8FF548()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_25B8FF558()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_25B8FF568()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_25B8FF578()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_25B8FF588()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_25B8FF598()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_25B8FF5A8()
{
  return MEMORY[0x270F02AA8]();
}

uint64_t sub_25B8FF5B8()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_25B8FF5C8()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_25B8FF5D8()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_25B8FF5E8()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_25B8FF5F8()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_25B8FF608()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_25B8FF618()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_25B8FF628()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_25B8FF638()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_25B8FF648()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_25B8FF658()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_25B8FF668()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_25B8FF678()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_25B8FF688()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_25B8FF698()
{
  return MEMORY[0x270F02D90]();
}

uint64_t sub_25B8FF6A8()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_25B8FF6B8()
{
  return MEMORY[0x270F02DE8]();
}

uint64_t sub_25B8FF6C8()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_25B8FF6D8()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_25B8FF6E8()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_25B8FF6F8()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_25B8FF708()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_25B8FF718()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_25B8FF728()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25B8FF738()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_25B8FF748()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25B8FF758()
{
  return MEMORY[0x270F03260]();
}

uint64_t sub_25B8FF768()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25B8FF778()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25B8FF788()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_25B8FF798()
{
  return MEMORY[0x270F03340]();
}

uint64_t sub_25B8FF7A8()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_25B8FF7B8()
{
  return MEMORY[0x270F033D8]();
}

uint64_t sub_25B8FF7C8()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_25B8FF7D8()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_25B8FF7E8()
{
  return MEMORY[0x270F034D0]();
}

uint64_t sub_25B8FF7F8()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_25B8FF808()
{
  return MEMORY[0x270F035C0]();
}

uint64_t sub_25B8FF818()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_25B8FF828()
{
  return MEMORY[0x270F03670]();
}

uint64_t sub_25B8FF838()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25B8FF848()
{
  return MEMORY[0x270F037F8]();
}

uint64_t sub_25B8FF858()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_25B8FF868()
{
  return MEMORY[0x270F03898]();
}

uint64_t sub_25B8FF878()
{
  return MEMORY[0x270F03900]();
}

uint64_t sub_25B8FF888()
{
  return MEMORY[0x270F03940]();
}

uint64_t sub_25B8FF898()
{
  return MEMORY[0x270F03958]();
}

uint64_t sub_25B8FF8A8()
{
  return MEMORY[0x270F03968]();
}

uint64_t sub_25B8FF8B8()
{
  return MEMORY[0x270F03970]();
}

uint64_t sub_25B8FF8C8()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_25B8FF8D8()
{
  return MEMORY[0x270F03AF0]();
}

uint64_t sub_25B8FF8E8()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_25B8FF8F8()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_25B8FF908()
{
  return MEMORY[0x270F03C00]();
}

uint64_t sub_25B8FF918()
{
  return MEMORY[0x270F03C80]();
}

uint64_t sub_25B8FF928()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_25B8FF938()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_25B8FF948()
{
  return MEMORY[0x270F03D40]();
}

uint64_t sub_25B8FF958()
{
  return MEMORY[0x270F03E00]();
}

uint64_t sub_25B8FF968()
{
  return MEMORY[0x270F03E28]();
}

uint64_t sub_25B8FF978()
{
  return MEMORY[0x270F03E58]();
}

uint64_t sub_25B8FF988()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_25B8FF998()
{
  return MEMORY[0x270F03EF8]();
}

uint64_t sub_25B8FF9A8()
{
  return MEMORY[0x270F03FB0]();
}

uint64_t sub_25B8FF9B8()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_25B8FF9C8()
{
  return MEMORY[0x270F04010]();
}

uint64_t sub_25B8FF9D8()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_25B8FF9E8()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_25B8FF9F8()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_25B8FFA08()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_25B8FFA18()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_25B8FFA28()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_25B8FFA38()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_25B8FFA48()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_25B8FFA58()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_25B8FFA68()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_25B8FFA78()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_25B8FFA88()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_25B8FFA98()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_25B8FFAA8()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_25B8FFAB8()
{
  return MEMORY[0x270F044A8]();
}

uint64_t sub_25B8FFAC8()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_25B8FFAD8()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_25B8FFAE8()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_25B8FFAF8()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_25B8FFB08()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_25B8FFB18()
{
  return MEMORY[0x270F04588]();
}

uint64_t sub_25B8FFB28()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_25B8FFB38()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_25B8FFB48()
{
  return MEMORY[0x270F04648]();
}

uint64_t sub_25B8FFB58()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_25B8FFB68()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_25B8FFB78()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_25B8FFB88()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_25B8FFB98()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_25B8FFBA8()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_25B8FFBB8()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_25B8FFBC8()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_25B8FFBD8()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_25B8FFBE8()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_25B8FFBF8()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_25B8FFC08()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_25B8FFC18()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_25B8FFC28()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_25B8FFC38()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_25B8FFC48()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_25B8FFC58()
{
  return MEMORY[0x270F049E0]();
}

uint64_t sub_25B8FFC68()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_25B8FFC78()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_25B8FFC88()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_25B8FFC98()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_25B8FFCA8()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_25B8FFCB8()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_25B8FFCC8()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_25B8FFCD8()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_25B8FFCE8()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_25B8FFCF8()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_25B8FFD08()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_25B8FFD18()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_25B8FFD28()
{
  return MEMORY[0x270F04D80]();
}

uint64_t sub_25B8FFD38()
{
  return MEMORY[0x270F04F70]();
}

uint64_t sub_25B8FFD48()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_25B8FFD58()
{
  return MEMORY[0x270F04FA0]();
}

uint64_t sub_25B8FFD68()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_25B8FFD78()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_25B8FFD88()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25B8FFD98()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_25B8FFDA8()
{
  return MEMORY[0x270F050F0]();
}

uint64_t sub_25B8FFDB8()
{
  return MEMORY[0x270F05118]();
}

uint64_t sub_25B8FFDC8()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_25B8FFDD8()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_25B8FFDE8()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_25B8FFDF8()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_25B8FFE08()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25B8FFE18()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_25B8FFE28()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25B8FFE38()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t sub_25B8FFE48()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25B8FFE58()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25B8FFE68()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25B8FFE78()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25B8FFE88()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25B8FFE98()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25B8FFEA8()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_25B8FFEB8()
{
  return MEMORY[0x270F9D468]();
}

uint64_t sub_25B8FFEC8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25B8FFED8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25B8FFEE8()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_25B8FFEF8()
{
  return MEMORY[0x270EF18F0]();
}

uint64_t sub_25B8FFF08()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_25B8FFF18()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_25B8FFF28()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_25B8FFF38()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_25B8FFF48()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_25B8FFF58()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_25B8FFF68()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25B8FFF78()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25B8FFF88()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_25B8FFF98()
{
  return MEMORY[0x270EF1AE8]();
}

uint64_t sub_25B8FFFA8()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_25B8FFFB8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25B8FFFC8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25B8FFFD8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25B8FFFE8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25B8FFFF8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25B900008()
{
  return MEMORY[0x270F9D888]();
}

uint64_t sub_25B900018()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25B900028()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25B900038()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25B900048()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25B900058()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25B900068()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25B900078()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_25B900088()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25B900098()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25B9000A8()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_25B9000B8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25B9000C8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25B9000D8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25B9000E8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25B9000F8()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_25B900108()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25B900118()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25B900138()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_25B900148()
{
  return MEMORY[0x270F9DD68]();
}

uint64_t sub_25B900158()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25B900168()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25B900178()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25B900188()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_25B900198()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25B9001A8()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25B9001B8()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_25B9001C8()
{
  return MEMORY[0x270FA2BA8]();
}

uint64_t sub_25B9001D8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25B9001E8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25B9001F8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25B900208()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25B900218()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25B900228()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_25B900238()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_25B900248()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25B900258()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_25B900268()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25B900278()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25B900288()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25B900298()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25B9002A8()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_25B9002B8()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25B9002C8()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25B9002D8()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_25B9002E8()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_25B9002F8()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_25B900308()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_25B900318()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25B900328()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25B900338()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_25B900348()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_25B900358()
{
  return MEMORY[0x270F5C398]();
}

uint64_t sub_25B900368()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25B900378()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_25B900388()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25B900398()
{
  return MEMORY[0x270EF23C8]();
}

uint64_t sub_25B9003A8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25B9003B8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25B9003C8()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_25B9003D8()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_25B9003E8()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25B9003F8()
{
  return MEMORY[0x270EF2590]();
}

uint64_t sub_25B900408()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25B900418()
{
  return MEMORY[0x270F9E688]();
}

uint64_t sub_25B900438()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25B900448()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25B900458()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25B900468()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25B900478()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25B900498()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25B9004A8()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_25B9004B8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25B9004C8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25B9004D8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25B9004E8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25B9004F8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25B900508()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25B900518()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25B900528()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25B900538()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25B900548()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_25B900558()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25B900568()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25B900578()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25B900588()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25B900598()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25B9005A8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25B9005B8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25B9005C8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25B9005D8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25B9005E8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25B9005F8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25B900608()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_25B900618()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25B900628()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25B900638()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25B900648()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25B900658()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25B900668()
{
  return MEMORY[0x270F9F0F8]();
}

uint64_t sub_25B900678()
{
  return MEMORY[0x270F9F110]();
}

uint64_t sub_25B900688()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25B900698()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_25B9006A8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25B9006B8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25B9006D8()
{
  return MEMORY[0x270F9F750]();
}

uint64_t sub_25B9006E8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25B9006F8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25B900708()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_25B900718()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25B900728()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25B900758()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25B900768()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25B900778()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25B900788()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25B900798()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25B9007A8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25B9007B8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25B9007C8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25B9007D8()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25B9007E8()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_25B9007F8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25B900808()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CUTWeakLinkSymbol()
{
  return MEMORY[0x270F183E0]();
}

uint64_t FILocalizedNameForActivityType()
{
  return MEMORY[0x270F29AA8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

uint64_t MKDefaultCoordinateRegion()
{
  return MEMORY[0x270EF58C0]();
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x270F77160]();
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
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