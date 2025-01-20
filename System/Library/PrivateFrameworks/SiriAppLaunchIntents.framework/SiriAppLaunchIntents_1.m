void sub_23780FB18()
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
  unint64_t v22;
  objc_class *ObjCClassFromMetadata;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (**v27)(uint64_t, uint64_t);
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  char v54;
  char v55;
  void v56[2];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (**v62)(uint64_t, uint64_t, uint64_t);
  Class v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;

  OUTLINED_FUNCTION_23_0();
  v3 = v2;
  v56[1] = v4;
  v5 = sub_237859840();
  OUTLINED_FUNCTION_1_2();
  v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_62();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926E60);
  v10 = OUTLINED_FUNCTION_2_0(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_28_6();
  v65 = sub_23785B5A0();
  v11 = OUTLINED_FUNCTION_0_4(v65);
  v60 = v12;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_36_0();
  v64 = v13;
  OUTLINED_FUNCTION_45_2();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_17_13();
  v59 = v15;
  v16 = sub_237859430();
  OUTLINED_FUNCTION_1_2();
  v18 = v17;
  MEMORY[0x270FA5388](v19);
  v56[0] = (char *)v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(void *)(v3 + 16);
  v22 = MEMORY[0x263F8EE78];
  v61 = v0;
  if (v21)
  {
    v57 = v18;
    v58 = v16;
    v66 = MEMORY[0x263F8EE78];
    sub_23785BC10();
    type metadata accessor for Application();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    v24 = v7 + 16;
    v62 = *(void (***)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v63 = ObjCClassFromMetadata;
    v25 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v26 = *(void *)(v24 + 56);
    v27 = (void (**)(uint64_t, uint64_t))(v24 - 8);
    do
    {
      ((void (*)(uint64_t, uint64_t, uint64_t))v62)(v1, v25, v5);
      v28 = objc_allocWithZone(v63);
      v29 = sub_2377C6888(0, 0);
      v30 = sub_237859830();
      sub_2377E7F7C(v30, v31, v29, (SEL *)&selRef_setAppId_);
      v32 = sub_237859810();
      sub_2377E7F7C(v32, v33, v29, (SEL *)&selRef_setName_);
      (*v27)(v1, v5);
      sub_23785BBF0();
      sub_23785BC20();
      sub_23785BC30();
      sub_23785BC00();
      v25 += v26;
      --v21;
    }
    while (v21);
    v22 = v66;
    v0 = v61;
    v18 = v57;
    v16 = v58;
  }
  sub_23785A270();
  v34 = v56[0];
  sub_237859420();
  v35 = sub_237859410();
  v37 = v36;
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v34, v16);
  v56[0] = v56;
  if (v22 >> 62) {
    goto LABEL_22;
  }
  v38 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  for (; v38; v38 = sub_23785BCC0())
  {
    v62 = (void (**)(uint64_t, uint64_t, uint64_t))(v60 + 32);
    v63 = (Class)(v22 & 0xC000000000000001);
    v39 = MEMORY[0x263F8EE78];
    v40 = 4;
    v57 = v37;
    v58 = v35;
    while (1)
    {
      v41 = v63 ? (id)MEMORY[0x237E22750](v40 - 4, v22) : *(id *)(v22 + 8 * v40);
      v42 = v41;
      v43 = v40 - 3;
      if (__OFADD__(v40 - 4, 1)) {
        break;
      }
      sub_2378126B8();

      v44 = v65;
      if (__swift_getEnumTagSinglePayload(v0, 1, v65) == 1)
      {
        sub_2377F2F88(v0, &qword_268926E60);
      }
      else
      {
        v45 = v22;
        v46 = *v62;
        v47 = v59;
        (*v62)(v59, v0, v44);
        v46(v64, v47, v44);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v52 = OUTLINED_FUNCTION_22_8();
          v39 = sub_23780453C(v52, v53, v54, v39);
        }
        v49 = *(void *)(v39 + 16);
        v48 = *(void *)(v39 + 24);
        if (v49 >= v48 >> 1)
        {
          v55 = OUTLINED_FUNCTION_33_6(v48);
          v39 = sub_23780453C(v55, v49 + 1, 1, v39);
        }
        *(void *)(v39 + 16) = v49 + 1;
        OUTLINED_FUNCTION_31_7();
        v46(v39 + v50 + *(void *)(v51 + 72) * v49, v64, v44);
        v0 = v61;
        v22 = v45;
        v37 = v57;
        v35 = v58;
      }
      ++v40;
      if (v43 == v38) {
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain_n();
  }
LABEL_23:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  sub_23785A1D0();
  OUTLINED_FUNCTION_18_3();
}

void sub_23780FFD0()
{
  OUTLINED_FUNCTION_23_0();
  int v143 = v0;
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926E60);
  uint64_t v6 = OUTLINED_FUNCTION_2_0(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_4();
  v159 = v7;
  OUTLINED_FUNCTION_26_1();
  v8 = (void (**)(void, void, void))sub_23785B5A0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v157 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_36_0();
  uint64_t v161 = v11;
  OUTLINED_FUNCTION_45_2();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_17_13();
  uint64_t v154 = v13;
  OUTLINED_FUNCTION_26_1();
  uint64_t v151 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_36_0();
  uint64_t v137 = v17;
  OUTLINED_FUNCTION_45_2();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_26_4();
  uint64_t v148 = v19;
  OUTLINED_FUNCTION_45_2();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_17_13();
  uint64_t v147 = v21;
  uint64_t v146 = sub_237859430();
  OUTLINED_FUNCTION_1_2();
  uint64_t v145 = v22;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_1_4();
  uint64_t v144 = v24;
  OUTLINED_FUNCTION_26_1();
  uint64_t v25 = sub_23785A280();
  OUTLINED_FUNCTION_1_2();
  uint64_t v27 = v26;
  MEMORY[0x270FA5388](v28);
  v30 = (char *)&v137 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v162 = (void *)sub_23785A0C0();
  OUTLINED_FUNCTION_1_2();
  unint64_t v164 = v31;
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_1_4();
  uint64_t v163 = v33;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927FC0);
  uint64_t v35 = OUTLINED_FUNCTION_2_0(v34);
  MEMORY[0x270FA5388](v35);
  v37 = (char *)&v137 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_23785A060();
  OUTLINED_FUNCTION_1_2();
  uint64_t v158 = v39;
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_12_1();
  uint64_t v43 = v41 - v42;
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_17_13();
  uint64_t v155 = v45;
  OUTLINED_FUNCTION_26_1();
  uint64_t v142 = sub_23785A540();
  OUTLINED_FUNCTION_1_2();
  uint64_t v141 = v46;
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_1_4();
  uint64_t v149 = v48;
  unint64_t v150 = v2 >> 62;
  uint64_t v156 = v43;
  v153 = v30;
  if (v2 >> 62) {
    goto LABEL_69;
  }
  uint64_t v49 = v25;
  v50 = v8;
  uint64_t v51 = v27;
  uint64_t v52 = v15;
  uint64_t v53 = v4;
  uint64_t v54 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v55 = v54;
  uint64_t v4 = v53;
  uint64_t v15 = v52;
  uint64_t v27 = v51;
  v8 = v50;
  uint64_t v25 = v49;
  while (1)
  {
    uint64_t v152 = v15;
    v165 = v8;
    v166 = (id *)v2;
    uint64_t v140 = v4;
    uint64_t v139 = v25;
    uint64_t v138 = v27;
    if (v55)
    {
      if (v55 < 1)
      {
        __break(1u);
LABEL_71:
        __break(1u);
        return;
      }
      uint64_t v56 = 0;
      v160 = (uint64_t *)(v2 & 0xC000000000000001);
      v57 = (void (**)(void))(v158 + 32);
      v58 = (void *)MEMORY[0x263F8EE78];
      do
      {
        uint64_t v59 = v55;
        if (v160) {
          id v60 = (id)MEMORY[0x237E22750](v56, v2);
        }
        else {
          id v60 = *(id *)(v2 + 8 * v56 + 32);
        }
        v61 = v60;
        v168[0] = v60;
        sub_237811450(v168, (uint64_t)v37);

        if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38) == 1)
        {
          sub_2377F2F88((uint64_t)v37, &qword_268927FC0);
        }
        else
        {
          v62 = *v57;
          OUTLINED_FUNCTION_29_7();
          v62();
          OUTLINED_FUNCTION_29_7();
          v62();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            char v65 = OUTLINED_FUNCTION_22_8();
            v58 = (void *)sub_2378043AC(v65, v66, v67, (uint64_t)v58);
          }
          unint64_t v64 = v58[2];
          unint64_t v63 = v58[3];
          if (v64 >= v63 >> 1)
          {
            char v68 = OUTLINED_FUNCTION_33_6(v63);
            v58 = (void *)sub_2378043AC(v68, v64 + 1, 1, (uint64_t)v58);
          }
          v58[2] = v64 + 1;
          OUTLINED_FUNCTION_31_7();
          OUTLINED_FUNCTION_29_7();
          v62();
          unint64_t v2 = (unint64_t)v166;
        }
        ++v56;
        uint64_t v55 = v59;
      }
      while (v59 != v56);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v58 = (void *)MEMORY[0x263F8EE78];
    }
    if (qword_268926770 != -1) {
      swift_once();
    }
    sub_23785A990();
    sub_23785A520();
    if (v150)
    {
      OUTLINED_FUNCTION_33_7();
      uint64_t v69 = sub_23785BCC0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v69 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v69)
    {
      v168[0] = (void *)MEMORY[0x263F8EE78];
      sub_2377EDB64(0, v69 & ~(v69 >> 63), 0);
      if (v69 < 0) {
        goto LABEL_71;
      }
      uint64_t v70 = 0;
      v71 = v168[0];
      do
      {
        if ((v2 & 0xC000000000000001) != 0) {
          id v72 = (id)MEMORY[0x237E22750](v70, v166);
        }
        else {
          id v72 = v166[v70 + 4];
        }
        v73 = v72;
        sub_23778BEE8(v72);
        if (qword_268926768 != -1) {
          swift_once();
        }
        sub_23785A990();
        OUTLINED_FUNCTION_30_6();
        uint64_t v74 = v163;
        sub_23785A090();

        v168[0] = v71;
        unint64_t v76 = v71[2];
        unint64_t v75 = v71[3];
        if (v76 >= v75 >> 1)
        {
          char v80 = OUTLINED_FUNCTION_33_6(v75);
          sub_2377EDB64(v80, v76 + 1, 1);
          uint64_t v74 = v163;
          v71 = v168[0];
        }
        ++v70;
        v71[2] = v76 + 1;
        OUTLINED_FUNCTION_32_3();
        (*(void (**)(unint64_t, uint64_t, void *))(v79 + 32))(v77 + v78 * v76, v74, v162);
      }
      while (v69 != v70);
      unint64_t v2 = (unint64_t)v166;
    }
    char v81 = v143 & 1;
    uint64_t v82 = sub_23785A530();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_5_2();
    v83();
    v168[0] = v58;
    sub_237831468(v82);
    v84 = v168[0];
    sub_237811998();
    swift_bridgeObjectRetain();
    v162 = v84;
    sub_23785A1E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268927FB8);
    uint64_t v85 = sub_23785A860();
    OUTLINED_FUNCTION_0_4(v85);
    OUTLINED_FUNCTION_35_5();
    uint64_t v86 = swift_allocObject();
    *(_OWORD *)(v86 + 16) = xmmword_23785CD50;
    sub_237811A0C(v2, v81, (uint64_t)v84 + v86);
    sub_23785A200();
    sub_237859420();
    uint64_t v87 = sub_237859410();
    uint64_t v15 = v88;
    OUTLINED_FUNCTION_5_2();
    v89();
    v160 = &v137;
    uint64_t v163 = v87;
    if (v150)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v38 = sub_23785BCC0();
    }
    else
    {
      uint64_t v38 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
    }
    v37 = v159;
    if (!v38) {
      break;
    }
    unint64_t v164 = v2 & 0xC000000000000001;
    v8 = (void (**)(void, void, void))(v157 + 32);
    uint64_t v25 = MEMORY[0x263F8EE78];
    uint64_t v4 = 4;
    while (1)
    {
      id v90 = v164 ? (id)MEMORY[0x237E22750](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      unint64_t v2 = (unint64_t)v90;
      uint64_t v27 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      sub_2378126B8();

      uint64_t v91 = (uint64_t)v165;
      if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, (uint64_t)v165) == 1)
      {
        sub_2377F2F88((uint64_t)v37, &qword_268926E60);
      }
      else
      {
        uint64_t v92 = v15;
        v93 = *v8;
        uint64_t v94 = v154;
        (*v8)(v154, v37, v91);
        v93(v161, v94, v91);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          char v99 = OUTLINED_FUNCTION_22_8();
          uint64_t v25 = sub_23780453C(v99, v100, v101, v25);
        }
        unint64_t v96 = *(void *)(v25 + 16);
        unint64_t v95 = *(void *)(v25 + 24);
        uint64_t v15 = v92;
        if (v96 >= v95 >> 1)
        {
          char v102 = OUTLINED_FUNCTION_33_6(v95);
          uint64_t v25 = sub_23780453C(v102, v96 + 1, 1, v25);
        }
        *(void *)(v25 + 16) = v96 + 1;
        OUTLINED_FUNCTION_31_7();
        v93(v25 + v97 + *(void *)(v98 + 72) * v96, v161, (uint64_t)v165);
        v37 = v159;
      }
      ++v4;
      unint64_t v2 = (unint64_t)v166;
      if (v27 == v38) {
        goto LABEL_53;
      }
    }
    __break(1u);
LABEL_69:
    OUTLINED_FUNCTION_33_7();
    uint64_t v55 = sub_23785BCC0();
  }
LABEL_53:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  sub_23785A1D0();
  if (qword_268926828 != -1) {
    swift_once();
  }
  uint64_t v103 = v151;
  uint64_t v104 = __swift_project_value_buffer(v151, (uint64_t)qword_268928D70);
  uint64_t v105 = v152;
  v166 = *(id **)(v152 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v166)(v147, v104, v103);
  swift_bridgeObjectRetain();
  v106 = sub_23785B490();
  os_log_type_t v107 = sub_23785B8A0();
  BOOL v108 = os_log_type_enabled(v106, v107);
  v165 = (void (**)(void, void, void))v104;
  if (v108)
  {
    v109 = (_DWORD *)OUTLINED_FUNCTION_48_0();
    v168[0] = (void *)OUTLINED_FUNCTION_36_2();
    _DWORD *v109 = 136315138;
    uint64_t v110 = sub_2377C31D0((uint64_t)v162);
    uint64_t v112 = sub_2377C6A68(v110, v111, (uint64_t *)v168);
    OUTLINED_FUNCTION_19_3(v112);
    sub_23785B9E0();
    uint64_t v103 = v151;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_25_6(&dword_237778000, v106, v113, "DisplayHints for app disambiguation: %s");
    swift_arrayDestroy();
    uint64_t v104 = (uint64_t)v165;
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();

    v114 = *(void (**)(void))(v152 + 8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v114 = *(void (**)(void))(v105 + 8);
  }
  OUTLINED_FUNCTION_2_4();
  v114();
  LOBYTE(v115) = v148;
  ((void (*)(uint64_t, uint64_t, uint64_t))v166)(v148, v104, v103);
  v116 = sub_23785B490();
  os_log_type_t v117 = sub_23785B8A0();
  if (os_log_type_enabled(v116, v117))
  {
    v115 = (_DWORD *)OUTLINED_FUNCTION_48_0();
    uint64_t v167 = OUTLINED_FUNCTION_36_2();
    _DWORD *v115 = 136315138;
    v118 = v153;
    swift_beginAccess();
    v119 = (void *)sub_23785A1F0();
    swift_endAccess();
    v168[0] = v119;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268927FC8);
    uint64_t v120 = sub_23785B6D0();
    v168[0] = (void *)sub_2377C6A68(v120, v121, &v167);
    sub_23785B9E0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_25_6(&dword_237778000, v116, v122, "Sending systemDialogActs: %s");
    swift_arrayDestroy();
    uint64_t v104 = (uint64_t)v165;
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();

    OUTLINED_FUNCTION_2_4();
    v114();
  }
  else
  {

    OUTLINED_FUNCTION_2_4();
    v114();
    v118 = v153;
  }
  swift_beginAccess();
  uint64_t v123 = sub_23785A1C0();
  if (v123)
  {
    uint64_t v124 = v123;
    swift_endAccess();
    ((void (*)(uint64_t, uint64_t, uint64_t))v166)(v137, v104, v151);
    swift_bridgeObjectRetain();
    v125 = sub_23785B490();
    os_log_type_t v126 = sub_23785B8A0();
    if (OUTLINED_FUNCTION_24_7(v126))
    {
      v127 = (uint8_t *)OUTLINED_FUNCTION_48_0();
      v168[0] = (void *)OUTLINED_FUNCTION_36_2();
      *(_DWORD *)v127 = 136315138;
      uint64_t v128 = sub_2377C31E8(v124);
      v166 = (id *)v114;
      uint64_t v130 = sub_2377C6A68(v128, v129, (uint64_t *)v168);
      OUTLINED_FUNCTION_19_3(v130);
      sub_23785B9E0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237778000, v125, (os_log_type_t)v115, "Donating rrEntitities: %s", v127, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      OUTLINED_FUNCTION_41_6();
      OUTLINED_FUNCTION_2_4();
      v131();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v133 = OUTLINED_FUNCTION_41_6();
      ((void (*)(uint64_t))v114)(v133);
    }
    v132 = v153;
  }
  else
  {
    v132 = v118;
    swift_endAccess();
  }
  uint64_t v134 = v138;
  uint64_t v135 = v139;
  OUTLINED_FUNCTION_8_0();
  v136();
  (*(void (**)(char *, uint64_t))(v134 + 8))(v132, v135);
  OUTLINED_FUNCTION_18_3();
}

void sub_237810EC0()
{
  OUTLINED_FUNCTION_23_0();
  uint64_t v3 = v2;
  uint64_t v47 = v4;
  uint64_t v44 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v49 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_4();
  uint64_t v48 = v7;
  sub_23785A860();
  OUTLINED_FUNCTION_1_2();
  uint64_t v42 = v9;
  uint64_t v43 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v40 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_26_1();
  uint64_t v46 = sub_23785A7F0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v41 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_12_1();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v38 - v14;
  uint64_t v45 = sub_23785A6E0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_12_1();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_71_2();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_17_13();
  uint64_t v22 = v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927FB0);
  uint64_t v24 = OUTLINED_FUNCTION_2_0(v23);
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_62();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE0);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_23785DFE0;
  *(void *)(v25 + 32) = v3;
  uint64_t v50 = v25;
  sub_23785B7C0();
  uint64_t v26 = v50;
  uint64_t v27 = sub_23785AB70();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v27);
  swift_retain();
  MEMORY[0x237E216A0](v26, v1);
  swift_bridgeObjectRelease();
  sub_2377F2F88(v1, &qword_268927FB0);
  sub_23785A8F0();
  uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32);
  uint64_t v39 = v22;
  v28(v22, v0, v45);
  sub_23785A7E0();
  OUTLINED_FUNCTION_8_0();
  v29();
  sub_23785A7D0();
  v30 = v40;
  sub_23785A850();
  uint64_t v31 = v41;
  OUTLINED_FUNCTION_8_0();
  v32();
  sub_23785A840();
  uint64_t v33 = v47;
  sub_23785A270();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268927FB8);
  uint64_t v34 = v42;
  OUTLINED_FUNCTION_35_5();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23785CD50;
  uint64_t v35 = v43;
  OUTLINED_FUNCTION_8_0();
  v36();
  sub_23785A200();
  OUTLINED_FUNCTION_42_4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v30, v35);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v46);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v39, v45);
  uint64_t v37 = sub_23785A280();
  __swift_storeEnumTagSinglePayload(v33, 0, 1, v37);
  OUTLINED_FUNCTION_18_3();
}

uint64_t sub_237811450@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v3 = sub_23785B4B0();
  uint64_t v43 = *(void *)(v3 - 8);
  uint64_t v44 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927FA0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23785A0C0();
  uint64_t v42 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)v41 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v41 - v16;
  uint64_t v18 = *a1;
  sub_23778BEE8(v18);
  if (v19)
  {
    sub_23778BEDC(v18);
    if (v20)
    {
      uint64_t v44 = v20;
      if (qword_268926768 != -1) {
        swift_once();
      }
      sub_23785A990();
      sub_23785A090();
      if (qword_268926760 != -1) {
        swift_once();
      }
      sub_23785A990();
      sub_23785A090();
      uint64_t v21 = v42;
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
      v22(v8, v17, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
      v22(v12, v15, v9);
      uint64_t v23 = v45;
      sub_23785A040();
      uint64_t v24 = *(void (**)(char *, uint64_t))(v21 + 8);
      v24(v15, v9);
      v24(v17, v9);
      uint64_t v25 = 0;
      goto LABEL_15;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_268926828 != -1) {
    swift_once();
  }
  uint64_t v26 = v44;
  uint64_t v27 = __swift_project_value_buffer(v44, (uint64_t)qword_268928D70);
  uint64_t v28 = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v5, v27, v26);
  id v29 = v18;
  v30 = sub_23785B490();
  os_log_type_t v31 = sub_23785B8A0();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v47 = v42;
    *(_DWORD *)uint64_t v32 = 136315138;
    v41[1] = v32 + 4;
    id v33 = v29;
    id v34 = objc_msgSend(v33, sel_description);
    uint64_t v35 = sub_23785B6B0();
    unint64_t v37 = v36;

    uint64_t v46 = sub_2377C6A68(v35, v37, &v47);
    sub_23785B9E0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237778000, v30, v31, "Unable to add app to display hints: %s", v32, 0xCu);
    uint64_t v25 = 1;
    uint64_t v38 = v42;
    swift_arrayDestroy();
    MEMORY[0x237E23210](v38, -1, -1);
    MEMORY[0x237E23210](v32, -1, -1);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v5, v44);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v26);
    uint64_t v25 = 1;
  }
  uint64_t v23 = v45;
LABEL_15:
  uint64_t v39 = sub_23785A060();
  return __swift_storeEnumTagSinglePayload(v23, v25, 1, v39);
}

uint64_t sub_237811998()
{
  return sub_23785A250();
}

uint64_t sub_237811A0C@<X0>(unint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926BB8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23785A7C0();
  uint64_t v41 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v44 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v39 = (char *)&v35 - v12;
  uint64_t v13 = sub_23785A880();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    uint64_t v17 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v17) {
      goto LABEL_3;
    }
LABEL_18:
    uint64_t v33 = swift_bridgeObjectRelease();
    uint64_t v24 = MEMORY[0x263F8EE78];
LABEL_19:
    MEMORY[0x270FA5388](v33);
    *(&v35 - 2) = (char *)v24;
    sub_237814CD0(&qword_268927FD0, MEMORY[0x263F71708]);
    sub_23785B200();
    swift_bridgeObjectRelease();
    uint64_t v34 = sub_23785A860();
    MEMORY[0x270FA5388](v34);
    *(&v35 - 2) = v16;
    sub_237814CD0(&qword_268927DF0, MEMORY[0x263F71688]);
    sub_23785B200();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_23785BCC0();
  uint64_t v17 = result;
  if (!result) {
    goto LABEL_18;
  }
LABEL_3:
  uint64_t v40 = v17;
  if (v17 >= 1)
  {
    uint64_t v35 = v16;
    uint64_t v36 = v14;
    uint64_t v37 = v13;
    uint64_t v38 = a3;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = a2 & 1;
    unint64_t v43 = a1 & 0xC000000000000001;
    uint64_t v22 = v40;
    uint64_t v23 = (void (**)(char *, char *, uint64_t))(v41 + 32);
    uint64_t v24 = MEMORY[0x263F8EE78];
    do
    {
      if (v43) {
        id v25 = (id)MEMORY[0x237E22750](v19, a1);
      }
      else {
        id v25 = *(id *)(a1 + 8 * v19 + 32);
      }
      uint64_t v26 = v25;
      uint64_t v45 = v25;
      sub_237812E48(&v45, v21, (uint64_t)v8);

      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
      {
        sub_2377F2F88((uint64_t)v8, &qword_268926BB8);
      }
      else
      {
        uint64_t v42 = v20;
        uint64_t v27 = v21;
        unint64_t v28 = a1;
        id v29 = *v23;
        v30 = v39;
        (*v23)(v39, v8, v9);
        v29(v44, v30, v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v24 = sub_237804150(0, *(void *)(v24 + 16) + 1, 1, v24);
        }
        unint64_t v32 = *(void *)(v24 + 16);
        unint64_t v31 = *(void *)(v24 + 24);
        if (v32 >= v31 >> 1) {
          uint64_t v24 = sub_237804150(v31 > 1, v32 + 1, 1, v24);
        }
        *(void *)(v24 + 16) = v32 + 1;
        v29((char *)(v24+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(void *)(v41 + 72) * v32), v44, v9);
        a1 = v28;
        uint64_t v22 = v40;
        uint64_t v21 = v27;
        uint64_t v20 = v42;
      }
      ++v19;
    }
    while (v22 != v19);
    uint64_t v33 = swift_bridgeObjectRelease();
    uint64_t v13 = v37;
    uint64_t v16 = v35;
    uint64_t v14 = v36;
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_237811F04()
{
  uint64_t v0 = sub_23785B4B0();
  uint64_t v43 = *(void *)(v0 - 8);
  uint64_t v44 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v48 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_23785A860();
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v42 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v39 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_23785A750();
  uint64_t v40 = *(void *)(v47 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v47);
  uint64_t v36 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v38 = (char *)&v34 - v6;
  uint64_t v46 = sub_23785A7C0();
  uint64_t v37 = *(void *)(v46 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v46);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v45 = (char *)&v34 - v10;
  uint64_t v11 = sub_23785A6E0();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v49 = sub_23785A8B0();
  uint64_t v12 = *(void *)(v49 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v49);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v34 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927FB0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23785AE10();
  swift_allocObject();
  uint64_t v21 = sub_23785AE00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE0);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_23785DFE0;
  *(void *)(v22 + 32) = v21;
  uint64_t v50 = v22;
  sub_23785B7C0();
  uint64_t v23 = v50;
  uint64_t v24 = sub_23785AB70();
  __swift_storeEnumTagSinglePayload((uint64_t)v20, 1, 1, v24);
  swift_retain();
  MEMORY[0x237E216A0](v23, v20);
  swift_bridgeObjectRelease();
  sub_2377F2F88((uint64_t)v20, &qword_268927FB0);
  sub_23785A8A0();
  sub_23785A8F0();
  sub_23785A890();
  id v25 = v45;
  sub_23785A7B0();
  uint64_t v35 = v12;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v49);
  sub_23785A7A0();
  uint64_t v26 = v38;
  sub_23785A740();
  uint64_t v27 = v37;
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v9, v25, v46);
  sub_23785A730();
  unint64_t v28 = v39;
  sub_23785A850();
  uint64_t v29 = v40;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v36, v26, v47);
  sub_23785A830();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268927FB8);
  uint64_t v30 = v41;
  unint64_t v31 = (*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_23785CD50;
  (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v32 + v31, v28, v42);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v47);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v45, v46);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v17, v49);
  return v32;
}

void sub_2378126B8()
{
  OUTLINED_FUNCTION_23_0();
  uint64_t v2 = v1;
  uint64_t v62 = v4;
  uint64_t v63 = v3;
  uint64_t v6 = v5;
  uint64_t v64 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927FA8);
  uint64_t v9 = OUTLINED_FUNCTION_2_0(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_62();
  uint64_t v10 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_12_1();
  uint64_t v16 = v14 - v15;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v61 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v61 - v21;
  uint64_t v23 = sub_23778BEDC(v6);
  if (!v24)
  {
    if (qword_268926828 != -1) {
      uint64_t v23 = swift_once();
    }
    OUTLINED_FUNCTION_20_4(v23, (uint64_t)qword_268928D70);
    OUTLINED_FUNCTION_8_0();
    v30();
    id v31 = v6;
    uint64_t v32 = sub_23785B490();
    os_log_type_t v33 = sub_23785B8A0();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)OUTLINED_FUNCTION_48_0();
      uint64_t v35 = OUTLINED_FUNCTION_36_2();
      uint64_t v62 = v12;
      uint64_t v63 = v10;
      uint64_t v65 = v35;
      uint64_t v29 = (uint64_t)OUTLINED_FUNCTION_38_5(4.8149e-34);
      id v36 = objc_msgSend((id)v29, sel_description);
      uint64_t v37 = sub_23785B6B0();
      unint64_t v39 = v38;

      uint64_t v40 = sub_2377C6A68(v37, v39, &v65);
      OUTLINED_FUNCTION_21_10(v40);

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237778000, v32, v33, "Unable to extract app name for rrEntity creation from: %s", v34, 0xCu);
      OUTLINED_FUNCTION_39_5();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      OUTLINED_FUNCTION_5_2();
      v41();
LABEL_20:
      uint64_t v28 = v64;
      goto LABEL_21;
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v22, v10);
LABEL_19:
    uint64_t v29 = 1;
    goto LABEL_20;
  }
  uint64_t v61 = v2;
  sub_23778BEE8(v6);
  if (!v25)
  {
    uint64_t v42 = swift_bridgeObjectRelease();
    if (qword_268926828 != -1) {
      uint64_t v42 = swift_once();
    }
    OUTLINED_FUNCTION_20_4(v42, (uint64_t)qword_268928D70);
    OUTLINED_FUNCTION_8_0();
    v43();
    id v44 = v6;
    uint64_t v45 = sub_23785B490();
    os_log_type_t v46 = sub_23785B8A0();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)OUTLINED_FUNCTION_48_0();
      uint64_t v48 = OUTLINED_FUNCTION_36_2();
      uint64_t v62 = v12;
      uint64_t v63 = v10;
      uint64_t v65 = v48;
      uint64_t v29 = (uint64_t)OUTLINED_FUNCTION_38_5(4.8149e-34);
      id v49 = objc_msgSend((id)v29, sel_description);
      uint64_t v50 = sub_23785B6B0();
      unint64_t v52 = v51;

      uint64_t v53 = sub_2377C6A68(v50, v52, &v65);
      OUTLINED_FUNCTION_21_10(v53);

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237778000, v45, v46, "Unable to extract app id for rrEntity creation from: %s", v47, 0xCu);
      OUTLINED_FUNCTION_39_5();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      OUTLINED_FUNCTION_5_2();
      v54();
      goto LABEL_20;
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v20, v10);
    goto LABEL_19;
  }
  uint64_t v26 = sub_237812CD8();
  swift_bridgeObjectRelease();
  if (MEMORY[0x237E217D0](v26))
  {
    uint64_t v27 = sub_23785B530();
    __swift_storeEnumTagSinglePayload(v0, 1, 1, v27);
    swift_retain();
    uint64_t v28 = v64;
    sub_23785B560();
    swift_bridgeObjectRetain();
    sub_23785B520();
    __swift_storeEnumTagSinglePayload(v0, 0, 1, v27);
    sub_23785B580();
    swift_release();
    swift_release();
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v55 = swift_bridgeObjectRelease();
    if (qword_268926828 != -1) {
      uint64_t v55 = swift_once();
    }
    OUTLINED_FUNCTION_20_4(v55, (uint64_t)qword_268928D70);
    OUTLINED_FUNCTION_8_0();
    v56();
    v57 = sub_23785B490();
    os_log_type_t v58 = sub_23785B8B0();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v59 = 0;
      _os_log_impl(&dword_237778000, v57, v58, "Error converting common app entity builder to common app entity", v59, 2u);
      OUTLINED_FUNCTION_5_3();
      swift_release();
    }
    else
    {

      swift_release();
    }
    uint64_t v28 = v64;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v10);
    uint64_t v29 = 1;
  }
LABEL_21:
  uint64_t v60 = sub_23785B5A0();
  __swift_storeEnumTagSinglePayload(v28, v29, 1, v60);
  OUTLINED_FUNCTION_18_3();
}

uint64_t sub_237812CD8()
{
  uint64_t v0 = sub_23785AAA0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_23785AA70();
  sub_23785AD20();
  swift_allocObject();
  uint64_t v4 = sub_23785AD10();
  sub_23785AD00();
  if (sub_23785ACF0())
  {
    sub_23785A9A0();
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_237812E48@<X0>(void **a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v90 = a3;
  uint64_t v5 = sub_23785A820();
  uint64_t v86 = *(void *)(v5 - 8);
  uint64_t v87 = v5;
  MEMORY[0x270FA5388](v5);
  v84 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_23785A6E0();
  uint64_t v83 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  uint64_t v8 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927FB0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_23785B4B0();
  uint64_t v92 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  v89 = (char *)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v82 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v82 - v18;
  uint64_t v20 = *a1;
  sub_23778BEDC(v20);
  if (!v21)
  {
    if (qword_268926828 != -1) {
      swift_once();
    }
    uint64_t v24 = v12;
    uint64_t v25 = __swift_project_value_buffer(v12, (uint64_t)qword_268928D70);
    uint64_t v26 = v92;
    (*(void (**)(char *, uint64_t, uint64_t))(v92 + 16))(v19, v25, v12);
    id v27 = v20;
    uint64_t v28 = sub_23785B490();
    os_log_type_t v29 = sub_23785B8A0();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      v89 = (char *)swift_slowAlloc();
      uint64_t v94 = v89;
      *(_DWORD *)uint64_t v30 = 136315138;
      uint64_t v88 = (uint64_t)(v30 + 4);
      id v31 = v27;
      id v32 = objc_msgSend(v31, sel_description);
      uint64_t v33 = sub_23785B6B0();
      uint64_t v87 = v24;
      uint64_t v34 = v33;
      unint64_t v36 = v35;

      uint64_t v93 = sub_2377C6A68(v34, v36, (uint64_t *)&v94);
      sub_23785B9E0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237778000, v28, v29, "Unable to extract app name for SDA creation from: %s", v30, 0xCu);
      uint64_t v37 = v89;
      swift_arrayDestroy();
      MEMORY[0x237E23210](v37, -1, -1);
      MEMORY[0x237E23210](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v92 + 8))(v19, v87);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v26 + 8))(v19, v24);
    }
    uint64_t v72 = v90;
    uint64_t v73 = sub_23785A7C0();
    uint64_t v74 = v72;
    return __swift_storeEnumTagSinglePayload(v74, 1, 1, v73);
  }
  sub_23778BEE8(v20);
  if (!v22)
  {
    swift_bridgeObjectRelease();
    if (qword_268926828 != -1) {
      swift_once();
    }
    uint64_t v38 = v12;
    uint64_t v39 = __swift_project_value_buffer(v12, (uint64_t)qword_268928D70);
    uint64_t v40 = v92;
    (*(void (**)(char *, uint64_t, uint64_t))(v92 + 16))(v17, v39, v12);
    id v41 = v20;
    uint64_t v42 = sub_23785B490();
    os_log_type_t v43 = sub_23785B8A0();
    if (os_log_type_enabled(v42, v43))
    {
      id v44 = (uint8_t *)swift_slowAlloc();
      v89 = (char *)swift_slowAlloc();
      uint64_t v94 = v89;
      *(_DWORD *)id v44 = 136315138;
      uint64_t v88 = (uint64_t)(v44 + 4);
      id v45 = v41;
      id v46 = objc_msgSend(v45, sel_description);
      uint64_t v47 = sub_23785B6B0();
      uint64_t v87 = v38;
      uint64_t v48 = v47;
      unint64_t v50 = v49;

      uint64_t v93 = sub_2377C6A68(v48, v50, (uint64_t *)&v94);
      sub_23785B9E0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237778000, v42, v43, "Unable to extract app id for SDA creation from: %s", v44, 0xCu);
      unint64_t v51 = v89;
      swift_arrayDestroy();
      MEMORY[0x237E23210](v51, -1, -1);
      MEMORY[0x237E23210](v44, -1, -1);

      (*(void (**)(char *, uint64_t))(v92 + 8))(v17, v87);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v38);
    }
    uint64_t v73 = sub_23785A7C0();
    uint64_t v74 = v90;
    return __swift_storeEnumTagSinglePayload(v74, 1, 1, v73);
  }
  uint64_t v88 = sub_237812CD8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a2)
  {
    sub_23785AE30();
    swift_allocObject();
    uint64_t v23 = sub_23785AE20();
  }
  else
  {
    sub_23785AE10();
    swift_allocObject();
    uint64_t v23 = sub_23785AE00();
  }
  uint64_t v52 = v23;
  uint64_t v53 = v12;
  sub_23785AE60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE0);
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_23785DFE0;
  *(void *)(v54 + 32) = v52;
  uint64_t v94 = (char *)v54;
  sub_23785B7C0();
  uint64_t v55 = (uint64_t)v94;
  uint64_t v56 = sub_23785AB70();
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v56);
  swift_retain();
  uint64_t v57 = MEMORY[0x237E216A0](v55, v11);
  swift_bridgeObjectRelease();
  sub_2377F2F88((uint64_t)v11, &qword_268927FB0);
  os_log_type_t v58 = v91;
  uint64_t v59 = sub_23785A8F0();
  uint64_t v82 = v52;
  if (v58)
  {
    if (qword_268926828 != -1) {
      swift_once();
    }
    uint64_t v60 = __swift_project_value_buffer(v12, (uint64_t)qword_268928D70);
    uint64_t v61 = v92;
    uint64_t v62 = v89;
    (*(void (**)(char *, uint64_t, uint64_t))(v92 + 16))(v89, v60, v12);
    id v63 = v58;
    id v64 = v58;
    uint64_t v65 = sub_23785B490();
    os_log_type_t v66 = sub_23785B8B0();
    if (os_log_type_enabled(v65, v66))
    {
      uint64_t v91 = (void *)v57;
      char v67 = (uint8_t *)swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      uint64_t v94 = (char *)v68;
      *(_DWORD *)char v67 = 136315138;
      uint64_t v93 = (uint64_t)v58;
      id v69 = v58;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268926CE0);
      uint64_t v70 = sub_23785B6D0();
      uint64_t v87 = v53;
      uint64_t v93 = sub_2377C6A68(v70, v71, (uint64_t *)&v94);
      sub_23785B9E0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_237778000, v65, v66, "Error building system dialog act for disambiguation: %s", v67, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237E23210](v68, -1, -1);
      MEMORY[0x237E23210](v67, -1, -1);

      swift_release();
      swift_release();

      swift_release();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v89, v87);
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();

      (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v53);
    }
    uint64_t v80 = v90;
    uint64_t v81 = sub_23785A7C0();
    return __swift_storeEnumTagSinglePayload(v80, 1, 1, v81);
  }
  else
  {
    MEMORY[0x270FA5388](v59);
    *(&v82 - 2) = (uint64_t)v8;
    sub_237814CD0(&qword_268927FD8, MEMORY[0x263F71600]);
    unint64_t v75 = v84;
    uint64_t v91 = (void *)v57;
    uint64_t v76 = v87;
    sub_23785B200();
    uint64_t v77 = sub_23785A7C0();
    MEMORY[0x270FA5388](v77);
    *(&v82 - 2) = (uint64_t)v75;
    sub_237814CD0((unint64_t *)&qword_268926BC0, MEMORY[0x263F71570]);
    uint64_t v78 = v90;
    sub_23785B200();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v86 + 8))(v75, v76);
    (*(void (**)(char *, uint64_t))(v83 + 8))(v8, v85);
    return __swift_storeEnumTagSinglePayload(v78, 0, 1, v77);
  }
}

uint64_t sub_2378139F0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v88 = a1;
  uint64_t v89 = a4;
  uint64_t v87 = a3;
  uint64_t v96 = a6;
  uint64_t v8 = sub_23785A820();
  uint64_t v82 = *(void *)(v8 - 8);
  uint64_t v83 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v80 = (char *)&v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_23785A6E0();
  uint64_t v79 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v91 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927FB0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927FA8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v79 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_23785B5A0();
  uint64_t v90 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  uint64_t v94 = (char *)&v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_23785AAA0();
  uint64_t v92 = *(void *)(v18 - 8);
  uint64_t v93 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v79 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_23785B4B0();
  uint64_t v97 = *(void *)(v21 - 8);
  uint64_t v98 = v21;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v86 = (char *)&v79 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v79 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v79 - v27;
  uint64_t v29 = sub_23785B2C0();
  if (!v30)
  {
    if (qword_268926828 != -1) {
      swift_once();
    }
    uint64_t v49 = v98;
    uint64_t v50 = __swift_project_value_buffer(v98, (uint64_t)qword_268928D70);
    uint64_t v51 = v97;
    (*(void (**)(char *, uint64_t, uint64_t))(v97 + 16))(v28, v50, v49);
    id v52 = a2;
    uint64_t v53 = sub_23785B490();
    os_log_type_t v54 = sub_23785B8A0();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      uint64_t v100 = v56;
      *(_DWORD *)uint64_t v55 = 136315138;
      uint64_t v95 = (uint64_t)(v55 + 4);
      id v57 = v52;
      id v58 = objc_msgSend(v57, sel_description);
      uint64_t v59 = sub_23785B6B0();
      unint64_t v61 = v60;

      uint64_t v99 = sub_2377C6A68(v59, v61, &v100);
      sub_23785B9E0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237778000, v53, v54, "Unable to extract device name from: %s", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237E23210](v56, -1, -1);
      MEMORY[0x237E23210](v55, -1, -1);

      (*(void (**)(char *, uint64_t))(v97 + 8))(v28, v98);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v51 + 8))(v28, v49);
    }
    goto LABEL_14;
  }
  uint64_t v31 = v29;
  uint64_t v32 = v30;
  sub_2377F99F8();
  sub_23785AA70();
  sub_23785AC40();
  swift_allocObject();
  uint64_t v33 = MEMORY[0x237E217E0](v31, v32);
  uint64_t v85 = v20;
  sub_23785A9A0();
  sub_23785A950();
  swift_allocObject();
  uint64_t v34 = sub_23785A940();
  uint64_t v84 = v33;
  uint64_t v100 = v33;
  uint64_t v35 = v34;
  sub_23785AB10();
  uint64_t v36 = MEMORY[0x237E217D0](v35);
  if (!v36)
  {
    if (qword_268926828 != -1) {
      swift_once();
    }
    uint64_t v62 = v98;
    uint64_t v63 = __swift_project_value_buffer(v98, (uint64_t)qword_268928D70);
    uint64_t v64 = v97;
    (*(void (**)(char *, uint64_t, uint64_t))(v97 + 16))(v26, v63, v62);
    uint64_t v65 = sub_23785B490();
    os_log_type_t v66 = sub_23785B8B0();
    BOOL v67 = os_log_type_enabled(v65, v66);
    uint64_t v68 = v85;
    if (v67)
    {
      id v69 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v69 = 0;
      _os_log_impl(&dword_237778000, v65, v66, "Error converting UsoEntityBuilder to UsoEntity", v69, 2u);
      MEMORY[0x237E23210](v69, -1, -1);
    }

    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v64 + 8))(v26, v62);
    (*(void (**)(char *, uint64_t))(v92 + 8))(v68, v93);
LABEL_14:
    uint64_t v77 = sub_23785A7C0();
    uint64_t v75 = v96;
    uint64_t v76 = 1;
    return __swift_storeEnumTagSinglePayload(v75, v76, 1, v77);
  }
  uint64_t v37 = v36;
  sub_2377F99F8();
  uint64_t v38 = sub_23785B530();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v38);
  swift_retain();
  uint64_t v39 = v94;
  sub_23785B560();
  swift_bridgeObjectRetain();
  sub_23785B520();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v38);
  sub_23785B580();
  sub_237803FB0();
  uint64_t v40 = *(void *)(*a5 + 16);
  sub_2378040A4();
  uint64_t v41 = *a5;
  *(void *)(v41 + 16) = v40 + 1;
  uint64_t v89 = v37;
  uint64_t v42 = v90;
  (*(void (**)(unint64_t, char *, uint64_t))(v90 + 16))(v41+ ((*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80))+ *(void *)(v90 + 72) * v40, v39, v95);
  sub_23785AEB0();
  swift_allocObject();
  uint64_t v43 = sub_23785AEA0();
  uint64_t v100 = v35;
  sub_23785AAB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE0);
  uint64_t v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = xmmword_23785DFE0;
  *(void *)(v44 + 32) = v43;
  uint64_t v100 = v44;
  sub_23785B7C0();
  uint64_t v45 = v100;
  uint64_t v46 = sub_23785AB70();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v46);
  swift_retain();
  uint64_t v47 = MEMORY[0x237E216A0](v45, v13);
  swift_bridgeObjectRelease();
  sub_2377F2F88((uint64_t)v13, &qword_268927FB0);
  uint64_t v48 = sub_23785A8F0();
  uint64_t v88 = v47;
  MEMORY[0x270FA5388](v48);
  sub_237814CD0(&qword_268927FD8, MEMORY[0x263F71600]);
  uint64_t v70 = v80;
  uint64_t v98 = v35;
  uint64_t v71 = v83;
  sub_23785B200();
  uint64_t v72 = sub_23785A7C0();
  MEMORY[0x270FA5388](v72);
  sub_237814CD0((unint64_t *)&qword_268926BC0, MEMORY[0x263F71570]);
  uint64_t v73 = v39;
  uint64_t v74 = v96;
  sub_23785B200();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v73, v95);
  (*(void (**)(char *, uint64_t))(v92 + 8))(v85, v93);
  (*(void (**)(char *, uint64_t))(v82 + 8))(v70, v71);
  (*(void (**)(char *, uint64_t))(v79 + 8))(v91, v81);
  uint64_t v75 = v74;
  uint64_t v76 = 0;
  uint64_t v77 = v72;
  return __swift_storeEnumTagSinglePayload(v75, v76, 1, v77);
}

uint64_t sub_23781480C()
{
  return sub_23785A700();
}

uint64_t sub_237814848(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(char *))
{
  a3(0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v11 - v7;
  (*(void (**)(char *, uint64_t))(v9 + 16))((char *)v11 - v7, a2);
  return a4(v8);
}

unint64_t DisplayHint.description.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927FA0);
  uint64_t v1 = OUTLINED_FUNCTION_2_0(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_12_1();
  uint64_t v4 = v2 - v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - v6;
  unint64_t v10 = 0;
  unint64_t v11 = 0xE000000000000000;
  sub_23785BB80();
  swift_bridgeObjectRelease();
  unint64_t v10 = 0xD000000000000012;
  unint64_t v11 = 0x8000000237867230;
  sub_23785A050();
  uint64_t v8 = sub_23785A0C0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    sub_2377F2F88((uint64_t)v7, &qword_268927FA0);
  }
  else
  {
    SemanticValue.description.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  sub_23785B720();
  swift_bridgeObjectRelease();
  sub_23785B720();
  sub_23785A030();
  if (__swift_getEnumTagSinglePayload(v4, 1, v8) == 1)
  {
    sub_2377F2F88(v4, &qword_268927FA0);
  }
  else
  {
    SemanticValue.description.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v4, v8);
  }
  sub_23785B720();
  swift_bridgeObjectRelease();
  sub_23785B720();
  return v10;
}

uint64_t SemanticValue.description.getter()
{
  return 0;
}

void sub_237814CB8(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_237814CC4(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t sub_237814CD0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_237814D18@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2378139F0(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24), *(uint64_t **)(v3 + 32), a3);
}

uint64_t sub_237814D24()
{
  return sub_23781480C();
}

uint64_t sub_237814D40(uint64_t a1)
{
  return sub_237814848(a1, *(void *)(v1 + 16), MEMORY[0x263F71708], MEMORY[0x263F71660]);
}

uint64_t sub_237814D84(uint64_t a1)
{
  return sub_237814848(a1, *(void *)(v1 + 16), MEMORY[0x263F714B0], MEMORY[0x263F715F0]);
}

uint64_t sub_237814DC8(uint64_t a1)
{
  return sub_237814848(a1, *(void *)(v1 + 16), MEMORY[0x263F71600], MEMORY[0x263F71550]);
}

uint64_t sub_237814E0C(uint64_t a1)
{
  return sub_237814D40(a1);
}

uint64_t sub_237814E24(uint64_t a1)
{
  return sub_237814D84(a1);
}

uint64_t sub_237814E3C(uint64_t a1)
{
  return sub_237814DC8(a1);
}

uint64_t sub_237814E54()
{
  return sub_237814D24();
}

uint64_t OUTLINED_FUNCTION_19_9(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t OUTLINED_FUNCTION_20_4(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(v2, a2);
}

uint64_t OUTLINED_FUNCTION_21_10(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_23785B9E0();
}

uint64_t OUTLINED_FUNCTION_22_8()
{
  return 0;
}

BOOL OUTLINED_FUNCTION_24_7(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_25_6(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_33_7()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_36_5()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

id OUTLINED_FUNCTION_38_5(float a1)
{
  *uint64_t v2 = a1;
  *(void *)(v3 - 128) = v2 + 1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_39_5()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_40_6(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_41_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42_4()
{
  return sub_23785A240();
}

uint64_t sub_237815080()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689270B8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = type metadata accessor for AppLaunchIntent();
  MEMORY[0x270FA5388](v4);
  os_log_type_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_268926770 != -1) {
    swift_once();
  }
  sub_237816514((unint64_t *)&qword_268926BC8, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
  sub_23785ABB0();
  sub_237821084();
  char v8 = v7;
  sub_23779FBE8(v0, (uint64_t)v6);
  if ((v8 & 1) == 0)
  {
    sub_237815C78((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for AppLaunchIntent);
    return 0;
  }
  if (qword_268926750 != -1) {
    swift_once();
  }
  uint64_t v9 = _s11ApplicationVMa(0);
  sub_237816514(&qword_2689270D0, (void (*)(uint64_t))_s11ApplicationVMa);
  sub_23785ABA0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v9) != 1)
  {
    if (qword_268926760 != -1) {
      swift_once();
    }
    sub_237816514(&qword_2689270D8, (void (*)(uint64_t))_s11ApplicationVMa);
    sub_23785ABB0();
    uint64_t v10 = v13;
    sub_237815C78((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for AppLaunchIntent);
    sub_237815C78((uint64_t)v3, _s11ApplicationVMa);
    if (!v10) {
      return 1;
    }
    swift_bridgeObjectRelease();
    return 0;
  }
  sub_237815C78((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for AppLaunchIntent);
  sub_23780A598((uint64_t)v3);
  return 1;
}

uint64_t sub_2378153C0()
{
  if (qword_2689267D0 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_23781541C(uint64_t a1)
{
  return sub_23780DD4C(a1, &qword_268927FE0, 0x6E756F4E707061, 0xE700000000000000, &qword_268928D40);
}

uint64_t type metadata accessor for AppLaunchIntent()
{
  uint64_t result = qword_268927FE8;
  if (!qword_268927FE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23781548C(uint64_t a1)
{
  return sub_23780DD4C(a1, &qword_268927E10, 0x69766F7250707061, 0xEB00000000726564, &qword_268928D48);
}

uint64_t sub_2378154BC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268927E18);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_237861050;
  if (qword_268926778 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_268928CF8;
  *(void *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268927E80);
  *(void *)(v0 + 64) = sub_23779D2F8(&qword_268928048, &qword_268927E80);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = qword_268926750;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_268928CC0;
  uint64_t v4 = _s23ApplicationOntologyNodeCMa(0);
  uint64_t v5 = MEMORY[0x263F722A0];
  *(void *)(v0 + 96) = v4;
  *(void *)(v0 + 104) = v5;
  *(void *)(v0 + 72) = v3;
  uint64_t v6 = qword_2689267B8;
  swift_retain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_268928D38;
  *(void *)(v0 + 136) = __swift_instantiateConcreteTypeFromMangledName(&qword_268927F58);
  *(void *)(v0 + 144) = sub_23779D2F8(&qword_268928050, &qword_268927F58);
  *(void *)(v0 + 112) = v7;
  uint64_t v8 = qword_2689267B0;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_268928D30;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927E10);
  *(void *)(v0 + 176) = v10;
  uint64_t v11 = sub_23779D2F8((unint64_t *)&qword_268927E20, &qword_268927E10);
  *(void *)(v0 + 184) = v11;
  *(void *)(v0 + 152) = v9;
  uint64_t v12 = qword_2689267C0;
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_268928D40;
  *(void *)(v0 + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_268927FE0);
  *(void *)(v0 + 224) = sub_23779D2F8(&qword_268928058, &qword_268927FE0);
  *(void *)(v0 + 192) = v13;
  uint64_t v14 = qword_268926770;
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_268928CF0;
  *(void *)(v0 + 256) = __swift_instantiateConcreteTypeFromMangledName(&qword_268927E38);
  *(void *)(v0 + 264) = sub_23779D2F8(&qword_268928060, &qword_268927E38);
  *(void *)(v0 + 232) = v15;
  uint64_t v16 = qword_268926788;
  swift_retain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_268928D08;
  *(void *)(v0 + 296) = v10;
  *(void *)(v0 + 304) = v11;
  *(void *)(v0 + 272) = v17;
  uint64_t v18 = qword_268926790;
  swift_retain();
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_268928D10;
  *(void *)(v0 + 336) = v10;
  *(void *)(v0 + 344) = v11;
  *(void *)(v0 + 312) = v19;
  uint64_t v20 = qword_2689267A0;
  swift_retain();
  if (v20 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_268928D20;
  *(void *)(v0 + 376) = v10;
  *(void *)(v0 + 384) = v11;
  *(void *)(v0 + 352) = v21;
  uint64_t v22 = qword_268926798;
  swift_retain();
  if (v22 != -1) {
    swift_once();
  }
  uint64_t v23 = qword_268928D18;
  *(void *)(v0 + 416) = v10;
  *(void *)(v0 + 424) = v11;
  *(void *)(v0 + 392) = v23;
  uint64_t v24 = qword_2689267A8;
  swift_retain();
  if (v24 != -1) {
    swift_once();
  }
  uint64_t v25 = qword_268928D28;
  *(void *)(v0 + 456) = __swift_instantiateConcreteTypeFromMangledName(&qword_268927F10);
  *(void *)(v0 + 464) = sub_23779D2F8(&qword_268928068, &qword_268927F10);
  *(void *)(v0 + 432) = v25;
  uint64_t v26 = qword_268926780;
  swift_retain();
  if (v26 != -1) {
    swift_once();
  }
  uint64_t v27 = qword_268928D00;
  *(void *)(v0 + 496) = __swift_instantiateConcreteTypeFromMangledName(&qword_268927EC8);
  *(void *)(v0 + 504) = sub_23779D2F8(&qword_268928070, &qword_268927EC8);
  *(void *)(v0 + 472) = v27;
  uint64_t v28 = qword_2689267C8;
  swift_retain();
  if (v28 != -1) {
    swift_once();
  }
  uint64_t v29 = qword_268928D48;
  *(void *)(v0 + 536) = v10;
  *(void *)(v0 + 544) = v11;
  *(void *)(v0 + 512) = v29;
  sub_23785A970();
  swift_allocObject();
  swift_retain();
  uint64_t result = sub_23785A960();
  qword_268928D50 = result;
  return result;
}

uint64_t sub_237815A90()
{
  unint64_t v0 = sub_23785BCF0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

void *sub_237815ADC()
{
  return &unk_26EA7E138;
}

uint64_t sub_237815AE8(char a1)
{
  uint64_t result = 0x6E776F6E6B6E75;
  switch(a1)
  {
    case 1:
      uint64_t result = 7368801;
      break;
    case 2:
      uint64_t result = 0x7265646C6F66;
      break;
    case 3:
      uint64_t result = 0x6E696874656D6F73;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_237815B74()
{
  return sub_237820A68();
}

uint64_t sub_237815B80()
{
  return sub_23785720C();
}

uint64_t sub_237815B88()
{
  return sub_237857620();
}

uint64_t sub_237815B90()
{
  return sub_237857844();
}

uint64_t sub_237815B98@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_237815A90();
  *a1 = result;
  return result;
}

uint64_t sub_237815BC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_237815AE8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_237815BF4(void *a1@<X8>)
{
  *a1 = &unk_26EA7E138;
}

uint64_t sub_237815C04(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_23781655C();
  unint64_t v5 = sub_2378165A8();
  unint64_t v6 = sub_2378165F4();
  return MEMORY[0x270F6DF80](a1, a2, v4, v5, v6);
}

uint64_t sub_237815C78(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for AppLaunchIntent.AppNoun(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x237815DA4);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchIntent.AppNoun()
{
  return &type metadata for AppLaunchIntent.AppNoun;
}

uint64_t sub_237815DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23785AEF0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_237815E48(uint64_t a1)
{
  uint64_t v2 = sub_23785AEF0();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_237815EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23785AEF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_237815F10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23785AEF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_237815F74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23785AEF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_237815FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23785AEF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_23781603C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237816050);
}

uint64_t sub_237816050(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23785AEF0();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_237816098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2378160AC);
}

uint64_t sub_2378160AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23785AEF0();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_2378160F8()
{
  uint64_t result = sub_23785AEF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_237816184@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_23785AEF0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_2378161EC()
{
  return sub_2378153C0();
}

uint64_t sub_237816204(uint64_t a1)
{
  uint64_t v2 = sub_237816514(&qword_268928028, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
  return MEMORY[0x270F6CA70](a1, v2);
}

uint64_t sub_237816280(uint64_t a1)
{
  uint64_t v2 = sub_237816514(&qword_268928028, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
  return MEMORY[0x270F6CA60](a1, v2);
}

uint64_t sub_2378162EC(uint64_t a1)
{
  uint64_t v2 = sub_237816514(&qword_268928028, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
  return MEMORY[0x270F6CA68](a1, v2);
}

uint64_t sub_237816358()
{
  return sub_237816514((unint64_t *)&qword_268926BC8, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
}

uint64_t sub_2378163A0()
{
  return sub_237816514(&qword_268927FF8, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
}

unint64_t sub_2378163EC()
{
  unint64_t result = qword_268928000;
  if (!qword_268928000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928000);
  }
  return result;
}

uint64_t sub_237816438()
{
  return sub_23779D2F8(&qword_268928008, &qword_268928010);
}

unint64_t sub_237816478()
{
  unint64_t result = qword_268928018;
  if (!qword_268928018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928018);
  }
  return result;
}

unint64_t sub_2378164C8()
{
  unint64_t result = qword_268928020;
  if (!qword_268928020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928020);
  }
  return result;
}

uint64_t sub_237816514(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_23781655C()
{
  unint64_t result = qword_268928030;
  if (!qword_268928030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928030);
  }
  return result;
}

unint64_t sub_2378165A8()
{
  unint64_t result = qword_268928038;
  if (!qword_268928038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928038);
  }
  return result;
}

unint64_t sub_2378165F4()
{
  unint64_t result = qword_268928040;
  if (!qword_268928040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928040);
  }
  return result;
}

uint64_t destroy for AceAppResolver(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 40);
}

uint64_t initializeWithCopy for AceAppResolver(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t *assignWithCopy for AceAppResolver(uint64_t *a1, uint64_t *a2)
{
  a1[10] = a2[10];
  return a1;
}

uint64_t assignWithTake for AceAppResolver(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for AceAppResolver(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for AceAppResolver(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AceAppResolver()
{
  return &type metadata for AceAppResolver;
}

uint64_t sub_23781686C(void (*a1)(uint64_t *__return_ptr, void *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a3 + 16);
  if (!v5) {
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = (uint64_t *)(a3 + 40);
  uint64_t v8 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v9 = *v7;
    v24[0] = *(v7 - 1);
    v24[1] = v9;
    swift_bridgeObjectRetain();
    a1(&v20, v24);
    if (v4) {
      break;
    }
    swift_bridgeObjectRelease();
    uint64_t v10 = v21;
    if (v21)
    {
      uint64_t v11 = v20;
      uint64_t v12 = v23;
      uint64_t v25 = v22;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237804470(0, *(void *)(v8 + 16) + 1, 1, v8);
        uint64_t v8 = v16;
      }
      unint64_t v14 = *(void *)(v8 + 16);
      unint64_t v13 = *(void *)(v8 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_237804470(v13 > 1, v14 + 1, 1, v8);
        uint64_t v8 = v17;
      }
      *(void *)(v8 + 16) = v14 + 1;
      uint64_t v15 = (void *)(v8 + 32 * v14);
      v15[4] = v11;
      v15[5] = v10;
      v15[6] = v25;
      v15[7] = v12;
    }
    v7 += 2;
    if (!--v5)
    {
      swift_bridgeObjectRelease();
      return v8;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_2378169E0(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (a3 >> 62) {
    goto LABEL_17;
  }
  uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_23785BCC0())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v7 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x237E22750](i - 4, a3) : *(id *)(a3 + 8 * i);
      uint64_t v8 = v7;
      uint64_t v9 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v13 = v7;
      a1(&v12, &v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return swift_bridgeObjectRelease();
      }

      if (v12)
      {
        MEMORY[0x237E22320]();
        if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_23785B7D0();
        }
        sub_23785B7F0();
        sub_23785B7C0();
      }
      if (v9 == v5)
      {
        swift_bridgeObjectRelease();
        return v14;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_237816B80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[35] = a4;
  v5[36] = v4;
  v5[33] = a2;
  v5[34] = a3;
  v5[32] = a1;
  uint64_t v6 = sub_23785B4B0();
  v5[37] = v6;
  v5[38] = *(void *)(v6 - 8);
  v5[39] = swift_task_alloc();
  v5[40] = swift_task_alloc();
  v5[41] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_237816C64, 0, 0);
}

uint64_t sub_237816C64()
{
  uint64_t v1 = v0[35];
  if (v1)
  {
    unint64_t v2 = (void *)v0[36];
    uint64_t v3 = v0[34];
    uint64_t v4 = v2[3];
    uint64_t v5 = v2[4];
    __swift_project_boxed_opaque_existential_1(v2, v4);
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v5 + 16))(v3, v1, v2[10], v4, v5);
    if (v6)
    {
      uint64_t v7 = v6;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE0);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_23785DFE0;
      *(void *)(v8 + 32) = v7;
      sub_23785B7C0();
LABEL_13:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v40 = OUTLINED_FUNCTION_68_0();
      return v41(v40);
    }
  }
  uint64_t v9 = v0[33];
  if (!v9)
  {
    if (qword_268926830 != -1) {
      swift_once();
    }
    uint64_t v30 = v0[40];
    uint64_t v31 = v0[37];
    uint64_t v32 = v0[38];
    uint64_t v33 = __swift_project_value_buffer(v31, (uint64_t)qword_268928D88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v30, v33, v31);
    uint64_t v34 = sub_23785B490();
    os_log_type_t v35 = sub_23785B8A0();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl(&dword_237778000, v34, v35, "App name is nil, will not proceed into corespotlight search", v36, 2u);
      OUTLINED_FUNCTION_5_3();
    }
    uint64_t v37 = v0[40];
    uint64_t v38 = v0[37];
    uint64_t v39 = v0[38];

    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v38);
    goto LABEL_13;
  }
  uint64_t v10 = (void *)v0[36];
  uint64_t v11 = v0[32];
  id v12 = objc_allocWithZone(MEMORY[0x263F647A0]);
  swift_bridgeObjectRetain();
  id v43 = objc_msgSend(v12, sel_init);
  v0[42] = v43;
  v0[2] = v11;
  v0[3] = v9;
  sub_23778EF5C();
  v0[4] = sub_23785BA60();
  v0[5] = v13;
  v0[6] = 92;
  v0[7] = 0xE100000000000000;
  v0[8] = 23644;
  v0[9] = 0xE200000000000000;
  uint64_t v14 = OUTLINED_FUNCTION_0_9();
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  v0[10] = v14;
  v0[11] = v16;
  v0[12] = 34;
  v0[13] = 0xE100000000000000;
  v0[14] = 8796;
  v0[15] = 0xE200000000000000;
  uint64_t v17 = OUTLINED_FUNCTION_0_9();
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  v0[16] = v17;
  v0[17] = v19;
  v0[18] = 39;
  v0[19] = 0xE100000000000000;
  v0[20] = 10076;
  v0[21] = 0xE200000000000000;
  uint64_t v20 = OUTLINED_FUNCTION_0_9();
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  v0[22] = v20;
  v0[23] = v22;
  v0[24] = 42;
  v0[25] = 0xE100000000000000;
  v0[26] = 10844;
  v0[27] = 0xE200000000000000;
  uint64_t v23 = OUTLINED_FUNCTION_0_9();
  uint64_t v25 = v24;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23785B720();
  swift_bridgeObjectRelease();
  sub_237817BE0(v23, v25, v43);
  uint64_t v26 = v10[8];
  uint64_t v27 = v10[9];
  __swift_project_boxed_opaque_existential_1(v10 + 5, v26);
  uint64_t v28 = (void *)swift_task_alloc();
  v0[43] = v28;
  uint64_t v29 = sub_23778F458(0, &qword_268928088);
  *uint64_t v28 = v0;
  v28[1] = sub_2378170DC;
  return MEMORY[0x270F67CE0](v43, v26, v29, v27);
}

uint64_t sub_2378170DC()
{
  OUTLINED_FUNCTION_0_2();
  *(void *)(v2 + 352) = v1;
  *(void *)(v2 + 360) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_237817578;
  }
  else
  {
    uint64_t v3 = sub_2378171D4;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

void sub_2378171D4()
{
  uint64_t v38 = v0;
  unint64_t v2 = sub_237817C44(*(void **)(v0 + 352));
  if (!v2)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v2 >> 62) {
    uint64_t v3 = sub_23785BCC0();
  }
  else {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v3)
  {
    if (qword_268926830 != -1) {
      swift_once();
    }
    uint64_t v12 = *(void *)(v0 + 328);
    uint64_t v13 = *(void **)(v0 + 336);
    uint64_t v14 = *(void *)(v0 + 296);
    uint64_t v15 = *(void *)(v0 + 304);
    uint64_t v16 = __swift_project_value_buffer(v14, (uint64_t)qword_268928D88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v12, v16, v14);
    id v17 = v13;
    swift_bridgeObjectRetain();
    id v18 = v17;
    uint64_t v19 = sub_23785B490();
    os_log_type_t v20 = sub_23785B8B0();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v22 = *(void **)(v0 + 336);
    if (v21)
    {
      uint64_t v24 = *(void *)(v0 + 256);
      unint64_t v23 = *(void *)(v0 + 264);
      uint64_t v25 = swift_slowAlloc();
      v37[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 240) = sub_2377C6A68(v24, v23, v37);
      sub_23785B9E0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v25 + 12) = 2080;
      uint64_t v26 = sub_23778BF00(v22, (SEL *)&selRef_applicationName);
      uint64_t v1 = *(void **)(v0 + 336);
      if (!v27)
      {
LABEL_20:

        __break(1u);
        return;
      }
      uint64_t v28 = *(void *)(v0 + 304);
      uint64_t v35 = *(void *)(v0 + 296);
      uint64_t v36 = *(void *)(v0 + 328);
      *(void *)(v0 + 248) = sub_2377C6A68(v26, v27, v37);
      sub_23785B9E0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_237778000, v19, v20, "Unable to find any apps for %s based on %s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v36, v35);
    }
    else
    {
      uint64_t v29 = *(void *)(v0 + 328);
      uint64_t v30 = *(void *)(v0 + 296);
      uint64_t v31 = *(void *)(v0 + 304);

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
    }
    uint64_t v32 = *(void **)(v0 + 336);

    goto LABEL_14;
  }
  uint64_t v4 = sub_237817C44(*(void **)(v0 + 352));
  if (!v4)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v5 = v4;
  uint64_t v6 = *(void **)(v0 + 352);
  uint64_t v7 = *(void **)(v0 + 336);
  uint64_t v8 = *(void *)(v0 + 288);
  uint64_t v10 = *(void *)(v0 + 256);
  uint64_t v9 = *(void *)(v0 + 264);
  uint64_t v11 = (void *)swift_task_alloc();
  void v11[2] = v10;
  v11[3] = v9;
  v11[4] = v8;
  sub_2378169E0((void (*)(uint64_t *__return_ptr, id *))sub_237817CB4, (uint64_t)v11, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
LABEL_14:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = OUTLINED_FUNCTION_68_0();
  v34(v33);
}

uint64_t sub_237817578()
{
  uint64_t v25 = v0;
  if (qword_268926830 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 360);
  uint64_t v3 = *(void *)(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 296);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_268928D88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_23785B490();
  os_log_type_t v9 = sub_23785B8B0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void **)(v0 + 360);
  uint64_t v13 = *(void *)(v0 + 304);
  uint64_t v12 = *(void *)(v0 + 312);
  uint64_t v14 = *(void *)(v0 + 296);
  if (v10)
  {
    uint64_t v23 = *(void *)(v0 + 312);
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v0 + 224) = v11;
    id v16 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268926CE0);
    uint64_t v17 = sub_23785B6D0();
    *(void *)(v0 + 232) = sub_2377C6A68(v17, v18, &v24);
    sub_23785B9E0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237778000, v8, v9, "AppsSearcher.searchApps AceCommand failed: %s", v15, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v23, v14);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  uint64_t v19 = *(void **)(v0 + 336);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v20 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v21 = MEMORY[0x263F8EE78];
  return v20(v21);
}

uint64_t sub_237817808@<X0>(void **a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10 = sub_23785B4B0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  sub_23778BF00(v14, (SEL *)&selRef_bundleId);
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  if (v16)
  {
    sub_237781F08(a4, (uint64_t)v31);
    uint64_t v17 = v31[4];
    __swift_project_boxed_opaque_existential_1(v31, v31[3]);
    uint64_t result = sub_23778BF00(v14, (SEL *)&selRef_bundleId);
    if (v19)
    {
      uint64_t v20 = (*(uint64_t (**)(uint64_t))(v17 + 16))(result);
      swift_bridgeObjectRelease();
      *a5 = v20;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    uint64_t v30 = a2;
    if (qword_268926830 != -1) {
      swift_once();
    }
    uint64_t v21 = __swift_project_value_buffer(v10, (uint64_t)qword_268928D88);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v21, v10);
    swift_bridgeObjectRetain_n();
    uint64_t v22 = sub_23785B490();
    os_log_type_t v23 = sub_23785B8B0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v29 = a5;
      uint64_t v25 = (uint8_t *)v24;
      uint64_t v26 = swift_slowAlloc();
      v31[0] = v26;
      *(_DWORD *)uint64_t v25 = 136315138;
      v28[1] = v25 + 4;
      swift_bridgeObjectRetain();
      v31[6] = sub_2377C6A68(v30, a3, v31);
      sub_23785B9E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237778000, v22, v23, "Unable to find bundleId for: %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237E23210](v26, -1, -1);
      unint64_t v27 = v25;
      a5 = v29;
      MEMORY[0x237E23210](v27, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    *a5 = 0;
  }
  return result;
}

uint64_t sub_237817B24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *os_log_type_t v9 = v4;
  v9[1] = sub_2377DE6FC;
  return sub_237816B80(a1, a2, a3, a4);
}

void sub_237817BE0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_23785B6A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setApplicationName_, v4);
}

uint64_t sub_237817C44(void *a1)
{
  id v1 = objc_msgSend(a1, sel_foundApps);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_23778F458(0, &qword_268928090);
  uint64_t v3 = sub_23785B7A0();

  return v3;
}

uint64_t sub_237817CB4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_237817808(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  return sub_23785BA20();
}

uint64_t destroy for AppsSearcher(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  if (*(void *)(a1 + 104)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  }
  return __swift_destroy_boxed_opaque_existential_1(a1 + 120);
}

uint64_t initializeWithCopy for AppsSearcher(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  id v6 = (_OWORD *)(a1 + 80);
  id v7 = (_OWORD *)(a2 + 80);
  uint64_t v8 = *(void *)(a2 + 104);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = v8;
    *(void *)(a1 + 112) = v9;
    (**(void (***)(_OWORD *, _OWORD *))(v8 - 8))(v6, v7);
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 96);
    *id v6 = *v7;
    *(_OWORD *)(a1 + 96) = v10;
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
  }
  long long v11 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 120, a2 + 120);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  return a1;
}

uint64_t assignWithCopy for AppsSearcher(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
  uint64_t v4 = *(void *)(a2 + 104);
  if (!*(void *)(a1 + 104))
  {
    if (v4)
    {
      *(void *)(a1 + 104) = v4;
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 80, a2 + 80);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 80);
    long long v6 = *(_OWORD *)(a2 + 96);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(_OWORD *)(a1 + 80) = v5;
    *(_OWORD *)(a1 + 96) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 80);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)(a2 + 120));
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  return a1;
}

void *__swift_memcpy168_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA8uLL);
}

uint64_t assignWithTake for AppsSearcher(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  if (*(void *)(a1 + 104)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  }
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  uint64_t v6 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSearcher(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 168))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for AppsSearcher(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 168) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 168) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppsSearcher()
{
  return &type metadata for AppsSearcher;
}

uint64_t sub_2378180D8@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)(a5 + 160) = a4;
  sub_237781F08((uint64_t)a1, a5);
  sub_237781F08((uint64_t)a1, (uint64_t)v14);
  id v10 = objc_msgSend(self, sel_sharedPreferences);
  sub_2377C7378(v10);
  *(void *)(a5 + 64) = type metadata accessor for RegexAppsResolver();
  *(void *)(a5 + 72) = &off_26EA805F8;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(a5 + 40));
  sub_23782C1E8((uint64_t)v14, (uint64_t)boxed_opaque_existential_0);
  if (*(void *)(a2 + 24))
  {
    sub_23778EF44((long long *)a2, (uint64_t)v14);
    *(void *)(a5 + 104) = &type metadata for AceAppResolver;
    *(void *)(a5 + 112) = &off_26EA7FF20;
    uint64_t v12 = swift_allocObject();
    *(void *)(a5 + 80) = v12;
    sub_23778EF44(v14, v12 + 56);
    sub_23778EF44(a1, v12 + 16);
    *(void *)(v12 + 96) = a4;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    sub_23778A330(a2, &qword_2689274D0);
    *(void *)(a5 + 112) = 0;
    *(_OWORD *)(a5 + 80) = 0u;
    *(_OWORD *)(a5 + 96) = 0u;
  }
  return sub_23778EF44(a3, a5 + 120);
}

uint64_t sub_237818238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 200) = a4;
  *(void *)(v6 + 208) = v5;
  *(unsigned char *)(v6 + 600) = a5;
  *(void *)(v6 + 184) = a2;
  *(void *)(v6 + 192) = a3;
  *(void *)(v6 + 176) = a1;
  uint64_t v7 = sub_23785B440();
  *(void *)(v6 + 216) = v7;
  OUTLINED_FUNCTION_0_4(v7);
  *(void *)(v6 + 224) = v8;
  *(void *)(v6 + 232) = OUTLINED_FUNCTION_4_5();
  *(void *)(v6 + 240) = swift_task_alloc();
  *(void *)(v6 + 248) = swift_task_alloc();
  *(void *)(v6 + 256) = swift_task_alloc();
  *(void *)(v6 + 264) = swift_task_alloc();
  *(void *)(v6 + 272) = swift_task_alloc();
  *(void *)(v6 + 280) = swift_task_alloc();
  *(void *)(v6 + 288) = swift_task_alloc();
  uint64_t v9 = sub_23785B400();
  *(void *)(v6 + 296) = v9;
  OUTLINED_FUNCTION_0_4(v9);
  *(void *)(v6 + 304) = v10;
  *(void *)(v6 + 312) = OUTLINED_FUNCTION_4_5();
  *(void *)(v6 + 320) = swift_task_alloc();
  *(void *)(v6 + 328) = swift_task_alloc();
  *(void *)(v6 + 336) = swift_task_alloc();
  *(void *)(v6 + 344) = swift_task_alloc();
  *(void *)(v6 + 352) = swift_task_alloc();
  *(void *)(v6 + 360) = swift_task_alloc();
  *(void *)(v6 + 368) = swift_task_alloc();
  *(void *)(v6 + 376) = swift_task_alloc();
  *(void *)(v6 + 384) = swift_task_alloc();
  uint64_t v11 = sub_23785B430();
  *(void *)(v6 + 392) = v11;
  OUTLINED_FUNCTION_0_4(v11);
  *(void *)(v6 + 400) = v12;
  *(void *)(v6 + 408) = swift_task_alloc();
  uint64_t v13 = sub_23785B4B0();
  *(void *)(v6 + 416) = v13;
  OUTLINED_FUNCTION_0_4(v13);
  *(void *)(v6 + 424) = v14;
  *(void *)(v6 + 432) = OUTLINED_FUNCTION_4_5();
  *(void *)(v6 + 440) = swift_task_alloc();
  *(void *)(v6 + 448) = swift_task_alloc();
  *(void *)(v6 + 456) = swift_task_alloc();
  *(void *)(v6 + 464) = swift_task_alloc();
  *(void *)(v6 + 472) = swift_task_alloc();
  *(void *)(v6 + 480) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_237818478, 0, 0);
}

uint64_t sub_237818478()
{
  uint64_t v73 = v0;
  if (qword_268926830 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 480);
  uint64_t v2 = *(void *)(v0 + 424);
  unint64_t v3 = *(void *)(v0 + 184);
  *(void *)(v0 + 488) = __swift_project_value_buffer(*(void *)(v0 + 416), (uint64_t)qword_268928D88);
  long long v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  *(void *)(v0 + 496) = v4;
  *(void *)(v0 + 504) = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v71 = v4;
  ((void (*)(uint64_t))v4)(v1);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_23785B490();
  os_log_type_t v6 = sub_23785B8A0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void *)(v0 + 480);
  uint64_t v9 = *(void *)(v0 + 416);
  uint64_t v10 = *(void *)(v0 + 424);
  if (v7)
  {
    uint64_t v11 = *(void *)(v0 + 176);
    uint64_t v12 = *(void *)(v0 + 184);
    uint64_t v64 = *(void *)(v0 + 192);
    uint64_t v65 = *(void *)(v0 + 200);
    unint64_t v68 = v3;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v72 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v0 + 112) = v11;
    *(void *)(v0 + 120) = v12;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268926F10);
    uint64_t v14 = sub_23785B6D0();
    *(void *)(v0 + 152) = sub_2377C6A68(v14, v15, &v72);
    sub_23785B9E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2080;
    *(void *)(v0 + 96) = v64;
    *(void *)(v0 + 104) = v65;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_23785B6D0();
    *(void *)(v0 + 168) = sub_2377C6A68(v16, v17, &v72);
    sub_23785B9E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_237778000, v5, v6, "AppsSearcher.searchApps with appName: %s and appID: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5_3();
    unint64_t v3 = v68;
    OUTLINED_FUNCTION_5_3();

    unint64_t v18 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v18(v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    unint64_t v18 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    uint64_t v19 = OUTLINED_FUNCTION_25_0();
    v18(v19, v20);
  }
  id v69 = v18;
  *(void *)(v0 + 512) = v18;
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  uint64_t v21 = *(void *)(v0 + 472);
  uint64_t v22 = *(void *)(v0 + 416);
  uint64_t v23 = __swift_project_value_buffer(v22, (uint64_t)qword_268928BC8);
  v71(v21, v23, v22);
  sub_23785B410();
  sub_23785B3F0();
  uint64_t v24 = sub_23785B420();
  os_signpost_type_t v25 = sub_23785B960();
  if (sub_23785B9B0())
  {
    uint64_t v26 = (uint8_t *)OUTLINED_FUNCTION_4_4();
    *(_WORD *)uint64_t v26 = 0;
    os_signpost_id_t v27 = sub_23785B3E0();
    _os_signpost_emit_with_name_impl(&dword_237778000, v24, v25, v27, "appsSearcherSearchApps", "", v26, 2u);
    OUTLINED_FUNCTION_5_3();
  }
  uint64_t v29 = *(void *)(v0 + 376);
  uint64_t v28 = *(void *)(v0 + 384);
  uint64_t v30 = *(void *)(v0 + 296);
  uint64_t v31 = *(void *)(v0 + 304);
  uint64_t v32 = *(void *)(v0 + 208);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v29, v28, v30);
  sub_23785B470();
  swift_allocObject();
  *(void *)(v0 + 520) = sub_23785B460();
  uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  *(void *)(v0 + 528) = v33;
  *(void *)(v0 + 536) = (v31 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v33(v28, v30);
  sub_237819FF0(v32 + 80, v0 + 56);
  if (*(void *)(v0 + 80))
  {
    uint64_t v34 = (void *)(v0 + 16);
    sub_23778EF44((long long *)(v0 + 56), v0 + 16);
    uint64_t v35 = OUTLINED_FUNCTION_13_12();
    v36(v35);
    swift_bridgeObjectRetain_n();
    uint64_t v37 = sub_23785B490();
    os_log_type_t v38 = sub_23785B8A0();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v66 = *(void *)(v0 + 416);
      uint64_t v67 = *(void *)(v0 + 456);
      uint64_t v40 = *(void *)(v0 + 176);
      uint64_t v39 = *(void *)(v0 + 184);
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v72 = swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 136315138;
      if (v39)
      {
        unint64_t v42 = v3;
      }
      else
      {
        uint64_t v40 = 0x3E6C696E3CLL;
        unint64_t v42 = 0xE500000000000000;
      }
      swift_bridgeObjectRetain();
      *(void *)(v0 + 136) = sub_2377C6A68(v40, v42, &v72);
      sub_23785B9E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237778000, v37, v38, "AppsSearcher.searchApps aceAppsResolver is available, performing on device app search based on %s", v41, 0xCu);
      swift_arrayDestroy();
      uint64_t v34 = (void *)(v0 + 16);
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      uint64_t v43 = v66;
      uint64_t v44 = v67;
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v44 = OUTLINED_FUNCTION_25_0();
    }
    v69(v44, v43);
    uint64_t v53 = *(void *)(v0 + 40);
    uint64_t v54 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1(v34, v53);
    OUTLINED_FUNCTION_26_9();
    uint64_t v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v58 + *v58);
    uint64_t v56 = (void *)swift_task_alloc();
    *(void *)(v0 + 544) = v56;
    *uint64_t v56 = v0;
    id v57 = sub_237818C7C;
  }
  else
  {
    sub_23778A330(v0 + 56, &qword_2689280A0);
    uint64_t v45 = OUTLINED_FUNCTION_13_12();
    v46(v45);
    uint64_t v47 = sub_23785B490();
    os_log_type_t v48 = sub_23785B8A0();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)OUTLINED_FUNCTION_4_4();
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl(&dword_237778000, v47, v48, "AppsSearcher.searchApps falling back to regexAppsResolver", v49, 2u);
      OUTLINED_FUNCTION_5_3();
    }
    uint64_t v50 = *(void *)(v0 + 424);
    uint64_t v51 = *(void **)(v0 + 208);

    *(void *)(v0 + 568) = (v50 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v52 = OUTLINED_FUNCTION_25_0();
    ((void (*)(uint64_t))v69)(v52);
    uint64_t v53 = v51[8];
    uint64_t v54 = v51[9];
    __swift_project_boxed_opaque_existential_1(v51 + 5, v53);
    OUTLINED_FUNCTION_26_9();
    uint64_t v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v55 + *v55);
    uint64_t v56 = (void *)swift_task_alloc();
    *(void *)(v0 + 576) = v56;
    *uint64_t v56 = v0;
    id v57 = sub_23781902C;
  }
  v56[1] = v57;
  uint64_t v59 = *(void *)(v0 + 192);
  uint64_t v60 = *(void *)(v0 + 200);
  uint64_t v62 = *(void *)(v0 + 176);
  uint64_t v61 = *(void *)(v0 + 184);
  return v70(v62, v61, v59, v60, v53, v54);
}

uint64_t sub_237818C7C()
{
  OUTLINED_FUNCTION_0_2();
  *(void *)(v2 + 552) = v1;
  *(void *)(v2 + 560) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v3 = sub_237819B50;
  }
  else {
    unint64_t v3 = sub_237818D70;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_237818D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  OUTLINED_FUNCTION_8_11();
  OUTLINED_FUNCTION_27_9();
  OUTLINED_FUNCTION_17_14();
  __swift_destroy_boxed_opaque_existential_1(v39);
  uint64_t v40 = sub_23785B420();
  OUTLINED_FUNCTION_16_12();
  os_signpost_type_t v41 = sub_23785B950();
  if (sub_23785B9B0())
  {
    swift_retain();
    sub_23785B480();
    swift_release();
    uint64_t v42 = OUTLINED_FUNCTION_6_14();
    int v44 = v43(v42);
    uint64_t v45 = v38[46];
    if (v44 != *MEMORY[0x263F90238])
    {
      OUTLINED_FUNCTION_11_9();
      v48();
    }
    uint64_t v49 = (_WORD *)OUTLINED_FUNCTION_4_4();
    os_signpost_id_t v50 = OUTLINED_FUNCTION_19_10(v49);
    OUTLINED_FUNCTION_10_13(&dword_237778000, v51, v41, v50, "appsSearcherSearchApps");
    OUTLINED_FUNCTION_5_3();
    uint64_t v66 = v38[46];
    uint64_t v47 = (void *)v40;
    uint64_t v46 = v45;
  }
  else
  {
    uint64_t v46 = v38[46];
    uint64_t v66 = v46;
    a11 = v38[69];
    uint64_t v47 = (void *)v40;
  }
  uint64_t v52 = (void (*)(uint64_t, uint64_t))v38[66];
  uint64_t v67 = v38[59];
  uint64_t v68 = v38[58];
  uint64_t v69 = v38[57];
  uint64_t v70 = v38[56];
  uint64_t v71 = v38[55];
  uint64_t v72 = v38[54];
  uint64_t v53 = v38[50];
  uint64_t v54 = v38[51];
  uint64_t v55 = v38[49];
  uint64_t v73 = v38[48];
  uint64_t v74 = v38[47];
  uint64_t v75 = v38[45];
  uint64_t v76 = v38[44];
  uint64_t v77 = v38[43];
  uint64_t v78 = v38[42];
  uint64_t v79 = v38[41];
  uint64_t v80 = v38[40];
  uint64_t v56 = v38[37];
  OUTLINED_FUNCTION_1_11(v47);
  v52(v46, v56);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v54, v55);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_10();
  return v59(v57, v58, v59, v60, v61, v62, v63, v64, a9, v66, a11, v67, v68, v69, v70, v71, v72, v73, v74,
           v75,
           v76,
           v77,
           v78,
           v79,
           v80,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38);
}

uint64_t sub_23781902C()
{
  OUTLINED_FUNCTION_0_2();
  *(void *)(v2 + 584) = v1;
  *(void *)(v2 + 592) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v3 = sub_237819DA0;
  }
  else {
    unint64_t v3 = sub_237819120;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_237819120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  OUTLINED_FUNCTION_8_11();
  OUTLINED_FUNCTION_27_9();
  (*(void (**)(void, void, void))(v38 + 496))(*(void *)(v38 + 448), *(void *)(v38 + 488), *(void *)(v38 + 416));
  swift_bridgeObjectRetain_n();
  uint64_t v39 = (void *)sub_23785B490();
  os_log_type_t v40 = sub_23785B8A0();
  if (OUTLINED_FUNCTION_23_2(v40))
  {
    uint64_t v152 = *(void (**)(uint64_t, uint64_t))(v38 + 512);
    uint64_t v148 = *(void *)(v38 + 416);
    uint64_t v150 = *(void *)(v38 + 448);
    os_signpost_type_t v41 = (_DWORD *)OUTLINED_FUNCTION_15_10();
    a34 = swift_slowAlloc();
    *os_signpost_type_t v41 = 136315138;
    uint64_t v42 = type metadata accessor for Application();
    uint64_t v43 = swift_bridgeObjectRetain();
    MEMORY[0x237E22360](v43, v42);
    swift_bridgeObjectRelease();
    uint64_t v44 = OUTLINED_FUNCTION_25_0();
    *(void *)(v38 + 128) = sub_2377C6A68(v44, v45, v46);
    sub_23785B9E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_11_7(&dword_237778000, v47, v48, "AppsSearcher.searchApps via regex found apps: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();

    v152(v150, v148);
  }
  else
  {
    uint64_t v49 = *(void (**)(uint64_t))(v38 + 512);
    swift_bridgeObjectRelease_n();

    uint64_t v50 = OUTLINED_FUNCTION_25_0();
    v49(v50);
  }
  unint64_t v51 = *(void *)(v38 + 584);
  if (v51 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_23785BCC0();
    swift_bridgeObjectRelease();
    if (v52) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v52 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v52) {
      goto LABEL_15;
    }
  }
  uint64_t v53 = *(void *)(v38 + 200);
  if (v53)
  {
    uint64_t v54 = *(void **)(v38 + 208);
    uint64_t v55 = *(void *)(v38 + 192);
    uint64_t v56 = v54[3];
    uint64_t v57 = v54[4];
    __swift_project_boxed_opaque_existential_1(v54, v56);
    uint64_t v58 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v57 + 16))(v55, v53, v54[20], v56, v57);
    if (v58)
    {
      uint64_t v59 = (void *)v58;
      uint64_t v60 = *(void (**)(uint64_t, uint64_t, void *))(v38 + 496);
      uint64_t v61 = *(void *)(v38 + 488);
      uint64_t v62 = *(void *)(v38 + 440);
      uint64_t v63 = *(void **)(v38 + 416);
      swift_bridgeObjectRelease();
      v60(v62, v61, v63);
      id v64 = v59;
      uint64_t v65 = (void *)sub_23785B490();
      os_log_type_t v66 = sub_23785B8A0();
      if (OUTLINED_FUNCTION_23_2(v66))
      {
        OUTLINED_FUNCTION_15_10();
        uint64_t v154 = v64;
        uint64_t v67 = (void *)swift_slowAlloc();
        OUTLINED_FUNCTION_25_7(5.7779e-34);
        *(void *)(v38 + 144) = v68;
        id v69 = v154;
        OUTLINED_FUNCTION_21_11();
        *uint64_t v67 = v59;

        OUTLINED_FUNCTION_11_7(&dword_237778000, v70, v71, "AppsSearcher.searchApps via bundleId found app: %@");
        __swift_instantiateConcreteTypeFromMangledName(&qword_268927028);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5_3();
        OUTLINED_FUNCTION_5_3();
      }
      else
      {
      }
      uint64_t v72 = (uint64_t *)(v38 + 360);
      uint64_t v52 = *(void *)(v38 + 360);
      (*(void (**)(void, void))(v38 + 512))(*(void *)(v38 + 440), *(void *)(v38 + 416));
      __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE0);
      uint64_t v73 = (__n128 *)swift_allocObject();
      OUTLINED_FUNCTION_24_8(v73, (__n128)xmmword_23785DFE0);
      uint64_t v74 = a34;
      uint64_t v75 = sub_23785B420();
      OUTLINED_FUNCTION_16_12();
      sub_23785B950();
      if (OUTLINED_FUNCTION_23_11())
      {
        OUTLINED_FUNCTION_28_10();
        sub_23785B480();
        swift_release();
        uint64_t v76 = OUTLINED_FUNCTION_4_19();
        if (v77(v76) != *MEMORY[0x263F90238]) {
          goto LABEL_36;
        }
        goto LABEL_32;
      }
      goto LABEL_34;
    }
  }
LABEL_15:
  if (*(unsigned char *)(v38 + 600) != 1)
  {
    OUTLINED_FUNCTION_17_14();
    uint64_t v75 = sub_23785B420();
    sub_23785B450();
    sub_23785B950();
    if ((OUTLINED_FUNCTION_23_11() & 1) == 0)
    {
      uint64_t v127 = *(void *)(v38 + 584);
      uint64_t v97 = *(void *)(v38 + 328);
LABEL_35:
      uint64_t v128 = v97;
      goto LABEL_38;
    }
    uint64_t v72 = (uint64_t *)(v38 + 328);
    uint64_t v93 = *(void *)(v38 + 248);
    uint64_t v94 = *(void *)(v38 + 216);
    uint64_t v95 = *(void *)(v38 + 224);
    swift_retain();
    sub_23785B480();
    swift_release();
    int v96 = (*(uint64_t (**)(uint64_t, uint64_t))(v95 + 88))(v93, v94);
    uint64_t v74 = *(void *)(v38 + 584);
    if (v96 != *MEMORY[0x263F90238]) {
      goto LABEL_36;
    }
LABEL_32:
    uint64_t v127 = v74;
    uint64_t v105 = *v72;
LABEL_33:
    v106 = "[Error] Interval already ended";
LABEL_37:
    BOOL v108 = (uint8_t *)OUTLINED_FUNCTION_4_4();
    *(_WORD *)BOOL v108 = 0;
    uint64_t v128 = v105;
    os_signpost_id_t v109 = sub_23785B3E0();
    _os_signpost_emit_with_name_impl(&dword_237778000, v75, (os_signpost_type_t)v52, v109, "appsSearcherSearchApps", v106, v108, 2u);
    OUTLINED_FUNCTION_5_3();
    goto LABEL_38;
  }
  unint64_t v78 = *(void *)(v38 + 584);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v38 + 208) + 120), *(void *)(*(void *)(v38 + 208) + 144));
  uint64_t v79 = sub_23781B15C(v78);
  if (v79)
  {
    uint64_t v80 = (void *)v79;
    uint64_t v81 = *(void (**)(uint64_t, uint64_t, void *))(v38 + 496);
    uint64_t v82 = *(void *)(v38 + 488);
    uint64_t v83 = *(void *)(v38 + 432);
    uint64_t v84 = *(void **)(v38 + 416);
    swift_bridgeObjectRelease();
    v81(v83, v82, v84);
    id v85 = v80;
    uint64_t v86 = (void *)sub_23785B490();
    os_log_type_t v87 = sub_23785B8A0();
    if (OUTLINED_FUNCTION_23_2(v87))
    {
      OUTLINED_FUNCTION_15_10();
      uint64_t v155 = v85;
      uint64_t v88 = (void *)swift_slowAlloc();
      OUTLINED_FUNCTION_25_7(5.7779e-34);
      *(void *)(v38 + 160) = v89;
      id v90 = v155;
      OUTLINED_FUNCTION_21_11();
      *uint64_t v88 = v80;

      OUTLINED_FUNCTION_11_7(&dword_237778000, v91, v92, "AppsSearcher.searchApps selected single app of: %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_268927028);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();
    }
    else
    {
    }
    uint64_t v72 = (uint64_t *)(v38 + 352);
    uint64_t v52 = *(void *)(v38 + 352);
    (*(void (**)(void, void))(v38 + 512))(*(void *)(v38 + 432), *(void *)(v38 + 416));
    __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE0);
    char v102 = (__n128 *)swift_allocObject();
    OUTLINED_FUNCTION_24_8(v102, (__n128)xmmword_23785DFE0);
    uint64_t v74 = a34;
    uint64_t v75 = sub_23785B420();
    OUTLINED_FUNCTION_16_12();
    sub_23785B950();
    if (OUTLINED_FUNCTION_23_11())
    {
      OUTLINED_FUNCTION_28_10();
      sub_23785B480();
      swift_release();
      uint64_t v103 = OUTLINED_FUNCTION_4_19();
      if (v104(v103) == *MEMORY[0x263F90238]) {
        goto LABEL_32;
      }
LABEL_36:
      uint64_t v127 = v74;
      uint64_t v105 = *v72;
      OUTLINED_FUNCTION_11_9();
      v107();
      v106 = "";
      goto LABEL_37;
    }
LABEL_34:
    uint64_t v127 = v74;
    uint64_t v97 = *v72;
    goto LABEL_35;
  }
  if (v52)
  {
    sub_2377C72E4(0, (v51 & 0xC000000000000001) == 0, *(void *)(v38 + 584));
    if ((v51 & 0xC000000000000001) != 0) {
      id v98 = (id)MEMORY[0x237E22750](0, *(void *)(v38 + 584));
    }
    else {
      id v98 = *(id *)(*(void *)(v38 + 584) + 32);
    }
    uint64_t v52 = *(void *)(v38 + 408);
    uint64_t v72 = (uint64_t *)(v38 + 344);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE0);
    uint64_t v99 = swift_allocObject();
    *(_OWORD *)(v99 + 16) = xmmword_23785DFE0;
    *(void *)(v99 + 32) = v98;
    a34 = v99;
    sub_23785B7C0();
    uint64_t v74 = a34;
    uint64_t v75 = sub_23785B420();
    sub_23785B450();
    sub_23785B950();
    if (OUTLINED_FUNCTION_23_11())
    {
      OUTLINED_FUNCTION_28_10();
      sub_23785B480();
      swift_release();
      uint64_t v100 = OUTLINED_FUNCTION_4_19();
      if (v101(v100) != *MEMORY[0x263F90238]) {
        goto LABEL_36;
      }
      goto LABEL_32;
    }
    goto LABEL_34;
  }
  OUTLINED_FUNCTION_17_14();
  uint64_t v72 = (uint64_t *)(v38 + 336);
  swift_bridgeObjectRelease();
  uint64_t v75 = sub_23785B420();
  sub_23785B450();
  sub_23785B950();
  if (OUTLINED_FUNCTION_23_11())
  {
    OUTLINED_FUNCTION_28_10();
    sub_23785B480();
    swift_release();
    uint64_t v125 = OUTLINED_FUNCTION_4_19();
    if (v126(v125) == *MEMORY[0x263F90238])
    {
      uint64_t v105 = *v72;
      uint64_t v127 = MEMORY[0x263F8EE78];
      goto LABEL_33;
    }
    uint64_t v74 = MEMORY[0x263F8EE78];
    goto LABEL_36;
  }
  uint64_t v128 = *v72;
  uint64_t v127 = MEMORY[0x263F8EE78];
LABEL_38:
  uint64_t v110 = v75;
  unint64_t v111 = *(void (**)(uint64_t, uint64_t))(v38 + 528);
  uint64_t v129 = *(void *)(v38 + 464);
  uint64_t v130 = *(void *)(v38 + 456);
  uint64_t v131 = *(void *)(v38 + 448);
  uint64_t v132 = *(void *)(v38 + 440);
  uint64_t v112 = *(void *)(v38 + 400);
  uint64_t v113 = *(void *)(v38 + 408);
  uint64_t v114 = *(void *)(v38 + 392);
  uint64_t v133 = *(void *)(v38 + 432);
  uint64_t v134 = *(void *)(v38 + 384);
  uint64_t v135 = *(void *)(v38 + 376);
  uint64_t v136 = *(void *)(v38 + 368);
  uint64_t v137 = *(void *)(v38 + 360);
  uint64_t v138 = *(void *)(v38 + 352);
  uint64_t v139 = *(void *)(v38 + 344);
  uint64_t v140 = *(void *)(v38 + 336);
  uint64_t v141 = *(void *)(v38 + 328);
  uint64_t v142 = *(void *)(v38 + 320);
  uint64_t v115 = *(void *)(v38 + 296);
  uint64_t v143 = *(void *)(v38 + 312);
  uint64_t v144 = *(void *)(v38 + 288);
  uint64_t v145 = *(void *)(v38 + 280);
  uint64_t v146 = *(void *)(v38 + 272);
  uint64_t v147 = *(void *)(v38 + 264);
  uint64_t v149 = *(void *)(v38 + 256);
  uint64_t v151 = *(void *)(v38 + 248);
  uint64_t v153 = *(void *)(v38 + 240);
  uint64_t v156 = *(void *)(v38 + 232);

  v111(v128, v115);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v113, v114);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_10();
  return v118(v116, v117, v118, v119, v120, v121, v122, v123, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137,
           v138,
           v139,
           v140,
           v141,
           v142,
           v143,
           v144,
           v145,
           v146,
           v147,
           v149,
           v151,
           v153,
           v156,
           a34,
           a35,
           a36,
           a37,
           a38);
}

uint64_t sub_237819B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  OUTLINED_FUNCTION_8_11();
  OUTLINED_FUNCTION_27_9();
  OUTLINED_FUNCTION_17_14();
  __swift_destroy_boxed_opaque_existential_1(v39);
  sub_23785B420();
  OUTLINED_FUNCTION_16_12();
  os_signpost_type_t v40 = sub_23785B950();
  if (sub_23785B9B0())
  {
    swift_retain();
    sub_23785B480();
    swift_release();
    uint64_t v41 = OUTLINED_FUNCTION_6_14();
    int v43 = v42(v41);
    uint64_t v44 = v38[40];
    if (v43 != *MEMORY[0x263F90238])
    {
      OUTLINED_FUNCTION_11_9();
      v45();
    }
    uint64_t v46 = (_WORD *)OUTLINED_FUNCTION_4_4();
    os_signpost_id_t v47 = OUTLINED_FUNCTION_19_10(v46);
    OUTLINED_FUNCTION_10_13(&dword_237778000, v48, v40, v47, "appsSearcherSearchApps");
    OUTLINED_FUNCTION_5_3();
    uint64_t v63 = v38[40];
  }
  else
  {
    uint64_t v44 = v38[40];
    uint64_t v63 = v44;
    a11 = v38[70];
  }
  uint64_t v49 = (void (*)(uint64_t, uint64_t))v38[66];
  OUTLINED_FUNCTION_2_14();
  uint64_t v50 = v38[37];
  OUTLINED_FUNCTION_1_11(v51);
  v49(v44, v50);
  swift_release();
  uint64_t v52 = OUTLINED_FUNCTION_14_9();
  v53(v52);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_10();
  return v55(v54, v55, v56, v57, v58, v59, v60, v61, a9, v63, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38);
}

uint64_t sub_237819DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  OUTLINED_FUNCTION_8_11();
  OUTLINED_FUNCTION_27_9();
  OUTLINED_FUNCTION_17_14();
  sub_23785B420();
  OUTLINED_FUNCTION_16_12();
  os_signpost_type_t v39 = sub_23785B950();
  if (sub_23785B9B0())
  {
    swift_retain();
    sub_23785B480();
    swift_release();
    uint64_t v40 = OUTLINED_FUNCTION_6_14();
    int v42 = v41(v40);
    uint64_t v43 = v38[39];
    if (v42 != *MEMORY[0x263F90238])
    {
      OUTLINED_FUNCTION_11_9();
      v45();
    }
    uint64_t v46 = (_WORD *)OUTLINED_FUNCTION_4_4();
    os_signpost_id_t v47 = OUTLINED_FUNCTION_19_10(v46);
    OUTLINED_FUNCTION_10_13(&dword_237778000, v48, v39, v47, "appsSearcherSearchApps");
    OUTLINED_FUNCTION_5_3();
    uint64_t v63 = v38[39];
    uint64_t v44 = v43;
  }
  else
  {
    uint64_t v44 = v38[39];
    uint64_t v63 = v44;
    a11 = v38[74];
  }
  uint64_t v49 = (void (*)(uint64_t, uint64_t))v38[66];
  OUTLINED_FUNCTION_2_14();
  uint64_t v50 = v38[37];
  OUTLINED_FUNCTION_1_11(v51);
  v49(v44, v50);
  swift_release();
  uint64_t v52 = OUTLINED_FUNCTION_14_9();
  v53(v52);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_10();
  return v55(v54, v55, v56, v57, v58, v59, v60, v61, a9, v63, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38);
}

uint64_t sub_237819FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689280A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23781A058()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return MEMORY[0x270FA0238](v0, 104, 7);
}

void OUTLINED_FUNCTION_1_11(void *a1@<X8>)
{
  uint64_t v4 = v1[34];
  *(void *)(v2 - 136) = v1[35];
  *(void *)(v2 - 128) = v4;
  uint64_t v5 = v1[32];
  *(void *)(v2 - 120) = v1[33];
  *(void *)(v2 - 112) = v5;
  uint64_t v6 = v1[30];
  *(void *)(v2 - 104) = v1[31];
  *(void *)(v2 - 96) = v6;
  *(void *)(v2 - 88) = v1[29];
}

uint64_t OUTLINED_FUNCTION_4_19()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_14()
{
  return v0;
}

void OUTLINED_FUNCTION_10_13(void *a1, uint64_t a2, os_signpost_type_t a3, os_signpost_id_t a4, const char *a5)
{
  _os_signpost_emit_with_name_impl(a1, v7, a3, a4, a5, v5, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_13_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_10()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_16_12()
{
  return sub_23785B450();
}

uint64_t OUTLINED_FUNCTION_19_10(_WORD *a1)
{
  *a1 = 0;
  return sub_23785B3E0();
}

uint64_t OUTLINED_FUNCTION_21_11()
{
  return sub_23785B9E0();
}

uint64_t OUTLINED_FUNCTION_23_11()
{
  return sub_23785B9B0();
}

uint64_t OUTLINED_FUNCTION_24_8(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  *(void *)(v3 - 88) = a1;
  return sub_23785B7C0();
}

void OUTLINED_FUNCTION_25_7(float a1)
{
  *uint64_t v1 = a1;
}

void OUTLINED_FUNCTION_26_9()
{
  *(void *)(v1 - 88) = v0 + 8;
}

uint64_t OUTLINED_FUNCTION_28_10()
{
  return swift_retain();
}

id sub_23781A300()
{
  sub_23778F458(0, &qword_2689280A8);
  sub_23778F458(0, &qword_2689280B0);
  swift_bridgeObjectRetain();
  id v0 = sub_23781A3F0();
  id v1 = sub_23781A454(v0);
  uint64_t v4 = v1;
  if (v1)
  {
    id v5 = objc_msgSend(v1, sel_currentState);
    if (v5)
    {
      uint64_t v6 = v5;
      id v2 = objc_msgSend(v5, sel_isRunning);

      return v2;
    }
  }
  return 0;
}

id sub_23781A3F0()
{
  id v0 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_predicateMatchingBundleIdentifier_, v0);

  return v1;
}

id sub_23781A454(void *a1)
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  v6[0] = 0;
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_handleForPredicate_error_, a1, v6);
  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_237859300();

    swift_willThrow();
  }

  return v2;
}

ValueMetadata *type metadata accessor for AppTerminationProvider()
{
  return &type metadata for AppTerminationProvider;
}

id sub_23781A538(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_23785B4B0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v46 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v46 - v13;
  if (qword_26AF0BC80 != -1) {
    swift_once();
  }
  uint64_t v15 = InstalledAppProvider.getRecord(byBundleId:for:)();
  if (!v15)
  {
    uint64_t v27 = a1;
    if (qword_2689266D8 != -1) {
      uint64_t v15 = swift_once();
    }
    OUTLINED_FUNCTION_1_12(v15, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_2_15();
    v28();
    swift_bridgeObjectRetain_n();
    uint64_t v29 = sub_23785B490();
    os_log_type_t v30 = sub_23785B8B0();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v49 = v5;
      uint64_t v51 = v32;
      *(_DWORD *)uint64_t v31 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_2377C6A68(v27, a2, &v51);
      OUTLINED_FUNCTION_3_19(v33);
      sub_23785B9E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237778000, v29, v30, "CarPlayUtil.hasCarPlaySupport ApplicationRecord for %s not found.", v31, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      uint64_t v34 = *(void (**)(char *, uint64_t))(v6 + 8);
      uint64_t v35 = v9;
LABEL_17:
      uint64_t v44 = v49;
LABEL_22:
      v34(v35, v44);
      return 0;
    }

    swift_bridgeObjectRelease_n();
    uint64_t v34 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v35 = v9;
LABEL_21:
    uint64_t v44 = v5;
    goto LABEL_22;
  }
  uint64_t v16 = (void *)v15;
  id v17 = objc_msgSend(self, sel_declarationForAppRecord_, v15);
  if (!v17)
  {
    if (qword_2689266D8 != -1) {
      id v17 = (id)swift_once();
    }
    OUTLINED_FUNCTION_1_12((uint64_t)v17, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_2_15();
    v36();
    swift_bridgeObjectRetain_n();
    uint64_t v37 = sub_23785B490();
    os_log_type_t v38 = sub_23785B8B0();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = swift_slowAlloc();
      id v47 = v16;
      uint64_t v40 = a1;
      uint64_t v41 = (uint8_t *)v39;
      uint64_t v42 = swift_slowAlloc();
      uint64_t v49 = v5;
      uint64_t v51 = v42;
      *(_DWORD *)uint64_t v41 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_2377C6A68(v40, a2, &v51);
      OUTLINED_FUNCTION_3_19(v43);
      sub_23785B9E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237778000, v37, v38, "Unable to get CarPlayAppDeclaration for %s", v41, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      uint64_t v34 = *(void (**)(char *, uint64_t))(v6 + 8);
      uint64_t v35 = v12;
      goto LABEL_17;
    }

    swift_bridgeObjectRelease_n();
    uint64_t v34 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v35 = v12;
    goto LABEL_21;
  }
  unint64_t v18 = v17;
  id v48 = objc_msgSend(*(id *)(v2 + 16), sel_effectivePolicyForAppDeclaration_, v17);
  id v19 = objc_msgSend(v48, sel_isCarPlaySupported);
  id v20 = v19;
  if (qword_2689266D8 != -1) {
    id v19 = (id)swift_once();
  }
  OUTLINED_FUNCTION_1_12((uint64_t)v19, (uint64_t)qword_268928BC8);
  OUTLINED_FUNCTION_2_15();
  v21();
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_23785B490();
  os_log_type_t v23 = sub_23785B8A0();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v46 = v6;
    uint64_t v25 = v24;
    uint64_t v26 = swift_slowAlloc();
    id v47 = v16;
    uint64_t v51 = v26;
    *(_DWORD *)uint64_t v25 = 136315394;
    uint64_t v49 = v5;
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_2377C6A68(a1, a2, &v51);
    sub_23785B9E0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v25 + 12) = 1024;
    LODWORD(v50) = v20;
    sub_23785B9E0();
    _os_log_impl(&dword_237778000, v22, v23, "CarPlaySupportProvider support for %s = %{BOOL}d", (uint8_t *)v25, 0x12u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();

    (*(void (**)(char *, uint64_t))(v46 + 8))(v14, v49);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
  }
  return v20;
}

uint64_t sub_23781ABC0()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for CarPlaySupportProvider()
{
  return self;
}

uint64_t sub_23781AC1C()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F30E78]), sel_init);
  objc_msgSend(v1, sel_setGeoSupported_, 1);
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_12(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(v2, a2);
}

uint64_t OUTLINED_FUNCTION_3_19(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

ValueMetadata *type metadata accessor for CoreDuetAppSelectionResolver()
{
  return &type metadata for CoreDuetAppSelectionResolver;
}

id sub_23781ACC4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!(a1 >> 62))
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_3;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_21:
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_23785BCC0();
  if (!v6) {
    goto LABEL_22;
  }
LABEL_3:
  uint64_t v7 = 4;
  while (1)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v8 = (id)MEMORY[0x237E22750](v7 - 4, a1);
    }
    else {
      id v8 = *(id *)(a1 + 8 * v7);
    }
    uint64_t v9 = v8;
    uint64_t v10 = v7 - 3;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    id result = objc_msgSend(v8, sel_value);
    if (!result) {
      break;
    }
    uint64_t v12 = sub_23781F478(result);
    if (v13)
    {
      if (v12 == a2 && v13 == a3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_19:
        swift_bridgeObjectRelease();
        return v9;
      }
      char v15 = sub_23785BE30();
      swift_bridgeObjectRelease();
      if (v15)
      {
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
    }

    ++v7;
    if (v10 == v6) {
      goto LABEL_22;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23781AE70(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v30 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_40;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
  {
LABEL_41:
    uint64_t v23 = MEMORY[0x263F8EE78];
    goto LABEL_42;
  }
LABEL_3:
  unint64_t v5 = 0;
  uint64_t v28 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v29 = v3 & 0xC000000000000001;
  uint64_t v26 = v3;
  uint64_t v27 = v3 + 32;
  uint64_t v25 = v4;
  while (1)
  {
    if (v29)
    {
      id v6 = (id)MEMORY[0x237E22750](v5, v3);
    }
    else
    {
      if (v5 >= *(void *)(v28 + 16))
      {
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        uint64_t v4 = sub_23785BCC0();
        if (!v4) {
          goto LABEL_41;
        }
        goto LABEL_3;
      }
      id v6 = *(id *)(v27 + 8 * v5);
    }
    uint64_t v7 = v6;
    if (__OFADD__(v5++, 1)) {
      goto LABEL_39;
    }
    if (!(a2 >> 62))
    {
      uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v9 = v6;
      swift_bridgeObjectRetain();
      if (v3) {
        break;
      }
      goto LABEL_28;
    }
    id v22 = v6;
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_23785BCC0();
    if (v3) {
      break;
    }
LABEL_28:

    swift_bridgeObjectRelease();
LABEL_32:
    uint64_t v3 = v26;
    if (v5 == v25)
    {
      uint64_t v23 = v30;
LABEL_42:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v23;
    }
  }
  uint64_t v10 = 4;
  while (1)
  {
    if ((a2 & 0xC000000000000001) != 0) {
      id v11 = (id)MEMORY[0x237E22750](v10 - 4, a2);
    }
    else {
      id v11 = *(id *)(a2 + 8 * v10);
    }
    uint64_t v12 = v11;
    uint64_t v13 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    uint64_t v14 = sub_23778BEE8(v11);
    uint64_t v16 = v15;
    id v17 = objc_msgSend(v7, sel_value);
    if (!v17) {
      break;
    }
    uint64_t v18 = sub_23781F478(v17);
    if (!v16)
    {
      if (!v19)
      {

        swift_bridgeObjectRelease();
        goto LABEL_31;
      }
LABEL_26:

      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    if (!v19) {
      goto LABEL_26;
    }
    if (v14 == v18 && v16 == v19)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_30:
      swift_bridgeObjectRelease();
LABEL_31:
      sub_23785BBF0();
      sub_23785BC20();
      sub_23785BC30();
      sub_23785BC00();
      goto LABEL_32;
    }
    char v21 = sub_23785BE30();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v21)
    {

      goto LABEL_30;
    }
LABEL_27:
    ++v10;
    if (v13 == v3) {
      goto LABEL_28;
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_23781B15C(unint64_t isUniquelyReferenced_nonNull_native)
{
  uint64_t v2 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v158 = v3;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v154 = (char *)&v145 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v153 = (char *)&v145 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v152 = (char *)&v145 - v9;
  sub_2378593F0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v156 = v11;
  *(void *)&long long v157 = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_5_0();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_2378594A0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_5_0();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = sub_2378594B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v24 = v23;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_5_0();
  uint64_t v28 = v27 - v26;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  MEMORY[0x270FA5388](v29 - 8);
  OUTLINED_FUNCTION_5_0();
  uint64_t v32 = v31 - v30;
  unint64_t v33 = isUniquelyReferenced_nonNull_native >> 62;
  unint64_t v159 = isUniquelyReferenced_nonNull_native;
  uint64_t v34 = (void *)(isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8);
  if (isUniquelyReferenced_nonNull_native >> 62)
  {
    if ((isUniquelyReferenced_nonNull_native & 0x8000000000000000) != 0) {
      uint64_t v34 = (void *)isUniquelyReferenced_nonNull_native;
    }
    id v151 = v34;
    unint64_t v147 = isUniquelyReferenced_nonNull_native >> 62;
    swift_bridgeObjectRetain();
    uint64_t v37 = v2;
    uint64_t v38 = sub_23785BCC0();
    swift_bridgeObjectRelease();
    unint64_t v33 = v147;
    BOOL v39 = v38 == 1;
    uint64_t v2 = v37;
    isUniquelyReferenced_nonNull_native = v159;
    if (v39)
    {
      swift_bridgeObjectRetain();
      if (sub_23785BCC0()) {
        goto LABEL_4;
      }
      swift_bridgeObjectRelease();
      unint64_t v33 = v147;
    }
  }
  else if (*(void *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10) == 1)
  {
    swift_bridgeObjectRetain();
LABEL_4:
    sub_2377C72E4(0, (isUniquelyReferenced_nonNull_native & 0xC000000000000001) == 0, isUniquelyReferenced_nonNull_native);
    if ((isUniquelyReferenced_nonNull_native & 0xC000000000000001) != 0) {
LABEL_83:
    }
      id v35 = (id)MEMORY[0x237E22750](0, isUniquelyReferenced_nonNull_native);
    else {
      id v35 = *(id *)(isUniquelyReferenced_nonNull_native + 32);
    }
    uint64_t v36 = v35;
    swift_bridgeObjectRelease();
    return (uint64_t)v36;
  }
  unint64_t v147 = v33;
  uint64_t v148 = v2;
  sub_23778F458(0, &qword_2689280B8);
  id v151 = sub_23781C2A0();
  sub_237859490();
  (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v21, *MEMORY[0x263F078A8], v15);
  sub_2378593E0();
  sub_237859480();
  uint64_t v40 = (void (*)(uint64_t, uint64_t))*((void *)v156 + 1);
  uint64_t v41 = v14;
  uint64_t v42 = v157;
  v40(v41, v157);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v21, v15);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v28, v22);
  uint64_t v43 = 0;
  if (__swift_getEnumTagSinglePayload(v32, 1, v42) != 1)
  {
    uint64_t v43 = (void *)sub_237859390();
    v40(v32, v42);
  }
  uint64_t v44 = self;
  id v45 = objc_msgSend(v44, sel_predicateForEventsWithStartDateAfter_, v43);

  __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE0);
  uint64_t v46 = swift_allocObject();
  long long v157 = xmmword_23785DFE0;
  *(_OWORD *)(v46 + 16) = xmmword_23785DFE0;
  id v47 = v151;
  *(void *)(v46 + 32) = v151;
  v161[0] = v46;
  sub_23785B7C0();
  uint64_t v48 = v161[0];
  uint64_t v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = v157;
  id v150 = v47;
  id v50 = objc_msgSend(v44, sel_startDateSortDescriptorAscending_, 0);
  uint64_t v51 = v158;
  if (!v50)
  {
LABEL_89:
    __break(1u);
LABEL_90:
    sub_23785BE60();
    __break(1u);
LABEL_91:
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  id v52 = v50;
  sub_23778F458(0, &qword_2689280C0);
  *(void *)(v49 + 32) = v52;
  v161[0] = v49;
  sub_23785B7C0();
  uint64_t v53 = v161[0];
  id v149 = v45;
  id v54 = sub_23781C304(v45, v48, 0, 150, v53);
  sub_237781F08(v155, (uint64_t)v161);
  uint64_t v55 = v162;
  uint64_t v56 = v163;
  __swift_project_boxed_opaque_existential_1(v161, v162);
  uint64_t v57 = *(uint64_t (**)(id, uint64_t, uint64_t))(v56 + 8);
  id v58 = v54;
  uint64_t v59 = v57(v54, v55, v56);
  id v151 = v58;
  uint64_t v60 = (void *)v59;

  id v61 = v60;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v161);
  self;
  if (!swift_dynamicCastObjCClass()
    || (v161[0] = 0,
        sub_23778F458(0, &qword_2689280D0),
        id v62 = v61,
        sub_23785B790(),
        v62,
        (unint64_t v63 = v161[0]) == 0))
  {
    if (qword_2689266D8 != -1) {
      goto LABEL_85;
    }
    goto LABEL_26;
  }

  isUniquelyReferenced_nonNull_native = v159;
  swift_bridgeObjectRetain();
  unint64_t v64 = sub_23781AE70(v63, isUniquelyReferenced_nonNull_native);
  unint64_t v65 = v64;
  if (v64 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_23785BCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v66 = *(void *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v67 = v151;
  if (!v66)
  {
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_2_16();
    OUTLINED_FUNCTION_1_13();

    return 0;
  }
  type metadata accessor for Application();
  uint64_t v155 = sub_23785B650();
  if (v147)
  {
    swift_bridgeObjectRetain();
    uint64_t v68 = sub_23785BCC0();
  }
  else
  {
    uint64_t v68 = *(void *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v156 = (uint8_t *)v66;
  unint64_t v147 = 0;
  *(void *)&long long v157 = v65;
  id v146 = v62;
  if (!v68)
  {
LABEL_49:
    swift_bridgeObjectRelease();
    uint64_t v99 = (void *)sub_23785B650();
    unint64_t v159 = v157 & 0xC000000000000001;
    swift_bridgeObjectRetain();
    uint64_t v100 = 0;
    uint64_t v101 = 4;
    while (1)
    {
      if (v159) {
        id v102 = (id)MEMORY[0x237E22750](v101 - 4, v157);
      }
      else {
        id v102 = *(id *)(v157 + 8 * v101);
      }
      uint64_t v103 = v102;
      uint64_t v104 = v101 - 3;
      if (__OFADD__(v101 - 4, 1))
      {
        __break(1u);
LABEL_78:
        __break(1u);
LABEL_79:
        __break(1u);
        goto LABEL_80;
      }
      id v105 = objc_msgSend(v102, sel_value);
      if (!v105) {
        break;
      }
      uint64_t v106 = sub_23781F478(v105);
      if (!v107) {
        goto LABEL_88;
      }
      uint64_t v108 = v106;
      uint64_t v109 = v107;
      sub_23781F4E8((uint64_t)v100);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v161[0] = (uint64_t)v99;
      unint64_t v110 = sub_2377ED5B8(v108, v109);
      if (__OFADD__(v99[2], (v111 & 1) == 0)) {
        goto LABEL_78;
      }
      unint64_t v112 = v110;
      char v113 = v111;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2689280D8);
      char v114 = sub_23785BC50();
      uint64_t v99 = (void *)v161[0];
      if (v114)
      {
        unint64_t v115 = sub_2377ED5B8(v108, v109);
        if ((v113 & 1) != (v116 & 1)) {
          goto LABEL_90;
        }
        unint64_t v112 = v115;
      }
      swift_bridgeObjectRelease();
      if ((v113 & 1) == 0)
      {
        v99[(v112 >> 6) + 8] |= 1 << v112;
        uint64_t v117 = (uint64_t *)(v99[6] + 16 * v112);
        *uint64_t v117 = v108;
        v117[1] = v109;
        *(void *)(v99[7] + 8 * v112) = 0;
        uint64_t v118 = v99[2];
        uint64_t v119 = v118 + 1;
        isUniquelyReferenced_nonNull_native = __OFADD__(v118, 1);
        swift_bridgeObjectRetain();
        if (isUniquelyReferenced_nonNull_native) {
          goto LABEL_81;
        }
        v99[2] = v119;
      }
      swift_bridgeObjectRetain();
      uint64_t v120 = v99[7];
      swift_bridgeObjectRelease();
      uint64_t v121 = *(void *)(v120 + 8 * v112);
      BOOL v97 = __OFADD__(v121, 1);
      uint64_t v122 = v121 + 1;
      if (v97) {
        goto LABEL_79;
      }
      *(void *)(v120 + 8 * v112) = v122;
      swift_bridgeObjectRelease();

      ++v101;
      uint64_t v100 = sub_23781C40C;
      if ((uint8_t *)v104 == v156)
      {
        uint64_t v123 = v157;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        uint64_t v124 = sub_237805CD0((uint64_t)v99);
        swift_bridgeObjectRelease();
        v161[0] = (uint64_t)v124;
        unint64_t v125 = v147;
        sub_23781C834(v161, v123);
        if (v125) {
          goto LABEL_91;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        os_log_type_t v126 = (void *)v161[0];
        swift_bridgeObjectRelease();
        uint64_t v127 = v158;
        uint64_t v128 = v152;
        if (!v126[2])
        {
          swift_release();
          swift_bridgeObjectRelease();

          OUTLINED_FUNCTION_2_16();
          OUTLINED_FUNCTION_1_13();

          return 0;
        }
        uint64_t v130 = v126[4];
        uint64_t v129 = v126[5];
        uint64_t v131 = qword_2689266D8;
        swift_bridgeObjectRetain();
        if (v131 != -1) {
          swift_once();
        }
        uint64_t v132 = v148;
        __swift_project_value_buffer(v148, (uint64_t)qword_268928BC8);
        OUTLINED_FUNCTION_5_19();
        v133(v128);
        swift_retain();
        uint64_t v134 = sub_23785B490();
        os_log_type_t v135 = sub_23785B8A0();
        if (os_log_type_enabled(v134, v135))
        {
          unint64_t v159 = v129;
          uint64_t v136 = (uint8_t *)swift_slowAlloc();
          uint64_t v137 = swift_slowAlloc();
          *(void *)&long long v157 = v130;
          v161[0] = v137;
          *(_DWORD *)uint64_t v136 = 136315138;
          uint64_t v156 = v136 + 4;
          swift_bridgeObjectRetain();
          uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927B30);
          uint64_t v139 = MEMORY[0x237E22360](v126, v138);
          uint64_t v140 = v127;
          unint64_t v142 = v141;
          swift_release();
          uint64_t v143 = v139;
          uint64_t v129 = v159;
          uint64_t v144 = sub_2377C6A68(v143, v142, v161);
          OUTLINED_FUNCTION_6_15(v144);
          sub_23785B9E0();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_237778000, v134, v135, "App values: %s", v136, 0xCu);
          swift_arrayDestroy();
          uint64_t v130 = v157;
          OUTLINED_FUNCTION_5_3();
          OUTLINED_FUNCTION_5_3();

          (*(void (**)(char *, uint64_t))(v140 + 8))(v152, v132);
        }
        else
        {

          swift_release_n();
          (*(void (**)(char *, uint64_t))(v127 + 8))(v128, v132);
        }
        uint64_t v36 = sub_237820F5C(v130, v129, v155);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        OUTLINED_FUNCTION_1_13();
        OUTLINED_FUNCTION_2_16();
        return (uint64_t)v36;
      }
    }
    __break(1u);
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  uint64_t v153 = (char *)v68;
  uint64_t v154 = (char *)(isUniquelyReferenced_nonNull_native & 0xC000000000000001);
  uint64_t v51 = 4;
  while (1)
  {
    if (v154) {
      id v79 = (id)MEMORY[0x237E22750](v51 - 4, isUniquelyReferenced_nonNull_native);
    }
    else {
      id v79 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v51);
    }
    uint64_t v80 = v79;
    uint64_t v81 = v51 - 3;
    if (__OFADD__(v51 - 4, 1))
    {
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
    uint64_t v82 = sub_23778BEE8(v79);
    if (v83) {
      break;
    }

LABEL_48:
    ++v51;
    if (v81 == v68) {
      goto LABEL_49;
    }
  }
  uint64_t v84 = v82;
  id v61 = v83;
  id v85 = v80;
  uint64_t v86 = v155;
  swift_isUniquelyReferenced_nonNull_native();
  v161[0] = v86;
  unint64_t v87 = sub_2377ED5B8(v84, (uint64_t)v61);
  if (__OFADD__(*(void *)(v86 + 16), (v88 & 1) == 0)) {
    goto LABEL_82;
  }
  unint64_t v89 = v87;
  char v90 = v88;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689280E0);
  if (sub_23785BC50())
  {
    unint64_t v91 = sub_2377ED5B8(v84, (uint64_t)v61);
    if ((v90 & 1) != (v92 & 1)) {
      goto LABEL_90;
    }
    unint64_t v89 = v91;
  }
  uint64_t v93 = (void *)v161[0];
  uint64_t v155 = v161[0];
  if (v90)
  {
    uint64_t v94 = *(void *)(v161[0] + 56);

    *(void *)(v94 + 8 * v89) = v85;
LABEL_47:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = v159;
    uint64_t v68 = (uint64_t)v153;
    goto LABEL_48;
  }
  *(void *)(v161[0] + 8 * (v89 >> 6) + 64) |= 1 << v89;
  uint64_t v95 = (uint64_t *)(v93[6] + 16 * v89);
  *uint64_t v95 = v84;
  v95[1] = (uint64_t)v61;
  *(void *)(v93[7] + 8 * v89) = v85;
  uint64_t v96 = v93[2];
  BOOL v97 = __OFADD__(v96, 1);
  uint64_t v98 = v96 + 1;
  if (!v97)
  {
    v93[2] = v98;
    swift_bridgeObjectRetain();
    goto LABEL_47;
  }
  __break(1u);
LABEL_85:
  swift_once();
LABEL_26:
  uint64_t v70 = v148;
  __swift_project_value_buffer(v148, (uint64_t)qword_268928BC8);
  OUTLINED_FUNCTION_5_19();
  uint64_t v71 = v153;
  v72(v153);
  id v73 = v61;
  uint64_t v74 = sub_23785B490();
  os_log_type_t v75 = sub_23785B8B0();
  if (os_log_type_enabled(v74, v75))
  {
    uint64_t v76 = (uint8_t *)swift_slowAlloc();
    v161[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v76 = 136315138;
    unint64_t v159 = (unint64_t)(v76 + 4);
    uint64_t ObjectType = swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689280C8);
    uint64_t v77 = sub_23785B6D0();
    uint64_t ObjectType = sub_2377C6A68(v77, v78, v161);
    sub_23785B9E0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237778000, v74, v75, "CoreDuetAppSelectionResolver#resolve could not convert core duet response to array of _DKEvent, actual class: %s", v76, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_2_16();
    OUTLINED_FUNCTION_1_13();

    (*(void (**)(char *, uint64_t))(v51 + 8))(v153, v70);
  }
  else
  {

    OUTLINED_FUNCTION_1_13();
    OUTLINED_FUNCTION_2_16();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v71, v70);
  }
  return 0;
}

id sub_23781C2A0()
{
  uint64_t v0 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_eventStreamWithName_, v0);

  return v1;
}

id sub_23781C304(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v9 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  sub_23778F458(0, &qword_2689280B8);
  uint64_t v9 = (void *)sub_23785B780();
  swift_bridgeObjectRelease();
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  sub_23778F458(0, &qword_2689280E8);
  uint64_t v10 = (void *)sub_23785B780();
  swift_bridgeObjectRelease();
LABEL_6:
  id v11 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_eventQueryWithPredicate_eventStreams_offset_limit_sortDescriptors_, a1, v9, a3, a4, v10);

  return v11;
}

void sub_23781C40C(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_23781C414(uint64_t *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  id v54 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v50 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v50 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v50 - v15;
  uint64_t v17 = sub_2378593F0();
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = a1[2];
  uint64_t v23 = a2[2];
  if (v22 == v23)
  {
    id v50 = v21;
    uint64_t v51 = v11;
    id v52 = (char *)&v50 - v19;
    uint64_t v53 = v20;
    uint64_t v26 = a2;
    uint64_t v24 = *a2;
    uint64_t v25 = v26[1];
    uint64_t v29 = a1;
    uint64_t v27 = *a1;
    uint64_t v28 = v29[1];
    swift_bridgeObjectRetain();
    id v30 = sub_23781ACC4(a3, v27, v28);
    swift_bridgeObjectRetain();
    unint64_t v31 = a3;
    uint64_t v32 = v30;
    id v33 = sub_23781ACC4(v31, v24, v25);
    if (v30)
    {
      id v34 = objc_msgSend(v30, sel_startDate);
      if (v34)
      {
        id v35 = v34;
        sub_2378593D0();

        uint64_t v36 = 0;
      }
      else
      {
        uint64_t v36 = 1;
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v14, v36, 1, v17);
      sub_23781F558((uint64_t)v14, (uint64_t)v16);
      if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) != 1)
      {
        BOOL v39 = *(void (**)(char *, char *, uint64_t))(v53 + 32);
        v39(v52, v16, v17);
        if (v33)
        {
          uint64_t v40 = v32;
          id v41 = objc_msgSend(v33, sel_startDate);
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = (uint64_t)v54;
            sub_2378593D0();

            uint64_t v44 = 0;
          }
          else
          {
            uint64_t v44 = 1;
            uint64_t v43 = (uint64_t)v54;
          }
          __swift_storeEnumTagSinglePayload(v43, v44, 1, v17);
          uint64_t v45 = (uint64_t)v51;
          sub_23781F558(v43, (uint64_t)v51);
          if (__swift_getEnumTagSinglePayload(v45, 1, v17) != 1)
          {
            id v47 = v50;
            v39(v50, (char *)v45, v17);
            uint64_t v48 = v52;
            char v37 = sub_2378593A0();

            uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
            v49((uint64_t)v47, v17);
            v49((uint64_t)v48, v17);
            return v37 & 1;
          }

          uint64_t v32 = v33;
        }
        else
        {
          uint64_t v45 = (uint64_t)v51;
          __swift_storeEnumTagSinglePayload((uint64_t)v51, 1, 1, v17);
        }

        (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v17);
        uint64_t v38 = v45;
        goto LABEL_19;
      }
    }
    else
    {
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v17);
    }

    uint64_t v38 = (uint64_t)v16;
LABEL_19:
    sub_23781F4F8(v38);
    char v37 = 0;
    return v37 & 1;
  }
  char v37 = v23 < v22;
  return v37 & 1;
}

uint64_t sub_23781C834(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_2377FC354(v4);
    uint64_t v4 = v5;
  }
  uint64_t v6 = *(void *)(v4 + 16);
  v8[0] = v4 + 32;
  v8[1] = v6;
  swift_bridgeObjectRetain();
  sub_23781C8D0(v8, a2);
  *a1 = v4;
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_23781C8D0(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  v259 = (char *)&v229 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v245 = (uint64_t)&v229 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v246 = (char *)&v229 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v229 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v229 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v229 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  v238 = (char *)&v229 - v22;
  MEMORY[0x270FA5388](v21);
  v240 = (char *)&v229 - v23;
  uint64_t v249 = sub_2378593F0();
  uint64_t v24 = *(void *)(v249 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v249);
  v242 = (char *)&v229 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v257 = (char *)&v229 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v234 = (char *)&v229 - v30;
  MEMORY[0x270FA5388](v29);
  v237 = (char *)&v229 - v31;
  uint64_t v32 = a1[1];
  swift_bridgeObjectRetain_n();
  uint64_t v33 = sub_23785BDF0();
  if (v33 >= v32)
  {
    if ((v32 & 0x8000000000000000) == 0)
    {
      if (v32) {
        sub_23781DE68(0, v32, 1, a1, a2);
      }
      swift_bridgeObjectRelease_n();
      return swift_bridgeObjectRelease();
    }
    goto LABEL_270;
  }
  uint64_t v233 = v33;
  uint64_t v260 = v2;
  uint64_t v232 = sub_2377ED090(v32 / 2);
  v247 = v34;
  uint64_t v266 = a2;
  uint64_t v250 = v32;
  v229 = (unint64_t *)a1;
  if (v32 <= 0)
  {
    uint64_t v38 = (char *)MEMORY[0x263F8EE78];
    unint64_t v154 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_225:
    if (v154 < 2)
    {
LABEL_239:
      swift_bridgeObjectRelease();
      if (v32 >= -1) {
        goto LABEL_243;
      }
      goto LABEL_276;
    }
    unint64_t v214 = *v229;
    unint64_t v263 = *v229;
    uint64_t v215 = v266;
    while (1)
    {
      unint64_t v216 = v154 - 2;
      if (v154 < 2) {
        goto LABEL_264;
      }
      if (!v214) {
        goto LABEL_284;
      }
      v217 = v38;
      v218 = v38 + 32;
      uint64_t v219 = *(void *)&v38[16 * v216 + 32];
      uint64_t v220 = *(void *)&v218[16 * v154 - 8];
      v221 = (char *)(v214 + 24 * v219);
      uint64_t v222 = v214 + 24 * *(void *)&v218[16 * v154 - 16];
      unint64_t v223 = v214 + 24 * v220;
      swift_bridgeObjectRetain();
      v224 = v221;
      uint64_t v225 = v260;
      sub_23781E638(v224, v222, v223, v247, v215);
      uint64_t v260 = v225;
      if (v225) {
        goto LABEL_241;
      }
      if (v220 < v219) {
        goto LABEL_265;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v217 = sub_2377FC29C((uint64_t)v217);
      }
      if (v216 >= *((void *)v217 + 2)) {
        goto LABEL_266;
      }
      v226 = &v217[16 * v216 + 32];
      *(void *)v226 = v219;
      *((void *)v226 + 1) = v220;
      unint64_t v227 = *((void *)v217 + 2);
      if (v154 > v227) {
        goto LABEL_267;
      }
      uint64_t v38 = v217;
      memmove(&v217[16 * v154 + 16], &v217[16 * v154 + 32], 16 * (v227 - v154));
      *((void *)v217 + 2) = v227 - 1;
      unint64_t v154 = v227 - 1;
      uint64_t v32 = v250;
      unint64_t v214 = v263;
      if (v227 <= 2) {
        goto LABEL_239;
      }
    }
  }
  v231 = v20;
  v230 = v17;
  v243 = v14;
  uint64_t v35 = 0;
  uint64_t v36 = *a1;
  uint64_t v37 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v255 = a2 & 0xFFFFFFFFFFFFFF8;
  if (a2 < 0) {
    uint64_t v37 = a2;
  }
  uint64_t v239 = v37;
  unint64_t v263 = a2 & 0xC000000000000001;
  v256 = (void (**)(char *, uint64_t, uint64_t))(v24 + 32);
  v244 = (void (**)(char *, uint64_t))(v24 + 8);
  uint64_t v38 = (char *)MEMORY[0x263F8EE78];
  uint64_t v258 = v36;
  while (1)
  {
    uint64_t v39 = v35 + 1;
    uint64_t v261 = (unint64_t)a2 >> 62;
    v235 = v38;
    uint64_t v248 = v35;
    if (v35 + 1 >= v32)
    {
      uint64_t v52 = v35 + 1;
      goto LABEL_91;
    }
    uint64_t v40 = (uint64_t *)(v36 + 24 * v39);
    uint64_t v41 = *v40;
    uint64_t v42 = v40[1];
    uint64_t v43 = v40[2];
    v265[0] = v41;
    v265[1] = v42;
    v265[2] = v43;
    uint64_t v44 = (uint64_t *)(v36 + 24 * v35);
    uint64_t v45 = *v44;
    uint64_t v46 = v44[1];
    uint64_t v47 = v44[2];
    v264[0] = v45;
    v264[1] = v46;
    v264[2] = v47;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v48 = v260;
    int v49 = sub_23781C414(v265, v264, a2);
    uint64_t v260 = v48;
    if (v48) {
      goto LABEL_247;
    }
    int v50 = v49;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v51 = v35 + 2;
    uint64_t v52 = v35 + 2;
    uint64_t v36 = v258;
    LODWORD(v253) = v50;
    if (v35 + 2 >= v32) {
      goto LABEL_81;
    }
LABEL_9:
    uint64_t v53 = (uint64_t *)(v36 + 24 * v51);
    uint64_t v54 = v53[2];
    uint64_t v55 = (uint64_t *)(v36 + 24 * v39);
    uint64_t v56 = v55[2];
    if (v54 != v56)
    {
      int v71 = v56 < v54;
      goto LABEL_28;
    }
    uint64_t v57 = *v53;
    uint64_t v59 = *v55;
    uint64_t v58 = v55[1];
    uint64_t v262 = v53[1];
    if (v261)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v60 = sub_23785BCC0();
    }
    else
    {
      uint64_t v60 = *(void *)(v255 + 16);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v61 = (uint64_t)v240;
    uint64_t v254 = v51;
    if (!v60)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v64 = 0;
      goto LABEL_36;
    }
    uint64_t v62 = 4;
    while (1)
    {
      if (v263) {
        id v63 = (id)MEMORY[0x237E22750](v62 - 4, a2);
      }
      else {
        id v63 = *(id *)(a2 + 8 * v62);
      }
      unint64_t v64 = v63;
      uint64_t v65 = v62 - 3;
      if (__OFADD__(v62 - 4, 1))
      {
        __break(1u);
LABEL_249:
        __break(1u);
LABEL_250:
        __break(1u);
LABEL_251:
        __break(1u);
LABEL_252:
        __break(1u);
LABEL_253:
        __break(1u);
LABEL_254:
        __break(1u);
LABEL_255:
        __break(1u);
LABEL_256:
        __break(1u);
LABEL_257:
        __break(1u);
LABEL_258:
        __break(1u);
LABEL_259:
        __break(1u);
LABEL_260:
        __break(1u);
LABEL_261:
        __break(1u);
LABEL_262:
        __break(1u);
LABEL_263:
        __break(1u);
LABEL_264:
        __break(1u);
LABEL_265:
        __break(1u);
LABEL_266:
        __break(1u);
LABEL_267:
        __break(1u);
LABEL_268:
        __break(1u);
LABEL_269:
        __break(1u);
LABEL_270:
        __break(1u);
LABEL_271:
        __break(1u);
        goto LABEL_272;
      }
      id v66 = objc_msgSend(v63, sel_value);
      if (!v66) {
        goto LABEL_279;
      }
      uint64_t v67 = sub_23781F478(v66);
      if (v68)
      {
        if (v67 == v57 && v68 == v262)
        {
          swift_bridgeObjectRelease();
          a2 = v266;
          swift_bridgeObjectRelease();
          goto LABEL_34;
        }
        char v70 = sub_23785BE30();
        swift_bridgeObjectRelease();
        if (v70) {
          break;
        }
      }

      ++v62;
      a2 = v266;
      if (v65 == v60)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v64 = 0;
        goto LABEL_35;
      }
    }
    swift_bridgeObjectRelease();
    a2 = v266;
LABEL_34:
    swift_bridgeObjectRelease();
LABEL_35:
    uint64_t v61 = (uint64_t)v240;
LABEL_36:
    if (v261)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v72 = sub_23785BCC0();
      if (v72) {
        goto LABEL_38;
      }
LABEL_53:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      os_log_type_t v75 = 0;
      goto LABEL_58;
    }
    uint64_t v72 = *(void *)(v255 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v72) {
      goto LABEL_53;
    }
LABEL_38:
    uint64_t v73 = 4;
    while (1)
    {
      if (v263) {
        id v74 = (id)MEMORY[0x237E22750](v73 - 4, a2);
      }
      else {
        id v74 = *(id *)(a2 + 8 * v73);
      }
      os_log_type_t v75 = v74;
      uint64_t v76 = v73 - 3;
      if (__OFADD__(v73 - 4, 1)) {
        goto LABEL_249;
      }
      id v77 = objc_msgSend(v74, sel_value);
      if (!v77) {
        goto LABEL_280;
      }
      uint64_t v78 = sub_23781F478(v77);
      if (v79)
      {
        if (v78 == v59 && v79 == v58)
        {
          swift_bridgeObjectRelease();
          a2 = v266;
          swift_bridgeObjectRelease();
          goto LABEL_56;
        }
        char v81 = sub_23785BE30();
        swift_bridgeObjectRelease();
        if (v81) {
          break;
        }
      }

      ++v73;
      a2 = v266;
      if (v76 == v72)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        os_log_type_t v75 = 0;
        goto LABEL_57;
      }
    }
    swift_bridgeObjectRelease();
    a2 = v266;
LABEL_56:
    swift_bridgeObjectRelease();
LABEL_57:
    uint64_t v61 = (uint64_t)v240;
LABEL_58:
    uint64_t v82 = v249;
    if (!v64)
    {
      __swift_storeEnumTagSinglePayload(v61, 1, 1, v249);
      goto LABEL_65;
    }
    id v83 = objc_msgSend(v64, sel_startDate);
    if (v83)
    {
      uint64_t v84 = v83;
      uint64_t v85 = (uint64_t)v238;
      sub_2378593D0();

      uint64_t v86 = 0;
    }
    else
    {
      uint64_t v86 = 1;
      uint64_t v85 = (uint64_t)v238;
    }
    __swift_storeEnumTagSinglePayload(v85, v86, 1, v82);
    sub_23781F558(v85, v61);
    if (__swift_getEnumTagSinglePayload(v61, 1, v82) == 1) {
      break;
    }
    char v88 = *v256;
    (*v256)(v237, v61, v82);
    if (!v75)
    {
      uint64_t v93 = (uint64_t)v231;
      __swift_storeEnumTagSinglePayload((uint64_t)v231, 1, 1, v82);
LABEL_73:

      (*v244)(v237, v82);
      uint64_t v87 = v93;
      goto LABEL_74;
    }
    id v89 = objc_msgSend(v75, sel_startDate);
    if (v89)
    {
      char v90 = v89;
      uint64_t v91 = (uint64_t)v230;
      sub_2378593D0();

      uint64_t v92 = 0;
    }
    else
    {
      uint64_t v92 = 1;
      uint64_t v91 = (uint64_t)v230;
    }
    __swift_storeEnumTagSinglePayload(v91, v92, 1, v82);
    uint64_t v93 = (uint64_t)v231;
    sub_23781F558(v91, (uint64_t)v231);
    if (__swift_getEnumTagSinglePayload(v93, 1, v82) == 1)
    {

      unint64_t v64 = v75;
      goto LABEL_73;
    }
    uint64_t v94 = v234;
    v88(v234, v93, v82);
    uint64_t v95 = v237;
    int v71 = sub_2378593A0();

    uint64_t v96 = *v244;
    (*v244)(v94, v82);
    v96(v95, v82);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v32 = v250;
    uint64_t v36 = v258;
    uint64_t v35 = v248;
    int v50 = (int)v253;
    uint64_t v51 = v254;
LABEL_28:
    if ((v50 ^ v71))
    {
      uint64_t v52 = v51;
    }
    else
    {
      uint64_t v52 = v51 + 1;
      uint64_t v39 = v51;
      uint64_t v51 = v52;
      if (v52 < v32) {
        goto LABEL_9;
      }
    }
LABEL_81:
    if (v50) {
      goto LABEL_84;
    }
LABEL_91:
    if (v52 < v32)
    {
      if (__OFSUB__(v52, v35)) {
        goto LABEL_271;
      }
      if (v52 - v35 < v233)
      {
        uint64_t v106 = v35 + v233;
        if (__OFADD__(v35, v233)) {
          goto LABEL_273;
        }
        if (v106 >= v32) {
          uint64_t v106 = v32;
        }
        if (v106 < v35)
        {
LABEL_274:
          __break(1u);
          goto LABEL_275;
        }
        uint64_t v236 = v106;
        if (v52 != v106)
        {
          do
          {
            uint64_t v107 = (uint64_t *)(v36 + 24 * v52);
            uint64_t v108 = *v107;
            uint64_t v109 = v107[1];
            uint64_t v110 = v107[2];
            uint64_t v241 = v52;
            while (1)
            {
              char v111 = (uint64_t *)(v36 + 24 * v52);
              unint64_t v112 = v111 - 3;
              uint64_t v113 = *(v111 - 3);
              unint64_t v115 = v111 - 1;
              uint64_t v114 = *(v111 - 1);
              if (v110 != v114) {
                break;
              }
              v251 = v111 - 1;
              v252 = (uint64_t *)(v36 + 24 * v52);
              v253 = v111 - 3;
              uint64_t v254 = v52;
              uint64_t v262 = *(v111 - 2);
              if (v261)
              {
                swift_bridgeObjectRetain_n();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                uint64_t v116 = sub_23785BCC0();
              }
              else
              {
                uint64_t v116 = *(void *)(v255 + 16);
                swift_bridgeObjectRetain_n();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
              }
              uint64_t v117 = (uint64_t)v259;
              if (!v116)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v120 = 0;
                goto LABEL_125;
              }
              uint64_t v118 = 4;
              while (1)
              {
                uint64_t v32 = v118 - 4;
                if (v263) {
                  id v119 = (id)MEMORY[0x237E22750](v118 - 4, a2);
                }
                else {
                  id v119 = *(id *)(a2 + 8 * v118);
                }
                uint64_t v120 = v119;
                uint64_t v121 = v118 - 3;
                if (__OFADD__(v32, 1))
                {
                  __break(1u);
LABEL_246:
                  __break(1u);
LABEL_247:
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
LABEL_242:
                  if (v32 >= -1)
                  {
LABEL_243:
                    *(void *)(v232 + 16) = 0;
                    swift_bridgeObjectRelease_n();
                    swift_bridgeObjectRelease();
                    return swift_bridgeObjectRelease();
                  }
LABEL_272:
                  __break(1u);
LABEL_273:
                  __break(1u);
                  goto LABEL_274;
                }
                id v122 = objc_msgSend(v119, sel_value);
                if (!v122) {
                  goto LABEL_277;
                }
                uint64_t v123 = sub_23781F478(v122);
                if (v124)
                {
                  if (v123 == v108 && v124 == v109)
                  {
                    swift_bridgeObjectRelease();
                    a2 = v266;
                    swift_bridgeObjectRelease();
                    goto LABEL_123;
                  }
                  char v126 = sub_23785BE30();
                  swift_bridgeObjectRelease();
                  if (v126) {
                    break;
                  }
                }

                ++v118;
                a2 = v266;
                if (v121 == v116)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v120 = 0;
                  goto LABEL_124;
                }
              }
              swift_bridgeObjectRelease();
              a2 = v266;
LABEL_123:
              swift_bridgeObjectRelease();
LABEL_124:
              uint64_t v117 = (uint64_t)v259;
LABEL_125:
              if (v261)
              {
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                uint64_t v127 = sub_23785BCC0();
                if (v127) {
                  goto LABEL_127;
                }
LABEL_142:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v130 = 0;
                goto LABEL_147;
              }
              uint64_t v127 = *(void *)(v255 + 16);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              if (!v127) {
                goto LABEL_142;
              }
LABEL_127:
              uint64_t v128 = 4;
              while (1)
              {
                uint64_t v32 = v128 - 4;
                if (v263) {
                  id v129 = (id)MEMORY[0x237E22750](v128 - 4, a2);
                }
                else {
                  id v129 = *(id *)(a2 + 8 * v128);
                }
                uint64_t v130 = v129;
                uint64_t v131 = v128 - 3;
                if (__OFADD__(v32, 1)) {
                  goto LABEL_246;
                }
                id v132 = objc_msgSend(v129, sel_value);
                if (!v132) {
                  goto LABEL_278;
                }
                uint64_t v133 = sub_23781F478(v132);
                if (v134)
                {
                  if (v133 == v113 && v134 == v262)
                  {
                    swift_bridgeObjectRelease();
                    a2 = v266;
                    swift_bridgeObjectRelease();
                    goto LABEL_145;
                  }
                  char v136 = sub_23785BE30();
                  swift_bridgeObjectRelease();
                  if (v136) {
                    break;
                  }
                }

                ++v128;
                a2 = v266;
                if (v131 == v127)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v130 = 0;
                  goto LABEL_146;
                }
              }
              swift_bridgeObjectRelease();
              a2 = v266;
LABEL_145:
              swift_bridgeObjectRelease();
LABEL_146:
              uint64_t v117 = (uint64_t)v259;
LABEL_147:
              uint64_t v137 = v249;
              if (!v120)
              {
                uint64_t v143 = (uint64_t)v243;
                __swift_storeEnumTagSinglePayload((uint64_t)v243, 1, 1, v249);
                goto LABEL_164;
              }
              id v138 = objc_msgSend(v120, sel_startDate);
              if (v138)
              {
                uint64_t v139 = v138;
                uint64_t v140 = (uint64_t)v246;
                sub_2378593D0();

                uint64_t v141 = 0;
              }
              else
              {
                uint64_t v141 = 1;
                uint64_t v140 = (uint64_t)v246;
              }
              __swift_storeEnumTagSinglePayload(v140, v141, 1, v137);
              uint64_t v142 = v140;
              uint64_t v143 = (uint64_t)v243;
              sub_23781F558(v142, (uint64_t)v243);
              if (__swift_getEnumTagSinglePayload(v143, 1, v137) == 1)
              {

LABEL_164:
LABEL_168:
                uint64_t v35 = v248;
                sub_23781F4F8(v143);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v36 = v258;
                goto LABEL_169;
              }
              uint64_t v144 = *v256;
              (*v256)(v257, v143, v137);
              if (!v130)
              {
                uint64_t v143 = v245;
                __swift_storeEnumTagSinglePayload(v245, 1, 1, v137);
LABEL_167:

                (*v244)(v257, v137);
                goto LABEL_168;
              }
              id v145 = objc_msgSend(v130, sel_startDate);
              if (v145)
              {
                id v146 = v145;
                sub_2378593D0();

                uint64_t v147 = 0;
              }
              else
              {
                uint64_t v147 = 1;
              }
              __swift_storeEnumTagSinglePayload(v117, v147, 1, v137);
              uint64_t v143 = v245;
              sub_23781F558(v117, v245);
              if (__swift_getEnumTagSinglePayload(v143, 1, v137) == 1)
              {

                uint64_t v120 = v130;
                goto LABEL_167;
              }
              uint64_t v148 = v242;
              v144(v242, v143, v137);
              id v149 = v257;
              char v150 = sub_2378593A0();

              id v151 = *v244;
              (*v244)(v148, v137);
              v151(v149, v137);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v36 = v258;
              uint64_t v35 = v248;
              unint64_t v112 = v253;
              uint64_t v52 = v254;
              unint64_t v115 = v251;
              char v111 = v252;
              if ((v150 & 1) == 0) {
                goto LABEL_169;
              }
LABEL_158:
              if (!v36) {
                goto LABEL_281;
              }
              --v52;
              uint64_t v108 = *v111;
              uint64_t v109 = v111[1];
              uint64_t v110 = v111[2];
              *(_OWORD *)char v111 = *(_OWORD *)v112;
              v111[2] = v112[2];
              *unint64_t v112 = v108;
              v112[1] = v109;
              uint64_t *v115 = v110;
              if (v52 == v35) {
                goto LABEL_169;
              }
            }
            if (v114 < v110) {
              goto LABEL_158;
            }
LABEL_169:
            uint64_t v52 = v241 + 1;
          }
          while (v241 + 1 != v236);
          uint64_t v52 = v236;
        }
      }
    }
    if (v52 < v35) {
      goto LABEL_269;
    }
    uint64_t v241 = v52;
    uint64_t v38 = v235;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v38 = sub_2377FC1A4(0, *((void *)v38 + 2) + 1, 1, v38);
    }
    unint64_t v153 = *((void *)v38 + 2);
    unint64_t v152 = *((void *)v38 + 3);
    unint64_t v154 = v153 + 1;
    uint64_t v32 = v250;
    uint64_t v36 = v258;
    if (v153 >= v152 >> 1)
    {
      v213 = sub_2377FC1A4((char *)(v152 > 1), v153 + 1, 1, v38);
      uint64_t v36 = v258;
      uint64_t v38 = v213;
    }
    *((void *)v38 + 2) = v154;
    uint64_t v155 = v38 + 32;
    uint64_t v156 = &v38[16 * v153 + 32];
    uint64_t v157 = v241;
    *(void *)uint64_t v156 = v35;
    *((void *)v156 + 1) = v157;
    if (v153)
    {
      while (1)
      {
        unint64_t v158 = v154 - 1;
        if (v154 >= 4)
        {
          uint64_t v163 = &v155[16 * v154];
          uint64_t v164 = *((void *)v163 - 8);
          uint64_t v165 = *((void *)v163 - 7);
          BOOL v169 = __OFSUB__(v165, v164);
          uint64_t v166 = v165 - v164;
          if (v169) {
            goto LABEL_254;
          }
          uint64_t v168 = *((void *)v163 - 6);
          uint64_t v167 = *((void *)v163 - 5);
          BOOL v169 = __OFSUB__(v167, v168);
          uint64_t v161 = v167 - v168;
          char v162 = v169;
          if (v169) {
            goto LABEL_255;
          }
          unint64_t v170 = v154 - 2;
          v171 = &v155[16 * v154 - 32];
          uint64_t v173 = *(void *)v171;
          uint64_t v172 = *((void *)v171 + 1);
          BOOL v169 = __OFSUB__(v172, v173);
          uint64_t v174 = v172 - v173;
          if (v169) {
            goto LABEL_256;
          }
          BOOL v169 = __OFADD__(v161, v174);
          uint64_t v175 = v161 + v174;
          if (v169) {
            goto LABEL_258;
          }
          if (v175 >= v166)
          {
            v193 = &v155[16 * v158];
            uint64_t v195 = *(void *)v193;
            uint64_t v194 = *((void *)v193 + 1);
            BOOL v169 = __OFSUB__(v194, v195);
            uint64_t v196 = v194 - v195;
            if (v169) {
              goto LABEL_268;
            }
            BOOL v186 = v161 < v196;
            goto LABEL_208;
          }
        }
        else
        {
          if (v154 != 3)
          {
            uint64_t v187 = *((void *)v38 + 4);
            uint64_t v188 = *((void *)v38 + 5);
            BOOL v169 = __OFSUB__(v188, v187);
            uint64_t v180 = v188 - v187;
            char v181 = v169;
            goto LABEL_202;
          }
          uint64_t v160 = *((void *)v38 + 4);
          uint64_t v159 = *((void *)v38 + 5);
          BOOL v169 = __OFSUB__(v159, v160);
          uint64_t v161 = v159 - v160;
          char v162 = v169;
        }
        if (v162) {
          goto LABEL_257;
        }
        unint64_t v170 = v154 - 2;
        v176 = &v155[16 * v154 - 32];
        uint64_t v178 = *(void *)v176;
        uint64_t v177 = *((void *)v176 + 1);
        BOOL v179 = __OFSUB__(v177, v178);
        uint64_t v180 = v177 - v178;
        char v181 = v179;
        if (v179) {
          goto LABEL_259;
        }
        v182 = &v155[16 * v158];
        uint64_t v184 = *(void *)v182;
        uint64_t v183 = *((void *)v182 + 1);
        BOOL v169 = __OFSUB__(v183, v184);
        uint64_t v185 = v183 - v184;
        if (v169) {
          goto LABEL_261;
        }
        if (__OFADD__(v180, v185)) {
          goto LABEL_263;
        }
        if (v180 + v185 >= v161)
        {
          BOOL v186 = v161 < v185;
LABEL_208:
          if (v186) {
            unint64_t v158 = v170;
          }
          goto LABEL_210;
        }
LABEL_202:
        if (v181) {
          goto LABEL_260;
        }
        v189 = &v155[16 * v158];
        uint64_t v191 = *(void *)v189;
        uint64_t v190 = *((void *)v189 + 1);
        BOOL v169 = __OFSUB__(v190, v191);
        uint64_t v192 = v190 - v191;
        if (v169) {
          goto LABEL_262;
        }
        if (v192 < v180) {
          goto LABEL_219;
        }
LABEL_210:
        unint64_t v197 = v158 - 1;
        if (v158 - 1 >= v154) {
          goto LABEL_250;
        }
        if (!v36) {
          goto LABEL_282;
        }
        v198 = v38;
        v199 = v155;
        v200 = &v155[16 * v197];
        uint64_t v201 = *(void *)v200;
        v202 = v199;
        unint64_t v203 = v158;
        v204 = &v199[16 * v158];
        uint64_t v205 = *((void *)v204 + 1);
        v206 = (char *)(v36 + 24 * *(void *)v200);
        uint64_t v207 = v36 + 24 * *(void *)v204;
        uint64_t v261 = v36 + 24 * v205;
        uint64_t v262 = v207;
        uint64_t v208 = v266;
        swift_bridgeObjectRetain();
        v209 = v206;
        uint64_t v210 = v260;
        sub_23781E638(v209, v262, v261, v247, v208);
        if (v210)
        {
LABEL_241:
          swift_bridgeObjectRelease();
          uint64_t v32 = v250;
          goto LABEL_242;
        }
        if (v205 < v201) {
          goto LABEL_251;
        }
        if (v203 > *((void *)v198 + 2)) {
          goto LABEL_252;
        }
        unint64_t v211 = v203;
        *(void *)v200 = v201;
        *(void *)&v202[16 * v197 + 8] = v205;
        unint64_t v212 = *((void *)v198 + 2);
        if (v211 >= v212) {
          goto LABEL_253;
        }
        uint64_t v155 = v202;
        uint64_t v38 = v198;
        uint64_t v260 = 0;
        unint64_t v154 = v212 - 1;
        memmove(v204, v204 + 16, 16 * (v212 - 1 - v211));
        *((void *)v198 + 2) = v212 - 1;
        BOOL v186 = v212 > 2;
        a2 = v266;
        uint64_t v32 = v250;
        uint64_t v36 = v258;
        if (!v186) {
          goto LABEL_219;
        }
      }
    }
    unint64_t v154 = 1;
LABEL_219:
    uint64_t v35 = v241;
    if (v241 >= v32) {
      goto LABEL_225;
    }
  }

LABEL_65:
  uint64_t v87 = v61;
LABEL_74:
  uint64_t v32 = v250;
  uint64_t v35 = v248;
  int v50 = (int)v253;
  uint64_t v39 = v254;
  sub_23781F4F8(v87);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v50 & 1) == 0)
  {
    uint64_t v52 = v39 + 1;
    uint64_t v51 = v39 + 1;
    uint64_t v36 = v258;
    if (v39 + 1 >= v32) {
      goto LABEL_91;
    }
    goto LABEL_9;
  }
  uint64_t v52 = v39;
  uint64_t v36 = v258;
LABEL_84:
  if (v52 >= v35)
  {
    if (v35 < v52)
    {
      uint64_t v97 = 24 * v52;
      uint64_t v98 = 24 * v35;
      uint64_t v99 = v52;
      uint64_t v100 = v35;
      do
      {
        if (v100 != --v99)
        {
          if (!v36) {
            goto LABEL_283;
          }
          uint64_t v101 = v36 + v98;
          uint64_t v102 = v36 + v97;
          long long v103 = *(_OWORD *)(v36 + v98);
          uint64_t v104 = *(void *)(v36 + v98 + 16);
          uint64_t v105 = *(void *)(v36 + v97 - 8);
          *(_OWORD *)uint64_t v101 = *(_OWORD *)(v36 + v97 - 24);
          *(void *)(v101 + 16) = v105;
          *(_OWORD *)(v102 - 24) = v103;
          *(void *)(v102 - 8) = v104;
        }
        ++v100;
        v97 -= 24;
        v98 += 24;
      }
      while (v100 < v99);
    }
    goto LABEL_91;
  }
LABEL_275:
  __break(1u);
LABEL_276:
  __break(1u);
LABEL_277:
  __break(1u);
LABEL_278:
  __break(1u);
LABEL_279:
  __break(1u);
LABEL_280:
  __break(1u);
LABEL_281:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_282:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_283:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_284:
  uint64_t result = swift_bridgeObjectRelease_n();
  __break(1u);
  return result;
}

id sub_23781DE68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v87 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v82 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v80 = (uint64_t)&v74 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v74 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v74 - v17;
  uint64_t v93 = sub_2378593F0();
  uint64_t v19 = MEMORY[0x270FA5388](v93);
  uint64_t v78 = (char *)&v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = (id)MEMORY[0x270FA5388](v19);
  uint64_t v92 = (char *)&v74 - v23;
  uint64_t v75 = a2;
  if (a3 != a2)
  {
    uint64_t v24 = a5 & 0xFFFFFFFFFFFFFF8;
    uint64_t v25 = *a4;
    uint64_t v84 = v16;
    uint64_t v85 = a5 & 0xFFFFFFFFFFFFFF8;
    if (a5 < 0) {
      uint64_t v24 = a5;
    }
    uint64_t v77 = v24;
    unint64_t v96 = a5 & 0xC000000000000001;
    uint64_t v86 = (void (**)(char *, char *, uint64_t))(v22 + 32);
    uint64_t v79 = (void (**)(char *, uint64_t))(v22 + 8);
    uint64_t v97 = a5;
    id v83 = v18;
    uint64_t v81 = v25;
    do
    {
      uint64_t v26 = (uint64_t *)(v25 + 24 * a3);
      uint64_t v28 = *v26;
      unint64_t v27 = v26[1];
      uint64_t v29 = v26[2];
      uint64_t v76 = a3;
      uint64_t v30 = a3;
      while (1)
      {
        uint64_t v31 = (uint64_t *)(v25 + 24 * v30);
        uint64_t v32 = v31 - 3;
        uint64_t v33 = *(v31 - 3);
        uint64_t v35 = v31 - 1;
        uint64_t v34 = *(v31 - 1);
        if (v29 != v34) {
          break;
        }
        char v88 = v31 - 1;
        id v89 = (uint64_t *)(v25 + 24 * v30);
        char v90 = v31 - 3;
        uint64_t v91 = v30;
        uint64_t v36 = *(v31 - 2);
        unint64_t v94 = (unint64_t)a5 >> 62;
        uint64_t v95 = v36;
        if ((unint64_t)a5 >> 62)
        {
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v37 = sub_23785BCC0();
          if (!v37)
          {
LABEL_31:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v39 = 0;
            goto LABEL_32;
          }
        }
        else
        {
          uint64_t v37 = *(void *)(v85 + 16);
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (!v37) {
            goto LABEL_31;
          }
        }
        uint64_t v38 = 4;
        while (1)
        {
          if (v96) {
            id result = (id)MEMORY[0x237E22750](v38 - 4, a5);
          }
          else {
            id result = *(id *)(a5 + 8 * v38);
          }
          uint64_t v39 = result;
          uint64_t v40 = v38 - 3;
          if (__OFADD__(v38 - 4, 1))
          {
            __break(1u);
LABEL_79:
            __break(1u);
LABEL_80:
            __break(1u);
LABEL_81:
            __break(1u);
LABEL_82:
            __break(1u);
            return result;
          }
          id result = objc_msgSend(result, sel_value);
          if (!result) {
            goto LABEL_80;
          }
          uint64_t v41 = sub_23781F478(result);
          if (v42)
          {
            BOOL v43 = v41 == v28 && v42 == v27;
            if (v43)
            {
              swift_bridgeObjectRelease();
              a5 = v97;
              swift_bridgeObjectRelease();
              goto LABEL_28;
            }
            char v44 = sub_23785BE30();
            swift_bridgeObjectRelease();
            if (v44) {
              break;
            }
          }

          ++v38;
          BOOL v43 = v40 == v37;
          a5 = v97;
          if (v43)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v39 = 0;
            goto LABEL_29;
          }
        }
        swift_bridgeObjectRelease();
        a5 = v97;
LABEL_28:
        swift_bridgeObjectRelease();
LABEL_29:
        uint64_t v18 = v83;
        uint64_t v16 = v84;
LABEL_32:
        if (v94)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v45 = sub_23785BCC0();
          if (v45) {
            goto LABEL_34;
          }
        }
        else
        {
          uint64_t v45 = *(void *)(v85 + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v45)
          {
LABEL_34:
            uint64_t v46 = 4;
            while (1)
            {
              if (v96) {
                id result = (id)MEMORY[0x237E22750](v46 - 4, a5);
              }
              else {
                id result = *(id *)(a5 + 8 * v46);
              }
              uint64_t v47 = result;
              uint64_t v48 = v46 - 3;
              if (__OFADD__(v46 - 4, 1)) {
                goto LABEL_79;
              }
              id result = objc_msgSend(result, sel_value);
              if (!result) {
                goto LABEL_81;
              }
              uint64_t v49 = sub_23781F478(result);
              if (v50)
              {
                if (v49 == v33 && v50 == v95)
                {
                  swift_bridgeObjectRelease();
                  a5 = v97;
                  swift_bridgeObjectRelease();
                  goto LABEL_54;
                }
                char v52 = sub_23785BE30();
                swift_bridgeObjectRelease();
                if (v52) {
                  break;
                }
              }

              ++v46;
              BOOL v43 = v48 == v45;
              a5 = v97;
              if (v43)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v47 = 0;
                goto LABEL_55;
              }
            }
            swift_bridgeObjectRelease();
            a5 = v97;
LABEL_54:
            swift_bridgeObjectRelease();
LABEL_55:
            uint64_t v53 = (uint64_t)v82;
            uint64_t v18 = v83;
            uint64_t v16 = v84;
            if (!v39) {
              goto LABEL_69;
            }
            goto LABEL_56;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v47 = 0;
        uint64_t v53 = (uint64_t)v82;
        if (!v39)
        {
LABEL_69:
          __swift_storeEnumTagSinglePayload((uint64_t)v18, 1, 1, v93);
          goto LABEL_71;
        }
LABEL_56:
        id v54 = objc_msgSend(v39, sel_startDate, v74);
        if (v54)
        {
          uint64_t v55 = v54;
          sub_2378593D0();

          uint64_t v56 = 0;
        }
        else
        {
          uint64_t v56 = 1;
        }
        uint64_t v57 = v93;
        __swift_storeEnumTagSinglePayload((uint64_t)v16, v56, 1, v93);
        sub_23781F558((uint64_t)v16, (uint64_t)v18);
        if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v57) == 1)
        {

LABEL_71:
          uint64_t v73 = (uint64_t)v18;
          goto LABEL_75;
        }
        uint64_t v58 = *v86;
        (*v86)(v92, v18, v57);
        if (!v47)
        {
          uint64_t v65 = v80;
          uint64_t v64 = v93;
          __swift_storeEnumTagSinglePayload(v80, 1, 1, v93);
LABEL_74:

          (*v79)(v92, v64);
          uint64_t v73 = v65;
LABEL_75:
          sub_23781F4F8(v73);
          swift_bridgeObjectRelease();
          id result = (id)swift_bridgeObjectRelease();
          uint64_t v25 = v81;
          goto LABEL_76;
        }
        id v59 = objc_msgSend(v47, sel_startDate);
        if (v59)
        {
          uint64_t v60 = v59;
          sub_2378593D0();

          uint64_t v61 = 0;
        }
        else
        {
          uint64_t v61 = 1;
        }
        uint64_t v62 = v93;
        __swift_storeEnumTagSinglePayload(v53, v61, 1, v93);
        uint64_t v63 = v53;
        uint64_t v64 = v62;
        uint64_t v65 = v80;
        sub_23781F558(v63, v80);
        if (__swift_getEnumTagSinglePayload(v65, 1, v64) == 1)
        {

          uint64_t v39 = v47;
          goto LABEL_74;
        }
        unint64_t v94 = v27;
        id v66 = v18;
        uint64_t v67 = v16;
        uint64_t v68 = v78;
        v58(v78, (char *)v65, v64);
        id v69 = v92;
        char v70 = sub_2378593A0();

        int v71 = *v79;
        uint64_t v72 = v68;
        uint64_t v16 = v67;
        uint64_t v18 = v66;
        (*v79)(v72, v64);
        v71(v69, v64);
        a5 = v97;
        swift_bridgeObjectRelease();
        id result = (id)swift_bridgeObjectRelease();
        uint64_t v25 = v81;
        uint64_t v32 = v90;
        uint64_t v30 = v91;
        uint64_t v35 = v88;
        uint64_t v31 = v89;
        if ((v70 & 1) == 0) {
          goto LABEL_76;
        }
LABEL_66:
        if (!v25) {
          goto LABEL_82;
        }
        --v30;
        uint64_t v28 = *v31;
        unint64_t v27 = v31[1];
        uint64_t v29 = v31[2];
        *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
        v31[2] = v32[2];
        *uint64_t v32 = v28;
        v32[1] = v27;
        *uint64_t v35 = v29;
        if (v30 == v87) {
          goto LABEL_76;
        }
      }
      if (v34 < v29) {
        goto LABEL_66;
      }
LABEL_76:
      a3 = v76 + 1;
    }
    while (v76 + 1 != v75);
  }
  return (id)swift_bridgeObjectRelease();
}

uint64_t sub_23781E638(char *a1, uint64_t a2, unint64_t a3, char *a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v140 = (char *)&v137 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v142 = (uint64_t)&v137 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v144 = (char *)&v137 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v147 = (uint64_t)&v137 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v139 = (char *)&v137 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v141 = (uint64_t)&v137 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v148 = (char *)&v137 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v146 = (uint64_t)&v137 - v25;
  uint64_t v150 = sub_2378593F0();
  uint64_t v26 = *(void *)(v150 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v150);
  id v138 = (char *)&v137 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v143 = (char *)&v137 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v137 = (void (**)(char *, uint64_t))((char *)&v137 - v32);
  MEMORY[0x270FA5388](v31);
  id v145 = (char *)&v137 - v34;
  uint64_t v35 = a2 - (void)a1;
  uint64_t v36 = a3 - (void)v33;
  unint64_t v156 = (unint64_t)a5 >> 62;
  uint64_t v37 = (uint64_t)(a3 - (void)v33) / 24;
  unint64_t v154 = a3;
  if (v35 / 24 >= v37)
  {
    BOOL v43 = v33;
    unint64_t v153 = a1;
    sub_2378051E0(v33, (uint64_t)(a3 - (void)v33) / 24, a4);
    char v44 = v153;
    uint64_t v42 = v43;
    uint64_t v39 = &a4[24 * v37];
    BOOL v45 = v36 < 24 || v153 >= v43;
    uint64_t v41 = a4;
    if (v45) {
      goto LABEL_13;
    }
    uint64_t v91 = a5 & 0xFFFFFFFFFFFFFF8;
    uint64_t v146 = a5 & 0xFFFFFFFFFFFFFF8;
    if (a5 < 0) {
      uint64_t v91 = a5;
    }
    uint64_t v141 = v91;
    unint64_t v159 = a5 & 0xC000000000000001;
    uint64_t v139 = (char *)(v26 + 32);
    uint64_t v137 = (void (**)(char *, uint64_t))(v26 + 8);
    uint64_t v92 = (char *)v154;
    id v151 = a4;
    while (1)
    {
      uint64_t v93 = v92;
      v92 -= 24;
      uint64_t v94 = (uint64_t)(v39 - 24);
      uint64_t v95 = *((void *)v39 - 3);
      uint64_t v96 = *((void *)v39 - 1);
      uint64_t v97 = v42 - 24;
      uint64_t v98 = *((void *)v42 - 3);
      uint64_t v99 = *((void *)v42 - 1);
      if (v96 == v99)
      {
        unint64_t v152 = v39;
        unint64_t v154 = (unint64_t)v92;
        uint64_t v155 = v42;
        uint64_t v100 = *((void *)v39 - 2);
        id v145 = v42 - 24;
        uint64_t v101 = *((void *)v42 - 2);
        uint64_t v157 = v100;
        uint64_t v158 = v101;
        if (v156)
        {
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v102 = sub_23785BCC0();
        }
        else
        {
          uint64_t v102 = *(void *)(v146 + 16);
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        uint64_t v148 = v93;
        uint64_t v149 = v94;
        if (v102)
        {
          uint64_t v103 = 4;
          while (1)
          {
            if (v159) {
              uint64_t result = MEMORY[0x237E22750](v103 - 4, a5);
            }
            else {
              uint64_t result = (uint64_t)*(id *)(a5 + 8 * v103);
            }
            uint64_t v104 = (void *)result;
            uint64_t v105 = v103 - 3;
            if (__OFADD__(v103 - 4, 1)) {
              goto LABEL_174;
            }
            uint64_t result = (uint64_t)objc_msgSend((id)result, sel_value);
            if (!result) {
              goto LABEL_179;
            }
            uint64_t v106 = sub_23781F478((void *)result);
            if (v107)
            {
              if (v106 == v95 && v107 == v157)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                goto LABEL_120;
              }
              char v109 = sub_23785BE30();
              swift_bridgeObjectRelease();
              if (v109) {
                break;
              }
            }

            ++v103;
            if (v105 == v102) {
              goto LABEL_111;
            }
          }
          swift_bridgeObjectRelease();
LABEL_120:
          swift_bridgeObjectRelease();
        }
        else
        {
LABEL_111:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v104 = 0;
        }
        if (v156)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v111 = sub_23785BCC0();
          if (v111)
          {
LABEL_125:
            uint64_t v112 = 4;
            do
            {
              if (v159) {
                uint64_t result = MEMORY[0x237E22750](v112 - 4, a5);
              }
              else {
                uint64_t result = (uint64_t)*(id *)(a5 + 8 * v112);
              }
              uint64_t v113 = (void *)result;
              uint64_t v114 = v112 - 3;
              if (__OFADD__(v112 - 4, 1)) {
                goto LABEL_176;
              }
              uint64_t result = (uint64_t)objc_msgSend((id)result, sel_value);
              if (!result) {
                goto LABEL_180;
              }
              uint64_t v115 = sub_23781F478((void *)result);
              if (v116)
              {
                if (v115 == v98 && v116 == v158)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
LABEL_141:
                  swift_bridgeObjectRelease();
                  goto LABEL_142;
                }
                char v118 = sub_23785BE30();
                swift_bridgeObjectRelease();
                if (v118)
                {
                  swift_bridgeObjectRelease();
                  goto LABEL_141;
                }
              }

              ++v112;
            }
            while (v114 != v111);
          }
        }
        else
        {
          uint64_t v111 = *(void *)(v146 + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v111) {
            goto LABEL_125;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v113 = 0;
LABEL_142:
        uint64_t v119 = v150;
        uint64_t v120 = v147;
        if (!v104)
        {
          __swift_storeEnumTagSinglePayload(v147, 1, 1, v150);
          goto LABEL_149;
        }
        id v121 = objc_msgSend(v104, sel_startDate);
        if (v121)
        {
          id v122 = v121;
          uint64_t v123 = (uint64_t)v144;
          sub_2378593D0();

          uint64_t v124 = 0;
        }
        else
        {
          uint64_t v124 = 1;
          uint64_t v123 = (uint64_t)v144;
        }
        __swift_storeEnumTagSinglePayload(v123, v124, 1, v119);
        uint64_t v120 = v147;
        sub_23781F558(v123, v147);
        if (__swift_getEnumTagSinglePayload(v120, 1, v119) == 1)
        {

LABEL_149:
LABEL_158:
          uint64_t v93 = v148;
          uint64_t v94 = v149;
          sub_23781F4F8(v120);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v41 = v151;
          uint64_t v39 = v152;
          uint64_t v92 = (char *)v154;
          uint64_t v42 = v155;
          char v44 = v153;
LABEL_159:
          BOOL v130 = v93 != v39 || v92 >= v39;
          uint64_t v39 = (char *)v94;
          if (!v130) {
            goto LABEL_165;
          }
          goto LABEL_164;
        }
        unint64_t v125 = *(void (**)(char *, uint64_t, uint64_t))v139;
        (*(void (**)(char *, uint64_t, uint64_t))v139)(v143, v120, v119);
        if (!v113)
        {
          uint64_t v120 = v142;
          __swift_storeEnumTagSinglePayload(v142, 1, 1, v119);
LABEL_157:

          (*v137)(v143, v119);
          goto LABEL_158;
        }
        id v126 = objc_msgSend(v113, sel_startDate);
        if (v126)
        {
          uint64_t v127 = v126;
          uint64_t v128 = (uint64_t)v140;
          sub_2378593D0();

          uint64_t v129 = 0;
        }
        else
        {
          uint64_t v129 = 1;
          uint64_t v128 = (uint64_t)v140;
        }
        __swift_storeEnumTagSinglePayload(v128, v129, 1, v119);
        uint64_t v120 = v142;
        sub_23781F558(v128, v142);
        if (__swift_getEnumTagSinglePayload(v120, 1, v119) == 1)
        {

          uint64_t v104 = v113;
          goto LABEL_157;
        }
        uint64_t v133 = v138;
        v125(v138, v120, v119);
        uint64_t v134 = v143;
        char v135 = sub_2378593A0();

        char v136 = *v137;
        (*v137)(v133, v119);
        v136(v134, v119);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v41 = v151;
        uint64_t v39 = v152;
        uint64_t v92 = (char *)v154;
        uint64_t v42 = v155;
        char v44 = v153;
        uint64_t v93 = v148;
        uint64_t v94 = v149;
        uint64_t v97 = v145;
        if ((v135 & 1) == 0) {
          goto LABEL_159;
        }
      }
      else if (v99 >= v96)
      {
        goto LABEL_159;
      }
      BOOL v110 = v93 != v42 || v92 >= v42;
      uint64_t v94 = (uint64_t)v97;
      uint64_t v42 = v97;
      if (!v110) {
        goto LABEL_165;
      }
LABEL_164:
      long long v131 = *(_OWORD *)v94;
      *((void *)v92 + 2) = *(void *)(v94 + 16);
      *(_OWORD *)uint64_t v92 = v131;
LABEL_165:
      if (v39 <= v41 || v42 <= v44) {
        goto LABEL_13;
      }
    }
  }
  uint64_t v38 = v33;
  sub_2378051E0(a1, v35 / 24, a4);
  uint64_t v39 = &a4[24 * (v35 / 24)];
  BOOL v40 = v35 < 24 || (unint64_t)v38 >= a3;
  uint64_t v41 = a4;
  if (v40)
  {
    uint64_t v42 = a1;
LABEL_13:
    sub_2378051E0(v41, (v39 - v41) / 24, v42);
    swift_bridgeObjectRelease();
    return 1;
  }
  uint64_t v47 = v38;
  uint64_t v48 = a5 & 0xFFFFFFFFFFFFFF8;
  uint64_t v149 = a5 & 0xFFFFFFFFFFFFFF8;
  if (a5 < 0) {
    uint64_t v48 = a5;
  }
  uint64_t v147 = v48;
  unint64_t v159 = a5 & 0xC000000000000001;
  uint64_t v143 = (char *)(v26 + 8);
  uint64_t v144 = (char *)(v26 + 32);
  uint64_t v42 = a1;
  unint64_t v152 = &a4[24 * (v35 / 24)];
LABEL_17:
  uint64_t v49 = *((void *)v47 + 2);
  uint64_t v50 = *((void *)v41 + 2);
  if (v49 != v50)
  {
    if (v50 >= v49) {
      goto LABEL_79;
    }
    goto LABEL_35;
  }
  unint64_t v153 = v42;
  uint64_t v52 = *(void *)v47;
  uint64_t v51 = *((void *)v47 + 1);
  uint64_t v155 = v47;
  uint64_t v54 = *(void *)v41;
  uint64_t v53 = *((void *)v41 + 1);
  id v151 = v41;
  uint64_t v157 = v51;
  uint64_t v158 = v53;
  if (v156)
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v55 = sub_23785BCC0();
    if (!v55)
    {
LABEL_33:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v57 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v55 = *(void *)(v149 + 16);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v55) {
      goto LABEL_33;
    }
  }
  uint64_t v56 = 4;
  while (1)
  {
    uint64_t result = v159 ? MEMORY[0x237E22750](v56 - 4, a5) : (uint64_t)*(id *)(a5 + 8 * v56);
    uint64_t v57 = (void *)result;
    uint64_t v58 = v56 - 3;
    if (__OFADD__(v56 - 4, 1)) {
      break;
    }
    uint64_t result = (uint64_t)objc_msgSend((id)result, sel_value);
    if (!result) {
      goto LABEL_177;
    }
    uint64_t v59 = sub_23781F478((void *)result);
    if (v60)
    {
      BOOL v61 = v59 == v52 && v60 == v157;
      if (v61)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_40;
      }
      char v62 = sub_23785BE30();
      swift_bridgeObjectRelease();
      if (v62)
      {
        swift_bridgeObjectRelease();
LABEL_40:
        swift_bridgeObjectRelease();
LABEL_41:
        if (!v156)
        {
          uint64_t v64 = *(void *)(v149 + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (!v64) {
            goto LABEL_58;
          }
LABEL_45:
          uint64_t v65 = 4;
          while (1)
          {
            if (v159) {
              uint64_t result = MEMORY[0x237E22750](v65 - 4, a5);
            }
            else {
              uint64_t result = (uint64_t)*(id *)(a5 + 8 * v65);
            }
            id v66 = (void *)result;
            uint64_t v67 = v65 - 3;
            if (__OFADD__(v65 - 4, 1)) {
              goto LABEL_175;
            }
            uint64_t result = (uint64_t)objc_msgSend((id)result, sel_value);
            if (!result) {
              goto LABEL_178;
            }
            uint64_t v68 = sub_23781F478((void *)result);
            if (v69)
            {
              if (v68 == v54 && v69 == v158)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
LABEL_61:
                swift_bridgeObjectRelease();
                goto LABEL_62;
              }
              char v71 = sub_23785BE30();
              swift_bridgeObjectRelease();
              if (v71)
              {
                swift_bridgeObjectRelease();
                goto LABEL_61;
              }
            }

            ++v65;
            if (v67 == v64) {
              goto LABEL_58;
            }
          }
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v64 = sub_23785BCC0();
        if (v64) {
          goto LABEL_45;
        }
LABEL_58:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v66 = 0;
LABEL_62:
        uint64_t v72 = v150;
        uint64_t v73 = (uint64_t)v148;
        uint64_t v74 = v146;
        if (!v57)
        {
          __swift_storeEnumTagSinglePayload(v146, 1, 1, v150);
          goto LABEL_69;
        }
        id v75 = objc_msgSend(v57, sel_startDate);
        if (v75)
        {
          uint64_t v76 = v75;
          sub_2378593D0();

          uint64_t v77 = 0;
        }
        else
        {
          uint64_t v77 = 1;
        }
        __swift_storeEnumTagSinglePayload(v73, v77, 1, v72);
        sub_23781F558(v73, v74);
        if (__swift_getEnumTagSinglePayload(v74, 1, v72) != 1)
        {
          uint64_t v79 = *(void (**)(void (**)(char *, uint64_t), uint64_t, uint64_t))v144;
          (*(void (**)(char *, uint64_t, uint64_t))v144)(v145, v74, v72);
          if (!v66)
          {
            uint64_t v84 = v141;
            __swift_storeEnumTagSinglePayload(v141, 1, 1, v72);
LABEL_77:

            (*(void (**)(char *, uint64_t))v143)(v145, v72);
            uint64_t v78 = v84;
            goto LABEL_78;
          }
          id v80 = objc_msgSend(v66, sel_startDate);
          if (v80)
          {
            uint64_t v81 = v80;
            uint64_t v82 = (uint64_t)v139;
            sub_2378593D0();

            uint64_t v83 = 0;
          }
          else
          {
            uint64_t v83 = 1;
            uint64_t v82 = (uint64_t)v139;
          }
          __swift_storeEnumTagSinglePayload(v82, v83, 1, v72);
          uint64_t v84 = v141;
          sub_23781F558(v82, v141);
          if (__swift_getEnumTagSinglePayload(v84, 1, v72) == 1)
          {

            uint64_t v57 = v66;
            goto LABEL_77;
          }
          uint64_t v87 = v137;
          v79(v137, v84, v72);
          char v88 = v145;
          char v89 = sub_2378593A0();

          char v90 = *(void (**)(char *, uint64_t))v143;
          (*(void (**)(void, uint64_t))v143)(v87, v72);
          v90(v88, v72);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v41 = v151;
          uint64_t v39 = v152;
          a3 = v154;
          uint64_t v47 = v155;
          uint64_t v42 = v153;
          if ((v89 & 1) == 0) {
            goto LABEL_79;
          }
LABEL_35:
          uint64_t v63 = v47;
          BOOL v61 = v42 == v47;
          v47 += 24;
          if (!v61) {
            goto LABEL_80;
          }
          goto LABEL_81;
        }

LABEL_69:
        uint64_t v78 = v74;
LABEL_78:
        sub_23781F4F8(v78);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v41 = v151;
        uint64_t v39 = v152;
        a3 = v154;
        uint64_t v47 = v155;
        uint64_t v42 = v153;
LABEL_79:
        uint64_t v63 = v41;
        BOOL v61 = v42 == v41;
        v41 += 24;
        if (!v61)
        {
LABEL_80:
          long long v85 = *(_OWORD *)v63;
          *((void *)v42 + 2) = *((void *)v63 + 2);
          *(_OWORD *)uint64_t v42 = v85;
        }
LABEL_81:
        v42 += 24;
        if (v41 >= v39 || (unint64_t)v47 >= a3) {
          goto LABEL_13;
        }
        goto LABEL_17;
      }
    }

    ++v56;
    if (v58 == v55) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  __break(1u);
LABEL_177:
  __break(1u);
LABEL_178:
  __break(1u);
LABEL_179:
  __break(1u);
LABEL_180:
  __break(1u);
  return result;
}

uint64_t sub_23781F478(void *a1)
{
  id v2 = objc_msgSend(a1, sel_stringValue);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_23785B6B0();

  return v3;
}

uint64_t sub_23781F4E8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_23781F4F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23781F558(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void OUTLINED_FUNCTION_1_13()
{
  uint64_t v2 = *(void **)(v0 - 272);
}

void OUTLINED_FUNCTION_2_16()
{
  uint64_t v2 = *(void **)(v0 - 264);
}

uint64_t OUTLINED_FUNCTION_6_15(uint64_t a1)
{
  *(void *)(v1 - 176) = a1;
  return v1 - 176;
}

ValueMetadata *type metadata accessor for CoreDuetKnowledgeStore()
{
  return &type metadata for CoreDuetKnowledgeStore;
}

id sub_23781F624(uint64_t a1)
{
  v7[1] = *(id *)MEMORY[0x263EF8340];
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F350B8]), sel_init);
  v7[0] = 0;
  id v3 = objc_msgSend(v2, sel_executeQuery_error_, a1, v7);

  if (v3)
  {
    id v4 = v7[0];
  }
  else
  {
    id v5 = v7[0];
    sub_237859300();

    swift_willThrow();
  }
  return v3;
}

id sub_23781F700(uint64_t a1)
{
  return sub_23781F624(a1);
}

uint64_t sub_23781F718(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928100);
  uint64_t v3 = OUTLINED_FUNCTION_2_0(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_5_0();
  uint64_t v6 = v5 - v4;
  sub_23781FE40((uint64_t)&unk_26EA7DAC8, 1, v5 - v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689280F8);
  BOOL v8 = __swift_getEnumTagSinglePayload(v6, 1, v7) != 1;
  sub_23778A330(v6, &qword_268928100);
  return sub_23781F7E8(a1, v8) & 0x101;
}

uint64_t sub_23781F7E8(uint64_t a1, int a2)
{
  LODWORD(v84) = a2;
  sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v76 = v3;
  uint64_t v77 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_1_4();
  uint64_t v75 = v4;
  uint64_t v83 = sub_2378594A0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v80 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_4();
  uint64_t v81 = v7;
  uint64_t v82 = sub_2378594B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v79 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_4();
  uint64_t v78 = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  uint64_t v12 = OUTLINED_FUNCTION_2_0(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1_4();
  long long v85 = (char *)v13;
  uint64_t v14 = sub_2378593F0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v86 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_12_1();
  uint64_t v74 = (char *)(v17 - v18);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v71 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928100);
  uint64_t v23 = OUTLINED_FUNCTION_2_0(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_12_1();
  uint64_t v26 = v24 - v25;
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)&v71 - v28;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689280F8);
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_12_1();
  uint64_t v33 = v31 - v32;
  uint64_t v35 = MEMORY[0x270FA5388](v34);
  uint64_t v73 = (char *)&v71 - v36;
  MEMORY[0x270FA5388](v35);
  uint64_t v38 = (char *)&v71 - v37;
  char v39 = v84;
  sub_23781FE40((uint64_t)&unk_26EA7DA70, v84, (uint64_t)v29);
  if (__swift_getEnumTagSinglePayload((uint64_t)v29, 1, v30) == 1)
  {
    uint64_t v40 = v86;
    sub_23778A330((uint64_t)v29, &qword_268928100);
    sub_23781FE40((uint64_t)&unk_26EA7DA98, v39 & 1, v26);
    if (__swift_getEnumTagSinglePayload(v26, 1, v30) == 1)
    {
      sub_23778A330(v26, &qword_268928100);
      BOOL v41 = 0;
      int v42 = 0;
    }
    else
    {
      uint64_t v59 = *(int *)(v30 + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v33, v26, v14);
      uint64_t v60 = *(void *)(v26 + v59);
      *(void *)(v33 + v59) = v60;
      sub_23778A330(v33, &qword_2689280F8);
      int v42 = 0;
      BOOL v41 = v60 > 2;
    }
  }
  else
  {
    uint64_t v43 = *(int *)(v30 + 48);
    uint64_t v72 = *(void (**)(char *, char *, uint64_t))(v86 + 32);
    v72(v38, v29, v14);
    uint64_t v84 = *(void *)&v29[v43];
    *(void *)&v38[v43] = v84;
    sub_2378593E0();
    uint64_t v44 = v78;
    sub_237859490();
    uint64_t v46 = v80;
    uint64_t v45 = v81;
    uint64_t v47 = v83;
    (*(void (**)(uint64_t, void, uint64_t))(v80 + 104))(v81, *MEMORY[0x263F07870], v83);
    uint64_t v48 = (uint64_t)v85;
    sub_237859480();
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v44, v82);
    if (__swift_getEnumTagSinglePayload(v48, 1, v14) == 1)
    {
      uint64_t v49 = (uint64_t)v38;
      uint64_t v83 = (uint64_t)v21;
      uint64_t v50 = v86;
      sub_23778A330((uint64_t)v85, &qword_26AF0BD78);
      if (qword_268926828 != -1) {
        swift_once();
      }
      uint64_t v51 = v77;
      __swift_project_value_buffer(v77, (uint64_t)qword_268928D70);
      uint64_t v53 = v75;
      uint64_t v52 = v76;
      OUTLINED_FUNCTION_8_0();
      v54();
      uint64_t v55 = (void *)sub_23785B490();
      os_log_type_t v56 = sub_23785B8B0();
      if (OUTLINED_FUNCTION_15_3(v56))
      {
        *(_WORD *)swift_slowAlloc() = 0;
        OUTLINED_FUNCTION_10_7(&dword_237778000, v57, v58, "SiriRemembersStoreProvider.getValidAggregateEntityUsage: Unable to create date range. We have to try to confirm");
        OUTLINED_FUNCTION_10_1();
      }

      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v53, v51);
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v83, v14);
      sub_23778A330(v49, &qword_2689280F8);
      int v42 = 256;
      BOOL v41 = 1;
    }
    else
    {
      v72(v74, v85, v14);
      uint64_t v61 = *(int *)(v30 + 48);
      uint64_t v62 = v86;
      uint64_t v63 = v73;
      OUTLINED_FUNCTION_8_0();
      v64();
      *(void *)&v63[v61] = v84;
      sub_2378593C0();
      double v66 = v65;
      uint64_t v67 = *(void (**)(void))(v62 + 8);
      OUTLINED_FUNCTION_6_16();
      v67();
      sub_2378593C0();
      int v69 = v68 >= v66;
      OUTLINED_FUNCTION_6_16();
      v67();
      OUTLINED_FUNCTION_6_16();
      v67();
      sub_23778A330((uint64_t)v38, &qword_2689280F8);
      int v42 = v69 << 8;
      BOOL v41 = 1;
    }
  }
  return v42 | v41;
}

uint64_t sub_23781FE40@<X0>(uint64_t a1@<X1>, int a2@<W2>, uint64_t a3@<X8>)
{
  int v61 = a2;
  uint64_t v60 = a1;
  uint64_t v64 = a3;
  sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v62 = v5;
  uint64_t v63 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_12_1();
  uint64_t v8 = v6 - v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v59 = (char *)&v57 - v10;
  sub_2378593F0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v57 = v12;
  uint64_t v58 = v11;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5_0();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689280F0);
  uint64_t v17 = OUTLINED_FUNCTION_2_0(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_5_0();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = sub_23785AFA0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_5_0();
  uint64_t v27 = v26 - v25;
  uint64_t v28 = sub_23785B2D0();
  if (!v29)
  {
    if (qword_268926828 != -1) {
      swift_once();
    }
    uint64_t v41 = v63;
    __swift_project_value_buffer(v63, (uint64_t)qword_268928D70);
    uint64_t v42 = v62;
    OUTLINED_FUNCTION_8_0();
    v43();
    uint64_t v44 = (void *)sub_23785B490();
    os_log_type_t v45 = sub_23785B8A0();
    if (OUTLINED_FUNCTION_15_3(v45))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_10_7(&dword_237778000, v46, v47, "SiriRemembersStoreProvider.getEventData: Unable to search Siri Remembers for a nil roomName");
      OUTLINED_FUNCTION_10_1();
    }

    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v8, v41);
    goto LABEL_13;
  }
  uint64_t v30 = v28;
  unint64_t v31 = v29;
  __swift_project_boxed_opaque_existential_1((void *)(v3 + 16), *(void *)(v3 + 40));
  char v32 = v61;
  sub_23782EC1C(v30, v31, v60, v20);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v20, 1, v21) == 1)
  {
    sub_23778A330(v20, &qword_2689280F0);
    if (qword_268926828 != -1) {
      swift_once();
    }
    uint64_t v33 = v63;
    __swift_project_value_buffer(v63, (uint64_t)qword_268928D70);
    uint64_t v34 = v62;
    uint64_t v35 = v59;
    OUTLINED_FUNCTION_8_0();
    v36();
    uint64_t v37 = (void *)sub_23785B490();
    os_log_type_t v38 = sub_23785B8A0();
    if (OUTLINED_FUNCTION_15_3(v38))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_10_7(&dword_237778000, v39, v40, "SiriRemembersStoreProvider.getEventData: Did not find any previous interactions");
      OUTLINED_FUNCTION_10_1();
    }

    (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v33);
LABEL_13:
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689280F8);
    uint64_t v49 = v64;
    uint64_t v50 = 1;
    return __swift_storeEnumTagSinglePayload(v49, v50, 1, v48);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v27, v20, v21);
  sub_23785AF90();
  if (v32) {
    uint64_t v51 = sub_23778B638();
  }
  else {
    uint64_t v51 = sub_23778B800();
  }
  uint64_t v52 = v51;
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v27, v21);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689280F8);
  uint64_t v54 = *(int *)(v53 + 48);
  uint64_t v55 = v64;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 32))(v64, v15, v58);
  *(void *)(v55 + v54) = v52;
  uint64_t v49 = v55;
  uint64_t v50 = 0;
  uint64_t v48 = v53;
  return __swift_storeEnumTagSinglePayload(v49, v50, 1, v48);
}

uint64_t type metadata accessor for HistoricalDeviceInteractionProvider()
{
  return self;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriRemembersResult(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[24])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
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

uint64_t storeEnumTagSinglePayload for SiriRemembersResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriRemembersResult()
{
  return &type metadata for SiriRemembersResult;
}

uint64_t sub_237820378(unsigned __int8 a1, char a2)
{
  uint64_t v3 = 0x656369766544;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 1836019538;
    }
    else {
      uint64_t v5 = 0x797469746E45;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE400000000000000;
    }
    else {
      unint64_t v6 = 0xE600000000000000;
    }
  }
  else
  {
    unint64_t v6 = 0xE600000000000000;
    uint64_t v5 = 0x656369766544;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 1836019538;
    }
    else {
      uint64_t v3 = 0x797469746E45;
    }
    if (a2 == 1) {
      unint64_t v7 = 0xE400000000000000;
    }
    else {
      unint64_t v7 = 0xE600000000000000;
    }
  }
  else
  {
    unint64_t v7 = 0xE600000000000000;
  }
  if (v5 == v3 && v6 == v7) {
    OUTLINED_FUNCTION_8_12();
  }
  else {
    char v2 = OUTLINED_FUNCTION_3_20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_237820454(char a1, char a2)
{
  BOOL v3 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v4 = 0x6C65636E6163;
  }
  else {
    uint64_t v4 = 0x6D7269666E6F63;
  }
  if (v3) {
    unint64_t v5 = 0xE700000000000000;
  }
  else {
    unint64_t v5 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v6 = 0x6C65636E6163;
  }
  else {
    uint64_t v6 = 0x6D7269666E6F63;
  }
  if (a2) {
    unint64_t v7 = 0xE600000000000000;
  }
  else {
    unint64_t v7 = 0xE700000000000000;
  }
  if (v4 == v6 && v5 == v7) {
    OUTLINED_FUNCTION_8_12();
  }
  else {
    char v2 = OUTLINED_FUNCTION_3_20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2378204E4(unsigned __int8 a1, char a2)
{
  uint64_t v3 = 7562617;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 28526;
    }
    else {
      uint64_t v5 = 0x6C65636E6163;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE200000000000000;
    }
    else {
      unint64_t v6 = 0xE600000000000000;
    }
  }
  else
  {
    unint64_t v6 = 0xE300000000000000;
    uint64_t v5 = 7562617;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 28526;
    }
    else {
      uint64_t v3 = 0x6C65636E6163;
    }
    if (a2 == 1) {
      unint64_t v7 = 0xE200000000000000;
    }
    else {
      unint64_t v7 = 0xE600000000000000;
    }
  }
  else
  {
    unint64_t v7 = 0xE300000000000000;
  }
  if (v5 == v3 && v6 == v7) {
    OUTLINED_FUNCTION_8_12();
  }
  else {
    char v2 = OUTLINED_FUNCTION_3_20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2378205B0(char a1, char a2)
{
  BOOL v3 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v4 = 0x69736976656C6574;
  }
  else {
    uint64_t v4 = 0x76745F656C707061;
  }
  if (v3) {
    unint64_t v5 = 0xE800000000000000;
  }
  else {
    unint64_t v5 = 0xEA00000000006E6FLL;
  }
  if (a2) {
    uint64_t v6 = 0x69736976656C6574;
  }
  else {
    uint64_t v6 = 0x76745F656C707061;
  }
  if (a2) {
    unint64_t v7 = 0xEA00000000006E6FLL;
  }
  else {
    unint64_t v7 = 0xE800000000000000;
  }
  if (v4 == v6 && v5 == v7) {
    OUTLINED_FUNCTION_8_12();
  }
  else {
    char v2 = OUTLINED_FUNCTION_3_20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_237820648()
{
  OUTLINED_FUNCTION_11_10();
  uint64_t v4 = 0x6E776F6E6B6E75;
  switch(v5)
  {
    case 1:
      uint64_t v4 = 6647407;
      unint64_t v0 = 0xE300000000000000;
      break;
    case 2:
      unint64_t v0 = 0xE300000000000000;
      uint64_t v4 = 7105633;
      break;
    case 3:
      unint64_t v0 = 0xE400000000000000;
      uint64_t v4 = 2037277037;
      break;
    case 4:
      unint64_t v0 = 0xE300000000000000;
      uint64_t v4 = 6645876;
      break;
    case 5:
      unint64_t v0 = 0xE500000000000000;
      uint64_t v4 = 0x6573656874;
      break;
    case 6:
      unint64_t v0 = 0xE200000000000000;
      uint64_t v4 = 29801;
      break;
    case 7:
      unint64_t v0 = 0xE400000000000000;
      uint64_t v4 = 1936287860;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(v2)
  {
    case 1:
      uint64_t v3 = 6647407;
      unint64_t v6 = 0xE300000000000000;
      break;
    case 2:
      unint64_t v6 = 0xE300000000000000;
      uint64_t v3 = 7105633;
      break;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v3 = 2037277037;
      break;
    case 4:
      unint64_t v6 = 0xE300000000000000;
      uint64_t v3 = 6645876;
      break;
    case 5:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v3 = 0x6573656874;
      break;
    case 6:
      unint64_t v6 = 0xE200000000000000;
      uint64_t v3 = 29801;
      break;
    case 7:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v3 = 1936287860;
      break;
    default:
      break;
  }
  if (v4 == v3 && v0 == v6) {
    OUTLINED_FUNCTION_8_12();
  }
  else {
    char v1 = OUTLINED_FUNCTION_3_20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_237820818()
{
  OUTLINED_FUNCTION_29_8();
  unint64_t v4 = 1852141679;
  switch(v5)
  {
    case 1:
      unint64_t v4 = OUTLINED_FUNCTION_31_8();
      break;
    case 2:
      unint64_t v4 = OUTLINED_FUNCTION_20_5();
      break;
    case 3:
      unint64_t v4 = OUTLINED_FUNCTION_19_11();
      break;
    case 4:
      unint64_t v4 = OUTLINED_FUNCTION_27_10();
      unint64_t v0 = 0xE90000000000006CLL;
      break;
    case 5:
      unint64_t v4 = 2036427888;
      break;
    case 6:
      unint64_t v0 = 0xE600000000000000;
      unint64_t v4 = 0x686372616573;
      break;
    case 7:
      unint64_t v0 = 0xE600000000000000;
      uint64_t v6 = 1633972341;
      goto LABEL_10;
    case 8:
      unint64_t v4 = 0x537070416E65706FLL;
      unint64_t v0 = 0xEF63696669636570;
      break;
    case 9:
      unint64_t v0 = 0xE600000000000000;
      uint64_t v6 = 1634038371;
LABEL_10:
      unint64_t v4 = v6 & 0xFFFF0000FFFFFFFFLL | 0x657400000000;
      break;
    case 10:
      unint64_t v4 = 0x6170206863746566;
      unint64_t v0 = 0xEA00000000006567;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE400000000000000;
  switch(v2)
  {
    case 1:
      OUTLINED_FUNCTION_30_7();
      break;
    case 2:
      OUTLINED_FUNCTION_17_15();
      break;
    case 3:
      OUTLINED_FUNCTION_16_13();
      break;
    case 4:
      OUTLINED_FUNCTION_32_4();
      unint64_t v7 = 0xE90000000000006CLL;
      break;
    case 5:
      unint64_t v3 = 2036427888;
      break;
    case 6:
      unint64_t v7 = 0xE600000000000000;
      unint64_t v3 = 0x686372616573;
      break;
    case 7:
      unint64_t v7 = 0xE600000000000000;
      uint64_t v8 = 1633972341;
      goto LABEL_22;
    case 8:
      unint64_t v3 = 0x537070416E65706FLL;
      unint64_t v7 = 0xEF63696669636570;
      break;
    case 9:
      unint64_t v7 = 0xE600000000000000;
      uint64_t v8 = 1634038371;
LABEL_22:
      unint64_t v3 = v8 & 0xFFFF0000FFFFFFFFLL | 0x657400000000;
      break;
    case 10:
      unint64_t v3 = 0x6170206863746566;
      unint64_t v7 = 0xEA00000000006567;
      break;
    default:
      break;
  }
  if (v4 == v3 && v0 == v7) {
    OUTLINED_FUNCTION_8_12();
  }
  else {
    char v1 = OUTLINED_FUNCTION_3_20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_237820A68()
{
  OUTLINED_FUNCTION_11_10();
  uint64_t v4 = 0x6E776F6E6B6E75;
  switch(v5)
  {
    case 1:
      unint64_t v0 = 0xE300000000000000;
      uint64_t v4 = 7368801;
      break;
    case 2:
      unint64_t v0 = 0xE600000000000000;
      uint64_t v4 = 0x7265646C6F66;
      break;
    case 3:
      uint64_t v4 = 0x6E696874656D6F73;
      unint64_t v0 = 0xE900000000000067;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(v2)
  {
    case 1:
      unint64_t v6 = 0xE300000000000000;
      uint64_t v3 = 7368801;
      break;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v3 = 0x7265646C6F66;
      break;
    case 3:
      uint64_t v3 = 0x6E696874656D6F73;
      unint64_t v6 = 0xE900000000000067;
      break;
    default:
      break;
  }
  if (v4 == v3 && v0 == v6) {
    OUTLINED_FUNCTION_8_12();
  }
  else {
    char v1 = OUTLINED_FUNCTION_3_20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_237820BB0()
{
  OUTLINED_FUNCTION_29_8();
  uint64_t v4 = 1852141679;
  switch(v5)
  {
    case 1:
      uint64_t v4 = 0x736972616D6D7573;
      unint64_t v0 = 0xE900000000000065;
      break;
    case 2:
      uint64_t v4 = OUTLINED_FUNCTION_31_8();
      break;
    case 3:
      uint64_t v4 = 1953068401;
      break;
    case 4:
      unint64_t v0 = 0xE600000000000000;
      uint64_t v4 = 0x627265566F6ELL;
      break;
    case 5:
      uint64_t v4 = OUTLINED_FUNCTION_19_11();
      break;
    case 6:
      uint64_t v4 = OUTLINED_FUNCTION_20_5();
      break;
    case 7:
      uint64_t v4 = OUTLINED_FUNCTION_27_10();
      unint64_t v0 = 0xE90000000000006CLL;
      break;
    case 8:
      unint64_t v0 = 0xE600000000000000;
      uint64_t v4 = 0x6574656C6564;
      break;
    case 9:
      unint64_t v0 = 0xE700000000000000;
      uint64_t v4 = 0x6E776F6E6B6E75;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(v2)
  {
    case 1:
      uint64_t v3 = 0x736972616D6D7573;
      unint64_t v6 = 0xE900000000000065;
      break;
    case 2:
      OUTLINED_FUNCTION_30_7();
      break;
    case 3:
      uint64_t v3 = 1953068401;
      break;
    case 4:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v3 = 0x627265566F6ELL;
      break;
    case 5:
      OUTLINED_FUNCTION_16_13();
      break;
    case 6:
      OUTLINED_FUNCTION_17_15();
      break;
    case 7:
      OUTLINED_FUNCTION_32_4();
      unint64_t v6 = 0xE90000000000006CLL;
      break;
    case 8:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v3 = 0x6574656C6564;
      break;
    case 9:
      unint64_t v6 = 0xE700000000000000;
      OUTLINED_FUNCTION_33_8();
      break;
    default:
      break;
  }
  if (v4 == v3 && v0 == v6) {
    OUTLINED_FUNCTION_8_12();
  }
  else {
    char v1 = OUTLINED_FUNCTION_3_20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t *InstalledAppProvider.shared.unsafeMutableAddressor()
{
  if (qword_26AF0BC80 != -1) {
    swift_once();
  }
  return &static InstalledAppProvider.shared;
}

uint64_t sub_237820E08(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if ((v5 & ~v2) == 0) {
        uint64_t v4 = 0;
      }
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_237820E5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (unint64_t v4 = sub_2377ED5B8(a1, a2), (v5 & 1) != 0)) {
    return *(void *)(*(void *)(a3 + 56) + 8 * v4);
  }
  else {
    return 0;
  }
}

double sub_237820EA4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_2377ED5B8(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_23778F494(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_237820F08(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_2377ED630(a1), (v2 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

void *sub_237820F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_2377ED5B8(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  unint64_t v6 = *(void **)(*(void *)(a3 + 56) + 8 * v4);
  id v7 = v6;
  return v6;
}

void *Actions.launchable.unsafeMutableAddressor()
{
  return &static Actions.launchable;
}

void *Actions.quittable.unsafeMutableAddressor()
{
  return &static Actions.quittable;
}

uint64_t sub_237820FBC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_23785BE30();
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
    if (v12 || (sub_23785BE30() & 1) != 0) {
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

void sub_237821084()
{
  OUTLINED_FUNCTION_23_0();
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    goto LABEL_33;
  }
  uint64_t v3 = v1;
  char v4 = v0;
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  while (*(unsigned char *)(v3 + v5 + 32) == 8)
  {
    if (v4 == 8) {
      goto LABEL_32;
    }
LABEL_27:
    if (v2 == ++v5) {
      goto LABEL_32;
    }
  }
  unint64_t v6 = 0xE700000000000000;
  switch(*(unsigned char *)(v3 + v5 + 32))
  {
    case 1:
      unint64_t v6 = 0xE300000000000000;
      break;
    case 2:
      unint64_t v6 = 0xE300000000000000;
      break;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      break;
    case 4:
      unint64_t v6 = 0xE300000000000000;
      break;
    case 5:
      unint64_t v6 = 0xE500000000000000;
      break;
    case 6:
      unint64_t v6 = 0xE200000000000000;
      break;
    case 7:
      unint64_t v6 = 0xE400000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE700000000000000;
  OUTLINED_FUNCTION_33_8();
  switch(v10)
  {
    case 0:
      break;
    case 1:
      uint64_t v9 = 6647407;
      unint64_t v7 = 0xE300000000000000;
      break;
    case 2:
      unint64_t v7 = 0xE300000000000000;
      uint64_t v9 = 7105633;
      break;
    case 3:
      unint64_t v7 = 0xE400000000000000;
      uint64_t v9 = 2037277037;
      break;
    case 4:
      unint64_t v7 = 0xE300000000000000;
      uint64_t v9 = 6645876;
      break;
    case 5:
      unint64_t v7 = 0xE500000000000000;
      uint64_t v9 = 0x6573656874;
      break;
    case 6:
      unint64_t v7 = 0xE200000000000000;
      uint64_t v9 = 29801;
      break;
    case 7:
      unint64_t v7 = 0xE400000000000000;
      uint64_t v9 = 1936287860;
      break;
    default:
      goto LABEL_27;
  }
  if (v8 != v9 || v6 != v7)
  {
    char v12 = sub_23785BE30();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_32;
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_32:
  swift_bridgeObjectRelease();
LABEL_33:
  OUTLINED_FUNCTION_18_3();
}

uint64_t static Actions.launchable.getter()
{
  return 1;
}

uint64_t static Actions.quittable.getter()
{
  return 2;
}

uint64_t sub_237821304@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_237821334(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_237821334(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_23782133C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_23782136C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_23782136C(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_237821374(void *a1, uint64_t *a2)
{
  return sub_2377C6804(a1, *a2);
}

uint64_t sub_23782137C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_2378213B0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_2378213B0(uint64_t a1)
{
  uint64_t result = *v1 & a1;
  if (result) {
    *v1 &= ~a1;
  }
  return result;
}

uint64_t sub_2378213D4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_237821408(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_237821408(uint64_t a1)
{
  uint64_t v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_237821420(uint64_t *a1)
{
  return sub_2377C6830(*a1);
}

uint64_t sub_237821428(uint64_t *a1)
{
  return sub_2377C6840(*a1);
}

uint64_t sub_237821430(uint64_t *a1)
{
  return sub_237821438(*a1);
}

uint64_t sub_237821438(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_237821448@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_237821478(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_237821478(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_237821480(uint64_t *a1)
{
  return sub_23782148C(*a1, *v1);
}

BOOL sub_23782148C(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_237821498(uint64_t *a1)
{
  return sub_2378214A4(*a1, *v1);
}

BOOL sub_2378214A4(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_2378214B0(uint64_t *a1)
{
  return sub_2378214BC(*a1, *v1);
}

BOOL sub_2378214BC(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_2378214C8()
{
  return sub_2378214D0(*v0);
}

BOOL sub_2378214D0(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_2378214DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_2378214F4(uint64_t *a1)
{
  return sub_2378214FC(*a1);
}

uint64_t sub_2378214FC(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

void *sub_23782150C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_23782151C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_237820E08(a1);
  *a2 = result;
  return result;
}

void *sub_237821544()
{
  type metadata accessor for InstalledAppProvider();
  swift_allocObject();
  uint64_t result = sub_23782185C();
  static InstalledAppProvider.shared = (uint64_t)result;
  return result;
}

uint64_t static InstalledAppProvider.shared.getter()
{
  if (qword_26AF0BC80 != -1) {
    swift_once();
  }
  return swift_retain();
}

id sub_2378215DC()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  id result = sub_237825D84(0xD000000000000018, 0x8000000237864C10);
  qword_268928108 = (uint64_t)result;
  return result;
}

uint64_t sub_23782162C()
{
  uint64_t v0 = sub_23785B650();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2377FCC40(1, 0xD000000000000019, 0x80000002378649A0);
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2377FCC40(3, 0xD00000000000001BLL, 0x8000000237867490);
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2377FCC40(3, 0xD000000000000018, 0x8000000237865DB0);
  uint64_t result = swift_bridgeObjectRelease();
  qword_268928110 = v0;
  return result;
}

uint64_t sub_237821744()
{
  uint64_t v0 = sub_23785B650();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2377FCC40(1, 0xD000000000000014, 0x8000000237867430);
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2377FCC40(1, 0xD000000000000012, 0x8000000237867450);
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2377FCC40(1, 0xD000000000000016, 0x8000000237867470);
  uint64_t result = swift_bridgeObjectRelease();
  qword_268928118 = v0;
  return result;
}

void *sub_23782185C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  swift_defaultActor_initialize();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_237826AE4;
  *(void *)(v4 + 24) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BE08);
  swift_allocObject();
  v1[14] = sub_237827600(&unk_268928178, v4, 120.0);
  return v1;
}

uint64_t sub_237821948()
{
  uint64_t v149 = sub_23785B440();
  uint64_t v148 = *(void *)(v149 - 8);
  MEMORY[0x270FA5388](v149);
  uint64_t v147 = (char *)&v145 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = sub_2378593F0();
  uint64_t v158 = *(void *)(v162 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v162);
  uint64_t v146 = (char *)&v145 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v145 - v4;
  MEMORY[0x270FA5388](v3);
  unint64_t v170 = (char *)&v145 - v6;
  uint64_t v183 = sub_23785B4B0();
  uint64_t v174 = *(void *)(v183 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v183);
  uint64_t v165 = (char *)&v145 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v145 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v145 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v173 = (char *)&v145 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v168 = (char *)&v145 - v18;
  MEMORY[0x270FA5388](v17);
  v182 = (char *)&v145 - v19;
  uint64_t v167 = sub_23785B400();
  uint64_t v20 = *(void *)(v167 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v167);
  uint64_t v161 = (char *)&v145 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v145 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v145 - v26;
  uint64_t v28 = sub_23785B430();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v166 = (char *)&v145 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v145 - v32;
  if (qword_2689266E8 != -1) {
    swift_once();
  }
  uint64_t v34 = __swift_project_value_buffer(v28, (uint64_t)qword_268928BF8);
  uint64_t v172 = v29;
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
  uint64_t v153 = v34;
  uint64_t v171 = v28;
  uint64_t v154 = v29 + 16;
  unint64_t v152 = v35;
  ((void (*)(char *))v35)(v33);
  sub_23785B3F0();
  uint64_t v36 = sub_23785B420();
  os_signpost_type_t v37 = sub_23785B960();
  char v38 = sub_23785B9B0();
  uint64_t v150 = v14;
  if (v38)
  {
    uint64_t v39 = v11;
    uint64_t v40 = v5;
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v41 = 0;
    os_signpost_id_t v42 = sub_23785B3E0();
    _os_signpost_emit_with_name_impl(&dword_237778000, v36, v37, v42, "installedAppProviderInstalledApps", "enableTelemetry=YES", v41, 2u);
    uint64_t v43 = v41;
    uint64_t v5 = v40;
    uint64_t v11 = v39;
    MEMORY[0x237E23210](v43, -1, -1);
  }

  uint64_t v44 = v167;
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v25, v27, v167);
  sub_23785B470();
  swift_allocObject();
  uint64_t v157 = sub_23785B460();
  os_log_type_t v45 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v159 = v20 + 8;
  unint64_t v156 = v45;
  v45(v27, v44);
  uint64_t v46 = v172 + 8;
  uint64_t v155 = *(void (**)(char *, uint64_t))(v172 + 8);
  v155(v33, v171);
  if (qword_2689266E0 != -1) {
    swift_once();
  }
  uint64_t v47 = v183;
  uint64_t v48 = __swift_project_value_buffer(v183, (uint64_t)qword_268928BE0);
  uint64_t v49 = v174;
  uint64_t v50 = *(void (**)(char *, uint64_t, uint64_t))(v174 + 16);
  uint64_t v51 = v182;
  uint64_t v179 = v48;
  uint64_t v180 = v174 + 16;
  uint64_t v178 = v50;
  ((void (*)(char *))v50)(v182);
  uint64_t v52 = sub_23785B490();
  os_log_type_t v53 = sub_23785B8A0();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v54 = 0;
    _os_log_impl(&dword_237778000, v52, v53, "InstalledAppProvider.lsRecordApps() starting", v54, 2u);
    uint64_t v55 = v54;
    uint64_t v47 = v183;
    MEMORY[0x237E23210](v55, -1, -1);
  }

  uint64_t v177 = *(void (**)(char *, uint64_t))(v49 + 8);
  v177(v51, v47);
  sub_2378593E0();
  uint64_t v56 = swift_allocObject();
  uint64_t v57 = MEMORY[0x263F8EE78];
  uint64_t v151 = v56;
  *(void *)(v56 + 16) = MEMORY[0x263F8EE78];
  BOOL v169 = (void *)(v56 + 16);
  uint64_t v176 = swift_allocObject();
  *(void *)(v176 + 16) = v57;
  uint64_t v58 = (char *)objc_msgSend(self, sel_enumeratorWithOptions_, 192);
  uint64_t v59 = (SEL *)&_swift_FORCE_LOAD___swift_math___SiriAppLaunchIntents;
  id v60 = objc_msgSend(v58, sel_nextObject);
  uint64_t v172 = v46;
  uint64_t v62 = v173;
  v182 = v58;
  uint64_t v174 = v49 + 8;
  if (v60)
  {
    id v63 = v60;
    uint64_t v64 = (SEL *)&_swift_FORCE_LOAD___swift_math___SiriAppLaunchIntents;
    uint64_t v175 = "installedAppProviderWarm";
    unint64_t v164 = 0x8000000237867410;
    *(void *)&long long v61 = 136315138;
    long long v163 = v61;
    uint64_t v145 = MEMORY[0x263F8EE58] + 8;
    char v181 = v5;
    do
    {
      if (objc_msgSend(v63, v64[255], v145))
      {
      }
      else
      {
        double v65 = v63;
        uint64_t v66 = sub_23778BE6C(v65);
        if (v67)
        {
          uint64_t v68 = v66;
          unint64_t v69 = v67;
          uint64_t v70 = qword_2689267D8;
          swift_bridgeObjectRetain();
          if (v70 != -1) {
            swift_once();
          }
          uint64_t v71 = (void *)qword_268928108;
          if (qword_268928108)
          {
            uint64_t v72 = (void *)sub_23785B6A0();
            unsigned __int8 v73 = objc_msgSend(v71, sel_BOOLForKey_, v72);

            if (v73)
            {
              uint64_t v74 = v168;
              uint64_t v75 = v183;
              v178(v168, v179, v183);
              swift_bridgeObjectRetain_n();
              uint64_t v76 = sub_23785B490();
              os_log_type_t v77 = sub_23785B8A0();
              if (os_log_type_enabled(v76, v77))
              {
                uint64_t v78 = swift_slowAlloc();
                uint64_t v79 = v11;
                uint64_t v80 = swift_slowAlloc();
                uint64_t v184 = v80;
                *(_DWORD *)uint64_t v78 = v163;
                swift_bridgeObjectRetain();
                *(void *)(v78 + 4) = sub_2377C6A68(v68, v69, &v184);
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_237778000, v76, v77, "Checking bundle: %s", (uint8_t *)v78, 0xCu);
                swift_arrayDestroy();
                uint64_t v81 = v80;
                uint64_t v11 = v79;
                MEMORY[0x237E23210](v81, -1, -1);
                MEMORY[0x237E23210](v78, -1, -1);

                uint64_t v82 = v168;
              }
              else
              {

                swift_bridgeObjectRelease_n();
                uint64_t v82 = v74;
              }
              v177(v82, v75);
              swift_bridgeObjectRelease();
              uint64_t v47 = v75;
              uint64_t v62 = v173;
            }
            else
            {
              swift_bridgeObjectRelease();
              uint64_t v47 = v183;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          if (qword_26AF0BC80 != -1) {
            swift_once();
          }
          char v88 = v65;
          InstalledAppProvider.shouldIgnoreApp(bundleId:lsRecord:for:)();
          char v90 = v89;

          uint64_t v91 = (void *)qword_268928108;
          if (v90)
          {
            if (qword_268928108)
            {
              swift_bridgeObjectRetain();
              uint64_t v92 = (void *)sub_23785B6A0();
              unsigned int v93 = objc_msgSend(v91, sel_BOOLForKey_, v92);

              if (v93)
              {
                v178(v62, v179, v47);
                swift_bridgeObjectRetain_n();
                uint64_t v94 = sub_23785B490();
                os_log_type_t v95 = sub_23785B8A0();
                if (os_log_type_enabled(v94, v95))
                {
                  uint64_t v96 = swift_slowAlloc();
                  uint64_t v97 = swift_slowAlloc();
                  uint64_t v184 = v97;
                  *(_DWORD *)uint64_t v96 = v163;
                  swift_bridgeObjectRetain();
                  *(void *)(v96 + 4) = sub_2377C6A68(v68, v69, &v184);
                  swift_bridgeObjectRelease_n();
                  _os_log_impl(&dword_237778000, v94, v95, "Ignoring app: %s", (uint8_t *)v96, 0xCu);
                  swift_arrayDestroy();
                  MEMORY[0x237E23210](v97, -1, -1);
                  MEMORY[0x237E23210](v96, -1, -1);

                  uint64_t v98 = v62;
                  uint64_t v99 = v183;
                }
                else
                {

                  swift_bridgeObjectRelease_n();
                  uint64_t v98 = v62;
                  uint64_t v99 = v47;
                }
                v177(v98, v99);
              }
              swift_bridgeObjectRelease();
            }
            uint64_t v108 = *(void *)(v176 + 16);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_23780411C(0, *(void *)(v108 + 16) + 1, 1, v108);
              uint64_t v108 = v116;
            }
            unint64_t v110 = *(void *)(v108 + 16);
            unint64_t v109 = *(void *)(v108 + 24);
            if (v110 >= v109 >> 1)
            {
              sub_23780411C(v109 > 1, v110 + 1, 1, v108);
              uint64_t v108 = v117;
            }
            *(void *)(v108 + 16) = v110 + 1;
            uint64_t v111 = v108 + 16 * v110;
            *(void *)(v111 + 32) = v68;
            *(void *)(v111 + 40) = v69;

            *(void *)(v176 + 16) = v108;
            uint64_t v58 = v182;
            uint64_t v47 = v183;
            uint64_t v5 = v181;
            uint64_t v59 = (SEL *)&_swift_FORCE_LOAD___swift_math___SiriAppLaunchIntents;
            uint64_t v64 = (SEL *)&_swift_FORCE_LOAD___swift_math___SiriAppLaunchIntents;
          }
          else
          {
            if (qword_268928108
              && (uint64_t v100 = (void *)sub_23785B6A0(),
                  unsigned __int8 v101 = objc_msgSend(v91, sel_BOOLForKey_, v100),
                  v100,
                  (v101 & 1) != 0))
            {
              uint64_t v102 = v150;
              v178(v150, v179, v47);
              swift_bridgeObjectRetain_n();
              uint64_t v103 = sub_23785B490();
              os_log_type_t v104 = sub_23785B8A0();
              if (os_log_type_enabled(v103, v104))
              {
                uint64_t v105 = swift_slowAlloc();
                uint64_t v106 = swift_slowAlloc();
                uint64_t v184 = v106;
                *(_DWORD *)uint64_t v105 = v163;
                swift_bridgeObjectRetain();
                *(void *)(v105 + 4) = sub_2377C6A68(v68, v69, &v184);
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_237778000, v103, v104, "Allowing app: %s", (uint8_t *)v105, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x237E23210](v106, -1, -1);
                uint64_t v107 = v105;
                uint64_t v47 = v183;
                MEMORY[0x237E23210](v107, -1, -1);
              }
              else
              {

                swift_bridgeObjectRelease_n();
              }
              v177(v102, v47);
              swift_bridgeObjectRelease();
              uint64_t v62 = v173;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
            type metadata accessor for Application();
            uint64_t v112 = v88;
            id v113 = sub_23778BAD8(v112);
            uint64_t v64 = (SEL *)&_swift_FORCE_LOAD___swift_math___SiriAppLaunchIntents;
            if (v113)
            {
              id v114 = v113;
              uint64_t v115 = v169;
              MEMORY[0x237E22320]();
              uint64_t v5 = v181;
              if (*(void *)((*v115 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v115 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_23785B7D0();
              }
              sub_23785B7F0();
              sub_23785B7C0();

              uint64_t v47 = v183;
            }
            else
            {

              uint64_t v5 = v181;
            }
            uint64_t v58 = v182;
            uint64_t v59 = (SEL *)&_swift_FORCE_LOAD___swift_math___SiriAppLaunchIntents;
          }
        }
        else
        {
          v178(v11, v179, v47);
          uint64_t v83 = sub_23785B490();
          os_log_type_t v84 = sub_23785B8B0();
          if (os_log_type_enabled(v83, v84))
          {
            long long v85 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)long long v85 = 0;
            _os_log_impl(&dword_237778000, v83, v84, "InstalledAppProvider.lsRecordApps() error missing bundle identifier for LSApplicationRecord", v85, 2u);
            uint64_t v86 = v85;
            uint64_t v47 = v183;
            MEMORY[0x237E23210](v86, -1, -1);
            uint64_t v87 = v65;
          }
          else
          {
            uint64_t v87 = v83;
            uint64_t v83 = v65;
          }
          uint64_t v58 = v182;
          uint64_t v59 = (SEL *)&_swift_FORCE_LOAD___swift_math___SiriAppLaunchIntents;
          uint64_t v64 = (SEL *)&_swift_FORCE_LOAD___swift_math___SiriAppLaunchIntents;

          v177(v11, v47);
          uint64_t v5 = v181;
        }
      }
      id v63 = [v58 v59[263]];
    }
    while (v63);
  }
  v178(v165, v179, v47);
  uint64_t v118 = v158;
  uint64_t v119 = v162;
  (*(void (**)(char *, char *, uint64_t))(v158 + 16))(v5, v170, v162);
  uint64_t v120 = sub_23785B490();
  int v121 = sub_23785B8A0();
  if (os_log_type_enabled(v120, (os_log_type_t)v121))
  {
    LODWORD(v180) = v121;
    uint64_t v122 = swift_slowAlloc();
    *(_DWORD *)uint64_t v122 = 134218240;
    uint64_t v123 = v146;
    sub_2378593E0();
    sub_237859370();
    uint64_t v125 = v124;
    id v126 = *(void (**)(char *, uint64_t))(v118 + 8);
    uint64_t v127 = v119;
    uint64_t v128 = v151;
    swift_retain();
    v126(v123, v127);
    uint64_t v184 = v125;
    sub_23785B9E0();
    v126(v5, v127);
    *(_WORD *)(v122 + 12) = 2048;
    swift_beginAccess();
    unint64_t v129 = *(void *)(v128 + 16);
    if (v129 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v130 = sub_23785BCC0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v130 = *(void *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v184 = v130;
    sub_23785B9E0();
    swift_release();
    _os_log_impl(&dword_237778000, v120, (os_log_type_t)v180, "InstalledAppProvider.lsRecordApps() complete in %fms with %ld apps", (uint8_t *)v122, 0x16u);
    MEMORY[0x237E23210](v122, -1, -1);
    uint64_t v131 = v171;
    uint64_t v58 = v182;
    uint64_t v132 = v162;
  }
  else
  {
    id v126 = *(void (**)(char *, uint64_t))(v118 + 8);
    v126(v5, v119);
    uint64_t v131 = v171;
    uint64_t v132 = v119;
    uint64_t v128 = v151;
  }

  v177(v165, v183);
  swift_retain();
  uint64_t v133 = v176;
  swift_retain();
  sub_23782390C(v160, v128, v133);

  v126(v170, v132);
  swift_beginAccess();
  uint64_t v134 = *(void *)(v128 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  v152(v166, v153, v131);
  char v135 = sub_23785B420();
  char v136 = v161;
  sub_23785B450();
  os_signpost_type_t v137 = sub_23785B950();
  if (sub_23785B9B0())
  {
    swift_retain();
    id v138 = v147;
    sub_23785B480();
    swift_release();
    uint64_t v139 = v148;
    uint64_t v140 = v149;
    if ((*(unsigned int (**)(char *, uint64_t))(v148 + 88))(v138, v149) == *MEMORY[0x263F90238])
    {
      uint64_t v141 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v139 + 8))(v138, v140);
      uint64_t v141 = "";
    }
    uint64_t v142 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v142 = 0;
    os_signpost_id_t v143 = sub_23785B3E0();
    _os_signpost_emit_with_name_impl(&dword_237778000, v135, v137, v143, "installedAppProviderInstalledApps", v141, v142, 2u);
    MEMORY[0x237E23210](v142, -1, -1);
  }

  v156(v136, v167);
  v155(v166, v171);
  swift_release();
  return v134;
}

uint64_t sub_237822D60(void *a1, uint64_t (*a2)(void))
{
  *a1 = a2();
  uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
  return sub_237826BF4(v3);
}

uint64_t sub_237822DEC()
{
  OUTLINED_FUNCTION_13();
  v1[2] = v0;
  uint64_t v2 = sub_23785B440();
  v1[3] = v2;
  OUTLINED_FUNCTION_0_4(v2);
  v1[4] = v3;
  v1[5] = swift_task_alloc();
  uint64_t v4 = sub_23785B400();
  v1[6] = v4;
  OUTLINED_FUNCTION_0_4(v4);
  v1[7] = v5;
  v1[8] = OUTLINED_FUNCTION_21_12();
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  uint64_t v6 = sub_23785B4B0();
  v1[11] = v6;
  OUTLINED_FUNCTION_0_4(v6);
  v1[12] = v7;
  v1[13] = OUTLINED_FUNCTION_21_12();
  v1[14] = swift_task_alloc();
  uint64_t v8 = sub_23785B430();
  v1[15] = v8;
  OUTLINED_FUNCTION_0_4(v8);
  v1[16] = v9;
  v1[17] = OUTLINED_FUNCTION_21_12();
  v1[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_237822F44, v0, 0);
}

uint64_t sub_237822F44()
{
  if (qword_2689266E0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[12];
  uint64_t v3 = __swift_project_value_buffer(v0[11], (uint64_t)qword_268928BE0);
  v0[19] = v3;
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[20] = v4;
  v0[21] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v28 = v4;
  uint64_t v29 = v3;
  ((void (*)(uint64_t))v4)(v1);
  sub_23785B410();
  sub_23785B3F0();
  uint64_t v5 = sub_23785B420();
  os_signpost_type_t v6 = sub_23785B960();
  if (sub_23785B9B0())
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    os_signpost_id_t v8 = sub_23785B3E0();
    _os_signpost_emit_with_name_impl(&dword_237778000, v5, v6, v8, "installedAppProviderWarm", "enableTelemetry=YES", v7, 2u);
    OUTLINED_FUNCTION_5_3();
  }
  uint64_t v10 = v0[15];
  uint64_t v9 = v0[16];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[10];
  uint64_t v26 = v0[18];
  uint64_t v27 = v0[11];
  uint64_t v14 = v0[6];
  uint64_t v13 = v0[7];

  OUTLINED_FUNCTION_8_0();
  v15();
  sub_23785B470();
  swift_allocObject();
  v0[22] = sub_23785B460();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v0[23] = v16;
  v0[24] = (v13 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v16(v12, v14);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v0[25] = v17;
  v0[26] = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v17(v26, v10);
  v28(v11, v29, v27);
  uint64_t v18 = sub_23785B490();
  os_log_type_t v19 = sub_23785B8D0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_237778000, v18, v19, "InstalledAppProvider.warm() warming app search", v20, 2u);
    OUTLINED_FUNCTION_5_3();
  }
  uint64_t v22 = v0[12];
  uint64_t v21 = v0[13];
  uint64_t v23 = v0[11];

  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
  uint64_t v30 = (uint64_t (__cdecl *)())((char *)&dword_268928128 + dword_268928128);
  uint64_t v24 = (void *)swift_task_alloc();
  v0[27] = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_237823260;
  return v30();
}

uint64_t sub_237823260()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_5();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_23782334C, v2, 0);
}

uint64_t sub_23782334C()
{
  (*(void (**)(void, void, void))(v0 + 160))(*(void *)(v0 + 112), *(void *)(v0 + 152), *(void *)(v0 + 88));
  sub_23785B410();
  uint64_t v1 = sub_23785B420();
  sub_23785B450();
  os_signpost_type_t v2 = sub_23785B950();
  if (sub_23785B9B0())
  {
    uint64_t v3 = *(void *)(v0 + 32);
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v5 = *(void *)(v0 + 24);
    swift_retain();
    sub_23785B480();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 88))(v4, v5) == *MEMORY[0x263F90238])
    {
      uint64_t v6 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 32) + 8))(*(void *)(v0 + 40), *(void *)(v0 + 24));
      uint64_t v6 = "";
    }
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    os_signpost_id_t v8 = sub_23785B3E0();
    _os_signpost_emit_with_name_impl(&dword_237778000, v1, v2, v8, "installedAppProviderWarm", v6, v7, 2u);
    OUTLINED_FUNCTION_5_3();
  }
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v0 + 200);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
  uint64_t v11 = *(void *)(v0 + 136);
  uint64_t v12 = *(void *)(v0 + 120);
  uint64_t v13 = *(void *)(v0 + 64);
  uint64_t v14 = *(void *)(v0 + 48);

  v10(v13, v14);
  v9(v11, v12);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t InstalledAppProvider.installedApps()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_23782359C, v0, 0);
}

uint64_t sub_23782359C()
{
  OUTLINED_FUNCTION_13();
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_268928128 + dword_268928128);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_237823640;
  return v3();
}

uint64_t sub_237823640()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_5();
  *os_signpost_type_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = OUTLINED_FUNCTION_8_6();
  return v4(v3);
}

void sub_237823704()
{
  uint64_t v0 = sub_23785B4B0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2689267D8 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_268928108;
  if (qword_268928108)
  {
    uint64_t v5 = (void *)sub_23785B6A0();
    unsigned int v6 = objc_msgSend(v4, sel_BOOLForKey_, v5);

    if (v6)
    {
      if (qword_2689266E0 != -1) {
        swift_once();
      }
      uint64_t v7 = __swift_project_value_buffer(v0, (uint64_t)qword_268928BE0);
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v7, v0);
      os_signpost_id_t v8 = sub_23785B490();
      os_log_type_t v9 = sub_23785B8A0();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_237778000, v8, v9, "\tIgnoring hidden app check due to set user default", v10, 2u);
        MEMORY[0x237E23210](v10, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }
  }
}

uint64_t sub_23782390C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_2689267D8 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_268928108;
  if (qword_268928108)
  {
    unsigned int v6 = (void *)sub_23785B6A0();
    unsigned int v7 = objc_msgSend(v5, sel_BOOLForKey_, v6);

    if (v7) {
      sub_2378239DC(a2, a3);
    }
  }
  swift_release();
  return swift_release();
}

uint64_t sub_2378239DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23785B4B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unsigned int v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2689266E0 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_268928BE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_retain_n();
  swift_retain_n();
  os_log_type_t v9 = sub_23785B490();
  int v10 = sub_23785B8A0();
  if (!os_log_type_enabled(v9, (os_log_type_t)v10))
  {

    swift_release_n();
    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  int v38 = v10;
  uint64_t v11 = swift_slowAlloc();
  uint64_t v37 = swift_slowAlloc();
  uint64_t v47 = v37;
  *(_DWORD *)uint64_t v11 = 136315394;
  swift_beginAccess();
  unint64_t v12 = *(void *)(a1 + 16);
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v13 = sub_23785BCC0();
  }
  else
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
  }
  uint64_t v43 = v5;
  uint64_t v44 = v4;
  uint64_t v41 = a2;
  os_signpost_id_t v42 = v7;
  uint64_t v39 = a1;
  os_log_t v40 = v9;
  if (!v13)
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
LABEL_22:
    swift_bridgeObjectRelease_n();
    v46[0] = v15;
    swift_bridgeObjectRetain();
    sub_237826100(v46);
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_2377C36E8(v46[0]);
    unint64_t v29 = v28;
    swift_release();
    v46[0] = sub_2377C6A68(v27, v29, &v47);
    sub_23785B9E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v30 = v41;
    swift_beginAccess();
    uint64_t v45 = *(void *)(v30 + 16);
    swift_bridgeObjectRetain_n();
    sub_237826100(&v45);
    swift_bridgeObjectRelease();
    uint64_t v31 = sub_2377C36E8(v45);
    unint64_t v33 = v32;
    swift_release();
    uint64_t v45 = sub_2377C6A68(v31, v33, &v47);
    sub_23785B9E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v34 = v40;
    _os_log_impl(&dword_237778000, v40, (os_log_type_t)v38, "Launchable apps: %s\nIgnored apps: %s", (uint8_t *)v11, 0x16u);
    uint64_t v35 = v37;
    swift_arrayDestroy();
    MEMORY[0x237E23210](v35, -1, -1);
    MEMORY[0x237E23210](v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v42, v44);
  }
  if (v13 >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = MEMORY[0x263F8EE78];
    do
    {
      if ((v12 & 0xC000000000000001) != 0) {
        id v16 = (id)MEMORY[0x237E22750](v14, v12);
      }
      else {
        id v16 = *(id *)(v12 + 8 * v14 + 32);
      }
      uint64_t v17 = v16;
      uint64_t v18 = sub_23778BEE8(v16);
      uint64_t v20 = v19;

      if (v20)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23780411C(0, *(void *)(v15 + 16) + 1, 1, v15);
          uint64_t v15 = v24;
        }
        unint64_t v22 = *(void *)(v15 + 16);
        unint64_t v21 = *(void *)(v15 + 24);
        if (v22 >= v21 >> 1)
        {
          sub_23780411C(v21 > 1, v22 + 1, 1, v15);
          uint64_t v15 = v25;
        }
        *(void *)(v15 + 16) = v22 + 1;
        uint64_t v23 = v15 + 16 * v22;
        *(void *)(v23 + 32) = v18;
        *(void *)(v23 + 40) = v20;
      }
      ++v14;
    }
    while (v13 != v14);
    goto LABEL_22;
  }
  __break(1u);
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t InstalledAppProvider.getApp(byBundleId:for:)()
{
  sub_237823F44();
  if (v0 == 1) {
    return 0;
  }
  uint64_t v2 = v0;

  return v2;
}

uint64_t InstalledAppProvider.getRecord(byBundleId:for:)()
{
  sub_237823F44();
  if (v0 == (void *)1) {
    return 0;
  }
  uint64_t v2 = v1;

  return v2;
}

void sub_237823F44()
{
  OUTLINED_FUNCTION_23_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_0();
  id v5 = objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  id v6 = sub_237825CA8(v3, v1, 1);
  if (qword_26AF0BC80 != -1) {
    swift_once();
  }
  id v7 = v6;
  InstalledAppProvider.shouldIgnoreApp(bundleId:lsRecord:for:)();
  char v9 = v8;

  if (v9)
  {
  }
  else
  {
    type metadata accessor for Application();
    sub_23778BAD8(v7);
  }
  OUTLINED_FUNCTION_18_3();
}

Swift::String_optional __swiftcall InstalledAppProvider.getAdamId(byBundleId:for:)(Swift::String byBundleId, SiriAppLaunchIntents::Actions a2)
{
  OUTLINED_FUNCTION_23_0();
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5_0();
  sub_237823F44();
  if (v8 != (void *)1
    && (int v10 = v9, v8, v10)
    && (id v11 = objc_msgSend(v10, sel_iTunesMetadata),
        v10,
        id v12 = objc_msgSend(v11, sel_storeItemIdentifier),
        v11,
        v12))
  {
    uint64_t v24 = (uint64_t)v12;
    sub_23785BE00();
  }
  else
  {
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v6, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_8_0();
    v13();
    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_23785B490();
    os_log_type_t v15 = sub_23785B890();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)id v16 = 136315138;
      swift_bridgeObjectRetain();
      sub_2377C6A68(v5, v3, &v24);
      sub_23785B9E0();
      swift_bridgeObjectRelease_n();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      uint64_t v17 = OUTLINED_FUNCTION_9_1();
      v18(v17);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v19 = OUTLINED_FUNCTION_9_1();
      v20(v19);
    }
  }
  OUTLINED_FUNCTION_18_3();
  result.value._object = v22;
  result.value._countAndFlagsBits = v21;
  return result;
}

Swift::Bool __swiftcall InstalledAppProvider.shouldIgnoreApp(bundleId:for:)(Swift::String bundleId, SiriAppLaunchIntents::Actions a2)
{
  InstalledAppProvider.shouldIgnoreApp(bundleId:lsRecord:for:)();
  return result;
}

Swift::Bool __swiftcall InstalledAppProvider.isHidden(bundleId:)(Swift::String bundleId)
{
  objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  uint64_t v1 = OUTLINED_FUNCTION_9_1();
  id v3 = sub_237825CA8(v1, v2, 1);
  uint64_t v5 = v3;
  if (!v3) {
    return 0;
  }
  unsigned __int8 v4 = objc_msgSend(v3, sel_appProtectionHidden);

  return v4;
}

void InstalledAppProvider.shouldIgnoreApp(bundleId:lsRecord:for:)()
{
  OUTLINED_FUNCTION_23_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5_0();
  if (v1)
  {
    id v7 = v1;
  }
  else
  {
    objc_allocWithZone(MEMORY[0x263F01878]);
    swift_bridgeObjectRetain();
    id v7 = sub_237825CA8(v5, v3, 1);
  }
  id v8 = v1;
  if (objc_msgSend(v7, sel_appProtectionHidden))
  {

LABEL_17:
    OUTLINED_FUNCTION_18_3();
    return;
  }
  uint64_t v9 = v5;
  id v10 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  id v11 = sub_237825D84(0xD000000000000018, 0x8000000237864C10);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = (void *)sub_23785B6A0();
    unsigned int v14 = objc_msgSend(v12, sel_BOOLForKey_, v13);

    if (v14)
    {
      sub_237823704();

      goto LABEL_17;
    }
  }
  sub_23785B070();
  sub_23785B060();
  sub_23785B050();
  char v15 = sub_23785B090();
  swift_release();
  if (v15)
  {
    if (qword_2689267E8 != -1) {
      swift_once();
    }
    uint64_t v16 = qword_268928118;
    swift_bridgeObjectRetain();
    sub_237820E5C(v9, v3, v16);
    char v18 = v17;
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0) {
      goto LABEL_16;
    }
  }
  if (qword_2689267E0 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_268928110;
  swift_bridgeObjectRetain();
  sub_237820E5C(v9, v3, v19);
  char v21 = v20;
  swift_bridgeObjectRelease();
  if ((v21 & 1) == 0)
  {
LABEL_16:
    swift_release();

    goto LABEL_17;
  }
  id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F32048]), sel_init);
  unsigned int v23 = objc_msgSend(v22, sel_isClarityBoardEnabled);

  if (v23)
  {
    sub_237825E7C();
    id v24 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
    id v25 = objc_msgSend(v24, sel_applicationBundleIdentifiers);

    uint64_t v26 = (void *)sub_23785B7A0();
    sub_237820FBC(v9, v3, v26);
    swift_bridgeObjectRelease();
    swift_release();

    goto LABEL_17;
  }
  uint64_t v27 = SBSCopyDisplayIdentifiers();
  if (v27)
  {
    unint64_t v28 = (void *)v27;
    unint64_t v29 = (void *)sub_23785B6A0();
    objc_msgSend(v28, sel_containsObject_, v29);

    swift_release();
    goto LABEL_17;
  }
  __break(1u);
}

uint64_t InstalledAppProvider.deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t InstalledAppProvider.__deallocating_deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t InstalledAppProvider.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_237824C64()
{
  return InstalledAppProvider.unownedExecutor.getter();
}

uint64_t sub_237824C80()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2377C29F0;
  return InstalledAppProvider.installedApps()();
}

uint64_t sub_237824D10()
{
  return InstalledAppProvider.getApp(byBundleId:for:)();
}

uint64_t sub_237824D34()
{
  return InstalledAppProvider.getRecord(byBundleId:for:)();
}

uint64_t sub_237824D58(uint64_t a1, uint64_t a2, SiriAppLaunchIntents::Actions a3)
{
  return InstalledAppProvider.getAdamId(byBundleId:for:)(*(Swift::String *)&a1, a3).value._countAndFlagsBits;
}

BOOL sub_237824D70(uint64_t a1, uint64_t a2, SiriAppLaunchIntents::Actions a3)
{
  return InstalledAppProvider.shouldIgnoreApp(bundleId:for:)(*(Swift::String *)&a1, a3);
}

BOOL sub_237824D98(uint64_t a1, uint64_t a2)
{
  return InstalledAppProvider.isHidden(bundleId:)(*(Swift::String *)&a1);
}

uint64_t sub_237824DB4()
{
  OUTLINED_FUNCTION_13();
  v1[5] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  v1[6] = swift_task_alloc();
  uint64_t v2 = sub_2378593F0();
  v1[7] = v2;
  OUTLINED_FUNCTION_0_4(v2);
  v1[8] = v3;
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_237824E94()
{
  OUTLINED_FUNCTION_13_13();
  OUTLINED_FUNCTION_26_10();
  sub_237826030(v2, v0);
  if (__swift_getEnumTagSinglePayload(v0, 1, v1) == 1)
  {
    sub_23781F4F8(v3[6]);
LABEL_7:
    id v10 = (void *)swift_task_alloc();
    v3[17] = (uint64_t)v10;
    *id v10 = v3;
    id v11 = sub_237826C58;
    goto LABEL_8;
  }
  uint64_t v5 = OUTLINED_FUNCTION_10_14();
  v6(v5);
  uint64_t v7 = *(void *)(v1 + 40);
  v3[12] = v7;
  if (!v7)
  {
    uint64_t v12 = OUTLINED_FUNCTION_37_5();
    v13(v12);
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_38_6();
  sub_2378593E0();
  sub_237859380();
  uint64_t v8 = OUTLINED_FUNCTION_9_13();
  ((void (*)(uint64_t))v4)(v8);
  char v9 = sub_2378593B0();
  OUTLINED_FUNCTION_21_4();
  v4();
  if ((v9 & 1) == 0)
  {
    OUTLINED_FUNCTION_21_4();
    v4();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18_6();
    __asm { BRAA            X2, X16 }
  }
  id v10 = (void *)swift_task_alloc();
  v3[15] = (uint64_t)v10;
  *id v10 = v3;
  id v11 = sub_237825094;
LABEL_8:
  v10[1] = v11;
  OUTLINED_FUNCTION_18_6();
  return sub_237825758();
}

uint64_t sub_237825094()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  *(void *)(v1 + 128) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_237825168()
{
  v1[5] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  v1[6] = swift_task_alloc();
  uint64_t v2 = sub_2378593F0();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_237825274, 0, 0);
}

uint64_t sub_237825274()
{
  OUTLINED_FUNCTION_13_13();
  OUTLINED_FUNCTION_26_10();
  sub_237826030(v2, v0);
  if (__swift_getEnumTagSinglePayload(v0, 1, v1) == 1)
  {
    sub_23781F4F8(v3[6]);
LABEL_7:
    id v10 = (void *)swift_task_alloc();
    v3[17] = (uint64_t)v10;
    *id v10 = v3;
    id v11 = sub_2378255E4;
    goto LABEL_8;
  }
  uint64_t v5 = OUTLINED_FUNCTION_10_14();
  v6(v5);
  uint64_t v7 = *(void *)(v1 + 40);
  v3[12] = v7;
  if (!v7)
  {
    uint64_t v12 = OUTLINED_FUNCTION_37_5();
    v13(v12);
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_38_6();
  sub_2378593E0();
  sub_237859380();
  uint64_t v8 = OUTLINED_FUNCTION_9_13();
  ((void (*)(uint64_t))v4)(v8);
  char v9 = sub_2378593B0();
  OUTLINED_FUNCTION_21_4();
  v4();
  if ((v9 & 1) == 0)
  {
    OUTLINED_FUNCTION_21_4();
    v4();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18_6();
    __asm { BRAA            X2, X16 }
  }
  id v10 = (void *)swift_task_alloc();
  v3[15] = (uint64_t)v10;
  *id v10 = v3;
  id v11 = sub_237825474;
LABEL_8:
  v10[1] = v11;
  OUTLINED_FUNCTION_18_6();
  return sub_237825978();
}

uint64_t sub_237825474()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  *(void *)(v1 + 128) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_237825548()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 104);
  swift_bridgeObjectRelease();
  uint64_t v2 = OUTLINED_FUNCTION_9_1();
  v1(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = OUTLINED_FUNCTION_8_6();
  return v4(v3);
}

uint64_t sub_2378255E4(uint64_t a1)
{
  uint64_t v3 = *v1;
  OUTLINED_FUNCTION_1_5();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(a1);
}

uint64_t sub_237825758()
{
  v1[6] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2378257FC, 0, 0);
}

uint64_t sub_2378257FC()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_20();
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 72) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2378258B0;
  return v5(v0);
}

uint64_t sub_2378258B0()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_5();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_237825978()
{
  v1[6] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_237825A1C, 0, 0);
}

uint64_t sub_237825A1C()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_20();
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 72) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_237825AD0;
  return v5(v0);
}

uint64_t sub_237825AD0()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_5();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_237825B98()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = (void *)v0[6];
  v3[5] = v0[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_2378593E0();
  uint64_t v4 = sub_2378593F0();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v4);
  sub_23781F558(v1, v2);
  uint64_t v5 = (uint64_t)v3 + *(void *)(*v3 + 112);
  swift_beginAccess();
  sub_237826098(v2, v5);
  swift_endAccess();
  uint64_t v6 = v0[5];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
  return v7(v6);
}

id sub_237825CA8(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_237859300();

    swift_willThrow();
  }
  return v6;
}

id sub_237825D84(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

uint64_t sub_237825DE8@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result) {
    *a2 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

void sub_237825DF8(uint8_t *a1, uint32_t a2, NSObject *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
  os_signpost_id_t v13 = sub_23785B3E0();
  _os_signpost_emit_with_name_impl(&dword_237778000, a3, a4, v13, a6, a7, a1, a2);
}

unint64_t sub_237825E7C()
{
  unint64_t result = qword_268928130;
  if (!qword_268928130)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268928130);
  }
  return result;
}

unint64_t sub_237825EC0()
{
  unint64_t result = qword_268928138;
  if (!qword_268928138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928138);
  }
  return result;
}

unint64_t sub_237825F10()
{
  unint64_t result = qword_268928140;
  if (!qword_268928140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928140);
  }
  return result;
}

unint64_t sub_237825F60()
{
  unint64_t result = qword_26AF0BE10;
  if (!qword_26AF0BE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF0BE10);
  }
  return result;
}

unint64_t sub_237825FB0()
{
  unint64_t result = qword_26AF0BE18;
  if (!qword_26AF0BE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF0BE18);
  }
  return result;
}

ValueMetadata *type metadata accessor for Actions()
{
  return &type metadata for Actions;
}

uint64_t type metadata accessor for InstalledAppProvider()
{
  return self;
}

uint64_t sub_237826030(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237826098(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_237826100(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_2377FC368(v2);
    uint64_t v2 = v3;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  uint64_t result = sub_23782616C(v6);
  *a1 = v2;
  return result;
}

uint64_t sub_23782616C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_23785BDF0();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_237826800(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_126;
  }
  uint64_t v5 = result;
  uint64_t result = sub_2377ECF94(v3 / 2);
  uint64_t v89 = result;
  uint64_t v90 = v3;
  unsigned int v93 = v6;
  uint64_t v87 = a1;
  if (v3 <= 0)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    unint64_t v28 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_91:
    if (v28 < 2)
    {
LABEL_102:
      uint64_t result = swift_bridgeObjectRelease();
      if (v90 >= -1)
      {
        *(void *)(v89 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_131;
    }
    uint64_t v80 = *v87;
    while (1)
    {
      unint64_t v81 = v28 - 2;
      if (v28 < 2) {
        break;
      }
      if (!v80) {
        goto LABEL_135;
      }
      uint64_t v82 = *(void *)(v9 + 32 + 16 * v81);
      uint64_t v83 = *(void *)(v9 + 32 + 16 * (v28 - 1) + 8);
      uint64_t result = sub_2378268E4((char *)(v80 + 16 * v82), (char *)(v80 + 16 * *(void *)(v9 + 32 + 16 * (v28 - 1))), v80 + 16 * v83, v93);
      if (v1) {
        goto LABEL_88;
      }
      if (v83 < v82) {
        goto LABEL_121;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_2377FC29C(v9);
        uint64_t v9 = result;
      }
      if (v81 >= *(void *)(v9 + 16)) {
        goto LABEL_122;
      }
      os_log_type_t v84 = (void *)(v9 + 32 + 16 * v81);
      void *v84 = v82;
      v84[1] = v83;
      unint64_t v85 = *(void *)(v9 + 16);
      if (v28 > v85) {
        goto LABEL_123;
      }
      uint64_t result = (uint64_t)memmove((void *)(v9 + 32 + 16 * (v28 - 1)), (const void *)(v9 + 32 + 16 * v28), 16 * (v85 - v28));
      *(void *)(v9 + 16) = v85 - 1;
      unint64_t v28 = v85 - 1;
      if (v85 <= 2) {
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
    return result;
  }
  uint64_t v88 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v86 = *a1 + 40;
  uint64_t v9 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v10 = v7++;
    uint64_t v91 = v10;
    if (v7 < v3)
    {
      sub_23778EF5C();
      uint64_t result = sub_23785BA30();
      uint64_t v11 = result;
      uint64_t v7 = v10 + 2;
      if (v10 + 2 < v3)
      {
        uint64_t v12 = v86 + 16 * v10;
        while (1)
        {
          OUTLINED_FUNCTION_34_6();
          uint64_t result = sub_23785BA30();
          if ((v11 == -1) == (result != -1)) {
            break;
          }
          v12 += 16;
          if (++v7 >= v3)
          {
            uint64_t v7 = v3;
            break;
          }
        }
      }
      if (v11 == -1)
      {
        if (v7 < v10) {
          goto LABEL_130;
        }
        if (v10 < v7)
        {
          uint64_t v13 = 16 * v7;
          uint64_t v14 = 16 * v10;
          uint64_t v15 = v7;
          uint64_t v16 = v10;
          do
          {
            if (v16 != --v15)
            {
              if (!v8) {
                goto LABEL_134;
              }
              uint64_t v17 = v8 + v13;
              uint64_t v18 = *(void *)(v8 + v14);
              uint64_t v19 = *(void *)(v8 + v14 + 8);
              *(_OWORD *)(v8 + v14) = *(_OWORD *)(v8 + v13 - 16);
              *(void *)(v17 - 16) = v18;
              *(void *)(v17 - 8) = v19;
            }
            ++v16;
            v13 -= 16;
            v14 += 16;
          }
          while (v16 < v15);
        }
      }
    }
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v10)) {
        goto LABEL_125;
      }
      if (v7 - v10 < v88)
      {
        if (__OFADD__(v10, v88)) {
          goto LABEL_128;
        }
        if (v10 + v88 >= v3) {
          uint64_t v20 = v3;
        }
        else {
          uint64_t v20 = v10 + v88;
        }
        if (v20 < v10) {
          goto LABEL_129;
        }
        if (v7 != v20)
        {
          sub_23778EF5C();
          char v21 = (void *)(v8 + 16 * v7);
          do
          {
            uint64_t v22 = v10;
            unsigned int v23 = v21;
            do
            {
              OUTLINED_FUNCTION_34_6();
              uint64_t result = sub_23785BA30();
              if (result != -1) {
                break;
              }
              if (!v8) {
                goto LABEL_132;
              }
              uint64_t v24 = *v23;
              uint64_t v25 = v23[1];
              *(_OWORD *)unsigned int v23 = *((_OWORD *)v23 - 1);
              *(v23 - 1) = v25;
              *(v23 - 2) = v24;
              v23 -= 2;
              ++v22;
            }
            while (v7 != v22);
            ++v7;
            v21 += 2;
            uint64_t v10 = v91;
          }
          while (v7 != v20);
          uint64_t v7 = v20;
        }
      }
    }
    if (v7 < v10) {
      goto LABEL_124;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_2377FC1A4(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    unint64_t v27 = *(void *)(v9 + 16);
    unint64_t v26 = *(void *)(v9 + 24);
    unint64_t v28 = v27 + 1;
    if (v27 >= v26 >> 1)
    {
      uint64_t result = (uint64_t)sub_2377FC1A4((char *)(v26 > 1), v27 + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    *(void *)(v9 + 16) = v28;
    uint64_t v92 = v9 + 32;
    unint64_t v29 = (uint64_t *)(v9 + 32 + 16 * v27);
    *unint64_t v29 = v10;
    v29[1] = v7;
    if (v27) {
      break;
    }
    unint64_t v28 = 1;
LABEL_83:
    uint64_t v3 = v90;
    if (v7 >= v90) {
      goto LABEL_91;
    }
  }
  uint64_t v30 = v9 + 32;
  while (1)
  {
    unint64_t v31 = v28 - 1;
    if (v28 >= 4)
    {
      unint64_t v36 = v30 + 16 * v28;
      uint64_t v37 = *(void *)(v36 - 64);
      uint64_t v38 = *(void *)(v36 - 56);
      BOOL v42 = __OFSUB__(v38, v37);
      uint64_t v39 = v38 - v37;
      if (v42) {
        goto LABEL_109;
      }
      uint64_t v41 = *(void *)(v36 - 48);
      uint64_t v40 = *(void *)(v36 - 40);
      BOOL v42 = __OFSUB__(v40, v41);
      uint64_t v34 = v40 - v41;
      char v35 = v42;
      if (v42) {
        goto LABEL_110;
      }
      unint64_t v43 = v28 - 2;
      uint64_t v44 = (uint64_t *)(v30 + 16 * (v28 - 2));
      uint64_t v46 = *v44;
      uint64_t v45 = v44[1];
      BOOL v42 = __OFSUB__(v45, v46);
      uint64_t v47 = v45 - v46;
      if (v42) {
        goto LABEL_111;
      }
      BOOL v42 = __OFADD__(v34, v47);
      uint64_t v48 = v34 + v47;
      if (v42) {
        goto LABEL_113;
      }
      if (v48 >= v39)
      {
        uint64_t v66 = (uint64_t *)(v30 + 16 * v31);
        uint64_t v68 = *v66;
        uint64_t v67 = v66[1];
        BOOL v42 = __OFSUB__(v67, v68);
        uint64_t v69 = v67 - v68;
        if (v42) {
          goto LABEL_119;
        }
        BOOL v59 = v34 < v69;
        goto LABEL_72;
      }
    }
    else
    {
      if (v28 != 3)
      {
        uint64_t v60 = *(void *)(v9 + 32);
        uint64_t v61 = *(void *)(v9 + 40);
        BOOL v42 = __OFSUB__(v61, v60);
        uint64_t v53 = v61 - v60;
        char v54 = v42;
        goto LABEL_66;
      }
      uint64_t v33 = *(void *)(v9 + 32);
      uint64_t v32 = *(void *)(v9 + 40);
      BOOL v42 = __OFSUB__(v32, v33);
      uint64_t v34 = v32 - v33;
      char v35 = v42;
    }
    if (v35) {
      goto LABEL_112;
    }
    unint64_t v43 = v28 - 2;
    uint64_t v49 = (uint64_t *)(v30 + 16 * (v28 - 2));
    uint64_t v51 = *v49;
    uint64_t v50 = v49[1];
    BOOL v52 = __OFSUB__(v50, v51);
    uint64_t v53 = v50 - v51;
    char v54 = v52;
    if (v52) {
      goto LABEL_114;
    }
    uint64_t v55 = (uint64_t *)(v30 + 16 * v31);
    uint64_t v57 = *v55;
    uint64_t v56 = v55[1];
    BOOL v42 = __OFSUB__(v56, v57);
    uint64_t v58 = v56 - v57;
    if (v42) {
      goto LABEL_116;
    }
    if (__OFADD__(v53, v58)) {
      goto LABEL_118;
    }
    if (v53 + v58 >= v34)
    {
      BOOL v59 = v34 < v58;
LABEL_72:
      if (v59) {
        unint64_t v31 = v43;
      }
      goto LABEL_74;
    }
LABEL_66:
    if (v54) {
      goto LABEL_115;
    }
    uint64_t v62 = (uint64_t *)(v30 + 16 * v31);
    uint64_t v64 = *v62;
    uint64_t v63 = v62[1];
    BOOL v42 = __OFSUB__(v63, v64);
    uint64_t v65 = v63 - v64;
    if (v42) {
      goto LABEL_117;
    }
    if (v65 < v53) {
      goto LABEL_83;
    }
LABEL_74:
    unint64_t v70 = v31 - 1;
    if (v31 - 1 >= v28)
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
    uint64_t v71 = v8;
    if (!v8) {
      goto LABEL_133;
    }
    uint64_t v72 = v9;
    unsigned __int8 v73 = (uint64_t *)(v30 + 16 * v70);
    uint64_t v74 = v30;
    uint64_t v75 = *v73;
    uint64_t v76 = (void *)(v74 + 16 * v31);
    uint64_t v77 = v76[1];
    uint64_t v78 = v71;
    uint64_t result = sub_2378268E4((char *)(v71 + 16 * *v73), (char *)(v71 + 16 * *v76), v71 + 16 * v77, v93);
    if (v1) {
      break;
    }
    if (v77 < v75) {
      goto LABEL_106;
    }
    if (v31 > *(void *)(v72 + 16)) {
      goto LABEL_107;
    }
    uint64_t *v73 = v75;
    uint64_t v30 = v92;
    *(void *)(v92 + 16 * v70 + 8) = v77;
    unint64_t v79 = *(void *)(v72 + 16);
    if (v31 >= v79) {
      goto LABEL_108;
    }
    uint64_t v9 = v72;
    unint64_t v28 = v79 - 1;
    uint64_t result = (uint64_t)memmove(v76, v76 + 2, 16 * (v79 - 1 - v31));
    *(void *)(v72 + 16) = v79 - 1;
    uint64_t v8 = v78;
    if (v79 <= 2) {
      goto LABEL_83;
    }
  }
LABEL_88:
  uint64_t result = swift_bridgeObjectRelease();
  if (v90 < -1) {
    goto LABEL_127;
  }
  *(void *)(v89 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_237826800(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v12 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    sub_23778EF5C();
    id v6 = (void *)(v5 + 16 * v4);
    while (2)
    {
      uint64_t v7 = v12;
      uint64_t v8 = v6;
      do
      {
        OUTLINED_FUNCTION_28_11();
        uint64_t result = sub_23785BA30();
        if (result != -1) {
          break;
        }
        if (!v5)
        {
          __break(1u);
          return result;
        }
        uint64_t v9 = *v8;
        uint64_t v10 = v8[1];
        *(_OWORD *)uint64_t v8 = *((_OWORD *)v8 - 1);
        *(v8 - 1) = v10;
        *(v8 - 2) = v9;
        v8 -= 2;
        ++v7;
      }
      while (v4 != v7);
      ++v4;
      v6 += 2;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_2378268E4(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  id v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_237804F18(a2, (uint64_t)(a3 - (void)a2) / 16, a4);
    uint64_t v12 = &v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_13;
    }
    sub_23778EF5C();
    uint64_t v19 = (char *)(a3 - 16);
    while (1)
    {
      uint64_t v20 = v19 + 16;
      char v21 = v6 - 16;
      if (sub_23785BA30() == -1)
      {
        BOOL v24 = v20 != v6 || v19 >= v6;
        v6 -= 16;
        if (!v24) {
          goto LABEL_33;
        }
      }
      else
      {
        BOOL v22 = v20 != v12 || v19 >= v12;
        char v21 = v12 - 16;
        v12 -= 16;
        if (!v22) {
          goto LABEL_33;
        }
      }
      *(_OWORD *)uint64_t v19 = *(_OWORD *)v21;
LABEL_33:
      v19 -= 16;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_13;
      }
    }
  }
  sub_237804F18(a1, (a2 - a1) / 16, a4);
  uint64_t v12 = &v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    sub_23778EF5C();
    while (1)
    {
      OUTLINED_FUNCTION_28_11();
      if (sub_23785BA30() == -1) {
        break;
      }
      uint64_t v16 = v4;
      BOOL v17 = v7 == v4;
      v4 += 16;
      if (!v17) {
        goto LABEL_16;
      }
LABEL_17:
      v7 += 16;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_7;
      }
    }
    uint64_t v16 = v6;
    BOOL v17 = v7 == v6;
    v6 += 16;
    if (v17) {
      goto LABEL_17;
    }
LABEL_16:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v16;
    goto LABEL_17;
  }
LABEL_7:
  id v6 = v7;
LABEL_13:
  sub_237804F18(v4, (v12 - v4) / 16, v6);
  return 1;
}

uint64_t sub_237826AD4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_237826AE4()
{
  return sub_237821948();
}

uint64_t sub_237826B08()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_237826B40()
{
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v2;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_2377A1F58;
  id v6 = (uint64_t (*)(void *, uint64_t (*)(void)))((char *)&dword_268928170 + dword_268928170);
  return v6(v3, v4);
}

uint64_t sub_237826BF4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237826BFC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_237826C38(uint8_t *a1, uint32_t a2, NSObject *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
}

uint64_t OUTLINED_FUNCTION_3_20()
{
  return sub_23785BE30();
}

uint64_t OUTLINED_FUNCTION_9_13()
{
  *(void *)(v1 + 104) = *(void *)(v2 + 8);
  *(void *)(v1 + 112) = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_14()
{
  return *(void *)(v0 + 88);
}

uint64_t OUTLINED_FUNCTION_19_11()
{
  return 0x64616F6C66666FLL;
}

uint64_t OUTLINED_FUNCTION_20_5()
{
  return 0x6C6C6174736E69;
}

uint64_t OUTLINED_FUNCTION_21_12()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_26_10()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_27_10()
{
  return 0x6C6174736E696E75;
}

uint64_t OUTLINED_FUNCTION_31_8()
{
  return 0x65736F6C63;
}

uint64_t OUTLINED_FUNCTION_37_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_38_6()
{
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for IntentDispatcherProvider()
{
  return self;
}

void *sub_237826EA8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928198);
  swift_allocObject();
  v1[2] = sub_237827604((uint64_t)&unk_268928190, v3, 120.0);
  return v1;
}

uint64_t sub_237826F5C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_237826FF0;
  return sub_2378270E8();
}

uint64_t sub_237826FF0()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  *(void *)(v1 + 32) = v0;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2378270C8, 0, 0);
}

uint64_t sub_2378270C8()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2378270E8()
{
  uint64_t v1 = sub_23785B4B0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2378271A4, 0, 0);
}

uint64_t sub_2378271A4()
{
  if (qword_268926828 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_268928D70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_23785B490();
  os_log_type_t v6 = sub_23785B8A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_237778000, v5, v6, "MarketplaceInfoDataProvider fetching distributors and caching...", v7, 2u);
    MEMORY[0x237E23210](v7, -1, -1);
  }
  uint64_t v9 = v0[3];
  uint64_t v8 = v0[4];
  uint64_t v10 = v0[2];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  uint64_t v11 = (void *)swift_task_alloc();
  v0[5] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_23782732C;
  return MEMORY[0x270EF59E0]();
}

uint64_t sub_23782732C()
{
  OUTLINED_FUNCTION_13();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_5();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_237827414()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_237827434, 0, 0);
}

uint64_t sub_237827434()
{
  OUTLINED_FUNCTION_13();
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_268928158 + dword_268928158);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2378274D8;
  return v3();
}

uint64_t sub_2378274D8()
{
  OUTLINED_FUNCTION_13();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_5();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_2378275A4()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for MarketplaceInfoProvider()
{
  return self;
}

uint64_t sub_237827604(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0BD78);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + 40) = 0;
  uint64_t v10 = v3 + *(void *)(*(void *)v3 + 112);
  uint64_t v11 = sub_2378593F0();
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  *(double *)(v3 + 16) = a3;
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  *(void *)(v3 + 40) = 0;
  swift_bridgeObjectRelease();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v11);
  uint64_t v12 = v3 + *(void *)(*(void *)v3 + 112);
  swift_beginAccess();
  sub_237826098((uint64_t)v9, v12);
  swift_endAccess();
  return v3;
}

uint64_t sub_23782773C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23782774C()
{
  OUTLINED_FUNCTION_13();
  uint64_t v2 = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2377A1F58;
  return sub_237826F5C(v2);
}

uint64_t sub_2378277E8(uint64_t a1)
{
  v1[17] = a1;
  uint64_t v2 = sub_23785B4B0();
  v1[18] = v2;
  v1[19] = *(void *)(v2 - 8);
  v1[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2378278A8, 0, 0);
}

uint64_t sub_2378278A8()
{
  BOOL v24 = v0;
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_268928BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_23785B490();
  os_log_type_t v6 = sub_23785B890();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[19];
  uint64_t v8 = v0[20];
  uint64_t v10 = v0[18];
  if (v7)
  {
    uint64_t v22 = v0[18];
    uint64_t v21 = v0[20];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v23 = v20;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v12 = swift_bridgeObjectRetain();
    uint64_t v13 = MEMORY[0x237E22360](v12, MEMORY[0x263F8D310]);
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    v0[16] = sub_2377C6A68(v13, v15, &v23);
    sub_23785B9E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_237778000, v5, v6, "Encoding routeIds: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237E23210](v20, -1, -1);
    MEMORY[0x237E23210](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v21, v22);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54798]), sel_init);
  v0[21] = v16;
  uint64_t v17 = sub_23785B780();
  v0[22] = v17;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_237827BE4;
  uint64_t v18 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_237827D44;
  v0[13] = &block_descriptor_1;
  v0[14] = v18;
  objc_msgSend(v16, sel_encodeHashedRouteUIDs_completion_, v17, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_237827BE4()
{
  return MEMORY[0x270FA2498](sub_237827CC4, 0, 0);
}

uint64_t sub_237827CC4()
{
  uint64_t v1 = *(void **)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 120);

  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_237827D44(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = sub_23785B7A0();
  return sub_237827D90(v1, v2);
}

uint64_t sub_237827D90(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

uint64_t type metadata accessor for MPCEncoder()
{
  return self;
}

uint64_t sub_237827DD4()
{
  type metadata accessor for OffloadedAppInstallerImpl();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  qword_268928D58 = v0;
  return result;
}

uint64_t sub_237827E10(uint64_t a1, uint64_t a2)
{
  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  uint64_t v4 = sub_23785B4B0();
  v3[20] = v4;
  v3[21] = *(void *)(v4 - 8);
  v3[22] = swift_task_alloc();
  v3[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_237827F18, v2, 0);
}

uint64_t sub_237827F18()
{
  uint64_t v1 = self;
  sub_237828748();
  swift_bridgeObjectRetain();
  id v2 = sub_237828658();
  *(void *)(v0 + 120) = 0;
  id v3 = objc_msgSend(v1, sel_existingCoordinatorForAppWithIdentity_error_, v2, v0 + 120);
  *(void *)(v0 + 192) = v3;

  uint64_t v4 = *(void **)(v0 + 120);
  if (!v3) {
    goto LABEL_10;
  }
  uint64_t v5 = qword_2689266D8;
  id v6 = v4;
  id v7 = v3;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v8 = *(void *)(v0 + 184);
  uint64_t v9 = *(void *)(v0 + 160);
  uint64_t v10 = *(void *)(v0 + 168);
  uint64_t v11 = __swift_project_value_buffer(v9, (uint64_t)qword_268928BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v11, v9);
  uint64_t v12 = sub_23785B490();
  os_log_type_t v13 = sub_23785B8A0();
  if (os_log_type_enabled(v12, v13))
  {
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v14 = 0;
    _os_log_impl(&dword_237778000, v12, v13, "OffloadedAppInstaller.prioritizeInstall existing coordinator found", v14, 2u);
    MEMORY[0x237E23210](v14, -1, -1);
  }
  uint64_t v15 = *(void *)(v0 + 184);
  uint64_t v16 = *(void *)(v0 + 160);
  uint64_t v17 = *(void *)(v0 + 168);

  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
  *(void *)(v0 + 128) = 0;
  unsigned int v18 = objc_msgSend(v7, sel_prioritizeWithError_, v0 + 128);

  uint64_t v4 = *(void **)(v0 + 128);
  if (v18)
  {
    id v19 = v4;

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
    return v20();
  }
  else
  {
LABEL_10:
    id v22 = v4;
    uint64_t v23 = (void *)sub_237859300();

    swift_willThrow();
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    id v36 = v1;
    uint64_t v25 = *(void *)(v0 + 168);
    uint64_t v24 = *(void *)(v0 + 176);
    uint64_t v26 = *(void *)(v0 + 160);
    uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)qword_268928BC8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v27, v26);
    unint64_t v28 = sub_23785B490();
    os_log_type_t v29 = sub_23785B8A0();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_237778000, v28, v29, "OffloadedAppInstaller.prioritizeInstall no existing coordinator found, creating a new request", v30, 2u);
      MEMORY[0x237E23210](v30, -1, -1);
    }
    uint64_t v31 = *(void *)(v0 + 168);
    uint64_t v32 = *(void *)(v0 + 176);
    uint64_t v33 = *(void *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v33);
    swift_bridgeObjectRetain();
    id v34 = sub_237828658();
    *(void *)(v0 + 200) = v34;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_2378283A4;
    uint64_t v35 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_2377AC68C;
    *(void *)(v0 + 104) = &block_descriptor_2;
    *(void *)(v0 + 112) = v35;
    objc_msgSend(v36, sel_prioritizeCoordinatorForAppWithIdentity_completion_, v34, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
}

uint64_t sub_2378283A4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 208) = v2;
  uint64_t v3 = *(void *)(v1 + 152);
  if (v2) {
    uint64_t v4 = sub_23782859C;
  }
  else {
    uint64_t v4 = sub_2378284F0;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2378284F0()
{
  uint64_t v1 = *(void *)(v0 + 192);

  if (v1) {
  swift_task_dealloc();
  }
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_23782859C()
{
  uint64_t v1 = *(void **)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 192);
  swift_willThrow();

  if (v2) {
  swift_task_dealloc();
  }
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

id sub_237828658()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithBundleID_, v1);

  return v2;
}

uint64_t sub_2378286CC()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for OffloadedAppInstallerImpl()
{
  return self;
}

uint64_t sub_237828720()
{
  return v0;
}

uint64_t sub_23782872C()
{
  return sub_237828720();
}

unint64_t sub_237828748()
{
  unint64_t result = qword_2689281B8;
  if (!qword_2689281B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2689281B8);
  }
  return result;
}

uint64_t sub_237828788()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v38 = v3;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v35 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926860);
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_5_0();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_237859340();
  OUTLINED_FUNCTION_1_2();
  uint64_t v15 = v14;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  id v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v35 - v20;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v39 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v23 = sub_237829EB4(0xD000000000000014, 0x8000000237867660, 0x7473696C70, 0xE500000000000000, v39);
  if (v23)
  {
    uint64_t v24 = v23;
    sub_237859320();

    uint64_t v36 = v15;
    uint64_t v25 = *(void (**)(uint64_t, char *, uint64_t))(v15 + 32);
    v25(v12, v19, v13);
    __swift_storeEnumTagSinglePayload(v12, 0, 1, v13);
    if (__swift_getEnumTagSinglePayload(v12, 1, v13) != 1)
    {
      v25((uint64_t)v21, (char *)v12, v13);
      uint64_t v31 = sub_237859350();
      unint64_t v33 = v32;
      sub_2378592F0();
      swift_allocObject();
      sub_2378592E0();
      sub_237829F48();
      sub_2378592D0();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v21, v13);
      swift_release();
      sub_237787078(v31, v33);

      *(_OWORD *)(v1 + 16) = v40;
      return v1;
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload(v12, 1, 1, v13);
  }
  sub_23777BA44(v12);
  if (qword_268926830 != -1) {
    swift_once();
  }
  uint64_t v26 = __swift_project_value_buffer(v2, (uint64_t)qword_268928D88);
  uint64_t v27 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v8, v26, v2);
  unint64_t v28 = sub_23785B490();
  os_log_type_t v29 = sub_23785B8B0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_237778000, v28, v29, "Quick action allow list not found", v30, 2u);
    MEMORY[0x237E23210](v30, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v2);
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  return v1;
}

uint64_t sub_237828DF0()
{
  if (*(void *)(v0 + 16))
  {
    uint64_t v1 = *(void **)(v0 + 24);
    swift_bridgeObjectRetain();
    sub_237859450();
    sub_23778EF5C();
    uint64_t v2 = sub_23785BA20();
    uint64_t v4 = v3;
    swift_bridgeObjectRelease();
    char v5 = sub_237820FBC(v2, v4, v1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_237828ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *(void *)(v3 + 16);
  if (!v4) {
    return 0;
  }
  for (uint64_t i = (void *)(v3 + 56); *(i - 1) != a1 || *i != a2; i += 4)
  {
    uint64_t v9 = *(i - 3);
    uint64_t v10 = *(i - 2);
    if (sub_23785BE30()) {
      break;
    }
    BOOL v11 = v9 == a1 && v10 == a2;
    if (v11 || (sub_23785BE30() & 1) != 0) {
      break;
    }
    if (!--v4) {
      return 0;
    }
  }
  return 1;
}

uint64_t sub_237828F80()
{
  sub_237829D60(*(void *)(v0 + 16));
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for QuickActionScopeProvider()
{
  return self;
}

uint64_t destroy for AllowList()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s20SiriAppLaunchIntents9AllowListVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AllowList(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for AllowList(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AllowList(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
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

uint64_t storeEnumTagSinglePayload for AllowList(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AllowList()
{
  return &type metadata for AllowList;
}

uint64_t sub_237829180(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x416465776F6C6C61 && a2 == 0xEB00000000737070;
  if (v2 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4C6465776F6C6C61 && a2 == 0xEE0073656C61636FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_23785BE30();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2378292AC(char a1)
{
  if (a1) {
    return 0x4C6465776F6C6C61;
  }
  else {
    return 0x416465776F6C6C61;
  }
}

uint64_t sub_2378292F8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689281F0);
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237829BA8();
  sub_23785BF20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689281D0);
  sub_237829C40(&qword_2689281F8, (void (*)(void))sub_237829CB0);
  OUTLINED_FUNCTION_1_14();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268926988);
    sub_237829CFC(&qword_268928208);
    OUTLINED_FUNCTION_1_14();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_237829490(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689281C0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_61();
  uint64_t v4 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  sub_237829BA8();
  sub_23785BF10();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689281D0);
    sub_237829C40(&qword_2689281D8, (void (*)(void))sub_237829BF4);
    OUTLINED_FUNCTION_3_21();
    sub_23785BD60();
    uint64_t v4 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268926988);
    sub_237829CFC(&qword_2689281E8);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_3_21();
    sub_23785BD60();
    uint64_t v6 = OUTLINED_FUNCTION_7_11();
    v7(v6);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_23782969C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4449656C646E7562 && a2 == 0xE800000000000000;
  if (v2 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D614E707061 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_23785BE30();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_23782978C(char a1)
{
  if (a1) {
    return 0x656D614E707061;
  }
  else {
    return 0x4449656C646E7562;
  }
}

uint64_t sub_2378297C4(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928240);
  OUTLINED_FUNCTION_1_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_61();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23782A0AC();
  sub_23785BF20();
  sub_23785BDA0();
  if (!v1) {
    sub_23785BDA0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t sub_237829900(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928230);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_5_0();
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23782A0AC();
  sub_23785BF10();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    uint64_t v4 = sub_23785BD30();
    swift_bridgeObjectRetain();
    sub_23785BD30();
    uint64_t v6 = OUTLINED_FUNCTION_13_0();
    v7(v6);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_237829AB8()
{
  return sub_2378292AC(*v0);
}

uint64_t sub_237829AC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_237829180(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237829AE8(uint64_t a1)
{
  unint64_t v2 = sub_237829BA8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_237829B24(uint64_t a1)
{
  unint64_t v2 = sub_237829BA8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_237829B60@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_237829490(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_237829B8C(void *a1)
{
  return sub_2378292F8(a1);
}

unint64_t sub_237829BA8()
{
  unint64_t result = qword_2689281C8;
  if (!qword_2689281C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689281C8);
  }
  return result;
}

unint64_t sub_237829BF4()
{
  unint64_t result = qword_2689281E0;
  if (!qword_2689281E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689281E0);
  }
  return result;
}

uint64_t sub_237829C40(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689281D0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_237829CB0()
{
  unint64_t result = qword_268928200;
  if (!qword_268928200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928200);
  }
  return result;
}

uint64_t sub_237829CFC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268926988);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_237829D60(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_237829DA0()
{
  return sub_237782D18();
}

uint64_t sub_237829DBC()
{
  return sub_23782978C(*v0);
}

uint64_t sub_237829DC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23782969C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237829DEC(uint64_t a1)
{
  unint64_t v2 = sub_23782A0AC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_237829E28(uint64_t a1)
{
  unint64_t v2 = sub_23782A0AC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_237829E64@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_237829900(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_237829E94(void *a1)
{
  return sub_2378297C4(a1);
}

id sub_237829EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

unint64_t sub_237829F48()
{
  unint64_t result = qword_268928210;
  if (!qword_268928210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928210);
  }
  return result;
}

ValueMetadata *type metadata accessor for AllowList.CodingKeys()
{
  return &type metadata for AllowList.CodingKeys;
}

ValueMetadata *type metadata accessor for AllowedApp()
{
  return &type metadata for AllowedApp;
}

unint64_t sub_237829FC0()
{
  unint64_t result = qword_268928218;
  if (!qword_268928218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928218);
  }
  return result;
}

unint64_t sub_23782A010()
{
  unint64_t result = qword_268928220;
  if (!qword_268928220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928220);
  }
  return result;
}

unint64_t sub_23782A060()
{
  unint64_t result = qword_268928228;
  if (!qword_268928228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928228);
  }
  return result;
}

unint64_t sub_23782A0AC()
{
  unint64_t result = qword_268928238;
  if (!qword_268928238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928238);
  }
  return result;
}

unsigned char *_s20SiriAppLaunchIntents9AllowListV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23782A1C4);
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

ValueMetadata *type metadata accessor for AllowedApp.CodingKeys()
{
  return &type metadata for AllowedApp.CodingKeys;
}

unint64_t sub_23782A200()
{
  unint64_t result = qword_268928248;
  if (!qword_268928248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928248);
  }
  return result;
}

unint64_t sub_23782A250()
{
  unint64_t result = qword_268928250;
  if (!qword_268928250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928250);
  }
  return result;
}

unint64_t sub_23782A2A0()
{
  unint64_t result = qword_268928258;
  if (!qword_268928258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928258);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_14()
{
  return sub_23785BDD0();
}

uint64_t OUTLINED_FUNCTION_3_21()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_11()
{
  return v0;
}

uint64_t sub_23782A370()
{
  return sub_23785B240();
}

uint64_t destroy for ReferenceResolver(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

ValueMetadata *type metadata accessor for ReferenceResolver()
{
  return &type metadata for ReferenceResolver;
}

uint64_t sub_23782A3BC()
{
  uint64_t v166 = sub_23785B4D0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v155 = v1;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_36_0();
  uint64_t v165 = v3;
  MEMORY[0x270FA5388](v4);
  uint64_t v167 = (char *)v138 - v5;
  OUTLINED_FUNCTION_26_1();
  uint64_t v153 = sub_23785B5A0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v154 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_4();
  uint64_t v152 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928260);
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_1_4();
  uint64_t v147 = v10;
  OUTLINED_FUNCTION_26_1();
  sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v163 = v12;
  unint64_t v164 = v11;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_36_0();
  uint64_t v159 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_26_4();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_26_4();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_26_4();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v17);
  uint64_t v150 = (char *)v138 - v18;
  OUTLINED_FUNCTION_26_1();
  uint64_t v161 = sub_23785B4F0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v156 = v19;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_26_4();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_26_4();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v23);
  uint64_t v158 = (void (*)(void))((char *)v138 - v24);
  OUTLINED_FUNCTION_26_1();
  uint64_t v25 = sub_23785B5B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v160 = v26;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_36_0();
  uint64_t v157 = v28;
  MEMORY[0x270FA5388](v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928268);
  OUTLINED_FUNCTION_22_1();
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  unint64_t v33 = (void **)((char *)v138 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)v138 - v34;
  uint64_t v36 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  sub_23785B510();
  swift_allocObject();
  swift_retain();
  sub_23785B500();
  (*(void (**)(void))(v36 + 8))();
  swift_release();
  uint64_t v162 = v35;
  sub_23779D33C((uint64_t)v35, (uint64_t)v33, &qword_268928268);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v37 = *v33;
    if (qword_2689266D8 != -1) {
      goto LABEL_57;
    }
    goto LABEL_3;
  }
  uint64_t v50 = v160;
  OUTLINED_FUNCTION_38_0();
  v51();
  BOOL v52 = v157;
  OUTLINED_FUNCTION_8_0();
  v53();
  int v54 = (*(uint64_t (**)(uint64_t *, uint64_t))(v50 + 88))(v52, v25);
  uint64_t v55 = v25;
  if (v54 == *MEMORY[0x263F742B8])
  {
    uint64_t v56 = OUTLINED_FUNCTION_23_12();
    uint64_t v144 = v25;
    v57(v56, v25);
    uint64_t v58 = v158;
    uint64_t v59 = v161;
    OUTLINED_FUNCTION_38_0();
    v60();
    uint64_t v61 = v163;
    uint64_t v62 = v164;
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer((uint64_t)v62, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_6_18();
    uint64_t v63 = v150;
    OUTLINED_FUNCTION_8_0();
    v64();
    OUTLINED_FUNCTION_8_0();
    v65();
    uint64_t v66 = sub_23785B490();
    os_log_type_t v67 = sub_23785B8D0();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = OUTLINED_FUNCTION_48_0();
      uint64_t v170 = OUTLINED_FUNCTION_36_2();
      *(_DWORD *)uint64_t v68 = 136315138;
      uint64_t v58 = (void (*)(void))(v68 + 12);
      sub_23782BE94(&qword_268928278, MEMORY[0x263F74140]);
      uint64_t v69 = sub_23785BE00();
      uint64_t v169 = sub_2377C6A68(v69, v70, &v170);
      sub_23785B9E0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_15_11();
      OUTLINED_FUNCTION_16_10();
      ((void (*)(void))(v68 + 12))();
      _os_log_impl(&dword_237778000, v66, v67, "ReferenceResolver.resolve() got singular match %s", (uint8_t *)v68, 0xCu);
      swift_arrayDestroy();
      uint64_t v71 = v144;
      uint64_t v72 = v160;
      uint64_t v59 = v161;
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      OUTLINED_FUNCTION_5_2();
      v73();
    }
    else
    {
      OUTLINED_FUNCTION_15_11();
      OUTLINED_FUNCTION_16_10();
      v58();

      (*(void (**)(char *, void *))(v61 + 8))(v63, v62);
      uint64_t v71 = v144;
      uint64_t v72 = v160;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268927D10);
    OUTLINED_FUNCTION_11_11();
    uint64_t v74 = swift_allocObject();
    *(_OWORD *)(v74 + 16) = xmmword_23785CD50;
    uint64_t v89 = v158;
    sub_23785B4E0();
    ((void (*)(void (*)(void), uint64_t))v58)(v89, v59);
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v159, v71);
    sub_237799238((uint64_t)v162, &qword_268928268);
  }
  else
  {
    uint64_t v75 = v163;
    uint64_t v76 = v164;
    if (v54 == *MEMORY[0x263F742C8])
    {
      uint64_t v77 = OUTLINED_FUNCTION_23_12();
      v78(v77, v25);
      uint64_t v171 = *v52;
      if (qword_2689266D8 != -1) {
        swift_once();
      }
      __swift_project_value_buffer((uint64_t)v76, (uint64_t)qword_268928BC8);
      OUTLINED_FUNCTION_6_18();
      uint64_t v79 = v148;
      OUTLINED_FUNCTION_8_0();
      v80();
      unint64_t v81 = sub_23785B490();
      os_log_type_t v82 = sub_23785B8D0();
      if (os_log_type_enabled(v81, v82))
      {
        uint64_t v83 = (uint8_t *)OUTLINED_FUNCTION_48_0();
        uint64_t v170 = OUTLINED_FUNCTION_36_2();
        *(_DWORD *)uint64_t v83 = 136315138;
        uint64_t v158 = (void (*)(void))(v83 + 4);
        swift_beginAccess();
        uint64_t v84 = swift_bridgeObjectRetain();
        uint64_t v85 = MEMORY[0x237E22360](v84, v161);
        unint64_t v87 = v86;
        swift_bridgeObjectRelease();
        uint64_t v168 = sub_2377C6A68(v85, v87, &v170);
        sub_23785B9E0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237778000, v81, v82, "ReferenceResolver.resolve() returns needs Disambiguation and we are going to return the first notification result%s", v83, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5_3();
        OUTLINED_FUNCTION_5_3();

        OUTLINED_FUNCTION_5_2();
        v88();
      }
      else
      {

        (*(void (**)(uint64_t, void *))(v75 + 8))(v79, v76);
      }
      uint64_t v98 = v156;
      uint64_t v99 = v151;
      uint64_t v144 = v55;
      swift_beginAccess();
      uint64_t v100 = *(char **)(v171 + 16);
      unsigned __int8 v101 = v167;
      if (v100)
      {
        uint64_t v150 = *(char **)(v98 + 16);
        uint64_t v149 = v171 + ((*(unsigned __int8 *)(v98 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80));
        uint64_t v148 = v154 + 8;
        unsigned int v146 = *MEMORY[0x263F74240];
        unsigned int v145 = *MEMORY[0x263F74100];
        os_signpost_id_t v143 = (void (**)(char *, void, uint64_t))(v155 + 104);
        uint64_t v163 = v155 + 16;
        uint64_t v102 = (void *)(v155 + 8);
        uint64_t v141 = v98 + 8;
        uint64_t v142 = *(void *)(v98 + 72);
        v138[1] = v171;
        swift_bridgeObjectRetain_n();
        unint64_t v164 = v102;
        unint64_t v103 = (unint64_t)v102;
        os_log_type_t v104 = 0;
        uint64_t v140 = v103 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        uint64_t v105 = v161;
        uint64_t v106 = v166;
        uint64_t v139 = v100;
        v138[2] = v98 + 16;
        while (1)
        {
          uint64_t v158 = v104;
          ((void (*)(uint64_t, uint64_t, uint64_t))v150)(v99, v149 + v142 * (void)v104, v105);
          sub_23785B4E0();
          uint64_t v107 = sub_23785B590();
          OUTLINED_FUNCTION_5_2();
          v108();
          sub_23785B540();
          OUTLINED_FUNCTION_22_1();
          (*(void (**)(char *, void))(v109 + 104))(v101, v146);
          (*v143)(v101, v145, v106);
          uint64_t v37 = *(void **)(v107 + 16);
          uint64_t v110 = v106;
          if (v37)
          {
            uint64_t v111 = v155;
            unint64_t v112 = (*(unsigned __int8 *)(v155 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v155 + 80);
            id v113 = *(void (**)(void))(v155 + 16);
            OUTLINED_FUNCTION_8_0();
            v113();
            sub_23782BE94(&qword_268928270, MEMORY[0x263F74118]);
            uint64_t v157 = (uint64_t *)v107;
            swift_bridgeObjectRetain();
            char v114 = sub_23785B690();
            uint64_t v115 = *(void (**)(void))(v111 + 8);
            OUTLINED_FUNCTION_9_14();
            v115();
            if (v114)
            {
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_18_10();
LABEL_50:
              OUTLINED_FUNCTION_9_14();
              v115();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v123 = v147;
              OUTLINED_FUNCTION_38_0();
              v131();
              uint64_t v122 = 0;
              goto LABEL_52;
            }
            if (v37 != (void *)1)
            {
              uint64_t v116 = *(void *)(v155 + 72);
              unint64_t v117 = (unint64_t)v157 + v116 + v112;
              uint64_t v118 = 1;
              while (1)
              {
                OUTLINED_FUNCTION_8_0();
                v113();
                uint64_t v119 = (void *)(v118 + 1);
                if (__OFADD__(v118, 1)) {
                  break;
                }
                char v120 = sub_23785B690();
                OUTLINED_FUNCTION_9_14();
                v115();
                if (v120)
                {
                  swift_bridgeObjectRelease();
                  uint64_t v105 = v161;
                  OUTLINED_FUNCTION_18_10();
                  goto LABEL_50;
                }
                ++v118;
                v117 += v116;
                uint64_t v110 = v166;
                if (v119 == v37)
                {
                  swift_bridgeObjectRelease();
                  uint64_t v105 = v161;
                  goto LABEL_41;
                }
              }
              __break(1u);
LABEL_57:
              swift_once();
LABEL_3:
              uint64_t v38 = v164;
              __swift_project_value_buffer((uint64_t)v164, (uint64_t)qword_268928BC8);
              uint64_t v39 = v163;
              uint64_t v40 = v159;
              OUTLINED_FUNCTION_8_0();
              v41();
              id v42 = v37;
              id v43 = v37;
              uint64_t v44 = sub_23785B490();
              os_log_type_t v45 = sub_23785B8B0();
              if (os_log_type_enabled(v44, v45))
              {
                uint64_t v46 = (uint8_t *)OUTLINED_FUNCTION_48_0();
                uint64_t v170 = OUTLINED_FUNCTION_36_2();
                *(_DWORD *)uint64_t v46 = 136315138;
                uint64_t v169 = (uint64_t)v37;
                id v47 = v37;
                __swift_instantiateConcreteTypeFromMangledName(&qword_268926CE0);
                uint64_t v48 = sub_23785B6D0();
                uint64_t v169 = sub_2377C6A68(v48, v49, &v170);
                sub_23785B9E0();
                swift_bridgeObjectRelease();

                _os_log_impl(&dword_237778000, v44, v45, "ReferenceResolver.resolve() from RRaSS was unsuccessful with %s", v46, 0xCu);
                swift_arrayDestroy();
                OUTLINED_FUNCTION_5_3();
                OUTLINED_FUNCTION_5_3();

                (*(void (**)(uint64_t, void *))(v39 + 8))(v159, v164);
              }
              else
              {

                (*(void (**)(uint64_t, void *))(v39 + 8))(v40, v38);
              }

LABEL_12:
              sub_237799238((uint64_t)v162, &qword_268928268);
              return MEMORY[0x263F8EE78];
            }
            swift_bridgeObjectRelease();
            uint64_t v110 = v166;
LABEL_41:
            unsigned __int8 v101 = v167;
            uint64_t v99 = v151;
            uint64_t v100 = v139;
          }
          else
          {
            uint64_t v115 = (void (*)(void))*v164;
          }
          os_log_type_t v104 = (void (*)(void))((char *)v158 + 1);
          ((void (*)(char *, uint64_t))v115)(v101, v110);
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_5_2();
          v121();
          uint64_t v106 = v110;
          if ((char *)v104 == v100)
          {
            swift_bridgeObjectRelease();
            uint64_t v122 = 1;
            uint64_t v123 = v147;
            goto LABEL_52;
          }
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v122 = 1;
      uint64_t v105 = v161;
      uint64_t v123 = v147;
LABEL_52:
      __swift_storeEnumTagSinglePayload(v123, v122, 1, v105);
      swift_bridgeObjectRelease();
      if (__swift_getEnumTagSinglePayload(v123, 1, v105) == 1)
      {
        sub_237799238(v123, &qword_268928260);
        uint64_t v132 = OUTLINED_FUNCTION_7_12();
        v133(v132);
        sub_237799238((uint64_t)v162, &qword_268928268);
        swift_bridgeObjectRelease();
        return MEMORY[0x263F8EE78];
      }
      OUTLINED_FUNCTION_38_0();
      v134();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268927D10);
      OUTLINED_FUNCTION_11_11();
      uint64_t v74 = swift_allocObject();
      *(_OWORD *)(v74 + 16) = xmmword_23785CD50;
      sub_23785B4E0();
      OUTLINED_FUNCTION_16_10();
      v135();
      uint64_t v136 = OUTLINED_FUNCTION_7_12();
      v137(v136);
      sub_237799238((uint64_t)v162, &qword_268928268);
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v54 == *MEMORY[0x263F742D8])
      {
        if (qword_2689266D8 != -1) {
          swift_once();
        }
        __swift_project_value_buffer((uint64_t)v76, (uint64_t)qword_268928BC8);
        OUTLINED_FUNCTION_6_18();
        OUTLINED_FUNCTION_8_0();
        v91();
        uint64_t v92 = sub_23785B490();
        os_log_type_t v93 = sub_23785B890();
        if (os_log_type_enabled(v92, v93))
        {
          uint64_t v94 = (uint8_t *)OUTLINED_FUNCTION_4_4();
          *(_WORD *)uint64_t v94 = 0;
          _os_log_impl(&dword_237778000, v92, v93, "ReferenceResolver.resolve() No match from ReferenceResolution", v94, 2u);
          OUTLINED_FUNCTION_5_3();
        }

        uint64_t v95 = OUTLINED_FUNCTION_12_12();
        v96(v95);
        OUTLINED_FUNCTION_8_13();
        v97();
        goto LABEL_12;
      }
      if (qword_2689266D8 != -1) {
        swift_once();
      }
      __swift_project_value_buffer((uint64_t)v76, (uint64_t)qword_268928BC8);
      OUTLINED_FUNCTION_6_18();
      OUTLINED_FUNCTION_8_0();
      v124();
      uint64_t v125 = sub_23785B490();
      os_log_type_t v126 = sub_23785B890();
      if (os_log_type_enabled(v125, v126))
      {
        uint64_t v127 = (uint8_t *)OUTLINED_FUNCTION_4_4();
        *(_WORD *)uint64_t v127 = 0;
        _os_log_impl(&dword_237778000, v125, v126, "ReferenceResolver.resolve() Unknown outcome. Returning no match", v127, 2u);
        OUTLINED_FUNCTION_5_3();
      }

      uint64_t v128 = OUTLINED_FUNCTION_12_12();
      v129(v128);
      uint64_t v130 = *(void (**)(void))(v50 + 8);
      OUTLINED_FUNCTION_8_13();
      v130();
      sub_237799238((uint64_t)v162, &qword_268928268);
      OUTLINED_FUNCTION_8_13();
      v130();
      return MEMORY[0x263F8EE78];
    }
  }
  return v74;
}

uint64_t sub_23782B620()
{
  uint64_t v1 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23785AC70();
  if (v24[3])
  {
    sub_23779D33C((uint64_t)v24, (uint64_t)v23, &qword_268926DF8);
    sub_23785ABD0();
    if (swift_dynamicCast())
    {
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      char v7 = 1;
      goto LABEL_6;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }
  char v7 = 0;
LABEL_6:
  sub_237799238((uint64_t)v24, &qword_268926DF8);
  uint64_t v8 = sub_23782A3BC();
  MEMORY[0x270FA5388](v8);
  v22[-2] = v0;
  LOBYTE(v22[-1]) = v7;
  uint64_t v9 = sub_2377F4950((void (*)(uint64_t *__return_ptr, uint64_t))sub_23782BEDC, (uint64_t)&v22[-4], v8);
  swift_bridgeObjectRelease();
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_268928BC8);
  OUTLINED_FUNCTION_8_0();
  v10();
  swift_bridgeObjectRetain_n();
  BOOL v11 = sub_23785B490();
  os_log_type_t v12 = sub_23785B890();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)OUTLINED_FUNCTION_48_0();
    uint64_t v14 = OUTLINED_FUNCTION_36_2();
    v22[2] = v1;
    v24[0] = v14;
    v22[1] = v6;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v15 = type metadata accessor for Application();
    uint64_t v16 = swift_bridgeObjectRetain();
    uint64_t v17 = MEMORY[0x237E22360](v16, v15);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    v23[0] = sub_2377C6A68(v17, v19, v24);
    sub_23785B9E0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237778000, v11, v12, "ReferenceResolver.resolve() resolved apps: %s", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();

    OUTLINED_FUNCTION_16_10();
    v20();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
  }
  return v9;
}

id sub_23782B96C(uint64_t a1, char a2)
{
  uint64_t v3 = sub_23785B550();
  uint64_t v5 = v4;
  type metadata accessor for Application();
  id v6 = sub_23780A53C();
  sub_237814CB8(v3, v5, v6);
  if (a2)
  {
    uint64_t v7 = sub_23785B570();
    uint64_t v9 = v8;
    if (sub_23785B740())
    {
      uint64_t v10 = sub_23782BDD4(6);
      uint64_t v7 = MEMORY[0x237E222A0](v10);
      uint64_t v9 = v11;
      swift_bridgeObjectRelease();
    }
    sub_23782BF20(v7, v9, v6);
  }
  return v6;
}

unint64_t sub_23782BA44()
{
  uint64_t v0 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v25 - v7;
  sub_23785ADD0();
  swift_allocObject();
  sub_23785ADC0();
  uint64_t v9 = MEMORY[0x237E217D0]();
  swift_release();
  if (v9)
  {
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v0, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_8_0();
    v10();
    uint64_t v11 = sub_23785B490();
    os_log_type_t v12 = sub_23785B8A0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)OUTLINED_FUNCTION_4_4();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_237778000, v11, v12, "ReferenceResolver.resolveAppsForNoEntity() trying common_Window query", v13, 2u);
      OUTLINED_FUNCTION_5_3();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v0);
    unint64_t v14 = sub_23782B620();
    unint64_t v15 = v14;
    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_23785BCC0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_release();
    if (v16) {
      return v15;
    }
    swift_bridgeObjectRelease();
  }
  sub_23785AD20();
  swift_allocObject();
  sub_23785AD10();
  uint64_t v17 = MEMORY[0x237E217D0]();
  swift_release();
  if (!v17) {
    return MEMORY[0x263F8EE78];
  }
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0, (uint64_t)qword_268928BC8);
  OUTLINED_FUNCTION_8_0();
  v18();
  unint64_t v19 = sub_23785B490();
  os_log_type_t v20 = sub_23785B8A0();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)OUTLINED_FUNCTION_4_4();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_237778000, v19, v20, "ReferenceResolver.resolveAppsForNoEntity() trying common_App query", v21, 2u);
    OUTLINED_FUNCTION_5_3();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v0);
  unint64_t v22 = sub_23782B620();
  unint64_t v15 = v22;
  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_23785BCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_release();
  if (!v23)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v15;
}

uint64_t sub_23782BDD4(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_23785B710();
    uint64_t v1 = sub_23785B760();
    swift_bridgeObjectRelease();
    return v1;
  }
  return result;
}

uint64_t sub_23782BE94(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_23782BEDC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id result = sub_23782B96C(a1, *(unsigned char *)(v2 + 24));
  *a2 = result;
  return result;
}

void sub_23782BF20(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_23785B6A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setSceneId_, v4);
}

uint64_t OUTLINED_FUNCTION_7_12()
{
  return *(void *)(v0 - 224);
}

uint64_t OUTLINED_FUNCTION_12_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_12()
{
  *(void *)(v2 - 224) = v0;
  return v1;
}

uint64_t sub_23782C03C(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3;
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v16 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = v4 & 0xC000000000000001;
      unint64_t v15 = v4;
      while (v17)
      {
        id v9 = (id)MEMORY[0x237E22750](v8, v4);
LABEL_7:
        uint64_t v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        id v18 = v9;
        uint64_t v12 = a2;
        char v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if (v13)
        {
          sub_23785BBF0();
          sub_23785BC20();
          unint64_t v4 = v15;
          sub_23785BC30();
          sub_23785BC00();
        }
        else
        {
        }
        ++v8;
        if (v11 == v7)
        {
          uint64_t v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = sub_23785BCC0();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_7;
  }
LABEL_19:
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_23782C1E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_237859460();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237781F08(a1, a2);
  sub_237859440();
  __swift_destroy_boxed_opaque_existential_1(a1);
  uint64_t v8 = type metadata accessor for RegexAppsResolver();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2 + *(int *)(v8 + 20), v7, v4);
}

uint64_t RegexAppsResolver.init(languageCode:)@<X0>(uint64_t a1@<X8>)
{
  if (qword_26AF0BC80 != -1) {
    swift_once();
  }
  uint64_t v2 = static InstalledAppProvider.shared;
  v4[3] = type metadata accessor for InstalledAppProvider();
  v4[4] = &protocol witness table for InstalledAppProvider;
  v4[0] = v2;
  swift_retain();
  return sub_23782C1E8((uint64_t)v4, a1);
}

uint64_t RegexAppsResolver.resolve(appName:appId:)(uint64_t a1, uint64_t a2)
{
  v3[23] = a2;
  v3[24] = v2;
  v3[22] = a1;
  uint64_t v4 = sub_23785B4B0();
  v3[25] = v4;
  v3[26] = *(void *)(v4 - 8);
  v3[27] = swift_task_alloc();
  v3[28] = swift_task_alloc();
  v3[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928288);
  v3[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23782C4C4, 0, 0);
}

uint64_t sub_23782C4C4()
{
  uint64_t v52 = v0;
  uint64_t v1 = *(void *)(v0 + 184);
  if (v1)
  {
    *(void *)(v0 + 16) = *(void *)(v0 + 176);
    uint64_t v2 = *(void *)(v0 + 240);
    uint64_t v3 = *(void *)(v0 + 192);
    *(void *)(v0 + 24) = v1;
    uint64_t v4 = v3 + *(int *)(type metadata accessor for RegexAppsResolver() + 20);
    uint64_t v5 = sub_237859460();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v2, v4, v5);
    __swift_storeEnumTagSinglePayload(v2, 0, 1, v5);
    sub_23778EF5C();
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_23785BA00();
    unint64_t v8 = v7;
    *(void *)(v0 + 248) = v6;
    *(void *)(v0 + 256) = v7;
    sub_23782D870(v2);
    swift_bridgeObjectRelease();
    uint64_t v9 = HIBYTE(v8) & 0xF;
    if ((v8 & 0x2000000000000000) == 0) {
      uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
    }
    if (v9)
    {
      *(void *)(v0 + 32) = v6;
      *(void *)(v0 + 40) = v8;
      strcpy((char *)(v0 + 48), "[^[:alnum:]]+");
      *(_WORD *)(v0 + 62) = -4864;
      strcpy((char *)(v0 + 64), "[^[:alnum:]]+");
      *(_WORD *)(v0 + 78) = -4864;
      OUTLINED_FUNCTION_1_15();
      uint64_t v47 = sub_23785BA20();
      unint64_t v50 = v10;
      *(void *)(v0 + 80) = v6;
      *(void *)(v0 + 88) = v8;
      *(void *)(v0 + 96) = 0x756E6C613A5B5E5BLL;
      *(void *)(v0 + 104) = 0xEF2B5D735C5D3A6DLL;
      strcpy((char *)(v0 + 112), "[^[:alnum:]]+");
      *(_WORD *)(v0 + 126) = -4864;
      OUTLINED_FUNCTION_1_15();
      uint64_t v44 = sub_23785BA20();
      unint64_t v12 = v11;
      if (qword_268926830 != -1) {
        swift_once();
      }
      uint64_t v13 = *(void *)(v0 + 232);
      uint64_t v14 = *(void *)(v0 + 208);
      uint64_t v15 = __swift_project_value_buffer(*(void *)(v0 + 200), (uint64_t)qword_268928D88);
      *(void *)(v0 + 264) = v15;
      uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
      *(void *)(v0 + 272) = v16;
      *(void *)(v0 + 280) = (v14 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      uint64_t v46 = v15;
      os_log_type_t v45 = v16;
      ((void (*)(uint64_t))v16)(v13);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      unint64_t v17 = sub_23785B490();
      os_log_type_t type = sub_23785B8A0();
      BOOL v18 = os_log_type_enabled(v17, type);
      uint64_t v19 = *(void *)(v0 + 232);
      uint64_t v20 = *(void *)(v0 + 208);
      uint64_t v43 = *(void *)(v0 + 200);
      if (v18)
      {
        uint64_t v21 = swift_slowAlloc();
        v51[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v21 = 136315650;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 152) = sub_2377C6A68(v6, v8, v51);
        sub_23785B9E0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v21 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 160) = sub_2377C6A68(v47, v50, v51);
        sub_23785B9E0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v21 + 22) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 168) = sub_2377C6A68(v44, v12, v51);
        sub_23785B9E0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_237778000, v17, type, "Attempting to match by AppName '%s' -> %s || %s", (uint8_t *)v21, 0x20u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5_3();
        OUTLINED_FUNCTION_5_3();

        unint64_t v22 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
        v22(v19, v43);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

        unint64_t v22 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
        v22(v19, v43);
      }
      *(void *)(v0 + 288) = v22;
      uint64_t v26 = *(void *)(v0 + 224);
      uint64_t v27 = *(void *)(v0 + 200);
      strcpy((char *)v51, "^[^[:alnum:]]*");
      HIBYTE(v51[1]) = -18;
      sub_23785B720();
      swift_bridgeObjectRetain();
      sub_23785B720();
      swift_bridgeObjectRelease();
      unint64_t v28 = v51[1];
      uint64_t v48 = v51[0];
      *(void *)(v0 + 296) = v51[0];
      *(void *)(v0 + 304) = v28;
      strcpy((char *)v51, "^[^:alnum:]*");
      BYTE5(v51[1]) = 0;
      HIWORD(v51[1]) = -5120;
      sub_23785B720();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_23785B720();
      swift_bridgeObjectRelease();
      uint64_t v29 = v51[1];
      *(void *)(v0 + 312) = v51[0];
      *(void *)(v0 + 320) = v29;
      v51[0] = 25180;
      v51[1] = 0xE200000000000000;
      sub_23785B720();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_23785B720();
      swift_bridgeObjectRelease();
      uint64_t v31 = v51[0];
      unint64_t v30 = v51[1];
      *(void *)(v0 + 328) = v51[0];
      *(void *)(v0 + 336) = v30;
      v45(v26, v46, v27);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v32 = sub_23785B490();
      os_log_type_t v33 = sub_23785B8A0();
      BOOL v34 = os_log_type_enabled(v32, v33);
      uint64_t v35 = *(void *)(v0 + 224);
      uint64_t v36 = *(void *)(v0 + 200);
      if (v34)
      {
        uint64_t v37 = swift_slowAlloc();
        v51[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 136) = sub_2377C6A68(v48, v28, v51);
        sub_23785B9E0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v37 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 144) = sub_2377C6A68(v31, v30, v51);
        sub_23785B9E0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_237778000, v32, v33, "Regexes built: %s\n%s", (uint8_t *)v37, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5_3();
        OUTLINED_FUNCTION_5_3();
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }

      v22(v35, v36);
      uint64_t v38 = *(void **)(v0 + 192);
      uint64_t v39 = v38[3];
      uint64_t v40 = v38[4];
      __swift_project_boxed_opaque_existential_1(v38, v39);
      unint64_t v49 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v40 + 8) + **(int **)(v40 + 8));
      uint64_t v41 = (void *)swift_task_alloc();
      *(void *)(v0 + 344) = v41;
      *uint64_t v41 = v0;
      v41[1] = sub_23782CDA8;
      return v49(v39, v40);
    }
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v24 = MEMORY[0x263F8EE78];
  return v23(v24);
}

uint64_t sub_23782CDA8()
{
  OUTLINED_FUNCTION_0_2();
  *(void *)(v1 + 352) = v0;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23782CE84, 0, 0);
}

uint64_t sub_23782CE84()
{
  unint64_t v1 = *(void *)(v0 + 352);
  uint64_t v3 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v5 = (void *)swift_task_alloc();
  v5[2] = v4;
  v5[3] = v3;
  v5[4] = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_23782C03C((uint64_t (*)(id *))sub_23782D8D0, (uint64_t)v5, v1);
  swift_task_dealloc();
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_23785BCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v8 = *(void *)(v0 + 352);
  uint64_t v9 = *(void *)(v0 + 336);
  if (v7 == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 320);
    uint64_t v11 = *(void *)(v0 + 304);
    uint64_t v23 = *(void *)(v0 + 312);
    uint64_t v24 = *(void *)(v0 + 328);
    uint64_t v12 = *(void *)(v0 + 296);
    unint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
    uint64_t v13 = *(void *)(v0 + 256);
    uint64_t v22 = *(void *)(v0 + 248);
    uint64_t v25 = *(void *)(v0 + 216);
    uint64_t v14 = *(void *)(v0 + 192);
    uint64_t v26 = *(void *)(v0 + 200);
    uint64_t v27 = *(void *)(v0 + 264);
    swift_bridgeObjectRelease();
    uint64_t v15 = (void *)swift_task_alloc();
    v15[2] = v14;
    v15[3] = v12;
    v15[4] = v11;
    v15[5] = v23;
    v15[6] = v10;
    v15[7] = v24;
    v15[8] = v9;
    v15[9] = v22;
    v15[10] = v13;
    unint64_t v6 = sub_23782C03C(sub_23782D8F4, (uint64_t)v15, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    v28(v25, v27, v26);
    swift_bridgeObjectRetain_n();
    uint64_t v16 = sub_23785B490();
    uint64_t v17 = sub_23785B8A0();
    if (os_log_type_enabled(v16, (os_log_type_t)v17))
    {
      BOOL v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)BOOL v18 = 134217984;
      if (v6 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v19 = sub_23785BCC0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v19 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      *(void *)(v0 + 128) = v19;
      sub_23785B9E0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237778000, v16, (os_log_type_t)v17, "Found %ld apps by name matching", v18, 0xCu);
      OUTLINED_FUNCTION_5_3();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(void, void))(v0 + 288))(*(void *)(v0 + 216), *(void *)(v0 + 200));
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(unint64_t))(v0 + 8);
  return v20(v6);
}

BOOL sub_23782D1E4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928288);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_23778BEDC(*a1);
  if (!v12) {
    return 0;
  }
  uint64_t v21 = v11;
  uint64_t v22 = v12;
  uint64_t v13 = a2 + *(int *)(type metadata accessor for RegexAppsResolver() + 20);
  uint64_t v14 = sub_237859460();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v10, v13, v14);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v14);
  sub_23778EF5C();
  uint64_t v15 = sub_23785BA00();
  uint64_t v17 = v16;
  sub_23782D870((uint64_t)v10);
  swift_bridgeObjectRelease();
  uint64_t v21 = v15;
  uint64_t v22 = v17;
  v20[0] = a3;
  v20[1] = a4;
  uint64_t v18 = sub_23785BA10();
  swift_bridgeObjectRelease();
  return v18 == 0;
}

uint64_t sub_23782D370(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v37 = a7;
  uint64_t v39 = a5;
  uint64_t v40 = a6;
  uint64_t v45 = a4;
  uint64_t v15 = type metadata accessor for RegexAppsResolver();
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v35 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928288);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v35 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_23778BEDC(*a1);
  if (v25)
  {
    uint64_t v36 = a8;
    uint64_t v38 = v10;
    uint64_t v43 = v24;
    uint64_t v44 = v25;
    uint64_t v26 = a2 + *(int *)(v15 + 20);
    uint64_t v27 = sub_237859460();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v23, v26, v27);
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v27);
    sub_23778EF5C();
    uint64_t v28 = sub_23785BA00();
    uint64_t v30 = v29;
    sub_23782D870((uint64_t)v23);
    swift_bridgeObjectRelease();
    LOBYTE(v27) = sub_23782D630(v28, v30, a3, v45);
    sub_23782DEB8(a2, (uint64_t)v20);
    if (v27)
    {
      sub_23782DF1C((uint64_t)v20);
      sub_23782DEB8(a2, (uint64_t)v18);
    }
    else
    {
      BOOL v32 = sub_23782D630(v28, v30, v39, v40);
      sub_23782DF1C((uint64_t)v20);
      sub_23782DEB8(a2, (uint64_t)v18);
      if (!v32)
      {
        BOOL v34 = sub_23782D630(v28, v30, v37, v36);
        sub_23782DF1C((uint64_t)v18);
        if (!v34)
        {
          uint64_t v43 = v28;
          uint64_t v44 = v30;
          uint64_t v41 = a9;
          uint64_t v42 = a10;
          char v31 = sub_23785BA80();
          swift_bridgeObjectRelease();
          return v31 & 1;
        }
        goto LABEL_7;
      }
    }
    sub_23782DF1C((uint64_t)v18);
LABEL_7:
    swift_bridgeObjectRelease();
    char v31 = 1;
    return v31 & 1;
  }
  char v31 = 0;
  return v31 & 1;
}

BOOL sub_23782D630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928288);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[2] = a1;
  v15[3] = a2;
  v15[0] = a3;
  v15[1] = a4;
  uint64_t v11 = sub_237859460();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v11);
  sub_23778EF5C();
  sub_23785BA70();
  BOOL v13 = (v12 & 1) == 0;
  sub_23782D870((uint64_t)v10);
  return v13;
}

uint64_t sub_23782D72C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2377DE6FC;
  return RegexAppsResolver.resolve(appName:appId:)(a1, a2);
}

uint64_t sub_23782D7D0()
{
  return sub_23785B9E0();
}

uint64_t sub_23782D7F8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for RegexAppsResolver()
{
  uint64_t result = qword_268928298;
  if (!qword_268928298) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23782D870(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928288);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL sub_23782D8D0(void **a1)
{
  return sub_23782D1E4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23782D8F4(void **a1)
{
  return sub_23782D370(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10]) & 1;
}

void *initializeBufferWithCopyOfBuffer for RegexAppsResolver(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_237859460();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return v4;
}

uint64_t destroy for RegexAppsResolver(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_237859460();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for RegexAppsResolver(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_237859460();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t *assignWithCopy for RegexAppsResolver(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_237859460();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for RegexAppsResolver(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_237859460();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for RegexAppsResolver(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_237859460();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for RegexAppsResolver(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23782DD04);
}

uint64_t sub_23782DD04(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_237859460();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for RegexAppsResolver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23782DDA0);
}

uint64_t sub_23782DDA0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_237859460();
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_23782DE20()
{
  uint64_t result = sub_237859460();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23782DEB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RegexAppsResolver();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23782DF1C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RegexAppsResolver();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23782DF94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for SiriRemembersStoreProvider();
  uint64_t v3 = OUTLINED_FUNCTION_2_0(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_5_0();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282A8);
  uint64_t v8 = OUTLINED_FUNCTION_2_0(v7);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  BOOL v13 = &v16[-v12];
  sub_23785B000();
  uint64_t v14 = sub_23785B010();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v14);
  sub_23782FC68((uint64_t)v13, (uint64_t)v11);
  sub_23785B010();
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v14);
  sub_23782FDE0((uint64_t)v11, v6);
  sub_2377AACD8(v6, a1);
  return sub_2377F2F88((uint64_t)v13, &qword_2689282A8);
}

uint64_t sub_23782E108(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282B8);
  uint64_t v4 = OUTLINED_FUNCTION_2_0(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_4();
  uint64_t v42 = v5;
  uint64_t v43 = sub_23785B030();
  OUTLINED_FUNCTION_1_2();
  uint64_t v37 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_4();
  uint64_t v36 = v8;
  sub_2378593F0();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5_0();
  uint64_t v38 = sub_2378594B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_5_0();
  uint64_t v15 = v14 - v13;
  sub_2378592C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v40 = v17;
  uint64_t v41 = v16;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_5_0();
  uint64_t v20 = v19 - v18;
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F75A40]), sel_init);
  sub_23782FE48(0xD000000000000018, 0x8000000237864C10, v21);

  uint64_t v22 = sub_23785B2A0();
  sub_23782FEA0(v22, v23, v21);
  sub_23782FF04(0x704168636E75614CLL, 0xEF746E65746E4970, v21);
  objc_msgSend(v21, sel_setVoiceID_, 0);
  objc_msgSend(v21, sel_setInteractionType_, a2);
  sub_23785B2D0();
  uint64_t v39 = v20;
  if (v24)
  {
    uint64_t v25 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = 0;
  }
  objc_msgSend(v21, sel_setRoomName_, v25);

  sub_237859490();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282C0);
  sub_2378594A0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v27 = v26;
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_237861E40;
  uint64_t v29 = *(void (**)(void))(v27 + 104);
  OUTLINED_FUNCTION_2_17();
  v29();
  OUTLINED_FUNCTION_2_17();
  v29();
  OUTLINED_FUNCTION_2_17();
  v29();
  OUTLINED_FUNCTION_2_17();
  v29();
  OUTLINED_FUNCTION_2_17();
  v29();
  OUTLINED_FUNCTION_2_17();
  v29();
  OUTLINED_FUNCTION_2_17();
  v29();
  sub_2377E77A8(v28);
  sub_2378593E0();
  sub_237859470();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_2();
  v30();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v38);
  char v31 = (void *)sub_2378592B0();
  objc_msgSend(v21, sel_setRequestTime_, v31);

  sub_23782FF5C();
  id v32 = v21;
  id v33 = sub_23782E68C(v32, 0);
  objc_msgSend(v33, sel__setDonatedBySiri_, 1);
  sub_23785B880();
  __swift_storeEnumTagSinglePayload(v42, 0, 1, v43);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32))(v36, v42, v43);
  *(void *)(swift_allocObject() + 16) = v32;
  id v34 = v32;
  sub_23785B020();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v43);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
}

id sub_23782E68C(void *a1, void *a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithIntent_response_, a1, a2);

  return v4;
}

uint64_t sub_23782E6E8(void *a1, char a2, void *a3)
{
  uint64_t v6 = sub_23785B4B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v38 - v11;
  if (a2)
  {
    id v21 = a1;
    if (qword_268926828 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v6, (uint64_t)qword_268928D70);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v22, v6);
    id v23 = a3;
    sub_23782FFE0(a1, 1);
    id v24 = v23;
    sub_23782FFE0(a1, 1);
    uint64_t v25 = sub_23785B490();
    os_log_type_t v26 = sub_23785B8B0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t v42 = (uint64_t)v24;
      uint64_t v43 = v39;
      *(_DWORD *)uint64_t v27 = 138412546;
      os_log_t v38 = v25;
      uint64_t v40 = (uint8_t *)v7;
      id v29 = v24;
      uint64_t v41 = v6;
      id v30 = v29;
      sub_23785B9E0();
      char v31 = v28;
      *uint64_t v28 = v24;

      *(_WORD *)(v27 + 12) = 2080;
      uint64_t v42 = (uint64_t)a1;
      id v32 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268926CE0);
      uint64_t v33 = sub_23785B6D0();
      uint64_t v42 = sub_2377C6A68(v33, v34, (uint64_t *)&v43);
      sub_23785B9E0();
      swift_bridgeObjectRelease();
      sub_23782FFEC(a1, 1);
      sub_23782FFEC(a1, 1);
      os_log_t v35 = v38;
      _os_log_impl(&dword_237778000, v38, v26, "SiriRemembersProvider couldn't donate intent %@ to Siri Remembers %s", (uint8_t *)v27, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268927028);
      swift_arrayDestroy();
      MEMORY[0x237E23210](v31, -1, -1);
      uint64_t v36 = v39;
      swift_arrayDestroy();
      MEMORY[0x237E23210](v36, -1, -1);
      MEMORY[0x237E23210](v27, -1, -1);

      sub_23782FFEC(a1, 1);
      return (*((uint64_t (**)(char *, uint64_t))v40 + 1))(v10, v41);
    }
    else
    {
      sub_23782FFEC(a1, 1);

      sub_23782FFEC(a1, 1);
      sub_23782FFEC(a1, 1);

      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
  }
  else
  {
    if (qword_268926828 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v6, (uint64_t)qword_268928D70);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v13, v6);
    uint64_t v14 = a3;
    uint64_t v15 = sub_23785B490();
    os_log_type_t v16 = sub_23785B8A0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      uint64_t v40 = v17;
      uint64_t v41 = v6;
      *(_DWORD *)uint64_t v17 = 138412290;
      uint64_t v43 = v14;
      uint64_t v19 = v14;
      uint64_t v6 = v41;
      sub_23785B9E0();
      *uint64_t v18 = v14;

      uint64_t v20 = v40;
      _os_log_impl(&dword_237778000, v15, v16, "SiriRemembersProvider successfully donated intent %@ to Siri Remembers", v40, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268927028);
      swift_arrayDestroy();
      MEMORY[0x237E23210](v18, -1, -1);
      MEMORY[0x237E23210](v20, -1, -1);
    }
    else
    {

      uint64_t v15 = v14;
    }

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
}

uint64_t sub_23782EC1C@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  unint64_t v166 = a2;
  uint64_t v164 = a1;
  uint64_t v162 = a4;
  uint64_t v5 = type metadata accessor for SiriRemembersStoreProvider();
  uint64_t v6 = OUTLINED_FUNCTION_2_0(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_6_19(v7);
  v148[2] = sub_2378593F0();
  OUTLINED_FUNCTION_1_2();
  v148[1] = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_6_19(v10);
  uint64_t v165 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v169 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_36_0();
  uint64_t v170 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_17_13();
  uint64_t v151 = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689280F0);
  uint64_t v17 = OUTLINED_FUNCTION_2_0(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_6_19(v18);
  uint64_t v174 = sub_23785AFA0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v149 = v19;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_17_13();
  uint64_t v150 = v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282A8);
  uint64_t v25 = OUTLINED_FUNCTION_2_0(v24);
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_17_13();
  OUTLINED_FUNCTION_6_19(v27);
  uint64_t v175 = sub_23785B010();
  OUTLINED_FUNCTION_1_2();
  uint64_t v154 = v28;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_6_19(v30);
  uint64_t v31 = sub_23785AFF0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v33 = v32;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_17_13();
  uint64_t v167 = v37;
  uint64_t v176 = sub_23785AF70();
  OUTLINED_FUNCTION_1_2();
  uint64_t v178 = v38;
  uint64_t v40 = MEMORY[0x270FA5388](v39);
  uint64_t v42 = (char *)v148 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = MEMORY[0x270FA5388](v40);
  uint64_t v171 = (char *)v148 - v44;
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_17_13();
  uint64_t v172 = v45;
  uint64_t v46 = sub_23785B040();
  OUTLINED_FUNCTION_1_2();
  uint64_t v48 = v47;
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v50);
  uint64_t v52 = (void *)((char *)v148 - v51);
  uint64_t v163 = sub_23785B2A0();
  os_log_t v168 = v53;
  uint64_t v54 = *(void *)(a3 + 16);
  uint64_t v173 = v31;
  uint64_t v177 = v33;
  if (v54)
  {
    v148[3] = v42;
    uint64_t v182 = MEMORY[0x263F8EE78];
    sub_2377EDBC8(0, v54, 0);
    uint64_t v55 = v182;
    uint64_t v56 = (uint64_t *)(a3 + 32);
    uint64_t v57 = *MEMORY[0x263F743D8];
    uint64_t v179 = (void (*)(uint64_t, uint64_t))(v48 + 32);
    uint64_t v180 = v48;
    do
    {
      uint64_t v58 = *v56++;
      uint64_t v181 = v58;
      uint64_t v59 = sub_23785BE00();
      *uint64_t v52 = 0x7463617265746E69;
      v52[1] = 0xEF657079546E6F69;
      v52[2] = v59;
      v52[3] = v60;
      (*(void (**)(void *, uint64_t, uint64_t))(v48 + 104))(v52, v57, v46);
      uint64_t v182 = v55;
      unint64_t v62 = *(void *)(v55 + 16);
      unint64_t v61 = *(void *)(v55 + 24);
      if (v62 >= v61 >> 1)
      {
        sub_2377EDBC8(v61 > 1, v62 + 1, 1);
        uint64_t v55 = v182;
      }
      *(void *)(v55 + 16) = v62 + 1;
      (*(void (**)(unint64_t, void *, uint64_t))(v180 + 32))(v55+ ((*(unsigned __int8 *)(v180 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v180 + 80))+ *(void *)(v180 + 72) * v62, v52, v46);
      --v54;
    }
    while (v54);
    uint64_t v48 = v180;
  }
  else
  {
    uint64_t v55 = MEMORY[0x263F8EE78];
  }
  sub_23785AF60();
  sub_23785AF50();
  uint64_t v63 = *(void *)(v178 + 8);
  v178 += 8;
  uint64_t v180 = v63;
  OUTLINED_FUNCTION_5_2();
  v64();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268927A90);
  uint64_t v65 = *(void *)(v48 + 72);
  unint64_t v66 = (*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
  uint64_t v67 = swift_allocObject();
  *(_OWORD *)(v67 + 16) = xmmword_237861E50;
  uint64_t v68 = (void *)(v67 + v66);
  *uint64_t v68 = 0x7954746E65746E69;
  v68[1] = 0xEA00000000006570;
  v68[2] = 0x704168636E75614CLL;
  v68[3] = 0xEF746E65746E4970;
  uint64_t v69 = *(void (**)(void))(v48 + 104);
  OUTLINED_FUNCTION_7_13();
  v69();
  uint64_t v70 = v67 + v66 + v65;
  strcpy((char *)v70, "remoteDeviceID");
  *(unsigned char *)(v70 + 15) = -18;
  os_log_t v71 = v168;
  *(void *)(v70 + 16) = v163;
  *(void *)(v70 + 24) = v71;
  OUTLINED_FUNCTION_7_13();
  v69();
  uint64_t v72 = (void *)(v67 + v66 + 2 * v65);
  *uint64_t v72 = 0x656D614E6D6F6F72;
  v72[1] = 0xE800000000000000;
  unint64_t v73 = v166;
  v72[2] = v164;
  v72[3] = v73;
  OUTLINED_FUNCTION_7_13();
  v69();
  *(void *)((char *)v68 + 3 * v65) = v55;
  OUTLINED_FUNCTION_7_13();
  v69();
  uint64_t v74 = v157;
  *uint64_t v157 = v67;
  OUTLINED_FUNCTION_7_13();
  v69();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23785AF40();
  (*(void (**)(uint64_t *, uint64_t))(v48 + 8))(v74, v46);
  OUTLINED_FUNCTION_5_2();
  v75();
  uint64_t v76 = v158;
  sub_23785AFE0();
  uint64_t v77 = v159;
  sub_23785AFC0();
  uint64_t v78 = v177 + 8;
  uint64_t v79 = *(void (**)(uint64_t, uint64_t))(v177 + 8);
  uint64_t v80 = v173;
  v79(v76, v173);
  uint64_t v81 = v167;
  sub_23785AFD0();
  uint64_t v177 = v78;
  v79(v77, v80);
  uint64_t v82 = v161;
  uint64_t v83 = v160;
  sub_23782FC68(v161, v160);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v83, 1, v175);
  uint64_t v85 = v174;
  if (EnumTagSinglePayload == 1)
  {
    swift_bridgeObjectRelease();
    sub_2377F2F88(v83, &qword_2689282A8);
    uint64_t v86 = v165;
    uint64_t v87 = v169;
    uint64_t v91 = v156;
    if (qword_268926828 != -1) {
      swift_once();
    }
    uint64_t v92 = __swift_project_value_buffer(v86, (uint64_t)qword_268928D70);
    (*(void (**)(void, uint64_t, uint64_t))(v87 + 16))(v170, v92, v86);
    sub_23782FCD0(v82, v91);
    os_log_type_t v93 = sub_23785B490();
    os_log_type_t v94 = sub_23785B8B0();
    if (os_log_type_enabled(v93, v94))
    {
      uint64_t v95 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v95 = 67109120;
      uint64_t v96 = v152;
      sub_23782FC68(v91, v152);
      uint64_t v97 = v91;
      BOOL v98 = __swift_getEnumTagSinglePayload(v96, 1, v175) == 1;
      sub_2377F2F88(v96, &qword_2689282A8);
      sub_23782FD34(v97);
      LODWORD(v182) = v98;
      uint64_t v99 = v173;
      uint64_t v81 = v167;
      sub_23785B9E0();
      _os_log_impl(&dword_237778000, v93, v94, "Error while getting the history stats. Is Interaction store nil %{BOOL}d. Returning.", v95, 8u);
      uint64_t v100 = v95;
      uint64_t v87 = v169;
      MEMORY[0x237E23210](v100, -1, -1);
    }
    else
    {
      sub_23782FD34(v91);
      uint64_t v99 = v173;
    }
    uint64_t v101 = v174;

    (*(void (**)(void (*)(uint64_t, uint64_t, uint64_t), uint64_t))(v87 + 8))(v170, v86);
    v79(v81, v99);
    uint64_t v102 = OUTLINED_FUNCTION_4_20();
    v103(v102);
    uint64_t v104 = 1;
    uint64_t v105 = v162;
  }
  else
  {
    uint64_t v88 = v154;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v154 + 32))(v155, v83, v175);
    uint64_t v89 = v153;
    sub_23785AFB0();
    uint64_t v90 = v165;
    uint64_t v179 = v79;
    __swift_storeEnumTagSinglePayload(v89, 0, 1, v85);
    uint64_t v107 = v149;
    uint64_t v170 = *(void (**)(uint64_t, uint64_t, uint64_t))(v149 + 32);
    uint64_t v171 = (char *)(v149 + 32);
    v170(v150, v89, v85);
    if (qword_268926828 != -1) {
      swift_once();
    }
    uint64_t v108 = __swift_project_value_buffer(v90, (uint64_t)qword_268928D70);
    uint64_t v109 = v169;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v169 + 16))(v151, v108, v90);
    uint64_t v110 = *(void (**)(uint64_t))(v107 + 16);
    uint64_t v111 = OUTLINED_FUNCTION_13_14((uint64_t)&v179);
    v110(v111);
    uint64_t v112 = OUTLINED_FUNCTION_13_14((uint64_t)&v180);
    v110(v112);
    unint64_t v113 = v166;
    swift_bridgeObjectRetain_n();
    os_log_t v114 = v168;
    swift_bridgeObjectRetain();
    uint64_t v115 = sub_23785B490();
    os_log_type_t v116 = sub_23785B8A0();
    int v117 = v116;
    if (os_log_type_enabled(v115, v116))
    {
      uint64_t v118 = swift_slowAlloc();
      uint64_t v161 = swift_slowAlloc();
      uint64_t v182 = v161;
      *(_DWORD *)uint64_t v118 = 136315906;
      LODWORD(v160) = v117;
      swift_bridgeObjectRetain();
      uint64_t v181 = sub_2377C6A68(v163, (unint64_t)v114, &v182);
      sub_23785B9E0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v118 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v119 = sub_2377C6A68(v164, v113, &v182);
      OUTLINED_FUNCTION_12_13(v119);
      sub_23785B9E0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v118 + 22) = 2080;
      uint64_t v120 = v148[4];
      sub_23785AF90();
      sub_23782FD90();
      uint64_t v121 = sub_23785BE00();
      unint64_t v123 = v122;
      OUTLINED_FUNCTION_5_2();
      v124();
      uint64_t v125 = sub_2377C6A68(v121, v123, &v182);
      OUTLINED_FUNCTION_12_13(v125);
      sub_23785B9E0();
      swift_bridgeObjectRelease();
      os_log_type_t v126 = *(void (**)(uint64_t, uint64_t))(v149 + 8);
      v126(v120, v174);
      *(_WORD *)(v118 + 32) = 2080;
      os_log_t v168 = v115;
      uint64_t v127 = v148[5];
      sub_23785AF80();
      uint64_t v128 = MEMORY[0x237E22360]();
      unint64_t v130 = v129;
      swift_bridgeObjectRelease();
      uint64_t v101 = v174;
      uint64_t v131 = sub_2377C6A68(v128, v130, &v182);
      OUTLINED_FUNCTION_12_13(v131);
      uint64_t v132 = v150;
      sub_23785B9E0();
      swift_bridgeObjectRelease();
      v126(v127, v101);
      os_log_t v133 = v168;
      _os_log_impl(&dword_237778000, v168, (os_log_type_t)v160, "For remoteDeviceID: %s, roomName: %s stats are - recency: %s, frequencies %s", (uint8_t *)v118, 0x2Au);
      uint64_t v134 = v161;
      swift_arrayDestroy();
      MEMORY[0x237E23210](v134, -1, -1);
      MEMORY[0x237E23210](v118, -1, -1);

      OUTLINED_FUNCTION_5_2();
      v135();
      OUTLINED_FUNCTION_5_2();
      v136();
      uint64_t v137 = OUTLINED_FUNCTION_11_12();
      v138(v137);
      uint64_t v139 = OUTLINED_FUNCTION_4_20();
      v140(v139);
    }
    else
    {

      uint64_t v141 = *(void (**)(uint64_t))(v149 + 8);
      uint64_t v142 = OUTLINED_FUNCTION_15_12((uint64_t)&v180);
      v141(v142);
      uint64_t v143 = OUTLINED_FUNCTION_15_12((uint64_t)&v179);
      v141(v143);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v151, v90);
      (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v155, v175);
      uint64_t v144 = OUTLINED_FUNCTION_11_12();
      v145(v144);
      uint64_t v146 = OUTLINED_FUNCTION_4_20();
      v147(v146);
      uint64_t v101 = v85;
      uint64_t v132 = v150;
    }
    uint64_t v105 = v162;
    v170(v162, v132, v101);
    uint64_t v104 = 0;
  }
  return __swift_storeEnumTagSinglePayload(v105, v104, 1, v101);
}

uint64_t sub_23782FB9C(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_23782FBC8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23782FBF0@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for SiriRemembersStoreProvider()
{
  uint64_t result = qword_2689282D0;
  if (!qword_2689282D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23782FC68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23782FCD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriRemembersStoreProvider();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23782FD34(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriRemembersStoreProvider();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23782FD90()
{
  unint64_t result = qword_2689282B0;
  if (!qword_2689282B0)
  {
    sub_2378593F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689282B0);
  }
  return result;
}

uint64_t sub_23782FDE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_23782FE48(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_23785B6A0();
  objc_msgSend(a3, sel__setLaunchId_, v4);
}

void sub_23782FEA0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_23785B6A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setRemoteDeviceID_, v4);
}

void sub_23782FF04(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_23785B6A0();
  objc_msgSend(a3, sel_setIntentType_, v4);
}

unint64_t sub_23782FF5C()
{
  unint64_t result = qword_2689282C8;
  if (!qword_2689282C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2689282C8);
  }
  return result;
}

uint64_t sub_23782FF9C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23782FFD4(void *a1, char a2)
{
  return sub_23782E6E8(a1, a2 & 1, *(void **)(v2 + 16));
}

id sub_23782FFE0(id result, char a2)
{
  if (a2) {
    return result;
  }
  return result;
}

void sub_23782FFEC(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t *sub_23782FFF8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2689282A8) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_23785B010();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_237830100(uint64_t a1)
{
  uint64_t v2 = sub_23785B010();
  uint64_t result = __swift_getEnumTagSinglePayload(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_237830188(void *a1, const void *a2)
{
  uint64_t v4 = sub_23785B010();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v4))
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282A8);
    memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v4);
  }
  return a1;
}

void *sub_237830250(void *a1, const void *a2)
{
  uint64_t v4 = sub_23785B010();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v4);
  int v6 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v4);
  if (!EnumTagSinglePayload)
  {
    uint64_t v7 = *(void *)(v4 - 8);
    if (!v6)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v4);
  return a1;
}

void *sub_237830398(void *a1, const void *a2)
{
  uint64_t v4 = sub_23785B010();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v4))
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282A8);
    memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v4);
  }
  return a1;
}

void *sub_237830460(void *a1, const void *a2)
{
  uint64_t v4 = sub_23785B010();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v4);
  int v6 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v4);
  if (!EnumTagSinglePayload)
  {
    uint64_t v7 = *(void *)(v4 - 8);
    if (!v6)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v4);
  return a1;
}

uint64_t sub_2378305A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2378305BC);
}

uint64_t sub_2378305BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282A8);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_237830608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23783061C);
}

uint64_t sub_23783061C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282A8);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_23783066C()
{
  sub_2378306F8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2378306F8()
{
  if (!qword_2689282E0)
  {
    sub_23785B010();
    unint64_t v0 = sub_23785B9D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2689282E0);
    }
  }
}

uint64_t OUTLINED_FUNCTION_4_20()
{
  return *(void *)(v0 - 184);
}

uint64_t OUTLINED_FUNCTION_6_19@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_11_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_13(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_13_14@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_15_12@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

void AppLaunchDataModels.ConfirmationViewModel.init(primaryAction:primaryLabel:secondaryAction:secondaryLabel:)()
{
  OUTLINED_FUNCTION_23_0();
  sub_237859990();
  OUTLINED_FUNCTION_1_2();
  uint64_t v1 = v0;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_24_9();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_134();
  type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(v4);
  sub_2378599D0();
  uint64_t v5 = *(void (**)(void))(v1 + 16);
  OUTLINED_FUNCTION_66_3();
  v5();
  OUTLINED_FUNCTION_66_3();
  v5();
  sub_2378599D0();
  int v6 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_33_2();
  v6();
  sub_2378599D0();
  OUTLINED_FUNCTION_66_3();
  v5();
  OUTLINED_FUNCTION_66_3();
  v5();
  sub_2378599D0();
  OUTLINED_FUNCTION_33_2();
  v6();
  OUTLINED_FUNCTION_33_2();
  v6();
  OUTLINED_FUNCTION_33_2();
  v6();
  OUTLINED_FUNCTION_18_3();
}

void AppLaunchDataModels.Device.init(name:id:actionProperty:)()
{
  OUTLINED_FUNCTION_23_0();
  sub_237859990();
  OUTLINED_FUNCTION_1_2();
  uint64_t v1 = v0;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_81_1();
  MEMORY[0x270FA5388](v3);
  sub_2378599D0();
  type metadata accessor for AppLaunchDataModels.Device(0);
  OUTLINED_FUNCTION_103();
  sub_2378599D0();
  uint64_t v4 = *(void (**)(void))(v1 + 16);
  OUTLINED_FUNCTION_63_2();
  v4();
  OUTLINED_FUNCTION_63_2();
  v4();
  sub_2378599D0();
  uint64_t v5 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_17_0();
  v5();
  OUTLINED_FUNCTION_19_8();
  OUTLINED_FUNCTION_17_0();
  v5();
  OUTLINED_FUNCTION_18_3();
}

uint64_t AppLaunchDataModels.DeviceDisambiguationModel.init(systemText:devices:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  sub_2378599D0();
  uint64_t result = type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(0);
  *(void *)(a2 + *(int *)(result + 20)) = a1;
  return result;
}

void AppLaunchDataModels.ButtonFallbackModel.init(buttonLabel:actionProperty:)()
{
  OUTLINED_FUNCTION_23_0();
  sub_237859990();
  OUTLINED_FUNCTION_1_2();
  uint64_t v1 = v0;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  MEMORY[0x270FA5388](v3);
  sub_2378599D0();
  uint64_t v4 = *(void (**)(void))(v1 + 16);
  OUTLINED_FUNCTION_63_2();
  v4();
  type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(0);
  OUTLINED_FUNCTION_63_2();
  v4();
  sub_2378599D0();
  uint64_t v5 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_131();
  OUTLINED_FUNCTION_21_0();
  v5();
  OUTLINED_FUNCTION_19_8();
  OUTLINED_FUNCTION_21_0();
  v5();
  OUTLINED_FUNCTION_18_3();
}

void AppLaunchDataModels.App.init(name:bundleId:isOffloaded:actionProperty:)()
{
  OUTLINED_FUNCTION_23_0();
  int v21 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_237859990();
  OUTLINED_FUNCTION_1_2();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_34_7();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v20 - v15;
  uint64_t v22 = v9;
  uint64_t v23 = v7;
  sub_2378599D0();
  type metadata accessor for AppLaunchDataModels.App(0);
  uint64_t v22 = v5;
  uint64_t v23 = v3;
  sub_2378599D0();
  LOBYTE(v22) = v21;
  sub_2378599D0();
  uint64_t v17 = *(void (**)(uint64_t))(v12 + 16);
  uint64_t v18 = OUTLINED_FUNCTION_122();
  v17(v18);
  ((void (*)(uint64_t, char *, uint64_t))v17)(v0, v16, v10);
  sub_2378599D0();
  uint64_t v19 = *(void (**)(void))(v12 + 8);
  OUTLINED_FUNCTION_33_2();
  v19();
  OUTLINED_FUNCTION_19_8();
  OUTLINED_FUNCTION_33_2();
  v19();
  OUTLINED_FUNCTION_18_3();
}

uint64_t AppLaunchDataModels.AppDisambiguationModel.init(systemText:apps:)()
{
  return sub_2378599D0();
}

void sub_237830E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_6();
  uint64_t v80 = v21;
  uint64_t v79 = v22;
  uint64_t v78 = v23;
  uint64_t v88 = v24;
  uint64_t v89 = v25;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v77 = v30;
  uint64_t v81 = v31;
  uint64_t v33 = v32;
  uint64_t v84 = a21;
  sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v86 = v35;
  uint64_t v87 = v34;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_1_4();
  uint64_t v85 = v36;
  uint64_t v37 = OUTLINED_FUNCTION_26_1();
  v76[2] = type metadata accessor for AppLaunchDataModels.AppResultModel(v37);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_17_13();
  v76[0] = v40;
  OUTLINED_FUNCTION_26_1();
  uint64_t v41 = sub_237859610();
  OUTLINED_FUNCTION_1_2();
  uint64_t v83 = v42;
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_28_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268927838);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_81_1();
  MEMORY[0x270FA5388](v45);
  uint64_t v47 = (char *)v76 - v46;
  uint64_t v48 = *(int *)(type metadata accessor for AppLaunchDataModels.AppOffloadedModel(0) + 20);
  v76[4] = v33;
  uint64_t v49 = v33 + v48;
  uint64_t v50 = sub_237859990();
  __swift_storeEnumTagSinglePayload((uint64_t)v47, 1, 1, v50);
  sub_23783DD98();
  uint64_t v82 = v49;
  sub_2378599D0();
  sub_237799238((uint64_t)v47, &qword_268927838);
  uint64_t v90 = v81;
  uint64_t v91 = v77;
  v76[3] = v29;
  uint64_t v92 = v29;
  uint64_t v93 = v27;
  uint64_t v81 = v27;
  uint64_t v94 = v88;
  uint64_t v95 = v89;
  uint64_t v96 = v78;
  uint64_t v97 = v79;
  sub_2378351FC((uint64_t)&unk_2689289F0);
  uint64_t v51 = v80;
  sub_23785B200();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v52 = sub_23785B1F0();
  if (v51)
  {
    uint64_t v88 = v41;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v87, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_8_0();
    v55(v54);
    id v56 = v51;
    id v57 = v51;
    uint64_t v58 = sub_23785B490();
    os_log_type_t v59 = sub_23785B8B0();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = (uint8_t *)swift_slowAlloc();
      unint64_t v61 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v60 = 138412290;
      id v62 = v51;
      uint64_t v98 = _swift_stdlib_bridgeErrorToNSError();
      sub_23785B9E0();
      void *v61 = v98;

      _os_log_impl(&dword_237778000, v58, v59, "AppOffloadedModel: failed to serialize sf card. Error %@", v60, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268927028);
      swift_arrayDestroy();
      MEMORY[0x237E23210](v61, -1, -1);
      MEMORY[0x237E23210](v60, -1, -1);
    }
    else
    {
    }
    uint64_t v69 = v84;

    OUTLINED_FUNCTION_5_2();
    v71(v70);
    swift_willThrow();
    sub_237799238(v69, &qword_268927838);
    OUTLINED_FUNCTION_126();
    OUTLINED_FUNCTION_13_1();
    v73(v72);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689285D0);
    OUTLINED_FUNCTION_22_1();
  }
  else
  {
    uint64_t v63 = v52;
    unint64_t v64 = v53;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268927B08);
    uint64_t v65 = swift_allocObject();
    *(_OWORD *)(v65 + 16) = xmmword_23785CD50;
    *(void *)(v65 + 32) = v63;
    *(void *)(v65 + 40) = v64;
    sub_23778B224(v63, v64);
    sub_237836D54();
    uint64_t v89 = v63;
    sub_237835698();
    sub_2378599D0();
    uint64_t v66 = OUTLINED_FUNCTION_122();
    sub_2378356EC(v66, v67);
    uint64_t v68 = v84;
    sub_23783DD98();
    sub_23783DD98();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689285D0);
    sub_237859A00();
    sub_237799238((uint64_t)v47, &qword_268927838);
    sub_237787078(v89, v64);
    sub_237799238(v68, &qword_268927838);
  }
  OUTLINED_FUNCTION_5_2();
  v75(v74);
  OUTLINED_FUNCTION_9();
}

uint64_t sub_237831468(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      uint64_t v7 = v4 + v2;
    }
    else {
      uint64_t v7 = v4;
    }
    uint64_t result = sub_2378043AC(result, v7, 1, v3);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v8 = (*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16);
  uint64_t v9 = sub_23785A060();
  uint64_t v11 = *(void *)(v9 - 8);
  uint64_t result = v9 - 8;
  uint64_t v10 = v11;
  if (v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = sub_2378055B0(v6 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), v2);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *int v1 = v3;
    return result;
  }
  uint64_t v12 = *(void *)(v3 + 16);
  BOOL v13 = __OFADD__(v12, v2);
  uint64_t v14 = v12 + v2;
  if (!v13)
  {
    *(void *)(v3 + 16) = v14;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_237831580(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_23785BCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_23785BCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *int v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x237E22760](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *int v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_237807550(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_23785BCC0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_23785B7C0();
}

uint64_t sub_237831748(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_23785BCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_23785BCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *int v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x237E22760](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *int v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_23780758C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_23785BCC0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_23785B7C0();
}

void *AppLaunchDataModels.bundleName.unsafeMutableAddressor()
{
  return &static AppLaunchDataModels.bundleName;
}

unint64_t static AppLaunchDataModels.bundleName.getter()
{
  return 0xD000000000000015;
}

uint64_t property wrapper backing initializer of AppLaunchDataModels.App.name()
{
  return sub_2378599D0();
}

uint64_t (*AppLaunchDataModels.App.name.modify())()
{
  int v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_53_3((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t AppLaunchDataModels.App.bundleId.getter()
{
  return sub_237833B20((void (*)(void))type metadata accessor for AppLaunchDataModels.App);
}

uint64_t AppLaunchDataModels.App.bundleId.setter(uint64_t a1, uint64_t a2)
{
  return sub_237833B88(a1, a2, (void (*)(void))type metadata accessor for AppLaunchDataModels.App);
}

uint64_t (*AppLaunchDataModels.App.bundleId.modify())()
{
  int v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_114((uint64_t)v1);
  OUTLINED_FUNCTION_23_13();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t property wrapper backing initializer of AppLaunchDataModels.App.isOffloaded()
{
  return sub_2378599D0();
}

uint64_t AppLaunchDataModels.App.isOffloaded.getter()
{
  type metadata accessor for AppLaunchDataModels.App(0);
  OUTLINED_FUNCTION_41_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F0);
  sub_2378599F0();
  return v1;
}

uint64_t AppLaunchDataModels.App.isOffloaded.setter()
{
  return sub_237859A00();
}

uint64_t (*AppLaunchDataModels.App.isOffloaded.modify())()
{
  unsigned __int8 v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_114((uint64_t)v1);
  OUTLINED_FUNCTION_41_7();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F0);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t AppLaunchDataModels.App.actionProperty.getter()
{
  return sub_2378599F0();
}

uint64_t AppLaunchDataModels.App.actionProperty.setter()
{
  sub_237859990();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = OUTLINED_FUNCTION_5_21(v1, v7);
  v3(v2);
  type metadata accessor for AppLaunchDataModels.App(0);
  OUTLINED_FUNCTION_73_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  sub_237859A00();
  uint64_t v4 = OUTLINED_FUNCTION_9_2();
  return v5(v4);
}

uint64_t (*AppLaunchDataModels.App.actionProperty.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_114((uint64_t)v1);
  OUTLINED_FUNCTION_73_1();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t AppLaunchDataModels.App.hash(into:)()
{
  return sub_23785B670();
}

uint64_t static AppLaunchDataModels.App.__derived_struct_equals(_:_:)()
{
  OUTLINED_FUNCTION_44_3();
  if ((sub_237859A10() & 1) == 0) {
    return 0;
  }
  uint64_t v0 = type metadata accessor for AppLaunchDataModels.App(0);
  OUTLINED_FUNCTION_71_3(v0);
  if ((sub_237859A10() & 1) == 0 || (sub_237859A10() & 1) == 0) {
    return 0;
  }
  sub_237859990();
  sub_2378351FC((uint64_t)&unk_268928320);
  OUTLINED_FUNCTION_56_2();
  return sub_237859A10();
}

uint64_t sub_237831EE4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
    if (v6 || (sub_23785BE30() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x616F6C66664F7369 && a2 == 0xEB00000000646564;
      if (v7 || (sub_23785BE30() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x72506E6F69746361 && a2 == 0xEE0079747265706FLL)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_23785BE30();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_2378320C0(char a1)
{
  uint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6449656C646E7562;
      break;
    case 2:
      uint64_t result = 0x616F6C66664F7369;
      break;
    case 3:
      uint64_t result = 0x72506E6F69746361;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_237832160()
{
  return sub_23783B604();
}

uint64_t sub_23783217C()
{
  return sub_2378320C0(*v0);
}

uint64_t sub_237832184@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_237831EE4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2378321AC(uint64_t a1)
{
  unint64_t v2 = sub_237835240();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2378321E8(uint64_t a1)
{
  unint64_t v2 = sub_237835240();
  return MEMORY[0x270FA00B8](a1, v2);
}

void AppLaunchDataModels.App.encode(to:)()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_43();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928328);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_36();
  sub_237835240();
  OUTLINED_FUNCTION_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  sub_2378352F0((uint64_t)&unk_268928338);
  OUTLINED_FUNCTION_12_14();
  if (!v0)
  {
    type metadata accessor for AppLaunchDataModels.App(0);
    OUTLINED_FUNCTION_103();
    OUTLINED_FUNCTION_12_14();
    OUTLINED_FUNCTION_70();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F0);
    sub_23783528C((uint64_t)&unk_268928340);
    OUTLINED_FUNCTION_67_3();
    OUTLINED_FUNCTION_12_14();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
    sub_237835354((uint64_t)&unk_268928348);
    OUTLINED_FUNCTION_12_14();
  }
  OUTLINED_FUNCTION_17_0();
  v2();
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_9();
}

uint64_t AppLaunchDataModels.App.hashValue.getter()
{
  return sub_23785BEF0();
}

void AppLaunchDataModels.App.init(from:)()
{
  OUTLINED_FUNCTION_6();
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_87_0(v6, v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_30_8();
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_2();
  uint64_t v22 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_82_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_17_13();
  uint64_t v23 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928360);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = OUTLINED_FUNCTION_35_6();
  uint64_t v14 = type metadata accessor for AppLaunchDataModels.App(v13);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_45_0();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_237835240();
  sub_23785BF10();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    uint64_t v21 = v1;
    sub_2378352F0((uint64_t)&unk_268928368);
    uint64_t v16 = v23;
    sub_23785BD60();
    uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32);
    v24(v21, v16, v25);
    sub_23785BD60();
    v24(v21 + *(int *)(v14 + 20), v2, v25);
    OUTLINED_FUNCTION_70();
    sub_23783528C((uint64_t)&unk_268928370);
    sub_23785BD60();
    OUTLINED_FUNCTION_38_0();
    v17();
    sub_237835354((uint64_t)&unk_268928378);
    sub_23785BD60();
    OUTLINED_FUNCTION_5_2();
    v18();
    OUTLINED_FUNCTION_59_2();
    v19();
    sub_237835698();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    sub_2378356EC(v21, (void (*)(void))type metadata accessor for AppLaunchDataModels.App);
  }
  OUTLINED_FUNCTION_9();
}

uint64_t sub_237832A24()
{
  return sub_23785BEF0();
}

void sub_237832B58()
{
}

void sub_237832B70()
{
}

uint64_t (*AppLaunchDataModels.AppDisambiguationModel.systemText.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_53_3((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t property wrapper backing initializer of AppLaunchDataModels.AppDisambiguationModel.apps(uint64_t a1)
{
  return sub_237838F7C(a1, &qword_2689273E8);
}

uint64_t AppLaunchDataModels.AppDisambiguationModel.apps.getter()
{
  type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(0);
  OUTLINED_FUNCTION_23_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928380);
  sub_2378599F0();
  return v1;
}

uint64_t AppLaunchDataModels.AppDisambiguationModel.apps.setter()
{
  return sub_237859A00();
}

uint64_t (*AppLaunchDataModels.AppDisambiguationModel.apps.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  uint64_t v2 = OUTLINED_FUNCTION_70_2((uint64_t)v1);
  type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(v2);
  OUTLINED_FUNCTION_23_13();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928380);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v3);
  return sub_2378319C8;
}

uint64_t sub_237832CEC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65546D6574737973 && a2 == 0xEA00000000007478;
  if (v2 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1936748641 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_23785BE30();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_237832DD8(char a1)
{
  if (a1) {
    return 1936748641;
  }
  else {
    return 0x65546D6574737973;
  }
}

uint64_t sub_237832E0C()
{
  return sub_237832DD8(*v0);
}

uint64_t sub_237832E14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_237832CEC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237832E3C(uint64_t a1)
{
  unint64_t v2 = sub_23783540C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_237832E78(uint64_t a1)
{
  unint64_t v2 = sub_23783540C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void AppLaunchDataModels.AppDisambiguationModel.encode(to:)()
{
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_43();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928388);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_36();
  sub_23783540C();
  OUTLINED_FUNCTION_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  sub_2378352F0((uint64_t)&unk_268928338);
  OUTLINED_FUNCTION_6_20();
  if (!v0)
  {
    type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(0);
    OUTLINED_FUNCTION_22_9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268928380);
    sub_237835458();
    OUTLINED_FUNCTION_12_14();
  }
  uint64_t v2 = OUTLINED_FUNCTION_23();
  v3(v2);
  OUTLINED_FUNCTION_92_0();
  OUTLINED_FUNCTION_121();
}

void AppLaunchDataModels.AppDisambiguationModel.init(from:)()
{
  OUTLINED_FUNCTION_6();
  uint64_t v2 = v1;
  v20[3] = v3;
  v20[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_268928380);
  OUTLINED_FUNCTION_1_2();
  void v20[2] = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_62();
  v20[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_2();
  v20[6] = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_4();
  v20[7] = v8;
  v20[9] = __swift_instantiateConcreteTypeFromMangledName(&qword_2689283C0);
  OUTLINED_FUNCTION_1_2();
  v20[5] = v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_35_6();
  uint64_t v12 = type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(v11);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_23783540C();
  OUTLINED_FUNCTION_108();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    v20[1] = v12;
    sub_2378352F0((uint64_t)&unk_268928368);
    sub_23785BD60();
    v20[0] = v15;
    OUTLINED_FUNCTION_38_0();
    v16();
    OUTLINED_FUNCTION_32_5();
    sub_23783561C();
    OUTLINED_FUNCTION_102();
    OUTLINED_FUNCTION_126();
    OUTLINED_FUNCTION_13_1();
    v17();
    uint64_t v18 = OUTLINED_FUNCTION_45_4();
    v19(v18);
    sub_237835698();
    OUTLINED_FUNCTION_64_3((uint64_t)v2);
  }
  OUTLINED_FUNCTION_9();
}

void sub_237833288()
{
}

void sub_2378332A0()
{
}

uint64_t (*AppLaunchDataModels.ButtonFallbackModel.buttonLabel.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_53_3((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t AppLaunchDataModels.ButtonFallbackModel.actionProperty.getter()
{
  return sub_2378390B0((void (*)(void))type metadata accessor for AppLaunchDataModels.ButtonFallbackModel, &qword_2689282F8);
}

uint64_t AppLaunchDataModels.ButtonFallbackModel.actionProperty.setter()
{
  sub_237859990();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = OUTLINED_FUNCTION_5_21(v1, v7);
  v3(v2);
  type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(0);
  OUTLINED_FUNCTION_23_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  sub_237859A00();
  uint64_t v4 = OUTLINED_FUNCTION_9_2();
  return v5(v4);
}

uint64_t (*AppLaunchDataModels.ButtonFallbackModel.actionProperty.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  uint64_t v2 = OUTLINED_FUNCTION_70_2((uint64_t)v1);
  type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(v2);
  OUTLINED_FUNCTION_23_13();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v3);
  return sub_2378319C8;
}

uint64_t sub_237833440(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x614C6E6F74747562 && a2 == 0xEB000000006C6562;
  if (v2 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72506E6F69746361 && a2 == 0xEE0079747265706FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_23785BE30();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_23783356C(char a1)
{
  if (a1) {
    return 0x72506E6F69746361;
  }
  else {
    return 0x614C6E6F74747562;
  }
}

uint64_t sub_2378335B8()
{
  return sub_23783356C(*v0);
}

uint64_t sub_2378335C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_237833440(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2378335E8(uint64_t a1)
{
  unint64_t v2 = sub_237835740();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_237833624(uint64_t a1)
{
  unint64_t v2 = sub_237835740();
  return MEMORY[0x270FA00B8](a1, v2);
}

void AppLaunchDataModels.ButtonFallbackModel.encode(to:)()
{
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_43();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689283D0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_36();
  sub_237835740();
  OUTLINED_FUNCTION_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  sub_2378352F0((uint64_t)&unk_268928338);
  OUTLINED_FUNCTION_6_20();
  if (!v0)
  {
    type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(0);
    OUTLINED_FUNCTION_22_9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
    sub_237835354((uint64_t)&unk_268928348);
    OUTLINED_FUNCTION_12_14();
  }
  uint64_t v2 = OUTLINED_FUNCTION_23();
  v3(v2);
  OUTLINED_FUNCTION_92_0();
  OUTLINED_FUNCTION_121();
}

void AppLaunchDataModels.ButtonFallbackModel.init(from:)()
{
  OUTLINED_FUNCTION_6();
  uint64_t v2 = v1;
  v20[3] = v3;
  v20[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  OUTLINED_FUNCTION_1_2();
  void v20[2] = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_62();
  v20[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_2();
  v20[4] = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_85_1(v8, v20[0]);
  v20[9] = __swift_instantiateConcreteTypeFromMangledName(&qword_2689283E0);
  OUTLINED_FUNCTION_1_2();
  v20[7] = v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_35_6();
  uint64_t v12 = type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(v11);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_237835740();
  OUTLINED_FUNCTION_108();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    v20[1] = v12;
    sub_2378352F0((uint64_t)&unk_268928368);
    sub_23785BD60();
    v20[0] = (uint64_t)v15;
    OUTLINED_FUNCTION_38_0();
    v16();
    OUTLINED_FUNCTION_32_5();
    sub_237835354((uint64_t)&unk_268928378);
    OUTLINED_FUNCTION_102();
    OUTLINED_FUNCTION_5_2();
    v17();
    uint64_t v18 = OUTLINED_FUNCTION_45_4();
    v19(v18);
    sub_237835698();
    OUTLINED_FUNCTION_64_3((uint64_t)v2);
  }
  OUTLINED_FUNCTION_9();
}

void sub_237833A78()
{
}

void sub_237833A90()
{
}

uint64_t (*AppLaunchDataModels.Device.name.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_53_3((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t AppLaunchDataModels.Device.id.getter()
{
  return sub_237833B20((void (*)(void))type metadata accessor for AppLaunchDataModels.Device);
}

uint64_t sub_237833B20(void (*a1)(void))
{
  a1(0);
  OUTLINED_FUNCTION_23_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  sub_2378599F0();
  return v2;
}

uint64_t AppLaunchDataModels.Device.id.setter(uint64_t a1, uint64_t a2)
{
  return sub_237833B88(a1, a2, (void (*)(void))type metadata accessor for AppLaunchDataModels.Device);
}

uint64_t sub_237833B88(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return sub_237859A00();
}

uint64_t (*AppLaunchDataModels.Device.id.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  *uint64_t v0 = v1;
  type metadata accessor for AppLaunchDataModels.Device(0);
  OUTLINED_FUNCTION_23_13();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  v1[4] = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t AppLaunchDataModels.Device.actionProperty.getter()
{
  return sub_237834F2C((void (*)(void))type metadata accessor for AppLaunchDataModels.Device);
}

uint64_t AppLaunchDataModels.Device.actionProperty.setter(uint64_t a1)
{
  return sub_237834F8C(a1, (void (*)(void))type metadata accessor for AppLaunchDataModels.Device);
}

uint64_t (*AppLaunchDataModels.Device.actionProperty.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  *uint64_t v0 = v1;
  type metadata accessor for AppLaunchDataModels.Device(0);
  OUTLINED_FUNCTION_41_7();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  v1[4] = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t AppLaunchDataModels.Device.hash(into:)()
{
  return sub_23785B670();
}

uint64_t static AppLaunchDataModels.Device.__derived_struct_equals(_:_:)()
{
  OUTLINED_FUNCTION_44_3();
  if ((sub_237859A10() & 1) == 0) {
    return 0;
  }
  uint64_t v0 = type metadata accessor for AppLaunchDataModels.Device(0);
  OUTLINED_FUNCTION_71_3(v0);
  if ((sub_237859A10() & 1) == 0) {
    return 0;
  }
  sub_237859990();
  sub_2378351FC((uint64_t)&unk_268928320);
  OUTLINED_FUNCTION_56_2();
  return sub_237859A10();
}

uint64_t sub_237833E94(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 25705 && a2 == 0xE200000000000000;
    if (v6 || (sub_23785BE30() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x72506E6F69746361 && a2 == 0xEE0079747265706FLL)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_23785BE30();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_237833FE0(char a1)
{
  if (!a1) {
    return 1701667182;
  }
  if (a1 == 1) {
    return 25705;
  }
  return 0x72506E6F69746361;
}

uint64_t sub_237834030()
{
  return sub_237833FE0(*v0);
}

uint64_t sub_237834038@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_237833E94(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237834060(uint64_t a1)
{
  unint64_t v2 = sub_23783578C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23783409C(uint64_t a1)
{
  unint64_t v2 = sub_23783578C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void AppLaunchDataModels.Device.encode(to:)()
{
}

uint64_t AppLaunchDataModels.Device.hashValue.getter()
{
  return sub_23785BEF0();
}

void AppLaunchDataModels.Device.init(from:)()
{
  OUTLINED_FUNCTION_6();
  uint64_t v2 = v1;
  v32[4] = v3;
  v32[6] = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  OUTLINED_FUNCTION_1_2();
  v32[3] = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_88_0(v6, v32[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_2();
  v32[7] = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_34_7();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_136(v10, v11, v12, v13, v14, v15, v16, v17, v32[0]);
  v32[10] = __swift_instantiateConcreteTypeFromMangledName(&qword_2689283F8);
  OUTLINED_FUNCTION_1_2();
  v32[8] = v18;
  MEMORY[0x270FA5388](v19);
  uint64_t v20 = OUTLINED_FUNCTION_90_0();
  uint64_t v21 = type metadata accessor for AppLaunchDataModels.Device(v20);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)v32 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = v2;
  OUTLINED_FUNCTION_120();
  sub_23783578C();
  OUTLINED_FUNCTION_94_0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1(v33);
  }
  else
  {
    v32[1] = v21;
    v32[2] = (uint64_t)v24;
    sub_2378352F0((uint64_t)&unk_268928368);
    OUTLINED_FUNCTION_21_13();
    uint64_t v25 = OUTLINED_FUNCTION_56_4();
    v26(v25);
    OUTLINED_FUNCTION_21_13();
    uint64_t v27 = OUTLINED_FUNCTION_43_5();
    v28(v27);
    OUTLINED_FUNCTION_70();
    sub_237835354((uint64_t)&unk_268928378);
    OUTLINED_FUNCTION_49_3();
    OUTLINED_FUNCTION_5_2();
    v29();
    uint64_t v30 = OUTLINED_FUNCTION_42_5();
    v31(v30);
    sub_237835698();
    OUTLINED_FUNCTION_64_3(v33);
  }
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_9();
}

uint64_t sub_237834518()
{
  return sub_23785BEF0();
}

void sub_237834600()
{
}

void sub_237834618()
{
}

uint64_t (*AppLaunchDataModels.DeviceDisambiguationModel.systemText.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_53_3((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t AppLaunchDataModels.DeviceDisambiguationModel.devices.getter()
{
  type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(0);
  return swift_bridgeObjectRetain();
}

uint64_t AppLaunchDataModels.DeviceDisambiguationModel.devices.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(0) + 20);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*AppLaunchDataModels.DeviceDisambiguationModel.devices.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_237834750(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65546D6574737973 && a2 == 0xEA00000000007478;
  if (v2 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73656369766564 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_23785BE30();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_23783484C(char a1)
{
  if (a1) {
    return 0x73656369766564;
  }
  else {
    return 0x65546D6574737973;
  }
}

uint64_t sub_237834888()
{
  return sub_23783484C(*v0);
}

uint64_t sub_237834890@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_237834750(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2378348B8(uint64_t a1)
{
  unint64_t v2 = sub_2378357D8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2378348F4(uint64_t a1)
{
  unint64_t v2 = sub_2378357D8();
  return MEMORY[0x270FA00B8](a1, v2);
}

void AppLaunchDataModels.DeviceDisambiguationModel.encode(to:)()
{
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_43();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928400);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_36();
  sub_2378357D8();
  OUTLINED_FUNCTION_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  sub_2378352F0((uint64_t)&unk_268928338);
  OUTLINED_FUNCTION_6_20();
  if (!v0)
  {
    type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268928410);
    sub_237835824();
    OUTLINED_FUNCTION_12_14();
  }
  uint64_t v2 = OUTLINED_FUNCTION_23();
  v3(v2);
  OUTLINED_FUNCTION_92_0();
  OUTLINED_FUNCTION_121();
}

void AppLaunchDataModels.DeviceDisambiguationModel.init(from:)()
{
  OUTLINED_FUNCTION_6();
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_28_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928428);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_84_1();
  uint64_t v7 = type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(v6);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_51_4();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2378357D8();
  sub_23785BF10();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    sub_2378352F0((uint64_t)&unk_268928368);
    sub_23785BD60();
    OUTLINED_FUNCTION_38_0();
    v9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268928410);
    OUTLINED_FUNCTION_32_5();
    sub_2378358C8();
    sub_23785BD60();
    OUTLINED_FUNCTION_21_0();
    v10();
    *(void *)(v1 + *(int *)(v7 + 20)) = v11;
    sub_237835698();
    OUTLINED_FUNCTION_64_3((uint64_t)v3);
  }
  OUTLINED_FUNCTION_9();
}

void sub_237834D00()
{
}

void sub_237834D18()
{
}

uint64_t type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(uint64_t a1)
{
  return sub_23777CAC4(a1, (uint64_t *)&unk_2689287D8);
}

uint64_t AppLaunchDataModels.ConfirmationViewModel.primaryAction.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  return sub_2378599F0();
}

uint64_t AppLaunchDataModels.ConfirmationViewModel.primaryAction.setter()
{
  sub_237859990();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = OUTLINED_FUNCTION_5_21(v1, v7);
  v3(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  sub_237859A00();
  uint64_t v4 = OUTLINED_FUNCTION_9_2();
  return v5(v4);
}

uint64_t (*AppLaunchDataModels.ConfirmationViewModel.primaryAction.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_53_3((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t AppLaunchDataModels.ConfirmationViewModel.primaryLabel.getter()
{
  return sub_237833B20((void (*)(void))type metadata accessor for AppLaunchDataModels.ConfirmationViewModel);
}

uint64_t AppLaunchDataModels.ConfirmationViewModel.primaryLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_237833B88(a1, a2, (void (*)(void))type metadata accessor for AppLaunchDataModels.ConfirmationViewModel);
}

uint64_t (*AppLaunchDataModels.ConfirmationViewModel.primaryLabel.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_113((uint64_t)v1);
  OUTLINED_FUNCTION_23_13();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t AppLaunchDataModels.ConfirmationViewModel.secondaryAction.getter()
{
  return sub_237834F2C((void (*)(void))type metadata accessor for AppLaunchDataModels.ConfirmationViewModel);
}

uint64_t sub_237834F2C(void (*a1)(void))
{
  return sub_2378599F0();
}

uint64_t AppLaunchDataModels.ConfirmationViewModel.secondaryAction.setter(uint64_t a1)
{
  return sub_237834F8C(a1, (void (*)(void))type metadata accessor for AppLaunchDataModels.ConfirmationViewModel);
}

uint64_t sub_237834F8C(uint64_t a1, void (*a2)(void))
{
  sub_237859990();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_8_0();
  v4();
  a2(0);
  OUTLINED_FUNCTION_41_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  sub_237859A00();
  OUTLINED_FUNCTION_33_2();
  return v5();
}

uint64_t (*AppLaunchDataModels.ConfirmationViewModel.secondaryAction.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_113((uint64_t)v1);
  OUTLINED_FUNCTION_41_7();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t type metadata accessor for AppLaunchDataModels.Device(uint64_t a1)
{
  return sub_23777CAC4(a1, (uint64_t *)&unk_2689287B8);
}

uint64_t type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(uint64_t a1)
{
  return sub_23777CAC4(a1, (uint64_t *)&unk_2689287C8);
}

uint64_t type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(uint64_t a1)
{
  return sub_23777CAC4(a1, (uint64_t *)&unk_2689287A8);
}

uint64_t type metadata accessor for AppLaunchDataModels.App(uint64_t a1)
{
  return sub_23777CAC4(a1, (uint64_t *)&unk_268928768);
}

uint64_t type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(uint64_t a1)
{
  return sub_23777CAC4(a1, (uint64_t *)&unk_268928790);
}

unint64_t sub_237835158()
{
  unint64_t result = qword_268928310;
  if (!qword_268928310)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689282F8);
    sub_2378351FC((uint64_t)&unk_268928318);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928310);
  }
  return result;
}

unint64_t sub_2378351FC(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_55_1(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_237835240()
{
  unint64_t result = qword_268928330;
  if (!qword_268928330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928330);
  }
  return result;
}

unint64_t sub_23783528C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_55_1(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689282F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_2378352F0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_55_1(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689282E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_237835354(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_55_1(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689282F8);
    sub_2378351FC((uint64_t)&unk_268928350);
    sub_2378351FC((uint64_t)&unk_268928358);
    unint64_t result = OUTLINED_FUNCTION_68_3();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_23783540C()
{
  unint64_t result = qword_268928390;
  if (!qword_268928390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928390);
  }
  return result;
}

unint64_t sub_237835458()
{
  unint64_t result = qword_268928398;
  if (!qword_268928398)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928380);
    sub_2378354D4();
    sub_237835578();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928398);
  }
  return result;
}

unint64_t sub_2378354D4()
{
  unint64_t result = qword_2689283A0;
  if (!qword_2689283A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689273E8);
    sub_2378351FC((uint64_t)&unk_2689283A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689283A0);
  }
  return result;
}

unint64_t sub_237835578()
{
  unint64_t result = qword_2689283B0;
  if (!qword_2689283B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689273E8);
    sub_2378351FC((uint64_t)&unk_2689283B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689283B0);
  }
  return result;
}

unint64_t sub_23783561C()
{
  unint64_t result = qword_2689283C8;
  if (!qword_2689283C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928380);
    sub_2378354D4();
    sub_237835578();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689283C8);
  }
  return result;
}

uint64_t sub_237835698()
{
  uint64_t v1 = OUTLINED_FUNCTION_116();
  v2(v1);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_92();
  v3();
  return v0;
}

uint64_t sub_2378356EC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_5_2();
  v3();
  return a1;
}

unint64_t sub_237835740()
{
  unint64_t result = qword_2689283D8;
  if (!qword_2689283D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689283D8);
  }
  return result;
}

unint64_t sub_23783578C()
{
  unint64_t result = qword_2689283F0;
  if (!qword_2689283F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689283F0);
  }
  return result;
}

unint64_t sub_2378357D8()
{
  unint64_t result = qword_268928408;
  if (!qword_268928408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928408);
  }
  return result;
}

unint64_t sub_237835824()
{
  unint64_t result = qword_268928418;
  if (!qword_268928418)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928410);
    sub_2378351FC((uint64_t)&unk_268928420);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928418);
  }
  return result;
}

unint64_t sub_2378358C8()
{
  unint64_t result = qword_268928430;
  if (!qword_268928430)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928410);
    sub_2378351FC((uint64_t)&unk_268928438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928430);
  }
  return result;
}

uint64_t AppLaunchDataModels.ConfirmationViewModel.secondaryLabel.getter()
{
  type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(0);
  OUTLINED_FUNCTION_73_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  sub_2378599F0();
  return v1;
}

uint64_t AppLaunchDataModels.ConfirmationViewModel.secondaryLabel.setter()
{
  return sub_237859A00();
}

uint64_t (*AppLaunchDataModels.ConfirmationViewModel.secondaryLabel.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_113((uint64_t)v1);
  OUTLINED_FUNCTION_73_1();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t sub_237835A5C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x417972616D697270 && a2 == 0xED00006E6F697463;
  if (v2 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x4C7972616D697270 && a2 == 0xEC0000006C656261;
    if (v6 || (sub_23785BE30() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x7261646E6F636573 && a2 == 0xEF6E6F6974634179;
      if (v7 || (sub_23785BE30() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x7261646E6F636573 && a2 == 0xEE006C6562614C79)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_23785BE30();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_237835C88(char a1)
{
  uint64_t result = 0x417972616D697270;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x4C7972616D697270;
      break;
    case 2:
    case 3:
      uint64_t result = 0x7261646E6F636573;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_237835D38()
{
  return sub_237835C88(*v0);
}

uint64_t sub_237835D40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_237835A5C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237835D68(uint64_t a1)
{
  unint64_t v2 = sub_237835FAC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_237835DA4(uint64_t a1)
{
  unint64_t v2 = sub_237835FAC();
  return MEMORY[0x270FA00B8](a1, v2);
}

void AppLaunchDataModels.ConfirmationViewModel.encode(to:)()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_43();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928440);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_36();
  sub_237835FAC();
  OUTLINED_FUNCTION_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  sub_237835354((uint64_t)&unk_268928348);
  OUTLINED_FUNCTION_12_14();
  if (!v0)
  {
    type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(0);
    OUTLINED_FUNCTION_22_9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
    sub_2378352F0((uint64_t)&unk_268928338);
    OUTLINED_FUNCTION_12_14();
    OUTLINED_FUNCTION_12_14();
    OUTLINED_FUNCTION_12_14();
  }
  OUTLINED_FUNCTION_17_0();
  v2();
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_9();
}

unint64_t sub_237835FAC()
{
  unint64_t result = qword_268928448;
  if (!qword_268928448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928448);
  }
  return result;
}

void AppLaunchDataModels.ConfirmationViewModel.init(from:)()
{
  OUTLINED_FUNCTION_6();
  uint64_t v4 = v3;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_2();
  uint64_t v24 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_36_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_17_13();
  uint64_t v26 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  OUTLINED_FUNCTION_1_2();
  uint64_t v25 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_82_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_17_13();
  uint64_t v28 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928450);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v14);
  uint64_t v15 = OUTLINED_FUNCTION_89_0();
  uint64_t v16 = type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(v15);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_50_4();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_237835FAC();
  sub_23785BF10();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    uint64_t v18 = v0;
    sub_237835354((uint64_t)&unk_268928378);
    sub_23785BD60();
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32);
    v19(v18, v28, v9);
    OUTLINED_FUNCTION_32_5();
    sub_2378352F0((uint64_t)&unk_268928368);
    sub_23785BD60();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v18 + *(int *)(v16 + 20), v26, v27);
    sub_23785BD60();
    v19(v18 + *(int *)(v16 + 24), v2, v9);
    sub_23785BD60();
    OUTLINED_FUNCTION_5_2();
    v20();
    OUTLINED_FUNCTION_38_0();
    v21();
    sub_237835698();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    uint64_t v22 = OUTLINED_FUNCTION_131();
    sub_2378356EC(v22, v23);
  }
  OUTLINED_FUNCTION_9();
}

void sub_2378364E0()
{
}

void sub_2378364F8()
{
}

uint64_t property wrapper backing initializer of AppLaunchDataModels.AppResultModel.adamId()
{
  return sub_2378599D0();
}

uint64_t property wrapper backing initializer of AppLaunchDataModels.AppResultModel.cardSectionData(uint64_t a1)
{
  return sub_237838F7C(a1, &qword_268928458);
}

void sub_237836564()
{
  OUTLINED_FUNCTION_23_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_26_1();
  sub_237859610();
  OUTLINED_FUNCTION_1_2();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_91_0();
  sub_237859840();
  OUTLINED_FUNCTION_1_2();
  uint64_t v29 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_9_0();
  sub_23783696C(v4, v2, v0);
  uint64_t v11 = sub_2378597E0();
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    uint64_t v28 = v2;
    uint64_t v14 = *(void (**)(uint64_t))(v7 + 16);
    uint64_t v13 = v7 + 16;
    unint64_t v15 = v11 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    uint64_t v30 = *(void *)(v13 + 56);
    uint64_t v31 = v14;
    swift_bridgeObjectRetain();
    uint64_t v32 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v16 = OUTLINED_FUNCTION_122();
      v31(v16);
      sub_2378351FC((uint64_t)&unk_2689289F0);
      uint64_t v17 = sub_23785B1F0();
      uint64_t v19 = v18;
      OUTLINED_FUNCTION_19_1();
      v20();
      uint64_t v21 = v32;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2378046F0(0, *(void *)(v32 + 16) + 1, 1, v32);
        uint64_t v21 = v25;
      }
      unint64_t v23 = *(void *)(v21 + 16);
      unint64_t v22 = *(void *)(v21 + 24);
      uint64_t v32 = v21;
      if (v23 >= v22 >> 1)
      {
        sub_2378046F0(v22 > 1, v23 + 1, 1, v21);
        uint64_t v32 = v26;
      }
      *(void *)(v32 + 16) = v23 + 1;
      uint64_t v24 = v32 + 16 * v23;
      *(void *)(v24 + 32) = v17;
      *(void *)(v24 + 40) = v19;
      v15 += v30;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease_n();
    uint64_t v2 = v28;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_237859820();
  sub_237859830();
  OUTLINED_FUNCTION_25_0();
  sub_237836D54();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  uint64_t v27 = *(void (**)(void))(v29 + 8);
  OUTLINED_FUNCTION_54_4();
  v27();
  OUTLINED_FUNCTION_54_4();
  v27();
  OUTLINED_FUNCTION_18_3();
}

uint64_t sub_23783696C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_237859610();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v42 = v6;
  uint64_t v43 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v40 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v41 = (char *)&v32 - v10;
  uint64_t v11 = sub_237859840();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v39 = a1;
  v38(v14, a1, v11);
  uint64_t v15 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v16 = sub_237859830();
  LOBYTE(a2) = (*(uint64_t (**)(uint64_t))(v15 + 48))(v16);
  swift_bridgeObjectRelease();
  if (a2)
  {
    uint64_t v17 = sub_2378597E0();
    uint64_t v18 = *(void *)(v17 + 16);
    uint64_t v19 = (void (*)(char *, uint64_t, uint64_t))v11;
    if (v18)
    {
      uint64_t v33 = v14;
      uint64_t v34 = v12;
      uint64_t v44 = MEMORY[0x263F8EE78];
      sub_2377EDD44(0, v18, 0);
      uint64_t v20 = v42;
      uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 16);
      uint64_t v22 = *(unsigned __int8 *)(v43 + 80);
      uint64_t v32 = v17;
      uint64_t v36 = (v22 + 32) & ~v22;
      uint64_t v37 = v21;
      uint64_t v23 = v17 + v36;
      uint64_t v24 = *(void *)(v43 + 72);
      uint64_t v35 = (void (**)(uint64_t, uint64_t))(v43 + 8);
      v43 += 16;
      uint64_t v25 = (void (**)(uint64_t, char *, uint64_t))(v43 + 16);
      uint64_t v38 = v19;
      uint64_t v39 = a3;
      uint64_t v26 = (uint64_t)v41;
      do
      {
        uint64_t v27 = (uint64_t)v40;
        v37(v40, v23, v20);
        sub_23783AD8C(v27, v26);
        (*v35)(v27, v20);
        uint64_t v28 = v44;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2377EDD44(0, *(void *)(v28 + 16) + 1, 1);
          uint64_t v28 = v44;
        }
        unint64_t v30 = *(void *)(v28 + 16);
        unint64_t v29 = *(void *)(v28 + 24);
        if (v30 >= v29 >> 1)
        {
          sub_2377EDD44(v29 > 1, v30 + 1, 1);
          uint64_t v28 = v44;
        }
        *(void *)(v28 + 16) = v30 + 1;
        uint64_t v26 = (uint64_t)v41;
        uint64_t v20 = v42;
        (*v25)(v28 + v36 + v30 * v24, v41, v42);
        uint64_t v44 = v28;
        v23 += v24;
        --v18;
        uint64_t v19 = v38;
        a3 = v39;
      }
      while (v18);
      swift_bridgeObjectRelease();
      uint64_t v14 = v33;
      uint64_t v12 = v34;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_2378597F0();
    return (*(uint64_t (**)(uint64_t, char *, void))(v12 + 32))(a3, v14, v19);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v38)(a3, v39, v11);
  }
}

uint64_t sub_237836D54()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268926F10);
  sub_2378599D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_5_2();
  v2(v0, v1);
  sub_2378599D0();
  type metadata accessor for AppLaunchDataModels.AppResultModel(0);
  sub_2378599D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928458);
  return sub_2378599D0();
}

void AppLaunchDataModels.AppResultModel.getCardSections()()
{
  OUTLINED_FUNCTION_23_0();
  uint64_t v1 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = OUTLINED_FUNCTION_83_1();
  type metadata accessor for AppLaunchDataModels.AppResultModel(v5);
  OUTLINED_FUNCTION_41_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928460);
  sub_2378599F0();
  uint64_t v6 = v22;
  uint64_t v23 = MEMORY[0x263F8EE78];
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = v0;
    uint64_t v8 = (unint64_t *)(v6 + 40);
    do
    {
      uint64_t v9 = *(v8 - 1);
      unint64_t v10 = *v8;
      id v11 = objc_allocWithZone(MEMORY[0x263F67B28]);
      sub_23778B224(v9, v10);
      sub_23778B224(v9, v10);
      id v12 = sub_23783D19C(v9, v10);
      if (v12)
      {
        uint64_t v13 = v12;
        id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F677D8]), sel_initWithProtobuf_, v12);

        uint64_t v15 = sub_237787078(v9, v10);
        if (v14)
        {
          MEMORY[0x237E22320](v15);
          if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_23785B7D0();
          }
          sub_23785B7F0();
          sub_23785B7C0();
        }
      }
      else
      {
        if (qword_2689266D8 != -1) {
          swift_once();
        }
        uint64_t v16 = __swift_project_value_buffer(v1, (uint64_t)qword_268928BC8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v16, v1);
        uint64_t v17 = sub_23785B490();
        os_log_type_t v18 = sub_23785B8B0();
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v19 = (uint8_t *)OUTLINED_FUNCTION_4_4();
          *(_WORD *)uint64_t v19 = 0;
          _os_log_impl(&dword_237778000, v17, v18, "AppLaunchDataModels: failed to decode sf card pb data", v19, 2u);
          uint64_t v0 = v21;
          OUTLINED_FUNCTION_5_3();
        }

        OUTLINED_FUNCTION_13_1();
        v20();
        sub_237787078(v9, v10);
      }
      v8 += 2;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_3();
}

uint64_t type metadata accessor for AppLaunchDataModels.AppResultModel(uint64_t a1)
{
  return sub_23777CAC4(a1, (uint64_t *)&unk_2689287E8);
}

uint64_t AppLaunchDataModels.AppResultModel.hash(into:)()
{
  return sub_23785B670();
}

uint64_t static AppLaunchDataModels.AppResultModel.__derived_struct_equals(_:_:)()
{
  OUTLINED_FUNCTION_44_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268926F10);
  sub_23783D48C((uint64_t)&unk_268928498);
  OUTLINED_FUNCTION_117();
  if ((sub_237859A10() & 1) == 0) {
    return 0;
  }
  uint64_t v0 = type metadata accessor for AppLaunchDataModels.AppResultModel(0);
  OUTLINED_FUNCTION_71_3(v0);
  if ((sub_237859A10() & 1) == 0) {
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928458);
  sub_23783D628((uint64_t)&unk_2689284A0);
  OUTLINED_FUNCTION_117();
  return sub_237859A10();
}

uint64_t sub_237837350(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64496D616461 && a2 == 0xE600000000000000;
  if (v2 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
    if (v6 || (sub_23785BE30() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x7463655364726163 && a2 == 0xEF617461446E6F69)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_23785BE30();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_2378374BC(char a1)
{
  if (!a1) {
    return 0x64496D616461;
  }
  if (a1 == 1) {
    return 0x6449656C646E7562;
  }
  return 0x7463655364726163;
}

uint64_t sub_23783751C()
{
  return sub_2378374BC(*v0);
}

uint64_t sub_237837524@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_237837350(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23783754C(uint64_t a1)
{
  unint64_t v2 = sub_23783D384();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_237837588(uint64_t a1)
{
  unint64_t v2 = sub_23783D384();
  return MEMORY[0x270FA00B8](a1, v2);
}

void AppLaunchDataModels.AppResultModel.encode(to:)()
{
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_43();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689284B0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_36();
  sub_23783D384();
  OUTLINED_FUNCTION_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
  sub_23783D3D0((uint64_t)&unk_2689284C0);
  OUTLINED_FUNCTION_6_20();
  if (!v0)
  {
    type metadata accessor for AppLaunchDataModels.AppResultModel(0);
    OUTLINED_FUNCTION_22_9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
    sub_2378352F0((uint64_t)&unk_268928338);
    OUTLINED_FUNCTION_12_14();
    OUTLINED_FUNCTION_70();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268928460);
    sub_23783D4E8();
    OUTLINED_FUNCTION_67_3();
    OUTLINED_FUNCTION_12_14();
  }
  uint64_t v2 = OUTLINED_FUNCTION_23();
  v3(v2);
  OUTLINED_FUNCTION_92_0();
  OUTLINED_FUNCTION_121();
}

uint64_t AppLaunchDataModels.AppResultModel.hashValue.getter()
{
  return sub_23785BEF0();
}

void AppLaunchDataModels.AppResultModel.init(from:)()
{
  OUTLINED_FUNCTION_6();
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928460);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_45_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_61();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
  OUTLINED_FUNCTION_1_2();
  uint64_t v17 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_62();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928500);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_52_4();
  type metadata accessor for AppLaunchDataModels.AppResultModel(0);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_30_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268926F10);
  sub_2378599D0();
  id v11 = (void *)OUTLINED_FUNCTION_119();
  __swift_project_boxed_opaque_existential_1(v11, v12);
  sub_23783D384();
  sub_23785BF10();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1(v4);
    OUTLINED_FUNCTION_5_2();
    v13();
  }
  else
  {
    sub_23783D3D0((uint64_t)&unk_268928508);
    sub_23785BD60();
    (*(void (**)(uint64_t, uint64_t))(v17 + 40))(v1, v2);
    sub_2378352F0((uint64_t)&unk_268928368);
    sub_23785BD60();
    OUTLINED_FUNCTION_38_0();
    v14();
    sub_23783D6D8();
    sub_23785BD60();
    OUTLINED_FUNCTION_5_2();
    v15();
    OUTLINED_FUNCTION_59_2();
    v16();
    sub_237835698();
    __swift_destroy_boxed_opaque_existential_1(v4);
    sub_2378356EC(v1, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultModel);
  }
  OUTLINED_FUNCTION_9();
}

uint64_t sub_237837CB0()
{
  return sub_23785BEF0();
}

void sub_237837DD0()
{
}

void sub_237837DE8()
{
}

uint64_t _s20SiriAppLaunchIntents0bC10DataModelsO0B0V4nameSSvg_0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  sub_2378599F0();
  return v1;
}

uint64_t _s20SiriAppLaunchIntents0bC10DataModelsO0B0V4nameSSvs_0()
{
  return sub_237859A00();
}

uint64_t (*AppLaunchDataModels.AppResultSashModel.text.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_53_3((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t AppLaunchDataModels.AppResultSashModel.marketplaceId.getter()
{
  return sub_237833B20((void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultSashModel);
}

uint64_t AppLaunchDataModels.AppResultSashModel.marketplaceId.setter(uint64_t a1, uint64_t a2)
{
  return sub_237833B88(a1, a2, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultSashModel);
}

uint64_t (*AppLaunchDataModels.AppResultSashModel.marketplaceId.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  *uint64_t v0 = v1;
  type metadata accessor for AppLaunchDataModels.AppResultSashModel(0);
  OUTLINED_FUNCTION_23_13();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  v1[4] = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t _s20SiriAppLaunchIntents0bC10DataModelsO0B0V14actionProperty10SnippetKit06ActionH0VvpfP_0()
{
  sub_237859990();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = OUTLINED_FUNCTION_5_21(v1, v7);
  v3(v2);
  sub_2378599D0();
  uint64_t v4 = OUTLINED_FUNCTION_9_2();
  return v5(v4);
}

uint64_t AppLaunchDataModels.AppResultSashModel.action.getter()
{
  return sub_237834F2C((void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultSashModel);
}

uint64_t AppLaunchDataModels.AppResultSashModel.action.setter(uint64_t a1)
{
  return sub_237834F8C(a1, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultSashModel);
}

uint64_t (*AppLaunchDataModels.AppResultSashModel.action.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  *uint64_t v0 = v1;
  type metadata accessor for AppLaunchDataModels.AppResultSashModel(0);
  OUTLINED_FUNCTION_41_7();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  v1[4] = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

void sub_237838098()
{
  OUTLINED_FUNCTION_23_0();
  uint64_t v38 = v4;
  uint64_t v39 = v5;
  uint64_t v35 = v6;
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_116();
  sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v36 = v9;
  uint64_t v37 = v10;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_84_1();
  sub_237859990();
  OUTLINED_FUNCTION_1_2();
  uint64_t v34 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_40_0();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v32 - v14;
  uint64_t v16 = type metadata accessor for AppLaunchDataModels.AppResultSashModel(0);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_28_6();
  uint64_t v18 = OUTLINED_FUNCTION_56_2();
  uint64_t v21 = sub_237838500(v18, v19, v20, v8);
  v32[1] = v8;
  uint64_t v36 = v15;
  uint64_t v37 = v3;
  uint64_t v22 = v38;
  uint64_t v40 = v21;
  uint64_t v41 = v23;
  sub_2378599D0();
  uint64_t v33 = v2;
  uint64_t v40 = v1;
  uint64_t v41 = v0;
  swift_bridgeObjectRetain();
  sub_2378599D0();
  if (v1 == 0xD000000000000012 && v0 == 0x8000000237866EB0 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v24 = static AppSearchCommands.searchAppStoreAceCommand(appName:)();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268926DC8);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_23785CD50;
    uint64_t v26 = sub_2378599C0();
    uint64_t v27 = MEMORY[0x263F771C8];
    *(void *)(v25 + 56) = v26;
    *(void *)(v25 + 64) = v27;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v25 + 32));
    uint64_t *boxed_opaque_existential_0 = (uint64_t)v24;
    *((unsigned char *)boxed_opaque_existential_0 + 8) = 0;
    (*(void (**)(void))(*(void *)(v26 - 8) + 104))();
    sub_2378599A0();
  }
  else
  {
    static AppSearchCommands.searchMarketplaceActionProperty(appName:marketplace:)(v35, v22, v1, v0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_0();
  v29();
  sub_2378599D0();
  OUTLINED_FUNCTION_19_1();
  v30();
  uint64_t v31 = v39;
  sub_23783E208();
  __swift_storeEnumTagSinglePayload(v31, 0, 1, v16);
  OUTLINED_FUNCTION_18_3();
}

uint64_t sub_237838500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = a3;
  uint64_t v5 = sub_23785B4B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23785A650();
  type metadata accessor for LocUtil();
  uint64_t v9 = swift_initStackObject() + 16;
  sub_23778EF44(&v19, v9);
  sub_23784A878(0x45524F4D5F454553, 0xE800000000000000);
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689277C8);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_23785CD50;
    *(void *)(v11 + 56) = MEMORY[0x263F8D310];
    *(void *)(v11 + 64) = sub_2377D50A0();
    *(void *)(v11 + 32) = v20;
    *(void *)(v11 + 40) = a4;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_23785B6C0();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    __swift_destroy_boxed_opaque_existential_1(v9);
  }
  else
  {
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v5, (uint64_t)qword_268928BC8);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
    uint64_t v13 = sub_23785B490();
    os_log_type_t v14 = sub_23785B8B0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_237778000, v13, v14, "AppResultSashModel.getSeeMoreText unable to get localized system text for snippet", v15, 2u);
      MEMORY[0x237E23210](v15, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    sub_237794E38();
    swift_allocError();
    *uint64_t v16 = 7;
    swift_willThrow();
    swift_setDeallocating();
    __swift_destroy_boxed_opaque_existential_1(v9);
  }
  return v5;
}

uint64_t sub_2378387D0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (v2 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6C7074656B72616DLL && a2 == 0xED00006449656361;
    if (v6 || (sub_23785BE30() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_23785BE30();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_23783892C(char a1)
{
  if (!a1) {
    return 1954047348;
  }
  if (a1 == 1) {
    return 0x6C7074656B72616DLL;
  }
  return 0x6E6F69746361;
}

uint64_t sub_237838984()
{
  return sub_23783892C(*v0);
}

uint64_t sub_23783898C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2378387D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2378389B4(uint64_t a1)
{
  unint64_t v2 = sub_23783D7EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2378389F0(uint64_t a1)
{
  unint64_t v2 = sub_23783D7EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

void AppLaunchDataModels.AppResultSashModel.encode(to:)()
{
}

void sub_237838A7C()
{
  OUTLINED_FUNCTION_6();
  uint64_t v9 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(v6);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_28_6();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3();
  sub_23785BF20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  sub_2378352F0((uint64_t)&unk_268928338);
  sub_23785BDD0();
  if (!v0)
  {
    v9(0);
    OUTLINED_FUNCTION_103();
    OUTLINED_FUNCTION_12_14();
    OUTLINED_FUNCTION_70();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
    sub_237835354((uint64_t)&unk_268928348);
    OUTLINED_FUNCTION_67_3();
    OUTLINED_FUNCTION_12_14();
  }
  OUTLINED_FUNCTION_126();
  OUTLINED_FUNCTION_13_1();
  v8();
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_9();
}

void AppLaunchDataModels.AppResultSashModel.init(from:)()
{
  OUTLINED_FUNCTION_6();
  uint64_t v2 = v1;
  v32[4] = v3;
  v32[6] = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  OUTLINED_FUNCTION_1_2();
  v32[3] = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_88_0(v6, v32[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_2();
  v32[7] = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_34_7();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_136(v10, v11, v12, v13, v14, v15, v16, v17, v32[0]);
  v32[10] = __swift_instantiateConcreteTypeFromMangledName(&qword_268928528);
  OUTLINED_FUNCTION_1_2();
  v32[8] = v18;
  MEMORY[0x270FA5388](v19);
  uint64_t v20 = OUTLINED_FUNCTION_90_0();
  uint64_t v21 = type metadata accessor for AppLaunchDataModels.AppResultSashModel(v20);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v22);
  id v24 = (char *)v32 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = v2;
  OUTLINED_FUNCTION_120();
  sub_23783D7EC();
  OUTLINED_FUNCTION_94_0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1(v33);
  }
  else
  {
    v32[1] = v21;
    void v32[2] = (uint64_t)v24;
    sub_2378352F0((uint64_t)&unk_268928368);
    OUTLINED_FUNCTION_21_13();
    uint64_t v25 = OUTLINED_FUNCTION_56_4();
    v26(v25);
    OUTLINED_FUNCTION_21_13();
    uint64_t v27 = OUTLINED_FUNCTION_43_5();
    v28(v27);
    OUTLINED_FUNCTION_70();
    sub_237835354((uint64_t)&unk_268928378);
    OUTLINED_FUNCTION_49_3();
    OUTLINED_FUNCTION_5_2();
    v29();
    uint64_t v30 = OUTLINED_FUNCTION_42_5();
    v31(v30);
    sub_237835698();
    OUTLINED_FUNCTION_64_3(v33);
  }
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_9();
}

void sub_237838F40()
{
}

void sub_237838F58()
{
}

uint64_t property wrapper backing initializer of AppLaunchDataModels.AppResultWrapperModel.results(uint64_t a1)
{
  return sub_237838F7C(a1, &qword_268928530);
}

uint64_t sub_237838F7C(uint64_t a1, uint64_t *a2)
{
  return sub_2378599D0();
}

uint64_t AppLaunchDataModels.AppResultWrapperModel.results.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928538);
  sub_2378599F0();
  return v1;
}

uint64_t AppLaunchDataModels.AppResultWrapperModel.results.setter()
{
  return sub_237859A00();
}

uint64_t (*AppLaunchDataModels.AppResultWrapperModel.results.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_53_3((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928538);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t property wrapper backing initializer of AppLaunchDataModels.AppResultWrapperModel.seeMoreSash()
{
  return sub_23783A260();
}

uint64_t AppLaunchDataModels.AppResultWrapperModel.seeMoreSash.getter()
{
  return sub_2378390B0((void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultWrapperModel, &qword_268928548);
}

uint64_t sub_2378390B0(void (*a1)(void), uint64_t *a2)
{
  return sub_2378599F0();
}

uint64_t AppLaunchDataModels.AppResultWrapperModel.seeMoreSash.setter(uint64_t a1)
{
  return sub_23783A340(a1, &qword_268928540, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultWrapperModel, &qword_268928548);
}

uint64_t (*AppLaunchDataModels.AppResultWrapperModel.seeMoreSash.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  uint64_t v2 = OUTLINED_FUNCTION_70_2((uint64_t)v1);
  type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(v2);
  OUTLINED_FUNCTION_23_13();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928548);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v3);
  return sub_2378319C8;
}

void sub_23783918C()
{
  OUTLINED_FUNCTION_23_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928540);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_24_9();
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_134();
  type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(v11);
  uint64_t v12 = type metadata accessor for AppLaunchDataModels.AppResultSashModel(0);
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v12);
  sub_23783DD98();
  OUTLINED_FUNCTION_131();
  sub_2378599D0();
  sub_237799238(v0, &qword_268928540);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928530);
  sub_2378599D0();
  unint64_t v13 = *(void *)(v8 + 16);
  swift_bridgeObjectRelease();
  if (v13 < 2)
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = v4;
    uint64_t v15 = v2;
LABEL_7:
    sub_2377F970C(v14, v15);
    goto LABEL_8;
  }
  if (!v6)
  {
    uint64_t v14 = v4;
    uint64_t v15 = v2;
    goto LABEL_7;
  }
  if (v2)
  {
    sub_237838098();
    sub_23783DD98();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268928548);
    sub_237859A00();
    sub_237799238(v0, &qword_268928540);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
LABEL_8:
  OUTLINED_FUNCTION_18_3();
}

void sub_237839350(uint64_t a1, uint64_t a2)
{
  sub_237859840();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_61();
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v2, a1);
  sub_237781F08(a2, (uint64_t)v7);
  sub_237836564();
}

void AppLaunchDataModels.AppResultWrapperModel.getCard()()
{
  OUTLINED_FUNCTION_23_0();
  uint64_t v46 = type metadata accessor for AppLaunchDataModels.AppResultModel(0);
  OUTLINED_FUNCTION_1_2();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_89_0();
  uint64_t v4 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_40_0();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v40 - v9;
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v4, (uint64_t)qword_268928BC8);
  uint64_t v12 = v6;
  unint64_t v13 = *(void (**)(void))(v6 + 16);
  uint64_t v52 = v6 + 16;
  uint64_t v53 = v11;
  uint64_t v51 = v13;
  v13(v10);
  uint64_t v14 = sub_23785B490();
  os_log_type_t v15 = sub_23785B890();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_4_4();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_237778000, v14, v15, "AppSearchResultWrapperModel: returning SFCard with results", v16, 2u);
    OUTLINED_FUNCTION_5_3();
  }

  OUTLINED_FUNCTION_119();
  uint64_t v49 = v12 + 8;
  uint64_t v50 = v17;
  OUTLINED_FUNCTION_33_2();
  v18();
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F677D0]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928538);
  sub_2378599F0();
  uint64_t v20 = v55;
  unint64_t v21 = MEMORY[0x263F8EE78];
  uint64_t v55 = MEMORY[0x263F8EE78];
  uint64_t v45 = *(void *)(v20 + 16);
  if (v45)
  {
    uint64_t v40 = v20;
    id v41 = v19;
    unint64_t v44 = v20 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    uint64_t v43 = *(void *)(v2 + 72);
    swift_bridgeObjectRetain();
    uint64_t v22 = 0;
    uint64_t v42 = v0;
    do
    {
      uint64_t v48 = v22;
      sub_237835698();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268928460);
      sub_2378599F0();
      unint64_t v23 = v54;
      unint64_t v54 = v21;
      uint64_t v24 = *(void *)(v23 + 16);
      if (v24)
      {
        swift_bridgeObjectRetain();
        unint64_t v47 = v23;
        uint64_t v25 = (unint64_t *)(v23 + 40);
        do
        {
          uint64_t v27 = *(v25 - 1);
          unint64_t v26 = *v25;
          id v28 = objc_allocWithZone(MEMORY[0x263F67B28]);
          sub_23778B224(v27, v26);
          sub_23778B224(v27, v26);
          id v29 = sub_23783D19C(v27, v26);
          if (v29)
          {
            uint64_t v30 = v29;
            id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F677D8]), sel_initWithProtobuf_, v29);

            uint64_t v32 = sub_237787078(v27, v26);
            if (v31)
            {
              MEMORY[0x237E22320](v32);
              if (*(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_23785B7D0();
              }
              OUTLINED_FUNCTION_25_0();
              sub_23785B7F0();
              sub_23785B7C0();
            }
          }
          else
          {
            OUTLINED_FUNCTION_8_0();
            v33();
            uint64_t v34 = sub_23785B490();
            os_log_type_t v35 = sub_23785B8B0();
            if (os_log_type_enabled(v34, v35))
            {
              uint64_t v36 = (uint8_t *)OUTLINED_FUNCTION_4_4();
              *(_WORD *)uint64_t v36 = 0;
              _os_log_impl(&dword_237778000, v34, v35, "AppLaunchDataModels: failed to decode sf card pb data", v36, 2u);
              OUTLINED_FUNCTION_5_3();
            }

            OUTLINED_FUNCTION_17_0();
            v37();
            sub_237787078(v27, v26);
          }
          v25 += 2;
          --v24;
        }
        while (v24);
        swift_bridgeObjectRelease();
        unint64_t v38 = v54;
        uint64_t v0 = v42;
        unint64_t v21 = MEMORY[0x263F8EE78];
      }
      else
      {
        unint64_t v38 = v21;
      }
      swift_bridgeObjectRelease();
      uint64_t v22 = v48 + 1;
      sub_2378356EC(v0, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultModel);
      sub_237831748(v38);
    }
    while (v22 != v45);
    swift_bridgeObjectRelease_n();
    uint64_t v39 = v55;
    id v19 = v41;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v39 = MEMORY[0x263F8EE78];
  }
  sub_23783D858(v39, v19);
  OUTLINED_FUNCTION_18_3();
}

void AppLaunchDataModels.AppResultWrapperModel.getAdamIds()()
{
  OUTLINED_FUNCTION_23_0();
  uint64_t v1 = type metadata accessor for AppLaunchDataModels.AppResultModel(0);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  OUTLINED_FUNCTION_50_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928538);
  sub_2378599F0();
  uint64_t v3 = *(void *)(v12 + 16);
  if (v3)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_2377EDA4C(0, v3, 0);
    unint64_t v4 = v12 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    uint64_t v5 = *(void *)(v2 + 72);
    uint64_t v6 = v14;
    do
    {
      sub_237835698();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
      sub_2378599F0();
      if (v13) {
        uint64_t v7 = v12;
      }
      else {
        uint64_t v7 = 12589;
      }
      if (v13) {
        unint64_t v8 = v13;
      }
      else {
        unint64_t v8 = 0xE200000000000000;
      }
      sub_2378356EC(v0, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultModel);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2377EDA4C(0, *(void *)(v6 + 16) + 1, 1);
        uint64_t v6 = v14;
      }
      unint64_t v10 = *(void *)(v6 + 16);
      unint64_t v9 = *(void *)(v6 + 24);
      if (v10 >= v9 >> 1)
      {
        sub_2377EDA4C(v9 > 1, v10 + 1, 1);
        uint64_t v6 = v14;
      }
      *(void *)(v6 + 16) = v10 + 1;
      uint64_t v11 = v6 + 16 * v10;
      *(void *)(v11 + 32) = v7;
      *(void *)(v11 + 40) = v8;
      v4 += v5;
      --v3;
    }
    while (v3);
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_3();
}

uint64_t sub_237839A7C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73746C75736572 && a2 == 0xE700000000000000;
  if (v2 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5365726F4D656573 && a2 == 0xEB00000000687361)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_23785BE30();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_237839B84(char a1)
{
  if (a1) {
    return 0x5365726F4D656573;
  }
  else {
    return 0x73746C75736572;
  }
}

uint64_t sub_237839BC4()
{
  return sub_237839B84(*v0);
}

uint64_t sub_237839BCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_237839A7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237839BF4(uint64_t a1)
{
  unint64_t v2 = sub_23783D8CC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_237839C30(uint64_t a1)
{
  unint64_t v2 = sub_23783D8CC();
  return MEMORY[0x270FA00B8](a1, v2);
}

void AppLaunchDataModels.AppResultWrapperModel.encode(to:)()
{
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_43();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928550);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_36();
  sub_23783D8CC();
  OUTLINED_FUNCTION_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928538);
  sub_23783D918();
  OUTLINED_FUNCTION_6_20();
  if (!v0)
  {
    type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(0);
    OUTLINED_FUNCTION_22_9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268928548);
    sub_23783DADC();
    OUTLINED_FUNCTION_12_14();
  }
  uint64_t v2 = OUTLINED_FUNCTION_23();
  v3(v2);
  OUTLINED_FUNCTION_92_0();
  OUTLINED_FUNCTION_121();
}

void AppLaunchDataModels.AppResultWrapperModel.init(from:)()
{
  OUTLINED_FUNCTION_6();
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928548);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_52_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928538);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_86_0(v6, v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689285B0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_30_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928540);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_24_9();
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = OUTLINED_FUNCTION_133();
  uint64_t v11 = type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(v10);
  uint64_t v12 = OUTLINED_FUNCTION_2_0(v11);
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = OUTLINED_FUNCTION_61_3();
  uint64_t v14 = type metadata accessor for AppLaunchDataModels.AppResultSashModel(v13);
  OUTLINED_FUNCTION_118(v14);
  sub_23783DD98();
  OUTLINED_FUNCTION_131();
  sub_2378599D0();
  uint64_t v15 = OUTLINED_FUNCTION_122();
  sub_237799238(v15, v16);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_23783D8CC();
  OUTLINED_FUNCTION_95();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    uint64_t v17 = OUTLINED_FUNCTION_96();
    v18(v17);
  }
  else
  {
    sub_23783DCA0();
    OUTLINED_FUNCTION_60_2();
    OUTLINED_FUNCTION_38_0();
    v19();
    OUTLINED_FUNCTION_32_5();
    sub_23783DD1C();
    OUTLINED_FUNCTION_33_9();
    OUTLINED_FUNCTION_5_2();
    v20();
    uint64_t v21 = OUTLINED_FUNCTION_72_3();
    v22(v21);
    sub_237835698();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    sub_2378356EC(v1, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultWrapperModel);
  }
  OUTLINED_FUNCTION_9();
}

void sub_23783A02C()
{
}

void sub_23783A044()
{
}

uint64_t property wrapper backing initializer of AppLaunchDataModels.AppOffloadedModel.result(uint64_t a1)
{
  type metadata accessor for AppLaunchDataModels.AppResultModel(0);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_28_6();
  sub_237835698();
  sub_2378599D0();
  return sub_2378356EC(a1, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultModel);
}

uint64_t AppLaunchDataModels.AppOffloadedModel.result.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
  return sub_2378599F0();
}

uint64_t AppLaunchDataModels.AppOffloadedModel.result.setter(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppLaunchDataModels.AppResultModel(0);
  uint64_t v3 = OUTLINED_FUNCTION_2_0(v2);
  MEMORY[0x270FA5388](v3);
  sub_237835698();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
  sub_237859A00();
  return sub_2378356EC(a1, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultModel);
}

uint64_t (*AppLaunchDataModels.AppOffloadedModel.result.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_53_3((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v2);
  return sub_2378319C8;
}

uint64_t property wrapper backing initializer of AppLaunchDataModels.AppOffloadedModel.confirmReinstallAction()
{
  return sub_23783A260();
}

uint64_t sub_23783A260()
{
  OUTLINED_FUNCTION_44_3();
  __swift_instantiateConcreteTypeFromMangledName(v2);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_51_4();
  sub_23783DD98();
  sub_2378599D0();
  return sub_237799238(v1, v0);
}

uint64_t AppLaunchDataModels.AppOffloadedModel.confirmReinstallAction.getter()
{
  return sub_2378390B0((void (*)(void))type metadata accessor for AppLaunchDataModels.AppOffloadedModel, &qword_2689285D0);
}

uint64_t AppLaunchDataModels.AppOffloadedModel.confirmReinstallAction.setter(uint64_t a1)
{
  return sub_23783A340(a1, &qword_268927838, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppOffloadedModel, &qword_2689285D0);
}

uint64_t sub_23783A340(uint64_t a1, uint64_t *a2, void (*a3)(void), uint64_t *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v9 = OUTLINED_FUNCTION_2_0(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_61();
  sub_23783DD98();
  a3(0);
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_237859A00();
  return sub_237799238(a1, a2);
}

uint64_t (*AppLaunchDataModels.AppOffloadedModel.confirmReinstallAction.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_15();
  uint64_t v2 = OUTLINED_FUNCTION_70_2((uint64_t)v1);
  type metadata accessor for AppLaunchDataModels.AppOffloadedModel(v2);
  OUTLINED_FUNCTION_23_13();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689285D0);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_11_13(v3);
  return sub_2378319C8;
}

void sub_23783A454(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);
  free(v1);
}

id AppLaunchDataModels.AppOffloadedModel.getCard()()
{
  uint64_t v1 = type metadata accessor for AppLaunchDataModels.AppResultModel(0);
  uint64_t v2 = OUTLINED_FUNCTION_2_0(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_83_1();
  uint64_t v3 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_9_0();
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v3, (uint64_t)qword_268928BC8);
  OUTLINED_FUNCTION_8_0();
  v5();
  uint64_t v6 = sub_23785B490();
  os_log_type_t v7 = sub_23785B890();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_4_4();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_237778000, v6, v7, "AppOffloadedModel: returning SFCard", v8, 2u);
    OUTLINED_FUNCTION_5_3();
  }

  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_21_0();
  v9();
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F677D0]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
  sub_2378599F0();
  AppLaunchDataModels.AppResultModel.getCardSections()();
  uint64_t v12 = v11;
  sub_2378356EC(v0, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultModel);
  sub_23783D858(v12, v10);
  return v10;
}

Swift::String __swiftcall AppLaunchDataModels.AppOffloadedModel.getAdamId()()
{
  uint64_t v1 = type metadata accessor for AppLaunchDataModels.AppResultModel(0);
  uint64_t v2 = OUTLINED_FUNCTION_2_0(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_50_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
  sub_2378599F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
  sub_2378599F0();
  sub_2378356EC(v0, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppResultModel);
  if (v7) {
    uint64_t v3 = v6;
  }
  else {
    uint64_t v3 = 12589;
  }
  if (v7) {
    uint64_t v4 = v7;
  }
  else {
    uint64_t v4 = (void *)0xE200000000000000;
  }
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t sub_23783A738(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746C75736572 && a2 == 0xE600000000000000;
  if (v2 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000002378676D0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_23785BE30();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_23783A820()
{
  return sub_23785BEF0();
}

uint64_t sub_23783A860(char a1)
{
  if (a1) {
    return 0xD000000000000016;
  }
  else {
    return 0x746C75736572;
  }
}

uint64_t sub_23783A898()
{
  return sub_23783A820();
}

uint64_t sub_23783A8B4()
{
  return sub_23783A860(*v0);
}

uint64_t sub_23783A8BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23783A738(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23783A8E4(uint64_t a1)
{
  unint64_t v2 = sub_23783DE0C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23783A920(uint64_t a1)
{
  unint64_t v2 = sub_23783DE0C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void AppLaunchDataModels.AppOffloadedModel.encode(to:)()
{
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_43();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689285D8);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_36();
  sub_23783DE0C();
  OUTLINED_FUNCTION_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
  sub_23783DE58((uint64_t)&unk_2689285E8);
  OUTLINED_FUNCTION_6_20();
  if (!v0)
  {
    type metadata accessor for AppLaunchDataModels.AppOffloadedModel(0);
    OUTLINED_FUNCTION_22_9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689285D0);
    sub_23783DF10();
    OUTLINED_FUNCTION_12_14();
  }
  uint64_t v2 = OUTLINED_FUNCTION_23();
  v3(v2);
  OUTLINED_FUNCTION_92_0();
  OUTLINED_FUNCTION_121();
}

void AppLaunchDataModels.AppOffloadedModel.init(from:)()
{
  OUTLINED_FUNCTION_6();
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689285D0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_52_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_86_0(v7, v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928608);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_30_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268927838);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_24_9();
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_133();
  uint64_t v12 = type metadata accessor for AppLaunchDataModels.AppOffloadedModel(v11);
  uint64_t v13 = OUTLINED_FUNCTION_2_0(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_61_3();
  uint64_t v14 = sub_237859990();
  OUTLINED_FUNCTION_118(v14);
  sub_23783DD98();
  sub_2378599D0();
  sub_237799238(v1, &qword_268927838);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_23783DE0C();
  OUTLINED_FUNCTION_95();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    uint64_t v15 = OUTLINED_FUNCTION_96();
    v16(v15);
  }
  else
  {
    sub_23783DE58((uint64_t)&unk_268928610);
    OUTLINED_FUNCTION_60_2();
    OUTLINED_FUNCTION_38_0();
    v17();
    OUTLINED_FUNCTION_32_5();
    sub_23783E0D4();
    OUTLINED_FUNCTION_33_9();
    OUTLINED_FUNCTION_5_2();
    v18();
    uint64_t v19 = OUTLINED_FUNCTION_72_3();
    v20(v19);
    sub_237835698();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    sub_2378356EC(v2, (void (*)(void))type metadata accessor for AppLaunchDataModels.AppOffloadedModel);
  }
  OUTLINED_FUNCTION_9();
}

void sub_23783AD5C()
{
}

void sub_23783AD74()
{
}

uint64_t sub_23783AD8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v3 = sub_23785B4B0();
  uint64_t v45 = *(void *)(v3 - 8);
  uint64_t v46 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v44 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_237859610();
  uint64_t v50 = *(void *)(v5 - 8);
  uint64_t v51 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v43 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689289F8);
  MEMORY[0x270FA5388](v7 - 8);
  unint64_t v47 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_2378595B0();
  uint64_t v9 = *(void *)(v48 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v48);
  v42[1] = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v42 - v12;
  uint64_t v14 = sub_2378598D0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_2378597B0();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a1;
  sub_2378595E0();
  sub_237859790();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  sub_2378598A0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v22 = (uint64_t)v47;
  sub_237859590();
  uint64_t v23 = v13;
  uint64_t v24 = v22;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v23, v48);
  uint64_t v25 = sub_237859580();
  if (__swift_getEnumTagSinglePayload(v22, 1, v25) == 1)
  {
    sub_237799238(v22, &qword_2689289F8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v52, v49, v51);
  }
  uint64_t v26 = *(void *)(v25 - 8);
  int v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 88))(v24, v25);
  int v28 = *MEMORY[0x263F5CB78];
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
  if (v27 != v28) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v52, v49, v51);
  }
  uint64_t v29 = v50;
  uint64_t v30 = v43;
  uint64_t v31 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v43, v49, v51);
  sub_2378595A0();
  uint64_t v32 = (void (*)(char *, void))sub_2378595D0();
  uint64_t v33 = (void (*)(char *, void))sub_237859780();
  sub_2378598B0();
  v33(v53, 0);
  v32(v54, 0);
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  uint64_t v34 = v46;
  uint64_t v35 = __swift_project_value_buffer(v46, (uint64_t)qword_268928BC8);
  uint64_t v37 = v44;
  uint64_t v36 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v44, v35, v34);
  unint64_t v38 = sub_23785B490();
  os_log_type_t v39 = sub_23785B890();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v40 = 0;
    _os_log_impl(&dword_237778000, v38, v39, "InstallAppFlow.filterPegasusAppResults redacted button", v40, 2u);
    MEMORY[0x237E23210](v40, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v34);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v52, v30, v31);
}

uint64_t sub_23783B3A4()
{
  return 12383;
}

uint64_t sub_23783B3B0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x80000002378676F0 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000237867710 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000237867730 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000237867750 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000237867770 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000237867790)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_23785BE30();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_23783B5FC()
{
  return 6;
}

uint64_t sub_23783B604()
{
  return sub_23785BEF0();
}

unint64_t sub_23783B644(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23783B704(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_23785BE30();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23783B774()
{
  return sub_23785BEF0();
}

uint64_t sub_23783B7B0()
{
  return sub_23783B774();
}

uint64_t sub_23783B7CC(uint64_t a1)
{
  unint64_t v2 = sub_23783E38C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23783B808(uint64_t a1)
{
  unint64_t v2 = sub_23783E38C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_23783B844@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23783B704(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23783B870(uint64_t a1)
{
  unint64_t v2 = sub_23783E1BC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23783B8AC(uint64_t a1)
{
  unint64_t v2 = sub_23783E1BC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_23783B8E8(uint64_t a1)
{
  unint64_t v2 = sub_23783E25C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23783B924(uint64_t a1)
{
  unint64_t v2 = sub_23783E25C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_23783B960(uint64_t a1)
{
  unint64_t v2 = sub_23783E340();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23783B99C(uint64_t a1)
{
  unint64_t v2 = sub_23783E340();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_23783B9D8()
{
  return sub_23783B644(*v0);
}

uint64_t sub_23783B9E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23783B3B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23783BA08@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23783B5FC();
  *a1 = result;
  return result;
}

uint64_t sub_23783BA30(uint64_t a1)
{
  unint64_t v2 = sub_23783E170();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23783BA6C(uint64_t a1)
{
  unint64_t v2 = sub_23783E170();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_23783BAA8(uint64_t a1)
{
  unint64_t v2 = sub_23783E2A8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23783BAE4(uint64_t a1)
{
  unint64_t v2 = sub_23783E2A8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_23783BB20(uint64_t a1)
{
  unint64_t v2 = sub_23783E2F4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23783BB5C(uint64_t a1)
{
  unint64_t v2 = sub_23783E2F4();
  return MEMORY[0x270FA00B8](a1, v2);
}

void AppLaunchDataModels.encode(to:)()
{
  OUTLINED_FUNCTION_6();
  uint64_t v80 = v1;
  uint64_t v81 = v0;
  char v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928620);
  OUTLINED_FUNCTION_1_2();
  uint64_t v76 = v6;
  uint64_t v77 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v75 = (char *)v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = OUTLINED_FUNCTION_26_1();
  uint64_t v72 = type metadata accessor for AppLaunchDataModels.AppOffloadedModel(v8);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_87_0(v10, v53[0]);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928628);
  OUTLINED_FUNCTION_1_2();
  uint64_t v71 = v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v70 = (char *)v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = OUTLINED_FUNCTION_26_1();
  uint64_t v67 = type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(v14);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1_4();
  uint64_t v69 = v16;
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928630);
  OUTLINED_FUNCTION_1_2();
  uint64_t v66 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_1_4();
  uint64_t v65 = v19;
  uint64_t v20 = OUTLINED_FUNCTION_26_1();
  uint64_t v63 = type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(v20);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_1_4();
  uint64_t v64 = v22;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928638);
  OUTLINED_FUNCTION_1_2();
  uint64_t v61 = v23;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_1_4();
  uint64_t v60 = v25;
  uint64_t v26 = OUTLINED_FUNCTION_26_1();
  uint64_t v58 = type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(v26);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_1_4();
  uint64_t v59 = v28;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928640);
  OUTLINED_FUNCTION_1_2();
  uint64_t v56 = v29;
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_1_4();
  uint64_t v55 = v31;
  uint64_t v32 = OUTLINED_FUNCTION_26_1();
  v53[3] = type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(v32);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_1_4();
  uint64_t v54 = v34;
  v53[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_268928648);
  OUTLINED_FUNCTION_1_2();
  v53[1] = v35;
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_62();
  type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(0);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v37);
  uint64_t v38 = OUTLINED_FUNCTION_91_0();
  type metadata accessor for AppLaunchDataModels(v38);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_61();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928650);
  OUTLINED_FUNCTION_1_2();
  uint64_t v78 = v41;
  uint64_t v79 = v40;
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_28_6();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_23783E170();
  sub_23785BF20();
  sub_237835698();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v45 = v54;
      sub_23783E208();
      sub_23783E340();
      OUTLINED_FUNCTION_15_13();
      sub_2378351FC((uint64_t)&unk_2689286A8);
      OUTLINED_FUNCTION_110();
      OUTLINED_FUNCTION_104();
      OUTLINED_FUNCTION_5_2();
      v46();
      unint64_t v47 = type metadata accessor for AppLaunchDataModels.ButtonFallbackModel;
      goto LABEL_8;
    case 2u:
      uint64_t v45 = v59;
      sub_23783E208();
      sub_23783E2F4();
      OUTLINED_FUNCTION_15_13();
      sub_2378351FC((uint64_t)&unk_268928698);
      OUTLINED_FUNCTION_110();
      OUTLINED_FUNCTION_104();
      OUTLINED_FUNCTION_5_2();
      v48();
      unint64_t v47 = type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel;
      goto LABEL_8;
    case 3u:
      uint64_t v45 = v64;
      sub_23783E208();
      sub_23783E2A8();
      OUTLINED_FUNCTION_15_13();
      sub_2378351FC((uint64_t)&unk_268928688);
      OUTLINED_FUNCTION_110();
      OUTLINED_FUNCTION_104();
      OUTLINED_FUNCTION_5_2();
      v49();
      unint64_t v47 = type metadata accessor for AppLaunchDataModels.ConfirmationViewModel;
      goto LABEL_8;
    case 4u:
      uint64_t v45 = v69;
      sub_23783E208();
      sub_23783E25C();
      OUTLINED_FUNCTION_15_13();
      sub_2378351FC((uint64_t)&unk_268928678);
      OUTLINED_FUNCTION_110();
      OUTLINED_FUNCTION_104();
      OUTLINED_FUNCTION_5_2();
      v50();
      unint64_t v47 = type metadata accessor for AppLaunchDataModels.AppResultWrapperModel;
      goto LABEL_8;
    case 5u:
      uint64_t v45 = v74;
      sub_23783E208();
      sub_23783E1BC();
      OUTLINED_FUNCTION_15_13();
      sub_2378351FC((uint64_t)&unk_268928668);
      OUTLINED_FUNCTION_110();
      OUTLINED_FUNCTION_104();
      OUTLINED_FUNCTION_5_2();
      v51();
      unint64_t v47 = type metadata accessor for AppLaunchDataModels.AppOffloadedModel;
LABEL_8:
      uint64_t v43 = v47;
      uint64_t v44 = v45;
      break;
    default:
      sub_23783E208();
      sub_23783E38C();
      sub_23785BD80();
      sub_2378351FC((uint64_t)&unk_2689286B8);
      sub_23785BDD0();
      OUTLINED_FUNCTION_5_2();
      v42();
      uint64_t v43 = type metadata accessor for AppLaunchDataModels.AppDisambiguationModel;
      uint64_t v44 = v2;
      break;
  }
  sub_2378356EC(v44, (void (*)(void))v43);
  OUTLINED_FUNCTION_5_2();
  v52();
  OUTLINED_FUNCTION_9();
}

void AppLaunchDataModels.init(from:)()
{
  OUTLINED_FUNCTION_6();
  uint64_t v101 = v0;
  uint64_t v3 = v2;
  uint64_t v94 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689286C0);
  OUTLINED_FUNCTION_1_2();
  uint64_t v88 = v5;
  uint64_t v89 = v6;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_85_1(v7, v72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689286C8);
  OUTLINED_FUNCTION_1_2();
  uint64_t v86 = v9;
  uint64_t v87 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v95 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689286D0);
  OUTLINED_FUNCTION_1_2();
  uint64_t v84 = v12;
  uint64_t v85 = v11;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1_4();
  uint64_t v93 = v13;
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689286D8);
  OUTLINED_FUNCTION_1_2();
  uint64_t v83 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1_4();
  uint64_t v92 = v16;
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689286E0);
  OUTLINED_FUNCTION_1_2();
  uint64_t v81 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_1_4();
  uint64_t v91 = v19;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689286E8);
  OUTLINED_FUNCTION_1_2();
  uint64_t v79 = v20;
  MEMORY[0x270FA5388](v21);
  uint64_t v90 = (char *)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689286F0);
  OUTLINED_FUNCTION_1_2();
  uint64_t v97 = v24;
  uint64_t v98 = v23;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_61();
  uint64_t v96 = type metadata accessor for AppLaunchDataModels(0);
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_8_7();
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v72 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)&v72 - v32;
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  uint64_t v36 = (char *)&v72 - v35;
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v39 = (char *)&v72 - v38;
  MEMORY[0x270FA5388](v37);
  uint64_t v41 = (char *)&v72 - v40;
  uint64_t v100 = v3;
  OUTLINED_FUNCTION_120();
  sub_23783E170();
  uint64_t v42 = v101;
  sub_23785BF10();
  if (!v42)
  {
    uint64_t v74 = v36;
    uint64_t v77 = v33;
    uint64_t v75 = v30;
    uint64_t v76 = v39;
    uint64_t v78 = v41;
    uint64_t v43 = v98;
    uint64_t v101 = v1;
    uint64_t v44 = sub_23785BD70();
    uint64_t v45 = *(void *)(v44 + 16);
    if (v45
      && (uint64_t v73 = 0,
          uint64_t v46 = *(unsigned __int8 *)(v44 + 32),
          sub_23783E3D8(1, v45, v44, v44 + 32, 0, (2 * v45) | 1),
          uint64_t v48 = v47,
          unint64_t v50 = v49,
          swift_bridgeObjectRelease(),
          v48 == v50 >> 1))
    {
      uint64_t v51 = v73;
      switch(v46)
      {
        case 1:
          sub_23783E340();
          OUTLINED_FUNCTION_17_16();
          type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(0);
          sub_2378351FC((uint64_t)&unk_268928720);
          OUTLINED_FUNCTION_129();
          OUTLINED_FUNCTION_123();
          OUTLINED_FUNCTION_5_2();
          v58();
          swift_unknownObjectRelease();
          uint64_t v59 = OUTLINED_FUNCTION_46_5();
          v60(v59);
          goto LABEL_15;
        case 2:
          sub_23783E2F4();
          OUTLINED_FUNCTION_17_16();
          type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(0);
          sub_2378351FC((uint64_t)&unk_268928718);
          sub_23785BD60();
          OUTLINED_FUNCTION_5_2();
          v67();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_54_4();
          v68();
          swift_storeEnumTagMultiPayload();
          break;
        case 3:
          sub_23783E2A8();
          uint64_t v56 = v101;
          sub_23785BD00();
          if (v51) {
            goto LABEL_7;
          }
          uint64_t v57 = type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(0);
          sub_2378351FC((uint64_t)&unk_268928710);
          sub_23785BD60();
          OUTLINED_FUNCTION_123();
          OUTLINED_FUNCTION_5_2();
          v61();
          swift_unknownObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v101, v43);
          swift_storeEnumTagMultiPayload();
          break;
        case 4:
          sub_23783E25C();
          OUTLINED_FUNCTION_17_16();
          type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(0);
          sub_2378351FC((uint64_t)&unk_268928708);
          sub_23785BD60();
          OUTLINED_FUNCTION_5_2();
          v62();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_5_2();
          v63();
          swift_storeEnumTagMultiPayload();
          break;
        case 5:
          sub_23783E1BC();
          OUTLINED_FUNCTION_17_16();
          type metadata accessor for AppLaunchDataModels.AppOffloadedModel(0);
          sub_2378351FC((uint64_t)&unk_268928700);
          OUTLINED_FUNCTION_129();
          OUTLINED_FUNCTION_123();
          OUTLINED_FUNCTION_5_2();
          v69();
          swift_unknownObjectRelease();
          uint64_t v70 = OUTLINED_FUNCTION_46_5();
          v71(v70);
LABEL_15:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          sub_23783E38C();
          OUTLINED_FUNCTION_17_16();
          type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(0);
          sub_2378351FC((uint64_t)&unk_268928728);
          sub_23785BD60();
          OUTLINED_FUNCTION_123();
          OUTLINED_FUNCTION_5_2();
          v64();
          swift_unknownObjectRelease();
          uint64_t v65 = OUTLINED_FUNCTION_46_5();
          v66(v65);
          swift_storeEnumTagMultiPayload();
          break;
      }
      sub_23783E208();
      sub_23783E208();
    }
    else
    {
      uint64_t v52 = v96;
      uint64_t v53 = sub_23785BBD0();
      swift_allocError();
      uint64_t v55 = v54;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2689286F8);
      *uint64_t v55 = v52;
      uint64_t v56 = v101;
      sub_23785BD10();
      sub_23785BBC0();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v53 - 8) + 104))(v55, *MEMORY[0x263F8DCB0], v53);
      swift_willThrow();
LABEL_7:
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v56, v43);
    }
  }
  __swift_destroy_boxed_opaque_existential_1(v100);
  OUTLINED_FUNCTION_9();
}

unint64_t sub_23783D14C()
{
  return 0xD000000000000015;
}

void sub_23783D16C()
{
}

void sub_23783D184()
{
}

id sub_23783D19C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = (void *)sub_237859360();
    sub_237845068(a1, a2);
  }
  id v6 = objc_msgSend(v2, sel_initWithData_, v3);

  return v6;
}

unint64_t sub_23783D210()
{
  unint64_t result = qword_268928470;
  if (!qword_268928470)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928468);
    sub_23783D48C((uint64_t)&unk_268928478);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928470);
  }
  return result;
}

unint64_t sub_23783D2B0()
{
  return sub_23783D628((uint64_t)&unk_268928488);
}

unint64_t sub_23783D2EC()
{
  unint64_t result = qword_268928490;
  if (!qword_268928490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928490);
  }
  return result;
}

unint64_t sub_23783D338()
{
  unint64_t result = qword_2689284A8;
  if (!qword_2689284A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689284A8);
  }
  return result;
}

unint64_t sub_23783D384()
{
  unint64_t result = qword_2689284B8;
  if (!qword_2689284B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689284B8);
  }
  return result;
}

unint64_t sub_23783D3D0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_55_1(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928468);
    sub_23783D48C((uint64_t)&unk_2689284C8);
    sub_23783D48C((uint64_t)&unk_2689284D0);
    unint64_t result = OUTLINED_FUNCTION_68_3();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_23783D48C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_55_1(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_23783D4E8()
{
  unint64_t result = qword_2689284D8;
  if (!qword_2689284D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928460);
    sub_23783D628((uint64_t)&unk_2689284E0);
    sub_23783D628((uint64_t)&unk_2689284F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689284D8);
  }
  return result;
}

unint64_t sub_23783D5DC()
{
  unint64_t result = qword_2689284E8;
  if (!qword_2689284E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689284E8);
  }
  return result;
}

unint64_t sub_23783D628(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_55_1(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    OUTLINED_FUNCTION_119();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_23783D68C()
{
  unint64_t result = qword_2689284F8;
  if (!qword_2689284F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689284F8);
  }
  return result;
}

unint64_t sub_23783D6D8()
{
  unint64_t result = qword_268928510;
  if (!qword_268928510)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928460);
    sub_23783D628((uint64_t)&unk_2689284E0);
    sub_23783D628((uint64_t)&unk_2689284F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928510);
  }
  return result;
}

uint64_t type metadata accessor for AppLaunchDataModels.AppResultSashModel(uint64_t a1)
{
  return sub_23777CAC4(a1, (uint64_t *)&unk_268928808);
}

unint64_t sub_23783D7EC()
{
  unint64_t result = qword_268928520;
  if (!qword_268928520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928520);
  }
  return result;
}

uint64_t type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(uint64_t a1)
{
  return sub_23777CAC4(a1, (uint64_t *)&unk_268928818);
}

void sub_23783D858(uint64_t a1, void *a2)
{
  sub_237808258();
  id v3 = (id)sub_23785B780();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setCardSections_, v3);
}

unint64_t sub_23783D8CC()
{
  unint64_t result = qword_268928558;
  if (!qword_268928558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928558);
  }
  return result;
}

unint64_t sub_23783D918()
{
  unint64_t result = qword_268928560;
  if (!qword_268928560)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928538);
    sub_23783D994();
    sub_23783DA38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928560);
  }
  return result;
}

unint64_t sub_23783D994()
{
  unint64_t result = qword_268928568;
  if (!qword_268928568)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928530);
    sub_2378351FC((uint64_t)&unk_268928570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928568);
  }
  return result;
}

unint64_t sub_23783DA38()
{
  unint64_t result = qword_268928578;
  if (!qword_268928578)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928530);
    sub_2378351FC((uint64_t)&unk_268928580);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928578);
  }
  return result;
}

unint64_t sub_23783DADC()
{
  unint64_t result = qword_268928588;
  if (!qword_268928588)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928548);
    sub_23783DB58();
    sub_23783DBFC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928588);
  }
  return result;
}

unint64_t sub_23783DB58()
{
  unint64_t result = qword_268928590;
  if (!qword_268928590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928540);
    sub_2378351FC((uint64_t)&unk_268928598);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928590);
  }
  return result;
}

unint64_t sub_23783DBFC()
{
  unint64_t result = qword_2689285A0;
  if (!qword_2689285A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928540);
    sub_2378351FC((uint64_t)&unk_2689285A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689285A0);
  }
  return result;
}

unint64_t sub_23783DCA0()
{
  unint64_t result = qword_2689285B8;
  if (!qword_2689285B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928538);
    sub_23783D994();
    sub_23783DA38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689285B8);
  }
  return result;
}

unint64_t sub_23783DD1C()
{
  unint64_t result = qword_2689285C0;
  if (!qword_2689285C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928548);
    sub_23783DB58();
    sub_23783DBFC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689285C0);
  }
  return result;
}

uint64_t sub_23783DD98()
{
  OUTLINED_FUNCTION_44_3();
  __swift_instantiateConcreteTypeFromMangledName(v1);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_92();
  v2();
  return v0;
}

uint64_t type metadata accessor for AppLaunchDataModels.AppOffloadedModel(uint64_t a1)
{
  return sub_23777CAC4(a1, (uint64_t *)&unk_268928838);
}

unint64_t sub_23783DE0C()
{
  unint64_t result = qword_2689285E0;
  if (!qword_2689285E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689285E0);
  }
  return result;
}

unint64_t sub_23783DE58(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_55_1(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689285C8);
    sub_2378351FC((uint64_t)&unk_268928570);
    sub_2378351FC((uint64_t)&unk_268928580);
    unint64_t result = OUTLINED_FUNCTION_68_3();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_23783DF10()
{
  unint64_t result = qword_2689285F0;
  if (!qword_2689285F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689285D0);
    sub_23783DF8C();
    sub_23783E030();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689285F0);
  }
  return result;
}

unint64_t sub_23783DF8C()
{
  unint64_t result = qword_2689285F8;
  if (!qword_2689285F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268927838);
    sub_2378351FC((uint64_t)&unk_268928350);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689285F8);
  }
  return result;
}

unint64_t sub_23783E030()
{
  unint64_t result = qword_268928600;
  if (!qword_268928600)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268927838);
    sub_2378351FC((uint64_t)&unk_268928358);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928600);
  }
  return result;
}

unint64_t sub_23783E0D4()
{
  unint64_t result = qword_268928618;
  if (!qword_268928618)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689285D0);
    sub_23783DF8C();
    sub_23783E030();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928618);
  }
  return result;
}

uint64_t type metadata accessor for AppLaunchDataModels(uint64_t a1)
{
  return sub_23777CAC4(a1, (uint64_t *)&unk_268928758);
}

unint64_t sub_23783E170()
{
  unint64_t result = qword_268928658;
  if (!qword_268928658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928658);
  }
  return result;
}

unint64_t sub_23783E1BC()
{
  unint64_t result = qword_268928660;
  if (!qword_268928660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928660);
  }
  return result;
}

uint64_t sub_23783E208()
{
  uint64_t v1 = OUTLINED_FUNCTION_116();
  v2(v1);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_59_2();
  v3();
  return v0;
}

unint64_t sub_23783E25C()
{
  unint64_t result = qword_268928670;
  if (!qword_268928670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928670);
  }
  return result;
}

unint64_t sub_23783E2A8()
{
  unint64_t result = qword_268928680;
  if (!qword_268928680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928680);
  }
  return result;
}

unint64_t sub_23783E2F4()
{
  unint64_t result = qword_268928690;
  if (!qword_268928690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928690);
  }
  return result;
}

unint64_t sub_23783E340()
{
  unint64_t result = qword_2689286A0;
  if (!qword_2689286A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689286A0);
  }
  return result;
}

unint64_t sub_23783E38C()
{
  unint64_t result = qword_2689286B0;
  if (!qword_2689286B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689286B0);
  }
  return result;
}

uint64_t sub_23783E3D8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_23783E454()
{
  return sub_2378351FC((uint64_t)&unk_2689283A8);
}

unint64_t sub_23783E49C()
{
  return sub_2378351FC((uint64_t)&unk_2689283B8);
}

unint64_t sub_23783E4E4()
{
  return sub_2378351FC((uint64_t)&unk_268928730);
}

unint64_t sub_23783E52C()
{
  return sub_2378351FC((uint64_t)&unk_268928728);
}

unint64_t sub_23783E574()
{
  return sub_2378351FC((uint64_t)&unk_2689286B8);
}

unint64_t sub_23783E5BC()
{
  return sub_2378351FC((uint64_t)&unk_268928720);
}

unint64_t sub_23783E604()
{
  return sub_2378351FC((uint64_t)&unk_2689286A8);
}

unint64_t sub_23783E64C()
{
  return sub_2378351FC((uint64_t)&unk_268928438);
}

unint64_t sub_23783E694()
{
  return sub_2378351FC((uint64_t)&unk_268928420);
}

unint64_t sub_23783E6DC()
{
  return sub_2378351FC((uint64_t)&unk_268928738);
}

unint64_t sub_23783E724()
{
  return sub_2378351FC((uint64_t)&unk_268928718);
}

unint64_t sub_23783E76C()
{
  return sub_2378351FC((uint64_t)&unk_268928698);
}

unint64_t sub_23783E7B4()
{
  return sub_2378351FC((uint64_t)&unk_268928710);
}

unint64_t sub_23783E7FC()
{
  return sub_2378351FC((uint64_t)&unk_268928688);
}

unint64_t sub_23783E844()
{
  return sub_2378351FC((uint64_t)&unk_268928570);
}

unint64_t sub_23783E88C()
{
  return sub_2378351FC((uint64_t)&unk_268928580);
}

unint64_t sub_23783E8D4()
{
  return sub_2378351FC((uint64_t)&unk_268928740);
}

unint64_t sub_23783E91C()
{
  return sub_2378351FC((uint64_t)&unk_268928598);
}

unint64_t sub_23783E964()
{
  return sub_2378351FC((uint64_t)&unk_2689285A8);
}

unint64_t sub_23783E9AC()
{
  return sub_2378351FC((uint64_t)&unk_268928708);
}

unint64_t sub_23783E9F4()
{
  return sub_2378351FC((uint64_t)&unk_268928678);
}

unint64_t sub_23783EA3C()
{
  return sub_2378351FC((uint64_t)&unk_268928700);
}

unint64_t sub_23783EA84()
{
  return sub_2378351FC((uint64_t)&unk_268928668);
}

unint64_t sub_23783EACC()
{
  return sub_2378351FC((uint64_t)&unk_268928748);
}

unint64_t sub_23783EB14()
{
  return sub_2378351FC((uint64_t)&unk_268928750);
}

char *initializeBufferWithCopyOfBuffer for AppLaunchDataModels(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
        (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        uint64_t v13 = *(int *)(type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(0) + 20);
        uint64_t v14 = &a1[v13];
        uint64_t v15 = (char *)a2 + v13;
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
        break;
      case 2u:
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
        (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
        uint64_t v18 = type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(0);
        *(void *)&a1[*(int *)(v18 + 20)] = *(uint64_t *)((char *)a2 + *(int *)(v18 + 20));
        swift_bridgeObjectRetain();
        break;
      case 3u:
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
        uint64_t v37 = *(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v19 - 8) + 16);
        v37(a1, a2, v19);
        uint64_t v20 = (int *)type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(0);
        uint64_t v21 = v20[5];
        uint64_t v22 = &a1[v21];
        uint64_t v23 = (char *)a2 + v21;
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
        uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
        v25(v22, v23, v24);
        v37(&a1[v20[6]], (uint64_t *)((char *)a2 + v20[6]), v19);
        v25(&a1[v20[7]], (char *)a2 + v20[7], v24);
        break;
      case 4u:
        uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928538);
        (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v26 - 8) + 16))(a1, a2, v26);
        uint64_t v27 = *(int *)(type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(0) + 20);
        uint64_t v28 = &a1[v27];
        uint64_t v29 = (char *)a2 + v27;
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928548);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
        break;
      case 5u:
        uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
        (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v31 - 8) + 16))(a1, a2, v31);
        uint64_t v32 = *(int *)(type metadata accessor for AppLaunchDataModels.AppOffloadedModel(0) + 20);
        uint64_t v33 = &a1[v32];
        uint64_t v34 = (char *)a2 + v32;
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689285D0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
        break;
      default:
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
        (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        uint64_t v7 = *(int *)(type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(0) + 20);
        uint64_t v8 = &a1[v7];
        uint64_t v9 = (char *)a2 + v7;
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928380);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for AppLaunchDataModels(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
      uint64_t v4 = a1 + *(int *)(type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(0) + 20);
      int v5 = &qword_268928380;
      goto LABEL_10;
    case 1:
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
      uint64_t v4 = a1 + *(int *)(type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(0) + 20);
      int v5 = &qword_2689282F8;
      goto LABEL_10;
    case 2:
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
      type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(0);
      return swift_bridgeObjectRelease();
    case 3:
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
      uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
      v9(a1, v8);
      uint64_t v10 = (int *)type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(0);
      uint64_t v11 = a1 + v10[5];
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
      uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v19)((void *)(v12 - 8), v11, v12);
      v9(a1 + v10[6], v8);
      uint64_t v13 = a1 + v10[7];
      uint64_t v14 = v12;
      uint64_t v15 = v19;
      goto LABEL_11;
    case 4:
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928538);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
      uint64_t v4 = a1 + *(int *)(type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(0) + 20);
      int v5 = &qword_268928548;
      goto LABEL_10;
    case 5:
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(a1, v17);
      uint64_t v4 = a1 + *(int *)(type metadata accessor for AppLaunchDataModels.AppOffloadedModel(0) + 20);
      int v5 = &qword_2689285D0;
LABEL_10:
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(v5);
      uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8);
      uint64_t v14 = v18;
      uint64_t v13 = v4;
LABEL_11:
      uint64_t result = v15(v13, v14);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for AppLaunchDataModels(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      uint64_t v10 = *(int *)(type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(0) + 20);
      uint64_t v6 = a1 + v10;
      uint64_t v7 = a2 + v10;
      uint64_t v8 = &qword_2689282F8;
      goto LABEL_8;
    case 2u:
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      uint64_t v12 = type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(0);
      *(void *)(a1 + *(int *)(v12 + 20)) = *(void *)(a2 + *(int *)(v12 + 20));
      swift_bridgeObjectRetain();
      goto LABEL_9;
    case 3u:
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
      uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
      v26(a1, a2, v13);
      uint64_t v14 = (int *)type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(0);
      uint64_t v15 = v14[5];
      uint64_t v25 = a1 + v15;
      uint64_t v16 = a2 + v15;
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
      uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16);
      v18(v25, v16, v17);
      v26(a1 + v14[6], a2 + v14[6], v13);
      v18(a1 + v14[7], a2 + v14[7], v17);
      goto LABEL_9;
    case 4u:
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928538);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(a1, a2, v19);
      uint64_t v20 = *(int *)(type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(0) + 20);
      uint64_t v6 = a1 + v20;
      uint64_t v7 = a2 + v20;
      uint64_t v8 = &qword_268928548;
      goto LABEL_8;
    case 5u:
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(a1, a2, v21);
      uint64_t v22 = *(int *)(type metadata accessor for AppLaunchDataModels.AppOffloadedModel(0) + 20);
      uint64_t v6 = a1 + v22;
      uint64_t v7 = a2 + v22;
      uint64_t v8 = &qword_2689285D0;
      goto LABEL_8;
    default:
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = *(int *)(type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(0) + 20);
      uint64_t v6 = a1 + v5;
      uint64_t v7 = a2 + v5;
      uint64_t v8 = &qword_268928380;
LABEL_8:
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(v8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v6, v7, v23);
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
}

uint64_t assignWithCopy for AppLaunchDataModels(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_2378356EC(a1, (void (*)(void))type metadata accessor for AppLaunchDataModels);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        uint64_t v10 = *(int *)(type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(0) + 20);
        uint64_t v6 = a1 + v10;
        uint64_t v7 = a2 + v10;
        uint64_t v8 = &qword_2689282F8;
        goto LABEL_9;
      case 2u:
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
        uint64_t v12 = type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(0);
        *(void *)(a1 + *(int *)(v12 + 20)) = *(void *)(a2 + *(int *)(v12 + 20));
        swift_bridgeObjectRetain();
        goto LABEL_10;
      case 3u:
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
        uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
        v26(a1, a2, v13);
        uint64_t v14 = (int *)type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(0);
        uint64_t v15 = v14[5];
        uint64_t v25 = a1 + v15;
        uint64_t v16 = a2 + v15;
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
        uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16);
        v18(v25, v16, v17);
        v26(a1 + v14[6], a2 + v14[6], v13);
        v18(a1 + v14[7], a2 + v14[7], v17);
        goto LABEL_10;
      case 4u:
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928538);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(a1, a2, v19);
        uint64_t v20 = *(int *)(type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(0) + 20);
        uint64_t v6 = a1 + v20;
        uint64_t v7 = a2 + v20;
        uint64_t v8 = &qword_268928548;
        goto LABEL_9;
      case 5u:
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(a1, a2, v21);
        uint64_t v22 = *(int *)(type metadata accessor for AppLaunchDataModels.AppOffloadedModel(0) + 20);
        uint64_t v6 = a1 + v22;
        uint64_t v7 = a2 + v22;
        uint64_t v8 = &qword_2689285D0;
        goto LABEL_9;
      default:
        uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        uint64_t v5 = *(int *)(type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(0) + 20);
        uint64_t v6 = a1 + v5;
        uint64_t v7 = a2 + v5;
        uint64_t v8 = &qword_268928380;
LABEL_9:
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(v8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v6, v7, v23);
LABEL_10:
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
  return a1;
}

uint64_t initializeWithTake for AppLaunchDataModels(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
      uint64_t v10 = *(int *)(type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(0) + 20);
      uint64_t v6 = a1 + v10;
      uint64_t v7 = a2 + v10;
      uint64_t v8 = &qword_2689282F8;
      goto LABEL_8;
    case 2u:
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
      uint64_t v12 = type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(0);
      *(void *)(a1 + *(int *)(v12 + 20)) = *(void *)(a2 + *(int *)(v12 + 20));
      goto LABEL_9;
    case 3u:
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
      uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32);
      v26(a1, a2, v13);
      uint64_t v14 = (int *)type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(0);
      uint64_t v15 = v14[5];
      uint64_t v25 = a1 + v15;
      uint64_t v16 = a2 + v15;
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
      uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32);
      v18(v25, v16, v17);
      v26(a1 + v14[6], a2 + v14[6], v13);
      v18(a1 + v14[7], a2 + v14[7], v17);
      goto LABEL_9;
    case 4u:
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928538);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(a1, a2, v19);
      uint64_t v20 = *(int *)(type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(0) + 20);
      uint64_t v6 = a1 + v20;
      uint64_t v7 = a2 + v20;
      uint64_t v8 = &qword_268928548;
      goto LABEL_8;
    case 5u:
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(a1, a2, v21);
      uint64_t v22 = *(int *)(type metadata accessor for AppLaunchDataModels.AppOffloadedModel(0) + 20);
      uint64_t v6 = a1 + v22;
      uint64_t v7 = a2 + v22;
      uint64_t v8 = &qword_2689285D0;
      goto LABEL_8;
    default:
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
      uint64_t v5 = *(int *)(type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(0) + 20);
      uint64_t v6 = a1 + v5;
      uint64_t v7 = a2 + v5;
      uint64_t v8 = &qword_268928380;
LABEL_8:
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(v8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v6, v7, v23);
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
}

uint64_t assignWithTake for AppLaunchDataModels(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_2378356EC(a1, (void (*)(void))type metadata accessor for AppLaunchDataModels);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
        uint64_t v10 = *(int *)(type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(0) + 20);
        uint64_t v6 = a1 + v10;
        uint64_t v7 = a2 + v10;
        uint64_t v8 = &qword_2689282F8;
        goto LABEL_9;
      case 2u:
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
        uint64_t v12 = type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(0);
        *(void *)(a1 + *(int *)(v12 + 20)) = *(void *)(a2 + *(int *)(v12 + 20));
        goto LABEL_10;
      case 3u:
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
        uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32);
        v26(a1, a2, v13);
        uint64_t v14 = (int *)type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(0);
        uint64_t v15 = v14[5];
        uint64_t v25 = a1 + v15;
        uint64_t v16 = a2 + v15;
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
        uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32);
        v18(v25, v16, v17);
        v26(a1 + v14[6], a2 + v14[6], v13);
        v18(a1 + v14[7], a2 + v14[7], v17);
        goto LABEL_10;
      case 4u:
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928538);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(a1, a2, v19);
        uint64_t v20 = *(int *)(type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(0) + 20);
        uint64_t v6 = a1 + v20;
        uint64_t v7 = a2 + v20;
        uint64_t v8 = &qword_268928548;
        goto LABEL_9;
      case 5u:
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689285C8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(a1, a2, v21);
        uint64_t v22 = *(int *)(type metadata accessor for AppLaunchDataModels.AppOffloadedModel(0) + 20);
        uint64_t v6 = a1 + v22;
        uint64_t v7 = a2 + v22;
        uint64_t v8 = &qword_2689285D0;
        goto LABEL_9;
      default:
        uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
        uint64_t v5 = *(int *)(type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(0) + 20);
        uint64_t v6 = a1 + v5;
        uint64_t v7 = a2 + v5;
        uint64_t v8 = &qword_268928380;
LABEL_9:
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(v8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v6, v7, v23);
LABEL_10:
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
  return a1;
}

uint64_t sub_23784029C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2378402AC()
{
  uint64_t result = type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel(319);
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(319);
        if (v4 <= 0x3F)
        {
          uint64_t result = type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(319);
          if (v5 <= 0x3F)
          {
            uint64_t result = type metadata accessor for AppLaunchDataModels.AppOffloadedModel(319);
            if (v6 <= 0x3F)
            {
              swift_initEnumMetadataMultiPayload();
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AppLaunchDataModels.App(uint64_t *a1, uint64_t *a2, int *a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t destroy for AppLaunchDataModels.App(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  return v10(v8, v9);
}

uint64_t initializeWithCopy for AppLaunchDataModels.App(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

uint64_t assignWithCopy for AppLaunchDataModels.App(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

uint64_t initializeWithTake for AppLaunchDataModels.App(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

uint64_t assignWithTake for AppLaunchDataModels.App(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppLaunchDataModels.App(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237840BE8);
}

uint64_t sub_237840BE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_44_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_16();
  if (*(_DWORD *)(v6 + 84) == v3)
  {
    uint64_t v7 = OUTLINED_FUNCTION_130();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F0);
    OUTLINED_FUNCTION_1_16();
    if (*(_DWORD *)(v10 + 84) == v3)
    {
      uint64_t v8 = v9;
      uint64_t v11 = *(int *)(a3 + 24);
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
      uint64_t v11 = *(int *)(a3 + 28);
    }
    uint64_t v7 = v4 + v11;
  }
  return __swift_getEnumTagSinglePayload(v7, v3, v8);
}

uint64_t storeEnumTagSinglePayload for AppLaunchDataModels.App(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237840CA8);
}

uint64_t sub_237840CA8()
{
  OUTLINED_FUNCTION_38_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_16();
  if (*(_DWORD *)(v1 + 84) == v0)
  {
    OUTLINED_FUNCTION_97();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F0);
    OUTLINED_FUNCTION_1_16();
    if (*(_DWORD *)(v2 + 84) != v0) {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
    }
  }
  OUTLINED_FUNCTION_101();
  return __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
}

void sub_237840D50()
{
  sub_237840E90(319, &qword_268928778);
  if (v0 <= 0x3F)
  {
    sub_237840E90(319, &qword_268928780);
    if (v1 <= 0x3F)
    {
      sub_2378437FC(319, &qword_268928788, MEMORY[0x263F76908]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_237840E90(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_237859A20();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AppLaunchDataModels.AppDisambiguationModel(uint64_t a1, uint64_t *a2)
{
  return sub_2378431E4(a1, a2);
}

uint64_t destroy for AppLaunchDataModels.AppDisambiguationModel(uint64_t a1, uint64_t a2)
{
  return sub_2378432B4(a1, a2, &qword_2689282E8, &qword_268928380);
}

uint64_t initializeWithCopy for AppLaunchDataModels.AppDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237843368(a1, a2, a3, &qword_2689282E8);
}

uint64_t assignWithCopy for AppLaunchDataModels.AppDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2378433FC(a1, a2, a3, &qword_2689282E8);
}

uint64_t initializeWithTake for AppLaunchDataModels.AppDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237843498(a1, a2, a3, &qword_2689282E8);
}

uint64_t assignWithTake for AppLaunchDataModels.AppDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23784352C(a1, a2, a3, &qword_2689282E8);
}

uint64_t getEnumTagSinglePayload for AppLaunchDataModels.AppDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237840F64);
}

uint64_t sub_237840F64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_8Tm(a1, a2, a3, (uint64_t)&qword_2689282E8, &qword_268928380);
}

uint64_t storeEnumTagSinglePayload for AppLaunchDataModels.AppDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237840F8C);
}

uint64_t sub_237840F8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_9Tm(a1, a2, a3, a4, (uint64_t)&qword_2689282E8, &qword_268928380);
}

void sub_237840FA0()
{
  sub_237840E90(319, &qword_268928778);
  if (v0 <= 0x3F)
  {
    sub_237843850(319, &qword_2689287A0, &qword_2689273E8);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AppLaunchDataModels.ButtonFallbackModel(uint64_t a1, uint64_t *a2)
{
  return sub_2378431E4(a1, a2);
}

uint64_t destroy for AppLaunchDataModels.ButtonFallbackModel(uint64_t a1, uint64_t a2)
{
  return sub_2378432B4(a1, a2, &qword_2689282E8, &qword_2689282F8);
}

uint64_t initializeWithCopy for AppLaunchDataModels.ButtonFallbackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237843368(a1, a2, a3, &qword_2689282E8);
}

uint64_t assignWithCopy for AppLaunchDataModels.ButtonFallbackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2378433FC(a1, a2, a3, &qword_2689282E8);
}

uint64_t initializeWithTake for AppLaunchDataModels.ButtonFallbackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237843498(a1, a2, a3, &qword_2689282E8);
}

uint64_t assignWithTake for AppLaunchDataModels.ButtonFallbackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23784352C(a1, a2, a3, &qword_2689282E8);
}

uint64_t getEnumTagSinglePayload for AppLaunchDataModels.ButtonFallbackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237841114);
}

uint64_t sub_237841114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_8Tm(a1, a2, a3, (uint64_t)&qword_2689282E8, &qword_2689282F8);
}

uint64_t storeEnumTagSinglePayload for AppLaunchDataModels.ButtonFallbackModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23784113C);
}

uint64_t sub_23784113C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_9Tm(a1, a2, a3, a4, (uint64_t)&qword_2689282E8, &qword_2689282F8);
}

void sub_237841150()
{
  sub_237840E90(319, &qword_268928778);
  if (v0 <= 0x3F)
  {
    sub_2378437FC(319, &qword_268928788, MEMORY[0x263F76908]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for AppLaunchDataModels.Device(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_14Tm);
}

uint64_t storeEnumTagSinglePayload for AppLaunchDataModels.Device(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_15Tm);
}

uint64_t *initializeBufferWithCopyOfBuffer for AppLaunchDataModels.DeviceDisambiguationModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for AppLaunchDataModels.DeviceDisambiguationModel(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppLaunchDataModels.DeviceDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppLaunchDataModels.DeviceDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for AppLaunchDataModels.DeviceDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for AppLaunchDataModels.DeviceDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppLaunchDataModels.DeviceDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23784160C);
}

uint64_t sub_23784160C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_16();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for AppLaunchDataModels.DeviceDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2378416B4);
}

void sub_2378416B4()
{
  OUTLINED_FUNCTION_38_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_16();
  if (*(_DWORD *)(v4 + 84) == v3)
  {
    OUTLINED_FUNCTION_97();
    OUTLINED_FUNCTION_101();
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 20)) = (v0 - 1);
  }
}

void sub_237841730()
{
  sub_237840E90(319, &qword_268928778);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

char *initializeBufferWithCopyOfBuffer for AppLaunchDataModels.ConfirmationViewModel(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v15(a1, a2, v7);
    uint64_t v8 = a3[5];
    unint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v15(&a1[a3[6]], &a2[a3[6]], v7);
    v12(&a1[a3[7]], &a2[a3[7]], v11);
  }
  return a1;
}

uint64_t destroy for AppLaunchDataModels.ConfirmationViewModel(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + a2[5];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v10)((void *)(v7 - 8), v6, v7);
  v5(a1 + a2[6], v4);
  uint64_t v8 = a1 + a2[7];
  return v10(v8, v7);
}

uint64_t initializeWithCopy for AppLaunchDataModels.ConfirmationViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v13(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v13(a1 + a3[6], a2 + a3[6], v6);
  v11(a1 + a3[7], a2 + a3[7], v10);
  return a1;
}

uint64_t assignWithCopy for AppLaunchDataModels.ConfirmationViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v13(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v13(a1 + a3[6], a2 + a3[6], v6);
  v11(a1 + a3[7], a2 + a3[7], v10);
  return a1;
}

uint64_t initializeWithTake for AppLaunchDataModels.ConfirmationViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v13(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v13(a1 + a3[6], a2 + a3[6], v6);
  v11(a1 + a3[7], a2 + a3[7], v10);
  return a1;
}

uint64_t assignWithTake for AppLaunchDataModels.ConfirmationViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v13(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v13(a1 + a3[6], a2 + a3[6], v6);
  v11(a1 + a3[7], a2 + a3[7], v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppLaunchDataModels.ConfirmationViewModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237841F18);
}

uint64_t sub_237841F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_8Tm(a1, a2, a3, (uint64_t)&qword_2689282F8, &qword_2689282E8);
}

uint64_t storeEnumTagSinglePayload for AppLaunchDataModels.ConfirmationViewModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237841F40);
}

uint64_t sub_237841F40(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_9Tm(a1, a2, a3, a4, (uint64_t)&qword_2689282F8, &qword_2689282E8);
}

void sub_237841F54()
{
  sub_2378437FC(319, &qword_268928788, MEMORY[0x263F76908]);
  if (v0 <= 0x3F)
  {
    sub_237840E90(319, &qword_268928778);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for AppLaunchDataModels.AppResultModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928460);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for AppLaunchDataModels.AppResultModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928460);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

uint64_t initializeWithCopy for AppLaunchDataModels.AppResultModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for AppLaunchDataModels.AppResultModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for AppLaunchDataModels.AppResultModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for AppLaunchDataModels.AppResultModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppLaunchDataModels.AppResultModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237842710);
}

uint64_t sub_237842710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_44_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
  OUTLINED_FUNCTION_1_16();
  if (*(_DWORD *)(v6 + 84) == v3)
  {
    uint64_t v7 = OUTLINED_FUNCTION_130();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
    OUTLINED_FUNCTION_1_16();
    if (*(_DWORD *)(v10 + 84) == v3)
    {
      uint64_t v8 = v9;
      uint64_t v11 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928460);
      uint64_t v11 = *(int *)(a3 + 24);
    }
    uint64_t v7 = v4 + v11;
  }
  return __swift_getEnumTagSinglePayload(v7, v3, v8);
}

uint64_t storeEnumTagSinglePayload for AppLaunchDataModels.AppResultModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2378427D0);
}

uint64_t sub_2378427D0()
{
  OUTLINED_FUNCTION_38_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928468);
  OUTLINED_FUNCTION_1_16();
  if (*(_DWORD *)(v1 + 84) == v0)
  {
    OUTLINED_FUNCTION_97();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
    OUTLINED_FUNCTION_1_16();
    if (*(_DWORD *)(v2 + 84) != v0) {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268928460);
    }
  }
  OUTLINED_FUNCTION_101();
  return __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
}

void sub_237842878()
{
  sub_237843850(319, &qword_2689287F8, &qword_268926F10);
  if (v0 <= 0x3F)
  {
    sub_237840E90(319, &qword_268928778);
    if (v1 <= 0x3F)
    {
      sub_237843850(319, &qword_268928800, &qword_268928458);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t _s20SiriAppLaunchIntents19AppLaunchDataModelsO6DeviceVwCP_0(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_1_16();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_98(*a2);
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
    OUTLINED_FUNCTION_22_1();
    uint64_t v9 = *(void (**)(uint64_t))(v8 + 16);
    uint64_t v10 = OUTLINED_FUNCTION_19_8();
    v9(v10);
    ((void (*)(uint64_t, char *, uint64_t))v9)(a1 + *(int *)(v6 + 20), (char *)a2 + *(int *)(v6 + 20), v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_92();
    v11();
  }
  return a1;
}

uint64_t _s20SiriAppLaunchIntents19AppLaunchDataModelsO6DeviceVwxx_0()
{
  OUTLINED_FUNCTION_44_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_22_1();
  uint64_t v3 = *(void (**)(void))(v2 + 8);
  OUTLINED_FUNCTION_13_1();
  v3();
  OUTLINED_FUNCTION_13_1();
  v3();
  uint64_t v4 = v1 + *(int *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  OUTLINED_FUNCTION_22_1();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  return v7(v4, v5);
}

uint64_t _s20SiriAppLaunchIntents19AppLaunchDataModelsO6DeviceVwcp_0()
{
  OUTLINED_FUNCTION_62_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_22_1();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  uint64_t v3 = OUTLINED_FUNCTION_39_6();
  v2(v3);
  uint64_t v4 = OUTLINED_FUNCTION_26_11();
  v2(v4);
  OUTLINED_FUNCTION_65_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_92();
  v5();
  return v0;
}

uint64_t _s20SiriAppLaunchIntents19AppLaunchDataModelsO6DeviceVwca_0()
{
  OUTLINED_FUNCTION_62_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_22_1();
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 24);
  uint64_t v5 = OUTLINED_FUNCTION_39_6();
  v4(v5);
  uint64_t v6 = OUTLINED_FUNCTION_26_11();
  v4(v6);
  OUTLINED_FUNCTION_65_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  OUTLINED_FUNCTION_22_1();
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v0, v1);
  return v2;
}

uint64_t _s20SiriAppLaunchIntents19AppLaunchDataModelsO6DeviceVwtk_0()
{
  OUTLINED_FUNCTION_62_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_22_1();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 32);
  uint64_t v3 = OUTLINED_FUNCTION_39_6();
  v2(v3);
  uint64_t v4 = OUTLINED_FUNCTION_26_11();
  v2(v4);
  OUTLINED_FUNCTION_65_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_59_2();
  v5();
  return v0;
}

uint64_t _s20SiriAppLaunchIntents19AppLaunchDataModelsO6DeviceVwta_0()
{
  OUTLINED_FUNCTION_62_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_22_1();
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 40);
  uint64_t v5 = OUTLINED_FUNCTION_39_6();
  v4(v5);
  uint64_t v6 = OUTLINED_FUNCTION_26_11();
  v4(v6);
  OUTLINED_FUNCTION_65_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  OUTLINED_FUNCTION_22_1();
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v0, v1);
  return v2;
}

uint64_t getEnumTagSinglePayload for AppLaunchDataModels.AppResultSashModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237842E14);
}

uint64_t __swift_get_extra_inhabitant_index_14Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_44_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_16();
  if (*(_DWORD *)(v6 + 84) == v3)
  {
    uint64_t v7 = OUTLINED_FUNCTION_130();
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
    uint64_t v7 = v4 + *(int *)(a3 + 24);
  }
  return __swift_getEnumTagSinglePayload(v7, v3, v8);
}

uint64_t storeEnumTagSinglePayload for AppLaunchDataModels.AppResultSashModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237842EAC);
}

uint64_t __swift_store_extra_inhabitant_index_15Tm()
{
  OUTLINED_FUNCTION_38_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689282E8);
  OUTLINED_FUNCTION_1_16();
  if (*(_DWORD *)(v1 + 84) == v0) {
    OUTLINED_FUNCTION_97();
  }
  else {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689282F8);
  }
  OUTLINED_FUNCTION_101();
  return __swift_storeEnumTagSinglePayload(v2, v3, v4, v5);
}

void sub_237842F2C()
{
  sub_237840E90(319, &qword_268928778);
  if (v0 <= 0x3F)
  {
    sub_2378437FC(319, &qword_268928788, MEMORY[0x263F76908]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AppLaunchDataModels.AppResultWrapperModel(uint64_t a1, uint64_t *a2)
{
  return sub_2378431E4(a1, a2);
}

uint64_t destroy for AppLaunchDataModels.AppResultWrapperModel(uint64_t a1, uint64_t a2)
{
  return sub_2378432B4(a1, a2, &qword_268928538, &qword_268928548);
}

uint64_t initializeWithCopy for AppLaunchDataModels.AppResultWrapperModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237843368(a1, a2, a3, &qword_268928538);
}

uint64_t assignWithCopy for AppLaunchDataModels.AppResultWrapperModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2378433FC(a1, a2, a3, &qword_268928538);
}

uint64_t initializeWithTake for AppLaunchDataModels.AppResultWrapperModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237843498(a1, a2, a3, &qword_268928538);
}

uint64_t assignWithTake for AppLaunchDataModels.AppResultWrapperModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23784352C(a1, a2, a3, &qword_268928538);
}

uint64_t getEnumTagSinglePayload for AppLaunchDataModels.AppResultWrapperModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2378430AC);
}

uint64_t sub_2378430AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_8Tm(a1, a2, a3, (uint64_t)&qword_268928538, &qword_268928548);
}

uint64_t storeEnumTagSinglePayload for AppLaunchDataModels.AppResultWrapperModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2378430D4);
}

uint64_t sub_2378430D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_9Tm(a1, a2, a3, a4, (uint64_t)&qword_268928538, &qword_268928548);
}

void sub_2378430E8()
{
  sub_237843850(319, &qword_268928828, &qword_268928530);
  if (v0 <= 0x3F)
  {
    sub_237843850(319, &qword_268928830, &qword_268928540);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AppLaunchDataModels.AppOffloadedModel(uint64_t a1, uint64_t *a2)
{
  return sub_2378431E4(a1, a2);
}

uint64_t sub_2378431E4(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_1_16();
  if ((*(_DWORD *)(v6 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_98(*a2);
  }
  else
  {
    uint64_t v7 = v5;
    __swift_instantiateConcreteTypeFromMangledName(v4);
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_92();
    v8();
    __swift_instantiateConcreteTypeFromMangledName(v7);
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_92();
    v9();
  }
  return a1;
}

uint64_t destroy for AppLaunchDataModels.AppOffloadedModel(uint64_t a1, uint64_t a2)
{
  return sub_2378432B4(a1, a2, &qword_2689285C8, &qword_2689285D0);
}

uint64_t sub_2378432B4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_5_2();
  v7();
  uint64_t v8 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(a4);
  OUTLINED_FUNCTION_22_1();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  return v11(v8, v9);
}

uint64_t initializeWithCopy for AppLaunchDataModels.AppOffloadedModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237843368(a1, a2, a3, &qword_2689285C8);
}

uint64_t sub_237843368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  OUTLINED_FUNCTION_29_9(a1, a2, a3, a4);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_92();
  v5();
  OUTLINED_FUNCTION_36_6();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_92();
  v6();
  return v4;
}

uint64_t assignWithCopy for AppLaunchDataModels.AppOffloadedModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2378433FC(a1, a2, a3, &qword_2689285C8);
}

uint64_t sub_2378433FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  OUTLINED_FUNCTION_29_9(a1, a2, a3, a4);
  OUTLINED_FUNCTION_22_1();
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v6, v5);
  OUTLINED_FUNCTION_36_6();
  OUTLINED_FUNCTION_22_1();
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v4, v5);
  return v6;
}

uint64_t initializeWithTake for AppLaunchDataModels.AppOffloadedModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237843498(a1, a2, a3, &qword_2689285C8);
}

uint64_t sub_237843498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  OUTLINED_FUNCTION_29_9(a1, a2, a3, a4);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_59_2();
  v5();
  OUTLINED_FUNCTION_36_6();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_59_2();
  v6();
  return v4;
}

uint64_t assignWithTake for AppLaunchDataModels.AppOffloadedModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23784352C(a1, a2, a3, &qword_2689285C8);
}

uint64_t sub_23784352C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  OUTLINED_FUNCTION_29_9(a1, a2, a3, a4);
  OUTLINED_FUNCTION_22_1();
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v6, v5);
  OUTLINED_FUNCTION_36_6();
  OUTLINED_FUNCTION_22_1();
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v4, v5);
  return v6;
}

uint64_t getEnumTagSinglePayload for AppLaunchDataModels.AppOffloadedModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2378435C8);
}

uint64_t sub_2378435C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_8Tm(a1, a2, a3, (uint64_t)&qword_2689285C8, &qword_2689285D0);
}

uint64_t __swift_get_extra_inhabitant_index_8Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  OUTLINED_FUNCTION_44_3();
  __swift_instantiateConcreteTypeFromMangledName(v9);
  OUTLINED_FUNCTION_1_16();
  if (*(_DWORD *)(v10 + 84) == v5)
  {
    uint64_t v11 = OUTLINED_FUNCTION_130();
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = v6 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v11, v5, v12);
}

uint64_t storeEnumTagSinglePayload for AppLaunchDataModels.AppOffloadedModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23784366C);
}

uint64_t sub_23784366C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_9Tm(a1, a2, a3, a4, (uint64_t)&qword_2689285C8, &qword_2689285D0);
}

uint64_t __swift_store_extra_inhabitant_index_9Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  OUTLINED_FUNCTION_44_3();
  __swift_instantiateConcreteTypeFromMangledName(v8);
  OUTLINED_FUNCTION_1_16();
  if (*(_DWORD *)(v9 + 84) == a3) {
    OUTLINED_FUNCTION_97();
  }
  else {
    __swift_instantiateConcreteTypeFromMangledName(a6);
  }
  OUTLINED_FUNCTION_101();
  return __swift_storeEnumTagSinglePayload(v10, v11, v12, v13);
}

void sub_237843708()
{
  sub_2378437FC(319, &qword_268928848, (void (*)(uint64_t))type metadata accessor for AppLaunchDataModels.AppResultModel);
  if (v0 <= 0x3F)
  {
    sub_237843850(319, &qword_268928850, &qword_268927838);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2378437FC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_237859A20();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_237843850(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_237859A20();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for AppLaunchDataModels.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 5) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppLaunchDataModels.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x2378439F4);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.CodingKeys()
{
  return &type metadata for AppLaunchDataModels.CodingKeys;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.AppDisambiguationViewCodingKeys()
{
  return &type metadata for AppLaunchDataModels.AppDisambiguationViewCodingKeys;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.ButtonFallbackViewCodingKeys()
{
  return &type metadata for AppLaunchDataModels.ButtonFallbackViewCodingKeys;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.DeviceDisambiguationViewCodingKeys()
{
  return &type metadata for AppLaunchDataModels.DeviceDisambiguationViewCodingKeys;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.ConfirmationViewCodingKeys()
{
  return &type metadata for AppLaunchDataModels.ConfirmationViewCodingKeys;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.AppSearchResultViewCodingKeys()
{
  return &type metadata for AppLaunchDataModels.AppSearchResultViewCodingKeys;
}

unsigned char *_s20SiriAppLaunchIntents19AppLaunchDataModelsO31AppDisambiguationViewCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x237843B1CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.AppOffloadedViewCodingKeys()
{
  return &type metadata for AppLaunchDataModels.AppOffloadedViewCodingKeys;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.AppOffloadedModel.CodingKeys()
{
  return &type metadata for AppLaunchDataModels.AppOffloadedModel.CodingKeys;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.AppResultWrapperModel.CodingKeys()
{
  return &type metadata for AppLaunchDataModels.AppResultWrapperModel.CodingKeys;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.AppResultSashModel.CodingKeys()
{
  return &type metadata for AppLaunchDataModels.AppResultSashModel.CodingKeys;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.AppResultModel.CodingKeys()
{
  return &type metadata for AppLaunchDataModels.AppResultModel.CodingKeys;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.ConfirmationViewModel.CodingKeys()
{
  return &type metadata for AppLaunchDataModels.ConfirmationViewModel.CodingKeys;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.DeviceDisambiguationModel.CodingKeys()
{
  return &type metadata for AppLaunchDataModels.DeviceDisambiguationModel.CodingKeys;
}

uint64_t _s20SiriAppLaunchIntents19AppLaunchDataModelsO18AppResultSashModelV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_141(-1);
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_141((*a1 | (v4 << 8)) - 3);
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
      return OUTLINED_FUNCTION_141((*a1 | (v4 << 8)) - 3);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_141((*a1 | (v4 << 8)) - 3);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_141(v8);
}

unsigned char *_s20SiriAppLaunchIntents19AppLaunchDataModelsO18AppResultSashModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_140((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_137((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x237843D0CLL);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_138((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_139(result, a2 + 2);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.Device.CodingKeys()
{
  return &type metadata for AppLaunchDataModels.Device.CodingKeys;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.ButtonFallbackModel.CodingKeys()
{
  return &type metadata for AppLaunchDataModels.ButtonFallbackModel.CodingKeys;
}

uint64_t _s20SiriAppLaunchIntents19AppLaunchDataModelsO17AppOffloadedModelV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_141(-1);
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
      return OUTLINED_FUNCTION_141((*a1 | (v4 << 8)) - 2);
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
      return OUTLINED_FUNCTION_141((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_141((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_141(v8);
}

unsigned char *_s20SiriAppLaunchIntents19AppLaunchDataModelsO17AppOffloadedModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_140((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_137((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x237843E94);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_138((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_139(result, a2 + 1);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.AppDisambiguationModel.CodingKeys()
{
  return &type metadata for AppLaunchDataModels.AppDisambiguationModel.CodingKeys;
}

uint64_t _s20SiriAppLaunchIntents19AppLaunchDataModelsO21ConfirmationViewModelV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_141(-1);
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_141((*a1 | (v4 << 8)) - 4);
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
      return OUTLINED_FUNCTION_141((*a1 | (v4 << 8)) - 4);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_141((*a1 | (v4 << 8)) - 4);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_141(v8);
}

unsigned char *_s20SiriAppLaunchIntents19AppLaunchDataModelsO21ConfirmationViewModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_140((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_137((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23784400CLL);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_138((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_139(result, a2 + 3);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchDataModels.App.CodingKeys()
{
  return &type metadata for AppLaunchDataModels.App.CodingKeys;
}

unint64_t sub_237844048()
{
  unint64_t result = qword_268928858;
  if (!qword_268928858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928858);
  }
  return result;
}

unint64_t sub_237844098()
{
  unint64_t result = qword_268928860;
  if (!qword_268928860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928860);
  }
  return result;
}

unint64_t sub_2378440E8()
{
  unint64_t result = qword_268928868;
  if (!qword_268928868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928868);
  }
  return result;
}

unint64_t sub_237844138()
{
  unint64_t result = qword_268928870;
  if (!qword_268928870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928870);
  }
  return result;
}

unint64_t sub_237844188()
{
  unint64_t result = qword_268928878;
  if (!qword_268928878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928878);
  }
  return result;
}

unint64_t sub_2378441D8()
{
  unint64_t result = qword_268928880;
  if (!qword_268928880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928880);
  }
  return result;
}

unint64_t sub_237844228()
{
  unint64_t result = qword_268928888;
  if (!qword_268928888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928888);
  }
  return result;
}

unint64_t sub_237844278()
{
  unint64_t result = qword_268928890;
  if (!qword_268928890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928890);
  }
  return result;
}

unint64_t sub_2378442C8()
{
  unint64_t result = qword_268928898;
  if (!qword_268928898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928898);
  }
  return result;
}

unint64_t sub_237844318()
{
  unint64_t result = qword_2689288A0;
  if (!qword_2689288A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689288A0);
  }
  return result;
}

unint64_t sub_237844368()
{
  unint64_t result = qword_2689288A8;
  if (!qword_2689288A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689288A8);
  }
  return result;
}

unint64_t sub_2378443B8()
{
  unint64_t result = qword_2689288B0;
  if (!qword_2689288B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689288B0);
  }
  return result;
}

unint64_t sub_237844408()
{
  unint64_t result = qword_2689288B8;
  if (!qword_2689288B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689288B8);
  }
  return result;
}

unint64_t sub_237844458()
{
  unint64_t result = qword_2689288C0;
  if (!qword_2689288C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689288C0);
  }
  return result;
}

unint64_t sub_2378444A8()
{
  unint64_t result = qword_2689288C8;
  if (!qword_2689288C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689288C8);
  }
  return result;
}

unint64_t sub_2378444F8()
{
  unint64_t result = qword_2689288D0;
  if (!qword_2689288D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689288D0);
  }
  return result;
}

unint64_t sub_237844548()
{
  unint64_t result = qword_2689288D8;
  if (!qword_2689288D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689288D8);
  }
  return result;
}

unint64_t sub_237844598()
{
  unint64_t result = qword_2689288E0;
  if (!qword_2689288E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689288E0);
  }
  return result;
}

unint64_t sub_2378445E8()
{
  unint64_t result = qword_2689288E8;
  if (!qword_2689288E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689288E8);
  }
  return result;
}

unint64_t sub_237844638()
{
  unint64_t result = qword_2689288F0;
  if (!qword_2689288F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689288F0);
  }
  return result;
}

unint64_t sub_237844688()
{
  unint64_t result = qword_2689288F8;
  if (!qword_2689288F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689288F8);
  }
  return result;
}

unint64_t sub_2378446D8()
{
  unint64_t result = qword_268928900;
  if (!qword_268928900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928900);
  }
  return result;
}

unint64_t sub_237844728()
{
  unint64_t result = qword_268928908;
  if (!qword_268928908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928908);
  }
  return result;
}

unint64_t sub_237844778()
{
  unint64_t result = qword_268928910;
  if (!qword_268928910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928910);
  }
  return result;
}

unint64_t sub_2378447C8()
{
  unint64_t result = qword_268928918;
  if (!qword_268928918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928918);
  }
  return result;
}

unint64_t sub_237844818()
{
  unint64_t result = qword_268928920;
  if (!qword_268928920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928920);
  }
  return result;
}

unint64_t sub_237844868()
{
  unint64_t result = qword_268928928;
  if (!qword_268928928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928928);
  }
  return result;
}

unint64_t sub_2378448B8()
{
  unint64_t result = qword_268928930;
  if (!qword_268928930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928930);
  }
  return result;
}

unint64_t sub_237844908()
{
  unint64_t result = qword_268928938;
  if (!qword_268928938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928938);
  }
  return result;
}

unint64_t sub_237844958()
{
  unint64_t result = qword_268928940;
  if (!qword_268928940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928940);
  }
  return result;
}

unint64_t sub_2378449A8()
{
  unint64_t result = qword_268928948;
  if (!qword_268928948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928948);
  }
  return result;
}

unint64_t sub_2378449F8()
{
  unint64_t result = qword_268928950;
  if (!qword_268928950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928950);
  }
  return result;
}

unint64_t sub_237844A48()
{
  unint64_t result = qword_268928958;
  if (!qword_268928958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928958);
  }
  return result;
}

unint64_t sub_237844A98()
{
  unint64_t result = qword_268928960;
  if (!qword_268928960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928960);
  }
  return result;
}

unint64_t sub_237844AE8()
{
  unint64_t result = qword_268928968;
  if (!qword_268928968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928968);
  }
  return result;
}

unint64_t sub_237844B38()
{
  unint64_t result = qword_268928970;
  if (!qword_268928970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928970);
  }
  return result;
}

unint64_t sub_237844B88()
{
  unint64_t result = qword_268928978;
  if (!qword_268928978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928978);
  }
  return result;
}

unint64_t sub_237844BD8()
{
  unint64_t result = qword_268928980;
  if (!qword_268928980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928980);
  }
  return result;
}

unint64_t sub_237844C28()
{
  unint64_t result = qword_268928988;
  if (!qword_268928988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928988);
  }
  return result;
}

unint64_t sub_237844C78()
{
  unint64_t result = qword_268928990;
  if (!qword_268928990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928990);
  }
  return result;
}

unint64_t sub_237844CC8()
{
  unint64_t result = qword_268928998;
  if (!qword_268928998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928998);
  }
  return result;
}

unint64_t sub_237844D18()
{
  unint64_t result = qword_2689289A0;
  if (!qword_2689289A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689289A0);
  }
  return result;
}

unint64_t sub_237844D68()
{
  unint64_t result = qword_2689289A8;
  if (!qword_2689289A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689289A8);
  }
  return result;
}

unint64_t sub_237844DB8()
{
  unint64_t result = qword_2689289B0;
  if (!qword_2689289B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689289B0);
  }
  return result;
}

unint64_t sub_237844E08()
{
  unint64_t result = qword_2689289B8;
  if (!qword_2689289B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689289B8);
  }
  return result;
}

unint64_t sub_237844E58()
{
  unint64_t result = qword_2689289C0;
  if (!qword_2689289C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689289C0);
  }
  return result;
}

unint64_t sub_237844EA8()
{
  unint64_t result = qword_2689289C8;
  if (!qword_2689289C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689289C8);
  }
  return result;
}

unint64_t sub_237844EF8()
{
  unint64_t result = qword_2689289D0;
  if (!qword_2689289D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689289D0);
  }
  return result;
}

unint64_t sub_237844F48()
{
  unint64_t result = qword_2689289D8;
  if (!qword_2689289D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689289D8);
  }
  return result;
}

unint64_t sub_237844F98()
{
  unint64_t result = qword_2689289E0;
  if (!qword_2689289E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689289E0);
  }
  return result;
}

unint64_t sub_237844FE8()
{
  unint64_t result = qword_2689289E8;
  if (!qword_2689289E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689289E8);
  }
  return result;
}

uint64_t sub_237845034()
{
  return sub_23778BF84();
}

uint64_t sub_237845068(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_237787078(a1, a2);
  }
  return a1;
}

char *OUTLINED_FUNCTION_5_21@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_6_20()
{
  return sub_23785BDD0();
}

void *OUTLINED_FUNCTION_10_15()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_11_13(uint64_t a1)
{
  return MEMORY[0x270F756A8](v1, a1);
}

uint64_t OUTLINED_FUNCTION_12_14()
{
  return sub_23785BDD0();
}

uint64_t OUTLINED_FUNCTION_15_13()
{
  return sub_23785BD80();
}

uint64_t OUTLINED_FUNCTION_17_16()
{
  return sub_23785BD00();
}

uint64_t OUTLINED_FUNCTION_21_13()
{
  return sub_23785BD60();
}

void OUTLINED_FUNCTION_22_9()
{
  *(unsigned char *)(v0 - 66) = 1;
}

uint64_t OUTLINED_FUNCTION_26_11()
{
  return v1 + *(int *)(v0 + 20);
}

uint64_t OUTLINED_FUNCTION_29_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return __swift_instantiateConcreteTypeFromMangledName(a4);
}

void OUTLINED_FUNCTION_32_5()
{
  *(unsigned char *)(v0 - 66) = 1;
}

uint64_t OUTLINED_FUNCTION_33_9()
{
  *(void *)(v1 - 104) = v0;
  return sub_23785BD60();
}

uint64_t OUTLINED_FUNCTION_35_6()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_36_6()
{
  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_39_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42_5()
{
  return v0 + *(int *)(*(void *)(v1 - 168) + 24);
}

uint64_t OUTLINED_FUNCTION_43_5()
{
  return *(void *)(v0 - 160) + *(int *)(*(void *)(v0 - 168) + 20);
}

uint64_t OUTLINED_FUNCTION_45_4()
{
  return *(void *)(v0 - 160) + *(int *)(*(void *)(v0 - 152) + 20);
}

uint64_t OUTLINED_FUNCTION_46_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_49_3()
{
  return sub_23785BD60();
}

uint64_t OUTLINED_FUNCTION_53_3(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_55_1(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_56_4()
{
  uint64_t result = *(void *)(v0 - 160);
  *(void *)(v0 - 104) = *(void *)(*(void *)(v0 - 120) + 32);
  return result;
}

uint64_t OUTLINED_FUNCTION_60_2()
{
  return sub_23785BD60();
}

uint64_t OUTLINED_FUNCTION_61_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_64_3(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return sub_2378356EC(v2, v1);
}

uint64_t OUTLINED_FUNCTION_67_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_68_3()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_70_2(uint64_t a1)
{
  *uint64_t v1 = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_71_3(uint64_t a1)
{
  return v1 + *(int *)(a1 + 20);
}

uint64_t OUTLINED_FUNCTION_72_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_76_0()
{
  return sub_23785BEC0();
}

uint64_t OUTLINED_FUNCTION_83_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_84_1()
{
  return 0;
}

void OUTLINED_FUNCTION_85_1(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 112) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_86_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 120) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_87_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_88_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_89_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_90_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_91_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_94_0()
{
  return sub_23785BF10();
}

uint64_t OUTLINED_FUNCTION_95()
{
  return sub_23785BF10();
}

uint64_t OUTLINED_FUNCTION_96()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_97()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_98(uint64_t a1)
{
  *uint64_t v1 = a1;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_102()
{
  return sub_23785BD60();
}

uint64_t OUTLINED_FUNCTION_104()
{
  return sub_23785BDD0();
}

uint64_t OUTLINED_FUNCTION_105()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_106()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_107()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_108()
{
  return sub_23785BF10();
}

uint64_t OUTLINED_FUNCTION_109()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_110()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_113(uint64_t a1)
{
  *uint64_t v1 = a1;
  return type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(0);
}

uint64_t OUTLINED_FUNCTION_114(uint64_t a1)
{
  *uint64_t v1 = a1;
  return type metadata accessor for AppLaunchDataModels.App(0);
}

uint64_t OUTLINED_FUNCTION_116()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_117()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_118(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_119()
{
  return v0;
}

void *OUTLINED_FUNCTION_120()
{
  return __swift_project_boxed_opaque_existential_1(v0, v1);
}

uint64_t OUTLINED_FUNCTION_122()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_126()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_129()
{
  return sub_23785BD60();
}

uint64_t OUTLINED_FUNCTION_130()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_131()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_133()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_134()
{
  return 0;
}

void OUTLINED_FUNCTION_136(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 104) = (char *)&a9 - v9;
}

uint64_t OUTLINED_FUNCTION_137@<X0>(uint64_t result@<X0>, __int16 a2@<W8>)
{
  *(_WORD *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_138@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 1) = a2;
  return result;
}

unsigned char *OUTLINED_FUNCTION_139@<X0>(unsigned char *result@<X0>, char a2@<W8>)
{
  *uint64_t result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_140@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  *(unsigned char *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_141@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

ValueMetadata *type metadata accessor for AppLaunchFeatureFlagsImpl()
{
  return &type metadata for AppLaunchFeatureFlagsImpl;
}

unsigned char *storeEnumTagSinglePayload for Features(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x237845B58);
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

ValueMetadata *type metadata accessor for Features()
{
  return &type metadata for Features;
}

unint64_t sub_237845B94()
{
  unint64_t result = qword_268928A00;
  if (!qword_268928A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928A00);
  }
  return result;
}

const char *sub_237845BE0()
{
  return "SiriAppLaunch";
}

const char *sub_237845BF4(char a1)
{
  if (a1) {
    return "applaunch_watchos_cdtvc";
  }
  else {
    return "applaunch_QuickAction";
  }
}

const char *sub_237845C20()
{
  return sub_237845BE0();
}

const char *sub_237845C28()
{
  return sub_237845BF4(*v0);
}

uint64_t static AppSearchCommands.searchMarketplaceActionProperty(appName:marketplace:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F647C0]), sel_init);
  sub_2378461A8(a3, a4, v8);
  sub_237846200(a1, a2, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268926DC8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_23785CD50;
  uint64_t v10 = sub_2378599C0();
  uint64_t v11 = MEMORY[0x263F771C8];
  *(void *)(v9 + 56) = v10;
  *(void *)(v9 + 64) = v11;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v9 + 32));
  uint64_t *boxed_opaque_existential_0 = (uint64_t)v8;
  *((unsigned char *)boxed_opaque_existential_0 + 8) = 0;
  (*(void (**)(void))(*(void *)(v10 - 8) + 104))();
  return sub_2378599A0();
}

uint64_t static AppSearchCommands.searchAppStoreActionProperty(appName:)()
{
  id v0 = static AppSearchCommands.searchAppStoreAceCommand(appName:)();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268926DC8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_23785CD50;
  uint64_t v2 = sub_2378599C0();
  uint64_t v3 = MEMORY[0x263F771C8];
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 64) = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v1 + 32));
  uint64_t *boxed_opaque_existential_0 = (uint64_t)v0;
  *((unsigned char *)boxed_opaque_existential_0 + 8) = 0;
  (*(void (**)(void))(*(void *)(v2 - 8) + 104))();
  return sub_2378599A0();
}

id static AppSearchCommands.searchAppStoreAceCommand(appName:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926860);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2378592A0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237859290();
  sub_237859280();
  MEMORY[0x237E1FE20](0, 0xE000000000000000);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689277D8);
  sub_237859240();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23785CDF0;
  sub_237859230();
  sub_237859230();
  sub_237859230();
  sub_237859250();
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  sub_237859260();
  uint64_t v8 = sub_237859340();
  uint64_t v9 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v8) != 1)
  {
    uint64_t v9 = (void *)sub_237859310();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v2, v8);
  }
  objc_msgSend(v7, sel_setPunchOutUri_, v9);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

id static AppSearchCommands.searchMarketplaceAceCommand(appName:marketplace:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F647C0]), sel_init);
  sub_2378461A8(a3, a4, v8);
  sub_237846200(a1, a2, v8);
  return v8;
}

void sub_2378461A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_23785B6A0();
  objc_msgSend(a3, sel_setMarketplace_, v4);
}

void sub_237846200(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_23785B6A0();
  objc_msgSend(a3, sel_setKeyword_, v4);
}

ValueMetadata *type metadata accessor for AppSearchCommands()
{
  return &type metadata for AppSearchCommands;
}

unint64_t static BundleIDs.appStore.getter()
{
  return 0xD000000000000012;
}

ValueMetadata *type metadata accessor for BundleIDs()
{
  return &type metadata for BundleIDs;
}

void sub_237846298()
{
  sub_23785B9D0();
  if (v0 <= 0x3F)
  {
    sub_2378464A0();
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

uint64_t sub_237846384()
{
  swift_release();
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  uint64_t v2 = sub_23785B9D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_23781F4F8(v0 + *(void *)(*(void *)v0 + 112));
  return v0;
}

uint64_t sub_237846430()
{
  sub_237846384();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for Cache()
{
  return __swift_instantiateGenericMetadata();
}

void sub_2378464A0()
{
  if (!qword_26AF0BD80[0])
  {
    sub_2378593F0();
    unint64_t v0 = sub_23785B9D0();
    if (!v1) {
      atomic_store(v0, qword_26AF0BD80);
    }
  }
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_237846528@<X0>(uint64_t a1@<X8>)
{
  uint64_t v92 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926BB8);
  MEMORY[0x270FA5388](v1 - 8);
  OUTLINED_FUNCTION_1_4();
  uint64_t v80 = v2;
  OUTLINED_FUNCTION_26_1();
  sub_23785A720();
  OUTLINED_FUNCTION_1_2();
  uint64_t v78 = v4;
  uint64_t v79 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_4();
  uint64_t v77 = v5;
  OUTLINED_FUNCTION_26_1();
  uint64_t v86 = sub_23785A7C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v81 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v76 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v75 = (char *)&v75 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v82 = (char *)&v75 - v12;
  OUTLINED_FUNCTION_26_1();
  uint64_t v83 = sub_23785A680();
  OUTLINED_FUNCTION_1_2();
  uint64_t v85 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1_4();
  uint64_t v84 = v15;
  OUTLINED_FUNCTION_26_1();
  sub_23785A630();
  OUTLINED_FUNCTION_1_2();
  uint64_t v87 = v17;
  uint64_t v88 = v16;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1_4();
  uint64_t v91 = v18;
  OUTLINED_FUNCTION_26_1();
  uint64_t v90 = type metadata accessor for AppLaunchIntent();
  MEMORY[0x270FA5388](v90);
  OUTLINED_FUNCTION_1_4();
  uint64_t v89 = v19;
  OUTLINED_FUNCTION_26_1();
  uint64_t v20 = sub_23785AEF0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v75 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_23785A640();
  OUTLINED_FUNCTION_1_2();
  uint64_t v28 = v27;
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v75 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = (char *)&v75 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  uint64_t v38 = (char *)&v75 - v37;
  MEMORY[0x270FA5388](v36);
  uint64_t v40 = (char *)&v75 - v39;
  sub_23785A5B0();
  int v41 = (*(uint64_t (**)(char *, uint64_t))(v28 + 88))(v40, v26);
  if (v41 != *MEMORY[0x263F6FF50])
  {
    uint64_t v48 = v28;
    if (v41 == *MEMORY[0x263F6FF70])
    {
      uint64_t v46 = v28;
      OUTLINED_FUNCTION_8_0();
      v49();
      (*(void (**)(char *, uint64_t))(v28 + 96))(v35, v26);
      OUTLINED_FUNCTION_38_0();
      v50();
      if (sub_23785A610() == 0xD00000000000002ELL && v51 == 0x8000000237865420)
      {
        swift_bridgeObjectRelease();
LABEL_17:
        sub_23785A0E0();
        uint64_t v59 = OUTLINED_FUNCTION_4_21();
        v60(v59);
        uint64_t v47 = v40;
        return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v47, v26);
      }
      char v58 = sub_23785BE30();
      swift_bridgeObjectRelease();
      if (v58) {
        goto LABEL_17;
      }
      uint64_t v69 = OUTLINED_FUNCTION_4_21();
      v70(v69);
      uint64_t v47 = v40;
LABEL_21:
      sub_23785A0F0();
      uint64_t v46 = v28;
      return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v47, v26);
    }
    uint64_t v47 = v40;
    if (v41 != *MEMORY[0x263F6FF80]) {
      goto LABEL_21;
    }
    OUTLINED_FUNCTION_8_0();
    v52();
    (*(void (**)(char *, uint64_t))(v28 + 96))(v32, v26);
    uint64_t v53 = v83;
    OUTLINED_FUNCTION_38_0();
    v54();
    uint64_t v55 = v77;
    sub_23785A660();
    uint64_t v56 = sub_23785A6F0();
    (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v55, v79);
    uint64_t v57 = v80;
    sub_23780B1FC(v56, v80);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload(v57, 1, v86) == 1)
    {
      sub_2377DB6D8(v57);
      uint64_t v46 = v28;
LABEL_15:
      sub_23785A0F0();
      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v84, v53);
      return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v47, v26);
    }
    uint64_t v62 = v81;
    uint64_t v61 = v82;
    OUTLINED_FUNCTION_38_0();
    v63();
    char v64 = sub_23785A760();
    uint64_t v65 = v86;
    char v66 = v64;
    uint64_t v67 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
    v67(v75, v61, v86);
    if (v66)
    {
      char v68 = 1;
    }
    else
    {
      char v71 = sub_23785A770();
      uint64_t v65 = v86;
      char v68 = v71;
    }
    uint64_t v46 = v48;
    uint64_t v72 = *(void (**)(void))(v81 + 8);
    OUTLINED_FUNCTION_2_18();
    v72();
    v67(v76, v82, v65);
    if (v68)
    {
      OUTLINED_FUNCTION_2_18();
      v72();
      uint64_t v47 = v40;
    }
    else
    {
      char v73 = sub_23785A780();
      OUTLINED_FUNCTION_2_18();
      v72();
      uint64_t v47 = v40;
      if ((v73 & 1) == 0)
      {
        OUTLINED_FUNCTION_2_18();
        v72();
        uint64_t v53 = v83;
        goto LABEL_15;
      }
    }
    sub_23785A0E0();
    OUTLINED_FUNCTION_2_18();
    v72();
    (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v84, v83);
    return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v47, v26);
  }
  OUTLINED_FUNCTION_8_0();
  v42();
  (*(void (**)(char *, uint64_t))(v28 + 96))(v38, v26);
  OUTLINED_FUNCTION_38_0();
  v43();
  uint64_t v44 = v89;
  OUTLINED_FUNCTION_8_0();
  v45();
  uint64_t v46 = v28;
  uint64_t v47 = v40;
  if (qword_268926780 != -1) {
    swift_once();
  }
  sub_23778BA88();
  sub_23785ABB0();
  if (v93 >= 2u) {
    sub_23785A0D0();
  }
  else {
    sub_23785A0E0();
  }
  sub_23779FC4C(v44);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v47, v26);
}

uint64_t OUTLINED_FUNCTION_4_21()
{
  return *(void *)(v0 - 112);
}

void sub_237846D20(char a1)
{
  sub_23785B4B0();
  OUTLINED_FUNCTION_0_10();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_9_0();
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v2, (uint64_t)qword_268928BC8);
  uint64_t v7 = OUTLINED_FUNCTION_2_19();
  v8(v7);
  uint64_t v9 = sub_23785B490();
  os_log_type_t v10 = sub_23785B8D0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    aBlock[0] = v12;
    if (a1) {
      uint64_t v13 = 0x73736563637573;
    }
    else {
      uint64_t v13 = 0x6572756C696166;
    }
    sub_2377C6A68(v13, 0xE700000000000000, aBlock);
    sub_23785B9E0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237778000, v9, v10, "CoreAnalyticsService#reportSubmitToRemoteResults sending a com.apple.siri.applaunch.submitToRemoteResults event with unint64_t result = %s.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237E23210](v12, -1, -1);
    MEMORY[0x237E23210](v11, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v2);
  uint64_t v14 = (void *)OUTLINED_FUNCTION_4_22();
  uint64_t v15 = swift_allocObject();
  *(unsigned char *)(v15 + 16) = a1 & 1;
  aBlock[4] = (uint64_t)sub_237847718;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_237847070;
  aBlock[3] = (uint64_t)&block_descriptor_16;
  uint64_t v16 = _Block_copy(aBlock);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v16);
}

uint64_t sub_237846FD0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928A08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23785CD50;
  *(void *)(inited + 32) = 0x746C75736572;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = sub_23785B800();
  sub_23778F458(0, (unint64_t *)&qword_268926E98);
  return sub_23785B650();
}

id sub_237847070(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_23778F458(0, (unint64_t *)&qword_268926E98);
    uint64_t v4 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

void sub_23784710C(char a1, uint64_t a2)
{
  uint64_t v4 = (void *)OUTLINED_FUNCTION_4_22();
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v7[4] = sub_237847700;
  v7[5] = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  id v7[2] = sub_237847070;
  v7[3] = &block_descriptor_10;
  uint64_t v6 = _Block_copy(v7);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v6);
}

uint64_t sub_2378471F0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928A08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23785CD40;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x8000000237867900;
  uint64_t v1 = sub_23785B6A0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v1;
  *(void *)(inited + 56) = 0x7250656369766564;
  *(void *)(inited + 64) = 0xEF7974696D69786FLL;
  *(void *)(inited + 72) = sub_23785B870();
  sub_23778F458(0, (unint64_t *)&qword_268926E98);
  return sub_23785B650();
}

void sub_23784738C(uint64_t a1)
{
  sub_23785B4B0();
  OUTLINED_FUNCTION_0_10();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_9_0();
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v2, (uint64_t)qword_268928BC8);
  uint64_t v7 = OUTLINED_FUNCTION_2_19();
  v8(v7);
  uint64_t v9 = sub_23785B490();
  os_log_type_t v10 = sub_23785B8A0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 134217984;
    aBlock[0] = a1;
    sub_23785B9E0();
    _os_log_impl(&dword_237778000, v9, v10, "sending com.apple.siri.applaunch.cdtvc.deviceDisambigSelectedSlot with spot %ld", v11, 0xCu);
    MEMORY[0x237E23210](v11, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v2);
  uint64_t v12 = (void *)sub_23785B6A0();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  aBlock[4] = sub_2378476D4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237847070;
  aBlock[3] = &block_descriptor_3;
  uint64_t v14 = _Block_copy(aBlock);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v14);
}

uint64_t sub_2378475C0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928A08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23785CD40;
  *(void *)(inited + 32) = 0x65636E6174736E69;
  *(void *)(inited + 40) = 0xE800000000000000;
  sub_23778F458(0, &qword_268927920);
  *(void *)(inited + 48) = sub_23785B980();
  *(void *)(inited + 56) = 1953460339;
  *(void *)(inited + 64) = 0xE400000000000000;
  *(void *)(inited + 72) = sub_23785B870();
  sub_23778F458(0, (unint64_t *)&qword_268926E98);
  return sub_23785B650();
}

uint64_t type metadata accessor for CoreAnalyticsService()
{
  return self;
}

uint64_t sub_2378476C8()
{
  return OUTLINED_FUNCTION_1_17(v0, 24);
}

uint64_t sub_2378476D4()
{
  return sub_2378475C0();
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

uint64_t sub_2378476F4()
{
  return OUTLINED_FUNCTION_1_17(v0, 32);
}

uint64_t sub_237847700()
{
  return sub_2378471F0();
}

uint64_t sub_23784770C()
{
  return OUTLINED_FUNCTION_1_17(v0, 17);
}

uint64_t sub_237847718()
{
  return sub_237846FD0();
}

uint64_t OUTLINED_FUNCTION_1_17(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0238](a1, a2, 7);
}

uint64_t OUTLINED_FUNCTION_2_19()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_22()
{
  return sub_23785B6A0();
}

uint64_t destroy for DialogResponseUtil(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  return swift_release();
}

uint64_t initializeWithCopy for DialogResponseUtil(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DialogResponseUtil(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  return a1;
}

void *__swift_memcpy89_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x59uLL);
}

uint64_t assignWithTake for DialogResponseUtil(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for DialogResponseUtil(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 89))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for DialogResponseUtil(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 88) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 89) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 89) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DialogResponseUtil()
{
  return &type metadata for DialogResponseUtil;
}

uint64_t sub_237847A0C()
{
  OUTLINED_FUNCTION_13();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE8);
  OUTLINED_FUNCTION_2_0(v3);
  uint64_t v4 = OUTLINED_FUNCTION_6_1();
  uint64_t v5 = OUTLINED_FUNCTION_23_14(v4);
  OUTLINED_FUNCTION_2_0(v5);
  v1[5] = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_237847AA4()
{
  OUTLINED_FUNCTION_13();
  type metadata accessor for LaunchAppCATPatternsExecutor(0);
  OUTLINED_FUNCTION_21_14();
  uint64_t v0 = OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_19_12(v0);
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_18_11(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_237847B40;
  char v4 = OUTLINED_FUNCTION_13_15();
  return sub_23777E5EC(v4);
}

uint64_t sub_237847B40()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2();
  *char v4 = v3;
  *char v4 = *v1;
  OUTLINED_FUNCTION_17_17(v5);
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_237847C24()
{
  OUTLINED_FUNCTION_13();
  uint64_t v0 = sub_23785A280();
  OUTLINED_FUNCTION_7_14(v0);
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_12_15(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_237847CC4;
  OUTLINED_FUNCTION_11_14();
  OUTLINED_FUNCTION_15_14();
  return sub_237849880(v4, v5, v6, v7, v8, v9);
}

uint64_t sub_237847CC4()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  *uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 32);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_2();
  void *v7 = v6;
  *(void *)(v8 + 88) = v0;
  swift_task_dealloc();
  sub_237849C68(v5);
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_237847DC0()
{
  OUTLINED_FUNCTION_13();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE8);
  OUTLINED_FUNCTION_2_0(v3);
  uint64_t v4 = OUTLINED_FUNCTION_6_1();
  uint64_t v5 = OUTLINED_FUNCTION_23_14(v4);
  OUTLINED_FUNCTION_2_0(v5);
  v1[5] = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_237847E58()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *(void *)(v0 + 24);
  type metadata accessor for CloseAppCATPatternsExecutor();
  OUTLINED_FUNCTION_21_14();
  uint64_t v2 = OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_19_12(v2);
  char v3 = *(unsigned char *)(v1 + 88);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_18_11(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_237847F08;
  char v7 = OUTLINED_FUNCTION_13_15();
  return sub_23777B6AC(v7, v3);
}

uint64_t sub_237847F08()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  OUTLINED_FUNCTION_17_17(v5);
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_237847FEC()
{
  OUTLINED_FUNCTION_13();
  uint64_t v0 = sub_23785A280();
  OUTLINED_FUNCTION_7_14(v0);
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_12_15(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_23784808C;
  OUTLINED_FUNCTION_11_14();
  OUTLINED_FUNCTION_16_14();
  return sub_237849880(v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23784808C()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  *uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 32);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_2();
  void *v7 = v6;
  *(void *)(v8 + 88) = v0;
  swift_task_dealloc();
  sub_237849C68(v5);
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_237848188()
{
  OUTLINED_FUNCTION_13();

  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_0();
  return v1();
}

uint64_t sub_2378481F4()
{
  OUTLINED_FUNCTION_13();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_27();
  return v0();
}

uint64_t sub_237848260()
{
  OUTLINED_FUNCTION_13();

  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_27();
  return v1();
}

uint64_t sub_2378482CC()
{
  OUTLINED_FUNCTION_13();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  *(unsigned char *)(v1 + 112) = v3;
  *(void *)(v1 + 16) = v4;
  *(void *)(v1 + 24) = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE8);
  OUTLINED_FUNCTION_2_0(v6);
  *(void *)(v1 + 48) = OUTLINED_FUNCTION_6_1();
  uint64_t v7 = sub_23785B150();
  OUTLINED_FUNCTION_2_0(v7);
  *(void *)(v1 + 56) = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_237848374()
{
  OUTLINED_FUNCTION_4();
  type metadata accessor for LaunchAppCATPatternsExecutor(0);
  sub_23785B140();
  *(void *)(v0 + 64) = sub_23785B0E0();
  char v3 = (uint64_t (__cdecl *)())((char *)&dword_2689268F8 + dword_2689268F8);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_237848468;
  OUTLINED_FUNCTION_13_15();
  return v3();
}

uint64_t sub_237848468()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 80) = v5;
  *(void *)(v3 + 88) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_237848554()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = sub_23785A280();
  OUTLINED_FUNCTION_7_14(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_237848604;
  OUTLINED_FUNCTION_16_14();
  return sub_237849880(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_237848604()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  *uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 48);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_2();
  void *v7 = v6;
  *(void *)(v8 + 104) = v0;
  swift_task_dealloc();
  sub_237849C68(v5);
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_237848700()
{
  OUTLINED_FUNCTION_13();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_27();
  return v0();
}

uint64_t sub_23784876C()
{
  OUTLINED_FUNCTION_13();
  v1[4] = v2;
  v1[5] = v0;
  v1[2] = v3;
  v1[3] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE8);
  OUTLINED_FUNCTION_2_0(v5);
  v1[6] = OUTLINED_FUNCTION_6_1();
  uint64_t v6 = sub_23785B150();
  OUTLINED_FUNCTION_2_0(v6);
  v1[7] = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_237848810()
{
  type metadata accessor for LaunchAppCATPatternsExecutor(0);
  swift_bridgeObjectRetain();
  sub_23785B140();
  *(void *)(v0 + 64) = sub_23785B0E0();
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_2689268F0 + dword_2689268F0);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_237848924;
  OUTLINED_FUNCTION_13_15();
  return v3();
}

uint64_t sub_237848924()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 80) = v5;
  *(void *)(v3 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_237848A24()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = sub_23785A280();
  OUTLINED_FUNCTION_7_14(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_237848AD4;
  OUTLINED_FUNCTION_16_14();
  return sub_237849880(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_237848AD4()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  *uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 48);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_2();
  void *v7 = v6;
  *(void *)(v8 + 104) = v0;
  swift_task_dealloc();
  sub_237849C68(v5);
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_237848BD0()
{
  OUTLINED_FUNCTION_13();

  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_0();
  return v1();
}

uint64_t sub_237848C3C()
{
  OUTLINED_FUNCTION_13();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_27();
  return v0();
}

uint64_t sub_237848CBC()
{
  OUTLINED_FUNCTION_13();

  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_27();
  return v1();
}

void sub_237848D28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237859340();
  OUTLINED_FUNCTION_1_2();
  uint64_t v6 = v5;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v51 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v50 = (char *)&v42 - v10;
  uint64_t v11 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926860);
  uint64_t v18 = OUTLINED_FUNCTION_2_0(v17);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v42 - v22;
  sub_2378494F8(a1, a2);
  id v25 = v24;
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  sub_237859330();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, v4) == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v27 = (void *)sub_237859310();
    uint64_t v49 = v6;
    uint64_t v48 = *(void (**)(char *, uint64_t))(v6 + 8);
    v48(v23, v4);
    objc_msgSend(v26, sel_setPunchOutUri_, v27);

    if (qword_268926828 != -1) {
      swift_once();
    }
    uint64_t v28 = __swift_project_value_buffer(v11, (uint64_t)qword_268928D70);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v28, v11);
    id v25 = v26;
    uint64_t v29 = v13;
    uint64_t v30 = sub_23785B490();
    int v31 = sub_23785B8A0();
    if (!os_log_type_enabled(v30, (os_log_type_t)v31))
    {

      (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v11);
      return;
    }
    int v44 = v31;
    uint64_t v45 = v16;
    uint64_t v46 = v29;
    uint64_t v47 = v11;
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v53 = v43;
    *(_DWORD *)uint64_t v32 = 136315138;
    id v33 = objc_msgSend(v25, sel_punchOutUri);
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = v51;
      sub_237859320();

      uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v49 + 32);
      v36(v21, v35, v4);
      __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v4);
      if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v4) != 1)
      {
        uint64_t v37 = v50;
        v36(v50, v21, v4);
        sub_237849E68();
        uint64_t v38 = sub_23785BE00();
        unint64_t v40 = v39;
        v48(v37, v4);
        uint64_t v52 = sub_2377C6A68(v38, v40, &v53);
        sub_23785B9E0();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237778000, v30, (os_log_type_t)v44, "Adding button punchout: %s", v32, 0xCu);
        uint64_t v41 = v43;
        swift_arrayDestroy();
        MEMORY[0x237E23210](v41, -1, -1);
        MEMORY[0x237E23210](v32, -1, -1);

        (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v47);
        return;
      }

      goto LABEL_12;
    }
  }

  __swift_storeEnumTagSinglePayload((uint64_t)v21, 1, 1, v4);
LABEL_12:
  __break(1u);
}

uint64_t sub_2378491F0()
{
  OUTLINED_FUNCTION_13();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE8);
  OUTLINED_FUNCTION_2_0(v3);
  uint64_t v4 = OUTLINED_FUNCTION_6_1();
  uint64_t v5 = OUTLINED_FUNCTION_23_14(v4);
  OUTLINED_FUNCTION_2_0(v5);
  v1[5] = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_237849288()
{
  OUTLINED_FUNCTION_13();
  type metadata accessor for CloseAppCATPatternsExecutor();
  OUTLINED_FUNCTION_21_14();
  uint64_t v0 = OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_19_12(v0);
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_18_11(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_237849324;
  char v4 = OUTLINED_FUNCTION_13_15();
  return sub_23777B400(v4);
}

uint64_t sub_237849324()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2();
  *char v4 = v3;
  *char v4 = *v1;
  OUTLINED_FUNCTION_17_17(v5);
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_237849408()
{
  OUTLINED_FUNCTION_4();
  sub_23785AE30();
  OUTLINED_FUNCTION_20_6();
  sub_23785AE20();
  sub_23785AD20();
  OUTLINED_FUNCTION_20_6();
  sub_23785AD10();
  sub_23785AE60();
  swift_release();
  sub_237810EC0();
  swift_release();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_12_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_23784808C;
  OUTLINED_FUNCTION_11_14();
  OUTLINED_FUNCTION_15_14();
  return sub_237849880(v3, v4, v5, v6, v7, v8);
}

unint64_t sub_2378494F8(uint64_t a1, uint64_t a2)
{
  unint64_t result = 0xD000000000000024;
  if (a2)
  {
    sub_23785B720();
    sub_23785B720();
    swift_bridgeObjectRelease();
    return 0xD000000000000024;
  }
  return result;
}

uint64_t sub_237849578()
{
  OUTLINED_FUNCTION_13();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE8);
  OUTLINED_FUNCTION_2_0(v3);
  uint64_t v4 = OUTLINED_FUNCTION_6_1();
  uint64_t v5 = OUTLINED_FUNCTION_23_14(v4);
  OUTLINED_FUNCTION_2_0(v5);
  v1[5] = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_237849610()
{
  OUTLINED_FUNCTION_13();
  type metadata accessor for LaunchAppCATPatternsExecutor(0);
  OUTLINED_FUNCTION_21_14();
  uint64_t v0 = OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_19_12(v0);
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_18_11(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_2378496AC;
  char v4 = OUTLINED_FUNCTION_13_15();
  return sub_23777EC40(v4);
}

uint64_t sub_2378496AC()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2();
  *char v4 = v3;
  *char v4 = *v1;
  OUTLINED_FUNCTION_17_17(v5);
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_237849790()
{
  OUTLINED_FUNCTION_4();
  sub_23785AE10();
  OUTLINED_FUNCTION_20_6();
  sub_23785AE00();
  sub_23785AD20();
  OUTLINED_FUNCTION_20_6();
  sub_23785AD10();
  sub_23785AE60();
  swift_release();
  sub_237810EC0();
  swift_release();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_12_15(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_237847CC4;
  OUTLINED_FUNCTION_11_14();
  OUTLINED_FUNCTION_15_14();
  return sub_237849880(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_237849880(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v7 + 40) = a6;
  *(void *)(v7 + 48) = v6;
  *(void *)(v7 + 24) = a2;
  *(void *)(v7 + 32) = a5;
  *(unsigned char *)(v7 + 105) = a4;
  *(unsigned char *)(v7 + 104) = a3;
  *(void *)(v7 + 16) = a1;
  sub_23785A020();
  *(void *)(v7 + 56) = swift_task_alloc();
  uint64_t v8 = sub_23785A4E0();
  *(void *)(v7 + 64) = v8;
  *(void *)(v7 + 72) = *(void *)(v8 - 8);
  *(void *)(v7 + 80) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23784997C, 0, 0);
}

uint64_t sub_23784997C()
{
  uint64_t v1 = *(void **)(v0 + 48);
  char v2 = *(unsigned char *)(v0 + 105);
  char v3 = *(unsigned char *)(v0 + 104);
  long long v12 = *(_OWORD *)(v0 + 32);
  sub_237859FF0();
  uint64_t v4 = swift_task_alloc();
  *(unsigned char *)(v4 + 16) = v3;
  *(unsigned char *)(v4 + 17) = v2;
  *(_OWORD *)(v4 + 24) = v12;
  sub_23785A460();
  swift_task_dealloc();
  uint64_t v5 = v1[8];
  uint64_t v6 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v5);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v7;
  void *v7 = v0;
  v7[1] = sub_237849AB4;
  uint64_t v8 = *(void *)(v0 + 80);
  uint64_t v9 = *(void *)(v0 + 16);
  uint64_t v10 = *(void *)(v0 + 24);
  return MEMORY[0x270F67AD8](v9, v10, v8, v5, v6);
}

uint64_t sub_237849AB4()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  *char v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_237849B94()
{
  OUTLINED_FUNCTION_13();
  uint64_t v0 = OUTLINED_FUNCTION_14_10();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_0();
  return v2();
}

uint64_t sub_237849BFC()
{
  OUTLINED_FUNCTION_13();
  uint64_t v0 = OUTLINED_FUNCTION_14_10();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_27();
  return v2();
}

uint64_t sub_237849C68(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237849CC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926888);
  uint64_t v7 = OUTLINED_FUNCTION_2_0(v6);
  uint64_t result = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    swift_bridgeObjectRetain_n();
    sub_23785B100();
    uint64_t v11 = sub_23785B110();
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v11);
    uint64_t found = type metadata accessor for LaunchAppRemoteDevicesNotFoundParameters(0);
    return sub_23777C9B0((uint64_t)v10, a1 + *(int *)(found + 24));
  }
  return result;
}

uint64_t sub_237849D9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23785A490();
  sub_23785A4C0();
  sub_2377C2FEC(a4, (uint64_t)v7);
  sub_23785A4A0();
  swift_bridgeObjectRetain();
  return sub_23785A4B0();
}

uint64_t sub_237849E58(uint64_t a1)
{
  return sub_237849D9C(a1, *(unsigned __int8 *)(v1 + 16), *(unsigned __int8 *)(v1 + 17), *(void *)(v1 + 24));
}

unint64_t sub_237849E68()
{
  unint64_t result = qword_268927258;
  if (!qword_268927258)
  {
    sub_237859340();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268927258);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7_14(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_10_16()
{
  return sub_23785B0E0();
}

uint64_t OUTLINED_FUNCTION_11_14()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_12_15(uint64_t result)
{
  *(void *)(v1 + 80) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_15()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_14_10()
{
  return *(void *)(v0 + 80);
}

uint64_t OUTLINED_FUNCTION_17_17(uint64_t a1)
{
  *(void *)(v1 + 64) = a1;
  *(void *)(v1 + 72) = v2;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_18_11(uint64_t result)
{
  *(void *)(v1 + 56) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_19_12(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_20_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_21_14()
{
  return sub_23785B140();
}

uint64_t OUTLINED_FUNCTION_23_14(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return sub_23785B150();
}

uint64_t sub_237849FE8()
{
  sub_237859220();
  swift_allocObject();
  uint64_t result = sub_237859210();
  qword_268928A48 = result;
  return result;
}

uint64_t sub_23784A028()
{
  uint64_t v0 = sub_23785BCF0();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_23784A07C(char a1)
{
  if (a1) {
    return 0x6C65636E6163;
  }
  else {
    return 0x6D7269666E6F63;
  }
}

uint64_t sub_23784A0B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23784A07C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23784A0DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v74 = a4;
  uint64_t v5 = sub_23785B920();
  OUTLINED_FUNCTION_1_2();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_4();
  uint64_t v68 = v9;
  sub_23785B5E0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v59 = v11;
  uint64_t v60 = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1_4();
  uint64_t v58 = v12;
  uint64_t v73 = sub_23785B910();
  OUTLINED_FUNCTION_1_2();
  uint64_t v70 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_36_0();
  char v66 = v15;
  MEMORY[0x270FA5388](v16);
  uint64_t v69 = &v52[-v17];
  uint64_t v75 = sub_23785B620();
  OUTLINED_FUNCTION_1_2();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_36_0();
  uint64_t v65 = v21;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = &v52[-v23];
  uint64_t v25 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v72 = v26;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_1_4();
  uint64_t v71 = v28;
  uint64_t v77 = 0;
  unint64_t v78 = 0xE000000000000000;
  sub_23785BB80();
  swift_bridgeObjectRelease();
  uint64_t v77 = 0xD000000000000019;
  unint64_t v78 = 0x8000000237867950;
  sub_23785B720();
  uint64_t v30 = v77;
  unint64_t v29 = v78;
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  uint64_t v31 = __swift_project_value_buffer(v25, (uint64_t)qword_268928BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16))(v71, v31, v25);
  uint64_t v62 = v25;
  uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  uint64_t v67 = a3;
  char v64 = v32;
  v32((uint64_t)v24, a3, v75);
  uint64_t v63 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v70 + 16);
  v63(v69, v74, v73);
  swift_bridgeObjectRetain_n();
  id v33 = sub_23785B490();
  os_log_type_t v34 = sub_23785B8A0();
  int v35 = v34;
  uint64_t v61 = v33;
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v36 = swift_slowAlloc();
    uint64_t v57 = v5;
    uint64_t v37 = v36;
    uint64_t v56 = swift_slowAlloc();
    uint64_t v77 = v56;
    *(_DWORD *)uint64_t v37 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v76 = sub_2377C6A68(v30, v29, &v77);
    uint64_t v54 = &v77;
    sub_23785B9E0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v37 + 12) = 1024;
    unint64_t v55 = v29;
    int v53 = v35;
    sub_23785B610();
    int v38 = sub_23785B5D0();
    OUTLINED_FUNCTION_5_2();
    v39();
    (*(void (**)(unsigned char *, uint64_t))(v19 + 8))(v24, v75);
    LODWORD(v76) = v38;
    sub_23785B9E0();
    *(_WORD *)(v37 + 18) = 2048;
    uint64_t v40 = sub_23785B900();
    uint64_t v41 = v73;
    OUTLINED_FUNCTION_5_2();
    v42();
    uint64_t v76 = v40;
    sub_23785B9E0();
    uint64_t v43 = v61;
    _os_log_impl(&dword_237778000, v61, (os_log_type_t)v53, "Creating DispatchQueue: %s with qos: %u and attributes: %llu", (uint8_t *)v37, 0x1Cu);
    uint64_t v44 = v56;
    swift_arrayDestroy();
    MEMORY[0x237E23210](v44, -1, -1);
    uint64_t v45 = v37;
    uint64_t v5 = v57;
    MEMORY[0x237E23210](v45, -1, -1);

    OUTLINED_FUNCTION_5_2();
    v46();
    uint64_t v47 = v75;
  }
  else
  {
    uint64_t v48 = v73;
    OUTLINED_FUNCTION_5_2();
    v49();
    uint64_t v47 = v75;
    (*(void (**)(unsigned char *, uint64_t))(v19 + 8))(v24, v75);

    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_5_2();
    v50();
    uint64_t v41 = v48;
  }
  sub_23784A6E4();
  v64(v65, v67, v47);
  v63(v66, v74, v41);
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v68, *MEMORY[0x263F8F130], v5);
  return sub_23785B940();
}

unint64_t sub_23784A6E4()
{
  unint64_t result = qword_268928A50;
  if (!qword_268928A50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268928A50);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AppLaunchError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x23784A7F0);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchError()
{
  return &type metadata for AppLaunchError;
}

unint64_t sub_23784A82C()
{
  unint64_t result = qword_268928A58;
  if (!qword_268928A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928A58);
  }
  return result;
}

uint64_t sub_23784A878(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v26 = a2;
  uint64_t v5 = sub_237859460();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)(v2 + 16);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 16), *(void *)(v2 + 40));
  uint64_t v10 = 0;
  if ((sub_237859FE0() & 1) == 0)
  {
    __swift_project_boxed_opaque_existential_1(v9, *(void *)(v3 + 40));
    sub_237859F40();
    uint64_t v31 = sub_237859450();
    uint64_t v32 = v11;
    uint64_t v29 = 45;
    unint64_t v30 = 0xE100000000000000;
    uint64_t v27 = 95;
    unint64_t v28 = 0xE100000000000000;
    sub_23778EF5C();
    uint64_t v12 = sub_23785BA20();
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    id v15 = objc_msgSend(self, sel_sharedInstance);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v18 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
      id v19 = sub_23784AB5C(a1, v26, 0x736C6562614CLL, 0xE600000000000000, (uint64_t)v18, v12, v14, v16);

      if (v19)
      {
        uint64_t v10 = sub_23785B6B0();

        uint64_t v20 = OUTLINED_FUNCTION_0_11();
        v21(v20);
        return v10;
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    else
    {
      uint64_t v22 = OUTLINED_FUNCTION_0_11();
      v23(v22);
      swift_bridgeObjectRelease();
    }
    return 0;
  }
  return v10;
}

uint64_t sub_23784AB24()
{
  return 0x736C6562614CLL;
}

uint64_t type metadata accessor for LocUtil()
{
  return self;
}

id sub_23784AB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v10 = (void *)sub_23785B6A0();
  uint64_t v11 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(a8, sel_localizedStringForKey_table_bundle_languageCode_, v10, v11, a5, v12);

  return v13;
}

uint64_t OUTLINED_FUNCTION_0_11()
{
  return v0;
}

ValueMetadata *type metadata accessor for Marketplace()
{
  return &type metadata for Marketplace;
}

uint64_t sub_23784AC44(void *a1)
{
  if (a1[2] != 1) {
    return 0;
  }
  uint64_t v1 = a1[6];
  if (a1[4] == 0xD000000000000012 && a1[5] == 0x8000000237866EB0) {
    return 0;
  }
  if (OUTLINED_FUNCTION_2_20()) {
    uint64_t v1 = 0;
  }
  else {
    swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_2_20();
  return v1;
}

void sub_23784AD00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_23785BEC0();
    sub_23785B700();
    uint64_t v6 = sub_23785BEF0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    uint64_t v8 = v6 & ~v7;
    OUTLINED_FUNCTION_84_0();
    if (v9)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      if ((*v11 != a1 || v11[1] != a2) && (sub_23785BE30() & 1) == 0)
      {
        uint64_t v13 = ~v7;
        uint64_t v14 = (v8 + 1) & v13;
        OUTLINED_FUNCTION_84_0();
        if (v15)
        {
          do
          {
            uint64_t v16 = (void *)(v10 + 16 * v14);
            if (*v16 == a1 && v16[1] == a2) {
              break;
            }
            if (sub_23785BE30()) {
              break;
            }
            uint64_t v14 = (v14 + 1) & v13;
            OUTLINED_FUNCTION_84_0();
          }
          while ((v18 & 1) != 0);
        }
      }
    }
  }
}

uint64_t sub_23784AE14(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v32 - v13;
  uint64_t v15 = a1[3];
  uint64_t v16 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v15);
  uint64_t v17 = (void *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v16 + 16))(a2, a3, 1, v15, v16);
  if (!v17)
  {
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v6, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_3_22();
    v20(v14);
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_23785B490();
    os_log_type_t v22 = sub_23785B8B0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v34 = v8;
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v33 = (uint64_t)(v23 + 4);
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_2377C6A68(a2, a3, &v35);
      OUTLINED_FUNCTION_3_19(v24);
      sub_23785B9E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237778000, v21, v22, "Marketplace.init failed to initialized marketplace because could not find LSAppRecord for bundle id: %s", v23, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v6);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v6);
    }
    goto LABEL_14;
  }
  char v18 = v17;
  sub_23778BEDC(v17);
  if (!v19)
  {
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v6, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_3_22();
    v25(v12);
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_23785B490();
    os_log_type_t v27 = sub_23785B8B0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v34 = v8;
      uint64_t v29 = (uint8_t *)v28;
      uint64_t v33 = swift_slowAlloc();
      uint64_t v35 = v33;
      *(_DWORD *)uint64_t v29 = 136315138;
      v32[1] = v29 + 4;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_2377C6A68(a2, a3, &v35);
      OUTLINED_FUNCTION_3_19(v30);
      sub_23785B9E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237778000, v26, v27, "Marketplace.init failed to initialized marketplace because could not retrieve name for LSAppRecord for bundle id: %s", v29, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v6);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v6);
    }
LABEL_14:
    a2 = 0;
    goto LABEL_15;
  }

LABEL_15:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return a2;
}

double sub_23784B270@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *a1;
  unint64_t v14 = a1[1];
  sub_23784AD00(v15, v14, a2);
  if (v16)
  {
    sub_237781F08(a3, (uint64_t)v33);
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_23784AE14(v33, v15, v14);
    if (v18)
    {
      *a4 = v17;
      a4[1] = v18;
      a4[2] = v19;
      a4[3] = v20;
      return result;
    }
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v8, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_3_22();
    v22(v13);
    swift_bridgeObjectRetain_n();
    uint64_t v23 = sub_23785B490();
    os_log_type_t v24 = sub_23785B8B0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      v33[0] = v31;
      os_log_t v30 = v23;
      uint64_t v25 = v32;
      *(_DWORD *)uint64_t v32 = 136315138;
      v29[1] = v25 + 4;
      swift_bridgeObjectRetain();
      v33[6] = sub_2377C6A68(v15, v14, v33);
      sub_23785B9E0();
      swift_bridgeObjectRelease_n();
      os_log_t v26 = v30;
      os_log_type_t v27 = v32;
      _os_log_impl(&dword_237778000, v30, v24, "MarketplaceUtils.getMarketplacesRepresentedInResults could not find the LSApplicationRecord for marketplace with id: %s", v32, 0xCu);
      uint64_t v28 = v31;
      swift_arrayDestroy();
      MEMORY[0x237E23210](v28, -1, -1);
      MEMORY[0x237E23210](v27, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
  }
  double result = 0.0;
  *(_OWORD *)a4 = 0u;
  *((_OWORD *)a4 + 1) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_20()
{
  return sub_23785BE30();
}

uint64_t sub_23784B54C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v61 = a3;
  uint64_t v72 = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928A60);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_1_4();
  uint64_t v69 = v7;
  OUTLINED_FUNCTION_26_1();
  sub_23785A720();
  OUTLINED_FUNCTION_1_2();
  uint64_t v70 = v9;
  uint64_t v71 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_36_0();
  uint64_t v67 = v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v68 = (char *)&v60 - v12;
  OUTLINED_FUNCTION_26_1();
  uint64_t v78 = sub_23785A7C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v66 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1_4();
  uint64_t v65 = v15;
  OUTLINED_FUNCTION_26_1();
  uint64_t v77 = sub_23785A820();
  OUTLINED_FUNCTION_1_2();
  uint64_t v64 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_36_0();
  uint64_t v63 = v18;
  MEMORY[0x270FA5388](v19);
  uint64_t v75 = (char *)&v60 - v20;
  OUTLINED_FUNCTION_26_1();
  uint64_t v76 = sub_23785A6E0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v74 = v21;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_36_0();
  uint64_t v62 = v23;
  MEMORY[0x270FA5388](v24);
  uint64_t v73 = (char *)&v60 - v25;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927FB0);
  MEMORY[0x270FA5388](v26 - 8);
  uint64_t v28 = (char *)&v60 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_23785AAA0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v60 = v30;
  MEMORY[0x270FA5388](v31);
  uint64_t v33 = (char *)&v60 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23785AE10();
  swift_allocObject();
  uint64_t v34 = sub_23785AE00();
  uint64_t v35 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v36 = v34;
  uint64_t v37 = (void *)(*(uint64_t (**)(uint64_t))(v35 + 16))(a2);

  if (v37)
  {
    sub_23785AD20();
    swift_allocObject();
    sub_23785AD10();
    sub_23785AD00();
    if (sub_23785ACF0())
    {
      swift_bridgeObjectRetain();
      sub_23785AA70();
      sub_23785A9A0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v33, v29);
    }
    sub_23785AE60();
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268926DE0);
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_23785DFE0;
  *(void *)(v38 + 32) = v34;
  uint64_t v79 = v38;
  sub_23785B7C0();
  uint64_t v39 = v79;
  uint64_t v40 = sub_23785AB70();
  __swift_storeEnumTagSinglePayload((uint64_t)v28, 1, 1, v40);
  swift_retain();
  uint64_t v41 = MEMORY[0x237E216A0](v39, v28);
  swift_bridgeObjectRelease();
  sub_23784BBD8((uint64_t)v28);
  uint64_t v61 = v41;
  sub_23785A8F0();
  uint64_t v60 = v36;
  sub_23785A810();
  OUTLINED_FUNCTION_8_0();
  v43(v42);
  sub_23785A800();
  uint64_t v44 = v65;
  sub_23785A7B0();
  uint64_t v45 = v64;
  OUTLINED_FUNCTION_8_0();
  v47(v46);
  sub_23785A790();
  uint64_t v48 = v68;
  sub_23785A710();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268927D48);
  uint64_t v49 = v66;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23785CD50;
  OUTLINED_FUNCTION_8_0();
  v51(v50);
  sub_23785A700();
  uint64_t v53 = v70;
  uint64_t v52 = v71;
  OUTLINED_FUNCTION_8_0();
  v55(v54);
  uint64_t v56 = *MEMORY[0x263F71468];
  uint64_t v57 = sub_23785A6D0();
  uint64_t v58 = v69;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 104))(v69, v56, v57);
  __swift_storeEnumTagSinglePayload(v58, 0, 1, v57);
  sub_23785A670();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v48, v52);
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v44, v78);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v75, v77);
  return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v73, v76);
}

uint64_t sub_23784BBD8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268927FB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23784BC38(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 6:
      unint64_t result = 0xD000000000000014;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 9:
      unint64_t result = 0xD000000000000018;
      break;
    case 10:
      unint64_t result = 0x416C6C6174736E69;
      break;
    case 11:
      unint64_t result = 0x704165766F6D6572;
      break;
    case 12:
      unint64_t result = 0xD000000000000015;
      break;
    case 13:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchFlowFactoryImpl()
{
  return &type metadata for AppLaunchFlowFactoryImpl;
}

uint64_t sub_23784BDBC()
{
  type metadata accessor for DeepLaunchIntent();
  type metadata accessor for DeepLaunchIntentResponse();
  sub_237859DA0();
  sub_23785B170();
  swift_allocObject();
  sub_23785B160();
  sub_237859D00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928AB0);
  sub_237859D60();
  sub_23785A650();
  uint64_t v0 = sub_23785A2B0();
  swift_allocObject();
  uint64_t v1 = sub_23785A2A0();
  uint64_t v5 = v0;
  uint64_t v6 = MEMORY[0x263F6FB30];
  *(void *)&long long v4 = v1;
  type metadata accessor for DeepLaunchHandleIntentStrategy();
  uint64_t v2 = swift_allocObject();
  sub_23778EF44(&v7, v2 + 16);
  sub_23778EF44(&v4, v2 + 56);
  *(void *)&long long v7 = v2;
  sub_23784D0A0(&qword_268928AD8, (void (*)(uint64_t))type metadata accessor for DeepLaunchHandleIntentStrategy);
  sub_237859CF0();
  swift_release();
  sub_237859D50();
  type metadata accessor for DeepLaunchUnsupportedValueStrategy();
  *(void *)&long long v7 = sub_2377D21B8();
  sub_23784D0A0(&qword_268928AE0, (void (*)(uint64_t))type metadata accessor for DeepLaunchUnsupportedValueStrategy);
  sub_237859D30();
  swift_release();
  sub_237859D80();
  return swift_release();
}

uint64_t sub_23784C004(void *a1, uint64_t a2, void *a3)
{
  type metadata accessor for LaunchAppIntent();
  type metadata accessor for LaunchAppIntentResponse();
  sub_237859DA0();
  sub_23785B170();
  swift_allocObject();
  sub_23785B160();
  sub_237859D00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928A70);
  sub_237859D60();
  type metadata accessor for LaunchAppNeedsValueStrategy();
  v17[0] = sub_2377EFB2C();
  sub_23784D0A0(&qword_268928A98, (void (*)(uint64_t))type metadata accessor for LaunchAppNeedsValueStrategy);
  sub_237859CE0();
  swift_release();
  sub_237859D40();
  type metadata accessor for LaunchAppHandleIntentStrategy();
  id v6 = a1;
  long long v7 = sub_2377DFECC(a1);
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v18 = &type metadata for AppLaunchFlowFactoryImpl;
  uint64_t v19 = &off_26EA81488;
  sub_237781F08(a2, (uint64_t)v16);
  sub_237781F08((uint64_t)v17, (uint64_t)v15);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  sub_23778EF44(v16, v8 + 24);
  sub_23778EF44(v15, v8 + 64);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  sub_237859D50();
  type metadata accessor for LaunchAppDisambiguationStrategy();
  uint64_t v9 = sub_2377D88B4();
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v18 = &type metadata for AppLaunchFlowFactoryImpl;
  uint64_t v19 = &off_26EA81488;
  sub_237781F08(a2, (uint64_t)v16);
  sub_237781F08((uint64_t)v17, (uint64_t)v15);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  sub_23778EF44(v16, v10 + 24);
  sub_23778EF44(v15, v10 + 64);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  sub_237859D90();
  type metadata accessor for LaunchAppUnsupportedValueStrategy();
  id v11 = v6;
  uint64_t v12 = sub_2377F4A74((uint64_t)a1);
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v18 = &type metadata for AppLaunchFlowFactoryImpl;
  uint64_t v19 = &off_26EA81488;
  sub_237781F08(a2, (uint64_t)v16);
  sub_237781F08((uint64_t)v17, (uint64_t)v15);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  sub_23778EF44(v16, v13 + 24);
  sub_23778EF44(v15, v13 + 64);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  sub_237859D80();
  type metadata accessor for LaunchAppConfirmationStrategy();
  v17[0] = sub_2377D5DF4();
  sub_23784D0A0(&qword_268928AA0, (void (*)(uint64_t))type metadata accessor for LaunchAppConfirmationStrategy);
  sub_237859D20();
  swift_release();
  sub_237859D70();
  return swift_release();
}

uint64_t sub_23784C420()
{
  sub_23785B170();
  swift_allocObject();
  uint64_t result = sub_23785B160();
  qword_268928D60 = result;
  return result;
}

uint64_t sub_23784C490()
{
  type metadata accessor for LaunchAppWrapperFlow();
  sub_23785A440();
  sub_237859F20();
  sub_2377A5450();
  sub_23784D0A0((unint64_t *)&qword_268927070, (void (*)(uint64_t))type metadata accessor for LaunchAppWrapperFlow);
  uint64_t v0 = sub_237859DD0();
  swift_release();
  return v0;
}

uint64_t sub_23784C544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928AA8);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_61();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928AB0);
  OUTLINED_FUNCTION_1_2();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v20 - v13;
  sub_23784BDBC();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v20 = v6;
  v15(v12, v14, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928AB8);
  swift_allocObject();
  sub_237859DB0();
  uint64_t v21 = a1;
  type metadata accessor for DeepLaunchFlowStrategy();
  sub_23784D0A0(&qword_268928AC0, (void (*)(uint64_t))type metadata accessor for DeepLaunchFlowStrategy);
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_3_23((uint64_t)&v21);
  if (qword_268926800 != -1) {
    swift_once();
  }
  sub_23785A120();
  uint64_t v16 = OUTLINED_FUNCTION_1_18();
  v17(v16);
  uint64_t v21 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928AC8);
  sub_23784CADC(&qword_268928AD0, &qword_268928AC8);
  uint64_t v18 = sub_237859DD0();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v20);
  return v18;
}

uint64_t sub_23784C7B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v23[1] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928A68);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_61();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928A70);
  OUTLINED_FUNCTION_1_2();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v23 - v16;
  v25[3] = &type metadata for AppLaunchFlowFactoryImpl;
  v25[4] = &off_26EA81488;
  sub_23784C004(a5, a4, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  uint64_t v24 = v9;
  v18(v15, v17, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928A78);
  swift_allocObject();
  sub_237859DB0();
  v25[0] = a1;
  type metadata accessor for LaunchAppFlowStrategy();
  sub_23784D0A0(&qword_268928A80, (void (*)(uint64_t))type metadata accessor for LaunchAppFlowStrategy);
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_3_23((uint64_t)v25);
  if (qword_268926800 != -1) {
    swift_once();
  }
  sub_23785A120();
  uint64_t v19 = OUTLINED_FUNCTION_1_18();
  v20(v19);
  v25[0] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268928A88);
  sub_23784CADC(&qword_268928A90, &qword_268928A88);
  uint64_t v21 = sub_237859DD0();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v24);
  return v21;
}

uint64_t sub_23784CA5C(uint64_t a1, uint64_t a2)
{
  return sub_2377DF8C8(a1, a2, *(void *)(v2 + 16), v2 + 24, v2 + 64);
}

uint64_t sub_23784CA70(uint64_t a1, uint64_t a2)
{
  return sub_2377EF5C0(a1, a2, *(void *)(v2 + 16), v2 + 24, v2 + 64);
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_23784CACC(uint64_t a1, uint64_t a2)
{
  return sub_2377F4064(a1, a2, *(void *)(v2 + 16), v2 + 24, v2 + 64);
}

uint64_t sub_23784CADC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_23784CB2C()
{
  sub_237859F20();
  sub_237859E80();
  type metadata accessor for HomeScreenFlow();
  swift_allocObject();
  *(void *)&long long v3 = sub_2377A0F18(&v3, &v2);
  sub_23784D0A0((unint64_t *)&qword_268926FA0, (void (*)(uint64_t))type metadata accessor for HomeScreenFlow);
  uint64_t v0 = sub_237859DD0();
  swift_release();
  return v0;
}

uint64_t sub_23784CBEC()
{
  if (qword_26AF0BC80 != -1) {
    swift_once();
  }
  uint64_t v0 = static InstalledAppProvider.shared;
  v3[3] = type metadata accessor for InstalledAppProvider();
  v3[4] = &protocol witness table for InstalledAppProvider;
  v3[0] = v0;
  swift_retain();
  sub_23785A440();
  sub_237859F20();
  sub_237859E80();
  sub_2377A51F4();
  uint64_t v1 = sub_237859DD0();
  sub_23784CCBC((uint64_t)v3);
  return v1;
}

uint64_t sub_23784CCBC(uint64_t a1)
{
  return a1;
}

uint64_t sub_23784CD10()
{
  sub_23785A650();
  if (qword_26AF0BC80 != -1) {
    swift_once();
  }
  uint64_t v0 = static InstalledAppProvider.shared;
  swift_retain();
  sub_23785A440();
  sub_237859F20();
  type metadata accessor for BaseDialogProvider();
  uint64_t v1 = swift_allocObject();
  sub_237859E80();
  *(void *)&long long v7 = sub_23784CE3C(&v7, v0, &v6, &v5, v1, &v4);
  type metadata accessor for QRCodeFlow();
  sub_23784D0A0(&qword_2689271F0, (void (*)(uint64_t))type metadata accessor for QRCodeFlow);
  uint64_t v2 = sub_237859DD0();
  swift_release();
  return v2;
}

uint64_t sub_23784CE3C(long long *a1, uint64_t a2, long long *a3, long long *a4, uint64_t a5, long long *a6)
{
  uint64_t v21 = type metadata accessor for BaseDialogProvider();
  uint64_t v22 = &off_26EA7EAF8;
  v20[0] = a5;
  type metadata accessor for QRCodeFlow();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (void *)((char *)&v20[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  uint64_t v17 = sub_23784CF88(a1, a2, a3, a4, *v15, a6, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return v17;
}

uint64_t sub_23784CF88(long long *a1, uint64_t a2, long long *a3, long long *a4, uint64_t a5, long long *a6, uint64_t a7)
{
  uint64_t v14 = (void *)(a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents10QRCodeFlow_installedAppProvider);
  v14[3] = type metadata accessor for InstalledAppProvider();
  v14[4] = &protocol witness table for InstalledAppProvider;
  *uint64_t v14 = a2;
  uint64_t v15 = (void *)(a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents10QRCodeFlow_dialogProvider);
  v15[3] = type metadata accessor for BaseDialogProvider();
  void v15[4] = &off_26EA7EAF8;
  *uint64_t v15 = a5;
  uint64_t v16 = a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents10QRCodeFlow_input;
  uint64_t v17 = sub_23785A5D0();
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v17);
  sub_23778EF44(a1, a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents10QRCodeFlow_deviceState);
  sub_23778EF44(a3, a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents10QRCodeFlow_outputPublisher);
  sub_23778EF44(a4, a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents10QRCodeFlow_aceService);
  sub_23778EF44(a6, a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents10QRCodeFlow_eventSender);
  return a7;
}

uint64_t sub_23784D0A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_1_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_23(uint64_t a1)
{
  return MEMORY[0x270F67608](a1, v2, v1, v3);
}

uint64_t sub_23784D124(uint64_t a1)
{
  return sub_23784D16C(a1, 0xD000000000000016, 0x8000000237867B30, &qword_268928AE8);
}

uint64_t sub_23784D148(uint64_t a1)
{
  return sub_23784D16C(a1, 0xD000000000000028, 0x8000000237867B00, &qword_268928AF0);
}

uint64_t sub_23784D16C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = sub_23785B910();
  OUTLINED_FUNCTION_1_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_5_0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_23785B620();
  OUTLINED_FUNCTION_1_2();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_5_0();
  uint64_t v20 = v19 - v18;
  sub_23785B600();
  sub_23785B8F0();
  uint64_t v21 = sub_23784A0DC(a2, a3, v20, v13);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v20, v14);
  *a4 = v21;
  return result;
}

void sub_23784D2A4()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  sub_237853604(0xD000000000000016, 0x8000000237867B30, v0);
  qword_268928AF8 = (uint64_t)v0;
}

void *AppLaunchFlowProvider.init()@<X0>(void *a1@<X8>)
{
  a1[3] = &type metadata for AppLaunchFlowFactoryImpl;
  a1[4] = &off_26EA81488;
  sub_23785A650();
  uint64_t v2 = type metadata accessor for QuickActionScopeProvider();
  swift_allocObject();
  uint64_t v3 = sub_237828788();
  a1[13] = v2;
  a1[14] = &off_26EA80390;
  a1[10] = v3;
  a1[18] = &type metadata for AppLaunchFeatureFlagsImpl;
  a1[19] = &off_26EA81018;
  uint64_t v4 = sub_23785B260();
  uint64_t v5 = sub_23785B250();
  a1[23] = &type metadata for ReferenceResolver;
  a1[24] = &off_26EA805D8;
  uint64_t result = (void *)swift_allocObject();
  a1[20] = result;
  result[5] = v4;
  result[6] = &off_26EA80548;
  result[2] = v5;
  return result;
}

uint64_t sub_23784D3DC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t static AppLaunchFlowProvider.warmup(refId:)(uint64_t a1, unint64_t a2)
{
  unint64_t v43 = a2;
  uint64_t v39 = a1;
  uint64_t v2 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v44 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_0();
  uint64_t v7 = v6 - v5;
  sub_23785B5C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v42 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5_0();
  uint64_t v12 = v11 - v10;
  sub_23785B620();
  OUTLINED_FUNCTION_1_2();
  uint64_t v40 = v14;
  uint64_t v41 = v13;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_5_0();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = sub_2378593F0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v20 = v19;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v38 - v23;
  if (qword_268926818 != -1) {
    swift_once();
  }
  if (objc_msgSend((id)qword_268928AF8, sel_tryLock))
  {
    sub_2378593E0();
    if (qword_268926808 != -1) {
      swift_once();
    }
    uint64_t v44 = qword_268928AE8;
    OUTLINED_FUNCTION_8_0();
    v25();
    uint64_t v26 = swift_allocObject();
    OUTLINED_FUNCTION_38_0();
    v27();
    aBlock[4] = (uint64_t)sub_237853048;
    aBlock[5] = v26;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_23784E708;
    aBlock[3] = (uint64_t)&block_descriptor_4;
    uint64_t v28 = _Block_copy(aBlock);
    sub_23785B5F0();
    uint64_t v46 = MEMORY[0x263F8EE78];
    sub_23785365C(&qword_268928B00, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268928B08);
    sub_2378530C0();
    sub_23785BAB0();
    MEMORY[0x237E224E0](0, v17, v12, v28);
    _Block_release(v28);
    OUTLINED_FUNCTION_5_2();
    v29();
    OUTLINED_FUNCTION_5_2();
    v30();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v24, v18);
    return swift_release();
  }
  else
  {
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v2, (uint64_t)qword_268928BC8);
    uint64_t v32 = v44;
    OUTLINED_FUNCTION_8_0();
    v33();
    unint64_t v34 = v43;
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_23785B490();
    os_log_type_t v36 = sub_23785B8D0();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)OUTLINED_FUNCTION_48_0();
      aBlock[0] = OUTLINED_FUNCTION_36_2();
      *(_DWORD *)uint64_t v37 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_2377C6A68(v39, v34, aBlock);
      sub_23785B9E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237778000, v35, v36, "AppLaunchFlowProvider#warmup already in warmup. Rejecting warmup request for: %s", v37, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v7, v2);
  }
}

uint64_t sub_23784D958(uint64_t a1)
{
  uint64_t v46 = a1;
  uint64_t v1 = sub_2378593F0();
  uint64_t v48 = *(void *)(v1 - 8);
  uint64_t v49 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v45 = v2;
  uint64_t v47 = (char *)v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23785B5C0();
  uint64_t v53 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v52 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_23785B620();
  uint64_t v51 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v50 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v43 = sub_23785B400();
  Class isa = v43[-1].isa;
  uint64_t v7 = MEMORY[0x270FA5388](v43);
  uint64_t v9 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v42 - v10;
  uint64_t v12 = sub_23785B430();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2689266E8 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v12, (uint64_t)qword_268928BF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  sub_23785B3F0();
  uint64_t v17 = sub_23785B420();
  os_signpost_type_t v18 = sub_23785B960();
  char v19 = sub_23785B9B0();
  uint64_t v54 = v3;
  if (v19)
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    os_signpost_id_t v21 = sub_23785B3E0();
    _os_signpost_emit_with_name_impl(&dword_237778000, v17, v18, v21, "appLaunchFlowProviderWarmup", "enableTelemetry=YES", v20, 2u);
    uint64_t v22 = v20;
    uint64_t v3 = v54;
    MEMORY[0x237E23210](v22, -1, -1);
  }

  uint64_t v23 = v43;
  (*((void (**)(char *, char *, NSObject *))isa + 2))(v9, v11, v43);
  sub_23785B470();
  swift_allocObject();
  uint64_t v44 = sub_23785B460();
  (*((void (**)(char *, NSObject *))isa + 1))(v11, v23);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v24 = dispatch_group_create();
  dispatch_group_enter(v24);
  if (qword_268926810 != -1) {
    swift_once();
  }
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v24;
  uint64_t v61 = sub_2378536DC;
  uint64_t v62 = v25;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v58 = 1107296256;
  v42[4] = &v59;
  uint64_t v59 = sub_23784E708;
  uint64_t v60 = &block_descriptor_9;
  uint64_t v26 = _Block_copy(&aBlock);
  unint64_t v43 = v24;
  uint64_t v27 = v50;
  sub_23785B5F0();
  uint64_t v56 = MEMORY[0x263F8EE78];
  uint64_t v28 = sub_23785365C(&qword_268928B00, MEMORY[0x263F8F030]);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928B08);
  unint64_t v30 = sub_2378530C0();
  uint64_t v31 = v52;
  void v42[2] = v29;
  v42[1] = v30;
  v42[3] = v28;
  sub_23785BAB0();
  MEMORY[0x237E224E0](0, v27, v31, v26);
  _Block_release(v26);
  uint64_t v53 = *(void *)(v53 + 8);
  ((void (*)(char *, uint64_t))v53)(v31, v3);
  uint64_t v51 = *(void *)(v51 + 8);
  ((void (*)(char *, uint64_t))v51)(v27, v55);
  swift_release();
  if (qword_268926808 != -1) {
    swift_once();
  }
  v42[0] = qword_268928AE8;
  uint64_t v32 = v47;
  uint64_t v33 = v48;
  uint64_t v34 = v49;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v47, v46, v49);
  unint64_t v35 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  unint64_t v36 = (v45 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v37 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v33 + 32))(v37 + v35, v32, v34);
  *(void *)(v37 + v36) = v44;
  uint64_t v61 = sub_237853778;
  uint64_t v62 = v37;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v58 = 1107296256;
  uint64_t v59 = sub_23784E708;
  uint64_t v60 = &block_descriptor_15;
  uint64_t v38 = _Block_copy(&aBlock);
  swift_retain();
  sub_23785B5F0();
  uint64_t v56 = MEMORY[0x263F8EE78];
  uint64_t v39 = v54;
  sub_23785BAB0();
  uint64_t v40 = v43;
  sub_23785B8E0();
  _Block_release(v38);

  swift_release();
  ((void (*)(char *, uint64_t))v53)(v31, v39);
  ((void (*)(char *, uint64_t))v51)(v27, v55);
  return swift_release();
}

uint64_t sub_23784E154(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268926CB0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23785B840();
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
  uint64_t v6 = (void *)swift_allocObject();
  uint64_t v6[2] = 0;
  v6[3] = 0;
  v6[4] = a1;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5);
  id v8 = a1;
  if (EnumTagSinglePayload == 1)
  {
    sub_2377BD9A0((uint64_t)v4, &qword_268926CB0);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_23785B830();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_23785B810();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_268928B48;
  *(void *)(v12 + 24) = v6;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    long long v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_23784E358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = sub_23785B4B0();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  void v4[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23784E418, 0, 0);
}

uint64_t sub_23784E418()
{
  OUTLINED_FUNCTION_13();
  if (qword_26AF0BC80 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23784E4DC;
  return sub_237822DEC();
}

uint64_t sub_23784E4DC()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_5();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23784E5A8, 0, 0);
}

uint64_t sub_23784E5A8()
{
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_268928BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_23785B490();
  os_log_type_t v6 = sub_23785B8D0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_237778000, v5, v6, "AppLaunchFlowProvider#warmup InstalledAppProvider completed warmup", v7, 2u);
    OUTLINED_FUNCTION_5_3();
  }
  uint64_t v9 = v0[4];
  uint64_t v8 = v0[5];
  uint64_t v11 = v0[2];
  uint64_t v10 = v0[3];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  dispatch_group_leave(v11);
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_23784E70C(uint64_t a1, uint64_t a2)
{
  uint64_t v54 = a2;
  uint64_t v52 = sub_23785B440();
  uint64_t v55 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v51 = (char *)v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23785B400();
  uint64_t v59 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v58 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23785B430();
  uint64_t v57 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v56 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2378593F0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v50 = (char *)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v46 - v12;
  uint64_t v14 = sub_23785B4B0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v14, (uint64_t)qword_268928BC8);
  char v19 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v53 = v14;
  v19(v17, v18, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, a1, v8);
  uint64_t v20 = sub_23785B490();
  os_log_type_t v21 = sub_23785B8D0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = v4;
    uint64_t v23 = v22;
    uint64_t v48 = v6;
    *(_DWORD *)uint64_t v22 = 134217984;
    v46[1] = v22 + 4;
    uint64_t v24 = v50;
    sub_2378593E0();
    sub_237859370();
    uint64_t v26 = v25;
    uint64_t v47 = v15;
    uint64_t v27 = *(void (**)(char *, uint64_t))(v9 + 8);
    v27(v24, v8);
    uint64_t v60 = v26;
    uint64_t v6 = v48;
    sub_23785B9E0();
    v27(v13, v8);
    uint64_t v15 = v47;
    _os_log_impl(&dword_237778000, v20, v21, "AppLaunchFlowProvider#warmup completed in %f seconds", v23, 0xCu);
    uint64_t v28 = v23;
    uint64_t v4 = v49;
    MEMORY[0x237E23210](v28, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v53);
  uint64_t v29 = v55;
  unint64_t v30 = v56;
  if (qword_268926818 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_268928AF8, sel_unlock);
  uint64_t v32 = v57;
  uint64_t v31 = v58;
  if (qword_2689266E8 != -1) {
    swift_once();
  }
  uint64_t v33 = __swift_project_value_buffer(v6, (uint64_t)qword_268928BF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v30, v33, v6);
  uint64_t v34 = sub_23785B420();
  sub_23785B450();
  os_signpost_type_t v35 = sub_23785B950();
  if (sub_23785B9B0())
  {
    swift_retain();
    unint64_t v36 = v51;
    sub_23785B480();
    uint64_t v37 = v36;
    swift_release();
    uint64_t v38 = v36;
    uint64_t v39 = v52;
    if ((*(unsigned int (**)(char *, uint64_t))(v29 + 88))(v38, v52) == *MEMORY[0x263F90238])
    {
      uint64_t v40 = v6;
      uint64_t v41 = "[Error] Interval already ended";
    }
    else
    {
      uint64_t v42 = v37;
      uint64_t v40 = v6;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v42, v39);
      uint64_t v41 = "";
    }
    unint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v43 = 0;
    os_signpost_id_t v44 = sub_23785B3E0();
    _os_signpost_emit_with_name_impl(&dword_237778000, v34, v35, v44, "appLaunchFlowProviderWarmup", v41, v43, 2u);
    MEMORY[0x237E23210](v43, -1, -1);
    uint64_t v6 = v40;
  }

  (*(void (**)(char *, uint64_t))(v59 + 8))(v31, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v30, v6);
}

uint64_t sub_23784ED98(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t AppLaunchFlowProvider.findFlow(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v188 = a2;
  uint64_t v179 = sub_23785A5F0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v177 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_26_4();
  uint64_t v176 = v6;
  OUTLINED_FUNCTION_45_2();
  MEMORY[0x270FA5388](v7);
  uint64_t v178 = (char *)v167 - v8;
  OUTLINED_FUNCTION_26_1();
  uint64_t v185 = sub_23785A630();
  OUTLINED_FUNCTION_1_2();
  uint64_t v182 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_36_0();
  uint64_t v175 = v11;
  OUTLINED_FUNCTION_45_2();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_26_4();
  uint64_t v181 = v13;
  OUTLINED_FUNCTION_45_2();
  MEMORY[0x270FA5388](v14);
  uint64_t v184 = (uint8_t *)v167 - v15;
  OUTLINED_FUNCTION_26_1();
  uint64_t v173 = sub_23785A680();
  OUTLINED_FUNCTION_1_2();
  uint64_t v172 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_5_0();
  uint64_t v171 = v19 - v18;
  OUTLINED_FUNCTION_26_1();
  uint64_t v189 = sub_23785B4B0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_26_4();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_26_4();
  uint64_t v180 = v25;
  OUTLINED_FUNCTION_45_2();
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_26_4();
  uint64_t v183 = v27;
  OUTLINED_FUNCTION_45_2();
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_26_4();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v29);
  os_log_t v187 = (os_log_t)((char *)v167 - v30);
  OUTLINED_FUNCTION_26_1();
  uint64_t v31 = sub_23785AEF0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  MEMORY[0x270FA5388](v33);
  os_signpost_type_t v35 = (char *)v167 - v34;
  uint64_t v36 = sub_23785A640();
  OUTLINED_FUNCTION_1_2();
  uint64_t v38 = v37;
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_26_4();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_26_4();
  OUTLINED_FUNCTION_8_7();
  MEMORY[0x270FA5388](v42);
  os_signpost_id_t v44 = (void (*)(uint64_t))((char *)v167 - v43);
  uint64_t v46 = (void (*)(uint64_t))(v38 + 16);
  uint64_t v45 = *(void (**)(uint64_t))(v38 + 16);
  uint64_t v170 = a1;
  uint64_t v47 = a1;
  uint64_t v48 = v45;
  ((void (*)(char *, uint64_t, uint64_t))v45)((char *)v167 - v43, v47, v36);
  int v49 = (*(uint64_t (**)(void (*)(uint64_t), uint64_t))(v38 + 88))(v44, v36);
  if (v49 == *MEMORY[0x263F6FF50])
  {
    uint64_t v50 = OUTLINED_FUNCTION_3_24();
    v51(v50);
    OUTLINED_FUNCTION_38_0();
    v52();
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v189, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_8_0();
    v53();
    OUTLINED_FUNCTION_8_0();
    v54();
    uint64_t v55 = sub_23785B490();
    os_log_type_t v56 = sub_23785B8D0();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = OUTLINED_FUNCTION_48_0();
      uint64_t v185 = OUTLINED_FUNCTION_36_2();
      v190[0] = v185;
      uint64_t v184 = (uint8_t *)v57;
      *(_DWORD *)uint64_t v57 = 136315138;
      uint64_t v46 = (void (*)(uint64_t))(v57 + 12);
      sub_23785365C(&qword_268928B18, MEMORY[0x263F73760]);
      uint64_t v58 = sub_23785BE00();
      uint64_t v60 = sub_2377C6A68(v58, v59, v190);
      OUTLINED_FUNCTION_3_19(v60);
      sub_23785B9E0();
      swift_bridgeObjectRelease();
      uint64_t v61 = OUTLINED_FUNCTION_19_13();
      ((void (*)(uint64_t))(v57 + 12))(v61);
      _os_log_impl(&dword_237778000, v55, v56, "Received NLv3 parse: %s", v184, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();
    }
    else
    {
      uint64_t v83 = OUTLINED_FUNCTION_19_13();
      v46(v83);
    }

    (*(void (**)(os_log_t, uint64_t))(v21 + 8))(v187, v189);
    sub_23784FE78((uint64_t)v35, v188);
    return ((uint64_t (*)(char *, uint64_t))v46)(v35, v31);
  }
  if (v49 == *MEMORY[0x263F6FF70])
  {
    uint64_t v62 = OUTLINED_FUNCTION_3_24();
    v63(v62);
    uint64_t v64 = v182;
    uint64_t v65 = v184;
    uint64_t v66 = v185;
    OUTLINED_FUNCTION_38_0();
    v67();
    uint64_t v68 = v21;
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    uint64_t v69 = v189;
    __swift_project_value_buffer(v189, (uint64_t)qword_268928BC8);
    uint64_t v70 = v183;
    OUTLINED_FUNCTION_8_0();
    v71();
    uint64_t v72 = *(void (**)(uint64_t, uint8_t *, uint64_t))(v64 + 16);
    uint64_t v73 = v181;
    v72((uint64_t)v181, v65, v66);
    uint64_t v74 = sub_23785B490();
    os_log_type_t v75 = sub_23785B8D0();
    int v76 = v75;
    if (os_log_type_enabled(v74, v75))
    {
      os_log_t v187 = v74;
      uint64_t v77 = (uint8_t *)OUTLINED_FUNCTION_48_0();
      v190[0] = OUTLINED_FUNCTION_36_2();
      LODWORD(v180) = v76;
      *(_DWORD *)uint64_t v77 = 136315138;
      v72(v175, v73, v185);
      uint64_t v78 = sub_23785B6D0();
      uint64_t v80 = sub_2377C6A68(v78, v79, v190);
      OUTLINED_FUNCTION_3_19(v80);
      sub_23785B9E0();
      swift_bridgeObjectRelease();
      uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
      v81((uint64_t)v73, v185);
      os_log_t v82 = v187;
      _os_log_impl(&dword_237778000, v187, (os_log_type_t)v180, "Received direct invocation parse: %s", v77, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      uint64_t v66 = v185;
      OUTLINED_FUNCTION_5_3();

      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v183, v189);
    }
    else
    {
      uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
      v81((uint64_t)v73, v66);

      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v70, v69);
    }
    uint64_t v105 = v184;
    sub_23785230C();
    return ((uint64_t (*)(uint8_t *, uint64_t))v81)(v105, v66);
  }
  uint64_t v85 = v21;
  if (v49 == *MEMORY[0x263F6FF60])
  {
    uint64_t v86 = OUTLINED_FUNCTION_3_24();
    v87(v86);
    uint64_t v89 = v177;
    uint64_t v88 = v178;
    uint64_t v90 = v179;
    OUTLINED_FUNCTION_38_0();
    v91();
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v189, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_16_15();
    OUTLINED_FUNCTION_8_0();
    v92();
    os_log_t v187 = *(os_log_t *)(v89 + 16);
    ((void (*)(uint64_t, char *, uint64_t))v187)(v176, v88, v90);
    unsigned __int8 v93 = sub_23785B490();
    os_log_type_t v94 = sub_23785B8D0();
    if (os_log_type_enabled(v93, v94))
    {
      uint64_t v95 = OUTLINED_FUNCTION_48_0();
      uint64_t v185 = (uint64_t)v93;
      uint64_t v96 = v95;
      v190[0] = OUTLINED_FUNCTION_36_2();
      *(_DWORD *)uint64_t v96 = 136315138;
      os_signpost_id_t v44 = (void (*)(uint64_t))(v96 + 12);
      uint64_t v184 = (uint8_t *)(v96 + 4);
      OUTLINED_FUNCTION_27_11();
      v97();
      uint64_t v98 = sub_23785B6D0();
      uint64_t v100 = sub_2377C6A68(v98, v99, v190);
      OUTLINED_FUNCTION_3_19(v100);
      sub_23785B9E0();
      uint64_t v90 = v179;
      swift_bridgeObjectRelease();
      uint64_t v101 = OUTLINED_FUNCTION_12_16();
      ((void (*)(uint64_t))(v96 + 12))(v101);
      uint64_t v102 = (void *)v185;
      OUTLINED_FUNCTION_10_17(&dword_237778000, v103, v104, "Received Pegasus results parse: %s");
      swift_arrayDestroy();
      uint64_t v88 = v178;
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();
    }
    else
    {
      uint64_t v123 = OUTLINED_FUNCTION_12_16();
      v44(v123);
    }
    (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v180, v189);
    uint64_t v191 = v90;
    uint64_t v192 = &off_26EA7EB30;
    __swift_allocate_boxed_opaque_existential_0(v190);
    OUTLINED_FUNCTION_27_11();
    v124();
    OUTLINED_FUNCTION_21_15();
    ((void (*)(char *, uint64_t))v44)(v88, v90);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v190);
  }
  if (v49 == *MEMORY[0x263F6FF68])
  {
    uint64_t v106 = OUTLINED_FUNCTION_3_24();
    v107(v106);
    uint64_t v108 = *(void **)v44;
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    uint64_t v109 = v189;
    __swift_project_value_buffer(v189, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_16_15();
    uint64_t v110 = v174;
    OUTLINED_FUNCTION_8_0();
    v111();
    os_log_t v112 = v108;
    unint64_t v113 = sub_23785B490();
    os_log_type_t v114 = sub_23785B8D0();
    if (os_log_type_enabled(v113, v114))
    {
      uint64_t v115 = (uint8_t *)OUTLINED_FUNCTION_48_0();
      v190[0] = OUTLINED_FUNCTION_36_2();
      *(_DWORD *)uint64_t v115 = 136315138;
      uint64_t v185 = (uint64_t)(v115 + 4);
      os_log_type_t v116 = v112;
      os_log_t v187 = v112;
      int v117 = v116;
      id v118 = [v116 description];
      uint64_t v119 = sub_23785B6B0();
      unint64_t v121 = v120;

      uint64_t v122 = sub_2377C6A68(v119, v121, v190);
      OUTLINED_FUNCTION_20_7(v122);

      os_log_t v112 = v187;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237778000, v113, v114, "Received Pommes response parse: %s", v115, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v174, v189);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v110, v109);
    }
    uint64_t v191 = sub_23785B230();
    uint64_t v192 = &off_26EA7EB40;
    v190[0] = (uint64_t)v112;
    OUTLINED_FUNCTION_21_15();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v190);
  }
  BOOL v125 = v49 == *MEMORY[0x263F6FF80];
  v167[0] = v48;
  if (v125)
  {
    (*(void (**)(void (*)(uint64_t), uint64_t))(v38 + 96))(v44, v36);
    OUTLINED_FUNCTION_38_0();
    v127(v126);
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    uint64_t v128 = v189;
    __swift_project_value_buffer(v189, (uint64_t)qword_268928BC8);
    OUTLINED_FUNCTION_16_15();
    uint64_t v129 = v168;
    OUTLINED_FUNCTION_8_0();
    v131(v130);
    uint64_t v132 = v167[1];
    OUTLINED_FUNCTION_22_10();
    v48(v133);
    uint64_t v134 = sub_23785B490();
    os_log_type_t v135 = sub_23785B8D0();
    if (os_log_type_enabled(v134, v135))
    {
      os_log_t v187 = (os_log_t)v85;
      uint64_t v136 = (_DWORD *)OUTLINED_FUNCTION_48_0();
      v190[0] = OUTLINED_FUNCTION_36_2();
      *uint64_t v136 = 136315138;
      uint64_t v185 = (uint64_t)(v136 + 1);
      OUTLINED_FUNCTION_24_10();
      v138(v137);
      uint64_t v139 = sub_23780B3B0();
      os_log_t v140 = v187;
      uint64_t v193 = sub_2377C6A68(v139, v141, v190);
      sub_23785B9E0();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v132, v36);
      OUTLINED_FUNCTION_10_17(&dword_237778000, v142, v143, "Received USO parse: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_5_3();

      ((void (*)(uint64_t, uint64_t))v140[1].isa)(v168, v189);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v132, v36);

      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v129, v128);
    }
    uint64_t v161 = v173;
    uint64_t v191 = v173;
    uint64_t v192 = &off_26EA7EB20;
    __swift_allocate_boxed_opaque_existential_0(v190);
    uint64_t v162 = v172;
    uint64_t v163 = v171;
    OUTLINED_FUNCTION_8_0();
    v165(v164);
    OUTLINED_FUNCTION_21_15();
    (*(void (**)(uint64_t, uint64_t))(v162 + 8))(v163, v161);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v190);
  }
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v189, (uint64_t)qword_268928BC8);
  OUTLINED_FUNCTION_16_15();
  uint64_t v144 = v169;
  OUTLINED_FUNCTION_8_0();
  v146(v145);
  OUTLINED_FUNCTION_22_10();
  v48(v147);
  uint64_t v148 = sub_23785B490();
  os_log_type_t v149 = sub_23785B8B0();
  if (os_log_type_enabled(v148, v149))
  {
    os_log_t v187 = (os_log_t)v21;
    uint64_t v150 = OUTLINED_FUNCTION_48_0();
    uint64_t v186 = OUTLINED_FUNCTION_36_2();
    v190[0] = v186;
    *(_DWORD *)uint64_t v150 = 136315138;
    uint64_t v85 = v150 + 12;
    uint64_t v185 = v150 + 4;
    OUTLINED_FUNCTION_24_10();
    v152(v151);
    uint64_t v153 = sub_23780B3B0();
    uint64_t v155 = sub_2377C6A68(v153, v154, v190);
    OUTLINED_FUNCTION_20_7(v155);
    swift_bridgeObjectRelease();
    uint64_t v156 = OUTLINED_FUNCTION_11_15();
    ((void (*)(uint64_t))(v150 + 12))(v156);
    OUTLINED_FUNCTION_10_17(&dword_237778000, v157, v158, "Received unknown parse: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_5_3();

    OUTLINED_FUNCTION_5_2();
    v160(v159);
  }
  else
  {
    uint64_t v166 = OUTLINED_FUNCTION_11_15();
    ((void (*)(uint64_t))v21)(v166);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v144, v189);
  }
  sub_237859E30();
  return ((uint64_t (*)(void (*)(uint64_t), uint64_t))v85)(v44, v36);
}

uint64_t sub_23784FE78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v3 = sub_23785B4B0();
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v47 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v47 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v47 - v13;
  uint64_t v15 = type metadata accessor for AppLaunchIntent();
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v47 - v19;
  uint64_t v21 = sub_23785AEF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v20, a1, v21);
  if (qword_268926778 != -1) {
    swift_once();
  }
  sub_23785365C((unint64_t *)&qword_268926BC8, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
  sub_23785ABB0();
  if (!LOBYTE(v53[0])) {
    goto LABEL_7;
  }
  if (LOBYTE(v53[0]) == 1)
  {
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    uint64_t v27 = __swift_project_value_buffer(v3, (uint64_t)qword_268928BC8);
    uint64_t v28 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v12, v27, v3);
    uint64_t v29 = sub_23785B490();
    os_log_type_t v30 = sub_23785B8D0();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl(&dword_237778000, v29, v30, "AppLaunchFlowProvider.findFlow() returning closeAppFlow", v31, 2u);
      MEMORY[0x237E23210](v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v3);
    type metadata accessor for CloseAppWrapperFlow();
    v53[0] = sub_23779FE4C();
    sub_23785365C((unint64_t *)&qword_268926F58, (void (*)(uint64_t))type metadata accessor for CloseAppWrapperFlow);
    sub_237859DD0();
    swift_release();
    goto LABEL_18;
  }
  if (LOBYTE(v53[0]) == 11)
  {
    if (qword_2689267C8 != -1) {
      swift_once();
    }
    sub_23785ABB0();
    uint64_t v32 = v53[1];
    swift_bridgeObjectRelease();
    if (!v32)
    {
      if (qword_2689266D8 != -1) {
        swift_once();
      }
      uint64_t v33 = __swift_project_value_buffer(v3, (uint64_t)qword_268928BC8);
      (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v9, v33, v3);
      uint64_t v34 = sub_23785B490();
      os_log_type_t v35 = sub_23785B8D0();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl(&dword_237778000, v34, v35, "AppLaunchFlowProvider.findFlow() returning launchAppWrapperFlow when an appProvider is not specified", v36, 2u);
        MEMORY[0x237E23210](v36, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v51 + 8))(v9, v3);
      goto LABEL_12;
    }
LABEL_32:
    sub_237859E30();
    return sub_23779FC4C((uint64_t)v20);
  }
  if (LOBYTE(v53[0]) != 5)
  {
    if (qword_2689266D8 != -1) {
      swift_once();
    }
    uint64_t v37 = __swift_project_value_buffer(v3, (uint64_t)qword_268928BC8);
    uint64_t v38 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v6, v37, v3);
    sub_23779FBE8((uint64_t)v20, (uint64_t)v18);
    uint64_t v39 = sub_23785B490();
    os_log_type_t v40 = sub_23785B8B0();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      int v49 = (void *)swift_slowAlloc();
      v53[0] = (uint64_t)v49;
      *(_DWORD *)uint64_t v41 = 136315138;
      uint64_t v47 = v41 + 4;
      uint64_t v48 = v41;
      sub_23785ABB0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268928B20);
      uint64_t v42 = sub_23785B6D0();
      uint64_t v52 = sub_2377C6A68(v42, v43, v53);
      sub_23785B9E0();
      swift_bridgeObjectRelease();
      sub_23779FC4C((uint64_t)v18);
      os_signpost_id_t v44 = v48;
      _os_log_impl(&dword_237778000, v39, v40, "Unexpected verb: %s", v48, 0xCu);
      uint64_t v45 = v49;
      swift_arrayDestroy();
      MEMORY[0x237E23210](v45, -1, -1);
      MEMORY[0x237E23210](v44, -1, -1);

      (*(void (**)(char *, uint64_t))(v51 + 8))(v6, v3);
    }
    else
    {
      sub_23779FC4C((uint64_t)v18);

      (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v3);
    }
    goto LABEL_32;
  }
LABEL_7:
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v3, (uint64_t)qword_268928BC8);
  uint64_t v23 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v14, v22, v3);
  uint64_t v24 = sub_23785B490();
  os_log_type_t v25 = sub_23785B8D0();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_237778000, v24, v25, "AppLaunchFlowProvider.findFlow() returning launchAppWrapperFlow", v26, 2u);
    MEMORY[0x237E23210](v26, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v3);
LABEL_12:
  __swift_project_boxed_opaque_existential_1(v49, v49[3]);
  sub_23784C490();
LABEL_18:
  sub_237859E40();
  swift_release();
  return sub_23779FC4C((uint64_t)v20);
}

uint64_t sub_2378506AC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v189 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928B28);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v180 = (char *)&v172 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v177 = (char *)&v172 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v178 = (char *)&v172 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v172 - v10;
  uint64_t v188 = sub_23785B4B0();
  uint64_t v187 = *(void *)(v188 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v188);
  uint64_t v14 = (char *)&v172 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v179 = (uint64_t)&v172 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v181 = (char *)&v172 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v174 = (char *)&v172 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v173 = (char *)&v172 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v176 = (char *)&v172 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v175 = (char *)&v172 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v172 = (char *)&v172 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v172 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v34 = (char *)&v172 - v33;
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v183 = (char *)&v172 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  uint64_t v182 = (char *)&v172 - v38;
  MEMORY[0x270FA5388](v37);
  uint64_t v184 = (char *)&v172 - v39;
  uint64_t v40 = sub_237859460();
  uint64_t v185 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v42 = (char *)&v172 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = a1[3];
  uint64_t v43 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v44);
  uint64_t v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v43 + 8))(v44, v43);
  if (v45)
  {
    uint64_t v46 = (char *)v45;
    uint64_t v192 = &type metadata for Features;
    unint64_t v193 = sub_2378534D0();
    LOBYTE(v191) = 0;
    char v47 = sub_23785A6C0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v191);
    if (v47)
    {
      uint64_t v48 = sub_2377FF68C();
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v179 = v48;
        uint64_t v51 = sub_2377FEB04();
        if (!v52)
        {
          swift_bridgeObjectRelease();
          if (qword_2689266D8 != -1) {
            swift_once();
          }
          uint64_t v67 = v188;
          uint64_t v68 = __swift_project_value_buffer(v188, (uint64_t)qword_268928BC8);
          uint64_t v69 = v187;
          (*(void (**)(char *, uint64_t, uint64_t))(v187 + 16))(v31, v68, v67);
          uint64_t v70 = sub_23785B490();
          os_log_type_t v71 = sub_23785B8D0();
          if (os_log_type_enabled(v70, v71))
          {
            uint64_t v72 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v72 = 0;
            _os_log_impl(&dword_237778000, v70, v71, "AppLaunchFlowProvider.findFlow() returning noFlow because appName is not present in USO", v72, 2u);
            MEMORY[0x237E23210](v72, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v69 + 8))(v31, v67);
          goto LABEL_101;
        }
        unint64_t v53 = v52;
        uint64_t v178 = (char *)v51;
        uint64_t v180 = (char *)v50;
        uint64_t v181 = v46;
        uint64_t v54 = v186;
        uint64_t v55 = v186 + 5;
        __swift_project_boxed_opaque_existential_1(v186 + 5, v186[8]);
        char v56 = sub_237859F80();
        sub_23785351C(v54, &v191);
        if (v56)
        {
          sub_237853554((uint64_t)&v191);
        }
        else
        {
          __swift_project_boxed_opaque_existential_1(v194, v195);
          char v73 = sub_237859FA0();
          sub_237853554((uint64_t)&v191);
          if ((v73 & 1) == 0)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (qword_2689266D8 != -1) {
              swift_once();
            }
            uint64_t v105 = v188;
            uint64_t v106 = __swift_project_value_buffer(v188, (uint64_t)qword_268928BC8);
            uint64_t v107 = v187;
            (*(void (**)(char *, uint64_t, uint64_t))(v187 + 16))(v34, v106, v105);
            uint64_t v108 = sub_23785B490();
            os_log_type_t v109 = sub_23785B8D0();
            if (os_log_type_enabled(v108, v109))
            {
              uint64_t v110 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v110 = 0;
              _os_log_impl(&dword_237778000, v108, v109, "AppLaunchFlowProvider.findFlow() returning noFlow because device is not iOS", v110, 2u);
              MEMORY[0x237E23210](v110, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v107 + 8))(v34, v105);
            goto LABEL_101;
          }
        }
        uint64_t v74 = v54 + 10;
        __swift_project_boxed_opaque_existential_1(v54 + 10, v54[13]);
        __swift_project_boxed_opaque_existential_1(v55, v54[8]);
        sub_237859F40();
        char v75 = sub_237828DF0();
        uint64_t v77 = v185 + 8;
        int v76 = *(void (**)(char *, uint64_t))(v185 + 8);
        v76(v42, v40);
        if (v75)
        {
          uint64_t v78 = __swift_project_boxed_opaque_existential_1(v54 + 20, v54[23]);
          unint64_t v79 = (void *)sub_2377BD3B8((uint64_t)v78);
          uint64_t v80 = v187;
          if (v79[2])
          {
            uint64_t v82 = v79[4];
            unint64_t v81 = v79[5];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v111 = sub_2377FEB04();
            if (!v112)
            {
LABEL_51:
              if (qword_2689266D8 != -1) {
                swift_once();
              }
              uint64_t v113 = v188;
              uint64_t v114 = __swift_project_value_buffer(v188, (uint64_t)qword_268928BC8);
              uint64_t v115 = v183;
              (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v183, v114, v113);
              swift_bridgeObjectRetain();
              uint64_t v116 = v80;
              unint64_t v117 = (unint64_t)v180;
              swift_bridgeObjectRetain();
              id v118 = sub_23785B490();
              os_log_type_t v119 = sub_23785B8D0();
              if (os_log_type_enabled(v118, v119))
              {
                uint64_t v120 = swift_slowAlloc();
                uint64_t v186 = (void *)swift_slowAlloc();
                *(void *)&long long v191 = v186;
                *(_DWORD *)uint64_t v120 = 136315394;
                swift_bridgeObjectRetain();
                uint64_t v196 = (void *)sub_2377C6A68((uint64_t)v178, v53, (uint64_t *)&v191);
                sub_23785B9E0();
                swift_bridgeObjectRelease_n();
                *(_WORD *)(v120 + 12) = 2080;
                swift_bridgeObjectRetain();
                uint64_t v196 = (void *)sub_2377C6A68(v179, v117, (uint64_t *)&v191);
                sub_23785B9E0();
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_237778000, v118, v119, "AppLaunchFlowProvider.findFlow() returning deepLaunchWrapperFlow for App: %s and Action: %s", (uint8_t *)v120, 0x16u);
                unint64_t v121 = v186;
                swift_arrayDestroy();
                MEMORY[0x237E23210](v121, -1, -1);
                MEMORY[0x237E23210](v120, -1, -1);

                (*(void (**)(char *, uint64_t))(v116 + 8))(v183, v188);
              }
              else
              {

                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease_n();
                (*(void (**)(char *, uint64_t))(v116 + 8))(v115, v113);
              }
              type metadata accessor for DeepLaunchWrapperFlow();
              *(void *)&long long v191 = sub_237790024();
              sub_23785365C(&qword_268926D58, (void (*)(uint64_t))type metadata accessor for DeepLaunchWrapperFlow);
              sub_237859DD0();
              swift_release();
              sub_237859E40();
              goto LABEL_18;
            }
            uint64_t v82 = v111;
            unint64_t v81 = v112;
          }
          __swift_project_boxed_opaque_existential_1(v74, v186[13]);
          if (sub_237828ED0(v82, v81))
          {
            swift_bridgeObjectRelease();
            goto LABEL_51;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (qword_2689266D8 != -1) {
            swift_once();
          }
          uint64_t v122 = v188;
          uint64_t v123 = __swift_project_value_buffer(v188, (uint64_t)qword_268928BC8);
          uint64_t v124 = v182;
          (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v182, v123, v122);
          swift_bridgeObjectRetain();
          BOOL v125 = sub_23785B490();
          os_log_type_t v126 = sub_23785B8D0();
          if (os_log_type_enabled(v125, v126))
          {
            uint64_t v127 = (uint8_t *)swift_slowAlloc();
            uint64_t v128 = swift_slowAlloc();
            *(void *)&long long v191 = v128;
            *(_DWORD *)uint64_t v127 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v196 = (void *)sub_2377C6A68(v82, v81, (uint64_t *)&v191);
            sub_23785B9E0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_237778000, v125, v126, "AppLaunchFlowProvider.findFlow() returning noFlow because app %s is not in scope", v127, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x237E23210](v128, -1, -1);
            MEMORY[0x237E23210](v127, -1, -1);

            (*(void (**)(char *, uint64_t))(v80 + 8))(v182, v122);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            (*(void (**)(char *, uint64_t))(v80 + 8))(v124, v122);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v93 = v187;
          if (qword_2689266D8 != -1) {
            swift_once();
          }
          uint64_t v94 = v188;
          uint64_t v95 = __swift_project_value_buffer(v188, (uint64_t)qword_268928BC8);
          uint64_t v96 = v184;
          (*(void (**)(char *, uint64_t, uint64_t))(v93 + 16))(v184, v95, v94);
          sub_23785351C(v186, &v191);
          uint64_t v97 = sub_23785B490();
          os_log_type_t v98 = sub_23785B8D0();
          if (os_log_type_enabled(v97, v98))
          {
            unint64_t v99 = (uint8_t *)swift_slowAlloc();
            uint64_t v100 = (void *)swift_slowAlloc();
            uint64_t v186 = v100;
            uint64_t v185 = v77;
            *(_DWORD *)unint64_t v99 = 136315138;
            uint64_t v196 = v100;
            uint64_t v183 = (char *)(v99 + 4);
            __swift_project_boxed_opaque_existential_1(v194, v195);
            sub_237859F40();
            uint64_t v101 = sub_237859450();
            unint64_t v103 = v102;
            v76(v42, v40);
            uint64_t v190 = sub_2377C6A68(v101, v103, (uint64_t *)&v196);
            sub_23785B9E0();
            swift_bridgeObjectRelease();
            sub_237853554((uint64_t)&v191);
            _os_log_impl(&dword_237778000, v97, v98, "AppLaunchFlowProvider.findFlow() returning noFlow because it is not available in %s", v99, 0xCu);
            uint64_t v104 = v186;
            swift_arrayDestroy();
            MEMORY[0x237E23210](v104, -1, -1);
            MEMORY[0x237E23210](v99, -1, -1);

            (*(void (**)(char *, uint64_t))(v187 + 8))(v184, v188);
          }
          else
          {
            sub_237853554((uint64_t)&v191);

            (*(void (**)(char *, uint64_t))(v93 + 8))(v96, v188);
          }
        }
LABEL_101:
        sub_237859E30();
        return swift_release();
      }
    }
    if (sub_23785AED0() == 0xD000000000000013 && v57 == 0x8000000237867A80)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v65 = sub_23785BE30();
      swift_bridgeObjectRelease();
      uint64_t v66 = v189;
      if ((v65 & 1) == 0)
      {
        if (sub_237809FDC())
        {
          __swift_project_boxed_opaque_existential_1(v186, v186[3]);
          sub_23784CD10();
          sub_237859E40();
LABEL_18:
          swift_release();
          return swift_release();
        }
        sub_2377FEDFC();
        switch(v83)
        {
          case 1:
            goto LABEL_70;
          case 2:
          case 3:
            uint64_t v11 = v180;
            sub_237852C18((uint64_t)v180);
            uint64_t v129 = sub_237859E60();
            if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v129) != 1) {
              goto LABEL_82;
            }
            sub_2377BD9A0((uint64_t)v11, &qword_268928B28);
            if (qword_2689266D8 != -1) {
              swift_once();
            }
            uint64_t v130 = v188;
            uint64_t v131 = __swift_project_value_buffer(v188, (uint64_t)qword_268928BC8);
            uint64_t v132 = v187;
            uint64_t v133 = v176;
            (*(void (**)(char *, uint64_t, uint64_t))(v187 + 16))(v176, v131, v130);
            uint64_t v134 = sub_23785B490();
            os_log_type_t v135 = sub_23785B8D0();
            if (os_log_type_enabled(v134, v135))
            {
              uint64_t v136 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v136 = 0;
              _os_log_impl(&dword_237778000, v134, v135, "AppLaunchFlowProvider.findFlow() returning closeAppFlow", v136, 2u);
              MEMORY[0x237E23210](v136, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v132 + 8))(v133, v130);
            type metadata accessor for CloseAppWrapperFlow();
            *(void *)&long long v191 = sub_23779FE4C();
            uint64_t v91 = (unint64_t *)&qword_268926F58;
            uint64_t v92 = type metadata accessor for CloseAppWrapperFlow;
            goto LABEL_89;
          case 4:
            sub_2378524FC((uint64_t)v11);
            uint64_t v129 = sub_237859E60();
            if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v129) != 1) {
              goto LABEL_82;
            }
            sub_2377BD9A0((uint64_t)v11, &qword_268928B28);
LABEL_70:
            uint64_t v11 = v178;
            sub_237852704((uint64_t)v178);
            uint64_t v129 = sub_237859E60();
            if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v129) != 1) {
              goto LABEL_82;
            }
            sub_2377BD9A0((uint64_t)v11, &qword_268928B28);
            if (sub_237801EFC())
            {
              if (qword_2689266D8 != -1) {
                swift_once();
              }
              uint64_t v137 = v188;
              uint64_t v138 = __swift_project_value_buffer(v188, (uint64_t)qword_268928BC8);
              uint64_t v139 = v187;
              os_log_t v140 = v172;
              (*(void (**)(char *, uint64_t, uint64_t))(v187 + 16))(v172, v138, v137);
              unint64_t v141 = sub_23785B490();
              os_log_type_t v142 = sub_23785B8D0();
              if (os_log_type_enabled(v141, v142))
              {
                uint64_t v143 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v143 = 0;
                uint64_t v144 = "AppLaunchFlowProvider.findFlow() parse is verbless or summarise genre, which we cannot handle, returning .noFlow";
                goto LABEL_98;
              }
              goto LABEL_99;
            }
LABEL_76:
            uint64_t v11 = v177;
            uint64_t v145 = v186;
            sub_2378527A0((uint64_t)v177);
            uint64_t v129 = sub_237859E60();
            if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v129) != 1)
            {
LABEL_82:
              swift_release();
              return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v129 - 8) + 32))(v66, v11, v129);
            }
            sub_2377BD9A0((uint64_t)v11, &qword_268928B28);
            if (qword_2689266D8 != -1) {
              swift_once();
            }
            uint64_t v146 = v188;
            uint64_t v147 = __swift_project_value_buffer(v188, (uint64_t)qword_268928BC8);
            uint64_t v148 = v187;
            os_log_type_t v149 = v175;
            (*(void (**)(char *, uint64_t, uint64_t))(v187 + 16))(v175, v147, v146);
            uint64_t v150 = sub_23785B490();
            os_log_type_t v151 = sub_23785B8D0();
            if (os_log_type_enabled(v150, v151))
            {
              uint64_t v152 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v152 = 0;
              _os_log_impl(&dword_237778000, v150, v151, "AppLaunchFlowProvider.findFlow() returning launchAppWrapperFlow", v152, 2u);
              MEMORY[0x237E23210](v152, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v148 + 8))(v149, v146);
            __swift_project_boxed_opaque_existential_1(v145, v145[3]);
            sub_23784C490();
            goto LABEL_17;
          case 5:
          case 7:
          case 8:
            if (qword_2689266D8 != -1) {
              swift_once();
            }
            uint64_t v84 = v188;
            uint64_t v85 = __swift_project_value_buffer(v188, (uint64_t)qword_268928BC8);
            uint64_t v86 = v187;
            uint64_t v87 = v181;
            (*(void (**)(char *, uint64_t, uint64_t))(v187 + 16))(v181, v85, v84);
            uint64_t v88 = sub_23785B490();
            os_log_type_t v89 = sub_23785B8D0();
            if (os_log_type_enabled(v88, v89))
            {
              uint64_t v90 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v90 = 0;
              _os_log_impl(&dword_237778000, v88, v89, "AppLaunchFlowProvider.findFlow() returning removeAppFlow", v90, 2u);
              MEMORY[0x237E23210](v90, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v86 + 8))(v87, v84);
            type metadata accessor for RemoveAppFlow();
            *(void *)&long long v191 = sub_2377B09CC();
            uint64_t v91 = &qword_268927248;
            uint64_t v92 = type metadata accessor for RemoveAppFlow;
            goto LABEL_89;
          case 6:
            uint64_t v153 = a1[3];
            __swift_project_boxed_opaque_existential_1(a1, v153);
            if (sub_23778B388(v153))
            {
              uint64_t v154 = v187;
              uint64_t v155 = v188;
              if (qword_2689266D8 != -1) {
                swift_once();
              }
              uint64_t v156 = __swift_project_value_buffer(v155, (uint64_t)qword_268928BC8);
              uint64_t v157 = v173;
              (*(void (**)(char *, uint64_t, uint64_t))(v154 + 16))(v173, v156, v155);
              uint64_t v158 = sub_23785B490();
              os_log_type_t v159 = sub_23785B8D0();
              if (os_log_type_enabled(v158, v159))
              {
                uint64_t v160 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v160 = 0;
                _os_log_impl(&dword_237778000, v158, v159, "AppLaunchFlowProvider.findFlow() returning installAppFlow", v160, 2u);
                MEMORY[0x237E23210](v160, -1, -1);
              }

              (*(void (**)(char *, uint64_t))(v154 + 8))(v157, v155);
              type metadata accessor for InstallAppFlow();
              *(void *)&long long v191 = sub_2377A216C();
              uint64_t v91 = &qword_268927018;
              uint64_t v92 = type metadata accessor for InstallAppFlow;
LABEL_89:
              sub_23785365C(v91, (void (*)(uint64_t))v92);
              sub_237859DD0();
              swift_release();
              goto LABEL_17;
            }
            uint64_t v139 = v187;
            uint64_t v137 = v188;
            if (qword_2689266D8 != -1) {
              swift_once();
            }
            uint64_t v171 = __swift_project_value_buffer(v137, (uint64_t)qword_268928BC8);
            os_log_t v140 = v174;
            (*(void (**)(char *, uint64_t, uint64_t))(v139 + 16))(v174, v171, v137);
            unint64_t v141 = sub_23785B490();
            os_log_type_t v142 = sub_23785B8B0();
            if (os_log_type_enabled(v141, v142))
            {
              uint64_t v143 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v143 = 0;
              uint64_t v144 = "AppLaunchFlowProvider.findFlow() received install USOTask, but will NOT handle because request did "
                     "not originate from Pegasus";
LABEL_98:
              _os_log_impl(&dword_237778000, v141, v142, v144, v143, 2u);
              MEMORY[0x237E23210](v143, -1, -1);
            }
LABEL_99:

            (*(void (**)(char *, uint64_t))(v139 + 8))(v140, v137);
            break;
          case 9:
            if (qword_2689266D8 != -1) {
              swift_once();
            }
            uint64_t v161 = v188;
            uint64_t v162 = __swift_project_value_buffer(v188, (uint64_t)qword_268928BC8);
            uint64_t v163 = v187;
            uint64_t v164 = v179;
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v187 + 16))(v179, v162, v161);
            swift_retain_n();
            uint64_t v165 = sub_23785B490();
            os_log_type_t v166 = sub_23785B8B0();
            if (os_log_type_enabled(v165, v166))
            {
              uint64_t v167 = swift_slowAlloc();
              uint64_t v168 = swift_slowAlloc();
              *(void *)&long long v191 = v168;
              *(_DWORD *)uint64_t v167 = 136315138;
              uint64_t v186 = (void *)(v167 + 4);
              uint64_t v169 = sub_23785AEC0();
              uint64_t v196 = (void *)sub_2377C6A68(v169, v170, (uint64_t *)&v191);
              sub_23785B9E0();
              swift_release_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_237778000, v165, v166, "Unknown USO verb: %s", (uint8_t *)v167, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x237E23210](v168, -1, -1);
              MEMORY[0x237E23210](v167, -1, -1);

              (*(void (**)(uint64_t, uint64_t))(v163 + 8))(v179, v161);
            }
            else
            {

              swift_release_n();
              (*(void (**)(uint64_t, uint64_t))(v163 + 8))(v164, v161);
            }
            goto LABEL_101;
          default:
            goto LABEL_76;
        }
        goto LABEL_101;
      }
    }
    __swift_project_boxed_opaque_existential_1(v186, v186[3]);
    sub_23784CBEC();
LABEL_17:
    sub_237859E40();
    goto LABEL_18;
  }
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  uint64_t v58 = v188;
  uint64_t v59 = __swift_project_value_buffer(v188, (uint64_t)qword_268928BC8);
  uint64_t v60 = v187;
  (*(void (**)(char *, uint64_t, uint64_t))(v187 + 16))(v14, v59, v58);
  uint64_t v61 = sub_23785B490();
  os_log_type_t v62 = sub_23785B8B0();
  if (os_log_type_enabled(v61, v62))
  {
    uint64_t v63 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v63 = 0;
    _os_log_impl(&dword_237778000, v61, v62, "No USO task found in input", v63, 2u);
    MEMORY[0x237E23210](v63, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v60 + 8))(v14, v58);
  return sub_237859E30();
}

uint64_t sub_23785230C()
{
  uint64_t v1 = v0;
  uint64_t v3 = sub_23785A610();
  uint64_t v4 = v2;
  if (v3 == 0xD000000000000022 && v2 == 0x8000000237867A20 || (sub_23785BE30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(v1, v1[3]);
    sub_23784C490();
    sub_237859E40();
    return swift_release();
  }
  if (v3 == 0xD000000000000021 && v4 == 0x8000000237867A50)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    type metadata accessor for CloseAppWrapperFlow();
    sub_23779FE4C();
    sub_23785365C((unint64_t *)&qword_268926F58, (void (*)(uint64_t))type metadata accessor for CloseAppWrapperFlow);
    sub_237859DD0();
    swift_release();
    sub_237859E40();
    return swift_release();
  }
  char v6 = sub_23785BE30();
  swift_bridgeObjectRelease();
  if (v6) {
    goto LABEL_11;
  }
  return sub_237859E30();
}

uint64_t sub_2378524FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268928B38);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_23785A3D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_project_boxed_opaque_existential_1((void *)(v1 + 160), *(void *)(v1 + 184));
  uint64_t v9 = (void *)sub_2377BD3B8((uint64_t)v8);
  char v10 = sub_237820FBC(0xD000000000000011, 0x8000000237867AA0, v9);
  swift_bridgeObjectRelease();
  if (v10)
  {
    sub_23785A640();
    sub_23785B080();
    sub_23785A3C0();
    sub_237859E50();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v11 = sub_237859E60();
    return __swift_storeEnumTagSinglePayload(a1, 0, 1, v11);
  }
  else
  {
    uint64_t v13 = sub_237859E60();
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v13);
  }
}

uint64_t sub_237852704@<X0>(uint64_t a1@<X8>)
{
  sub_23785AC00();
  if (v5)
  {
    sub_23785AD90();
    if (swift_dynamicCast()) {
      swift_release();
    }
  }
  else
  {
    sub_2377BD9A0((uint64_t)v4, &qword_268926DF8);
  }
  uint64_t v2 = sub_237859E60();
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

uint64_t sub_2378527A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23785B4B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_237852CBC())
  {
    __swift_project_boxed_opaque_existential_1(v1, v1[3]);
    sub_23784CB2C();
    sub_237859E40();
    swift_release();
    uint64_t v8 = sub_237859E60();
    uint64_t v9 = a1;
    uint64_t v10 = 0;
LABEL_15:
    return __swift_storeEnumTagSinglePayload(v9, v10, 1, v8);
  }
  uint64_t v27 = v7;
  uint64_t v28 = v5;
  uint64_t v29 = v4;
  uint64_t v31 = a1;
  uint64_t v11 = __swift_project_boxed_opaque_existential_1(v1 + 20, v1[23]);
  uint64_t v32 = sub_2377BD3B8((uint64_t)v11);
  uint64_t v12 = *(void *)(v32 + 16);
  if (!v12)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_237859E60();
    uint64_t v9 = v31;
    uint64_t v10 = 1;
    goto LABEL_15;
  }
  uint64_t v13 = (uint64_t *)(v32 + 40);
  uint64_t v33 = "com.shazam.Shazam";
  unint64_t v30 = 0x8000000237867AC0;
  while (1)
  {
    uint64_t v14 = *(v13 - 1);
    uint64_t v15 = *v13;
    if ((v14 != 0xD000000000000019 || v15 != 0x8000000237865FB0) && (sub_23785BE30() & 1) == 0) {
      break;
    }
    __swift_project_boxed_opaque_existential_1(v2 + 5, v2[8]);
    if (sub_237859FD0())
    {
      swift_bridgeObjectRelease();
      type metadata accessor for URLBasedLaunchFlow();
      uint64_t v34 = sub_2377B665C();
      sub_23785365C(&qword_268927308, (void (*)(uint64_t))type metadata accessor for URLBasedLaunchFlow);
      sub_237859DD0();
      swift_release();
      uint64_t v17 = v31;
      goto LABEL_23;
    }
LABEL_13:
    v13 += 2;
    if (!--v12) {
      goto LABEL_14;
    }
  }
  if ((v14 != 0xD000000000000018 || v15 != v30) && (sub_23785BE30() & 1) == 0) {
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
  if (qword_2689266D8 != -1) {
    swift_once();
  }
  uint64_t v18 = v29;
  uint64_t v19 = __swift_project_value_buffer(v29, (uint64_t)qword_268928BC8);
  uint64_t v21 = v27;
  uint64_t v20 = v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v27, v19, v18);
  uint64_t v22 = sub_23785B490();
  os_log_type_t v23 = sub_23785B8D0();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v17 = v31;
  if (v24)
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl(&dword_237778000, v22, v23, "AppLaunchFlowProvider.findFlow() returning LaunchQuickNoteFlow", v25, 2u);
    MEMORY[0x237E23210](v25, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v18);
  type metadata accessor for LaunchQuickNoteFlow();
  uint64_t v34 = sub_2377AC704();
  sub_23785365C(&qword_268927138, (void (*)(uint64_t))type metadata accessor for LaunchQuickNoteFlow);
  sub_237859DD0();
  swift_release();
LABEL_23:
  sub_237859E40();
  swift_release();
  uint64_t v26 = sub_237859E60();
  return __swift_storeEnumTagSinglePayload(v17, 0, 1, v26);
}

uint64_t sub_237852C18@<X0>(uint64_t a1@<X8>)
{
  if (sub_237852CBC())
  {
    __swift_project_boxed_opaque_existential_1(v1, v1[3]);
    sub_23784CB2C();
    sub_237859E40();
    swift_release();
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = __swift_project_boxed_opaque_existential_1(v1 + 20, v1[23]);
    sub_2377BD3B8((uint64_t)v4);
    swift_bridgeObjectRelease();
    uint64_t v3 = 1;
  }
  uint64_t v5 = sub_237859E60();
  return __swift_storeEnumTagSinglePayload(a1, v3, 1, v5);
}

uint64_t sub_237852CBC()
{
  uint64_t v0 = sub_237800880();
  uint64_t v1 = sub_2377FF7C8(v0);
  if (qword_268926730 != -1) {
    swift_once();
  }
  unint64_t v2 = 0xEE00656D6F482E65;
  uint64_t v3 = 0x6C7070612E6D6F63;
  uint64_t v4 = off_268927CC0;
  if (*((void *)off_268927CC0 + 2))
  {
    unint64_t v5 = sub_2377ED5B8(0x6C7070612E6D6F63, 0xEE00656D6F482E65);
    if (v6)
    {
      uint64_t v7 = (uint64_t *)(v4[7] + 16 * v5);
      uint64_t v3 = *v7;
      unint64_t v2 = v7[1];
      swift_bridgeObjectRetain();
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689279E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23785CD40;
  *(void *)(inited + 32) = v3;
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 48) = 0xD000000000000019;
  *(void *)(inited + 56) = 0x8000000237866FE0;
  if (sub_237852E14((void *)inited, v1))
  {
    char v9 = 0;
  }
  else
  {
    sub_23784AD00(0xD000000000000019, 0x8000000237866FE0, v1);
    char v9 = v10;
  }
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_237852E14(void *a1, uint64_t a2)
{
  uint64_t v23 = a1[2];
  if (v23)
  {
    if (*(void *)(a2 + 16))
    {
      uint64_t v4 = a1 + 4;
      unint64_t v5 = a1 + 5;
      uint64_t v6 = a2 + 56;
      unint64_t v7 = 1;
      uint64_t v22 = a1 + 4;
      while (1)
      {
        uint64_t v8 = *v5;
        uint64_t v9 = *v4;
        swift_bridgeObjectRetain();
        sub_23785BEC0();
        sub_23785B700();
        uint64_t v10 = sub_23785BEF0();
        uint64_t v11 = -1 << *(unsigned char *)(a2 + 32);
        unint64_t v12 = v10 & ~v11;
        if (((*(void *)(v6 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
          goto LABEL_24;
        }
        uint64_t v13 = *(void *)(a2 + 48);
        uint64_t v14 = (void *)(v13 + 16 * v12);
        BOOL v15 = *v14 == v9 && v14[1] == v8;
        if (!v15 && (sub_23785BE30() & 1) == 0)
        {
          uint64_t v17 = ~v11;
          for (unint64_t i = v12 + 1; ; unint64_t i = v19 + 1)
          {
            uint64_t v19 = i & v17;
            if (((*(void *)(v6 + (((i & v17) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v17)) & 1) == 0) {
              break;
            }
            uint64_t v20 = (void *)(v13 + 16 * v19);
            BOOL v21 = *v20 == v9 && v20[1] == v8;
            if (v21 || (sub_23785BE30() & 1) != 0) {
              goto LABEL_10;
            }
          }
LABEL_24:
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
LABEL_10:
        uint64_t result = swift_bridgeObjectRelease();
        if (v7 == v23) {
          goto LABEL_22;
        }
        if (v7 >= a1[2]) {
          break;
        }
        if (!*(void *)(a2 + 16)) {
          goto LABEL_25;
        }
        uint64_t v4 = &v22[2 * v7++];
        unint64_t v5 = v4 + 1;
      }
      __break(1u);
    }
    else
    {
LABEL_25:
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {
LABEL_22:
    swift_bridgeObjectRelease();
    return 1;
  }
  return result;
}

uint64_t sub_237852FC8()
{
  sub_2378593F0();
  OUTLINED_FUNCTION_29_0();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 56);
  uint64_t v4 = v2 | 7;
  OUTLINED_FUNCTION_5_2();
  v5();
  return MEMORY[0x270FA0238](v0, v3, v4);
}

uint64_t sub_237853048()
{
  uint64_t v1 = *(void *)(sub_2378593F0() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_23784D958(v2);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_2378530C0()
{
  unint64_t result = qword_268928B10;
  if (!qword_268928B10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268928B08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928B10);
  }
  return result;
}

uint64_t destroy for AppLaunchFlowProvider(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 160);
}

_OWORD *initializeWithCopy for AppLaunchFlowProvider(_OWORD *a1, _OWORD *a2)
{
  long long v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  long long v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  long long v7 = a2[9];
  a1[9] = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)a1 + 120, (uint64_t)a2 + 120);
  long long v8 = *(_OWORD *)((char *)a2 + 184);
  *(_OWORD *)((char *)a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))((uint64_t)(a1 + 10), (uint64_t)(a2 + 10));
  return a1;
}

uint64_t *assignWithCopy for AppLaunchFlowProvider(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

void *__swift_memcpy200_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC8uLL);
}

uint64_t assignWithTake for AppLaunchFlowProvider(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  long long v6 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v6;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppLaunchFlowProvider(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 200))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for AppLaunchFlowProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 200) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 200) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchFlowProvider()
{
  return &type metadata for AppLaunchFlowProvider;
}

unint64_t sub_2378534D0()
{
  unint64_t result = qword_268928B30;
  if (!qword_268928B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928B30);
  }
  return result;
}

_OWORD *sub_23785351C(_OWORD *a1, _OWORD *a2)
{
  return a2;
}

uint64_t sub_237853554(uint64_t a1)
{
  return a1;
}

uint64_t sub_237853584(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2378535AC(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_23785B9E0();
  *a1 = v5;
  return result;
}

void sub_237853604(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_23785B6A0();
  objc_msgSend(a3, sel_setName_, v4);
}

uint64_t sub_23785365C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2378536A4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2378536DC()
{
  return sub_23784E154(*(void **)(v0 + 16));
}

uint64_t sub_2378536E4()
{
  sub_2378593F0();
  OUTLINED_FUNCTION_29_0();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = ((*(void *)(v1 + 56) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  OUTLINED_FUNCTION_5_2();
  v5();
  swift_release();
  return MEMORY[0x270FA0238](v0, v4, v3);
}

uint64_t sub_237853778()
{
  uint64_t v1 = *(void *)(sub_2378593F0() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_23784E70C(v0 + v2, v3);
}

uint64_t sub_237853804()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_237853844(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_2377A1F58;
  return sub_23784E358(a1, v4, v5, v6);
}

uint64_t sub_2378538F8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_237853930(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2377A1F58;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268926CC8 + dword_268926CC8);
  return v6(a1, v4);
}

uint64_t OUTLINED_FUNCTION_3_24()
{
  return v0;
}

void OUTLINED_FUNCTION_10_17(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_11_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20_7(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_23785B9E0();
}

uint64_t OUTLINED_FUNCTION_21_15()
{
  uint64_t v2 = *(void *)(v0 - 152);
  return sub_2378506AC((void *)(v0 - 136), v2);
}

uint64_t sub_237853B24()
{
  sub_23777B274();
  uint64_t result = sub_23785B9C0();
  qword_268928D68 = result;
  return result;
}

uint64_t sub_237853B8C(uint64_t a1)
{
  return sub_237853BD0(a1, qword_268928D70);
}

uint64_t sub_237853BA4(uint64_t a1)
{
  return sub_237853BD0(a1, qword_268928D88);
}

uint64_t sub_237853BD0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_23785B4B0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_23785B4A0();
}

char *LaunchAppIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return LaunchAppIntentResponse.init(code:userActivity:)(a1, a2);
}

uint64_t LaunchAppApplicationUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 6) < 0xFFFFFFFFFFFFFFFBLL) {
    return 0;
  }
  return result;
}

id LaunchAppIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchAppIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id LaunchAppIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for LaunchAppIntent();
  id v9 = OUTLINED_FUNCTION_1_19((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id LaunchAppIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id LaunchAppIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for LaunchAppIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id LaunchAppIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_0_12();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id LaunchAppIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_0_12();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for LaunchAppIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id LaunchAppIntent.__deallocating_deinit()
{
  return sub_2378549D0(type metadata accessor for LaunchAppIntent);
}

unint64_t LaunchAppIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result - 100 >= 3) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = result;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

uint64_t sub_237854138()
{
  return sub_23785724C(*v0);
}

uint64_t sub_237854140()
{
  return sub_237857300();
}

uint64_t sub_237854148(uint64_t a1)
{
  return sub_2378577F0(a1, *v1);
}

unint64_t sub_237854150@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = LaunchAppIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t LaunchAppIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___LaunchAppIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_237854218(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___LaunchAppIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

char *LaunchAppIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___LaunchAppIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for LaunchAppIntent()
{
  return self;
}

id LaunchAppIntentResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id LaunchAppIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___LaunchAppIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchAppIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for LaunchAppIntentResponse()
{
  return self;
}

id LaunchAppIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id LaunchAppIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___LaunchAppIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for LaunchAppIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_19((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id LaunchAppIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id LaunchAppIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___LaunchAppIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for LaunchAppIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_19((uint64_t)v11.super_class, sel_initWithBackingStore_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id LaunchAppIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id LaunchAppIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___LaunchAppIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for LaunchAppIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_19((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id LaunchAppIntentResponse.__deallocating_deinit()
{
  return sub_2378549D0(type metadata accessor for LaunchAppIntentResponse);
}

uint64_t sub_23785473C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = LaunchAppApplicationUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id static LaunchAppApplicationResolutionResult.unsupported(forReason:)(uint64_t a1)
{
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupportedWithReason_, a1);
  return v1;
}

id LaunchAppApplicationResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  uint64_t v5 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id LaunchAppApplicationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for LaunchAppApplicationResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for LaunchAppApplicationResolutionResult()
{
  return self;
}

id LaunchAppApplicationResolutionResult.__deallocating_deinit()
{
  return sub_2378549D0(type metadata accessor for LaunchAppApplicationResolutionResult);
}

id sub_2378549D0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_237854A0C()
{
  unint64_t result = qword_268928B58;
  if (!qword_268928B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928B58);
  }
  return result;
}

unint64_t sub_237854A5C()
{
  unint64_t result = qword_268928B60;
  if (!qword_268928B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928B60);
  }
  return result;
}

uint64_t sub_237854AA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LaunchAppIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_237854AD4(uint64_t *a1)
{
  return sub_237854218(*a1);
}

ValueMetadata *type metadata accessor for LaunchAppIntentResponseCode()
{
  return &type metadata for LaunchAppIntentResponseCode;
}

ValueMetadata *type metadata accessor for LaunchAppApplicationUnsupportedReason()
{
  return &type metadata for LaunchAppApplicationUnsupportedReason;
}

uint64_t OUTLINED_FUNCTION_0_12()
{
  return sub_23785B6A0();
}

id OUTLINED_FUNCTION_1_19(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2, v9);
}

char *CloseAppIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return CloseAppIntentResponse.init(code:userActivity:)(a1, a2);
}

uint64_t CloseAppApplicationUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  if (a1 == 2) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 0;
  }
  if (a1 == 1) {
    return 1;
  }
  else {
    return v1;
  }
}

id CloseAppIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CloseAppIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CloseAppIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for CloseAppIntent();
  id v9 = OUTLINED_FUNCTION_1_19((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id CloseAppIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id CloseAppIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for CloseAppIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id CloseAppIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_0_12();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id CloseAppIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_0_12();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for CloseAppIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id CloseAppIntent.__deallocating_deinit()
{
  return sub_2378558DC(type metadata accessor for CloseAppIntent);
}

unint64_t CloseAppIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result == 100) {
    uint64_t v1 = 100;
  }
  else {
    uint64_t v1 = 0;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

unint64_t sub_237855058@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = CloseAppIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t CloseAppIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___CloseAppIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_237855120(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___CloseAppIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

char *CloseAppIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___CloseAppIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for CloseAppIntent()
{
  return self;
}

id CloseAppIntentResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id CloseAppIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___CloseAppIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CloseAppIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for CloseAppIntentResponse()
{
  return self;
}

id CloseAppIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id CloseAppIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___CloseAppIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for CloseAppIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_19((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id CloseAppIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id CloseAppIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___CloseAppIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for CloseAppIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_19((uint64_t)v11.super_class, sel_initWithBackingStore_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id CloseAppIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id CloseAppIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___CloseAppIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for CloseAppIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_19((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id CloseAppIntentResponse.__deallocating_deinit()
{
  return sub_2378558DC(type metadata accessor for CloseAppIntentResponse);
}

uint64_t sub_237855648@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = CloseAppApplicationUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id static CloseAppApplicationResolutionResult.unsupported(forReason:)(uint64_t a1)
{
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupportedWithReason_, a1);
  return v1;
}

id CloseAppApplicationResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  uint64_t v5 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id CloseAppApplicationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for CloseAppApplicationResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for CloseAppApplicationResolutionResult()
{
  return self;
}

id CloseAppApplicationResolutionResult.__deallocating_deinit()
{
  return sub_2378558DC(type metadata accessor for CloseAppApplicationResolutionResult);
}

id sub_2378558DC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_237855918()
{
  unint64_t result = qword_268928B70;
  if (!qword_268928B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928B70);
  }
  return result;
}

unint64_t sub_237855968()
{
  unint64_t result = qword_268928B78;
  if (!qword_268928B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928B78);
  }
  return result;
}

uint64_t sub_2378559B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CloseAppIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2378559E0(uint64_t *a1)
{
  return sub_237855120(*a1);
}

ValueMetadata *type metadata accessor for CloseAppIntentResponseCode()
{
  return &type metadata for CloseAppIntentResponseCode;
}

ValueMetadata *type metadata accessor for CloseAppApplicationUnsupportedReason()
{
  return &type metadata for CloseAppApplicationUnsupportedReason;
}

char *DeepLaunchIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return DeepLaunchIntentResponse.init(code:userActivity:)(a1, a2);
}

uint64_t DeepLaunchPageNameUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  if (a1 == 2) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 0;
  }
  if (a1 == 1) {
    return 1;
  }
  else {
    return v1;
  }
}

id DeepLaunchIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeepLaunchIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DeepLaunchIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for DeepLaunchIntent();
  id v9 = OUTLINED_FUNCTION_1_19((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id DeepLaunchIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id DeepLaunchIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for DeepLaunchIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id DeepLaunchIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_0_12();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id DeepLaunchIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_0_12();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for DeepLaunchIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id DeepLaunchIntent.__deallocating_deinit()
{
  return sub_2378568A4(type metadata accessor for DeepLaunchIntent);
}

unint64_t DeepLaunchIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result == 100) {
    uint64_t v1 = 100;
  }
  else {
    uint64_t v1 = 0;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

unint64_t sub_237855F28@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = DeepLaunchIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t DeepLaunchIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DeepLaunchIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_237855FF0(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___DeepLaunchIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

char *DeepLaunchIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___DeepLaunchIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for DeepLaunchIntent()
{
  return self;
}

id DeepLaunchIntentResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id DeepLaunchIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___DeepLaunchIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeepLaunchIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for DeepLaunchIntentResponse()
{
  return self;
}

id DeepLaunchIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id DeepLaunchIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___DeepLaunchIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for DeepLaunchIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_19((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id DeepLaunchIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id DeepLaunchIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___DeepLaunchIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for DeepLaunchIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_19((uint64_t)v11.super_class, sel_initWithBackingStore_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id DeepLaunchIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id DeepLaunchIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___DeepLaunchIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_23785B630();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for DeepLaunchIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_19((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id DeepLaunchIntentResponse.__deallocating_deinit()
{
  return sub_2378568A4(type metadata accessor for DeepLaunchIntentResponse);
}

id DeepLaunchRequestedApplicationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_237856750(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for DeepLaunchRequestedApplicationResolutionResult);
}

uint64_t type metadata accessor for DeepLaunchRequestedApplicationResolutionResult()
{
  return self;
}

id DeepLaunchRequestedApplicationResolutionResult.__deallocating_deinit()
{
  return sub_2378568A4(type metadata accessor for DeepLaunchRequestedApplicationResolutionResult);
}

uint64_t sub_2378565E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = DeepLaunchPageNameUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id _s20SiriAppLaunchIntents04DeepC36RequestedApplicationResolutionResultC11unsupported9forReasonACXDAA0ecfg11UnsupportedL0O_tFZ_0(uint64_t a1)
{
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupportedWithReason_, a1);
  return v1;
}

id _s20SiriAppLaunchIntents04DeepC36RequestedApplicationResolutionResultC14JSONDictionary6intentACSgSDySSypG_So8INIntentCtcfC_0(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  uint64_t v5 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id DeepLaunchPageNameResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_237856750(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for DeepLaunchPageNameResolutionResult);
}

id sub_237856750(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  id v6 = (void *)sub_23785B630();
  uint64_t v7 = swift_bridgeObjectRelease();
  v11.receiver = v3;
  v11.super_class = (Class)a3(v7);
  id v8 = objc_msgSendSuper2(&v11, sel_initWithJSONDictionary_forIntent_, v6, a2);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

uint64_t type metadata accessor for DeepLaunchPageNameResolutionResult()
{
  return self;
}

id DeepLaunchPageNameResolutionResult.__deallocating_deinit()
{
  return sub_2378568A4(type metadata accessor for DeepLaunchPageNameResolutionResult);
}

id sub_2378568A4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_2378568E0()
{
  unint64_t result = qword_268928B88;
  if (!qword_268928B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928B88);
  }
  return result;
}

unint64_t sub_237856930()
{
  unint64_t result = qword_268928B90;
  if (!qword_268928B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928B90);
  }
  return result;
}

unint64_t sub_237856980()
{
  unint64_t result = qword_268928B98;
  if (!qword_268928B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928B98);
  }
  return result;
}

uint64_t sub_2378569CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DeepLaunchIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2378569F8(uint64_t *a1)
{
  return sub_237855FF0(*a1);
}

void type metadata accessor for DeepLaunchIntentResponseCode()
{
}

void type metadata accessor for DeepLaunchRequestedApplicationUnsupportedReason()
{
}

void type metadata accessor for DeepLaunchPageNameUnsupportedReason()
{
}

BOOL InAppVerb.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_237856A7C@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  BOOL result = InAppVerb.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id static InAppVerbResolutionResult.success(with:)(uint64_t a1)
{
  return sub_237856B08(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static InAppVerbResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_237856B08(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id sub_237856B08(uint64_t a1, SEL *a2)
{
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, a1);
  return v2;
}

id InAppVerbResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  uint64_t v5 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id InAppVerbResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for InAppVerbResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for InAppVerbResolutionResult()
{
  return self;
}

id InAppVerbResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InAppVerbResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_237856D90()
{
  unint64_t result = qword_268928BA0;
  if (!qword_268928BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928BA0);
  }
  return result;
}

ValueMetadata *type metadata accessor for InAppVerb()
{
  return &type metadata for InAppVerb;
}

unint64_t AppReference.init(rawValue:)(unint64_t result)
{
  if (result > 5) {
    return 0;
  }
  return result;
}

unint64_t sub_237856E00@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = AppReference.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id static AppReferenceResolutionResult.success(with:)(uint64_t a1)
{
  return sub_237856B08(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static AppReferenceResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_237856B08(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id AppReferenceResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id AppReferenceResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for AppReferenceResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for AppReferenceResolutionResult()
{
  return self;
}

id AppReferenceResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppReferenceResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2378570C0()
{
  unint64_t result = qword_268928BA8;
  if (!qword_268928BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928BA8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppReference()
{
  return &type metadata for AppReference;
}

uint64_t sub_23785711C()
{
  return sub_237857A44();
}

uint64_t sub_237857128(uint64_t a1)
{
  return sub_237857170(a1, (void (*)(uint64_t))sub_23780B99C);
}

uint64_t sub_237857140(uint64_t a1)
{
  return sub_237857170(a1, (void (*)(uint64_t))sub_23780C870);
}

uint64_t sub_237857158(uint64_t a1)
{
  return sub_237857170(a1, (void (*)(uint64_t))sub_23780CEB0);
}

uint64_t sub_237857170(uint64_t a1, void (*a2)(uint64_t))
{
  return sub_23785BEF0();
}

uint64_t sub_2378571C0()
{
  return sub_237857980();
}

uint64_t sub_2378571CC()
{
  return sub_237857904();
}

uint64_t sub_2378571D8()
{
  return sub_23785BEF0();
}

uint64_t sub_23785720C()
{
  return sub_23785BEF0();
}

uint64_t sub_237857250()
{
  return sub_23785BEF0();
}

uint64_t sub_237857290(uint64_t a1, char a2)
{
  if (!a2) {
    OUTLINED_FUNCTION_8_14();
  }
  sub_23785B700();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237857300()
{
  return OUTLINED_FUNCTION_0_13();
}

uint64_t sub_237857320()
{
  sub_23785B700();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237857394()
{
  sub_23785B700();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237857404()
{
  OUTLINED_FUNCTION_1_20();
  sub_23785B700();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2378574F0()
{
  OUTLINED_FUNCTION_6_21();
  switch(v0)
  {
    case 1:
      OUTLINED_FUNCTION_7_15();
      break;
    case 2:
      OUTLINED_FUNCTION_5_22();
      break;
    case 3:
      OUTLINED_FUNCTION_4_23();
      break;
    case 4:
      OUTLINED_FUNCTION_11_16();
      break;
    default:
      break;
  }
  sub_23785B700();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237857620()
{
  OUTLINED_FUNCTION_1_20();
  sub_23785B700();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2378576C8()
{
  return sub_23785B700();
}

uint64_t sub_2378576DC()
{
  OUTLINED_FUNCTION_6_21();
  switch(v0)
  {
    case 2:
      OUTLINED_FUNCTION_7_15();
      break;
    case 5:
      OUTLINED_FUNCTION_4_23();
      break;
    case 6:
      OUTLINED_FUNCTION_5_22();
      break;
    case 7:
      OUTLINED_FUNCTION_11_16();
      break;
    default:
      break;
  }
  sub_23785B700();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2378577F4(uint64_t a1, uint64_t a2)
{
  return sub_2378578B0(a1, a2, (void (*)(uint64_t))sub_23780B99C);
}

uint64_t sub_23785780C()
{
  return sub_23785BEF0();
}

uint64_t sub_237857844()
{
  return sub_23785BEF0();
}

uint64_t sub_237857880(uint64_t a1, uint64_t a2)
{
  return sub_2378578B0(a1, a2, (void (*)(uint64_t))sub_23780CEB0);
}

uint64_t sub_237857898(uint64_t a1, uint64_t a2)
{
  return sub_2378578B0(a1, a2, (void (*)(uint64_t))sub_23780C870);
}

uint64_t sub_2378578B0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return sub_23785BEF0();
}

uint64_t sub_237857904()
{
  return sub_23785BEF0();
}

uint64_t sub_237857980()
{
  return sub_23785BEF0();
}

uint64_t sub_237857A00()
{
  return sub_23785BEF0();
}

uint64_t sub_237857A44()
{
  OUTLINED_FUNCTION_10_18();
  if (!v0) {
    OUTLINED_FUNCTION_8_14();
  }
  sub_23785B700();
  swift_bridgeObjectRelease();
  return sub_23785BEF0();
}

unint64_t AppNoun.init(rawValue:)(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

uint64_t sub_237857AD4()
{
  return sub_237857250();
}

uint64_t sub_237857AF0()
{
  return sub_237857A00();
}

unint64_t sub_237857B0C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = AppNoun.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id static AppNounResolutionResult.success(with:)(uint64_t a1)
{
  return sub_237856B08(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static AppNounResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_237856B08(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id AppNounResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id AppNounResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for AppNounResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for AppNounResolutionResult()
{
  return self;
}

id AppNounResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppNounResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_237857DCC()
{
  unint64_t result = qword_268928BB0;
  if (!qword_268928BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268928BB0);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppNoun()
{
  return &type metadata for AppNoun;
}

uint64_t OUTLINED_FUNCTION_0_13()
{
  return sub_23785BED0();
}

uint64_t OUTLINED_FUNCTION_2_21()
{
  return sub_23785B700();
}

uint64_t OUTLINED_FUNCTION_3_25()
{
  return sub_23785B700();
}

uint64_t OUTLINED_FUNCTION_10_18()
{
  return sub_23785BEC0();
}

id static ApplicationResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___ApplicationResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id static ApplicationResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_2378580A0();
    swift_bridgeObjectRetain();
    sub_23785BCB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_23785BE40();
    sub_2378580A0();
  }
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_2378580A0();
  id v2 = (void *)sub_23785B780();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___ApplicationResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

unint64_t sub_2378580A0()
{
  unint64_t result = qword_268928BB8;
  if (!qword_268928BB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268928BB8);
  }
  return result;
}

id static ApplicationResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___ApplicationResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

uint64_t static Application.supportsSecureCoding.getter()
{
  return 1;
}

id Application.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_21();
  if (v2)
  {
    id v3 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  objc_super v4 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    objc_super v5 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id Application.init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_21();
  if (v2)
  {
    id v3 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  objc_super v4 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    objc_super v5 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for Application();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

uint64_t type metadata accessor for Application()
{
  return self;
}

id Application.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id Application.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Application();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id Application.__deallocating_deinit()
{
  return sub_237858858(type metadata accessor for Application);
}

void static ApplicationResolutionResult.success(with:)()
{
}

void static ApplicationResolutionResult.disambiguation(with:)()
{
}

void static ApplicationResolutionResult.confirmationRequired(with:)()
{
}

id ApplicationResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id ApplicationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for ApplicationResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for ApplicationResolutionResult()
{
  return self;
}

id ApplicationResolutionResult.__deallocating_deinit()
{
  return sub_237858858(type metadata accessor for ApplicationResolutionResult);
}

id sub_237858858(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t OUTLINED_FUNCTION_0_14()
{
  return sub_23785BCA0();
}

uint64_t static InAppSearchCriteria.supportsSecureCoding.getter()
{
  return 1;
}

id InAppSearchCriteria.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_21();
  if (v2)
  {
    objc_super v3 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }
  id v4 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    id v5 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id InAppSearchCriteria.init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_21();
  if (v2)
  {
    objc_super v3 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }
  id v4 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    id v5 = (void *)sub_23785B6A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for InAppSearchCriteria();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

uint64_t type metadata accessor for InAppSearchCriteria()
{
  return self;
}

id InAppSearchCriteria.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id InAppSearchCriteria.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for InAppSearchCriteria();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id InAppSearchCriteria.__deallocating_deinit()
{
  return sub_2378591A0(type metadata accessor for InAppSearchCriteria);
}

id static InAppSearchCriteriaResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___InAppSearchCriteriaResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id static InAppSearchCriteriaResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_2378580A0();
    swift_bridgeObjectRetain();
    sub_23785BCB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_23785BE40();
    sub_2378580A0();
  }
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_2378580A0();
  id v2 = (void *)sub_23785B780();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___InAppSearchCriteriaResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id static InAppSearchCriteriaResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___InAppSearchCriteriaResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

void static InAppSearchCriteriaResolutionResult.success(with:)()
{
}

void static InAppSearchCriteriaResolutionResult.disambiguation(with:)()
{
}

void static InAppSearchCriteriaResolutionResult.confirmationRequired(with:)()
{
}

id InAppSearchCriteriaResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id InAppSearchCriteriaResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_23785B630();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for InAppSearchCriteriaResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for InAppSearchCriteriaResolutionResult()
{
  return self;
}

id InAppSearchCriteriaResolutionResult.__deallocating_deinit()
{
  return sub_2378591A0(type metadata accessor for InAppSearchCriteriaResolutionResult);
}

id sub_2378591A0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t OUTLINED_FUNCTION_0_15()
{
  return sub_23785BCA0();
}

uint64_t sub_237859200()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_237859210()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_237859220()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_237859230()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_237859240()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_237859250()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_237859260()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_237859270()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_237859280()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_237859290()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_2378592A0()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_2378592B0()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_2378592C0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_2378592D0()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_2378592E0()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_2378592F0()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_237859300()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_237859310()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_237859320()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_237859330()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_237859340()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_237859350()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_237859360()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_237859370()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_237859380()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_237859390()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2378593A0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_2378593B0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_2378593C0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_2378593D0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2378593E0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2378593F0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_237859400()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_237859410()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_237859420()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_237859430()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_237859440()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_237859450()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_237859460()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_237859470()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_237859480()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_237859490()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_2378594A0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_2378594B0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2378594C0()
{
  return MEMORY[0x270F52100]();
}

uint64_t sub_2378594D0()
{
  return MEMORY[0x270F52108]();
}

uint64_t sub_2378594E0()
{
  return MEMORY[0x270F52110]();
}

uint64_t sub_2378594F0()
{
  return MEMORY[0x270F52138]();
}

uint64_t sub_237859500()
{
  return MEMORY[0x270F52168]();
}

uint64_t sub_237859510()
{
  return MEMORY[0x270F523A0]();
}

uint64_t sub_237859520()
{
  return MEMORY[0x270F523A8]();
}

uint64_t sub_237859530()
{
  return MEMORY[0x270F52408]();
}

uint64_t sub_237859540()
{
  return MEMORY[0x270F52410]();
}

uint64_t sub_237859550()
{
  return MEMORY[0x270F52420]();
}

uint64_t sub_237859560()
{
  return MEMORY[0x270F52428]();
}

uint64_t sub_237859570()
{
  return MEMORY[0x270F524C0]();
}

uint64_t sub_237859580()
{
  return MEMORY[0x270F524C8]();
}

uint64_t sub_237859590()
{
  return MEMORY[0x270F524D0]();
}

uint64_t sub_2378595A0()
{
  return MEMORY[0x270F524D8]();
}

uint64_t sub_2378595B0()
{
  return MEMORY[0x270F524E0]();
}

uint64_t sub_2378595C0()
{
  return MEMORY[0x270F52500]();
}

uint64_t sub_2378595D0()
{
  return MEMORY[0x270F52508]();
}

uint64_t sub_2378595E0()
{
  return MEMORY[0x270F52510]();
}

uint64_t sub_2378595F0()
{
  return MEMORY[0x270F52518]();
}

uint64_t sub_237859600()
{
  return MEMORY[0x270F52520]();
}

uint64_t sub_237859610()
{
  return MEMORY[0x270F52530]();
}

uint64_t sub_237859620()
{
  return MEMORY[0x270F52538]();
}

uint64_t sub_237859630()
{
  return MEMORY[0x270F52560]();
}

uint64_t sub_237859640()
{
  return MEMORY[0x270F52568]();
}

uint64_t sub_237859650()
{
  return MEMORY[0x270F52570]();
}

uint64_t sub_237859660()
{
  return MEMORY[0x270F52578]();
}

uint64_t sub_237859670()
{
  return MEMORY[0x270F52580]();
}

uint64_t sub_237859680()
{
  return MEMORY[0x270F52588]();
}

uint64_t sub_237859690()
{
  return MEMORY[0x270F52590]();
}

uint64_t sub_2378596A0()
{
  return MEMORY[0x270F52598]();
}

uint64_t sub_2378596B0()
{
  return MEMORY[0x270F525A0]();
}

uint64_t sub_2378596C0()
{
  return MEMORY[0x270F525A8]();
}

uint64_t sub_2378596D0()
{
  return MEMORY[0x270F525B0]();
}

uint64_t sub_2378596E0()
{
  return MEMORY[0x270F525D0]();
}

uint64_t sub_2378596F0()
{
  return MEMORY[0x270F525E8]();
}

uint64_t sub_237859700()
{
  return MEMORY[0x270F525F0]();
}

uint64_t sub_237859710()
{
  return MEMORY[0x270F525F8]();
}

uint64_t sub_237859720()
{
  return MEMORY[0x270F52600]();
}

uint64_t sub_237859730()
{
  return MEMORY[0x270F52608]();
}

uint64_t sub_237859740()
{
  return MEMORY[0x270F52610]();
}

uint64_t sub_237859750()
{
  return MEMORY[0x270F52618]();
}

uint64_t sub_237859760()
{
  return MEMORY[0x270F52620]();
}

uint64_t sub_237859770()
{
  return MEMORY[0x270F52628]();
}

uint64_t sub_237859780()
{
  return MEMORY[0x270F52650]();
}

uint64_t sub_237859790()
{
  return MEMORY[0x270F52658]();
}

uint64_t sub_2378597A0()
{
  return MEMORY[0x270F52660]();
}

uint64_t sub_2378597B0()
{
  return MEMORY[0x270F52690]();
}

uint64_t sub_2378597C0()
{
  return MEMORY[0x270F52698]();
}

uint64_t sub_2378597D0()
{
  return MEMORY[0x270F526A0]();
}

uint64_t sub_2378597E0()
{
  return MEMORY[0x270F526F0]();
}

uint64_t sub_2378597F0()
{
  return MEMORY[0x270F526F8]();
}

uint64_t sub_237859800()
{
  return MEMORY[0x270F52700]();
}

uint64_t sub_237859810()
{
  return MEMORY[0x270F52708]();
}

uint64_t sub_237859820()
{
  return MEMORY[0x270F52710]();
}

uint64_t sub_237859830()
{
  return MEMORY[0x270F52718]();
}

uint64_t sub_237859840()
{
  return MEMORY[0x270F52720]();
}

uint64_t sub_237859850()
{
  return MEMORY[0x270F52788]();
}

uint64_t sub_237859860()
{
  return MEMORY[0x270F52790]();
}

uint64_t sub_237859870()
{
  return MEMORY[0x270F52A68]();
}

uint64_t sub_237859880()
{
  return MEMORY[0x270F52A70]();
}

uint64_t sub_237859890()
{
  return MEMORY[0x270F52C38]();
}

uint64_t sub_2378598A0()
{
  return MEMORY[0x270F52C40]();
}

uint64_t sub_2378598B0()
{
  return MEMORY[0x270F52C48]();
}

uint64_t sub_2378598C0()
{
  return MEMORY[0x270F52C50]();
}

uint64_t sub_2378598D0()
{
  return MEMORY[0x270F52C58]();
}

uint64_t sub_2378598E0()
{
  return MEMORY[0x270F52C60]();
}

uint64_t sub_2378598F0()
{
  return MEMORY[0x270F52C68]();
}

uint64_t sub_237859900()
{
  return MEMORY[0x270F52C90]();
}

uint64_t sub_237859910()
{
  return MEMORY[0x270F52C98]();
}

uint64_t sub_237859920()
{
  return MEMORY[0x270F52E38]();
}

uint64_t sub_237859930()
{
  return MEMORY[0x270F52E48]();
}

uint64_t sub_237859940()
{
  return MEMORY[0x270F52ED8]();
}

uint64_t sub_237859950()
{
  return MEMORY[0x270F52EE0]();
}

uint64_t sub_237859960()
{
  return MEMORY[0x270F739D8]();
}

uint64_t sub_237859970()
{
  return MEMORY[0x270F73A60]();
}

uint64_t sub_237859980()
{
  return MEMORY[0x270F73A80]();
}

uint64_t sub_237859990()
{
  return MEMORY[0x270F74128]();
}

uint64_t sub_2378599A0()
{
  return MEMORY[0x270F74148]();
}

uint64_t sub_2378599B0()
{
  return MEMORY[0x270F755B8]();
}

uint64_t sub_2378599C0()
{
  return MEMORY[0x270F755D0]();
}

uint64_t sub_2378599D0()
{
  return MEMORY[0x270F756A0]();
}

uint64_t sub_2378599F0()
{
  return MEMORY[0x270F756B0]();
}

uint64_t sub_237859A00()
{
  return MEMORY[0x270F756B8]();
}

uint64_t sub_237859A10()
{
  return MEMORY[0x270F756C0]();
}

uint64_t sub_237859A20()
{
  return MEMORY[0x270F756C8]();
}

uint64_t sub_237859A50()
{
  return MEMORY[0x270F66328]();
}

uint64_t sub_237859A70()
{
  return MEMORY[0x270F66360]();
}

uint64_t sub_237859AC0()
{
  return MEMORY[0x270F663D8]();
}

uint64_t sub_237859AD0()
{
  return MEMORY[0x270F663E0]();
}

uint64_t sub_237859B60()
{
  return MEMORY[0x270F664B8]();
}

uint64_t sub_237859B70()
{
  return MEMORY[0x270F664C0]();
}

uint64_t sub_237859B90()
{
  return MEMORY[0x270F665F8]();
}

uint64_t sub_237859BA0()
{
  return MEMORY[0x270F66618]();
}

uint64_t sub_237859BB0()
{
  return MEMORY[0x270F66620]();
}

uint64_t sub_237859C30()
{
  return MEMORY[0x270F66710]();
}

uint64_t sub_237859C40()
{
  return MEMORY[0x270F66730]();
}

uint64_t sub_237859C70()
{
  return MEMORY[0x270F66768]();
}

uint64_t sub_237859C80()
{
  return MEMORY[0x270F66770]();
}

uint64_t sub_237859CA0()
{
  return MEMORY[0x270F668B8]();
}

uint64_t sub_237859CB0()
{
  return MEMORY[0x270F66988]();
}

uint64_t sub_237859CC0()
{
  return MEMORY[0x270F669B0]();
}

uint64_t sub_237859CD0()
{
  return MEMORY[0x270F66A60]();
}

uint64_t sub_237859CE0()
{
  return MEMORY[0x270F66A68]();
}

uint64_t sub_237859CF0()
{
  return MEMORY[0x270F66A88]();
}

uint64_t sub_237859D00()
{
  return MEMORY[0x270F66A98]();
}

uint64_t sub_237859D10()
{
  return MEMORY[0x270F66AE0]();
}

uint64_t sub_237859D20()
{
  return MEMORY[0x270F66AF8]();
}

uint64_t sub_237859D30()
{
  return MEMORY[0x270F66B10]();
}

uint64_t sub_237859D40()
{
  return MEMORY[0x270F66B40]();
}

uint64_t sub_237859D50()
{
  return MEMORY[0x270F66B48]();
}

uint64_t sub_237859D60()
{
  return MEMORY[0x270F66B50]();
}

uint64_t sub_237859D70()
{
  return MEMORY[0x270F66B58]();
}

uint64_t sub_237859D80()
{
  return MEMORY[0x270F66B68]();
}

uint64_t sub_237859D90()
{
  return MEMORY[0x270F66B78]();
}

uint64_t sub_237859DA0()
{
  return MEMORY[0x270F66B90]();
}

uint64_t sub_237859DB0()
{
  return MEMORY[0x270F66BA0]();
}

uint64_t sub_237859DC0()
{
  return MEMORY[0x270F66C48]();
}

uint64_t sub_237859DD0()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_237859DE0()
{
  return MEMORY[0x270F66CB0]();
}

uint64_t sub_237859DF0()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_237859E00()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_237859E20()
{
  return MEMORY[0x270F66CE8]();
}

uint64_t sub_237859E30()
{
  return MEMORY[0x270F66CF8]();
}

uint64_t sub_237859E40()
{
  return MEMORY[0x270F66D18]();
}

uint64_t sub_237859E50()
{
  return MEMORY[0x270F66D20]();
}

uint64_t sub_237859E60()
{
  return MEMORY[0x270F66D28]();
}

uint64_t sub_237859E70()
{
  return MEMORY[0x270F66D60]();
}

uint64_t sub_237859E80()
{
  return MEMORY[0x270F66DA0]();
}

uint64_t sub_237859E90()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_237859EA0()
{
  return MEMORY[0x270F66DC8]();
}

uint64_t sub_237859EB0()
{
  return MEMORY[0x270F66DD0]();
}

uint64_t sub_237859EC0()
{
  return MEMORY[0x270F66F10]();
}

uint64_t sub_237859ED0()
{
  return MEMORY[0x270F66F18]();
}

uint64_t sub_237859EE0()
{
  return MEMORY[0x270F66F28]();
}

uint64_t sub_237859EF0()
{
  return MEMORY[0x270F67058]();
}

uint64_t sub_237859F00()
{
  return MEMORY[0x270F67060]();
}

uint64_t sub_237859F10()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_237859F20()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_237859F30()
{
  return MEMORY[0x270F671A0]();
}

uint64_t sub_237859F40()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_237859F50()
{
  return MEMORY[0x270F671D8]();
}

uint64_t sub_237859F60()
{
  return MEMORY[0x270F671E8]();
}

uint64_t sub_237859F70()
{
  return MEMORY[0x270F67208]();
}

uint64_t sub_237859F80()
{
  return MEMORY[0x270F67210]();
}

uint64_t sub_237859F90()
{
  return MEMORY[0x270F67218]();
}

uint64_t sub_237859FA0()
{
  return MEMORY[0x270F67220]();
}

uint64_t sub_237859FB0()
{
  return MEMORY[0x270F67228]();
}

uint64_t sub_237859FC0()
{
  return MEMORY[0x270F67230]();
}

uint64_t sub_237859FD0()
{
  return MEMORY[0x270F67238]();
}

uint64_t sub_237859FE0()
{
  return MEMORY[0x270F67240]();
}

uint64_t sub_237859FF0()
{
  return MEMORY[0x270F672E8]();
}

uint64_t sub_23785A000()
{
  return MEMORY[0x270F67300]();
}

uint64_t sub_23785A010()
{
  return MEMORY[0x270F67330]();
}

uint64_t sub_23785A020()
{
  return MEMORY[0x270F67340]();
}

uint64_t sub_23785A030()
{
  return MEMORY[0x270F67348]();
}

uint64_t sub_23785A040()
{
  return MEMORY[0x270F67350]();
}

uint64_t sub_23785A050()
{
  return MEMORY[0x270F67358]();
}

uint64_t sub_23785A060()
{
  return MEMORY[0x270F67360]();
}

uint64_t sub_23785A070()
{
  return MEMORY[0x270F67430]();
}

uint64_t sub_23785A080()
{
  return MEMORY[0x270F674B0]();
}

uint64_t sub_23785A090()
{
  return MEMORY[0x270F674C8]();
}

uint64_t sub_23785A0A0()
{
  return MEMORY[0x270F674D0]();
}

uint64_t sub_23785A0B0()
{
  return MEMORY[0x270F674E0]();
}

uint64_t sub_23785A0C0()
{
  return MEMORY[0x270F674F8]();
}

uint64_t sub_23785A0D0()
{
  return MEMORY[0x270F67500]();
}

uint64_t sub_23785A0E0()
{
  return MEMORY[0x270F67508]();
}

uint64_t sub_23785A0F0()
{
  return MEMORY[0x270F67510]();
}

uint64_t sub_23785A120()
{
  return MEMORY[0x270F67600]();
}

uint64_t sub_23785A140()
{
  return MEMORY[0x270F67660]();
}

uint64_t sub_23785A160()
{
  return MEMORY[0x270F676E0]();
}

uint64_t sub_23785A170()
{
  return MEMORY[0x270F676F0]();
}

uint64_t sub_23785A180()
{
  return MEMORY[0x270F67718]();
}

uint64_t sub_23785A190()
{
  return MEMORY[0x270F67720]();
}

uint64_t sub_23785A1A0()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_23785A1B0()
{
  return MEMORY[0x270F67748]();
}

uint64_t sub_23785A1C0()
{
  return MEMORY[0x270F67768]();
}

uint64_t sub_23785A1D0()
{
  return MEMORY[0x270F67770]();
}

uint64_t sub_23785A1E0()
{
  return MEMORY[0x270F67778]();
}

uint64_t sub_23785A1F0()
{
  return MEMORY[0x270F67790]();
}

uint64_t sub_23785A200()
{
  return MEMORY[0x270F67798]();
}

uint64_t sub_23785A210()
{
  return MEMORY[0x270F677A0]();
}

uint64_t sub_23785A220()
{
  return MEMORY[0x270F677B0]();
}

uint64_t sub_23785A230()
{
  return MEMORY[0x270F677C0]();
}

uint64_t sub_23785A240()
{
  return MEMORY[0x270F677D8]();
}

uint64_t sub_23785A250()
{
  return MEMORY[0x270F677F0]();
}

uint64_t sub_23785A260()
{
  return MEMORY[0x270F67800]();
}

uint64_t sub_23785A270()
{
  return MEMORY[0x270F67820]();
}

uint64_t sub_23785A280()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_23785A290()
{
  return MEMORY[0x270F67838]();
}

uint64_t sub_23785A2A0()
{
  return MEMORY[0x270F67888]();
}

uint64_t sub_23785A2B0()
{
  return MEMORY[0x270F67890]();
}

uint64_t sub_23785A2C0()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_23785A2E0()
{
  return MEMORY[0x270F67A78]();
}

uint64_t sub_23785A330()
{
  return MEMORY[0x270F67B00]();
}

uint64_t sub_23785A340()
{
  return MEMORY[0x270F67B18]();
}

uint64_t sub_23785A350()
{
  return MEMORY[0x270F67B68]();
}

uint64_t sub_23785A360()
{
  return MEMORY[0x270F67B98]();
}

uint64_t sub_23785A370()
{
  return MEMORY[0x270F67BA0]();
}

uint64_t sub_23785A380()
{
  return MEMORY[0x270F67BC0]();
}

uint64_t sub_23785A390()
{
  return MEMORY[0x270F67BE8]();
}

uint64_t sub_23785A3C0()
{
  return MEMORY[0x270F67C78]();
}

uint64_t sub_23785A3D0()
{
  return MEMORY[0x270F67C80]();
}

uint64_t sub_23785A3E0()
{
  return MEMORY[0x270F67CA8]();
}

uint64_t sub_23785A400()
{
  return MEMORY[0x270F67CD8]();
}

uint64_t sub_23785A420()
{
  return MEMORY[0x270F67D28]();
}

uint64_t sub_23785A430()
{
  return MEMORY[0x270F67D40]();
}

uint64_t sub_23785A440()
{
  return MEMORY[0x270F67D58]();
}

uint64_t sub_23785A450()
{
  return MEMORY[0x270F67D70]();
}

uint64_t sub_23785A460()
{
  return MEMORY[0x270F67E40]();
}

uint64_t sub_23785A470()
{
  return MEMORY[0x270F67E68]();
}

uint64_t sub_23785A480()
{
  return MEMORY[0x270F67E80]();
}

uint64_t sub_23785A490()
{
  return MEMORY[0x270F67E90]();
}

uint64_t sub_23785A4A0()
{
  return MEMORY[0x270F67EA0]();
}

uint64_t sub_23785A4B0()
{
  return MEMORY[0x270F67EC0]();
}

uint64_t sub_23785A4C0()
{
  return MEMORY[0x270F67ED0]();
}

uint64_t sub_23785A4D0()
{
  return MEMORY[0x270F67F08]();
}

uint64_t sub_23785A4E0()
{
  return MEMORY[0x270F67F18]();
}

uint64_t sub_23785A4F0()
{
  return MEMORY[0x270F67F68]();
}

uint64_t sub_23785A500()
{
  return MEMORY[0x270F67F70]();
}

uint64_t sub_23785A510()
{
  return MEMORY[0x270F67F78]();
}

uint64_t sub_23785A520()
{
  return MEMORY[0x270F67FB8]();
}

uint64_t sub_23785A530()
{
  return MEMORY[0x270F67FC0]();
}

uint64_t sub_23785A540()
{
  return MEMORY[0x270F67FC8]();
}

uint64_t sub_23785A550()
{
  return MEMORY[0x270F680D8]();
}

uint64_t sub_23785A560()
{
  return MEMORY[0x270F68160]();
}

uint64_t sub_23785A590()
{
  return MEMORY[0x270F681B0]();
}

uint64_t sub_23785A5A0()
{
  return MEMORY[0x270F681B8]();
}

uint64_t sub_23785A5B0()
{
  return MEMORY[0x270F68220]();
}

uint64_t sub_23785A5C0()
{
  return MEMORY[0x270F68228]();
}

uint64_t sub_23785A5D0()
{
  return MEMORY[0x270F68230]();
}

uint64_t sub_23785A5E0()
{
  return MEMORY[0x270F68240]();
}

uint64_t sub_23785A5F0()
{
  return MEMORY[0x270F68248]();
}

uint64_t sub_23785A600()
{
  return MEMORY[0x270F68250]();
}

uint64_t sub_23785A610()
{
  return MEMORY[0x270F68258]();
}

uint64_t sub_23785A620()
{
  return MEMORY[0x270F68260]();
}

uint64_t sub_23785A630()
{
  return MEMORY[0x270F68268]();
}

uint64_t sub_23785A640()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_23785A650()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_23785A660()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_23785A670()
{
  return MEMORY[0x270F68380]();
}

uint64_t sub_23785A680()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_23785A690()
{
  return MEMORY[0x270F683A0]();
}

uint64_t sub_23785A6A0()
{
  return MEMORY[0x270F683A8]();
}

uint64_t sub_23785A6B0()
{
  return MEMORY[0x270F683B8]();
}

uint64_t sub_23785A6C0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_23785A6D0()
{
  return MEMORY[0x270F6A2D0]();
}

uint64_t sub_23785A6E0()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_23785A6F0()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_23785A700()
{
  return MEMORY[0x270F6A4A0]();
}

uint64_t sub_23785A710()
{
  return MEMORY[0x270F6A4F0]();
}

uint64_t sub_23785A720()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_23785A730()
{
  return MEMORY[0x270F6A718]();
}

uint64_t sub_23785A740()
{
  return MEMORY[0x270F6A720]();
}

uint64_t sub_23785A750()
{
  return MEMORY[0x270F6A728]();
}

uint64_t sub_23785A760()
{
  return MEMORY[0x270F6A768]();
}

uint64_t sub_23785A770()
{
  return MEMORY[0x270F6A770]();
}

uint64_t sub_23785A780()
{
  return MEMORY[0x270F6A788]();
}

uint64_t sub_23785A790()
{
  return MEMORY[0x270F6A7B8]();
}

uint64_t sub_23785A7A0()
{
  return MEMORY[0x270F6A7E8]();
}

uint64_t sub_23785A7B0()
{
  return MEMORY[0x270F6A860]();
}

uint64_t sub_23785A7C0()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_23785A7D0()
{
  return MEMORY[0x270F6AA80]();
}

uint64_t sub_23785A7E0()
{
  return MEMORY[0x270F6AA90]();
}

uint64_t sub_23785A7F0()
{
  return MEMORY[0x270F6AA98]();
}

uint64_t sub_23785A800()
{
  return MEMORY[0x270F6AAB8]();
}

uint64_t sub_23785A810()
{
  return MEMORY[0x270F6AAC0]();
}

uint64_t sub_23785A820()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_23785A830()
{
  return MEMORY[0x270F6AC88]();
}

uint64_t sub_23785A840()
{
  return MEMORY[0x270F6ACA0]();
}

uint64_t sub_23785A850()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t sub_23785A860()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_23785A870()
{
  return MEMORY[0x270F6ADB0]();
}

uint64_t sub_23785A880()
{
  return MEMORY[0x270F6ADC0]();
}

uint64_t sub_23785A890()
{
  return MEMORY[0x270F6AF68]();
}

uint64_t sub_23785A8A0()
{
  return MEMORY[0x270F6AF70]();
}

uint64_t sub_23785A8B0()
{
  return MEMORY[0x270F6AF78]();
}

uint64_t sub_23785A8C0()
{
  return MEMORY[0x270F6BAF8]();
}

uint64_t sub_23785A8D0()
{
  return MEMORY[0x270F6BB00]();
}

uint64_t sub_23785A8E0()
{
  return MEMORY[0x270F6BB18]();
}

uint64_t sub_23785A8F0()
{
  return MEMORY[0x270F6BB38]();
}

uint64_t sub_23785A910()
{
  return MEMORY[0x270F6BFA0]();
}

uint64_t sub_23785A920()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_23785A930()
{
  return MEMORY[0x270F6BFE8]();
}

uint64_t sub_23785A940()
{
  return MEMORY[0x270F6C0A0]();
}

uint64_t sub_23785A950()
{
  return MEMORY[0x270F6C0A8]();
}

uint64_t sub_23785A960()
{
  return MEMORY[0x270F6C108]();
}

uint64_t sub_23785A970()
{
  return MEMORY[0x270F6C110]();
}

uint64_t sub_23785A980()
{
  return MEMORY[0x270F6C190]();
}

uint64_t sub_23785A990()
{
  return MEMORY[0x270F6C198]();
}

uint64_t sub_23785A9A0()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_23785A9B0()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_23785A9C0()
{
  return MEMORY[0x270F6C8A0]();
}

uint64_t sub_23785A9D0()
{
  return MEMORY[0x270F6C8C0]();
}

uint64_t sub_23785A9E0()
{
  return MEMORY[0x270F6C8D0]();
}

uint64_t sub_23785A9F0()
{
  return MEMORY[0x270F6C8E8]();
}

uint64_t sub_23785AA00()
{
  return MEMORY[0x270F6C8F0]();
}

uint64_t sub_23785AA10()
{
  return MEMORY[0x270F6C8F8]();
}

uint64_t sub_23785AA20()
{
  return MEMORY[0x270F6C918]();
}

uint64_t sub_23785AA30()
{
  return MEMORY[0x270F6C938]();
}

uint64_t sub_23785AA40()
{
  return MEMORY[0x270F6C940]();
}

uint64_t sub_23785AA50()
{
  return MEMORY[0x270F6C970]();
}

uint64_t sub_23785AA60()
{
  return MEMORY[0x270F6C980]();
}

uint64_t sub_23785AA70()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_23785AA80()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_23785AA90()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_23785AAA0()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_23785AAB0()
{
  return MEMORY[0x270F6CA28]();
}

uint64_t sub_23785AAF0()
{
  return MEMORY[0x270F6CCA0]();
}

uint64_t sub_23785AB00()
{
  return MEMORY[0x270F6CCB0]();
}

uint64_t sub_23785AB10()
{
  return MEMORY[0x270F6CCD8]();
}

uint64_t sub_23785AB20()
{
  return MEMORY[0x270F6CD28]();
}

uint64_t sub_23785AB30()
{
  return MEMORY[0x270F6CD38]();
}

uint64_t sub_23785AB40()
{
  return MEMORY[0x270F6CD40]();
}

uint64_t sub_23785AB50()
{
  return MEMORY[0x270F6CD48]();
}

uint64_t sub_23785AB60()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t sub_23785AB70()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t sub_23785AB80()
{
  return MEMORY[0x270F6CE38]();
}

uint64_t sub_23785AB90()
{
  return MEMORY[0x270F6CE40]();
}

uint64_t sub_23785ABA0()
{
  return MEMORY[0x270F6CE90]();
}

uint64_t sub_23785ABB0()
{
  return MEMORY[0x270F6CEB8]();
}

uint64_t sub_23785ABC0()
{
  return MEMORY[0x270F6CEF0]();
}

uint64_t sub_23785ABD0()
{
  return MEMORY[0x270F6D0C0]();
}

uint64_t sub_23785ABE0()
{
  return MEMORY[0x270F6D0C8]();
}

uint64_t sub_23785ABF0()
{
  return MEMORY[0x270F6D0D0]();
}

uint64_t sub_23785AC00()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_23785AC10()
{
  return MEMORY[0x270F6D208]();
}

uint64_t sub_23785AC20()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_23785AC30()
{
  return MEMORY[0x270F6D328]();
}

uint64_t sub_23785AC40()
{
  return MEMORY[0x270F6D338]();
}

uint64_t sub_23785AC50()
{
  return MEMORY[0x270F6D348]();
}

uint64_t sub_23785AC60()
{
  return MEMORY[0x270F6D350]();
}

uint64_t sub_23785AC70()
{
  return MEMORY[0x270F6D3E8]();
}

uint64_t sub_23785AC80()
{
  return MEMORY[0x270F6D400]();
}

uint64_t sub_23785AC90()
{
  return MEMORY[0x270F6D488]();
}

uint64_t sub_23785ACA0()
{
  return MEMORY[0x270F6D4A0]();
}

uint64_t sub_23785ACB0()
{
  return MEMORY[0x270F6D4B0]();
}

uint64_t sub_23785ACC0()
{
  return MEMORY[0x270F6D4E0]();
}

uint64_t sub_23785ACD0()
{
  return MEMORY[0x270F6D508]();
}

uint64_t sub_23785ACE0()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_23785ACF0()
{
  return MEMORY[0x270F6D518]();
}

uint64_t sub_23785AD00()
{
  return MEMORY[0x270F6D520]();
}

uint64_t sub_23785AD10()
{
  return MEMORY[0x270F6D530]();
}

uint64_t sub_23785AD20()
{
  return MEMORY[0x270F6D538]();
}

uint64_t sub_23785AD30()
{
  return MEMORY[0x270F6D5B8]();
}

uint64_t sub_23785AD40()
{
  return MEMORY[0x270F6D5C0]();
}

uint64_t sub_23785AD50()
{
  return MEMORY[0x270F6D630]();
}

uint64_t sub_23785AD80()
{
  return MEMORY[0x270F6D800]();
}

uint64_t sub_23785AD90()
{
  return MEMORY[0x270F6D840]();
}

uint64_t sub_23785ADA0()
{
  return MEMORY[0x270F6D848]();
}

uint64_t sub_23785ADB0()
{
  return MEMORY[0x270F6DA48]();
}

uint64_t sub_23785ADC0()
{
  return MEMORY[0x270F6DB88]();
}

uint64_t sub_23785ADD0()
{
  return MEMORY[0x270F6DB90]();
}

uint64_t sub_23785ADE0()
{
  return MEMORY[0x270F6DCA8]();
}

uint64_t sub_23785ADF0()
{
  return MEMORY[0x270F6DCB8]();
}

uint64_t sub_23785AE00()
{
  return MEMORY[0x270F6DCD8]();
}

uint64_t sub_23785AE10()
{
  return MEMORY[0x270F6DCE0]();
}

uint64_t sub_23785AE20()
{
  return MEMORY[0x270F6DF08]();
}

uint64_t sub_23785AE30()
{
  return MEMORY[0x270F6DF10]();
}

uint64_t sub_23785AE50()
{
  return MEMORY[0x270F6E168]();
}

uint64_t sub_23785AE60()
{
  return MEMORY[0x270F6E3E0]();
}

uint64_t sub_23785AE70()
{
  return MEMORY[0x270F6E410]();
}

uint64_t sub_23785AE80()
{
  return MEMORY[0x270F6E420]();
}

uint64_t sub_23785AE90()
{
  return MEMORY[0x270F6E758]();
}

uint64_t sub_23785AEA0()
{
  return MEMORY[0x270F6EDB0]();
}

uint64_t sub_23785AEB0()
{
  return MEMORY[0x270F6EDB8]();
}

uint64_t sub_23785AEC0()
{
  return MEMORY[0x270F6F340]();
}

uint64_t sub_23785AED0()
{
  return MEMORY[0x270F6F348]();
}

uint64_t sub_23785AEE0()
{
  return MEMORY[0x270F6F358]();
}

uint64_t sub_23785AEF0()
{
  return MEMORY[0x270F6F408]();
}

uint64_t sub_23785AF00()
{
  return MEMORY[0x270F6F460]();
}

uint64_t sub_23785AF10()
{
  return MEMORY[0x270F6F478]();
}

uint64_t sub_23785AF20()
{
  return MEMORY[0x270F6F488]();
}

uint64_t sub_23785AF30()
{
  return MEMORY[0x270F6F4A8]();
}

uint64_t sub_23785AF40()
{
  return MEMORY[0x270F70B20]();
}

uint64_t sub_23785AF50()
{
  return MEMORY[0x270F70B38]();
}

uint64_t sub_23785AF60()
{
  return MEMORY[0x270F70B50]();
}

uint64_t sub_23785AF70()
{
  return MEMORY[0x270F70B58]();
}

uint64_t sub_23785AF80()
{
  return MEMORY[0x270F70BF0]();
}

uint64_t sub_23785AF90()
{
  return MEMORY[0x270F70C00]();
}

uint64_t sub_23785AFA0()
{
  return MEMORY[0x270F70C18]();
}

uint64_t sub_23785AFB0()
{
  return MEMORY[0x270F70C60]();
}

uint64_t sub_23785AFC0()
{
  return MEMORY[0x270F70C80]();
}

uint64_t sub_23785AFD0()
{
  return MEMORY[0x270F70C88]();
}

uint64_t sub_23785AFE0()
{
  return MEMORY[0x270F70CE8]();
}

uint64_t sub_23785AFF0()
{
  return MEMORY[0x270F70CF0]();
}

uint64_t sub_23785B000()
{
  return MEMORY[0x270F70D08]();
}

uint64_t sub_23785B010()
{
  return MEMORY[0x270F70D10]();
}

uint64_t sub_23785B020()
{
  return MEMORY[0x270F70DB0]();
}

uint64_t sub_23785B030()
{
  return MEMORY[0x270F70DC8]();
}

uint64_t sub_23785B040()
{
  return MEMORY[0x270F70DD0]();
}

uint64_t sub_23785B050()
{
  return MEMORY[0x270F728F0]();
}

uint64_t sub_23785B060()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_23785B070()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_23785B080()
{
  return MEMORY[0x270F72A20]();
}

uint64_t sub_23785B090()
{
  return MEMORY[0x270F72AA0]();
}

uint64_t sub_23785B0B0()
{
  return MEMORY[0x270F64E98]();
}

uint64_t sub_23785B0C0()
{
  return MEMORY[0x270F64EA0]();
}

uint64_t sub_23785B0D0()
{
  return MEMORY[0x270F64EA8]();
}

uint64_t sub_23785B0E0()
{
  return MEMORY[0x270F64EC0]();
}

uint64_t sub_23785B0F0()
{
  return MEMORY[0x270F64EC8]();
}

uint64_t sub_23785B100()
{
  return MEMORY[0x270F64FA0]();
}

uint64_t sub_23785B110()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_23785B130()
{
  return MEMORY[0x270F65150]();
}

uint64_t sub_23785B140()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_23785B150()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_23785B160()
{
  return MEMORY[0x270F63AD8]();
}

uint64_t sub_23785B170()
{
  return MEMORY[0x270F63B10]();
}

uint64_t sub_23785B180()
{
  return MEMORY[0x270F652C8]();
}

uint64_t sub_23785B190()
{
  return MEMORY[0x270F653C8]();
}

uint64_t sub_23785B1A0()
{
  return MEMORY[0x270F66030]();
}

uint64_t sub_23785B1B0()
{
  return MEMORY[0x270F66038]();
}

uint64_t sub_23785B1C0()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_23785B1D0()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_23785B1E0()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_23785B1F0()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_23785B200()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t sub_23785B210()
{
  return MEMORY[0x270F66050]();
}

uint64_t sub_23785B220()
{
  return MEMORY[0x270F660A0]();
}

uint64_t sub_23785B230()
{
  return MEMORY[0x270F660C0]();
}

uint64_t sub_23785B240()
{
  return MEMORY[0x270F706D0]();
}

uint64_t sub_23785B250()
{
  return MEMORY[0x270F706F0]();
}

uint64_t sub_23785B260()
{
  return MEMORY[0x270F706F8]();
}

uint64_t sub_23785B270()
{
  return MEMORY[0x270F72DE8]();
}

uint64_t sub_23785B280()
{
  return MEMORY[0x270F72DF0]();
}

uint64_t sub_23785B290()
{
  return MEMORY[0x270F72DF8]();
}

uint64_t sub_23785B2A0()
{
  return MEMORY[0x270F72E50]();
}

uint64_t sub_23785B2B0()
{
  return MEMORY[0x270F72E58]();
}

uint64_t sub_23785B2C0()
{
  return MEMORY[0x270F72E68]();
}

uint64_t sub_23785B2D0()
{
  return MEMORY[0x270F72E70]();
}

uint64_t sub_23785B2E0()
{
  return MEMORY[0x270F72E78]();
}

uint64_t sub_23785B2F0()
{
  return MEMORY[0x270F72E80]();
}

uint64_t sub_23785B300()
{
  return MEMORY[0x270F72E90]();
}

uint64_t sub_23785B310()
{
  return MEMORY[0x270F72E98]();
}

uint64_t sub_23785B320()
{
  return MEMORY[0x270F72EA0]();
}

uint64_t sub_23785B330()
{
  return MEMORY[0x270F72EA8]();
}

uint64_t sub_23785B340()
{
  return MEMORY[0x270F72EB0]();
}

uint64_t sub_23785B360()
{
  return MEMORY[0x270F72EF8]();
}

uint64_t sub_23785B370()
{
  return MEMORY[0x270F72F00]();
}

uint64_t sub_23785B380()
{
  return MEMORY[0x270F72F10]();
}

uint64_t sub_23785B390()
{
  return MEMORY[0x270F72F20]();
}

uint64_t sub_23785B3A0()
{
  return MEMORY[0x270F72F28]();
}

uint64_t sub_23785B3B0()
{
  return MEMORY[0x270F72F50]();
}

uint64_t sub_23785B3C0()
{
  return MEMORY[0x270F72F98]();
}

uint64_t sub_23785B3D0()
{
  return MEMORY[0x270F72FA0]();
}

uint64_t sub_23785B3E0()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_23785B3F0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_23785B400()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_23785B410()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_23785B420()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_23785B430()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_23785B440()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_23785B450()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_23785B460()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_23785B470()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_23785B480()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_23785B490()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23785B4A0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23785B4B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23785B4C0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_23785B4D0()
{
  return MEMORY[0x270F70750]();
}

uint64_t sub_23785B4E0()
{
  return MEMORY[0x270F70760]();
}

uint64_t sub_23785B4F0()
{
  return MEMORY[0x270F70768]();
}

uint64_t sub_23785B500()
{
  return MEMORY[0x270F707C0]();
}

uint64_t sub_23785B510()
{
  return MEMORY[0x270F707E0]();
}

uint64_t sub_23785B520()
{
  return MEMORY[0x270F70808]();
}

uint64_t sub_23785B530()
{
  return MEMORY[0x270F70820]();
}

uint64_t sub_23785B540()
{
  return MEMORY[0x270F709C0]();
}

uint64_t sub_23785B550()
{
  return MEMORY[0x270F70A30]();
}

uint64_t sub_23785B560()
{
  return MEMORY[0x270F70A78]();
}

uint64_t sub_23785B570()
{
  return MEMORY[0x270F70A80]();
}

uint64_t sub_23785B580()
{
  return MEMORY[0x270F70A90]();
}

uint64_t sub_23785B590()
{
  return MEMORY[0x270F70AA0]();
}

uint64_t sub_23785B5A0()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_23785B5B0()
{
  return MEMORY[0x270F70AD0]();
}

uint64_t sub_23785B5C0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23785B5D0()
{
  return MEMORY[0x270FA09C0]();
}

uint64_t sub_23785B5E0()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_23785B5F0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23785B600()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_23785B610()
{
  return MEMORY[0x270FA0A40]();
}

uint64_t sub_23785B620()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23785B630()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23785B640()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23785B650()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_23785B660()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_23785B670()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_23785B680()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_23785B690()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23785B6A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23785B6B0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23785B6C0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_23785B6D0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23785B6E0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_23785B6F0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_23785B700()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23785B710()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_23785B720()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23785B730()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23785B740()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_23785B750()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_23785B760()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_23785B770()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23785B780()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23785B790()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_23785B7A0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23785B7B0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_23785B7C0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23785B7D0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23785B7E0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_23785B7F0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23785B800()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_23785B810()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_23785B820()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_23785B830()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_23785B840()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_23785B850()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_23785B860()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_23785B870()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_23785B880()
{
  return MEMORY[0x270F70E28]();
}

uint64_t sub_23785B890()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_23785B8A0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_23785B8B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23785B8C0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23785B8D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23785B8E0()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_23785B8F0()
{
  return MEMORY[0x270FA0C38]();
}

uint64_t sub_23785B900()
{
  return MEMORY[0x270FA0C48]();
}

uint64_t sub_23785B910()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_23785B920()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_23785B930()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_23785B940()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_23785B950()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_23785B960()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_23785B970()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_23785B980()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_23785B990()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_23785B9A0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23785B9B0()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_23785B9C0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_23785B9D0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23785B9E0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23785B9F0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23785BA00()
{
  return MEMORY[0x270EF23F0]();
}

uint64_t sub_23785BA10()
{
  return MEMORY[0x270EF2438]();
}

uint64_t sub_23785BA20()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_23785BA30()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_23785BA40()
{
  return MEMORY[0x270EF2508]();
}

uint64_t sub_23785BA50()
{
  return MEMORY[0x270EF2518]();
}

uint64_t sub_23785BA60()
{
  return MEMORY[0x270EF2528]();
}

uint64_t sub_23785BA70()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_23785BA80()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_23785BA90()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23785BAB0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23785BAC0()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_23785BAD0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_23785BAE0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_23785BAF0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_23785BB00()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_23785BB10()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_23785BB20()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_23785BB30()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_23785BB40()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_23785BB50()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_23785BB60()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_23785BB70()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_23785BB80()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23785BB90()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23785BBA0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23785BBB0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_23785BBC0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_23785BBD0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_23785BBE0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23785BBF0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_23785BC00()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_23785BC10()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_23785BC20()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_23785BC30()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_23785BC40()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23785BC50()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_23785BC60()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_23785BC70()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_23785BC80()
{
  return MEMORY[0x270F9EFC8]();
}

uint64_t sub_23785BC90()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23785BCA0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23785BCB0()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_23785BCC0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23785BCD0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23785BCE0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23785BCF0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_23785BD00()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_23785BD10()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_23785BD20()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_23785BD30()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_23785BD40()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_23785BD50()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_23785BD60()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_23785BD70()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_23785BD80()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_23785BD90()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_23785BDA0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_23785BDB0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_23785BDC0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_23785BDD0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_23785BDE0()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_23785BDF0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_23785BE00()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23785BE20()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_23785BE30()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23785BE40()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_23785BE50()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_23785BE60()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_23785BE70()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_23785BE80()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23785BE90()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23785BEA0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23785BEB0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23785BEC0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23785BED0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23785BEE0()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_23785BEF0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23785BF00()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_23785BF10()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_23785BF20()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t INTypedObjectWithCustomObject()
{
  return MEMORY[0x270EF52D0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x270F77130]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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