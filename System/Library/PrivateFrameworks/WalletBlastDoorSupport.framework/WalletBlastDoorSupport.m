uint64_t sub_261530524()
{
  return sub_261537458();
}

uint64_t sub_26153053C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v40[1] = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921448);
  MEMORY[0x270FA5388](v5 - 8);
  v41 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_26153B290();
  uint64_t v46 = *(void *)(v7 - 8);
  uint64_t v47 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v40[0] = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v49 = (char *)v40 - v11;
  MEMORY[0x270FA5388](v10);
  v44 = (char *)v40 - v12;
  uint64_t v13 = sub_26153B140();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  v16 = (char *)v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_26153B270();
  uint64_t v42 = *(void *)(v17 - 8);
  uint64_t v43 = v17;
  MEMORY[0x270FA5388](v17);
  v48 = (char *)v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(void (**)(char *, void, uint64_t))(v14 + 104);
  v19(v16, *MEMORY[0x263F2ACA0], v13);
  uint64_t v20 = a1;
  unint64_t v21 = a2;
  LOBYTE(a1) = sub_26153B030();
  v22 = *(void (**)(char *, uint64_t))(v14 + 8);
  v22(v16, v13);
  if (a1)
  {
    uint64_t v23 = v20;
    unint64_t v24 = v21;
    v25 = (unsigned int *)MEMORY[0x263F2B250];
  }
  else
  {
    v19(v16, *MEMORY[0x263F2ACA8], v13);
    char v26 = sub_26153B030();
    v22(v16, v13);
    if ((v26 & 1) == 0
      || (v19(v16, *MEMORY[0x263F2ACB0], v13), char v27 = sub_26153B030(), v22(v16, v13), (v27 & 1) != 0))
    {
      sub_26153B2B0();
      sub_2615334CC(&qword_26A9213D0, MEMORY[0x263F2B8A8]);
      swift_allocError();
      sub_26153B2A0();
      swift_willThrow();
      return sub_261533678(v20, v21);
    }
    uint64_t v23 = v20;
    unint64_t v24 = v21;
    v25 = (unsigned int *)MEMORY[0x263F2B258];
  }
  uint64_t v29 = v42;
  uint64_t v30 = v43;
  v31 = v48;
  (*(void (**)(char *, void, uint64_t))(v42 + 104))(v48, *v25, v43);
  uint64_t v52 = MEMORY[0x263F06F78];
  uint64_t v53 = MEMORY[0x263F2AAF8];
  uint64_t v50 = v23;
  unint64_t v51 = v24;
  v32 = v41;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v41, v31, v30);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v32, 0, 1, v30);
  sub_2615336D0(v23, v24);
  v33 = v44;
  sub_26153B280();
  v34 = v49;
  uint64_t v35 = v45;
  sub_26153B260();
  if (v35)
  {
    sub_261533678(v23, v24);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v33, v47);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v31, v30);
  }
  else
  {
    uint64_t v36 = v46;
    v37 = v34;
    uint64_t v38 = v47;
    (*(void (**)(void, char *, uint64_t))(v46 + 16))(v40[0], v37, v47);
    sub_26153B1B0();
    sub_261533678(v23, v24);
    v39 = *(void (**)(char *, uint64_t))(v36 + 8);
    v39(v49, v38);
    v39(v33, v38);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v48, v30);
  }
}

void sub_261530AFC()
{
  qword_26A9214B0 = 0x4072C00000000000;
}

void sub_261530B10()
{
  qword_26A9214B8 = 0x4051800000000000;
}

void sub_261530B24()
{
  qword_26A9214C0 = 0x4083100000000000;
}

uint64_t sub_261530B38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v180 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9213E0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  v166 = (char *)&v144 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v179 = (char *)&v144 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9213E8);
  MEMORY[0x270FA5388](v8 - 8);
  v162 = (char *)&v144 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9213F0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  v182 = (char *)&v144 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v173 = (uint64_t)&v144 - v13;
  uint64_t v181 = sub_26153B1C0();
  uint64_t v164 = *(void *)(v181 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v181);
  v167 = (char *)&v144 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v184 = (uint64_t)&v144 - v16;
  uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9213F8);
  uint64_t v17 = MEMORY[0x270FA5388](v170);
  v177 = (char *)&v144 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v169 = (char *)&v144 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921400);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  v175 = (uint64_t *)((char *)&v144 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v21);
  v176 = (uint64_t *)((char *)&v144 - v23);
  uint64_t v186 = _s13ThumbnailInfoVMa();
  uint64_t v168 = *(void *)(v186 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v186);
  v183 = (char *)&v144 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v178 = (char *)&v144 - v26;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921408);
  uint64_t v28 = MEMORY[0x270FA5388](v27 - 8);
  uint64_t v185 = (uint64_t)&v144 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v159 = (void (**)(char *, char *, uint64_t))((char *)&v144 - v31);
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v160 = (void (**)(char *, uint64_t, uint64_t))((char *)&v144 - v33);
  MEMORY[0x270FA5388](v32);
  v158 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))((char *)&v144 - v34);
  uint64_t v187 = sub_26153B010();
  v161 = *(void (***)(char *, uint64_t))(v187 - 8);
  uint64_t v35 = MEMORY[0x270FA5388](v187);
  v174 = (char *)&v144 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  v157 = (char *)&v144 - v38;
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  v41 = (char *)&v144 - v40;
  MEMORY[0x270FA5388](v39);
  uint64_t v43 = (char *)&v144 - v42;
  uint64_t v44 = sub_26153B1D0();
  uint64_t v163 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v46 = (uint64_t *)((char *)&v144 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v47 = sub_26153AE70();
  uint64_t v171 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  v49 = (char *)&v144 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = a1;
  uint64_t v51 = sub_26153AC00();
  uint64_t v52 = sub_26153AE10();
  if (v2)
  {
    swift_release();
    return swift_release();
  }
  v154 = v46;
  v151 = v43;
  v152 = v41;
  uint64_t v155 = v52;
  unint64_t v156 = v53;
  uint64_t v153 = v44;
  uint64_t v172 = v50;
  uint64_t v54 = sub_26153AE30();
  unint64_t v56 = v55;
  uint64_t v150 = v54;
  (*(void (**)(char *, uint64_t))(v171 + 8))(v49, v47);
  uint64_t v58 = sub_26153AE40();
  unint64_t v60 = v59;
  uint64_t v165 = v51;
  sub_2615336D0(v155, v156);
  sub_2615336D0(v150, v56);
  sub_2615336D0(v58, v60);
  v61 = v154;
  unint64_t v147 = v56;
  uint64_t v145 = v58;
  unint64_t v146 = v60;
  sub_26153B150();
  (*(void (**)(uint64_t, void *, uint64_t))(v163 + 32))(v180, v61, v153);
  uint64_t v62 = swift_retain();
  sub_261537660(v62, v190);
  uint64_t v63 = v190[0];
  swift_bridgeObjectRetain();
  uint64_t v64 = MEMORY[0x263F8EE78];
  v65 = (void *)sub_261532608(MEMORY[0x263F8EE78]);
  swift_retain();
  sub_261539758(v65, v63);
  uint64_t v171 = 0;
  swift_bridgeObjectRelease();
  swift_release();
  sub_26153B180();
  v66 = (void *)swift_allocObject();
  v66[2] = sub_261539AC0(v64);
  unint64_t v67 = (unint64_t)(v66 + 2);
  v66[3] = v68;
  v66[4] = v69;
  v154 = v66;
  uint64_t v70 = v191;
  uint64_t v71 = (uint64_t)v179;
  v72 = (uint64_t *)v187;
  uint64_t v73 = (uint64_t)v161;
  v74 = v160;
  if (v191)
  {
    uint64_t v75 = v190[1];
    swift_bridgeObjectRetain();
    sub_26153AD40();
    uint64_t v76 = (uint64_t)v158;
    v149 = (char *)v75;
    sub_26153AE20();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t *))(v73 + 48))(v76, 1, v72) != 1)
    {
      uint64_t v77 = (uint64_t)v151;
      (*(void (**)(char *, uint64_t, uint64_t *))(v73 + 32))(v151, v76, v72);
      unint64_t v78 = (unint64_t)v178;
      (*(void (**)(char *, uint64_t, uint64_t *))(v73 + 16))(v178, v77, v72);
      if (qword_26A9213B0 != -1) {
        goto LABEL_63;
      }
      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
    sub_26153A0A8(v76, &qword_26A921408);
  }
  while (1)
  {
    uint64_t v80 = v193;
    if (v193)
    {
      uint64_t v70 = v192;
      swift_bridgeObjectRetain();
      sub_26153AD40();
      sub_26153AE20();
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t *))(v73 + 48))(v74, 1, v72) == 1)
      {
        swift_bridgeObjectRelease();
        sub_26153A0A8((uint64_t)v74, &qword_26A921408);
      }
      else
      {
        v81 = v74;
        v82 = v152;
        (*(void (**)(char *, void *, uint64_t *))(v73 + 32))(v152, v81, v72);
        uint64_t v83 = (uint64_t)v178;
        (*(void (**)(char *, char *, uint64_t *))(v73 + 16))(v178, v82, v72);
        if (qword_26A9213B8 != -1) {
          swift_once();
        }
        uint64_t v84 = v186;
        *(void *)(v83 + *(int *)(v186 + 20)) = qword_26A9214B8;
        *(unsigned char *)(v83 + *(int *)(v84 + 24)) = 0;
        sub_26153272C(v83, v70, v80, v154);
        swift_bridgeObjectRelease();
        sub_261539F1C(v83);
        (*(void (**)(char *, uint64_t *))(v73 + 8))(v82, v72);
      }
    }
    unint64_t v78 = v195;
    if (v195)
    {
      uint64_t v70 = v194;
      swift_bridgeObjectRetain();
      sub_26153AD40();
      uint64_t v85 = (uint64_t)v159;
      sub_26153AE20();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t *))(v73 + 48))(v85, 1, v72) == 1)
      {
        swift_bridgeObjectRelease();
        sub_26153A0A8(v85, &qword_26A921408);
      }
      else
      {
        uint64_t v86 = v85;
        v87 = v157;
        (*(void (**)(char *, uint64_t, uint64_t *))(v73 + 32))(v157, v86, v72);
        uint64_t v88 = (uint64_t)v178;
        (*(void (**)(char *, char *, uint64_t *))(v73 + 16))(v178, v87, v72);
        if (qword_26A9213B8 != -1) {
          swift_once();
        }
        uint64_t v89 = v186;
        *(void *)(v88 + *(int *)(v186 + 20)) = qword_26A9214B8;
        *(unsigned char *)(v88 + *(int *)(v89 + 24)) = 0;
        sub_26153272C(v88, v70, v78, v154);
        swift_bridgeObjectRelease();
        sub_261539F1C(v88);
        (*(void (**)(char *, uint64_t *))(v73 + 8))(v87, v72);
      }
    }
    long long v197 = v196;
    sub_261539DE0((uint64_t)&v197, (uint64_t)v199, &qword_26A921410);
    v74 = (void (**)(char *, uint64_t, uint64_t))*((void *)&v197 + 1);
    uint64_t v198 = *((void *)&v197 + 1);
    uint64_t v77 = *(void *)(*((void *)&v197 + 1) + 16);
    if (!v77) {
      break;
    }
    sub_261539D88((uint64_t)v199);
    sub_261539D88((uint64_t)&v198);
    v157 = (char *)v67;
    swift_beginAccess();
    if (v74[2])
    {
      unint64_t v90 = 0;
      unint64_t v78 = v73 + 48;
      v160 = (void (**)(char *, uint64_t, uint64_t))(v73 + 32);
      v159 = (void (**)(char *, char *, uint64_t))(v73 + 16);
      v161 = (void (**)(char *, uint64_t))(v73 + 8);
      v72 = (uint64_t *)(v74 + 5);
      uint64_t v71 = v77 - 1;
      v158 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v77 - 1);
      do
      {
        unint64_t v67 = *(v72 - 1);
        uint64_t v70 = *v72;
        swift_bridgeObjectRetain();
        sub_26153AD40();
        uint64_t v91 = v185;
        sub_26153AE20();
        uint64_t v77 = v91;
        uint64_t v73 = v187;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v78)(v77, 1, v187) == 1)
        {
          swift_bridgeObjectRelease();
          sub_26153A0A8(v77, &qword_26A921408);
        }
        else
        {
          v92 = v74;
          v93 = v174;
          (*v160)(v174, v77, v73);
          v94 = v178;
          (*v159)(v178, v93, v73);
          if (qword_26A9213C0 != -1) {
            swift_once();
          }
          uint64_t v95 = v186;
          *(void *)&v94[*(int *)(v186 + 20)] = qword_26A9214C0;
          v94[*(int *)(v95 + 24)] = 0;
          uint64_t v96 = (uint64_t)v94;
          uint64_t v97 = v67;
          unint64_t v67 = (unint64_t)v94;
          v98 = v154;
          sub_26153272C(v96, v97, v70, v154);
          swift_bridgeObjectRelease();
          sub_261539F1C(v67);
          uint64_t v70 = *(void *)(v98[4] + 16);
          uint64_t v77 = sub_26153B170();
          (*v161)(v93, v73);
          v74 = v92;
          uint64_t v71 = (uint64_t)v158;
          if (v70 >= v77)
          {
LABEL_31:
            sub_261539DB4((uint64_t)v199);
            sub_261539DB4((uint64_t)&v198);
            uint64_t v71 = (uint64_t)v179;
            goto LABEL_32;
          }
        }
        if (v71 == v90) {
          goto LABEL_31;
        }
        ++v90;
        v72 += 2;
      }
      while (v90 < (unint64_t)v74[2]);
    }
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    swift_once();
LABEL_7:
    uint64_t v79 = v186;
    *(void *)(v78 + *(int *)(v186 + 20)) = qword_26A9214B0;
    *(unsigned char *)(v78 + *(int *)(v79 + 24)) = 1;
    sub_26153272C(v78, (uint64_t)v149, v70, v154);
    swift_bridgeObjectRelease();
    sub_261539F1C(v78);
    (*(void (**)(uint64_t, uint64_t *))(v73 + 8))(v77, v72);
  }
LABEL_32:
  swift_beginAccess();
  uint64_t v99 = v154[2];
  v100 = (char *)v154[3];
  unint64_t v78 = v154[4];
  v161 = *(void (***)(char *, uint64_t))(v78 + 16);
  v149 = v100 + 32;
  v159 = (void (**)(char *, char *, uint64_t))(v164 + 16);
  int v148 = *MEMORY[0x263F05748];
  v174 = (char *)(v164 + 56);
  v158 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v164 + 48);
  v157 = (char *)(v164 + 32);
  v160 = (void (**)(char *, uint64_t, uint64_t))(v164 + 8);
  uint64_t v144 = v99;
  swift_retain();
  v152 = v100;
  swift_retain();
  v151 = (char *)v78;
  swift_retain();
  unint64_t v67 = 0;
  v74 = (void (**)(char *, uint64_t, uint64_t))&qword_26A921418;
  uint64_t v77 = (uint64_t)v183;
  uint64_t v70 = (uint64_t)v177;
  uint64_t v73 = (uint64_t)v182;
  while (1)
  {
    if ((uint64_t)v67 >= (uint64_t)v161)
    {
      uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921418);
      uint64_t v111 = (uint64_t)v175;
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v113 - 8) + 56))(v175, 1, 1, v113);
    }
    else
    {
      if (v67 >= *((void *)v152 + 2)) {
        goto LABEL_61;
      }
      if (v67 >= *((void *)v151 + 2)) {
        goto LABEL_62;
      }
      uint64_t v104 = (uint64_t)&v169[*(int *)(v170 + 48)];
      v105 = (uint64_t *)&v149[16 * v67];
      uint64_t v107 = *v105;
      uint64_t v106 = v105[1];
      uint64_t v108 = v170;
      sub_261539F78((uint64_t)&v151[((*(unsigned __int8 *)(v168 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v168 + 80))+ *(void *)(v168 + 72) * v67++], v104);
      uint64_t v109 = v70 + *(int *)(v108 + 48);
      sub_261539EB8(v104, v109);
      uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921418);
      uint64_t v111 = (uint64_t)v175;
      uint64_t v112 = (uint64_t)v175 + *(int *)(v110 + 48);
      void *v175 = v107;
      *(void *)(v111 + 8) = v106;
      uint64_t v73 = (uint64_t)v182;
      sub_261539EB8(v109, v112);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v110 - 8) + 56))(v111, 0, 1, v110);
      uint64_t v77 = (uint64_t)v183;
      swift_bridgeObjectRetain();
    }
    v114 = v176;
    sub_261539DE0(v111, (uint64_t)v176, &qword_26A921400);
    uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921418);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v115 - 8) + 48))(v114, 1, v115) == 1)
    {
      sub_261533678(v155, v156);
      sub_261533678(v150, v147);
      sub_261533678(v145, v146);
      swift_release();
      sub_261539E44((uint64_t)v190);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      return swift_release();
    }
    uint64_t v187 = v67;
    uint64_t v116 = *v114;
    uint64_t v117 = v114[1];
    sub_261539EB8((uint64_t)v114 + *(int *)(v115 + 48), v77);
    uint64_t v118 = v171;
    uint64_t v119 = sub_26153B020();
    if (v118)
    {
      uint64_t v171 = v118;
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      sub_261539E44((uint64_t)v190);
      sub_261533678(v145, v146);
      sub_261533678(v150, v147);
      sub_261533678(v155, v156);
      goto LABEL_58;
    }
    v72 = (uint64_t *)v119;
    unint64_t v78 = v120;
    uint64_t v185 = v116;
    uint64_t v121 = v186;
    sub_2615336D0(v119, v120);
    uint64_t v122 = v184;
    sub_26153053C((uint64_t)v72, v78, v184);
    uint64_t v171 = 0;
    if (*(unsigned char *)(v77 + *(int *)(v121 + 24)) == 1) {
      break;
    }
LABEL_49:
    uint64_t v131 = v181;
    (*v159)((char *)v71, (char *)v122, v181);
    v132 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v174;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))v174)(v71, 0, 1, v131);
    v178 = (char *)sub_26153B160();
    v134 = v133;
    if ((*v158)(v71, 1, v131) == 1)
    {
      sub_26153A0A8(v71, &qword_26A9213E0);
      swift_bridgeObjectRetain();
      unint64_t v135 = sub_261535698(v185, v117);
      char v137 = v136;
      swift_bridgeObjectRelease();
      if (v137)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v188 = *v134;
        uint64_t *v134 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native) {
          sub_261536344();
        }
        uint64_t v139 = v188;
        swift_bridgeObjectRelease();
        uint64_t v140 = (uint64_t)v166;
        uint64_t v131 = v181;
        (*(void (**)(char *, unint64_t, uint64_t))(v164 + 32))(v166, *(void *)(v139 + 56) + *(void *)(v164 + 72) * v135, v181);
        sub_261535E20(v135, v139);
        uint64_t *v134 = v139;
        swift_bridgeObjectRelease();
        uint64_t v141 = 0;
      }
      else
      {
        uint64_t v141 = 1;
        uint64_t v140 = (uint64_t)v166;
        uint64_t v131 = v181;
      }
      v132(v140, v141, 1, v131);
      swift_bridgeObjectRelease();
      sub_26153A0A8(v140, &qword_26A9213E0);
      uint64_t v71 = (uint64_t)v179;
    }
    else
    {
      uint64_t v101 = (uint64_t)v167;
      (*(void (**)(char *, uint64_t, uint64_t))v157)(v167, v71, v131);
      char v102 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v188 = *v134;
      uint64_t *v134 = 0x8000000000000000;
      sub_261536030(v101, v185, v117, v102);
      uint64_t *v134 = v188;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v77 = (uint64_t)v183;
    uint64_t v103 = v184;
    uint64_t v70 = (uint64_t)v177;
    unint64_t v67 = v187;
    ((void (*)(char *, void))v178)(v189, 0);
    sub_261533678((uint64_t)v72, v78);
    ((void (*)(uint64_t, uint64_t))*v160)(v103, v131);
    sub_261539F1C(v77);
    uint64_t v73 = (uint64_t)v182;
    v74 = (void (**)(char *, uint64_t, uint64_t))&qword_26A921418;
  }
  v178 = (char *)v117;
  uint64_t v123 = v173;
  sub_26153AC70();
  sub_26153A044(v123, v73, &qword_26A9213F0);
  uint64_t v124 = sub_26153AC60();
  uint64_t v125 = *(void *)(v124 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v125 + 48))(v73, 1, v124) == 1)
  {
    sub_26153A0A8(v123, &qword_26A9213F0);
    sub_26153A0A8(v73, &qword_26A9213F0);
    uint64_t v71 = (uint64_t)v179;
    uint64_t v117 = (uint64_t)v178;
    goto LABEL_49;
  }
  int v126 = (*(uint64_t (**)(uint64_t, uint64_t))(v125 + 88))(v73, v124);
  uint64_t v117 = (uint64_t)v178;
  if (v126 != v148)
  {
    sub_26153A0A8(v173, &qword_26A9213F0);
    (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v73, v124);
    uint64_t v71 = (uint64_t)v179;
    goto LABEL_49;
  }
  (*(void (**)(uint64_t, uint64_t))(v125 + 96))(v73, v124);
  id v127 = *(id *)v73;
  v128 = v162;
  uint64_t v129 = v171;
  sub_26153B240();
  uint64_t v171 = v129;
  uint64_t v71 = (uint64_t)v179;
  if (!v129)
  {
    uint64_t v130 = sub_26153B250();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v130 - 8) + 56))(v128, 0, 1, v130);
    sub_26153B1A0();

    sub_26153A0A8(v173, &qword_26A9213F0);
    goto LABEL_49;
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_261539E44((uint64_t)v190);

  sub_261533678((uint64_t)v72, v78);
  sub_261533678(v145, v146);
  sub_261533678(v150, v147);
  sub_261533678(v155, v156);
  sub_26153A0A8(v173, &qword_26A9213F0);
  ((void (*)(uint64_t, uint64_t))*v160)(v122, v181);
  uint64_t v77 = (uint64_t)v183;
LABEL_58:
  uint64_t v142 = v153;
  uint64_t v143 = v163;
  sub_261539F1C(v77);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v143 + 8))(v180, v142);
}

unint64_t sub_261532608(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921450);
  uint64_t v2 = (void *)sub_26153B370();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_261535698(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_26153272C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v34 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921420);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  char v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = _s13ThumbnailInfoVMa();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v33 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v32 - v17;
  uint64_t v35 = a4 + 2;
  swift_beginAccess();
  uint64_t v20 = a4[2];
  uint64_t v19 = (void *)a4[3];
  uint64_t v21 = a4[4];
  swift_bridgeObjectRetain();
  uint64_t v36 = a2;
  unint64_t result = sub_261533EE4(a2, a3, v20, v19);
  if (v23)
  {
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
    v24(v12, 1, 1, v13);
    goto LABEL_6;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (result >= *(void *)(v21 + 16))
  {
LABEL_16:
    __break(1u);
    return result;
  }
  sub_261539F78(v21+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(void *)(v14 + 72) * result, (uint64_t)v12);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v24(v12, 0, 1, v13);
LABEL_6:
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_26153A0A8((uint64_t)v12, &qword_26A921420);
    swift_endAccess();
    sub_261539F78(v34, (uint64_t)v18);
  }
  else
  {
    sub_261539EB8((uint64_t)v12, (uint64_t)v18);
    swift_endAccess();
    uint64_t v25 = *(int *)(v13 + 20);
    double v26 = *(double *)&v18[v25];
    uint64_t v28 = (uint64_t)v33;
    uint64_t v27 = v34;
    if (v26 <= *(double *)(v34 + v25)) {
      double v26 = *(double *)(v34 + v25);
    }
    *(double *)&v18[v25] = v26;
    uint64_t v29 = *(int *)(v13 + 24);
    char v30 = v18[v29];
    sub_261539F78(v27, v28);
    if (v30) {
      char v31 = 1;
    }
    else {
      char v31 = *(unsigned char *)(v28 + *(int *)(v13 + 24));
    }
    sub_261539F1C(v28);
    v18[v29] = v31;
  }
  sub_261539F78((uint64_t)v18, (uint64_t)v10);
  v24(v10, 0, 1, v13);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_261532A5C((uint64_t)v10, v36, a3);
  swift_endAccess();
  return sub_261539F1C((uint64_t)v18);
}

size_t sub_261532A5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = _s13ThumbnailInfoVMa();
  uint64_t v50 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v48 = (uint64_t)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v49 = (uint64_t)&v44 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v45 = (uint64_t)&v44 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v47 = (uint64_t)&v44 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921428);
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *v3;
  uint64_t v19 = (void *)v3[1];
  swift_retain();
  swift_retain();
  uint64_t v46 = a2;
  uint64_t v51 = a3;
  unint64_t v21 = sub_261533EE4(a2, a3, v20, v19);
  char v23 = v22;
  uint64_t v25 = v24;
  uint64_t v26 = a1;
  swift_release();
  swift_release();
  uint64_t v27 = (uint64_t)&v18[*(int *)(v16 + 56)];
  *(void *)uint64_t v18 = v21;
  v18[8] = v23 & 1;
  uint64_t v28 = v50;
  sub_26153A044(a1, v27, &qword_26A921420);
  int v29 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v27, 1, v7);
  if (v23)
  {
    if (v29 == 1)
    {
      swift_bridgeObjectRelease();
      return sub_26153A0A8(a1, &qword_26A921420);
    }
    uint64_t v33 = v49;
    sub_261539EB8(v27, v49);
    sub_261534108(v46, v51);
    uint64_t v34 = v48;
    sub_261539F78(v33, v48);
    uint64_t v37 = v3[2];
    uint64_t v36 = v3 + 2;
    uint64_t v35 = v37;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v36 = v35;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_2615344EC(0, *(void *)(v35 + 16) + 1, 1);
      uint64_t v35 = *v36;
    }
    unint64_t v40 = *(void *)(v35 + 16);
    unint64_t v39 = *(void *)(v35 + 24);
    if (v40 >= v39 >> 1)
    {
      sub_2615344EC(v39 > 1, v40 + 1, 1);
      uint64_t v35 = *v36;
    }
    *(void *)(v35 + 16) = v40 + 1;
    sub_261539EB8(v34, v35+ ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(void *)(v28 + 72) * v40);
    swift_bridgeObjectRelease();
    *uint64_t v36 = v35;
    sub_26153A0A8(v26, &qword_26A921420);
    uint64_t v32 = v33;
    return sub_261539F1C(v32);
  }
  if (v29 == 1)
  {
    sub_261536A78(v21, v25);
    swift_bridgeObjectRelease();
    uint64_t v31 = v45;
    sub_261536BF8(v21, v45);
    swift_bridgeObjectRelease();
    sub_26153A0A8(a1, &qword_26A921420);
    uint64_t v32 = v31;
    return sub_261539F1C(v32);
  }
  uint64_t v41 = v47;
  sub_261539EB8(v27, v47);
  uint64_t v42 = (void *)v3[2];
  size_t result = swift_isUniquelyReferenced_nonNull_native();
  v3[2] = (uint64_t)v42;
  if ((result & 1) == 0)
  {
    size_t result = sub_261536DB0(v42);
    uint64_t v42 = (void *)result;
    v3[2] = result;
  }
  if ((v21 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v21 < v42[2])
  {
    sub_261539FDC(v41, (uint64_t)v42+ ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(void *)(v28 + 72) * v21);
    uint64_t v43 = v3[2];
    swift_bridgeObjectRelease();
    v3[2] = v43;
    sub_26153A0A8(a1, &qword_26A921420);
    uint64_t v32 = v41;
    return sub_261539F1C(v32);
  }
  __break(1u);
  return result;
}

uint64_t WalletOrderPreviewUnpacker.unpack(from:with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26153B200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_26153B190();
  uint64_t v10 = v7;
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  sub_26153B1D0();
  sub_26153B1E0();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_261532F8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v19[4] = a3;
  v19[3] = a2;
  v19[1] = a4;
  uint64_t v24 = sub_26153B010();
  uint64_t v20 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_26153B230();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v19 - v12;
  id v14 = objc_msgSend(self, sel_defaultManager);
  v19[2] = a1;
  sub_26153B1F0();
  sub_26153B210();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v13, v7);
  uint64_t v16 = (void *)sub_26153B2C0();
  swift_bridgeObjectRelease();
  LODWORD(v13) = objc_msgSend(v14, sel_isWritableFileAtPath_, v16);

  if (v13)
  {
    sub_26153AC20();
    sub_26153B1F0();
    sub_26153B220();
    v15(v11, v7);
    char v22 = &type metadata for OrderPackageValidator;
    unint64_t v23 = sub_261533514();
    uint64_t v17 = v19[5];
    sub_26153ABF0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v24);
    if (v17)
    {
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      sub_26153B1D0();
      sub_26153ABD0();
      return swift_release();
    }
  }
  else
  {
    sub_26153B2B0();
    sub_2615334CC(&qword_26A9213D0, MEMORY[0x263F2B8A8]);
    swift_allocError();
    sub_26153B2A0();
    return swift_willThrow();
  }
}

uint64_t sub_261533328@<X0>(uint64_t a1@<X8>)
{
  return sub_261532F8C(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_261533348()
{
  return sub_2615334CC(&qword_26A9213C8, MEMORY[0x263F2AEE0]);
}

uint64_t sub_261533390(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26153B200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_26153B190();
  uint64_t v10 = v7;
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  sub_26153B1D0();
  sub_26153B1E0();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

ValueMetadata *type metadata accessor for WalletOrderPreviewUnpacker()
{
  return &type metadata for WalletOrderPreviewUnpacker;
}

uint64_t sub_2615334CC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_261533514()
{
  unint64_t result = qword_26A9213D8;
  if (!qword_26A9213D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9213D8);
  }
  return result;
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

uint64_t sub_2615335B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = swift_retain();
  return sub_261530B38(v2, a1);
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

uint64_t _s13ThumbnailInfoVMa()
{
  uint64_t result = qword_26A921480;
  if (!qword_26A921480) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_261533678(uint64_t a1, unint64_t a2)
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

uint64_t sub_2615336D0(uint64_t a1, unint64_t a2)
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

uint64_t sub_261533728(uint64_t a1)
{
  uint64_t v3 = sub_2615338B4();
  uint64_t v4 = sub_2615338BC(&v12, a1, 0, 1, v3);
  unint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = v12;
  if (v12 == v5) {
    return v4;
  }
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v5 < v12)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    swift_bridgeObjectRelease();
    sub_2615367C4(a1, v1, 0, (2 * v6) | 1);
    uint64_t v9 = v11;
    goto LABEL_9;
  }
  uint64_t v1 = a1 + 32;
  sub_26153B390();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v7 = swift_dynamicCastClass();
  if (!v7)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  uint64_t v8 = *(void *)(v7 + 16);
  swift_release();
  if (v8 != v6) {
    goto LABEL_14;
  }
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v13 = v4;
  uint64_t v14 = v9;
  if (*(void *)(a1 + 16) >= v5)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    sub_261533AF8(a1, v1, v6, (2 * v5) | 1);
    swift_bridgeObjectRelease_n();
    swift_release();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_2615338B4()
{
  return 0;
}

uint64_t sub_2615338BC(unint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  unint64_t v10 = *(void *)(a2 + 16);
  uint64_t v11 = MEMORY[0x263E399D0](v10);
  if (a4) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = a3;
  }
  if (v12 <= v11) {
    uint64_t v12 = v11;
  }
  if (v12 <= a5) {
    uint64_t v13 = a5;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13 > 4)
  {
    uint64_t v14 = MEMORY[0x263E399E0]();
    sub_261534950(&v32, a2, (void *)(v14 + 16));
    *a1 = v32;
    return v14;
  }
  if (v10 < 2)
  {
    uint64_t v14 = 0;
    *a1 = v10;
    return v14;
  }
  uint64_t v31 = a1;
  uint64_t result = (uint64_t)sub_261534B04(0, v10, 0, MEMORY[0x263F8EE78]);
  uint64_t v16 = (char *)result;
  unint64_t v17 = 0;
  uint64_t v18 = a2 + 32;
  while (v17 != v10)
  {
    uint64_t v19 = (uint64_t *)(v18 + 16 * v17);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    uint64_t v22 = *((void *)v16 + 2);
    if (v22)
    {
      BOOL v23 = *((void *)v16 + 4) == v21 && *((void *)v16 + 5) == v20;
      if (v23 || (sub_26153B380() & 1) != 0)
      {
LABEL_38:
        swift_bridgeObjectRelease();
        uint64_t v14 = 0;
        unint64_t *v31 = v17;
        return v14;
      }
      if (v22 != 1)
      {
        if (*((void *)v16 + 6) == v21 && *((void *)v16 + 7) == v20) {
          goto LABEL_38;
        }
        uint64_t result = sub_26153B380();
        if (result) {
          goto LABEL_38;
        }
        if (v22 != 2)
        {
          uint64_t v24 = v16 + 72;
          uint64_t v25 = 2;
          while (1)
          {
            uint64_t v26 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              break;
            }
            if (*(v24 - 1) == v21 && *v24 == v20) {
              goto LABEL_38;
            }
            uint64_t result = sub_26153B380();
            if (result) {
              goto LABEL_38;
            }
            v24 += 2;
            ++v25;
            if (v26 == v22) {
              goto LABEL_34;
            }
          }
          __break(1u);
          break;
        }
      }
    }
LABEL_34:
    unint64_t v29 = *((void *)v16 + 2);
    unint64_t v28 = *((void *)v16 + 3);
    swift_bridgeObjectRetain_n();
    if (v29 >= v28 >> 1) {
      uint64_t v16 = sub_261534B04((char *)(v28 > 1), v29 + 1, 1, v16);
    }
    ++v17;
    *((void *)v16 + 2) = v29 + 1;
    char v30 = &v16[16 * v29];
    *((void *)v30 + 4) = v21;
    *((void *)v30 + 5) = v20;
    uint64_t result = swift_bridgeObjectRelease();
    if (v17 == v10)
    {
      swift_bridgeObjectRelease();
      uint64_t v14 = 0;
      unint64_t *v31 = v10;
      return v14;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_261533AF8(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v5 = a4 >> 1;
  if (a4 >> 1 == a3) {
    return result;
  }
  uint64_t v6 = v4;
  uint64_t v7 = a3;
  uint64_t v34 = v4 + 1;
  uint64_t result = swift_unknownObjectRetain();
  uint64_t v35 = v5;
  while (v7 < v5)
  {
    uint64_t v11 = (uint64_t *)(a2 + 16 * v7);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    uint64_t v15 = *v6;
    uint64_t v14 = (void *)v6[1];
    uint64_t v16 = v14[2];
    if (*v6)
    {
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v37 = v13;
      sub_2615347E4(v13, v12, (uint64_t)(v14 + 4), v16, (void *)(v15 + 16));
      char v18 = v17;
      swift_release();
      uint64_t v19 = v12;
      if ((v18 & 1) == 0) {
        goto LABEL_7;
      }
    }
    else
    {
      if (v16)
      {
        uint64_t result = v14[4];
        if (result == v13 && v14[5] == v12) {
          goto LABEL_8;
        }
        uint64_t v21 = *v11;
        uint64_t result = sub_26153B380();
        if (result) {
          goto LABEL_8;
        }
        if (v16 != 1)
        {
          uint64_t result = v14[6];
          if (result == v13 && v14[7] == v12) {
            goto LABEL_8;
          }
          uint64_t result = sub_26153B380();
          if (result) {
            goto LABEL_8;
          }
          if (v16 != 2)
          {
            uint64_t result = v14[8];
            if (result == v21 && v14[9] == v12) {
              goto LABEL_8;
            }
            uint64_t result = sub_26153B380();
            if (result) {
              goto LABEL_8;
            }
            uint64_t v13 = v21;
            if (v16 != 3)
            {
              uint64_t result = v14[10];
              if (result == v21 && v14[11] == v12) {
                goto LABEL_8;
              }
              uint64_t result = sub_26153B380();
              if (result) {
                goto LABEL_8;
              }
              uint64_t v13 = v21;
              uint64_t v31 = v16 - 4;
              if (v16 != 4)
              {
                uint64_t result = v14[12];
                if (result == v21 && v14[13] == v12) {
                  goto LABEL_8;
                }
                uint64_t result = sub_26153B380();
                if (result) {
                  goto LABEL_8;
                }
                uint64_t v13 = v21;
                unint64_t v32 = v14 + 15;
                while (--v31)
                {
                  uint64_t result = *(v32 - 1);
                  if (result != v13 || *v32 != v12)
                  {
                    v32 += 2;
                    uint64_t result = sub_26153B380();
                    uint64_t v13 = v21;
                    if ((result & 1) == 0) {
                      continue;
                    }
                  }
                  goto LABEL_8;
                }
              }
            }
          }
        }
      }
      uint64_t v37 = v13;
      uint64_t v19 = v12;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    void *v34 = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_2615344CC(0, v14[2] + 1, 1);
      uint64_t v14 = (void *)*v34;
    }
    unint64_t v24 = v14[2];
    unint64_t v23 = v14[3];
    if (v24 >= v23 >> 1)
    {
      sub_2615344CC((char *)(v23 > 1), v24 + 1, 1);
      uint64_t v14 = (void *)*v34;
    }
    v14[2] = v24 + 1;
    uint64_t v25 = &v14[2 * v24];
    v25[4] = v37;
    v25[5] = v19;
    v6[1] = (uint64_t)v14;
    unint64_t v26 = v14[2];
    uint64_t v27 = *v6;
    if (*v6)
    {
      swift_beginAccess();
      if (MEMORY[0x263E399A0](*(void *)(v27 + 16) & 0x3FLL) >= (uint64_t)v26)
      {
        uint64_t result = swift_isUniquelyReferenced_native();
        uint64_t v29 = *v6;
        if ((result & 1) == 0)
        {
          if (!v29) {
            goto LABEL_66;
          }
          uint64_t v29 = sub_26153B0C0();
          uint64_t result = swift_release();
          *uint64_t v6 = v29;
        }
        if (!v29) {
          goto LABEL_65;
        }
        sub_26153B060();
        goto LABEL_7;
      }
      uint64_t v28 = *(void *)(v27 + 24) & 0x3FLL;
      if (v26 > 0xF || v28) {
        goto LABEL_3;
      }
      swift_release();
      *uint64_t v6 = 0;
    }
    else if (v26 > 0xF)
    {
      uint64_t v28 = 0;
LABEL_3:
      uint64_t v8 = MEMORY[0x263E399D0](v26);
      if (v28 <= v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v28;
      }
      uint64_t v10 = sub_261534328((uint64_t)v14, v9, 0, v28);
      swift_release();
      *uint64_t v6 = v10;
    }
LABEL_7:
    uint64_t result = swift_bridgeObjectRelease();
    int64_t v5 = v35;
LABEL_8:
    if (++v7 == v5) {
      return swift_unknownObjectRelease();
    }
  }
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
  return result;
}

uint64_t sub_261533EE4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = a4[2];
  if (a3)
  {
    uint64_t v8 = (void *)(a3 + 16);
    swift_retain();
    uint64_t v9 = sub_2615347E4(a1, a2, (uint64_t)(a4 + 4), v7, v8);
    swift_release();
  }
  else
  {
    if (!v7) {
      return 0;
    }
    BOOL v10 = a4[4] == a1 && a4[5] == a2;
    if (v10 || (sub_26153B380() & 1) != 0) {
      return 0;
    }
    if (v7 == 1) {
      return 0;
    }
    if (a4[6] == a1 && a4[7] == a2 || (sub_26153B380() & 1) != 0) {
      return 1;
    }
    if (v7 == 2) {
      return 0;
    }
    if (a4[8] == a1 && a4[9] == a2 || (sub_26153B380() & 1) != 0) {
      return 2;
    }
    if (v7 == 3) {
      return 0;
    }
    if (a4[10] == a1 && a4[11] == a2 || (sub_26153B380() & 1) != 0)
    {
      return 3;
    }
    else
    {
      uint64_t v12 = a4 + 13;
      uint64_t v13 = 3;
      uint64_t v14 = 4;
      while (1)
      {
        if (v7 == v14) {
          return 0;
        }
        ++v13;
        if (*(v12 - 1) == a1 && *v12 == a2) {
          break;
        }
        uint64_t v9 = v14++;
        v12 += 2;
        if (sub_26153B380()) {
          return v9;
        }
      }
      return v13;
    }
  }
  return v9;
}

uint64_t sub_261534108(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v8 = v2[1];
  uint64_t v6 = v2 + 1;
  uint64_t v7 = v8;
  swift_bridgeObjectRetain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v6 = v8;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2615344CC(0, *(void *)(v7 + 16) + 1, 1);
    uint64_t v7 = *v6;
  }
  unint64_t v11 = *(void *)(v7 + 16);
  unint64_t v10 = *(void *)(v7 + 24);
  if (v11 >= v10 >> 1)
  {
    uint64_t result = (uint64_t)sub_2615344CC((char *)(v10 > 1), v11 + 1, 1);
    uint64_t v7 = *v6;
  }
  *(void *)(v7 + 16) = v11 + 1;
  unint64_t v12 = v7 + 16 * v11;
  *(void *)(v12 + 32) = a1;
  *(void *)(v12 + 40) = a2;
  v3[1] = v7;
  uint64_t v13 = *(void *)(v7 + 16);
  uint64_t v14 = *v3;
  if (*v3)
  {
    swift_beginAccess();
    if (MEMORY[0x263E399A0](*(void *)(v14 + 16) & 0x3FLL) >= v13)
    {
      uint64_t result = swift_isUniquelyReferenced_native();
      uint64_t v15 = *v3;
      if (!result)
      {
        if (!v15)
        {
LABEL_16:
          __break(1u);
          return result;
        }
        uint64_t v15 = sub_26153B0C0();
        uint64_t result = swift_release();
        *uint64_t v3 = v15;
      }
      if (v15) {
        return sub_26153B060();
      }
      __break(1u);
      goto LABEL_16;
    }
  }
  else if ((unint64_t)v13 < 0x10)
  {
    return result;
  }
  return sub_261534284();
}

uint64_t sub_261534284()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  if (*v0)
  {
    swift_beginAccess();
    uint64_t v3 = *(void *)(v1 + 24) & 0x3FLL;
    unint64_t v4 = *(void *)(v2 + 16);
    if (v3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v4 = *(void *)(v2 + 16);
  }
  if (v4 < 0x10)
  {
    uint64_t v5 = 0;
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v6 = MEMORY[0x263E399D0](v4);
  if (v3 <= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v3;
  }
  uint64_t v5 = sub_261534328(v2, v7, 0, v3);
LABEL_11:
  uint64_t result = swift_release();
  uint64_t *v0 = v5;
  return result;
}

uint64_t sub_261534328(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = MEMORY[0x263E399D0](*(void *)(a1 + 16));
  uint64_t v9 = 0;
  if (a3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = a2;
  }
  if (v10 <= v8) {
    uint64_t v10 = v8;
  }
  if (v10 <= a4) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v11 >= 5)
  {
    uint64_t v9 = MEMORY[0x263E399E0]();
    sub_2615343B0(a1, (void *)(v9 + 16));
  }
  return v9;
}

uint64_t sub_2615343B0(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    uint64_t v4 = 0;
    while (1)
    {
      sub_26153B3C0();
      swift_bridgeObjectRetain();
      sub_26153B2D0();
      uint64_t result = sub_26153B3D0();
      if (__OFSUB__(1 << *a2, 1)) {
        break;
      }
      uint64_t v5 = sub_26153B040();
      swift_bridgeObjectRelease();
      if (v5)
      {
        while (1)
          sub_26153B090();
      }
      uint64_t result = sub_26153B080();
      if (++v4 == v2) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

char *sub_2615344CC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_26153450C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_2615344EC(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_261534610(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_26153450C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A921438);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_261534610(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921430);
  uint64_t v10 = *(void *)(_s13ThumbnailInfoVMa() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(_s13ThumbnailInfoVMa() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_2615347E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  sub_26153B3C0();
  sub_26153B2D0();
  uint64_t result = sub_26153B3D0();
  if (__OFSUB__(1 << *a5, 1))
  {
    __break(1u);
  }
  else
  {
    sub_26153B040();
    uint64_t v10 = sub_26153B070();
    uint64_t v11 = v10;
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = (void *)(a3 + 16 * v10);
      if (*v13 != a1 || v13[1] != a2)
      {
        do
        {
          if (sub_26153B380()) {
            break;
          }
          sub_26153B090();
          uint64_t v14 = sub_26153B070();
          uint64_t v11 = v14;
          if (v15) {
            break;
          }
          unint64_t v16 = (void *)(a3 + 16 * v14);
        }
        while (*v16 != a1 || v16[1] != a2);
      }
    }
    return v11;
  }
  return result;
}

unint64_t sub_261534950(unint64_t *a1, uint64_t a2, void *a3)
{
  unint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    unint64_t v5 = 0;
    uint64_t v6 = a2 + 32;
    while (1)
    {
      unint64_t v13 = v5;
      int64_t v7 = (void *)(v6 + 16 * v5);
      sub_26153B3C0();
      swift_bridgeObjectRetain();
      sub_26153B2D0();
      unint64_t result = sub_26153B3D0();
      if (__OFSUB__(1 << *a3, 1)) {
        break;
      }
      sub_26153B040();
      swift_bridgeObjectRelease();
      while (1)
      {
        unint64_t result = sub_26153B070();
        if (v9) {
          break;
        }
        if (result >= v3)
        {
          __break(1u);
          goto LABEL_18;
        }
        uint64_t v10 = (void *)(v6 + 16 * result);
        BOOL v11 = *v10 == *v7 && v10[1] == v7[1];
        if (v11 || (sub_26153B380() & 1) != 0)
        {
          unint64_t result = 0;
          *a1 = v13;
          return result;
        }
        sub_26153B090();
      }
      sub_26153B080();
      unint64_t v5 = v13 + 1;
      if (v13 + 1 == v3) {
        goto LABEL_15;
      }
    }
LABEL_18:
    __break(1u);
  }
  else
  {
LABEL_15:
    *a1 = v3;
    return 1;
  }
  return result;
}

char *sub_261534B04(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A921438);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_261534C08(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_26153B3C0();
  swift_bridgeObjectRetain();
  sub_26153B2D0();
  uint64_t v8 = sub_26153B3D0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_26153B380() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      char v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_26153B380() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_261535098(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_261534DB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921478);
  uint64_t v3 = sub_26153B340();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_26153B3C0();
      sub_26153B2D0();
      uint64_t result = sub_26153B3D0();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_261535098(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_261534DB8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_261535234();
      goto LABEL_22;
    }
    sub_2615353E8();
  }
  uint64_t v11 = *v4;
  sub_26153B3C0();
  sub_26153B2D0();
  uint64_t result = sub_26153B3D0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_26153B380(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_26153B3A0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_26153B380();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_261535234()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921478);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_26153B330();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2615353E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921478);
  uint64_t v3 = sub_26153B340();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_26153B3C0();
    swift_bridgeObjectRetain();
    sub_26153B2D0();
    uint64_t result = sub_26153B3D0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_261535698(uint64_t a1, uint64_t a2)
{
  sub_26153B3C0();
  sub_26153B2D0();
  uint64_t v4 = sub_26153B3D0();
  return sub_261536260(a1, a2, v4);
}

uint64_t sub_261535710(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_26153B1C0();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921440);
  int v47 = a2;
  uint64_t v8 = sub_26153B360();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  unint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    unint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_26153B3C0();
    sub_26153B2D0();
    uint64_t result = sub_26153B3D0();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    BOOL v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *BOOL v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  unint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_261535AF8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921450);
  char v42 = a2;
  uint64_t v6 = sub_26153B360();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    unint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_26153B3C0();
    sub_26153B2D0();
    uint64_t result = sub_26153B3D0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    BOOL v19 = (void *)(*(void *)(v7 + 48) + v18);
    *BOOL v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_261535E20(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_26153B320();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_26153B3C0();
        swift_bridgeObjectRetain();
        sub_26153B2D0();
        uint64_t v9 = sub_26153B3D0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        int64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_26153B1C0() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
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

uint64_t sub_261536030(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_261535698(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_261536344();
      goto LABEL_7;
    }
    sub_261535710(v15, a4 & 1);
    unint64_t v26 = sub_261535698(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_26153B3B0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_26153B1C0();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_2615361B0(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2615361B0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_26153B1C0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

unint64_t sub_261536260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_26153B380() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_26153B380() & 1) == 0);
    }
  }
  return v6;
}

void *sub_261536344()
{
  uint64_t v35 = sub_26153B1C0();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921440);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_26153B350();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    *char v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    uint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *uint64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    char v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_261536608()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A921450);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_26153B350();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v23 = v19;
    v23[1] = v18;
    int64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *int64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_2615367C4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      if (v4 != a3)
      {
LABEL_7:
        swift_arrayInitWithCopy();
        return;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A921438);
      unint64_t v7 = (void *)swift_allocObject();
      int64_t v8 = _swift_stdlib_malloc_size(v7);
      uint64_t v9 = v8 - 32;
      if (v8 < 32) {
        uint64_t v9 = v8 - 17;
      }
      v7[2] = v5;
      v7[3] = 2 * (v9 >> 4);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
}

uint64_t sub_261536894(uint64_t result, char a2)
{
  if (result < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v3 = v2;
  int64_t v5 = result;
  uint64_t v8 = v2[1];
  uint64_t v6 = v2 + 1;
  uint64_t v7 = v8;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v6 = v8;
  if (isUniquelyReferenced_nonNull_native && (unint64_t)v5 <= *(void *)(v7 + 24) >> 1)
  {
    uint64_t v10 = *v3;
    if (*v3) {
      goto LABEL_5;
    }
  }
  else
  {
    if (*(void *)(v7 + 16) <= v5) {
      int64_t v15 = v5;
    }
    else {
      int64_t v15 = *(void *)(v7 + 16);
    }
    sub_2615344CC(isUniquelyReferenced_nonNull_native, v15, 0);
    uint64_t v7 = *v6;
    uint64_t v10 = *v3;
    if (*v3)
    {
LABEL_5:
      swift_beginAccess();
      uint64_t v11 = *(void *)(v10 + 16) & 0x3FLL;
      uint64_t v12 = MEMORY[0x263E399D0](v5);
      uint64_t v13 = v12;
      if (a2)
      {
        uint64_t v14 = v12;
        if (v11 >= v12) {
          goto LABEL_20;
        }
      }
      else
      {
        swift_beginAccess();
        uint64_t v14 = *(void *)(v10 + 24) & 0x3FLL;
        if (v11 >= v13) {
          goto LABEL_20;
        }
      }
LABEL_16:
      if (v14 <= v13) {
        uint64_t v17 = v13;
      }
      else {
        uint64_t v17 = v14;
      }
      goto LABEL_30;
    }
  }
  uint64_t v16 = MEMORY[0x263E399D0](v5);
  uint64_t v13 = v16;
  uint64_t v11 = 0;
  if (a2) {
    uint64_t v14 = v16;
  }
  else {
    uint64_t v14 = 0;
  }
  if (v16 > 0) {
    goto LABEL_16;
  }
LABEL_20:
  if (v14 <= v13) {
    uint64_t v18 = v13;
  }
  else {
    uint64_t v18 = v14;
  }
  uint64_t result = MEMORY[0x263E399D0](*(void *)(v7 + 16));
  if (result <= v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = result;
  }
  if (v19 < v11)
  {
    if (v14 <= v19) {
      uint64_t v17 = v19;
    }
    else {
      uint64_t v17 = v14;
    }
LABEL_30:
    uint64_t v20 = sub_261534328(v7, v17, 0, v14);
    uint64_t result = swift_release();
    *uint64_t v3 = v20;
    return result;
  }
  if (!v10 || (uint64_t result = swift_isUniquelyReferenced_native(), result))
  {
    uint64_t v21 = *v3;
    if (*v3) {
      goto LABEL_35;
    }
LABEL_39:
    if (!v14) {
      return result;
    }
    __break(1u);
    goto LABEL_41;
  }
  uint64_t result = *v3;
  if (!*v3)
  {
LABEL_42:
    __break(1u);
    return result;
  }
  uint64_t v21 = sub_26153B0C0();
  uint64_t result = swift_release();
  *uint64_t v3 = v21;
  if (!v21) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t result = swift_beginAccess();
  if ((*(void *)(v21 + 24) & 0x3FLL) != v14) {
    *(void *)(v21 + 24) = *(void *)(v21 + 24) & 0xFFFFFFFFFFFFFFC0 | v14 & 0x3F;
  }
  return result;
}

unint64_t sub_261536A78(int64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2[1] + 16);
  uint64_t v5 = *v2;
  if (!*v2)
  {
    if (v4) {
      return sub_261536D14(a1);
    }
    goto LABEL_15;
  }
  swift_beginAccess();
  if ((*(void *)(v5 + 16) & 0x3FLL) == (*(void *)(v5 + 24) & 0x3FLL))
  {
    if (!v4) {
      goto LABEL_15;
    }
  }
  else if (v4 <= sub_26153B0B0())
  {
LABEL_15:
    uint64_t v10 = sub_261536D14(a1);
    sub_261534284();
    return v10;
  }
  unint64_t result = swift_isUniquelyReferenced_native();
  uint64_t v8 = *v2;
  if (!result)
  {
    if (!v8) {
      goto LABEL_20;
    }
    uint64_t v8 = sub_26153B0C0();
    unint64_t result = swift_release();
    *uint64_t v2 = v8;
  }
  if (v8)
  {
    swift_retain();
    unint64_t result = sub_261536DC4(a2, (void *)(v8 + 16), v8 + 32, (uint64_t)v2);
    if (__OFADD__(a1, 1))
    {
      __break(1u);
    }
    else if (a1 + 1 >= a1)
    {
      uint64_t v9 = v2[1];
      swift_retain();
      sub_261536FA8(a1, a1 + 1, v9, (void *)(v8 + 16));
      swift_release();
      swift_release();
      return sub_261536D14(a1);
    }
    __break(1u);
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

size_t sub_261536BF8@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  size_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    size_t result = sub_261536DB0(v5);
    uint64_t v5 = (void *)result;
  }
  unint64_t v7 = v5[2];
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v8 = v7 - 1;
    uint64_t v9 = *(void *)(_s13ThumbnailInfoVMa() - 8);
    uint64_t v10 = *(void *)(v9 + 72);
    unint64_t v11 = (unint64_t)v5
        + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
        + v10 * a1;
    size_t result = sub_261539EB8(v11, a2);
    if (v10 > 0 || v11 >= v11 + v10 + v10 * (v8 - a1))
    {
      size_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v10)
    {
      size_t result = swift_arrayInitWithTakeBackToFront();
    }
    v5[2] = v8;
    *uint64_t v2 = v5;
  }
  return result;
}

uint64_t sub_261536D14(unint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_261536D9C(v3);
    uint64_t v3 = result;
  }
  unint64_t v5 = *(void *)(v3 + 16);
  if (v5 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v6 = v5 - 1;
    uint64_t v7 = v3 + 16 * a1;
    uint64_t v8 = *(void *)(v7 + 32);
    memmove((void *)(v7 + 32), (const void *)(v7 + 48), 16 * (v5 - 1 - a1));
    *(void *)(v3 + 16) = v6;
    uint64_t *v1 = v3;
    return v8;
  }
  return result;
}

char *sub_261536D9C(uint64_t a1)
{
  return sub_26153450C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

size_t sub_261536DB0(void *a1)
{
  return sub_261534610(0, a1[2], 0, a1);
}

unint64_t sub_261536DC4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a1;
  uint64_t v15 = sub_26153B040();
  sub_26153B090();
  if (v15)
  {
    uint64_t v7 = a1;
    uint64_t v8 = sub_26153B050();
    while (1)
    {
      unint64_t result = sub_26153B070();
      if (v10)
      {
LABEL_20:
        __break(1u);
        return result;
      }
      if ((result & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (result >= *(void *)(*(void *)(a4 + 8) + 16)) {
        goto LABEL_18;
      }
      sub_26153B3C0();
      swift_bridgeObjectRetain();
      sub_26153B2D0();
      uint64_t v11 = sub_26153B3D0();
      unint64_t result = swift_bridgeObjectRelease();
      uint64_t v12 = 1 << *a2;
      if (__OFSUB__(v12, 1)) {
        goto LABEL_19;
      }
      uint64_t v13 = (v12 - 1) & v11;
      if (v6 >= v8) {
        break;
      }
      if (v13 < v8) {
        goto LABEL_12;
      }
LABEL_13:
      sub_26153B070();
      sub_26153B060();
      uint64_t v6 = v7;
LABEL_3:
      sub_26153B090();
      uint64_t v7 = a1;
    }
    if (v13 < v8) {
      goto LABEL_3;
    }
LABEL_12:
    if (v6 < v13) {
      goto LABEL_3;
    }
    goto LABEL_13;
  }
  return sub_26153B060();
}

uint64_t sub_261536FA8(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (v5 >= 1)
  {
    uint64_t v7 = result;
    unint64_t v8 = *(void *)(a3 + 16);
    uint64_t v9 = v8 - v5;
    if ((uint64_t)v8 < v5) {
      ++v9;
    }
    if (result < v9 >> 1)
    {
      unint64_t result = MEMORY[0x263E399A0](*a4 & 0x3FLL);
      if (result / 3 > v7)
      {
        if (v7 < 0)
        {
LABEL_66:
          __break(1u);
          goto LABEL_67;
        }
        if (v8 < v7)
        {
LABEL_67:
          __break(1u);
          goto LABEL_68;
        }
        if (v7)
        {
          swift_retain();
          uint64_t v10 = 0;
          while (1)
          {
            sub_26153B3C0();
            swift_bridgeObjectRetain();
            sub_26153B2D0();
            unint64_t result = sub_26153B3D0();
            if (__OFSUB__(1 << *a4, 1)) {
              break;
            }
            if (sub_26153B040())
            {
              while (1)
              {
                uint64_t v11 = sub_26153B070();
                if ((v12 & 1) == 0 && v11 == v10) {
                  break;
                }
                sub_26153B090();
              }
            }
            unint64_t result = v10 + v5;
            if (__OFADD__(v10, v5)) {
              goto LABEL_58;
            }
            ++v10;
            sub_26153B080();
            swift_bridgeObjectRelease();
            if (v10 == v7)
            {
              unint64_t result = swift_release();
              goto LABEL_20;
            }
          }
          __break(1u);
LABEL_58:
          __break(1u);
          goto LABEL_59;
        }
        goto LABEL_20;
      }
      sub_26153B040();
      uint64_t v19 = sub_26153B070();
      if ((v20 & 1) != 0 || v19 >= v7)
      {
LABEL_32:
        unint64_t result = sub_26153B090();
LABEL_20:
        uint64_t v13 = a4[1];
        if (__OFSUB__(v13 >> 6, v5))
        {
LABEL_64:
          __break(1u);
          goto LABEL_65;
        }
        uint64_t v14 = 1 << *a4;
        BOOL v15 = __OFSUB__(v14, 1);
        uint64_t v16 = v14 - 1;
        if (v15)
        {
LABEL_65:
          __break(1u);
          goto LABEL_66;
        }
        uint64_t v17 = (v16 & (((v13 >> 6) - v5) >> 63)) + (v13 >> 6) - v5;
        if (v17 < v16) {
          uint64_t v16 = 0;
        }
        a4[1] = a4[1] & 0x3FLL | ((v17 - v16) << 6);
        return result;
      }
      if (!__OFADD__(v19, v5))
      {
        sub_26153B080();
        goto LABEL_32;
      }
      __break(1u);
LABEL_38:
      sub_26153B040();
      uint64_t v21 = sub_26153B070();
      if ((v22 & 1) == 0 && v21 >= v4)
      {
        BOOL v15 = __OFSUB__(v21, v5);
        unint64_t result = v21 - v5;
        if (v15)
        {
LABEL_59:
          __break(1u);
LABEL_60:
          __break(1u);
LABEL_61:
          __break(1u);
          goto LABEL_62;
        }
        sub_26153B080();
      }
      return sub_26153B090();
    }
    uint64_t v4 = a2;
    uint64_t v18 = v8 - a2;
    if (__OFSUB__(v8, a2))
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    unint64_t result = MEMORY[0x263E399A0](*a4 & 0x3FLL);
    if (v18 >= result / 3) {
      goto LABEL_38;
    }
    if ((uint64_t)v8 < v4)
    {
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if (v4 < 0)
    {
LABEL_69:
      __break(1u);
      goto LABEL_70;
    }
    if (v8 != v4)
    {
      if (v8 <= v4)
      {
LABEL_70:
        __break(1u);
        return result;
      }
      swift_retain();
      while (1)
      {
        sub_26153B3C0();
        swift_bridgeObjectRetain();
        sub_26153B2D0();
        unint64_t result = sub_26153B3D0();
        if (__OFSUB__(1 << *a4, 1)) {
          goto LABEL_60;
        }
        if (sub_26153B040())
        {
          while (1)
          {
            uint64_t v23 = sub_26153B070();
            if ((v24 & 1) == 0 && v23 == v4) {
              break;
            }
            sub_26153B090();
          }
        }
        unint64_t result = v4 - v5;
        if (__OFSUB__(v4, v5)) {
          goto LABEL_61;
        }
        ++v4;
        sub_26153B080();
        swift_bridgeObjectRelease();
        if (v4 == v8)
        {
          return swift_release();
        }
      }
    }
  }
  return result;
}

uint64_t sub_261537458()
{
  uint64_t v1 = sub_26153B000();
  uint64_t v2 = *(void *)(v1 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_26153AE70();
  uint64_t v15 = *(void *)(v5 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v14 - v9;
  sub_26153AC00();
  uint64_t v11 = sub_26153AE30();
  if (v0) {
    return swift_release();
  }
  sub_261533678(v11, v12);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v10, v8, v5);
  sub_26153AFF0();
  sub_26153AFE0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v10, v5);
}

uint64_t sub_261537660@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v262 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921458);
  MEMORY[0x270FA5388](v3 - 8);
  v248 = (char *)&v236 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v250 = sub_26153ADC0();
  uint64_t v249 = *(void *)(v250 - 8);
  MEMORY[0x270FA5388](v250);
  v243 = (char *)&v236 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v298 = sub_26153ACB0();
  uint64_t v292 = *(void *)(v298 - 8);
  MEMORY[0x270FA5388](v298);
  v291 = (char *)&v236 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v254 = sub_26153ADE0();
  uint64_t v253 = *(void *)(v254 - 8);
  MEMORY[0x270FA5388](v254);
  v259 = (char *)&v236 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921460);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  v252 = (char *)&v236 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v260 = (uint64_t)&v236 - v11;
  uint64_t v305 = sub_26153AE60();
  uint64_t v239 = *(void *)(v305 - 8);
  MEMORY[0x270FA5388](v305);
  v293 = (char *)&v236 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v242 = sub_26153AFA0();
  uint64_t v241 = *(void *)(v242 - 8);
  MEMORY[0x270FA5388](v242);
  v240 = (char *)&v236 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v279 = sub_26153AF80();
  uint64_t v238 = *(void *)(v279 - 8);
  MEMORY[0x270FA5388](v279);
  v237 = (char *)&v236 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v277 = sub_26153AF60();
  v308 = *(char **)(v277 - 8);
  MEMORY[0x270FA5388](v277);
  v270 = (char *)&v236 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v290 = sub_26153AFD0();
  uint64_t v307 = *(void *)(v290 - 8);
  MEMORY[0x270FA5388](v290);
  v278 = (char *)&v236 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921468);
  MEMORY[0x270FA5388](v17 - 8);
  v251 = (char *)&v236 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v258 = sub_26153AD30();
  uint64_t v257 = *(void *)(v258 - 8);
  MEMORY[0x270FA5388](v258);
  v263 = (char *)&v236 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v281 = sub_26153AE00();
  uint64_t v294 = *(void *)(v281 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v281);
  v296 = (char *)&v236 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  v299 = (char *)&v236 - v22;
  uint64_t v309 = sub_26153AD80();
  uint64_t v295 = *(void *)(v309 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v309);
  v301 = (char *)&v236 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  int64_t v27 = (char *)&v236 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v236 - v28;
  uint64_t v271 = sub_26153ACE0();
  v306 = *(char **)(v271 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v271);
  v269 = (char *)&v236 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  v304 = (char *)&v236 - v32;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A921470);
  uint64_t v34 = MEMORY[0x270FA5388](v33 - 8);
  uint64_t v268 = (uint64_t)&v236 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v273 = (uint64_t)&v236 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v303 = (void (**)(char *, uint64_t))((char *)&v236 - v39);
  MEMORY[0x270FA5388](v38);
  uint64_t v261 = (uint64_t)&v236 - v40;
  uint64_t v247 = sub_26153AC50();
  uint64_t v246 = *(void *)(v247 - 8);
  MEMORY[0x270FA5388](v247);
  char v42 = (char *)&v236 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_26153AF10();
  uint64_t v44 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v46 = (char *)&v236 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_26153ACF0();
  uint64_t v48 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v50 = (char *)&v236 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v311 = MEMORY[0x263F8EE88];
  long long v312 = 0u;
  long long v313 = 0u;
  long long v314 = 0u;
  uint64_t v315 = sub_261533728(MEMORY[0x263F8EE78]);
  v316 = v51;
  sub_26153AC10();
  if ((*(unsigned int (**)(char *, uint64_t))(v48 + 88))(v50, v47) != *MEMORY[0x263F057C0])
  {
    swift_release();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v50, v47);
    goto LABEL_161;
  }
  uint64_t v245 = a1;
  (*(void (**)(char *, uint64_t))(v48 + 96))(v50, v47);
  uint64_t v236 = v44;
  uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
  uint64_t v244 = v43;
  v52(v46, v50, v43);
  v272 = v46;
  sub_26153AEF0();
  uint64_t v53 = sub_26153AC30();
  sub_261534C08(&v310, v53, v54);
  swift_bridgeObjectRelease();
  v302 = v42;
  uint64_t v55 = sub_26153AC40();
  if (v56)
  {
    *(void *)&long long v312 = v55;
    *((void *)&v312 + 1) = v56;
  }
  uint64_t v57 = sub_26153AEB0();
  unint64_t v60 = v308;
  uint64_t v59 = v309;
  uint64_t v62 = v305;
  v61 = v306;
  uint64_t v63 = v307;
  uint64_t v64 = v304;
  if (v58)
  {
    sub_261534C08(&v310, v57, v58);
    swift_bridgeObjectRelease();
  }
  v300 = &v315;
  uint64_t v65 = v261;
  sub_26153AEC0();
  v66 = v303;
  sub_26153A044(v65, (uint64_t)v303, &qword_26A921470);
  unint64_t v67 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))*((void *)v61 + 6);
  uint64_t v68 = v271;
  v267 = v61 + 48;
  v266 = v67;
  if (v67((uint64_t)v66, 1, v271) == 1)
  {
    sub_26153A0A8((uint64_t)v66, &qword_26A921470);
  }
  else
  {
    (*((void (**)(char *, void (**)(char *, uint64_t), uint64_t))v61 + 4))(v64, v66, v68);
    uint64_t v70 = sub_26153ACD0();
    if (v71)
    {
      sub_261534C08(&v310, v70, v71);
      swift_bridgeObjectRelease();
    }
    (*((void (**)(char *, uint64_t))v61 + 1))(v64, v68);
  }
  uint64_t v72 = sub_26153AF00();
  uint64_t v73 = *(void *)(v72 + 16);
  if (v73)
  {
    v74 = *(void (**)(char *, unint64_t, uint64_t))(v295 + 16);
    unint64_t v75 = (*(unsigned __int8 *)(v295 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v295 + 80);
    v304 = (char *)v72;
    unint64_t v76 = v72 + v75;
    uint64_t v77 = *(void *)(v295 + 72);
    unint64_t v78 = (void (**)(char *, uint64_t))(v295 + 8);
    v74(v29, v72 + v75, v309);
    while (1)
    {
      uint64_t v79 = sub_26153AD60();
      sub_261534C08(&v310, v79, v80);
      swift_bridgeObjectRelease();
      uint64_t v81 = sub_26153AD70();
      if (v82)
      {
        sub_261534C08(&v310, v81, v82);
        swift_bridgeObjectRelease();
      }
      uint64_t v83 = sub_26153AD50();
      if (v84)
      {
        uint64_t v85 = v83;
        uint64_t v86 = v84;
        sub_261533EE4(v83, v84, v315, v316);
        if (v87) {
          sub_261534108(v85, v86);
        }
        (*v78)(v29, v309);
        swift_bridgeObjectRelease();
      }
      else
      {
        (*v78)(v29, v309);
      }
      v76 += v77;
      if (!--v73) {
        break;
      }
      v74(v29, v76, v309);
    }
    swift_bridgeObjectRelease();
    uint64_t v88 = v302;
    unint64_t v60 = v308;
    uint64_t v59 = v309;
    uint64_t v62 = v305;
    v61 = v306;
    uint64_t v63 = v307;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v88 = v302;
  }
  uint64_t result = sub_26153AE90();
  uint64_t v89 = result;
  uint64_t v289 = *(void *)(result + 16);
  if (v289)
  {
    unint64_t v90 = 0;
    unint64_t v288 = result + ((*(unsigned __int8 *)(v294 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v294 + 80));
    uint64_t v287 = v294 + 16;
    uint64_t v286 = v294 + 88;
    int v285 = *MEMORY[0x263F05B20];
    v284 = (uint64_t (**)(char *, uint64_t))(v294 + 8);
    v280 = (void (**)(char *, uint64_t))(v294 + 96);
    int v276 = *MEMORY[0x263F05B18];
    v265 = (void (**)(char *, char *, uint64_t))(v60 + 32);
    v256 = (void (**)(char *, uint64_t, uint64_t))(v61 + 32);
    v255 = (void (**)(char *, uint64_t))(v61 + 8);
    v264 = (void (**)(char *, uint64_t))(v60 + 8);
    v275 = (void (**)(char *, char *, uint64_t))(v63 + 32);
    v274 = (void (**)(char *, uint64_t))(v63 + 8);
    v303 = (void (**)(char *, uint64_t))(v295 + 8);
    v304 = (char *)(v295 + 16);
    uint64_t v91 = v281;
    uint64_t v283 = result;
    do
    {
      if (v90 >= *(void *)(v89 + 16))
      {
        __break(1u);
LABEL_163:
        __break(1u);
        return result;
      }
      uint64_t v93 = v294;
      uint64_t v94 = *(void *)(v294 + 72);
      unint64_t v297 = v90;
      uint64_t v95 = *(void (**)(char *, unint64_t, uint64_t))(v294 + 16);
      uint64_t v96 = v299;
      v95(v299, v288 + v94 * v90, v91);
      uint64_t v97 = v296;
      v95(v296, (unint64_t)v96, v91);
      int v98 = (*(uint64_t (**)(char *, uint64_t))(v93 + 88))(v97, v91);
      if (v98 == v285)
      {
        (*v280)(v97, v91);
        uint64_t v99 = v278;
        (*v275)(v278, v97, v290);
        uint64_t v100 = sub_26153AFB0();
        if (v101)
        {
          sub_261534C08(&v310, v100, v101);
          swift_bridgeObjectRelease();
        }
        uint64_t v102 = sub_26153AFC0();
        if (v103)
        {
          sub_261534C08(&v310, v102, v103);
          swift_bridgeObjectRelease();
        }
        (*v274)(v99, v290);
      }
      else
      {
        if (v98 != v276)
        {
          uint64_t v116 = *v284;
          (*v284)(v299, v91);
          uint64_t result = v116(v296, v91);
          uint64_t v89 = v283;
          unint64_t v92 = v297;
          goto LABEL_28;
        }
        uint64_t v104 = v296;
        (*v280)(v296, v91);
        v105 = v270;
        (*v265)(v270, v104, v277);
        uint64_t v106 = sub_26153AF20();
        sub_261534C08(&v310, v106, v107);
        swift_bridgeObjectRelease();
        uint64_t v108 = sub_26153AF30();
        if (v109)
        {
          sub_261534C08(&v310, v108, v109);
          swift_bridgeObjectRelease();
        }
        uint64_t v110 = sub_26153AF40();
        uint64_t v112 = v269;
        if (v111)
        {
          sub_261534C08(&v310, v110, v111);
          swift_bridgeObjectRelease();
        }
        uint64_t v113 = v273;
        sub_26153AF50();
        uint64_t v114 = v268;
        sub_26153A044(v113, v268, &qword_26A921470);
        uint64_t v115 = v271;
        if (v266(v114, 1, v271) == 1)
        {
          sub_26153A0A8(v113, &qword_26A921470);
          (*v264)(v105, v277);
          sub_26153A0A8(v114, &qword_26A921470);
        }
        else
        {
          (*v256)(v112, v114, v115);
          uint64_t v117 = sub_26153ACD0();
          if (v118)
          {
            sub_261534C08(&v310, v117, v118);
            swift_bridgeObjectRelease();
          }
          (*v255)(v112, v115);
          sub_26153A0A8(v273, &qword_26A921470);
          (*v264)(v105, v277);
        }
      }
      uint64_t v119 = sub_26153ADF0();
      uint64_t v120 = *(void *)(v119 + 16);
      if (v120)
      {
        uint64_t v121 = 0;
        unint64_t v122 = (*(unsigned __int8 *)(v295 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v295 + 80);
        uint64_t v282 = v119;
        v308 = (char *)(v119 + v122);
        uint64_t v123 = *(void *)(v295 + 72);
        v306 = *(char **)(v295 + 16);
        uint64_t v307 = v123;
        ((void (*)(char *, unint64_t, uint64_t))v306)(v27, v119 + v122, v59);
        while (1)
        {
          uint64_t v124 = sub_26153AD60();
          sub_261534C08(&v310, v124, v125);
          swift_bridgeObjectRelease();
          uint64_t v126 = sub_26153AD70();
          if (v127)
          {
            sub_261534C08(&v310, v126, v127);
            swift_bridgeObjectRelease();
          }
          uint64_t v128 = sub_26153AD50();
          if (!v129)
          {
            (*v303)(v27, v59);
            goto LABEL_50;
          }
          uint64_t v130 = v128;
          uint64_t v131 = v129;
          uint64_t v133 = v315;
          v132 = v316;
          uint64_t v134 = v316[2];
          if (v315)
          {
            swift_retain();
            uint64_t v59 = v309;
            uint64_t v88 = v302;
            sub_2615347E4(v130, v131, (uint64_t)(v132 + 4), v134, (void *)(v133 + 16));
            char v136 = v135;
            swift_release();
            if ((v136 & 1) == 0) {
              goto LABEL_66;
            }
          }
          else if (v134)
          {
            BOOL v137 = v316[4] == v128 && v129 == v316[5];
            if (v137 || (sub_26153B380() & 1) != 0) {
              goto LABEL_66;
            }
            if (v134 != 1)
            {
              if (v132[6] == v130 && v131 == v132[7] || (sub_26153B380() & 1) != 0) {
                goto LABEL_66;
              }
              if (v134 != 2)
              {
                if (v132[8] == v130 && v131 == v132[9] || (sub_26153B380() & 1) != 0) {
                  goto LABEL_66;
                }
                uint64_t v138 = v134 - 3;
                if (v134 != 3)
                {
                  if (v132[10] == v130 && v131 == v132[11] || (sub_26153B380() & 1) != 0) {
                    goto LABEL_66;
                  }
                  uint64_t v139 = v132 + 13;
                  while (--v138)
                  {
                    if (*(v139 - 1) != v130 || v131 != *v139)
                    {
                      v139 += 2;
                      if ((sub_26153B380() & 1) == 0) {
                        continue;
                      }
                    }
                    goto LABEL_66;
                  }
                }
              }
            }
          }
          sub_261534108(v130, v131);
LABEL_66:
          (*v303)(v27, v59);
          swift_bridgeObjectRelease();
LABEL_50:
          uint64_t v62 = v305;
          if (++v121 == v120) {
            break;
          }
          ((void (*)(char *, char *, uint64_t))v306)(v27, &v308[v307 * v121], v59);
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v91 = v281;
      uint64_t v89 = v283;
      unint64_t v92 = v297;
      uint64_t result = (*v284)(v299, v281);
LABEL_28:
      unint64_t v90 = v92 + 1;
    }
    while (v90 != v289);
  }
  swift_bridgeObjectRelease();
  uint64_t v141 = v259;
  uint64_t v142 = (uint64_t)v251;
  sub_26153AED0();
  uint64_t v143 = v257;
  uint64_t v144 = v258;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v257 + 48))(v142, 1, v258) == 1)
  {
    sub_26153A0A8(v142, &qword_26A921468);
    uint64_t v145 = v244;
    uint64_t v146 = (uint64_t)v252;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v143 + 32))(v263, v142, v144);
    uint64_t v147 = sub_26153AD00();
    uint64_t v148 = *(void *)(v147 + 16);
    if (v148)
    {
      uint64_t v149 = v238 + 16;
      uint64_t v150 = *(void (**)(char *, uint64_t, uint64_t))(v238 + 16);
      uint64_t v151 = *(unsigned __int8 *)(v238 + 80);
      v308 = (char *)v147;
      uint64_t v152 = v147 + ((v151 + 32) & ~v151);
      uint64_t v153 = *(void *)(v238 + 72);
      v154 = (void (**)(char *, uint64_t))(v238 + 8);
      uint64_t v155 = v279;
      unint64_t v156 = v237;
      do
      {
        uint64_t v157 = v149;
        v150(v156, v152, v155);
        uint64_t v158 = sub_26153AF70();
        sub_261534C08(&v310, v158, v159);
        uint64_t v155 = v279;
        swift_bridgeObjectRelease();
        (*v154)(v156, v155);
        uint64_t v149 = v157;
        v152 += v153;
        --v148;
      }
      while (v148);
      swift_bridgeObjectRelease();
      uint64_t v141 = v259;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v160 = sub_26153AD20();
    uint64_t v161 = *(void *)(v160 + 16);
    if (v161)
    {
      v162 = (uint64_t *)(v160 + 40);
      do
      {
        uint64_t v163 = *(v162 - 1);
        uint64_t v164 = *v162;
        swift_bridgeObjectRetain();
        sub_261534C08(&v310, v163, v164);
        swift_bridgeObjectRelease();
        v162 += 2;
        --v161;
      }
      while (v161);
    }
    swift_bridgeObjectRelease();
    uint64_t v165 = sub_26153AD10();
    uint64_t v166 = *(void *)(v165 + 16);
    if (v166)
    {
      v167 = *(char **)(v241 + 16);
      uint64_t v168 = *(unsigned __int8 *)(v241 + 80);
      v306 = (char *)v165;
      uint64_t v169 = v165 + ((v168 + 32) & ~v168);
      uint64_t v307 = *(void *)(v241 + 72);
      v308 = v167;
      uint64_t v170 = (void (**)(char *, uint64_t))(v239 + 8);
      uint64_t v171 = (void (**)(char *, uint64_t))(v241 + 8);
      uint64_t v172 = v242;
      uint64_t v173 = v240;
      do
      {
        ((void (*)(char *, uint64_t, uint64_t))v308)(v173, v169, v172);
        sub_26153AF90();
        uint64_t v174 = sub_26153AE50();
        sub_261534C08(&v310, v174, v175);
        v176 = v293;
        swift_bridgeObjectRelease();
        (*v170)(v176, v62);
        (*v171)(v173, v172);
        v169 += v307;
        --v166;
      }
      while (v166);
      swift_bridgeObjectRelease();
      uint64_t v145 = v244;
      uint64_t v59 = v309;
      uint64_t v141 = v259;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v145 = v244;
      uint64_t v59 = v309;
    }
    uint64_t v146 = (uint64_t)v252;
    (*(void (**)(char *, uint64_t))(v257 + 8))(v263, v258);
  }
  uint64_t v177 = v260;
  sub_26153AE80();
  sub_26153A044(v177, v146, &qword_26A921460);
  uint64_t v178 = v253;
  uint64_t v179 = v254;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v253 + 48))(v146, 1, v254) == 1)
  {
    sub_26153A0A8(v146, &qword_26A921460);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v178 + 32))(v141, v146, v179);
    uint64_t v180 = sub_26153ADD0();
    if (v181)
    {
      sub_261534C08(&v310, v180, v181);
      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v178 + 8))(v141, v179);
  }
  uint64_t result = sub_26153AEE0();
  v182 = (char *)result;
  v299 = *(char **)(result + 16);
  if (!v299)
  {
    swift_bridgeObjectRelease();
    uint64_t v214 = (uint64_t)v248;
    goto LABEL_158;
  }
  unint64_t v183 = 0;
  unint64_t v297 = result + ((*(unsigned __int8 *)(v292 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v292 + 80));
  v296 = (char *)(v292 + 16);
  uint64_t v305 = v295 + 16;
  uint64_t v184 = (void (**)(char *, uint64_t))(v295 + 8);
  uint64_t v294 = v292 + 8;
  uint64_t v185 = v291;
  v293 = (char *)result;
  do
  {
    if (v183 >= *((void *)v182 + 2)) {
      goto LABEL_163;
    }
    uint64_t v186 = *(void *)(v292 + 72);
    v304 = (char *)v183;
    (*(void (**)(char *, unint64_t, uint64_t))(v292 + 16))(v185, v297 + v186 * v183, v298);
    uint64_t v187 = sub_26153AC80();
    if (v188)
    {
      sub_261534C08(&v310, v187, v188);
      swift_bridgeObjectRelease();
    }
    uint64_t v189 = sub_26153AC90();
    if (v190)
    {
      sub_261534C08(&v310, v189, v190);
      swift_bridgeObjectRelease();
    }
    uint64_t v191 = (char *)sub_26153ACA0();
    uint64_t v192 = (void (*)(void, void))*((void *)v191 + 2);
    if (v192)
    {
      uint64_t v193 = 0;
      unint64_t v194 = (*(unsigned __int8 *)(v295 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v295 + 80);
      v303 = (void (**)(char *, uint64_t))v191;
      v308 = &v191[v194];
      uint64_t v195 = *(void *)(v295 + 72);
      v306 = *(char **)(v295 + 16);
      uint64_t v307 = v195;
      long long v196 = v301;
      ((void (*)(char *, char *, uint64_t))v306)(v301, &v191[v194], v59);
      while (1)
      {
        uint64_t v197 = sub_26153AD60();
        sub_261534C08(&v310, v197, v198);
        swift_bridgeObjectRelease();
        uint64_t v199 = sub_26153AD70();
        if (v200)
        {
          sub_261534C08(&v310, v199, v200);
          swift_bridgeObjectRelease();
        }
        uint64_t v201 = sub_26153AD50();
        if (!v202)
        {
          (*v184)(v196, v59);
          goto LABEL_119;
        }
        uint64_t v203 = v201;
        uint64_t v204 = v202;
        uint64_t v206 = v315;
        v205 = v316;
        uint64_t v207 = v316[2];
        if (v315)
        {
          swift_retain();
          uint64_t v88 = v302;
          sub_2615347E4(v203, v204, (uint64_t)(v205 + 4), v207, (void *)(v206 + 16));
          char v209 = v208;
          swift_release();
          if ((v209 & 1) == 0) {
            goto LABEL_135;
          }
        }
        else if (v207)
        {
          BOOL v210 = v316[4] == v201 && v202 == v316[5];
          if (v210 || (sub_26153B380() & 1) != 0) {
            goto LABEL_135;
          }
          if (v207 != 1)
          {
            if (v205[6] == v203 && v204 == v205[7] || (sub_26153B380() & 1) != 0) {
              goto LABEL_135;
            }
            if (v207 != 2)
            {
              if (v205[8] == v203 && v204 == v205[9] || (sub_26153B380() & 1) != 0) {
                goto LABEL_135;
              }
              uint64_t v211 = v207 - 3;
              if (v207 != 3)
              {
                if (v205[10] == v203 && v204 == v205[11] || (sub_26153B380() & 1) != 0) {
                  goto LABEL_135;
                }
                v212 = v205 + 13;
                while (--v211)
                {
                  if (*(v212 - 1) != v203 || v204 != *v212)
                  {
                    v212 += 2;
                    if ((sub_26153B380() & 1) == 0) {
                      continue;
                    }
                  }
                  goto LABEL_135;
                }
              }
            }
          }
        }
        sub_261534108(v203, v204);
LABEL_135:
        long long v196 = v301;
        uint64_t v59 = v309;
        (*v184)(v301, v309);
        swift_bridgeObjectRelease();
LABEL_119:
        if ((void (*)(void, void))++v193 == v192)
        {
          swift_bridgeObjectRelease();
          v182 = v293;
          goto LABEL_110;
        }
        ((void (*)(char *, char *, uint64_t))v306)(v196, &v308[v307 * v193], v59);
      }
    }
    swift_bridgeObjectRelease();
LABEL_110:
    unint64_t v183 = (unint64_t)(v304 + 1);
    uint64_t v185 = v291;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))v294)(v291, v298);
  }
  while ((char *)v183 != v299);
  swift_bridgeObjectRelease();
  uint64_t v214 = (uint64_t)v248;
  uint64_t v145 = v244;
LABEL_158:
  v215 = v272;
  sub_26153AEA0();
  uint64_t v216 = v249;
  uint64_t v217 = v250;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v249 + 48))(v214, 1, v250) == 1)
  {
    swift_release();
    sub_26153A0A8(v260, &qword_26A921460);
    sub_26153A0A8(v261, &qword_26A921470);
    (*(void (**)(char *, uint64_t))(v246 + 8))(v88, v247);
    (*(void (**)(char *, uint64_t))(v236 + 8))(v215, v145);
    uint64_t result = sub_26153A0A8(v214, &qword_26A921458);
  }
  else
  {
    v218 = v243;
    (*(void (**)(char *, uint64_t, uint64_t))(v216 + 32))(v243, v214, v217);
    uint64_t v219 = v217;
    uint64_t v220 = v145;
    uint64_t v221 = v216;
    uint64_t v222 = sub_26153AD90();
    sub_261534C08(&v310, v222, v223);
    swift_bridgeObjectRelease();
    uint64_t v224 = sub_26153ADB0();
    uint64_t v226 = v225;
    swift_bridgeObjectRelease();
    *(void *)&long long v313 = v224;
    *((void *)&v313 + 1) = v226;
    uint64_t v227 = sub_26153ADA0();
    uint64_t v229 = v228;
    swift_release();
    (*(void (**)(char *, uint64_t))(v221 + 8))(v218, v219);
    sub_26153A0A8(v260, &qword_26A921460);
    sub_26153A0A8(v261, &qword_26A921470);
    (*(void (**)(char *, uint64_t))(v246 + 8))(v88, v247);
    (*(void (**)(char *, uint64_t))(v236 + 8))(v215, v220);
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)&long long v314 = v227;
    *((void *)&v314 + 1) = v229;
  }
LABEL_161:
  v230 = v262;
  uint64_t v231 = v315;
  v232 = v316;
  long long v233 = v312;
  long long v234 = v313;
  long long v235 = v314;
  void *v262 = v311;
  *(_OWORD *)(v230 + 1) = v233;
  *(_OWORD *)(v230 + 3) = v234;
  *(_OWORD *)(v230 + 5) = v235;
  v230[7] = v231;
  v230[8] = v232;
  return result;
}

uint64_t sub_261539758(void *a1, uint64_t a2)
{
  uint64_t v3 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a2 + 56);
  int64_t v36 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v39)
  {
    if (v5)
    {
      uint64_t v38 = (v5 - 1) & v5;
      int64_t v39 = i;
      unint64_t v8 = __clz(__rbit64(v5)) | (i << 6);
    }
    else
    {
      int64_t v9 = i + 1;
      if (__OFADD__(i, 1)) {
        goto LABEL_38;
      }
      if (v9 >= v36)
      {
LABEL_35:
        swift_release();
        return (uint64_t)a1;
      }
      unint64_t v10 = *(void *)(v35 + 8 * v9);
      int64_t v11 = i + 1;
      if (!v10)
      {
        int64_t v11 = i + 2;
        if (i + 2 >= v36) {
          goto LABEL_35;
        }
        unint64_t v10 = *(void *)(v35 + 8 * v11);
        if (!v10)
        {
          int64_t v11 = i + 3;
          if (i + 3 >= v36) {
            goto LABEL_35;
          }
          unint64_t v10 = *(void *)(v35 + 8 * v11);
          if (!v10)
          {
            int64_t v11 = i + 4;
            if (i + 4 >= v36) {
              goto LABEL_35;
            }
            unint64_t v10 = *(void *)(v35 + 8 * v11);
            if (!v10)
            {
              uint64_t v12 = i + 5;
              if (i + 5 >= v36) {
                goto LABEL_35;
              }
              unint64_t v10 = *(void *)(v35 + 8 * v12);
              if (!v10)
              {
                while (1)
                {
                  int64_t v11 = v12 + 1;
                  if (__OFADD__(v12, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v36) {
                    goto LABEL_35;
                  }
                  unint64_t v10 = *(void *)(v35 + 8 * v11);
                  ++v12;
                  if (v10) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = i + 5;
            }
          }
        }
      }
LABEL_23:
      uint64_t v38 = (v10 - 1) & v10;
      int64_t v39 = v11;
      unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
    }
    uint64_t v13 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v8);
    uint64_t v15 = *v13;
    uint64_t v14 = v13[1];
    swift_bridgeObjectRetain_n();
    uint64_t v16 = (void *)sub_26153ABE0();
    uint64_t v17 = sub_26153ACC0();
    uint64_t v19 = v18;

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v22 = sub_261535698(v15, v14);
    uint64_t v23 = a1[2];
    BOOL v24 = (v21 & 1) == 0;
    uint64_t v25 = v23 + v24;
    if (__OFADD__(v23, v24)) {
      break;
    }
    char v26 = v21;
    if (a1[3] >= v25)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v21) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_261536608();
        if (v26) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_261535AF8(v25, isUniquelyReferenced_nonNull_native);
      unint64_t v27 = sub_261535698(v15, v14);
      if ((v26 & 1) != (v28 & 1)) {
        goto LABEL_40;
      }
      unint64_t v22 = v27;
      if (v26)
      {
LABEL_4:
        uint64_t v7 = (uint64_t *)(a1[7] + 16 * v22);
        swift_bridgeObjectRelease();
        *uint64_t v7 = v17;
        v7[1] = v19;
        goto LABEL_5;
      }
    }
    a1[(v22 >> 6) + 8] |= 1 << v22;
    uint64_t v29 = (uint64_t *)(a1[6] + 16 * v22);
    *uint64_t v29 = v15;
    v29[1] = v14;
    uint64_t v30 = (uint64_t *)(a1[7] + 16 * v22);
    *uint64_t v30 = v17;
    v30[1] = v19;
    uint64_t v31 = a1[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_37;
    }
    a1[2] = v33;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    unint64_t v5 = v38;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  uint64_t result = sub_26153B3B0();
  __break(1u);
  return result;
}

uint64_t sub_261539A78()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_261539AC0(uint64_t a1)
{
  uint64_t v2 = _s13ThumbnailInfoVMa();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v24 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9213F8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (uint64_t *)((char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v28 = 0;
  uint64_t v29 = (void *)MEMORY[0x263F8EE78];
  uint64_t v14 = *(void *)(a1 + 16);
  sub_261536894(v14, 0);
  uint64_t v27 = v13;
  sub_2615344EC(0, v14, 0);
  if (!v14) {
    return v28;
  }
  uint64_t v26 = (uint64_t)v12 + *(int *)(v9 + 48);
  uint64_t v15 = a1 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  uint64_t v16 = *(void *)(v10 + 72);
  uint64_t v24 = a1;
  uint64_t v25 = v16;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_26153A044(v15, (uint64_t)v12, &qword_26A9213F8);
    uint64_t v18 = *v12;
    uint64_t v17 = v12[1];
    sub_261539EB8(v26, (uint64_t)v8);
    uint64_t result = sub_261533EE4(v18, v17, v28, v29);
    if ((v20 & 1) == 0) {
      break;
    }
    sub_261534108(v18, v17);
    sub_261539F78((uint64_t)v8, (uint64_t)v6);
    uint64_t v21 = v27;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2615344EC(0, *(void *)(v21 + 16) + 1, 1);
      uint64_t v21 = v27;
    }
    unint64_t v23 = *(void *)(v21 + 16);
    unint64_t v22 = *(void *)(v21 + 24);
    if (v23 >= v22 >> 1)
    {
      sub_2615344EC(v22 > 1, v23 + 1, 1);
      uint64_t v21 = v27;
    }
    *(void *)(v21 + 16) = v23 + 1;
    sub_261539EB8((uint64_t)v6, v21+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v23);
    sub_261539F1C((uint64_t)v8);
    swift_bridgeObjectRelease();
    v15 += v25;
    if (!--v14)
    {
      swift_bridgeObjectRelease();
      return v28;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_261539D88(uint64_t a1)
{
  return a1;
}

uint64_t sub_261539DB4(uint64_t a1)
{
  return a1;
}

uint64_t sub_261539DE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_261539E44(uint64_t a1)
{
  return a1;
}

uint64_t sub_261539EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s13ThumbnailInfoVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_261539F1C(uint64_t a1)
{
  uint64_t v2 = _s13ThumbnailInfoVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_261539F78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s13ThumbnailInfoVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_261539FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s13ThumbnailInfoVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_26153A044(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_26153A0A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_26153A104(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_26153B010();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
  }
  return a1;
}

uint64_t sub_26153A1D8(uint64_t a1)
{
  uint64_t v2 = sub_26153B010();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_26153A23C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_26153B010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t sub_26153A2C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_26153B010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_26153A348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_26153B010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t sub_26153A3CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_26153B010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t sub_26153A450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_26153A464);
}

uint64_t sub_26153A464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_26153B010();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_26153A534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_26153A548);
}

uint64_t sub_26153A548(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_26153B010();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  }
  return result;
}

uint64_t sub_26153A604()
{
  uint64_t result = sub_26153B010();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for OrderPackageValidator()
{
  return &type metadata for OrderPackageValidator;
}

uint64_t sub_26153A6B8@<X0>(uint64_t a1@<X8>)
{
  return sub_261533328(a1);
}

uint64_t WalletBlastDoorClient.__allocating_init()()
{
  uint64_t v0 = sub_26153B2F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_26153B2E0();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_26153B100();
  MEMORY[0x270FA5388](v5 - 8);
  v10[1] = sub_26153B130();
  uint64_t v6 = (void *)*MEMORY[0x263F2B8C0];
  sub_26153A960();
  id v7 = v6;
  sub_26153B0F0();
  v10[3] = MEMORY[0x263F8EE78];
  sub_26153AAF4(&qword_26A921498, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9214A0);
  sub_26153A9A0();
  sub_26153B310();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  sub_26153B300();
  uint64_t v8 = sub_26153B110();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v8;
  return result;
}

unint64_t sub_26153A960()
{
  unint64_t result = qword_26A921490;
  if (!qword_26A921490)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A921490);
  }
  return result;
}

unint64_t sub_26153A9A0()
{
  unint64_t result = qword_26A9214A8;
  if (!qword_26A9214A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9214A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9214A8);
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

uint64_t WalletBlastDoorClient.unpackOrderPreview(from:with:)()
{
  return sub_26153B120();
}

uint64_t sub_26153AAF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t WalletBlastDoorClient.deinit()
{
  swift_release();
  return v0;
}

uint64_t WalletBlastDoorClient.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for WalletBlastDoorClient()
{
  return self;
}

uint64_t method lookup function for WalletBlastDoorClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WalletBlastDoorClient);
}

uint64_t sub_26153ABD0()
{
  return MEMORY[0x270EEC1D8]();
}

uint64_t sub_26153ABE0()
{
  return MEMORY[0x270EEC1E0]();
}

uint64_t sub_26153ABF0()
{
  return MEMORY[0x270EEC1E8]();
}

uint64_t sub_26153AC00()
{
  return MEMORY[0x270EEC1F8]();
}

uint64_t sub_26153AC10()
{
  return MEMORY[0x270EEC200]();
}

uint64_t sub_26153AC20()
{
  return MEMORY[0x270EEC208]();
}

uint64_t sub_26153AC30()
{
  return MEMORY[0x270EEC228]();
}

uint64_t sub_26153AC40()
{
  return MEMORY[0x270EEC250]();
}

uint64_t sub_26153AC50()
{
  return MEMORY[0x270EEC258]();
}

uint64_t sub_26153AC60()
{
  return MEMORY[0x270EEC3F8]();
}

uint64_t sub_26153AC70()
{
  return MEMORY[0x270EEC408]();
}

uint64_t sub_26153AC80()
{
  return MEMORY[0x270EEC478]();
}

uint64_t sub_26153AC90()
{
  return MEMORY[0x270EEC480]();
}

uint64_t sub_26153ACA0()
{
  return MEMORY[0x270EEC498]();
}

uint64_t sub_26153ACB0()
{
  return MEMORY[0x270EEC4A0]();
}

uint64_t sub_26153ACC0()
{
  return MEMORY[0x270EEC598]();
}

uint64_t sub_26153ACD0()
{
  return MEMORY[0x270EEC5A0]();
}

uint64_t sub_26153ACE0()
{
  return MEMORY[0x270EEC5A8]();
}

uint64_t sub_26153ACF0()
{
  return MEMORY[0x270EEC5C8]();
}

uint64_t sub_26153AD00()
{
  return MEMORY[0x270EEC5D0]();
}

uint64_t sub_26153AD10()
{
  return MEMORY[0x270EEC5D8]();
}

uint64_t sub_26153AD20()
{
  return MEMORY[0x270EEC5E0]();
}

uint64_t sub_26153AD30()
{
  return MEMORY[0x270EEC5F0]();
}

uint64_t sub_26153AD40()
{
  return MEMORY[0x270EEC670]();
}

uint64_t sub_26153AD50()
{
  return MEMORY[0x270EEC690]();
}

uint64_t sub_26153AD60()
{
  return MEMORY[0x270EEC6A0]();
}

uint64_t sub_26153AD70()
{
  return MEMORY[0x270EEC6B0]();
}

uint64_t sub_26153AD80()
{
  return MEMORY[0x270EEC6B8]();
}

uint64_t sub_26153AD90()
{
  return MEMORY[0x270EEC6C0]();
}

uint64_t sub_26153ADA0()
{
  return MEMORY[0x270EEC6C8]();
}

uint64_t sub_26153ADB0()
{
  return MEMORY[0x270EEC6D0]();
}

uint64_t sub_26153ADC0()
{
  return MEMORY[0x270EEC6D8]();
}

uint64_t sub_26153ADD0()
{
  return MEMORY[0x270EEC900]();
}

uint64_t sub_26153ADE0()
{
  return MEMORY[0x270EEC908]();
}

uint64_t sub_26153ADF0()
{
  return MEMORY[0x270EECA98]();
}

uint64_t sub_26153AE00()
{
  return MEMORY[0x270EECAA0]();
}

uint64_t sub_26153AE10()
{
  return MEMORY[0x270EECAD8]();
}

uint64_t sub_26153AE20()
{
  return MEMORY[0x270EECAE0]();
}

uint64_t sub_26153AE30()
{
  return MEMORY[0x270EECAE8]();
}

uint64_t sub_26153AE40()
{
  return MEMORY[0x270EECAF0]();
}

uint64_t sub_26153AE50()
{
  return MEMORY[0x270EECBF0]();
}

uint64_t sub_26153AE60()
{
  return MEMORY[0x270EECBF8]();
}

uint64_t sub_26153AE70()
{
  return MEMORY[0x270EECC50]();
}

uint64_t sub_26153AE80()
{
  return MEMORY[0x270EECE70]();
}

uint64_t sub_26153AE90()
{
  return MEMORY[0x270EECE80]();
}

uint64_t sub_26153AEA0()
{
  return MEMORY[0x270EECE88]();
}

uint64_t sub_26153AEB0()
{
  return MEMORY[0x270EECE90]();
}

uint64_t sub_26153AEC0()
{
  return MEMORY[0x270EECEB8]();
}

uint64_t sub_26153AED0()
{
  return MEMORY[0x270EECEC0]();
}

uint64_t sub_26153AEE0()
{
  return MEMORY[0x270EECEC8]();
}

uint64_t sub_26153AEF0()
{
  return MEMORY[0x270EECED8]();
}

uint64_t sub_26153AF00()
{
  return MEMORY[0x270EECEE8]();
}

uint64_t sub_26153AF10()
{
  return MEMORY[0x270EECEF0]();
}

uint64_t sub_26153AF20()
{
  return MEMORY[0x270EECF38]();
}

uint64_t sub_26153AF30()
{
  return MEMORY[0x270EECF48]();
}

uint64_t sub_26153AF40()
{
  return MEMORY[0x270EECF58]();
}

uint64_t sub_26153AF50()
{
  return MEMORY[0x270EECF70]();
}

uint64_t sub_26153AF60()
{
  return MEMORY[0x270EECF80]();
}

uint64_t sub_26153AF70()
{
  return MEMORY[0x270EED160]();
}

uint64_t sub_26153AF80()
{
  return MEMORY[0x270EED168]();
}

uint64_t sub_26153AF90()
{
  return MEMORY[0x270EED170]();
}

uint64_t sub_26153AFA0()
{
  return MEMORY[0x270EED178]();
}

uint64_t sub_26153AFB0()
{
  return MEMORY[0x270EED1E8]();
}

uint64_t sub_26153AFC0()
{
  return MEMORY[0x270EED1F0]();
}

uint64_t sub_26153AFD0()
{
  return MEMORY[0x270EED210]();
}

uint64_t sub_26153AFE0()
{
  return MEMORY[0x270EED3F8]();
}

uint64_t sub_26153AFF0()
{
  return MEMORY[0x270EED400]();
}

uint64_t sub_26153B000()
{
  return MEMORY[0x270EED408]();
}

uint64_t sub_26153B010()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_26153B020()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_26153B030()
{
  return MEMORY[0x270F10CA8]();
}

uint64_t sub_26153B040()
{
  return MEMORY[0x270F18140]();
}

uint64_t sub_26153B050()
{
  return MEMORY[0x270F18148]();
}

uint64_t sub_26153B060()
{
  return MEMORY[0x270F18150]();
}

uint64_t sub_26153B070()
{
  return MEMORY[0x270F18158]();
}

uint64_t sub_26153B080()
{
  return MEMORY[0x270F18160]();
}

uint64_t sub_26153B090()
{
  return MEMORY[0x270F18168]();
}

uint64_t sub_26153B0A0()
{
  return MEMORY[0x270F18170]();
}

uint64_t sub_26153B0B0()
{
  return MEMORY[0x270F18178]();
}

uint64_t sub_26153B0C0()
{
  return MEMORY[0x270F18180]();
}

uint64_t sub_26153B0D0()
{
  return MEMORY[0x270F18188]();
}

uint64_t sub_26153B0E0()
{
  return MEMORY[0x270F18190]();
}

uint64_t sub_26153B0F0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_26153B100()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_26153B110()
{
  return MEMORY[0x270F10CB8]();
}

uint64_t sub_26153B120()
{
  return MEMORY[0x270F10CD0]();
}

uint64_t sub_26153B130()
{
  return MEMORY[0x270F10CE8]();
}

uint64_t sub_26153B140()
{
  return MEMORY[0x270F10EA8]();
}

uint64_t sub_26153B150()
{
  return MEMORY[0x270F11298]();
}

uint64_t sub_26153B160()
{
  return MEMORY[0x270F112A0]();
}

uint64_t sub_26153B170()
{
  return MEMORY[0x270F112A8]();
}

uint64_t sub_26153B180()
{
  return MEMORY[0x270F112B0]();
}

uint64_t sub_26153B190()
{
  return MEMORY[0x270F112B8]();
}

uint64_t sub_26153B1A0()
{
  return MEMORY[0x270F112C0]();
}

uint64_t sub_26153B1B0()
{
  return MEMORY[0x270F112C8]();
}

uint64_t sub_26153B1C0()
{
  return MEMORY[0x270F112D0]();
}

uint64_t sub_26153B1D0()
{
  return MEMORY[0x270F112D8]();
}

uint64_t sub_26153B1E0()
{
  return MEMORY[0x270F11B08]();
}

uint64_t sub_26153B1F0()
{
  return MEMORY[0x270F11B18]();
}

uint64_t sub_26153B200()
{
  return MEMORY[0x270F11B20]();
}

uint64_t sub_26153B210()
{
  return MEMORY[0x270F11B28]();
}

uint64_t sub_26153B220()
{
  return MEMORY[0x270F11B38]();
}

uint64_t sub_26153B230()
{
  return MEMORY[0x270F11B40]();
}

uint64_t sub_26153B240()
{
  return MEMORY[0x270F11B48]();
}

uint64_t sub_26153B250()
{
  return MEMORY[0x270F11B50]();
}

uint64_t sub_26153B260()
{
  return MEMORY[0x270F11B58]();
}

uint64_t sub_26153B270()
{
  return MEMORY[0x270F11B68]();
}

uint64_t sub_26153B280()
{
  return MEMORY[0x270F11B70]();
}

uint64_t sub_26153B290()
{
  return MEMORY[0x270F11B78]();
}

uint64_t sub_26153B2A0()
{
  return MEMORY[0x270F12660]();
}

uint64_t sub_26153B2B0()
{
  return MEMORY[0x270F12688]();
}

uint64_t sub_26153B2C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_26153B2D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_26153B2E0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_26153B2F0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_26153B300()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_26153B310()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_26153B320()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_26153B330()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_26153B340()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_26153B350()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_26153B360()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_26153B370()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_26153B380()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_26153B390()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_26153B3A0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_26153B3B0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_26153B3C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_26153B3D0()
{
  return MEMORY[0x270F9FC90]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}