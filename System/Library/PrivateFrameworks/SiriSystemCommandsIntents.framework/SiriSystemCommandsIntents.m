uint64_t sub_23789B154(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned char v10[40];

  v3 = v2;
  v6 = sub_2378C9260();
  v7 = OUTLINED_FUNCTION_42(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_27();
  sub_2378A0150(a1, v3 + 16);
  *(unsigned char *)(v3 + 64) = a2;
  type metadata accessor for RestartShutdownCATs();
  sub_2378C9250();
  sub_2378C91C0();
  sub_2378A0150(a1, (uint64_t)v10);
  sub_2378C91A0();
  sub_2378A0218((uint64_t)v10, &qword_268934810);
  sub_2378C91B0();
  swift_release();
  v8 = sub_2378C91F0();
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(void *)(v3 + 56) = v8;
  return v3;
}

uint64_t sub_23789B258()
{
  OUTLINED_FUNCTION_41();
  v1[12] = v2;
  v1[13] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934320);
  OUTLINED_FUNCTION_42(v3);
  v1[14] = OUTLINED_FUNCTION_31();
  uint64_t v4 = sub_2378C8F70();
  v1[15] = v4;
  OUTLINED_FUNCTION_0(v4);
  v1[16] = v5;
  v1[17] = OUTLINED_FUNCTION_31();
  uint64_t v6 = sub_2378C8EE0();
  v1[18] = v6;
  OUTLINED_FUNCTION_0(v6);
  v1[19] = v7;
  v1[20] = OUTLINED_FUNCTION_9();
  v1[21] = swift_task_alloc();
  uint64_t v8 = sub_2378C8F40();
  v1[22] = v8;
  OUTLINED_FUNCTION_0(v8);
  v1[23] = v9;
  v1[24] = OUTLINED_FUNCTION_9();
  v1[25] = swift_task_alloc();
  uint64_t v10 = sub_2378C8F90();
  v1[26] = v10;
  OUTLINED_FUNCTION_0(v10);
  v1[27] = v11;
  v1[28] = OUTLINED_FUNCTION_9();
  v1[29] = swift_task_alloc();
  uint64_t v12 = sub_2378C8D00();
  v1[30] = v12;
  OUTLINED_FUNCTION_0(v12);
  v1[31] = v13;
  v1[32] = OUTLINED_FUNCTION_31();
  uint64_t v14 = sub_2378C9260();
  OUTLINED_FUNCTION_42(v14);
  v1[33] = OUTLINED_FUNCTION_31();
  uint64_t v15 = sub_2378C8D30();
  v1[34] = v15;
  OUTLINED_FUNCTION_0(v15);
  v1[35] = v16;
  v1[36] = OUTLINED_FUNCTION_9();
  v1[37] = swift_task_alloc();
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  uint64_t v17 = sub_2378C9280();
  v1[40] = v17;
  OUTLINED_FUNCTION_0(v17);
  v1[41] = v18;
  v1[42] = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v19, v20, v21);
}

uint64_t sub_23789B490()
{
  if (qword_268934168 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[41];
  uint64_t v1 = v0[42];
  uint64_t v3 = v0[40];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_268936078);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  uint64_t v5 = (uint8_t *)(v2 + 16);
  v6(v1, v4, v3);
  uint64_t v7 = sub_2378C9270();
  os_log_type_t v8 = sub_2378C9430();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (_WORD *)OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_28(v9);
    _os_log_impl(&dword_237899000, v7, v8, "SCSystemCommandsYesNoStrategy | making prompt for Yes/No response", v5, 2u);
    OUTLINED_FUNCTION_8();
  }
  uint64_t v11 = v0[41];
  uint64_t v10 = v0[42];
  uint64_t v12 = v0[40];
  uint64_t v13 = v0[13];

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  if (*(unsigned char *)(v13 + 64))
  {
    if (*(unsigned char *)(v13 + 64) == 1)
    {
      uint64_t v14 = (void *)swift_task_alloc();
      v0[45] = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_23789BB10;
      uint64_t v15 = v0[37];
      return sub_2378A2FC8(v15);
    }
    else
    {
      uint64_t v19 = v0[13];
      type metadata accessor for ScreenRecordingCATs();
      sub_2378C9250();
      sub_2378C91C0();
      sub_2378A0150(v19 + 16, (uint64_t)(v0 + 2));
      sub_2378C91A0();
      sub_2378A0218((uint64_t)(v0 + 2), &qword_268934810);
      sub_2378C91B0();
      swift_release();
      v0[47] = sub_2378C91F0();
      uint64_t v20 = (void *)swift_task_alloc();
      v0[48] = v20;
      *uint64_t v20 = v0;
      v20[1] = sub_23789BE90;
      return sub_2378BFFAC();
    }
  }
  else
  {
    uint64_t v17 = (void *)swift_task_alloc();
    v0[43] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_23789B794;
    uint64_t v18 = v0[38];
    return sub_2378A2E14(v18);
  }
}

uint64_t sub_23789B794()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_51();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 352) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "23789B8A4: call analysis failed (funcsize=166)"

uint64_t sub_23789BB10()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_51();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 368) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "23789BC24: call analysis failed (funcsize=167)"

uint64_t sub_23789BE90()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_51();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 392) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "23789BFC4: call analysis failed (funcsize=175)"

uint64_t sub_23789C230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_6();
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
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
  return v19(v18, v19, v20, v21, v22, v23, v24, v25, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_23789C304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_6();
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
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
  return v19(v18, v19, v20, v21, v22, v23, v24, v25, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_23789C3D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_52();
  swift_release();
  OUTLINED_FUNCTION_6();
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
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
  return v19(v18, v19, v20, v21, v22, v23, v24, v25, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_23789C4B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v259 = a2;
  uint64_t v3 = type metadata accessor for SystemCommandsIntent();
  uint64_t v4 = OUTLINED_FUNCTION_42(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_27();
  uint64_t v235 = v6 - v5;
  OUTLINED_FUNCTION_49();
  sub_2378C8E00();
  OUTLINED_FUNCTION_2();
  uint64_t v243 = v7;
  uint64_t v244 = v8;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_64();
  uint64_t v237 = v11;
  OUTLINED_FUNCTION_49();
  uint64_t v240 = sub_2378C8F40();
  OUTLINED_FUNCTION_2();
  uint64_t v241 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_10();
  v256 = v14;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_22();
  uint64_t v258 = v16;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)v233 - v18;
  uint64_t v248 = sub_2378C8EB0();
  OUTLINED_FUNCTION_2();
  uint64_t v250 = v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_64();
  uint64_t v239 = v24;
  OUTLINED_FUNCTION_49();
  uint64_t v249 = sub_2378C8E70();
  OUTLINED_FUNCTION_2();
  uint64_t v245 = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_64();
  uint64_t v252 = v28;
  OUTLINED_FUNCTION_49();
  uint64_t v260 = sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v257 = v29;
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_10();
  uint64_t v247 = v31;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_64();
  uint64_t v251 = v40;
  OUTLINED_FUNCTION_49();
  uint64_t v41 = sub_2378C8E20();
  OUTLINED_FUNCTION_2();
  v254 = v42;
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_10();
  uint64_t v246 = v44;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v45);
  uint64_t v46 = sub_2378C8E30();
  OUTLINED_FUNCTION_2();
  uint64_t v48 = v47;
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5();
  uint64_t v51 = MEMORY[0x270FA5388](v50);
  v53 = (char *)v233 - v52;
  uint64_t v54 = MEMORY[0x270FA5388](v51);
  v56 = (char **)((char *)v233 - v55);
  uint64_t v57 = MEMORY[0x270FA5388](v54);
  v59 = (char *)v233 - v58;
  MEMORY[0x270FA5388](v57);
  v61 = (char *)v233 - v60;
  uint64_t v242 = a1;
  sub_2378C8DF0();
  uint64_t v62 = v48;
  v63 = *(uint64_t (**)(char *, uint64_t))(v48 + 88);
  v261 = v61;
  int v64 = v63(v61, v46);
  if (v64 == *MEMORY[0x263F6FF70])
  {
    OUTLINED_FUNCTION_3();
    v65();
    uint64_t v255 = v48;
    uint64_t v253 = v46;
    OUTLINED_FUNCTION_54();
    v66();
    v67 = v254;
    v256 = v56;
    uint64_t v258 = v41;
    OUTLINED_FUNCTION_3();
    v68();
    uint64_t v69 = sub_2378C8E10();
    uint64_t v71 = v70;
    v72 = (void *)sub_2378C8B30();
    v56 = &selRef_setSecondaryButtonLabel_;
    id v73 = objc_msgSend(v72, sel_identifier);

    uint64_t v74 = sub_2378C92E0();
    uint64_t v76 = v75;

    if (v69 == v74 && v71 == v76)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v79 = v260;
    }
    else
    {
      char v78 = OUTLINED_FUNCTION_58();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v79 = v260;
      if ((v78 & 1) == 0)
      {
        v80 = v67;
        v81 = (void (*)(void))*((void *)v67 + 1);
        uint64_t v82 = v258;
        OUTLINED_FUNCTION_21();
        v81();
        (*((void (**)(uint64_t, char **, uint64_t))v80 + 4))(v246, v256, v82);
        uint64_t v83 = sub_2378C8E10();
        uint64_t v85 = v84;
        v86 = (void *)sub_2378C8B20();
        id v87 = objc_msgSend(v86, sel_identifier);

        uint64_t v88 = sub_2378C92E0();
        uint64_t v90 = v89;

        if (v83 == v88 && v85 == v90)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v93 = v257;
          uint64_t v94 = v238;
        }
        else
        {
          char v92 = OUTLINED_FUNCTION_58();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v93 = v257;
          uint64_t v94 = v238;
          if ((v92 & 1) == 0)
          {
            OUTLINED_FUNCTION_21();
            v81();
            uint64_t v62 = v255;
            uint64_t v46 = v253;
            goto LABEL_78;
          }
        }
        if (qword_268934168 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v79, (uint64_t)qword_268936078);
        OUTLINED_FUNCTION_3();
        v120();
        v121 = (void *)sub_2378C9270();
        os_log_type_t v122 = sub_2378C9430();
        if (OUTLINED_FUNCTION_13(v122))
        {
          v123 = (_WORD *)OUTLINED_FUNCTION_29();
          OUTLINED_FUNCTION_28(v123);
          OUTLINED_FUNCTION_7(&dword_237899000, v124, v125, "SCSystemCommandsYesNoStrategy actionForInput | cancel pressed");
          OUTLINED_FUNCTION_8();
        }

        (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v94, v79);
        sub_2378C8C30();
        OUTLINED_FUNCTION_21();
        v81();
        return (*(uint64_t (**)(char *, uint64_t))(v255 + 8))(v261, v253);
      }
    }
    if (qword_268934168 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v79, (uint64_t)qword_268936078);
    OUTLINED_FUNCTION_37();
    uint64_t v100 = v251;
    OUTLINED_FUNCTION_3();
    v101();
    v102 = (void *)sub_2378C9270();
    os_log_type_t v103 = sub_2378C9430();
    if (OUTLINED_FUNCTION_13(v103))
    {
      v104 = (_WORD *)OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_28(v104);
      OUTLINED_FUNCTION_7(&dword_237899000, v105, v106, "SCSystemCommandsYesNoStrategy actionForInput | confirm pressed");
      OUTLINED_FUNCTION_8();
    }

    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v100, v79);
    sub_2378C8C40();
    v107 = (void (*)(void))*((void *)v67 + 1);
    OUTLINED_FUNCTION_32();
    v107();
    OUTLINED_FUNCTION_32();
    v107();
    return (*(uint64_t (**)(char *, uint64_t))(v255 + 8))(v261, v253);
  }
  if (v64 == *MEMORY[0x263F6FF58])
  {
    OUTLINED_FUNCTION_3();
    v95();
    OUTLINED_FUNCTION_54();
    v96();
    self;
    if (swift_dynamicCastObjCClass() || (self, swift_dynamicCastObjCClass()))
    {
      uint64_t v97 = OUTLINED_FUNCTION_50();
      v98(v97);
      swift_unknownObjectRelease();
      return sub_2378C8C30();
    }
    self;
    uint64_t v144 = swift_dynamicCastObjCClass();
    uint64_t v79 = v260;
    if (v144)
    {
      sub_2378C8C40();
      swift_unknownObjectRelease();
      uint64_t v145 = OUTLINED_FUNCTION_50();
      return v146(v145);
    }
    swift_unknownObjectRelease();
    goto LABEL_78;
  }
  uint64_t v79 = v260;
  if (v64 == *MEMORY[0x263F6FF80])
  {
    OUTLINED_FUNCTION_3();
    v108();
    uint64_t v255 = v62;
    OUTLINED_FUNCTION_54();
    v109();
    (*(void (**)(uint64_t, char *, uint64_t))(v245 + 32))(v252, v53, v249);
    sub_2378C8E60();
    uint64_t v110 = sub_2378C8EA0();
    uint64_t v111 = v250;
    v112 = *(void (**)(void))(v250 + 8);
    OUTLINED_FUNCTION_39();
    v112();
    uint64_t v113 = *(void *)(v110 + 16);
    uint64_t v250 = v111 + 8;
    v254 = v112;
    if (v113)
    {
      uint64_t v114 = v241 + 16;
      v115 = *(void (**)(char *, char *, uint64_t))(v241 + 16);
      OUTLINED_FUNCTION_45();
      uint64_t v116 = *(void *)(v114 + 56);
      uint64_t v251 = v110;
      swift_bridgeObjectRetain();
      uint64_t v117 = v240;
      while (1)
      {
        v115(v19, v59, v117);
        char v118 = sub_2378C8EF0();
        OUTLINED_FUNCTION_39();
        v119();
        if (v118) {
          break;
        }
        v59 += v116;
        if (!--v113)
        {
          OUTLINED_FUNCTION_71();
          v112 = v254;
          goto LABEL_36;
        }
      }
      uint64_t v133 = v46;
      OUTLINED_FUNCTION_71();
      if (qword_268934168 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v260, (uint64_t)qword_268936078);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_3();
      v134();
      v135 = (void *)sub_2378C9270();
      os_log_type_t v136 = sub_2378C9430();
      BOOL v137 = OUTLINED_FUNCTION_13(v136);
      v138 = v261;
      if (v137)
      {
        v139 = (_WORD *)OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_28(v139);
        OUTLINED_FUNCTION_7(&dword_237899000, v140, v141, "SCSystemCommandsYesNoStrategy actionForInput | hasAccepted");
        OUTLINED_FUNCTION_8();
      }

      uint64_t v142 = OUTLINED_FUNCTION_26();
      v143(v142);
      sub_2378C8C40();
      goto LABEL_59;
    }
    swift_bridgeObjectRelease();
    uint64_t v117 = v240;
LABEL_36:
    sub_2378C8E60();
    uint64_t v126 = sub_2378C8EA0();
    OUTLINED_FUNCTION_39();
    v112();
    uint64_t v127 = *(void *)(v126 + 16);
    if (v127)
    {
      v128 = *(void (**)(void))(v241 + 16);
      unint64_t v129 = v126 + ((*(unsigned __int8 *)(v241 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v241 + 80));
      uint64_t v130 = *(void *)(v241 + 72);
      uint64_t v251 = v126;
      swift_bridgeObjectRetain();
      while (1)
      {
        OUTLINED_FUNCTION_60();
        v128();
        char v131 = sub_2378C8F00();
        OUTLINED_FUNCTION_39();
        v132();
        if (v131) {
          break;
        }
        v129 += v130;
        if (!--v127)
        {
          uint64_t v253 = v46;
          OUTLINED_FUNCTION_71();
          v112 = v254;
          goto LABEL_49;
        }
      }
      uint64_t v133 = v46;
      OUTLINED_FUNCTION_71();
      if (qword_268934168 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v260, (uint64_t)qword_268936078);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_3();
      v156();
      v157 = (void *)sub_2378C9270();
      os_log_type_t v158 = sub_2378C9430();
      BOOL v159 = OUTLINED_FUNCTION_13(v158);
      v138 = v261;
      if (v159)
      {
        v160 = (_WORD *)OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_28(v160);
        OUTLINED_FUNCTION_7(&dword_237899000, v161, v162, "SCSystemCommandsYesNoStrategy actionForInput | hasRejected");
        OUTLINED_FUNCTION_8();
      }

      uint64_t v163 = OUTLINED_FUNCTION_26();
      v164(v163);
      sub_2378C8C30();
LABEL_59:
      OUTLINED_FUNCTION_16();
      v165();
      return (*(uint64_t (**)(char *, uint64_t))(v255 + 8))(v138, v133);
    }
    uint64_t v253 = v46;
    swift_bridgeObjectRelease();
LABEL_49:
    sub_2378C8E60();
    uint64_t v147 = sub_2378C8EA0();
    OUTLINED_FUNCTION_39();
    v112();
    uint64_t v148 = *(void *)(v147 + 16);
    uint64_t v149 = v237;
    if (v148)
    {
      v150 = *(void (**)(char **, unint64_t, uint64_t))(v241 + 16);
      unint64_t v151 = v147 + ((*(unsigned __int8 *)(v241 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v241 + 80));
      uint64_t v152 = *(void *)(v241 + 72);
      uint64_t v258 = v147;
      swift_bridgeObjectRetain();
      v153 = v256;
      while (1)
      {
        v150(v153, v151, v117);
        char v154 = sub_2378C8F10();
        OUTLINED_FUNCTION_39();
        v155();
        if (v154) {
          break;
        }
        v151 += v152;
        if (!--v148)
        {
          swift_bridgeObjectRelease_n();
          goto LABEL_61;
        }
      }
      swift_bridgeObjectRelease_n();
      if (qword_268934168 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v260, (uint64_t)qword_268936078);
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_3();
      v187();
      v188 = (void *)sub_2378C9270();
      os_log_type_t v189 = sub_2378C9430();
      BOOL v190 = OUTLINED_FUNCTION_13(v189);
      uint64_t v178 = v249;
      uint64_t v179 = v245;
      if (v190)
      {
        v191 = (_WORD *)OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_28(v191);
        OUTLINED_FUNCTION_7(&dword_237899000, v192, v193, "SCSystemCommandsYesNoStrategy actionForInput | hasCancelled");
        OUTLINED_FUNCTION_8();
      }

      uint64_t v194 = OUTLINED_FUNCTION_47();
      v195(v194);
      sub_2378C8C30();
      goto LABEL_76;
    }
    swift_bridgeObjectRelease();
LABEL_61:
    int v166 = *(unsigned __int8 *)(v236 + 64);
    uint64_t v168 = v243;
    uint64_t v167 = v244;
    v169 = *(void (**)(void))(v244 + 16);
    OUTLINED_FUNCTION_70();
    v169();
    if (v166 == 2)
    {
      sub_2378C8DF0();
      uint64_t v170 = v235;
      sub_2378AAF18();
      sub_2378AB318();
      char v172 = v171;
      sub_2378A00F4(v170);
      v173 = *(void (**)(void))(v167 + 8);
      OUTLINED_FUNCTION_30();
      v173();
      if (v172)
      {
        if (qword_268934168 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v260, (uint64_t)qword_268936078);
        OUTLINED_FUNCTION_37();
        OUTLINED_FUNCTION_3();
        v174();
        v175 = (void *)sub_2378C9270();
        os_log_type_t v176 = sub_2378C9430();
        BOOL v177 = OUTLINED_FUNCTION_13(v176);
        uint64_t v178 = v249;
        uint64_t v179 = v245;
        if (v177)
        {
          v180 = (_WORD *)OUTLINED_FUNCTION_29();
          OUTLINED_FUNCTION_28(v180);
          OUTLINED_FUNCTION_7(&dword_237899000, v181, v182, "SCSystemCommandsYesNoStrategy actionForInput | accepting confirmation for StartRecording parse");
          OUTLINED_FUNCTION_8();
        }

        uint64_t v183 = OUTLINED_FUNCTION_47();
        v184(v183);
        sub_2378C8C40();
LABEL_76:
        (*(void (**)(uint64_t, uint64_t))(v179 + 8))(v252, v178);
        return (*(uint64_t (**)(char *, uint64_t))(v255 + 8))(v261, v253);
      }
    }
    else
    {
      v173 = *(void (**)(void))(v167 + 8);
      ((void (*)(uint64_t, uint64_t))v173)(v149, v168);
    }
    OUTLINED_FUNCTION_70();
    v169();
    if (v166)
    {
      OUTLINED_FUNCTION_30();
      v173();
      uint64_t v185 = v249;
      uint64_t v186 = v234;
    }
    else
    {
      sub_2378C8DF0();
      uint64_t v210 = v235;
      sub_2378AAF18();
      sub_2378AB344();
      char v212 = v211;
      sub_2378A00F4(v210);
      OUTLINED_FUNCTION_30();
      v173();
      uint64_t v185 = v249;
      uint64_t v186 = v234;
      if (v212)
      {
        uint64_t v213 = v257;
        uint64_t v214 = v245;
        if (qword_268934168 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v260, (uint64_t)qword_268936078);
        uint64_t v215 = v233[0];
        OUTLINED_FUNCTION_3();
        v216();
        v217 = (void *)sub_2378C9270();
        os_log_type_t v218 = sub_2378C9430();
        if (OUTLINED_FUNCTION_13(v218))
        {
          v219 = (_WORD *)OUTLINED_FUNCTION_29();
          OUTLINED_FUNCTION_28(v219);
          OUTLINED_FUNCTION_7(&dword_237899000, v220, v221, "SCSystemCommandsYesNoStrategy actionForInput | accepting confirmation for Restart parse");
          OUTLINED_FUNCTION_8();
        }

        (*(void (**)(uint64_t, uint64_t))(v213 + 8))(v215, v260);
        sub_2378C8C40();
        (*(void (**)(uint64_t, uint64_t))(v214 + 8))(v252, v185);
        return (*(uint64_t (**)(char *, uint64_t))(v255 + 8))(v261, v253);
      }
    }
    uint64_t v222 = v245;
    if (qword_268934168 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v260, (uint64_t)qword_268936078);
    OUTLINED_FUNCTION_3();
    v223();
    OUTLINED_FUNCTION_3();
    v224();
    v225 = sub_2378C9270();
    os_log_type_t v226 = sub_2378C9430();
    if (os_log_type_enabled(v225, v226))
    {
      v227 = (uint8_t *)swift_slowAlloc();
      uint64_t v258 = OUTLINED_FUNCTION_63();
      uint64_t v262 = v258;
      *(_DWORD *)v227 = 136315138;
      uint64_t v228 = sub_2378C8E50();
      uint64_t v230 = sub_2378A1964(v228, v229, &v262);
      OUTLINED_FUNCTION_62(v230);
      sub_2378C94B0();
      swift_bridgeObjectRelease();
      v231 = *(void (**)(void))(v222 + 8);
      ((void (*)(uint64_t, uint64_t))v231)(v186, v249);
      _os_log_impl(&dword_237899000, v225, v226, "SCSystemCommandsYesNoStrategy actionForInput | ignoring usoParse: %s", v227, 0xCu);
      swift_arrayDestroy();
      uint64_t v185 = v249;
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_8();
    }
    else
    {
      v231 = *(void (**)(void))(v222 + 8);
      OUTLINED_FUNCTION_30();
      v231();
    }

    OUTLINED_FUNCTION_21();
    v232();
    sub_2378C8C50();
    ((void (*)(uint64_t, uint64_t))v231)(v252, v185);
    return (*(uint64_t (**)(char *, uint64_t))(v255 + 8))(v261, v253);
  }
LABEL_78:
  uint64_t v255 = v62;
  uint64_t v253 = v46;
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v79, (uint64_t)qword_268936078);
  OUTLINED_FUNCTION_38();
  uint64_t v196 = v247;
  OUTLINED_FUNCTION_3();
  v197();
  OUTLINED_FUNCTION_3();
  v198();
  v199 = sub_2378C9270();
  os_log_type_t v200 = sub_2378C9430();
  if (os_log_type_enabled(v199, v200))
  {
    v201 = (uint8_t *)swift_slowAlloc();
    uint64_t v262 = OUTLINED_FUNCTION_63();
    *(_DWORD *)v201 = 136315138;
    uint64_t v258 = (uint64_t)(v201 + 4);
    sub_2378A00AC(&qword_268934318, 255, MEMORY[0x263F6FF40]);
    uint64_t v202 = sub_2378C9590();
    uint64_t v204 = sub_2378A1964(v202, v203, &v262);
    OUTLINED_FUNCTION_62(v204);
    sub_2378C94B0();
    swift_bridgeObjectRelease();
    uint64_t v205 = OUTLINED_FUNCTION_44();
    v206(v205);
    _os_log_impl(&dword_237899000, v199, v200, "SCSystemCommandsYesNoStrategy actionForInput | ignoring unknown parse: %s", v201, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    ((void (*)(uint64_t, uint64_t))v56[1])(v247, v260);
  }
  else
  {
    uint64_t v207 = OUTLINED_FUNCTION_44();
    v208(v207);

    ((void (*)(uint64_t, uint64_t))v56[1])(v196, v79);
  }
  sub_2378C8C50();
  OUTLINED_FUNCTION_21();
  return v209();
}

BOOL sub_23789DA74(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23789DA84()
{
  OUTLINED_FUNCTION_41();
  v1[5] = v2;
  v1[6] = v0;
  v1[4] = v3;
  uint64_t v4 = sub_2378C9280();
  v1[7] = v4;
  OUTLINED_FUNCTION_0(v4);
  v1[8] = v5;
  v1[9] = OUTLINED_FUNCTION_9();
  v1[10] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for SystemCommandsIntent();
  OUTLINED_FUNCTION_42(v6);
  v1[11] = OUTLINED_FUNCTION_31();
  uint64_t v7 = sub_2378C8E00();
  v1[12] = v7;
  OUTLINED_FUNCTION_0(v7);
  v1[13] = v8;
  v1[14] = OUTLINED_FUNCTION_9();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  uint64_t v9 = sub_2378C8F40();
  v1[17] = v9;
  OUTLINED_FUNCTION_0(v9);
  v1[18] = v10;
  v1[19] = OUTLINED_FUNCTION_9();
  v1[20] = swift_task_alloc();
  uint64_t v11 = sub_2378C8EB0();
  v1[21] = v11;
  OUTLINED_FUNCTION_0(v11);
  v1[22] = v12;
  v1[23] = OUTLINED_FUNCTION_9();
  v1[24] = swift_task_alloc();
  uint64_t v13 = sub_2378C8E70();
  v1[25] = v13;
  OUTLINED_FUNCTION_0(v13);
  v1[26] = v14;
  v1[27] = OUTLINED_FUNCTION_9();
  v1[28] = swift_task_alloc();
  uint64_t v15 = sub_2378C8E20();
  v1[29] = v15;
  OUTLINED_FUNCTION_0(v15);
  v1[30] = v16;
  v1[31] = OUTLINED_FUNCTION_31();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934310);
  OUTLINED_FUNCTION_42(v17);
  v1[32] = OUTLINED_FUNCTION_31();
  uint64_t v18 = sub_2378C8E30();
  v1[33] = v18;
  OUTLINED_FUNCTION_0(v18);
  v1[34] = v19;
  v1[35] = OUTLINED_FUNCTION_9();
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v20, v21, v22);
}

uint64_t sub_23789DCF0()
{
  char v118 = v0;
  uint64_t v1 = v0[39];
  uint64_t v3 = v0[33];
  uint64_t v2 = v0[34];
  sub_2378C8DF0();
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x263F6FF70])
  {
    uint64_t v5 = v0[37];
    uint64_t v7 = v0[30];
    uint64_t v6 = v0[31];
    uint64_t v8 = v0[29];
    OUTLINED_FUNCTION_3();
    v9();
    uint64_t v10 = OUTLINED_FUNCTION_24();
    v11(v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v6, v5, v8);
    uint64_t v12 = sub_2378C8E10();
    uint64_t v14 = v13;
    uint64_t v15 = (void *)sub_2378C8B30();
    id v16 = objc_msgSend(v15, sel_identifier);

    uint64_t v17 = sub_2378C92E0();
    uint64_t v19 = v18;

    if (v12 == v17 && v14 == v19)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v21 = sub_2378C95A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0)
      {
        OUTLINED_FUNCTION_30();
        v22();
        goto LABEL_31;
      }
    }
    uint64_t v28 = v0[31];
    uint64_t v29 = v0[32];
    uint64_t v30 = v0[29];
    uint64_t v31 = v0[30];
LABEL_13:
    uint64_t v32 = *MEMORY[0x263F6FC98];
    uint64_t v33 = sub_2378C8D70();
    OUTLINED_FUNCTION_19();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 104))(v29, v32, v33);
    OUTLINED_FUNCTION_68();
    sub_2378C8DE0();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v28, v30);
    goto LABEL_37;
  }
  if (v4 == *MEMORY[0x263F6FF58])
  {
    OUTLINED_FUNCTION_3();
    v23();
    uint64_t v24 = OUTLINED_FUNCTION_24();
    v25(v24);
    self;
    if (swift_dynamicCastObjCClass())
    {
      uint64_t v26 = v0[32];
      uint64_t v27 = (unsigned int *)MEMORY[0x263F6FC98];
    }
    else
    {
      self;
      if (!swift_dynamicCastObjCClass())
      {
        swift_unknownObjectRelease();
        goto LABEL_31;
      }
      uint64_t v26 = v0[32];
      uint64_t v27 = (unsigned int *)MEMORY[0x263F6FC90];
    }
    uint64_t v54 = *v27;
    uint64_t v55 = sub_2378C8D70();
    OUTLINED_FUNCTION_19();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 104))(v26, v54, v55);
    __swift_storeEnumTagSinglePayload(v26, 0, 1, v55);
    sub_2378C8DE0();
    swift_unknownObjectRelease();
    goto LABEL_37;
  }
  if (v4 != *MEMORY[0x263F6FF80])
  {
LABEL_31:
    if (qword_268934168 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v0[7], (uint64_t)qword_268936078);
    OUTLINED_FUNCTION_60();
    v65();
    OUTLINED_FUNCTION_66();
    v66();
    v67 = sub_2378C9270();
    os_log_type_t v68 = sub_2378C9430();
    BOOL v69 = os_log_type_enabled(v67, v68);
    uint64_t v70 = v0[8];
    uint64_t v71 = v0[9];
    uint64_t v72 = v0[7];
    if (v69)
    {
      uint64_t v115 = v0[9];
      id v73 = (uint8_t *)swift_slowAlloc();
      uint64_t v117 = OUTLINED_FUNCTION_63();
      *(_DWORD *)id v73 = 136315138;
      sub_2378A00AC(&qword_268934318, 255, MEMORY[0x263F6FF40]);
      uint64_t v74 = sub_2378C9590();
      v0[2] = sub_2378A1964(v74, v75, &v117);
      sub_2378C94B0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_32();
      v76();
      _os_log_impl(&dword_237899000, v67, v68, "SCSystemCommandsYesNoStrategy parseConfirmationResponse | Unable to parse a confirmation response for: %s", v73, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_12();

      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v115, v72);
    }
    else
    {
      OUTLINED_FUNCTION_32();
      v77();

      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v71, v72);
    }
    uint64_t v78 = sub_2378C8D70();
    OUTLINED_FUNCTION_67(v78);
    sub_2378C8DE0();
    goto LABEL_37;
  }
  uint64_t v35 = v0[36];
  uint64_t v36 = v0[28];
  uint64_t v37 = v0[25];
  uint64_t v38 = v0[26];
  uint64_t v39 = v0[22];
  OUTLINED_FUNCTION_3();
  v40();
  uint64_t v41 = OUTLINED_FUNCTION_24();
  v42(v41);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v36, v35, v37);
  sub_2378C8E60();
  uint64_t v43 = sub_2378C8EA0();
  uint64_t v44 = *(void (**)(void))(v39 + 8);
  OUTLINED_FUNCTION_32();
  v44();
  uint64_t v45 = *(void *)(v43 + 16);
  if (v45)
  {
    os_log_t log = (os_log_t)v44;
    uint64_t v46 = v0[18];
    uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16);
    v46 += 16;
    uint64_t v47 = v48;
    OUTLINED_FUNCTION_45();
    uint64_t v49 = (char *)(v46 - 8);
    uint64_t v50 = *(void *)(v46 + 56);
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v51 = v0[20];
      uint64_t v52 = v0[17];
      v47(v51, v36, v52);
      char v53 = sub_2378C8EF0();
      (*(void (**)(uint64_t, uint64_t))v49)(v51, v52);
      if (v53) {
        break;
      }
      v36 += v50;
      if (!--v45)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v44 = (void (*)(void))log;
        goto LABEL_24;
      }
    }
    OUTLINED_FUNCTION_43();
    int v64 = (unsigned int *)MEMORY[0x263F6FC98];
    goto LABEL_48;
  }
  swift_bridgeObjectRelease();
LABEL_24:
  uint64_t v36 = v0[23];
  sub_2378C8E60();
  uint64_t v57 = sub_2378C8EA0();
  OUTLINED_FUNCTION_32();
  v44();
  uint64_t v49 = *(char **)(v57 + 16);
  if (v49)
  {
    uint64_t v58 = v0[18];
    uint64_t v60 = *(void (**)(void))(v58 + 16);
    uint64_t v45 = v58 + 16;
    v59 = v60;
    OUTLINED_FUNCTION_45();
    uint64_t v61 = *(void *)(v45 + 56);
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v51 = v0[19];
      OUTLINED_FUNCTION_60();
      v59();
      char v62 = sub_2378C8F00();
      OUTLINED_FUNCTION_32();
      v63();
      if (v62) {
        break;
      }
      v36 += v61;
      if (!--v49)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_41;
      }
    }
    OUTLINED_FUNCTION_43();
    int v64 = (unsigned int *)MEMORY[0x263F6FC90];
LABEL_48:
    uint64_t v90 = *v64;
    uint64_t v91 = sub_2378C8D70();
    OUTLINED_FUNCTION_19();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v92 + 104))(v51, v90, v91);
    OUTLINED_FUNCTION_68();
    sub_2378C8DE0();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v49, v36);
    goto LABEL_37;
  }
  swift_bridgeObjectRelease();
LABEL_41:
  int v82 = *(unsigned __int8 *)(v0[6] + 64);
  uint64_t v83 = *(void (**)(void))(v0[13] + 16);
  OUTLINED_FUNCTION_66();
  v83();
  if (v82 == 2)
  {
    uint64_t v84 = v0[16];
    uint64_t v85 = v0[13];
    uint64_t v116 = v0[12];
    uint64_t v86 = v0[11];
    sub_2378C8DF0();
    sub_2378AAF18();
    sub_2378AB318();
    char v88 = v87;
    sub_2378A00F4(v86);
    uint64_t v89 = *(void (**)(void))(v85 + 8);
    ((void (*)(uint64_t, uint64_t))v89)(v84, v116);
    if (v88) {
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t v89 = *(void (**)(void))(v0[13] + 8);
    ((void (*)(void, void))v89)(v0[16], v0[12]);
  }
  OUTLINED_FUNCTION_66();
  v83();
  if (v82)
  {
    OUTLINED_FUNCTION_30();
    v89();
  }
  else
  {
    uint64_t v93 = v0[11];
    sub_2378C8DF0();
    sub_2378AAF18();
    sub_2378AB344();
    char v95 = v94;
    sub_2378A00F4(v93);
    OUTLINED_FUNCTION_30();
    v89();
    if (v95)
    {
LABEL_50:
      uint64_t v29 = v0[32];
      uint64_t v28 = v0[28];
      uint64_t v30 = v0[25];
      uint64_t v31 = v0[26];
      goto LABEL_13;
    }
  }
  if (qword_268934168 != -1) {
    swift_once();
  }
  v96 = (void (*)(void))v0[10];
  uint64_t v97 = v0[7];
  uint64_t v98 = v0[8];
  uint64_t v99 = __swift_project_value_buffer(v97, (uint64_t)qword_268936078);
  (*(void (**)(void (*)(void), uint64_t, uint64_t))(v98 + 16))(v96, v99, v97);
  OUTLINED_FUNCTION_66();
  v100();
  v101 = sub_2378C9270();
  os_log_type_t v102 = sub_2378C9430();
  BOOL v103 = os_log_type_enabled(v101, v102);
  uint64_t v104 = v0[10];
  uint64_t v106 = v0[7];
  uint64_t v105 = v0[8];
  if (v103)
  {
    loga = v101;
    uint64_t v107 = swift_slowAlloc();
    uint64_t v117 = OUTLINED_FUNCTION_63();
    *(_DWORD *)uint64_t v107 = 136315138;
    v96 = (void (*)(void))(v107 + 4);
    uint64_t v108 = sub_2378C8E50();
    v0[3] = sub_2378A1964(v108, v109, &v117);
    sub_2378C94B0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_21();
    ((void (*)(void))(v107 + 4))();
    _os_log_impl(&dword_237899000, loga, v102, "SCSystemCommandsYesNoStrategy parseConfirmationResponse | Unknown usoParse: %s", (uint8_t *)v107, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_8();

    (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v104, v106);
  }
  else
  {
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_21();
    v96();

    (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v104, v106);
  }
  uint64_t v110 = v0[28];
  uint64_t v111 = v0[25];
  uint64_t v112 = sub_2378C8D70();
  OUTLINED_FUNCTION_67(v112);
  sub_2378C8DE0();
  ((void (*)(uint64_t, uint64_t))v96)(v110, v111);
LABEL_37:
  OUTLINED_FUNCTION_30();
  v79();
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
  OUTLINED_FUNCTION_35();
  return v80();
}

uint64_t sub_23789E8E8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934300);
  OUTLINED_FUNCTION_19();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_27();
  uint64_t v4 = v3 - v2;
  if (*(unsigned char *)(v0 + 64))
  {
    if (*(unsigned char *)(v0 + 64) == 1) {
      sub_2378A2DD4();
    }
    else {
      sub_2378A2DB4();
    }
  }
  else
  {
    sub_2378A2DF4();
  }
  uint64_t v5 = sub_2378C9600();
  sub_2378A0218(v4, &qword_268934300);
  return v5;
}

uint64_t sub_23789E9B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2378C9280();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934300);
  OUTLINED_FUNCTION_19();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_27();
  uint64_t v7 = v6 - v5;
  if (qword_268934150 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_23789E8E8();
  if (v9)
  {
    uint64_t v10 = v8;
    sub_2378A2D94();
    uint64_t v11 = sub_2378C9600();
    uint64_t v13 = v12;
    sub_2378A0218(v7, &qword_268934300);
    if (v13)
    {
      uint64_t v52 = v11;
      uint64_t v14 = self;
      __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
      uint64_t v15 = (void *)OUTLINED_FUNCTION_69();
      id v16 = (void *)sub_2378C8B30();
      id v17 = objc_msgSend(v16, sel_identifier, v13, v52, v10);

      sub_2378C92E0();
      sub_2378A0048(0, &qword_268934308);
      swift_bridgeObjectRetain();
      id v18 = sub_23789F290();
      uint64_t v19 = sub_2378C92B0();
      sub_23789FD78(v19, v18);
      swift_bridgeObjectRelease();
      id v20 = objc_msgSend(v14, sel_runSiriKitExecutorCommandWithContext_payload_, v15, v18);

      __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
      char v21 = (void *)OUTLINED_FUNCTION_69();
      uint64_t v22 = (void *)sub_2378C8B20();
      id v23 = objc_msgSend(v22, sel_identifier);

      sub_2378C92E0();
      swift_bridgeObjectRetain();
      id v24 = sub_23789F290();
      uint64_t v25 = sub_2378C92B0();
      sub_23789FD78(v25, v24);
      swift_bridgeObjectRelease();
      id v26 = objc_msgSend(v14, sel_runSiriKitExecutorCommandWithContext_payload_, v21, v24);

      id v27 = objc_msgSend(v14, sel_wrapCommandInStartLocalRequest_, v20);
      id v28 = objc_msgSend(v14, sel_wrapCommandInStartLocalRequest_, v26);
      __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
      if (sub_2378C8BC0())
      {
        uint64_t v29 = OUTLINED_FUNCTION_40();
        uint64_t v35 = sub_23789F034(v29, v30, v31, v32, v33, v34);
      }
      else
      {
        uint64_t v45 = OUTLINED_FUNCTION_40();
        uint64_t v35 = sub_23789EE28(v45, v46, v47, v48, v49, v50);
      }
      uint64_t v44 = v35;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return v44;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v2, (uint64_t)qword_268936078);
  OUTLINED_FUNCTION_3();
  v36();
  uint64_t v37 = (void *)sub_2378C9270();
  os_log_type_t v38 = sub_2378C9450();
  if (OUTLINED_FUNCTION_13(v38))
  {
    uint64_t v39 = (_WORD *)OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_28(v39);
    OUTLINED_FUNCTION_7(&dword_237899000, v40, v41, "Failed to localize labels for confirmation dialog.");
    OUTLINED_FUNCTION_8();
  }

  uint64_t v42 = OUTLINED_FUNCTION_26();
  v43(v42);
  return MEMORY[0x263F8EE78];
}

uint64_t sub_23789EE28(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  sub_2378A0048(0, (unint64_t *)&qword_2689342F0);
  uint64_t v9 = sub_2378C92E0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_2378C92E0();
  uint64_t v14 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934890);
  uint64_t v15 = OUTLINED_FUNCTION_33();
  *(_OWORD *)(v15 + 16) = xmmword_2378C9C40;
  *(void *)(v15 + 32) = a3;
  uint64_t v35 = v15;
  sub_2378C93B0();
  swift_bridgeObjectRetain();
  id v16 = a3;
  id v17 = sub_2378A9508(a1, a2, v9, v11, v12, v14, v35);
  uint64_t v18 = sub_2378C92E0();
  uint64_t v20 = v19;
  uint64_t v21 = sub_2378C92E0();
  uint64_t v23 = v22;
  uint64_t v24 = OUTLINED_FUNCTION_33();
  *(_OWORD *)(v24 + 16) = xmmword_2378C9C40;
  *(void *)(v24 + 32) = a6;
  uint64_t v36 = v24;
  sub_2378C93B0();
  swift_bridgeObjectRetain();
  id v25 = a6;
  id v26 = sub_2378A9508(a4, a5, v18, v20, v21, v23, v36);
  sub_2378A0048(0, &qword_2689342F8);
  id v27 = v26;
  id v28 = v17;
  id v29 = sub_2378A95D4(v27, v28);
  uint64_t v30 = OUTLINED_FUNCTION_33();
  *(_OWORD *)(v30 + 16) = xmmword_2378C9C40;
  *(void *)(v30 + 32) = v29;
  uint64_t v37 = v30;
  sub_2378C93B0();

  return v37;
}

uint64_t sub_23789F034(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64C80]), sel_init);
  uint64_t v13 = sub_2378C92E0();
  sub_23789FDF8(v13, v14, v12);
  sub_23789FE5C(a1, a2, v12);
  id v15 = [objc_allocWithZone(MEMORY[0x263F64C58]) (SEL)0x264CE6618];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934890);
  uint64_t v16 = OUTLINED_FUNCTION_33();
  *(_OWORD *)(v16 + 16) = xmmword_2378C9C40;
  *(void *)(v16 + 32) = a3;
  uint64_t v42 = v16;
  sub_2378C93B0();
  id v17 = a3;
  sub_23789FF50(v42, v15, &qword_2689342E8, (SEL *)&selRef_setCommands_);
  objc_msgSend(v12, sel_setPrimaryButtonAction_, v15);
  objc_msgSend(v12, sel_setPrimaryButtonEnabled_, 1);
  uint64_t v18 = (void *)sub_2378C8C20();
  objc_msgSend(v12, sel_setPrimaryButtonTextColor_, v18);

  sub_23789FEF8(a4, a5, v12);
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64C58]), sel_init);
  uint64_t v20 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_59(v20, v21, v22, v23, v24, v25, v26, v27, xmmword_2378C9C40);
  id v28 = a6;
  sub_23789FF50(v42, v19, &qword_2689342E8, (SEL *)&selRef_setCommands_);
  objc_msgSend(v12, sel_setSecondaryButtonAction_, v19);
  objc_msgSend(v12, sel_setSecondaryButtonEnabled_, 1);
  id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64C68]), sel_init);
  uint64_t v30 = OUTLINED_FUNCTION_33();
  *(_OWORD *)(v30 + 16) = v41;
  *(void *)(v30 + 32) = v12;
  uint64_t v43 = v30;
  sub_2378C93B0();
  id v31 = v12;
  sub_23789FF50(v43, v29, &qword_2689342E0, (SEL *)&selRef_setTemplateItems_);
  uint64_t v32 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_59(v32, v33, v34, v35, v36, v37, v38, v39, v41);

  return v43;
}

id sub_23789F290()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_2378C92D0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

uint64_t sub_23789F304()
{
  return sub_2378C95E0();
}

uint64_t sub_23789F32C()
{
  return sub_2378C95F0();
}

BOOL sub_23789F374(char *a1, char *a2)
{
  return sub_23789DA74(*a1, *a2);
}

uint64_t sub_23789F380()
{
  return sub_23789F32C();
}

uint64_t sub_23789F388()
{
  return sub_23789F304();
}

uint64_t sub_23789F390()
{
  return sub_2378C95F0();
}

uint64_t sub_23789F3D4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return MEMORY[0x270FA0228](v0, 65, 7);
}

uint64_t type metadata accessor for SCSystemCommandsYesNoStrategy()
{
  return self;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SCSystemCommandsYesNoStrategy.ResponseType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SCSystemCommandsYesNoStrategy.ResponseType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *result = a2 + 2;
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
        JUMPOUT(0x23789F59CLL);
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
          *result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_23789F5C4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23789F5D0(unsigned char *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SCSystemCommandsYesNoStrategy.ResponseType()
{
  return &type metadata for SCSystemCommandsYesNoStrategy.ResponseType;
}

unint64_t sub_23789F5EC()
{
  unint64_t result = qword_2689341C0;
  if (!qword_2689341C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689341C0);
  }
  return result;
}

uint64_t sub_23789F638(uint64_t a1, uint64_t a2)
{
  return sub_2378A00AC(qword_2689341C8, a2, (void (*)(uint64_t))type metadata accessor for SCSystemCommandsYesNoStrategy);
}

uint64_t sub_23789F680()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A02B8;
  return sub_23789B258();
}

uint64_t sub_23789F718()
{
  return MEMORY[0x263F6FF10];
}

uint64_t sub_23789F728()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A02B8;
  return sub_23789DA84();
}

uint64_t sub_23789F7D0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = type metadata accessor for SCSystemCommandsYesNoStrategy();
  uint64_t v6 = sub_2378A00AC(&qword_268934210, v5, (void (*)(uint64_t))type metadata accessor for SCSystemCommandsYesNoStrategy);
  *uint64_t v3 = v1;
  v3[1] = sub_2378A02B8;
  return MEMORY[0x270F66330](a1, v4, v6);
}

uint64_t sub_23789F8B8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = type metadata accessor for SCSystemCommandsYesNoStrategy();
  uint64_t v6 = sub_2378A00AC(&qword_268934210, v5, (void (*)(uint64_t))type metadata accessor for SCSystemCommandsYesNoStrategy);
  *uint64_t v3 = v1;
  v3[1] = sub_2378A02B8;
  return MEMORY[0x270F66338](a1, v4, v6);
}

uint64_t sub_23789F9A0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = type metadata accessor for SCSystemCommandsYesNoStrategy();
  uint64_t v6 = sub_2378A00AC(&qword_268934210, v5, (void (*)(uint64_t))type metadata accessor for SCSystemCommandsYesNoStrategy);
  *uint64_t v3 = v1;
  v3[1] = sub_2378A02B8;
  return MEMORY[0x270F66340](a1, v4, v6);
}

uint64_t sub_23789FA88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_2378A02B8;
  return MEMORY[0x270F666F0](a1, a2, a3);
}

uint64_t sub_23789FB3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_23789FBF0;
  return MEMORY[0x270F666E8](a1, a2, a3);
}

uint64_t sub_23789FBF0()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_34();
  *int v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_23789FCB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2378A02B8;
  return MEMORY[0x270F666F8](a1, a2, a3, a4);
}

void sub_23789FD78(uint64_t a1, void *a2)
{
  id v3 = (id)sub_2378C92A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserData_, v3);
}

void sub_23789FDF8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_2378C92D0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setButtonsViewStyle_, v4);
}

void sub_23789FE5C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_2378C92D0();
  objc_msgSend(a3, sel_setPrimaryButtonLabel_, v4);
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

void sub_23789FEF8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_2378C92D0();
  objc_msgSend(a3, sel_setSecondaryButtonLabel_, v4);
}

void sub_23789FF50(uint64_t a1, void *a2, uint64_t *a3, SEL *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  id v6 = (id)sub_2378C9380();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, *a4, v6);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2378A0048(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2378A00AC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2378A00F4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SystemCommandsIntent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2378A0150(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_2378A0218(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_16();
  v3();
  return a1;
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

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v31 = v18[39];
  *(void *)(v19 - 152) = v18[36];
  *(void *)(v19 - 144) = v18[33];
  uint64_t v29 = v18[31];
  uint64_t v21 = v18[29];
  *(void *)(v19 - 136) = v18[30];
  uint64_t v22 = v18[23];
  *(void *)(v19 - 88) = v18[24];
  uint64_t v23 = v18[21];
  *(void *)(v19 - 104) = v18[22];
  *(void *)(v19 - 96) = v18[20];
  uint64_t v24 = v18[19];
  *(void *)(v19 - 120) = v18[18];
  *(void *)(v19 - 112) = v24;
  uint64_t v26 = v18[16];
  *(void *)(v19 - 128) = v18[15];
  uint64_t v28 = v18[14];
  uint64_t v27 = v18[13];
  uint64_t v30 = v18[12];
  return MEMORY[0x270F67820](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, v26, v27, a13, v28, v29, v23, v30, a18, v22,
           v31,
           v21);
}

void OUTLINED_FUNCTION_5()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_8()
{
  JUMPOUT(0x237E24570);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_12()
{
  JUMPOUT(0x237E24570);
}

BOOL OUTLINED_FUNCTION_13(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  __swift_project_boxed_opaque_existential_1((void *)(a12 + 16), *(void *)(a12 + 40));
  return sub_2378C8B90();
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  return MEMORY[0x270F67690](a20, v22, a3, v20, 1, 1, v21);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return a13;
}

double OUTLINED_FUNCTION_23()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 72) = 0u;
  *(void *)(v0 + 88) = 0;
  *(_OWORD *)(v0 + 56) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25()
{
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  return sub_2378C8E80();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

_WORD *OUTLINED_FUNCTION_28(_WORD *result)
{
  *double result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return MEMORY[0x270F6AC88](v0);
}

uint64_t OUTLINED_FUNCTION_40()
{
  return *(void *)(v0 - 96);
}

uint64_t OUTLINED_FUNCTION_42(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_47()
{
  return v0;
}

uint64_t *OUTLINED_FUNCTION_48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t *a11)
{
  a11[3] = a1;
  a11[4] = a2;
  return __swift_allocate_boxed_opaque_existential_1(a11);
}

uint64_t OUTLINED_FUNCTION_49()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return *(void *)(v0 - 112);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_57()
{
  return MEMORY[0x270F67798](v0);
}

uint64_t OUTLINED_FUNCTION_58()
{
  return sub_2378C95A0();
}

uint64_t OUTLINED_FUNCTION_59(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  *(_OWORD *)(a1 + 16) = a9;
  *(void *)(a1 + 32) = v9;
  return sub_2378C93B0();
}

uint64_t OUTLINED_FUNCTION_62(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_63()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_67(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_68()
{
  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_69()
{
  return MEMORY[0x270F672B0](v0, v1);
}

uint64_t OUTLINED_FUNCTION_71()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return v0;
}

uint64_t SCSoftwareUpdateFlow.__allocating_init(sharedObjects:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  SCSoftwareUpdateFlow.init(sharedObjects:)(a1);
  return v2;
}

uint64_t SCSoftwareUpdateFlow.init(sharedObjects:)(uint64_t a1)
{
  sub_2378A0150(a1 + 40, v1 + 16);
  sub_2378A0150(a1 + 80, (uint64_t)v4);
  sub_2378A0AE0(a1);
  sub_2378A0B34(v4, v1 + 56);
  return v1;
}

uint64_t sub_2378A0AE0(uint64_t a1)
{
  return a1;
}

uint64_t sub_2378A0B34(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t SCSoftwareUpdateFlow.on(input:)()
{
  return 1;
}

uint64_t SCSoftwareUpdateFlow.execute()()
{
  OUTLINED_FUNCTION_41();
  v1[15] = v2;
  v1[16] = v0;
  sub_2378C8C00();
  v1[17] = swift_task_alloc();
  uint64_t v3 = sub_2378C8DB0();
  v1[18] = v3;
  OUTLINED_FUNCTION_0(v3);
  v1[19] = v4;
  v1[20] = swift_task_alloc();
  uint64_t v5 = sub_2378C9280();
  v1[21] = v5;
  OUTLINED_FUNCTION_0(v5);
  v1[22] = v6;
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  sub_2378C9260();
  v1[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2378A0C8C, 0, 0);
}

uint64_t sub_2378A0C8C()
{
  uint64_t v1 = v0[16];
  type metadata accessor for SystemControlCATPatternsExecutor();
  sub_2378C91C0();
  sub_2378A0150(v1 + 16, (uint64_t)(v0 + 2));
  sub_2378C91A0();
  sub_2378A1400((uint64_t)(v0 + 2));
  sub_2378C91B0();
  swift_release();
  sub_2378C9250();
  uint64_t v2 = sub_2378C91F0();
  v0[26] = v2;
  uint64_t v6 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_268934728 + dword_268934728);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[27] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2378A0DC8;
  uint64_t v4 = v0[16];
  return v6(0, v2, v4);
}

uint64_t sub_2378A0DC8()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  *(void *)(v2 + 224) = v1;
  *(void *)(v2 + 232) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_2378A1158;
  }
  else
  {
    swift_release();
    uint64_t v3 = sub_2378A0EBC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2378A0EBC()
{
  if (qword_268934168 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[22];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_268936078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  uint64_t v5 = sub_2378C9270();
  os_log_type_t v6 = sub_2378C9440();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_237899000, v5, v6, "SCSoftwareUpdateFlow execute | software update pattern successfully executed", v7, 2u);
    MEMORY[0x237E24570](v7, -1, -1);
  }
  uint64_t v8 = v0[24];
  uint64_t v10 = v0[21];
  uint64_t v9 = v0[22];
  uint64_t v12 = v0[19];
  uint64_t v11 = v0[20];
  uint64_t v17 = v0[18];
  uint64_t v13 = v0[16];
  uint64_t v16 = (void *)v0[28];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  sub_2378C8BF0();
  sub_2378C8DA0();
  sub_2378A0150(v13 + 56, (uint64_t)(v0 + 7));
  sub_2378C8D20();
  swift_allocObject();
  sub_2378C8D10();
  sub_2378C8A60();
  swift_allocObject();
  v0[14] = sub_2378C8A50();
  sub_2378C8A70();
  swift_release();
  sub_2378C8CC0();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v17);
  OUTLINED_FUNCTION_3_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_2378A1158()
{
  uint64_t v25 = v0;
  swift_release();
  if (qword_268934168 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[29];
  uint64_t v3 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v4 = v0[21];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_268936078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2378C9270();
  os_log_type_t v9 = sub_2378C9450();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void *)v0[29];
  uint64_t v13 = v0[22];
  uint64_t v12 = v0[23];
  uint64_t v14 = v0[21];
  if (v10)
  {
    uint64_t v23 = v0[23];
    id v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v24 = v16;
    *(_DWORD *)id v15 = 136315138;
    v0[12] = v11;
    id v17 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934C90);
    uint64_t v18 = sub_2378C92F0();
    v0[13] = sub_2378A1964(v18, v19, &v24);
    sub_2378C94B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237899000, v8, v9, "SCSoftwareUpdateFlow execute | error: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237E24570](v16, -1, -1);
    MEMORY[0x237E24570](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v23, v14);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  uint64_t v20 = (void *)v0[29];
  sub_2378C8CD0();

  OUTLINED_FUNCTION_3_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_2378A1400(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934810);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SCSoftwareUpdateFlow.execute(completion:)()
{
  return sub_2378C8A90();
}

uint64_t SCSoftwareUpdateFlow.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t SCSoftwareUpdateFlow.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t sub_2378A1524()
{
  return 1;
}

uint64_t sub_2378A152C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *id v7 = v3;
  v7[1] = sub_2378A15DC;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_2378A15DC()
{
  OUTLINED_FUNCTION_41();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_4();
  uint64_t v5 = *v0;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(v2);
}

uint64_t sub_2378A16B0()
{
  return SCSoftwareUpdateFlow.execute(completion:)();
}

uint64_t sub_2378A16D4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A1770;
  return SCSoftwareUpdateFlow.execute()();
}

uint64_t sub_2378A1770()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2378A183C(uint64_t a1, uint64_t a2)
{
  uint64_t updated = type metadata accessor for SCSoftwareUpdateFlow();
  return MEMORY[0x270F66CE8](updated, a2);
}

uint64_t sub_2378A1878(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2378A1888(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2378A18C4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2378A18EC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2378A1964(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_2378C94B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2378A1964(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2378A1A38(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2378A219C((uint64_t)v12, *a3);
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
      sub_2378A219C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2378A1A38(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2378A1B90((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2378C94C0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_2378A1C68(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_2378C9500();
    if (!v8)
    {
      uint64_t result = sub_2378C9550();
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

void *sub_2378A1B90(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_2378C9570();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_2378A1C68(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2378A1D00(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_2378A1EDC(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_2378A1EDC((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2378A1D00(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_2378C9340();
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
  unint64_t v3 = sub_2378A1E74(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_2378C94E0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_2378C9570();
  __break(1u);
LABEL_14:
  uint64_t result = sub_2378C9550();
  __break(1u);
  return result;
}

void *sub_2378A1E74(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689346C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  long long v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2378A1EDC(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689346C0);
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
    sub_2378A208C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2378A1FB4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2378A1FB4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_2378C9570();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_2378A208C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2378C9570();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_2378A211C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t type metadata accessor for SCSoftwareUpdateFlow()
{
  return self;
}

unint64_t sub_2378A2150()
{
  unint64_t result = qword_2689346A8[0];
  if (!qword_2689346A8[0])
  {
    type metadata accessor for SCSoftwareUpdateFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2689346A8);
  }
  return result;
}

uint64_t sub_2378A219C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_task_dealloc();
}

uint64_t *LocalizationProvider.shared.unsafeMutableAddressor()
{
  if (qword_268934150 != -1) {
    swift_once();
  }
  return &static LocalizationProvider.shared;
}

uint64_t sub_2378A2268()
{
  type metadata accessor for LocalizationProvider();
  uint64_t result = swift_initStaticObject();
  static LocalizationProvider.shared = result;
  return result;
}

uint64_t static LocalizationProvider.shared.getter()
{
  type metadata accessor for LocalizationProvider();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for LocalizationProvider()
{
  return self;
}

uint64_t LocalizationProvider.localizedString(key:table:locale:)(char a1)
{
  uint64_t v17 = sub_2378C8970();
  uint64_t v18 = v2;
  unint64_t v16 = sub_2378A24F0();
  uint64_t v15 = MEMORY[0x263F8D310];
  uint64_t v3 = sub_2378C94D0();
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(self, sel_sharedInstance, v15, v16, v16, v16, 95, 0xE100000000000000, 45, 0xE100000000000000, v17, v18);
  if (v6)
  {
    int64_t v7 = v6;
    BOOL v8 = (a1 & 1) == 0;
    if (a1) {
      uint64_t v9 = 0x80000002378CB050;
    }
    else {
      uint64_t v9 = 0x80000002378CB030;
    }
    if (v8) {
      uint64_t v10 = 0xD000000000000013;
    }
    else {
      uint64_t v10 = 0xD000000000000014;
    }
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v12 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v13 = sub_2378A28B0(v10, v9, 0x736C6562614CLL, 0xE600000000000000, (uint64_t)v12, v3, v5, v7);
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v13;
}

unint64_t LocalizationKey.rawValue.getter(char a1)
{
  if (a1) {
    return 0xD000000000000014;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t LocalizationTable.rawValue.getter()
{
  return 0x736C6562614CLL;
}

unint64_t sub_2378A24F0()
{
  unint64_t result = qword_2689346C8;
  if (!qword_2689346C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689346C8);
  }
  return result;
}

uint64_t LocalizationProvider.deinit()
{
  return v0;
}

uint64_t LocalizationProvider.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_2378A2554(char a1)
{
  return LocalizationProvider.localizedString(key:table:locale:)(a1 & 1);
}

BOOL LocalizationTable.init(rawValue:)()
{
  uint64_t v0 = sub_2378C9580();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_2378A25CC()
{
  return sub_2378C95F0();
}

uint64_t sub_2378A261C()
{
  return sub_2378A26B0();
}

uint64_t sub_2378A262C()
{
  return sub_2378C9310();
}

uint64_t sub_2378A2640()
{
  sub_2378C9310();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2378A26B0()
{
  return sub_2378C95F0();
}

uint64_t sub_2378A2730()
{
  return sub_2378C95F0();
}

BOOL sub_2378A277C@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = LocalizationTable.init(rawValue:)();
  *a1 = result;
  return result;
}

uint64_t sub_2378A27B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LocalizationTable.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriSystemCommandsIntents::LocalizationKey_optional __swiftcall LocalizationKey.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_2378C9580();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.value = SiriSystemCommandsIntents_LocalizationKey_confirmationConfirm;
  }
  else {
    v2.value = SiriSystemCommandsIntents_LocalizationKey_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t sub_2378A2830(char *a1, char *a2)
{
  return sub_2378AB794(*a1, *a2);
}

uint64_t sub_2378A283C()
{
  return sub_2378A261C();
}

uint64_t sub_2378A2844()
{
  return sub_2378A2640();
}

uint64_t sub_2378A284C()
{
  return sub_2378A26B0();
}

SiriSystemCommandsIntents::LocalizationKey_optional sub_2378A2854@<W0>(Swift::String *a1@<X0>, SiriSystemCommandsIntents::LocalizationKey_optional *a2@<X8>)
{
  result.value = LocalizationKey.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

unint64_t sub_2378A2884@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = LocalizationKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2378A28B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v10 = (void *)sub_2378C92D0();
  swift_bridgeObjectRelease();
  size_t v11 = (void *)sub_2378C92D0();
  swift_bridgeObjectRelease();
  id v12 = (void *)sub_2378C92D0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(a8, sel_localizedStringForKey_table_bundle_languageCode_, v10, v11, a5, v12);

  if (!v13) {
    return 0;
  }
  uint64_t v14 = sub_2378C92E0();

  return v14;
}

unint64_t sub_2378A29A8()
{
  unint64_t result = qword_2689346D0;
  if (!qword_2689346D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689346D0);
  }
  return result;
}

unint64_t sub_2378A29F8()
{
  unint64_t result = qword_2689346D8;
  if (!qword_2689346D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689346D8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LocalizationTable(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for LocalizationTable(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2378A2B34);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2378A2B5C()
{
  return 0;
}

ValueMetadata *type metadata accessor for LocalizationTable()
{
  return &type metadata for LocalizationTable;
}

uint64_t getEnumTagSinglePayload for LocalizationKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for LocalizationKey(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2378A2CC8);
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

unsigned char *sub_2378A2CF0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LocalizationKey()
{
  return &type metadata for LocalizationKey;
}

uint64_t type metadata accessor for RestartShutdownCATs()
{
  uint64_t result = qword_2689346E0;
  if (!qword_2689346E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2378A2D54()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2378A2D94()
{
  return OUTLINED_FUNCTION_0_0(27);
}

uint64_t sub_2378A2DB4()
{
  return OUTLINED_FUNCTION_0_0(28);
}

uint64_t sub_2378A2DD4()
{
  return OUTLINED_FUNCTION_0_0(29);
}

uint64_t sub_2378A2DF4()
{
  return OUTLINED_FUNCTION_0_0(28);
}

uint64_t sub_2378A2E14(uint64_t a1)
{
  int v3 = (void *)OUTLINED_FUNCTION_1_0();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = sub_2378A2ED4;
  uint64_t v4 = MEMORY[0x263F8EE78];
  return v6(a1, 0xD00000000000001DLL, 0x80000002378CB6D0, v4);
}

uint64_t sub_2378A2ED4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2378A2FC8(uint64_t a1)
{
  uint64_t v3 = (void *)OUTLINED_FUNCTION_1_0();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2378A3344;
  uint64_t v4 = MEMORY[0x263F8EE78];
  return v6(a1, 0xD00000000000001ELL, 0x80000002378CB6B0, v4);
}

uint64_t sub_2378A3088(uint64_t a1, uint64_t a2)
{
  return sub_2378A30DC(a1, a2);
}

uint64_t sub_2378A30DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2378C9260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934880);
  MEMORY[0x270FA5388](v8 - 8);
  sub_2378A327C(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v10 = sub_2378C91D0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_2378A32E4(a1);
  return v10;
}

uint64_t sub_2378A3244()
{
  uint64_t v0 = sub_2378C9200();
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_2378A3274()
{
  return type metadata accessor for RestartShutdownCATs();
}

uint64_t sub_2378A327C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2378A32E4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934880);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  return MEMORY[0x270F64EB8](a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_task_alloc();
}

uint64_t type metadata accessor for SystemControlCATPatternsExecutor()
{
  uint64_t result = qword_268934700;
  if (!qword_268934700) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2378A33B8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2378A33F8(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a2;
  *(void *)(v3 + 64) = a3;
  *(unsigned char *)(v3 + 112) = a1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_2378A3414);
}

uint64_t sub_2378A3414()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  sub_2378A0150(v1 + 16, v0);
  v2[9] = sub_2378C9230();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934718);
  uint64_t v5 = (__n128 *)swift_allocObject();
  v2[10] = v5;
  uint64_t v6 = OUTLINED_FUNCTION_2_0(v5, (__n128)xmmword_2378CA0F0);
  v6[4].n128_u64[1] = v4;
  v6[5].n128_u64[0] = 0xD000000000000017;
  v6[5].n128_u64[1] = 0x80000002378CB7F0;
  v6[7].n128_u64[1] = MEMORY[0x263F8D4F8];
  v6[6].n128_u8[0] = v3;
  uint64_t v9 = (uint64_t (*)(unint64_t, unint64_t, __n128 *))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v2[11] = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2378A3570;
  return v9(0xD000000000000013, 0x80000002378CB810, v5);
}

uint64_t sub_2378A3570()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  uint64_t v6 = *v2;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v7 = v6;
  *(void *)(v4 + 96) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v4 + 104) = v1;
  }
  OUTLINED_FUNCTION_4_0();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2378A3680(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a2;
  *(void *)(v3 + 64) = a3;
  *(unsigned char *)(v3 + 112) = a1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_2378A369C);
}

uint64_t sub_2378A369C()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  sub_2378A0150(v1 + 16, v0);
  v2[9] = sub_2378C9230();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934718);
  uint64_t v5 = (__n128 *)swift_allocObject();
  v2[10] = v5;
  uint64_t v6 = OUTLINED_FUNCTION_2_0(v5, (__n128)xmmword_2378CA0F0);
  v6[5].n128_u64[1] = 0x80000002378CB7F0;
  v6[7].n128_u64[1] = MEMORY[0x263F8D4F8];
  v6[6].n128_u8[0] = v3;
  uint64_t v10 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F6D050] + MEMORY[0x263F6D050]);
  v5[4].n128_u64[1] = v4;
  v5[5].n128_u64[0] = 0xD000000000000017;
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v2[11] = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2378A37EC;
  uint64_t v8 = OUTLINED_FUNCTION_6_0(0xD00000000000001CLL);
  return v10(v8);
}

uint64_t sub_2378A37EC()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  uint64_t v6 = *v2;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v7 = v6;
  *(void *)(v4 + 96) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v4 + 104) = v1;
  }
  OUTLINED_FUNCTION_4_0();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2378A38FC()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 104);
  return v1(v2);
}

uint64_t sub_2378A396C()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2378A39D8(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return OUTLINED_FUNCTION_1_1((uint64_t)sub_2378A39F4);
}

uint64_t sub_2378A39F4()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934718);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002378CB7F0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2378C9C30;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2378A3B0C;
  uint64_t v5 = OUTLINED_FUNCTION_6_0(0xD000000000000025);
  return v7(v5);
}

uint64_t sub_2378A3B0C()
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  uint64_t v6 = *v2;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v7 = v6;
  *(void *)(v4 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_4_0();
    return MEMORY[0x270FA2498](v8, v9, v10);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = *(uint64_t (**)(uint64_t))(v6 + 8);
    return v11(v1);
  }
}

uint64_t sub_2378A3C2C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2378A3C90(uint64_t a1, uint64_t a2)
{
  return sub_2378A3CE4(a1, a2);
}

uint64_t sub_2378A3CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2378C9260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934880);
  MEMORY[0x270FA5388](v8 - 8);
  sub_2378A327C(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v10 = sub_2378C91D0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_2378A32E4(a1);
  return v10;
}

uint64_t sub_2378A3E4C()
{
  return type metadata accessor for SystemControlCATPatternsExecutor();
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

__n128 *OUTLINED_FUNCTION_2_0(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 0x7453656369766564;
  result[2].n128_u64[1] = 0xEB00000000657461;
  result[3].n128_u64[0] = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_2378C9240();
}

uint64_t OUTLINED_FUNCTION_6_0@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t type metadata accessor for SystemQueryCATs()
{
  uint64_t result = qword_268934730;
  if (!qword_268934730) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2378A3F54()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2378A3F94(uint64_t a1, uint64_t a2)
{
  return sub_2378A3FE8(a1, a2);
}

uint64_t sub_2378A3FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2378C9260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934880);
  MEMORY[0x270FA5388](v8 - 8);
  sub_2378A327C(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v10 = sub_2378C91D0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_2378A32E4(a1);
  return v10;
}

uint64_t sub_2378A4150()
{
  return type metadata accessor for SystemQueryCATs();
}

uint64_t SystemCommandsFlowProvider.__allocating_init(featureFlags:sharedObjects:)(uint64_t a1, const void *a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  memcpy((void *)(v4 + 24), a2, 0x78uLL);
  return v4;
}

uint64_t SystemCommandsFlowProvider.init(featureFlags:sharedObjects:)(uint64_t a1, const void *a2)
{
  *(void *)(v2 + 16) = a1;
  memcpy((void *)(v2 + 24), a2, 0x78uLL);
  return v2;
}

uint64_t SystemCommandsFlowProvider.makeFlowSearchResult(for:)@<X0>(uint64_t a1@<X0>, NSObject *a2@<X8>)
{
  uint64_t v71 = a2;
  uint64_t v3 = type metadata accessor for SystemCommandsIntent();
  MEMORY[0x270FA5388](v3 - 8);
  os_log_type_t v68 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v72 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_10();
  uint64_t v66 = v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v70 = (char *)&v58 - v10;
  uint64_t v11 = sub_2378C8E70();
  OUTLINED_FUNCTION_2();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_10();
  v63 = v15;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  unint64_t v19 = (char *)&v58 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v58 - v20;
  uint64_t v22 = sub_2378C8E30();
  OUTLINED_FUNCTION_2();
  uint64_t v24 = v23;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_10();
  uint64_t v67 = v26;
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)&v58 - v28;
  uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
  uint64_t v69 = a1;
  v65 = v30;
  v30((uint64_t)&v58 - v28, a1, v22);
  if ((*(unsigned int (**)(char *, uint64_t))(v24 + 88))(v29, v22) == *MEMORY[0x263F6FF80])
  {
    uint64_t v31 = *(void (**)(char *, uint64_t))(v24 + 96);
    uint64_t v66 = v22;
    v31(v29, v22);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v21, v29, v11);
    if (qword_268934168 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v5, (uint64_t)qword_268936078);
    uint64_t v32 = v72;
    OUTLINED_FUNCTION_3();
    v33();
    uint64_t v64 = v5;
    uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    char v62 = v21;
    v34(v19, v21, v11);
    uint64_t v35 = sub_2378C9270();
    os_log_type_t v36 = sub_2378C9430();
    os_log_t v61 = v35;
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      uint64_t v74 = v60;
      uint64_t v38 = v37;
      v59 = v37;
      *(_DWORD *)uint64_t v37 = 136315138;
      uint64_t v35 = (v37 + 12);
      uint64_t v58 = v38 + 4;
      v34(v63, v19, v11);
      uint64_t v39 = sub_2378C92F0();
      uint64_t v41 = sub_2378A1964(v39, v40, &v74);
      OUTLINED_FUNCTION_7_1(v41);
      sub_2378C94B0();
      swift_bridgeObjectRelease();
      uint64_t v42 = OUTLINED_FUNCTION_4_1();
      ((void (*)(uint64_t))v35)(v42);
      os_log_t v43 = v61;
      _os_log_impl(&dword_237899000, v61, v36, "SystemCommandsFlowProvider makeFlow | uso parse: %s", v59, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_12();
    }
    else
    {
      uint64_t v55 = OUTLINED_FUNCTION_4_1();
      ((void (*)(uint64_t))v35)(v55);
    }
    (*(void (**)(char *, uint64_t))(v32 + 8))(v70, v64);
    v65(v67, v69, v66);
    uint64_t v56 = (uint64_t)v68;
    sub_2378AAF18();
    sub_2378A483C(v56, v71);
    sub_2378A00F4(v56);
    return ((uint64_t (*)(char *, uint64_t))v35)(v62, v11);
  }
  else
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v5, (uint64_t)qword_268936078);
    uint64_t v44 = v72;
    uint64_t v45 = v66;
    OUTLINED_FUNCTION_3();
    v46();
    uint64_t v47 = v5;
    uint64_t v48 = sub_2378C9270();
    os_log_type_t v49 = sub_2378C9430();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v64 = v47;
      uint64_t v73 = v22;
      uint64_t v74 = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      uint64_t v70 = (char *)(v50 + 4);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268934740);
      uint64_t v52 = sub_2378C92F0();
      uint64_t v54 = sub_2378A1964(v52, v53, &v74);
      OUTLINED_FUNCTION_7_1(v54);
      sub_2378C94B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237899000, v48, v49, "SystemCommandsFlowProvider makeFlow | unable to make flow with parse: %s", v50, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_12();

      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v45, v64);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v45, v47);
    }
    sub_2378C8AD0();
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v29, v22);
  }
}

uint64_t sub_2378A483C@<X0>(uint64_t a1@<X0>, NSObject *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for SystemCommandsIntent();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v64 - v9;
  uint64_t v11 = sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v65 = v12;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v64 - v17;
  sub_2378AB91C();
  if (v19)
  {
    type metadata accessor for SCTakePhotoFlow();
    uint64_t v20 = OUTLINED_FUNCTION_1_2();
    *(unsigned char *)(v20 + 16) = 0;
LABEL_5:
    v67[0] = v20;
    sub_2378A5510((unint64_t *)&qword_268934790, (void (*)(uint64_t))type metadata accessor for SCTakePhotoFlow);
    sub_2378C8A80();
    swift_release();
LABEL_10:
    sub_2378C8AE0();
    return swift_release();
  }
  sub_2378AB928();
  if (v21)
  {
    type metadata accessor for SCTakePhotoFlow();
    uint64_t v20 = OUTLINED_FUNCTION_1_2();
    *(unsigned char *)(v20 + 16) = 1;
    goto LABEL_5;
  }
  v64[1] = a2;
  sub_2378ABCF0();
  if (v22)
  {
    type metadata accessor for SCTakePhotoFlow();
    uint64_t v23 = OUTLINED_FUNCTION_1_2();
    *(unsigned char *)(v23 + 16) = 2;
    v67[0] = v23;
    uint64_t v24 = &qword_268934790;
    uint64_t v25 = type metadata accessor for SCTakePhotoFlow;
LABEL_8:
    sub_2378A5510((unint64_t *)v24, (void (*)(uint64_t))v25);
    sub_2378C8A80();
LABEL_9:
    swift_release();
    goto LABEL_10;
  }
  v64[0] = *(os_log_t *)(v2 + 16);
  uint64_t v27 = sub_2378B2B38();
  sub_2378AB318();
  if (v27)
  {
    if (v28)
    {
      BOOL v29 = sub_2378ABCFC();
      type metadata accessor for SCStartScreenRecordingFlow();
      swift_allocObject();
      v67[0] = SCStartScreenRecordingFlow.init(confirmationRequired:)(v29);
      uint64_t v30 = (unint64_t *)&unk_268934788;
      uint64_t v31 = type metadata accessor for SCStartScreenRecordingFlow;
LABEL_15:
      sub_2378A5510(v30, (void (*)(uint64_t))v31);
      sub_2378C8A80();
      swift_release();
      sub_2378C8AE0();
      return swift_release();
    }
    sub_2378ABEDC();
    if (v33)
    {
      type metadata accessor for SCStopScreenRecordingFlow();
      uint64_t v34 = OUTLINED_FUNCTION_1_2();
      *(unsigned char *)(v34 + 16) = 0;
      v67[0] = v34;
      uint64_t v24 = &qword_268934780;
      uint64_t v25 = type metadata accessor for SCStopScreenRecordingFlow;
      goto LABEL_8;
    }
  }
  else if (v28)
  {
    type metadata accessor for SCInformationalStartScreenRecordingFlow();
    swift_allocObject();
    uint64_t started = SCInformationalStartScreenRecordingFlow.init()();
    OUTLINED_FUNCTION_5_1(started);
    uint64_t v24 = &qword_268934840;
    uint64_t v25 = type metadata accessor for SCInformationalStartScreenRecordingFlow;
    goto LABEL_8;
  }
  sub_2378AB344();
  if (v35)
  {
    id v36 = objc_msgSend(self, sel_sharedService);
    type metadata accessor for SCRestartShutdownFlow();
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 64) = sub_2378A54D0();
    *(void *)(v37 + 72) = &off_26EA87CF8;
    *(void *)(v37 + 40) = v36;
    *(_WORD *)(v37 + 16) = 0;
LABEL_24:
    *(void *)(v37 + 24) = sub_2378C03BC;
    *(void *)(v37 + 32) = 0;
    v67[0] = v37;
    sub_2378A5510(&qword_268934778, (void (*)(uint64_t))type metadata accessor for SCRestartShutdownFlow);
    sub_2378C8A80();
    goto LABEL_9;
  }
  sub_2378AC24C();
  if (v38)
  {
    id v39 = objc_msgSend(self, sel_sharedService);
    type metadata accessor for SCRestartShutdownFlow();
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 64) = sub_2378A54D0();
    *(void *)(v37 + 72) = &off_26EA87CF8;
    *(void *)(v37 + 40) = v39;
    *(_WORD *)(v37 + 16) = 256;
    goto LABEL_24;
  }
  if (sub_2378ACF0C())
  {
    OUTLINED_FUNCTION_8_0();
    type metadata accessor for SCResetFlow();
    swift_allocObject();
    uint64_t v40 = SCResetFlow.init(sharedObjects:)((uint64_t)v67);
    OUTLINED_FUNCTION_5_1(v40);
    uint64_t v24 = &qword_268934768;
    uint64_t v25 = type metadata accessor for SCResetFlow;
    goto LABEL_8;
  }
  if (sub_2378ACF24())
  {
    OUTLINED_FUNCTION_8_0();
    type metadata accessor for SCSoftwareUpdateFlow();
    swift_allocObject();
    uint64_t v41 = SCSoftwareUpdateFlow.init(sharedObjects:)((uint64_t)v67);
    OUTLINED_FUNCTION_5_1(v41);
    uint64_t v24 = (uint64_t *)qword_2689346A8;
    uint64_t v25 = type metadata accessor for SCSoftwareUpdateFlow;
    goto LABEL_8;
  }
  char v42 = sub_2378B2B30();
  unint64_t v43 = 0x268934000uLL;
  if (v42)
  {
    if (sub_2378ACFD8())
    {
      type metadata accessor for SCScreenshotFlow();
      uint64_t v44 = swift_allocObject();
      OUTLINED_FUNCTION_5_1(v44);
      uint64_t v24 = &qword_268934760;
      uint64_t v25 = type metadata accessor for SCScreenshotFlow;
      goto LABEL_8;
    }
    if (sub_2378AD1B8())
    {
      type metadata accessor for SCLockFlow();
      uint64_t v45 = swift_allocObject();
      OUTLINED_FUNCTION_5_1(v45);
      uint64_t v24 = &qword_268934758;
      uint64_t v25 = type metadata accessor for SCLockFlow;
      goto LABEL_8;
    }
    if (qword_268934168 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v11, (uint64_t)qword_268936078);
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_3();
    v46();
    uint64_t v47 = sub_2378C9270();
    os_log_type_t v48 = sub_2378C9430();
    v64[0] = v47;
    os_log_type_t v49 = v47;
    os_log_type_t v50 = v48;
    if (os_log_type_enabled(v49, v48))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl(&dword_237899000, v64[0], v50, "SystemCommandsIntent isGuestMode | Did not find guestUserMode identifier", v51, 2u);
      uint64_t v27 = v65;
      OUTLINED_FUNCTION_12();
    }

    (*(void (**)(char *, uint64_t))(v27 + 8))(v18, v11);
    sub_2378AD564();
    if ((v52 & 1) != 0 && sub_2378A52A0())
    {
      OUTLINED_FUNCTION_8_0();
      sub_2378C8B70();
      type metadata accessor for SCUnlockFlow();
      swift_allocObject();
      uint64_t v53 = sub_2378A55E0(&v66, (uint64_t)v67);
      OUTLINED_FUNCTION_5_1(v53);
      uint64_t v24 = &qword_268934750;
      uint64_t v25 = type metadata accessor for SCUnlockFlow;
      goto LABEL_8;
    }
    sub_2378ADA7C();
    unint64_t v43 = 0x268934000;
    if (v55)
    {
      uint64_t v56 = v54;
      uint64_t v57 = v55;
      OUTLINED_FUNCTION_8_0();
      type metadata accessor for SCSystemQueryFlow();
      swift_allocObject();
      v67[0] = SCSystemQueryFlow.init(systemCategory:sharedObjects:)(v56, v57, (uint64_t)v67);
      uint64_t v30 = (unint64_t *)&qword_268934748;
      uint64_t v31 = type metadata accessor for SCSystemQueryFlow;
      goto LABEL_15;
    }
  }
  if (*(void *)(v43 + 360) != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v11, (uint64_t)qword_268936078);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3();
  v58();
  sub_2378A5410(a1, (uint64_t)v10);
  v59 = sub_2378C9270();
  os_log_type_t v60 = sub_2378C9430();
  if (os_log_type_enabled(v59, v60))
  {
    uint64_t v61 = swift_slowAlloc();
    v67[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v61 = 136315138;
    v64[0] = (os_log_t)(v61 + 4);
    sub_2378A5410((uint64_t)v10, (uint64_t)v8);
    uint64_t v62 = sub_2378C92F0();
    *(void *)&long long v66 = sub_2378A1964(v62, v63, v67);
    sub_2378C94B0();
    swift_bridgeObjectRelease();
    sub_2378A00F4((uint64_t)v10);
    _os_log_impl(&dword_237899000, v59, v60, "SystemCommandsFlowProvider getSupportedFlowFor | no flow found for intent: %s", (uint8_t *)v61, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    (*(void (**)(char *, uint64_t))(v65 + 8))(v16, v11);
  }
  else
  {
    sub_2378A00F4((uint64_t)v10);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v16, v11);
  }
  return sub_2378C8AD0();
}

BOOL sub_2378A52A0()
{
  uint64_t v0 = sub_2378C8D60();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v9[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  sub_2378C8D50();
  char v6 = sub_2378C8B80();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return (v6 & 1) == 0;
}

uint64_t SystemCommandsFlowProvider.deinit()
{
  swift_release();
  sub_2378A0AE0(v0 + 24);
  return v0;
}

uint64_t SystemCommandsFlowProvider.__deallocating_deinit()
{
  swift_release();
  sub_2378A0AE0(v0 + 24);
  return MEMORY[0x270FA0228](v0, 144, 7);
}

uint64_t type metadata accessor for SystemCommandsFlowProvider()
{
  return self;
}

uint64_t sub_2378A5410(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SystemCommandsIntent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2378A5474(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_2378A54D0()
{
  unint64_t result = qword_268934770;
  if (!qword_268934770)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268934770);
  }
  return result;
}

uint64_t sub_2378A5510(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t result)
{
  *(void *)(v1 - 208) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_7_1(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_2378A5474(v0 + 24, v1 - 208);
}

uint64_t sub_2378A55E0(long long *a1, uint64_t a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_input;
  uint64_t v6 = sub_2378C8E00();
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v6);
  sub_2378A0B34(a1, v2 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_aceService);
  sub_2378A0150(a2 + 40, v2 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_deviceState);
  sub_2378A0150(a2 + 80, (uint64_t)v8);
  sub_2378A0AE0(a2);
  sub_2378A0B34(v8, v2 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_outputPublisher);
  return v2;
}

uint64_t sub_2378A5690(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689347F0);
  uint64_t v3 = OUTLINED_FUNCTION_42(v2);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v13 - v7;
  uint64_t v9 = sub_2378C8E00();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v8, a1, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
  sub_2378A6DAC((uint64_t)v8, (uint64_t)v6);
  swift_beginAccess();
  uint64_t v10 = OUTLINED_FUNCTION_8_1();
  sub_2378A6E14(v10, v11);
  swift_endAccess();
  return 1;
}

uint64_t sub_2378A57C0()
{
  return sub_2378C8A90();
}

uint64_t sub_2378A581C()
{
  OUTLINED_FUNCTION_41();
  v1[26] = v2;
  v1[27] = v0;
  uint64_t v3 = sub_2378C8C00();
  OUTLINED_FUNCTION_42(v3);
  v1[28] = OUTLINED_FUNCTION_31();
  uint64_t v4 = sub_2378C8DB0();
  v1[29] = v4;
  OUTLINED_FUNCTION_0(v4);
  v1[30] = v5;
  v1[31] = OUTLINED_FUNCTION_31();
  uint64_t v6 = sub_2378C9280();
  v1[32] = v6;
  OUTLINED_FUNCTION_0(v6);
  v1[33] = v7;
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  uint64_t v8 = sub_2378C9260();
  OUTLINED_FUNCTION_42(v8);
  v1[37] = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2378A593C()
{
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  if (sub_2378C8BB0())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
LABEL_4:
    uint64_t v2 = v0[27];
    type metadata accessor for SystemControlCATPatternsExecutor();
    sub_2378C91C0();
    sub_2378A0150(v2 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_deviceState, (uint64_t)(v0 + 17));
    sub_2378C91A0();
    sub_2378A6E7C((uint64_t)(v0 + 17), &qword_268934810);
    sub_2378C91B0();
    swift_release();
    sub_2378C9250();
    OUTLINED_FUNCTION_8_1();
    v0[38] = sub_2378C91F0();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[39] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_2378A5C84;
    return sub_2378A39D8(0);
  }
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
  char v1 = sub_2378C8BA0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  if (v1) {
    goto LABEL_4;
  }
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[32], (uint64_t)qword_268936078);
  uint64_t v5 = OUTLINED_FUNCTION_6_2();
  v6(v5);
  uint64_t v7 = sub_2378C9270();
  os_log_type_t v8 = sub_2378C9430();
  if (os_log_type_enabled(v7, v8))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_10_0(&dword_237899000, v9, v10, "SCUnlockFlow execute | cannot unlock device on watchOS");
    OUTLINED_FUNCTION_12();
  }
  uint64_t v11 = v0[35];
  uint64_t v12 = v0[32];
  uint64_t v13 = v0[33];

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  swift_retain();
  sub_2378C8D90();
  sub_2378C89D0();
  swift_allocObject();
  v0[24] = sub_2378C89C0();
  sub_2378C8CB0();
  swift_release();
  OUTLINED_FUNCTION_5_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v14();
}

uint64_t sub_2378A5C84()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  *(void *)(v2 + 320) = v1;
  *(void *)(v2 + 328) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_2378A5D74()
{
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[32], (uint64_t)qword_268936078);
  uint64_t v1 = OUTLINED_FUNCTION_6_2();
  v2(v1);
  uint64_t v3 = sub_2378C9270();
  os_log_type_t v4 = sub_2378C9440();
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_10_0(&dword_237899000, v5, v6, "SCUnlockFlow execute | capturing unlock request and throwing usupported dialog");
    OUTLINED_FUNCTION_12();
  }
  uint64_t v7 = v0[36];
  uint64_t v9 = v0[32];
  uint64_t v8 = v0[33];
  uint64_t v11 = v0[30];
  uint64_t v10 = v0[31];
  uint64_t v16 = v0[29];
  uint64_t v12 = v0[27];
  uint64_t v15 = (void *)v0[40];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  sub_2378C8BF0();
  sub_2378C8DA0();
  sub_2378A0150(v12 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_outputPublisher, (uint64_t)(v0 + 12));
  sub_2378C8D20();
  swift_allocObject();
  sub_2378C8D10();
  sub_2378C8A60();
  swift_allocObject();
  v0[25] = sub_2378C8A50();
  OUTLINED_FUNCTION_8_1();
  sub_2378C8A70();
  swift_release();
  sub_2378C8CC0();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v16);
  OUTLINED_FUNCTION_5_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v13();
}

uint64_t sub_2378A5FEC()
{
  uint64_t v24 = v0;
  swift_release();
  if (qword_268934168 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[41];
  uint64_t v3 = v0[33];
  uint64_t v2 = v0[34];
  uint64_t v4 = v0[32];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_268936078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2378C9270();
  os_log_type_t v9 = sub_2378C9450();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void *)v0[41];
  uint64_t v13 = v0[33];
  uint64_t v12 = v0[34];
  uint64_t v14 = v0[32];
  if (v10)
  {
    uint64_t v22 = v0[34];
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315138;
    v0[22] = v11;
    id v16 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934C90);
    uint64_t v17 = sub_2378C92F0();
    v0[23] = sub_2378A1964(v17, v18, &v23);
    sub_2378C94B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237899000, v8, v9, "SCUnlockFlow execute | error: %s", v15, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v22, v14);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  char v19 = (void *)v0[41];
  sub_2378C8CD0();

  OUTLINED_FUNCTION_5_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v20();
}

uint64_t sub_2378A6288()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378A63E0();
}

uint64_t sub_2378A6320()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_34();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v3();
}

uint64_t sub_2378A63E0()
{
  OUTLINED_FUNCTION_41();
  v0[22] = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934320);
  OUTLINED_FUNCTION_42(v2);
  v0[23] = OUTLINED_FUNCTION_31();
  uint64_t v3 = sub_2378C8D30();
  v0[24] = v3;
  OUTLINED_FUNCTION_0(v3);
  v0[25] = v4;
  v0[26] = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2378A6490()
{
  OUTLINED_FUNCTION_41();
  sub_2378C8E40();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6534;
  uint64_t v2 = *(void *)(v0 + 208);
  return MEMORY[0x270F67A20](v2, v0 + 16);
}

uint64_t sub_2378A6534()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v2 + 16;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 224) = v0;
  swift_task_dealloc();
  sub_2378A6E7C(v3, &qword_268934810);
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2378A6628()
{
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v10 = *(void *)(v0 + 192);
  uint64_t v4 = *(uint64_t **)(v0 + 176);
  sub_2378C8E40();
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
  sub_2378C8B90();
  uint64_t v5 = sub_2378C8D00();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v5);
  uint64_t v6 = sub_2378C8E80();
  *(_OWORD *)(v0 + 152) = 0u;
  *(void *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  uint64_t v7 = MEMORY[0x263F6FFF0];
  v4[3] = v6;
  v4[4] = v7;
  __swift_allocate_boxed_opaque_existential_1(v4);
  sub_2378C8C90();
  sub_2378A6E7C(v0 + 136, &qword_268934338);
  sub_2378A6E7C(v3, (uint64_t *)&unk_268934320);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v10);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v8();
}

uint64_t sub_2378A67C0()
{
  OUTLINED_FUNCTION_41();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v0();
}

uint64_t sub_2378A6828()
{
  sub_2378A6E7C(v0 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_input, &qword_2689347F0);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_aceService);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_deviceState);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_outputPublisher);
  return v0;
}

uint64_t sub_2378A6888()
{
  sub_2378A6828();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2378A68E0()
{
  return type metadata accessor for SCUnlockFlow();
}

uint64_t type metadata accessor for SCUnlockFlow()
{
  uint64_t result = qword_2689347A8;
  if (!qword_2689347A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2378A6930()
{
  sub_2378A69CC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2378A69CC()
{
  if (!qword_2689347C8[0])
  {
    sub_2378C8E00();
    unint64_t v0 = sub_2378C9480();
    if (!v1) {
      atomic_store(v0, qword_2689347C8);
    }
  }
}

uint64_t sub_2378A6A24(uint64_t a1)
{
  return 1;
}

uint64_t sub_2378A6A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2378A6AFC;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_2378A6AFC()
{
  OUTLINED_FUNCTION_41();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_4();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_34();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_2378A6BC8()
{
  return sub_2378A57C0();
}

uint64_t sub_2378A6BEC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378A581C();
}

uint64_t sub_2378A6C88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SCUnlockFlow();
  return MEMORY[0x270F66CE8](v3, a2);
}

uint64_t sub_2378A6CC4()
{
  OUTLINED_FUNCTION_41();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378A6288();
}

unint64_t sub_2378A6D5C()
{
  unint64_t result = qword_268934750;
  if (!qword_268934750)
  {
    type metadata accessor for SCUnlockFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934750);
  }
  return result;
}

uint64_t sub_2378A6DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689347F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2378A6E14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689347F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2378A6E7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return v0;
}

void OUTLINED_FUNCTION_10_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t SCResetFlow.__allocating_init(sharedObjects:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  SCResetFlow.init(sharedObjects:)(a1);
  return v2;
}

uint64_t SCResetFlow.init(sharedObjects:)(uint64_t a1)
{
  sub_2378A0150(a1 + 40, v1 + 16);
  sub_2378A0150(a1 + 80, (uint64_t)v4);
  sub_2378A0AE0(a1);
  sub_2378A0B34(v4, v1 + 56);
  return v1;
}

uint64_t SCResetFlow.on(input:)()
{
  return 1;
}

uint64_t SCResetFlow.execute()()
{
  OUTLINED_FUNCTION_41();
  v1[15] = v2;
  v1[16] = v0;
  sub_2378C8C00();
  v1[17] = swift_task_alloc();
  uint64_t v3 = sub_2378C8DB0();
  v1[18] = v3;
  OUTLINED_FUNCTION_0(v3);
  v1[19] = v4;
  v1[20] = swift_task_alloc();
  uint64_t v5 = sub_2378C9280();
  v1[21] = v5;
  OUTLINED_FUNCTION_0(v5);
  v1[22] = v6;
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  sub_2378C9260();
  v1[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2378A7124, 0, 0);
}

uint64_t sub_2378A7124()
{
  uint64_t v1 = v0[16];
  type metadata accessor for SystemControlCATPatternsExecutor();
  sub_2378C91C0();
  sub_2378A0150(v1 + 16, (uint64_t)(v0 + 2));
  sub_2378C91A0();
  sub_2378A1400((uint64_t)(v0 + 2));
  sub_2378C91B0();
  swift_release();
  sub_2378C9250();
  uint64_t v2 = sub_2378C91F0();
  v0[26] = v2;
  uint64_t v6 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_268934720 + dword_268934720);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[27] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2378A7260;
  uint64_t v4 = v0[16];
  return v6(0, v2, v4);
}

uint64_t sub_2378A7260()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  *(void *)(v2 + 224) = v1;
  *(void *)(v2 + 232) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_2378A75F0;
  }
  else
  {
    swift_release();
    uint64_t v3 = sub_2378A7354;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2378A7354()
{
  if (qword_268934168 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[22];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_268936078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  uint64_t v5 = sub_2378C9270();
  os_log_type_t v6 = sub_2378C9440();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_237899000, v5, v6, "SCResetFlow execute | reset pattern successfully executed", v7, 2u);
    MEMORY[0x237E24570](v7, -1, -1);
  }
  uint64_t v8 = v0[24];
  uint64_t v10 = v0[21];
  uint64_t v9 = v0[22];
  uint64_t v12 = v0[19];
  uint64_t v11 = v0[20];
  uint64_t v17 = v0[18];
  uint64_t v13 = v0[16];
  id v16 = (void *)v0[28];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  sub_2378C8BF0();
  sub_2378C8DA0();
  sub_2378A0150(v13 + 56, (uint64_t)(v0 + 7));
  sub_2378C8D20();
  swift_allocObject();
  sub_2378C8D10();
  sub_2378C8A60();
  swift_allocObject();
  v0[14] = sub_2378C8A50();
  sub_2378C8A70();
  swift_release();
  sub_2378C8CC0();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v17);
  OUTLINED_FUNCTION_3_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_2378A75F0()
{
  uint64_t v25 = v0;
  swift_release();
  if (qword_268934168 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[29];
  uint64_t v3 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v4 = v0[21];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_268936078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2378C9270();
  os_log_type_t v9 = sub_2378C9450();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void *)v0[29];
  uint64_t v13 = v0[22];
  uint64_t v12 = v0[23];
  uint64_t v14 = v0[21];
  if (v10)
  {
    uint64_t v23 = v0[23];
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v24 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    v0[12] = v11;
    id v17 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934C90);
    uint64_t v18 = sub_2378C92F0();
    v0[13] = sub_2378A1964(v18, v19, &v24);
    sub_2378C94B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237899000, v8, v9, "SCResetFlow execute | error: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237E24570](v16, -1, -1);
    MEMORY[0x237E24570](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v23, v14);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  uint64_t v20 = (void *)v0[29];
  sub_2378C8CD0();

  OUTLINED_FUNCTION_3_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t SCResetFlow.execute(completion:)()
{
  return sub_2378C8A90();
}

uint64_t SCResetFlow.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t SCResetFlow.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t sub_2378A795C()
{
  return SCResetFlow.execute(completion:)();
}

uint64_t sub_2378A7980()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A1770;
  return SCResetFlow.execute()();
}

uint64_t sub_2378A7A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SCResetFlow();
  return MEMORY[0x270F66CE8](v3, a2);
}

uint64_t type metadata accessor for SCResetFlow()
{
  return self;
}

unint64_t sub_2378A7A78()
{
  unint64_t result = qword_268934768;
  if (!qword_268934768)
  {
    type metadata accessor for SCResetFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934768);
  }
  return result;
}

uint64_t SCInformationalStartScreenRecordingFlow.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  SCInformationalStartScreenRecordingFlow.init()();
  return v0;
}

uint64_t SCInformationalStartScreenRecordingFlow.init()()
{
  uint64_t v1 = sub_2378C9260();
  uint64_t v2 = OUTLINED_FUNCTION_42(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_5_3();
  *(unsigned char *)(v0 + 16) = 0;
  type metadata accessor for ScreenRecordingCATs();
  sub_2378C9250();
  sub_2378C91C0();
  sub_2378C8E40();
  sub_2378C91A0();
  sub_2378A6E7C((uint64_t)v4, &qword_268934810);
  sub_2378C91B0();
  swift_release();
  OUTLINED_FUNCTION_8_2();
  *(void *)(v0 + 24) = sub_2378C91F0();
  return v0;
}

uint64_t SCInformationalStartScreenRecordingFlow.on(input:)()
{
  return 1;
}

uint64_t SCInformationalStartScreenRecordingFlow.execute()()
{
  OUTLINED_FUNCTION_41();
  v1[10] = v2;
  v1[11] = v0;
  uint64_t v3 = sub_2378C9280();
  v1[12] = v3;
  OUTLINED_FUNCTION_0(v3);
  v1[13] = v4;
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2378A7C88()
{
  uint64_t v42 = v0;
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  OUTLINED_FUNCTION_8_2();
  char v1 = sub_2378C8BC0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v1)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v3 = *(void *)(v0 + 104);
    uint64_t v2 = *(void *)(v0 + 112);
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_268936078);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
    uint64_t v6 = sub_2378C9270();
    os_log_type_t v7 = sub_2378C9430();
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_12_0(&dword_237899000, v8, v9, "SCInformationalStartScreenRecordingFlow execute | cannot screen record on watchOS");
      OUTLINED_FUNCTION_7_2();
    }
    uint64_t v10 = *(void *)(v0 + 88);

    uint64_t v11 = OUTLINED_FUNCTION_8_2();
    v12(v11);
    *(unsigned char *)(v10 + 16) = 2;
    swift_retain();
    sub_2378C8D90();
    sub_2378C89D0();
    swift_allocObject();
    *(void *)(v0 + 72) = sub_2378C89C0();
LABEL_17:
    sub_2378C8CB0();
    swift_release();
    goto LABEL_20;
  }
  uint64_t v13 = *(void *)(v0 + 88);
  if (!*(unsigned char *)(v13 + 16))
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v28 = *(void *)(v0 + 128);
    uint64_t v30 = *(void *)(v0 + 96);
    uint64_t v29 = *(void *)(v0 + 104);
    uint64_t v31 = __swift_project_value_buffer(v30, (uint64_t)qword_268936078);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v28, v31, v30);
    uint64_t v32 = sub_2378C9270();
    os_log_type_t v33 = sub_2378C9430();
    if (os_log_type_enabled(v32, v33))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_12_0(&dword_237899000, v34, v35, "SCInformationalStartScreenRecordingFlow execute");
      OUTLINED_FUNCTION_7_2();
    }

    uint64_t v36 = OUTLINED_FUNCTION_8_2();
    v37(v36);
    swift_retain();
    sub_2378C8D90();
    sub_2378C89D0();
    swift_allocObject();
    *(void *)(v0 + 64) = sub_2378C89C0();
    goto LABEL_17;
  }
  if (qword_268934168 != -1) {
    swift_once();
  }
  uint64_t v14 = *(void *)(v0 + 120);
  uint64_t v16 = *(void *)(v0 + 96);
  uint64_t v15 = *(void *)(v0 + 104);
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_268936078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v14, v17, v16);
  swift_retain_n();
  uint64_t v18 = sub_2378C9270();
  os_log_type_t v19 = sub_2378C9430();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v21 = *(void *)(v0 + 120);
  uint64_t v22 = *(void *)(v0 + 96);
  uint64_t v23 = *(void *)(v0 + 104);
  if (v20)
  {
    uint64_t v40 = *(void *)(v0 + 120);
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v41[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    *(unsigned char *)(v0 + 136) = *(unsigned char *)(v13 + 16);
    uint64_t v26 = sub_2378C92F0();
    *(void *)(v0 + 56) = sub_2378A1964(v26, v27, v41);
    sub_2378C94B0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237899000, v18, v19, "SCInformationalStartScreenRecordingFlow execute | flow completed with state: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237E24570](v25, -1, -1);
    MEMORY[0x237E24570](v24, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v40, v22);
  }
  else
  {

    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
  }
  sub_2378C8CD0();
LABEL_20:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v38();
}

uint64_t sub_2378A81D8()
{
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A946C;
  return sub_2378A8B58();
}

uint64_t sub_2378A8270()
{
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378A8368();
}

uint64_t SCInformationalStartScreenRecordingFlow.execute(completion:)()
{
  return sub_2378C8A90();
}

uint64_t sub_2378A8368()
{
  OUTLINED_FUNCTION_41();
  v1[17] = v2;
  v1[18] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934320);
  OUTLINED_FUNCTION_42(v3);
  v1[19] = OUTLINED_FUNCTION_31();
  uint64_t v4 = sub_2378C8D30();
  v1[20] = v4;
  OUTLINED_FUNCTION_0(v4);
  v1[21] = v5;
  v1[22] = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_2378A8418()
{
  OUTLINED_FUNCTION_41();
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A84B0;
  return sub_2378BFEFC();
}

uint64_t sub_2378A84B0()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v3 = v2;
  *(void *)(v4 + 192) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2378A8590()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v9 = *(void *)(v0 + 176);
  uint64_t v10 = *(void *)(v0 + 160);
  uint64_t v3 = *(uint64_t **)(v0 + 136);
  sub_2378C8E40();
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), *(void *)(v0 + 80));
  sub_2378C8B90();
  sub_2378A8794();
  uint64_t v4 = sub_2378C8D00();
  uint64_t v5 = OUTLINED_FUNCTION_11_0(v4);
  *(_OWORD *)(v0 + 112) = 0u;
  *(void *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 96) = 0u;
  uint64_t v6 = MEMORY[0x263F6FFF0];
  v3[3] = v5;
  v3[4] = v6;
  __swift_allocate_boxed_opaque_existential_1(v3);
  sub_2378C8C60();
  swift_bridgeObjectRelease();
  sub_2378A6E7C(v0 + 96, &qword_268934338);
  sub_2378A6E7C(v2, (uint64_t *)&unk_268934320);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v9, v10);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2378A872C()
{
  OUTLINED_FUNCTION_41();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v0();
}

uint64_t sub_2378A8794()
{
  uint64_t v1 = sub_2378C9280();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_5_3();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934880);
  uint64_t v4 = OUTLINED_FUNCTION_42(v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934300);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2378BFE38();
  uint64_t v10 = sub_2378C9600();
  uint64_t v12 = v11;
  sub_2378A6E7C((uint64_t)v9, &qword_268934300);
  if (v12)
  {
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64FC0]), sel_init);
    sub_2378C8950();
    uint64_t v14 = sub_2378C8960();
    uint64_t v15 = 0;
    if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v14) != 1)
    {
      uint64_t v15 = (void *)sub_2378C8940();
      (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v6, v14);
    }
    objc_msgSend(v13, sel_setRef_, v15);

    id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64F08]), sel_init);
    sub_2378A9390(v10, v12, v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934890);
    uint64_t v17 = swift_allocObject();
    long long v27 = xmmword_2378C9C40;
    *(_OWORD *)(v17 + 16) = xmmword_2378C9C40;
    *(void *)(v17 + 32) = v13;
    uint64_t v28 = v17;
    sub_2378C93B0();
    uint64_t v18 = v28;
    id v19 = v13;
    sub_2378A93F4(v18, v16);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = v27;
    *(void *)(v20 + 32) = v16;
    uint64_t v28 = v20;
    sub_2378C93B0();
    uint64_t v21 = v28;
  }
  else
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v1, (uint64_t)qword_268936078);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v22, v1);
    uint64_t v23 = sub_2378C9270();
    os_log_type_t v24 = sub_2378C9450();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_237899000, v23, v24, "Failed to localize button label.", v25, 2u);
      OUTLINED_FUNCTION_7_2();
    }

    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
    return MEMORY[0x263F8EE78];
  }
  return v21;
}

uint64_t sub_2378A8B58()
{
  OUTLINED_FUNCTION_41();
  v0[22] = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934320);
  OUTLINED_FUNCTION_42(v2);
  v0[23] = OUTLINED_FUNCTION_31();
  uint64_t v3 = sub_2378C8D30();
  v0[24] = v3;
  OUTLINED_FUNCTION_0(v3);
  v0[25] = v4;
  v0[26] = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2378A8C08()
{
  OUTLINED_FUNCTION_41();
  sub_2378C8E40();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A8CAC;
  uint64_t v2 = *(void *)(v0 + 208);
  return MEMORY[0x270F67A20](v2, v0 + 16);
}

uint64_t sub_2378A8CAC()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v2 + 16;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 224) = v0;
  swift_task_dealloc();
  sub_2378A6E7C(v3, &qword_268934810);
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2378A8DA0()
{
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v10 = *(void *)(v0 + 192);
  uint64_t v4 = *(uint64_t **)(v0 + 176);
  sub_2378C8E40();
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
  sub_2378C8B90();
  uint64_t v5 = sub_2378C8D00();
  uint64_t v6 = OUTLINED_FUNCTION_11_0(v5);
  *(_OWORD *)(v0 + 152) = 0u;
  *(void *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  uint64_t v7 = MEMORY[0x263F6FFF0];
  v4[3] = v6;
  v4[4] = v7;
  __swift_allocate_boxed_opaque_existential_1(v4);
  sub_2378C8C90();
  sub_2378A6E7C(v0 + 136, &qword_268934338);
  sub_2378A6E7C(v3, (uint64_t *)&unk_268934320);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v10);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t SCInformationalStartScreenRecordingFlow.deinit()
{
  swift_release();
  return v0;
}

uint64_t SCInformationalStartScreenRecordingFlow.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_2378A8F7C()
{
  return SCInformationalStartScreenRecordingFlow.execute(completion:)();
}

uint64_t sub_2378A8FA0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return SCInformationalStartScreenRecordingFlow.execute()();
}

uint64_t sub_2378A903C(uint64_t a1, uint64_t a2)
{
  uint64_t started = type metadata accessor for SCInformationalStartScreenRecordingFlow();
  return MEMORY[0x270F66CE8](started, a2);
}

uint64_t sub_2378A9074()
{
  OUTLINED_FUNCTION_41();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378A8270();
}

uint64_t sub_2378A910C()
{
  OUTLINED_FUNCTION_41();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A946C;
  return sub_2378A81D8();
}

uint64_t type metadata accessor for SCInformationalStartScreenRecordingFlow()
{
  return self;
}

unint64_t sub_2378A91C8()
{
  unint64_t result = qword_268934840[0];
  if (!qword_268934840[0])
  {
    type metadata accessor for SCInformationalStartScreenRecordingFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268934840);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SCInformationalStartScreenRecordingFlow.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x2378A92E0);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SCInformationalStartScreenRecordingFlow.State()
{
  return &type metadata for SCInformationalStartScreenRecordingFlow.State;
}

unint64_t sub_2378A931C()
{
  unint64_t result = qword_268934878;
  if (!qword_268934878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934878);
  }
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void sub_2378A9390(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_2378C92D0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setText_, v4);
}

void sub_2378A93F4(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689342E8);
  id v3 = (id)sub_2378C9380();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setCommands_, v3);
}

void OUTLINED_FUNCTION_7_2()
{
  JUMPOUT(0x237E24570);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_2378C8E80();
}

void OUTLINED_FUNCTION_12_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

id sub_2378A9508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_2378A984C(a1, a2, v14, (SEL *)&selRef_setLabel_);
  sub_2378A984C(a3, a4, v14, (SEL *)&selRef_setType_);
  sub_2378A984C(a5, a6, v14, (SEL *)&selRef_setIconType_);
  sub_2378A93F4(a7, v14);

  return v14;
}

id sub_2378A95D4(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v6 = sub_2378A9784(a2);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689342E8);
    sub_2378C9380();
    uint64_t v6 = OUTLINED_FUNCTION_1_3();
  }
  else
  {
    uint64_t v2 = 0;
  }
  OUTLINED_FUNCTION_0_2(v6, sel_setConfirmCommands_);

  uint64_t v7 = sub_2378A9784(a1);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689342E8);
    sub_2378C9380();
    uint64_t v7 = OUTLINED_FUNCTION_1_3();
  }
  else
  {
    uint64_t v2 = 0;
  }
  OUTLINED_FUNCTION_0_2(v7, sel_setDenyCommands_);

  uint64_t v8 = sub_2378A97E8(a2);
  if (v9)
  {
    sub_2378C92D0();
    uint64_t v8 = OUTLINED_FUNCTION_1_3();
  }
  else
  {
    uint64_t v2 = 0;
  }
  OUTLINED_FUNCTION_0_2(v8, sel_setConfirmText_);

  uint64_t v10 = sub_2378A97E8(a1);
  if (v11)
  {
    sub_2378C92D0();
    uint64_t v10 = OUTLINED_FUNCTION_1_3();
  }
  else
  {
    uint64_t v2 = 0;
  }
  OUTLINED_FUNCTION_0_2(v10, sel_setDenyText_);

  uint64_t v12 = sub_2378C92E0();
  sub_2378A984C(v12, v13, v5, (SEL *)&selRef_setCancelTrigger_);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934890);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2378CA4B0;
  *(void *)(v14 + 32) = a1;
  *(void *)(v14 + 40) = a2;
  uint64_t v16 = v14;
  sub_2378C93B0();
  sub_2378A98B8(v16, v5);

  return v5;
}

uint64_t sub_2378A9784(void *a1)
{
  id v1 = objc_msgSend(a1, sel_commands);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689342E8);
  uint64_t v3 = sub_2378C9390();

  return v3;
}

uint64_t sub_2378A97E8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_label);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_2378C92E0();

  return v3;
}

void sub_2378A984C(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6 = (id)sub_2378C92D0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

void sub_2378A98B8(uint64_t a1, void *a2)
{
  sub_2378A992C();
  id v3 = (id)sub_2378C9380();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setAllConfirmationOptions_, v3);
}

unint64_t sub_2378A992C()
{
  unint64_t result = qword_2689342F0;
  if (!qword_2689342F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2689342F0);
  }
  return result;
}

id OUTLINED_FUNCTION_0_2(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SystemControlCATs()
{
  uint64_t result = qword_268934898;
  if (!qword_268934898) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2378A99E4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2378A9A24(uint64_t a1, uint64_t a2)
{
  return sub_2378A9A78(a1, a2);
}

uint64_t sub_2378A9A78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2378C9260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934880);
  MEMORY[0x270FA5388](v8 - 8);
  sub_2378A327C(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v10 = sub_2378C91D0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_2378A32E4(a1);
  return v10;
}

uint64_t sub_2378A9BE0()
{
  return type metadata accessor for SystemControlCATs();
}

uint64_t sub_2378A9BE8@<X0>(uint64_t a1@<X8>)
{
  sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v40 = v2;
  uint64_t v41 = v1;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_3_2(v3, v38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689348A8);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_27();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_2378C8EB0();
  OUTLINED_FUNCTION_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_27();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_2378C8E70();
  OUTLINED_FUNCTION_2();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_27();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = sub_2378C8E30();
  OUTLINED_FUNCTION_2();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_27();
  uint64_t v24 = v23 - v22;
  OUTLINED_FUNCTION_3();
  v25();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v21 + 88))(v24, v19) == *MEMORY[0x263F6FF80])
  {
    (*(void (**)(uint64_t, uint64_t))(v21 + 96))(v24, v19);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v18, v24, v13);
    sub_2378C8E60();
    uint64_t v26 = sub_2378C8EA0();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v7);
    sub_2378AE154(v26, v6);
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_2378C8F40();
    if (__swift_getEnumTagSinglePayload(v6, 1, v27) == 1)
    {
      sub_2378AA5A0(v6);
      if (qword_268934168 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v41, (uint64_t)qword_268936078);
      OUTLINED_FUNCTION_3();
      v28();
      uint64_t v29 = sub_2378C9270();
      os_log_type_t v30 = sub_2378C9460();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)OUTLINED_FUNCTION_29();
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl(&dword_237899000, v29, v30, "Parse-Extension#firstUserDialogAct No user dialog act found in userParse.", v31, 2u);
        OUTLINED_FUNCTION_12();
      }

      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
      OUTLINED_FUNCTION_4_3();
      v32();
      uint64_t v33 = a1;
      uint64_t v34 = 1;
    }
    else
    {
      OUTLINED_FUNCTION_4_3();
      v37();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32))(a1, v6, v27);
      uint64_t v33 = a1;
      uint64_t v34 = 0;
    }
    return __swift_storeEnumTagSinglePayload(v33, v34, 1, v27);
  }
  else
  {
    uint64_t v35 = sub_2378C8F40();
    __swift_storeEnumTagSinglePayload(a1, 1, 1, v35);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v24, v19);
  }
}

uint64_t sub_2378AA018()
{
  sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v46 = v1;
  uint64_t v47 = v0;
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v43 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348A8);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_27();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_2378C8F40();
  OUTLINED_FUNCTION_2();
  uint64_t v45 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_3_2(v15, v43);
  uint64_t v16 = sub_2378C8E30();
  OUTLINED_FUNCTION_2();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_27();
  uint64_t v22 = v21 - v20;
  OUTLINED_FUNCTION_3();
  v23();
  uint64_t v24 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v22, v16) != *MEMORY[0x263F6FF80]) {
    goto LABEL_10;
  }
  sub_2378A9BE8(v11);
  if (__swift_getEnumTagSinglePayload(v11, 1, v12) == 1)
  {
    sub_2378AA5A0(v11);
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v25 = v47;
    __swift_project_value_buffer(v47, (uint64_t)qword_268936078);
    uint64_t v26 = v46;
    OUTLINED_FUNCTION_3();
    v27();
    uint64_t v28 = sub_2378C9270();
    os_log_type_t v29 = sub_2378C9460();
    if (os_log_type_enabled(v28, v29))
    {
      os_log_type_t v30 = (uint8_t *)OUTLINED_FUNCTION_29();
      *(_WORD *)os_log_type_t v30 = 0;
      _os_log_impl(&dword_237899000, v28, v29, "Parse-Extension#firstUsoTask No user dialog act found in userParse.", v30, 2u);
      OUTLINED_FUNCTION_12();
    }

    (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v25);
LABEL_9:
    uint64_t v24 = 0;
    goto LABEL_10;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32))(v44, v11, v12);
  unint64_t v31 = sub_2378C8FA0();
  uint64_t v33 = v31;
  uint64_t v35 = v46;
  uint64_t v34 = v47;
  if (v31 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_2378C9560();
    swift_bridgeObjectRelease();
    if (v37) {
      goto LABEL_13;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    if (qword_268934168 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v34, (uint64_t)qword_268936078);
    OUTLINED_FUNCTION_3();
    v38();
    uint64_t v39 = sub_2378C9270();
    os_log_type_t v40 = sub_2378C9460();
    if (os_log_type_enabled(v39, v40))
    {
      *(_WORD *)OUTLINED_FUNCTION_29() = 0;
      OUTLINED_FUNCTION_7_3(&dword_237899000, v41, v42, "Parse-Extension#firstUsoTask No tasks found in input");
      OUTLINED_FUNCTION_12();
    }

    (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v34);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v12);
    goto LABEL_9;
  }
  if (!*(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_17;
  }
LABEL_13:
  sub_2378B2284(0, (v33 & 0xC000000000000001) == 0, v33);
  if ((v33 & 0xC000000000000001) != 0)
  {
    uint64_t v24 = MEMORY[0x237E23F90](0, v33);
  }
  else
  {
    uint64_t v24 = *(void *)(v33 + 32);
    swift_retain();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_3();
  v36();
LABEL_10:
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v22, v16);
  return v24;
}

uint64_t sub_2378AA5A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void OUTLINED_FUNCTION_3_2(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 120) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_7_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t *sub_2378AA64C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_2378C8F40();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348A8);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_2378AA774(uint64_t a1)
{
  uint64_t v2 = sub_2378C8F40();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  return swift_release();
}

char *sub_2378AA808(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_2378C8F40();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348A8);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_retain();
  return a1;
}

char *sub_2378AA8E4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_2378C8F40();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348A8);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_2378AAA54(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_2378C8F40();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348A8);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_2378AAB2C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_2378C8F40();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348A8);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_release();
  return a1;
}

uint64_t sub_2378AAC94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2378AACA8);
}

uint64_t sub_2378AACA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689348A8);
  OUTLINED_FUNCTION_20_0();
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
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_2378AAD44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2378AAD58);
}

void sub_2378AAD58(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689348A8);
  OUTLINED_FUNCTION_20_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
}

uint64_t type metadata accessor for SystemCommandsIntent()
{
  uint64_t result = qword_2689348B0;
  if (!qword_2689348B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2378AAE2C()
{
  sub_2378AAEC0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2378AAEC0()
{
  if (!qword_2689348C0)
  {
    sub_2378C8F40();
    unint64_t v0 = sub_2378C9480();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2689348C0);
    }
  }
}

void sub_2378AAF18()
{
  OUTLINED_FUNCTION_10_1();
  uint64_t v2 = v1;
  uint64_t v34 = v3;
  uint64_t v4 = sub_2378C8E30();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_10();
  uint64_t v33 = v8;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_2();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_10();
  os_log_type_t v32 = v14;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v15);
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v10, (uint64_t)qword_268936078);
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_3();
  v16();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v17(v0, v2, v4);
  uint64_t v18 = v12;
  uint64_t v19 = sub_2378C9270();
  os_log_type_t v20 = sub_2378C9430();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)OUTLINED_FUNCTION_30_0();
    uint64_t v35 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315138;
    v17(v33, v0, v4);
    uint64_t v22 = sub_2378C92F0();
    sub_2378A1964(v22, v23, &v35);
    sub_2378C94B0();
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void (**)(void))(v6 + 8);
    OUTLINED_FUNCTION_30();
    v24();
    _os_log_impl(&dword_237899000, v19, v20, "SystemCommandsIntent init | parse: %s", v21, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    uint64_t v25 = *(void (**)(void))(v18 + 8);
    OUTLINED_FUNCTION_30();
    v25();
  }
  else
  {
    uint64_t v24 = *(void (**)(void))(v6 + 8);
    OUTLINED_FUNCTION_30();
    v24();

    uint64_t v25 = *(void (**)(void))(v18 + 8);
    OUTLINED_FUNCTION_30();
    v25();
  }
  sub_2378A9BE8(v34);
  uint64_t v26 = sub_2378AA018();
  if (v26)
  {
    uint64_t v27 = v26;
    OUTLINED_FUNCTION_30();
    v24();
  }
  else
  {
    OUTLINED_FUNCTION_3();
    v28();
    os_log_type_t v29 = sub_2378C9270();
    os_log_type_t v30 = sub_2378C9440();
    if (OUTLINED_FUNCTION_13(v30))
    {
      unint64_t v31 = (uint8_t *)OUTLINED_FUNCTION_29();
      *(_WORD *)unint64_t v31 = 0;
      _os_log_impl(&dword_237899000, v29, v32, "No tasks found in usoTasks input, might be a confirmation response.", v31, 2u);
      OUTLINED_FUNCTION_12();
    }

    OUTLINED_FUNCTION_30();
    v24();
    OUTLINED_FUNCTION_30();
    v25();
    uint64_t v27 = 0;
  }
  *(void *)(v34 + *(int *)(type metadata accessor for SystemCommandsIntent() + 20)) = v27;
  OUTLINED_FUNCTION_9_0();
}

void sub_2378AB318()
{
}

void sub_2378AB344()
{
  OUTLINED_FUNCTION_10_1();
  uint64_t v1 = sub_2378C90E0();
  OUTLINED_FUNCTION_2();
  uint64_t v30 = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_27();
  v29[1] = v5 - v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348E0);
  OUTLINED_FUNCTION_42_0();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348E8);
  uint64_t v11 = OUTLINED_FUNCTION_42(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_40_0();
  uint64_t v14 = v12 - v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)v29 - v17;
  type metadata accessor for SystemCommandsIntent();
  sub_2378C9080();
  if (v32)
  {
    sub_2378C9130();
    if (OUTLINED_FUNCTION_5_4()) {
      goto LABEL_12;
    }
  }
  else
  {
    sub_2378B1740((uint64_t)v31, &qword_2689348D0);
  }
  sub_2378C9080();
  if (!v32)
  {
    uint64_t v21 = &qword_2689348D0;
    uint64_t v22 = v31;
    goto LABEL_23;
  }
  sub_2378C90A0();
  if (OUTLINED_FUNCTION_5_4())
  {
    swift_retain();
    sub_2378C9140();
    swift_release();
    uint64_t v19 = v31[0];
    swift_release();
    if (!v19)
    {
LABEL_12:
      swift_release();
      goto LABEL_24;
    }
    swift_retain();
    sub_2378C9140();
    swift_release();
    if (v31[0] && (uint64_t v20 = sub_2378C9030(), swift_release(), v20))
    {
      sub_2378C90D0();
      swift_release();
    }
    else
    {
      OUTLINED_FUNCTION_17_0((uint64_t)v18);
    }
    uint64_t v23 = v30;
    OUTLINED_FUNCTION_16_0();
    v24();
    __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
    uint64_t v25 = (uint64_t)&v9[*(int *)(v6 + 48)];
    sub_2378AE6E0((uint64_t)v18, (uint64_t)v9);
    sub_2378AE6E0(v0, v25);
    OUTLINED_FUNCTION_4_4((uint64_t)v9);
    if (v26)
    {
      swift_release();
      sub_2378B1740(v0, &qword_2689348E8);
      sub_2378B1740((uint64_t)v18, &qword_2689348E8);
      OUTLINED_FUNCTION_4_4(v25);
      if (v26)
      {
        sub_2378B1740((uint64_t)v9, &qword_2689348E8);
        goto LABEL_24;
      }
    }
    else
    {
      sub_2378AE6E0((uint64_t)v9, v14);
      OUTLINED_FUNCTION_4_4(v25);
      if (!v26)
      {
        OUTLINED_FUNCTION_15_0();
        v27();
        sub_2378AE748(&qword_2689348F0, MEMORY[0x263F730A8]);
        sub_2378C92C0();
        swift_release();
        uint64_t v28 = *(void (**)(void))(v23 + 8);
        OUTLINED_FUNCTION_21_0();
        v28();
        sub_2378B1740(v0, &qword_2689348E8);
        sub_2378B1740((uint64_t)v18, &qword_2689348E8);
        OUTLINED_FUNCTION_21_0();
        v28();
        sub_2378B1740((uint64_t)v9, &qword_2689348E8);
        goto LABEL_24;
      }
      swift_release();
      sub_2378B1740(v0, &qword_2689348E8);
      sub_2378B1740((uint64_t)v18, &qword_2689348E8);
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v14, v1);
    }
    uint64_t v21 = &qword_2689348E0;
    uint64_t v22 = v9;
LABEL_23:
    sub_2378B1740((uint64_t)v22, v21);
  }
LABEL_24:
  OUTLINED_FUNCTION_9_0();
}

uint64_t sub_2378AB794(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000014;
  }
  else {
    unint64_t v3 = 0xD000000000000013;
  }
  if (v2) {
    unint64_t v4 = 0x80000002378CB030;
  }
  else {
    unint64_t v4 = 0x80000002378CB050;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000014;
  }
  else {
    unint64_t v5 = 0xD000000000000013;
  }
  if (a2) {
    unint64_t v6 = 0x80000002378CB050;
  }
  else {
    unint64_t v6 = 0x80000002378CB030;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2378C95A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2378AB838()
{
  sub_2378C9120();
  sub_2378AE748(&qword_2689348D8, MEMORY[0x263F73370]);
  sub_2378C9370();
  sub_2378C9370();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = sub_2378C95A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

void sub_2378AB91C()
{
}

void sub_2378AB928()
{
}

void sub_2378AB934()
{
  OUTLINED_FUNCTION_10_1();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348C8);
  uint64_t v5 = OUTLINED_FUNCTION_42(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x270FA5388](v6);
  char v8 = &v32[-v7];
  uint64_t v9 = sub_2378C9120();
  OUTLINED_FUNCTION_2();
  uint64_t v37 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_13_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_22();
  uint64_t v36 = v13;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = &v32[-v15];
  type metadata accessor for SystemCommandsIntent();
  sub_2378C9080();
  if (!v39)
  {
    sub_2378B1740((uint64_t)v38, &qword_2689348D0);
    goto LABEL_11;
  }
  sub_2378C8FB0();
  if ((OUTLINED_FUNCTION_5_4() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v34 = v0;
  uint64_t v35 = v3;
  swift_retain();
  sub_2378C9090();
  swift_release();
  if (!v38[0] || (uint64_t v17 = sub_2378C90B0(), swift_release(), !v17))
  {
    OUTLINED_FUNCTION_17_0((uint64_t)v8);
    goto LABEL_10;
  }
  sub_2378C9110();
  swift_release();
  OUTLINED_FUNCTION_4_4((uint64_t)v8);
  if (v18)
  {
LABEL_10:
    swift_release();
    sub_2378B1740((uint64_t)v8, &qword_2689348C8);
    uint64_t v0 = v34;
    goto LABEL_11;
  }
  uint64_t v19 = v37;
  OUTLINED_FUNCTION_15_0();
  v20();
  uint64_t v21 = v36;
  OUTLINED_FUNCTION_16_0();
  v22();
  int v33 = sub_2378AB838();
  swift_release();
  uint64_t v23 = *(void (**)(unsigned char *, uint64_t))(v19 + 8);
  v23(v21, v9);
  v23(v16, v9);
  uint64_t v0 = v34;
  if (v33) {
    goto LABEL_22;
  }
LABEL_11:
  sub_2378C9080();
  if (!v39)
  {
    uint64_t v30 = &qword_2689348D0;
    unint64_t v31 = v38;
LABEL_21:
    sub_2378B1740((uint64_t)v31, v30);
    goto LABEL_22;
  }
  sub_2378C9170();
  if (OUTLINED_FUNCTION_5_4())
  {
    swift_retain();
    sub_2378C9090();
    swift_release();
    if (v38[0] && (uint64_t v24 = sub_2378C90B0(), swift_release(), v24))
    {
      sub_2378C9110();
      swift_release();
      OUTLINED_FUNCTION_4_4(v1);
      if (!v18)
      {
        uint64_t v25 = v37;
        OUTLINED_FUNCTION_15_0();
        v26();
        uint64_t v27 = v36;
        OUTLINED_FUNCTION_16_0();
        v28();
        sub_2378AB838();
        swift_release();
        os_log_type_t v29 = *(void (**)(unsigned char *, uint64_t))(v25 + 8);
        v29(v27, v9);
        v29(v0, v9);
        goto LABEL_22;
      }
    }
    else
    {
      OUTLINED_FUNCTION_17_0(v1);
    }
    swift_release();
    uint64_t v30 = &qword_2689348C8;
    unint64_t v31 = (void *)v1;
    goto LABEL_21;
  }
LABEL_22:
  OUTLINED_FUNCTION_9_0();
}

void sub_2378ABCF0()
{
}

BOOL sub_2378ABCFC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348C8);
  uint64_t v2 = OUTLINED_FUNCTION_42(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_2();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_37_0();
  if (!v17[3])
  {
    uint64_t v15 = &qword_2689348D0;
    uint64_t v16 = v17;
LABEL_11:
    sub_2378B1740((uint64_t)v16, v15);
    return 1;
  }
  sub_2378C8FB0();
  if ((OUTLINED_FUNCTION_28_0() & 1) == 0) {
    return 1;
  }
  swift_retain();
  sub_2378C9090();
  swift_release();
  if (!v17[0] || (uint64_t v7 = sub_2378C90B0(), swift_release(), !v7))
  {
    OUTLINED_FUNCTION_17_0(v0);
    goto LABEL_10;
  }
  sub_2378C9110();
  swift_release();
  OUTLINED_FUNCTION_4_4(v0);
  if (v8)
  {
LABEL_10:
    swift_release();
    uint64_t v15 = &qword_2689348C8;
    uint64_t v16 = (void *)v0;
    goto LABEL_11;
  }
  uint64_t v9 = OUTLINED_FUNCTION_14_0();
  v10(v9);
  OUTLINED_FUNCTION_16_0();
  v11();
  char v12 = sub_2378AB838();
  swift_release();
  uint64_t v13 = *(void (**)(void))(v4 + 8);
  OUTLINED_FUNCTION_11_1();
  v13();
  OUTLINED_FUNCTION_11_1();
  v13();
  return (v12 & 1) == 0;
}

void sub_2378ABEDC()
{
}

void sub_2378ABF08()
{
  OUTLINED_FUNCTION_10_1();
  uint64_t v22 = v1;
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348C8);
  uint64_t v5 = OUTLINED_FUNCTION_42(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_2();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_19_0();
  sub_2378C9080();
  if (!v24)
  {
    sub_2378B1740((uint64_t)v23, &qword_2689348D0);
    goto LABEL_12;
  }
  v3(0);
  if ((OUTLINED_FUNCTION_5_4() & 1) == 0) {
    goto LABEL_12;
  }
  swift_retain();
  sub_2378C9160();
  swift_release();
  if (!v23[0] || (uint64_t v10 = sub_2378C9070(), v12 = v11, swift_release(), !v12))
  {
    swift_release();
    goto LABEL_12;
  }
  if (v10 != 0xD000000000000010 || v12 != 0x80000002378CBA50)
  {
    char v13 = sub_2378C95A0();
    swift_bridgeObjectRelease();
    swift_release();
    if (v13) {
      goto LABEL_23;
    }
LABEL_12:
    sub_2378C9080();
    if (v24)
    {
      v22(0);
      if ((OUTLINED_FUNCTION_5_4() & 1) == 0) {
        goto LABEL_23;
      }
      swift_retain();
      sub_2378C9090();
      swift_release();
      if (v23[0] && (uint64_t v14 = sub_2378C90B0(), swift_release(), v14))
      {
        sub_2378C9110();
        swift_release();
        OUTLINED_FUNCTION_4_4(v0);
        if (!v15)
        {
          uint64_t v16 = OUTLINED_FUNCTION_14_0();
          v17(v16);
          OUTLINED_FUNCTION_16_0();
          v18();
          sub_2378AB838();
          swift_release();
          uint64_t v19 = *(void (**)(void))(v7 + 8);
          OUTLINED_FUNCTION_21_0();
          v19();
          OUTLINED_FUNCTION_21_0();
          v19();
          goto LABEL_23;
        }
      }
      else
      {
        OUTLINED_FUNCTION_17_0(v0);
      }
      swift_release();
      uint64_t v20 = &qword_2689348C8;
      uint64_t v21 = (void *)v0;
    }
    else
    {
      uint64_t v20 = &qword_2689348D0;
      uint64_t v21 = v23;
    }
    sub_2378B1740((uint64_t)v21, v20);
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  swift_release();
LABEL_23:
  OUTLINED_FUNCTION_9_0();
}

void sub_2378AC24C()
{
  OUTLINED_FUNCTION_10_1();
  uint64_t v4 = v0;
  uint64_t v5 = type metadata accessor for SystemCommandsIntent();
  OUTLINED_FUNCTION_42_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_13_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_2();
  uint64_t v112 = v10;
  uint64_t v113 = v9;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_40_0();
  uint64_t v13 = v11 - v12;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (uint64_t)&v107 - v16;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_22();
  uint64_t v110 = v18;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_22();
  uint64_t v109 = v20;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_22();
  uint64_t v108 = v22;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_22();
  uint64_t v107 = v24;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_22();
  uint64_t v111 = v26;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v27);
  os_log_type_t v29 = (char *)&v107 - v28;
  sub_2378C9080();
  if (v116)
  {
    sub_2378C90F0();
    if (OUTLINED_FUNCTION_5_4())
    {
      if (sub_2378AE790())
      {
        uint64_t v30 = v112;
        uint64_t v31 = v113;
        if (qword_268934168 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v31, (uint64_t)qword_268936078);
        OUTLINED_FUNCTION_3();
        v32();
        int v33 = (void *)sub_2378C9270();
        os_log_type_t v34 = sub_2378C9430();
        if (OUTLINED_FUNCTION_13(v34))
        {
          uint64_t v35 = (_WORD *)OUTLINED_FUNCTION_29();
          OUTLINED_FUNCTION_35_0(v35);
          OUTLINED_FUNCTION_26_0(&dword_237899000, v36, v37, "SystemCommandsIntent isShutDown | accepting 'turn off device' parse");
          OUTLINED_FUNCTION_12();
          swift_release();
        }
        else
        {

          swift_release();
        }
        (*(void (**)(char *, uint64_t))(v30 + 8))(v29, v31);
        goto LABEL_70;
      }
      swift_retain();
      uint64_t v63 = sub_2378C9150();
      swift_release();
      uint64_t v40 = v112;
      uint64_t v64 = v113;
      if (v63)
      {
        int64_t v65 = swift_bridgeObjectRetain();
        char v66 = sub_2378AEA04(v65);
        swift_bridgeObjectRelease();
        sub_2378A5410(v4, v3);
        if (v66)
        {
          sub_2378A00F4(v3);
          sub_2378A5410(v4, (uint64_t)v2);
LABEL_35:
          sub_2378A00F4((uint64_t)v2);
LABEL_36:
          if (qword_268934168 != -1) {
            swift_once();
          }
          OUTLINED_FUNCTION_8_3(v64, (uint64_t)qword_268936078);
          uint64_t v69 = v111;
          OUTLINED_FUNCTION_3();
          v70();
          swift_bridgeObjectRetain();
          uint64_t v71 = sub_2378C9270();
          os_log_type_t v72 = sub_2378C9430();
          if (OUTLINED_FUNCTION_38_0(v72))
          {
            OUTLINED_FUNCTION_30_0();
            v115[0] = OUTLINED_FUNCTION_29_0();
            OUTLINED_FUNCTION_43_0(4.8149e-34);
            swift_bridgeObjectRetain();
            uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934920);
            uint64_t v74 = MEMORY[0x237E23E40](v63, v73);
            unint64_t v76 = v75;
            swift_bridgeObjectRelease();
            uint64_t v77 = sub_2378A1964(v74, v76, v115);
            OUTLINED_FUNCTION_32_0(v77);
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_36_0(&dword_237899000, v71, v78, "SystemCommandsIntent isShutDown | contains userEntities from other domain: %s");
            OUTLINED_FUNCTION_41_0();
            OUTLINED_FUNCTION_12();
            OUTLINED_FUNCTION_12();
            swift_release();

            (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v111, v113);
          }
          else
          {

            swift_release();
            swift_bridgeObjectRelease_n();
            (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v69, v64);
          }
          goto LABEL_70;
        }
        int64_t v67 = swift_bridgeObjectRetain();
        char v68 = sub_2378AF82C(v67);
        swift_bridgeObjectRelease();
        sub_2378A00F4(v3);
        sub_2378A5410(v4, (uint64_t)v2);
        if (v68) {
          goto LABEL_35;
        }
        int64_t v79 = swift_bridgeObjectRetain();
        char v80 = sub_2378B0654(v79);
        swift_bridgeObjectRelease();
        sub_2378A00F4((uint64_t)v2);
        if (v80) {
          goto LABEL_36;
        }
        swift_bridgeObjectRelease();
      }
      swift_retain();
      sub_2378C9160();
      swift_release();
      uint64_t v81 = v115[0];
      swift_release();
      if (v81)
      {
        swift_retain();
        unint64_t v82 = sub_2378C9150();
        swift_release();
        if (v82)
        {
          if (v82 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v39 = sub_2378C9560();
            if (v39)
            {
LABEL_47:
              uint64_t v17 = 4;
              while (1)
              {
                if ((v82 & 0xC000000000000001) != 0)
                {
                  uint64_t v83 = MEMORY[0x237E23F90](v17 - 4, v82);
                }
                else
                {
                  uint64_t v83 = *(void *)(v82 + 8 * v17);
                  swift_retain();
                }
                uint64_t v84 = v17 - 3;
                if (__OFADD__(v17 - 4, 1))
                {
                  __break(1u);
                  goto LABEL_78;
                }
                sub_2378C9010();
                if (v115[0])
                {
                  uint64_t v40 = sub_2378C9020();
                  swift_release();
                  swift_release();
                  if (v40) {
                    break;
                  }
                }
                swift_release();
                ++v17;
                if (v84 == v39) {
                  goto LABEL_55;
                }
              }
              swift_bridgeObjectRelease_n();
              if (qword_268934168 != -1) {
                swift_once();
              }
              uint64_t v96 = v113;
              __swift_project_value_buffer(v113, (uint64_t)qword_268936078);
              uint64_t v97 = v112;
              uint64_t v98 = v107;
              OUTLINED_FUNCTION_3();
              v99();
              swift_retain_n();
              uint64_t v100 = sub_2378C9270();
              os_log_type_t v101 = sub_2378C9430();
              if (OUTLINED_FUNCTION_38_0(v101))
              {
                OUTLINED_FUNCTION_30_0();
                uint64_t v102 = OUTLINED_FUNCTION_29_0();
                uint64_t v114 = v83;
                v115[0] = v102;
                OUTLINED_FUNCTION_43_0(4.8149e-34);
                swift_retain();
                __swift_instantiateConcreteTypeFromMangledName(&qword_268934920);
                uint64_t v103 = sub_2378C92F0();
                uint64_t v105 = sub_2378A1964(v103, v104, v115);
                OUTLINED_FUNCTION_32_0(v105);
                swift_release_n();
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_36_0(&dword_237899000, v100, v106, "SystemCommandsIntent isShutDown | rejecting parse containing %s");
                OUTLINED_FUNCTION_41_0();
                OUTLINED_FUNCTION_12();
                OUTLINED_FUNCTION_12();
                swift_release();
                swift_release();

                (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v107, v113);
              }
              else
              {

                swift_release();
                swift_release_n();
                (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v98, v96);
              }
              goto LABEL_70;
            }
          }
          else
          {
            uint64_t v39 = *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (v39) {
              goto LABEL_47;
            }
          }
LABEL_55:
          swift_bridgeObjectRelease_n();
          uint64_t v40 = v112;
          uint64_t v64 = v113;
        }
        if ((sub_2378B12D0() & 1) == 0)
        {
          swift_release();
          goto LABEL_70;
        }
        if (qword_268934168 != -1) {
          swift_once();
        }
        OUTLINED_FUNCTION_8_3(v64, (uint64_t)qword_268936078);
        uint64_t v85 = v108;
        OUTLINED_FUNCTION_3();
        v86();
        char v87 = (void *)sub_2378C9270();
        os_log_type_t v88 = sub_2378C9430();
        if (OUTLINED_FUNCTION_13(v88))
        {
          uint64_t v89 = (_WORD *)OUTLINED_FUNCTION_29();
          OUTLINED_FUNCTION_35_0(v89);
          uint64_t v92 = "SystemCommandsIntent isShutDown | power reference found";
LABEL_65:
          OUTLINED_FUNCTION_26_0(&dword_237899000, v90, v91, v92);
          OUTLINED_FUNCTION_12();
          swift_release();

LABEL_67:
          (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v85, v64);
          goto LABEL_70;
        }
      }
      else
      {
        if (qword_268934168 != -1) {
          swift_once();
        }
        OUTLINED_FUNCTION_8_3(v64, (uint64_t)qword_268936078);
        uint64_t v85 = v109;
        OUTLINED_FUNCTION_3();
        v93();
        char v87 = (void *)sub_2378C9270();
        os_log_type_t v94 = sub_2378C9430();
        if (OUTLINED_FUNCTION_13(v94))
        {
          char v95 = (_WORD *)OUTLINED_FUNCTION_29();
          OUTLINED_FUNCTION_35_0(v95);
          uint64_t v92 = "SystemCommandsIntent isShutDown | no references found";
          goto LABEL_65;
        }
      }

      swift_release();
      goto LABEL_67;
    }
  }
  else
  {
    sub_2378B1740((uint64_t)v115, &qword_2689348D0);
  }
  sub_2378C9080();
  if (!v116)
  {
    uint64_t v38 = sub_2378B1740((uint64_t)v115, &qword_2689348D0);
    uint64_t v39 = v112;
    uint64_t v40 = v113;
    goto LABEL_19;
  }
  sub_2378C90C0();
  uint64_t v38 = OUTLINED_FUNCTION_5_4();
  uint64_t v39 = v112;
  uint64_t v40 = v113;
  if ((v38 & 1) == 0)
  {
LABEL_19:
    if (qword_268934168 != -1) {
      uint64_t v38 = swift_once();
    }
    OUTLINED_FUNCTION_34_0(v38, (uint64_t)qword_268936078);
    OUTLINED_FUNCTION_3();
    v50();
    sub_2378A5410(v4, v1);
    uint64_t v51 = sub_2378C9270();
    os_log_type_t v52 = sub_2378C9430();
    if (os_log_type_enabled(v51, v52))
    {
      OUTLINED_FUNCTION_30_0();
      uint64_t v53 = OUTLINED_FUNCTION_29_0();
      *uint64_t v2 = 136315138;
      v115[0] = v53;
      uint64_t v114 = *(void *)(v1 + *(int *)(v5 + 20));
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268934918);
      uint64_t v54 = sub_2378C92F0();
      uint64_t v114 = sub_2378A1964(v54, v55, v115);
      sub_2378C94B0();
      swift_bridgeObjectRelease();
      sub_2378A00F4(v1);
      OUTLINED_FUNCTION_36_0(&dword_237899000, v51, v56, "SystemCommandsIntent isShutDown | no flow found for task: %s");
      OUTLINED_FUNCTION_41_0();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_12();

      (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v13, v113);
    }
    else
    {
      sub_2378A00F4(v1);

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v13, v40);
    }
    goto LABEL_70;
  }
  swift_retain();
  sub_2378C9160();
  uint64_t v41 = swift_release();
  if (v115[0]
    && (v42 = sub_2378AE214(0), uint64_t v41 = swift_release(), v42)
    && (sub_2378B1344(), v44 = v43, uint64_t v41 = swift_bridgeObjectRelease(), (v44 & 1) != 0))
  {
    if (qword_268934168 != -1) {
      uint64_t v41 = swift_once();
    }
    OUTLINED_FUNCTION_34_0(v41, (uint64_t)qword_268936078);
    uint64_t v45 = v110;
    OUTLINED_FUNCTION_3();
    v46();
    uint64_t v47 = sub_2378C9270();
    os_log_type_t v48 = sub_2378C9430();
    if (OUTLINED_FUNCTION_39_0(v48))
    {
      os_log_type_t v49 = (_WORD *)OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_48_0(v49);
      OUTLINED_FUNCTION_45_0(&dword_237899000, v47, v44, "SystemCommandsIntent isShutDown | Found shutdown identifier");
      OUTLINED_FUNCTION_12();
      swift_release();
    }
    else
    {

      swift_release();
    }
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v45, v40);
  }
  else
  {
    if (qword_268934168 != -1) {
LABEL_78:
    }
      uint64_t v41 = swift_once();
    OUTLINED_FUNCTION_34_0(v41, (uint64_t)qword_268936078);
    OUTLINED_FUNCTION_3();
    v57();
    uint64_t v58 = (void *)sub_2378C9270();
    os_log_type_t v59 = sub_2378C9430();
    if (OUTLINED_FUNCTION_13(v59))
    {
      os_log_type_t v60 = (_WORD *)OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_35_0(v60);
      OUTLINED_FUNCTION_26_0(&dword_237899000, v61, v62, "SystemCommandsIntent isShutDown | Did not find shutdown identifier");
      OUTLINED_FUNCTION_12();
      swift_release();
    }
    else
    {

      swift_release();
    }
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v17, v40);
  }
LABEL_70:
  OUTLINED_FUNCTION_9_0();
}

uint64_t sub_2378ACF0C()
{
  return sub_2378ACF3C(MEMORY[0x263F73238]);
}

uint64_t sub_2378ACF24()
{
  return sub_2378ACF3C(MEMORY[0x263F73680]);
}

uint64_t sub_2378ACF3C(void (*a1)(void))
{
  type metadata accessor for SystemCommandsIntent();
  sub_2378C9080();
  if (v4)
  {
    a1(0);
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      swift_release();
      return 1;
    }
  }
  else
  {
    sub_2378B1740((uint64_t)v3, &qword_2689348D0);
    return 0;
  }
  return result;
}

BOOL sub_2378ACFD8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348C8);
  uint64_t v2 = OUTLINED_FUNCTION_42(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_2();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3_3();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_37_0();
  if (!v17[3])
  {
    uint64_t v15 = &qword_2689348D0;
    uint64_t v16 = v17;
LABEL_11:
    sub_2378B1740((uint64_t)v16, v15);
    return 0;
  }
  sub_2378C9170();
  if ((OUTLINED_FUNCTION_28_0() & 1) == 0) {
    return 0;
  }
  swift_retain();
  sub_2378C9090();
  swift_release();
  if (!v17[0] || (uint64_t v7 = sub_2378C90B0(), swift_release(), !v7))
  {
    OUTLINED_FUNCTION_17_0(v0);
    goto LABEL_10;
  }
  sub_2378C9110();
  swift_release();
  OUTLINED_FUNCTION_4_4(v0);
  if (v8)
  {
LABEL_10:
    swift_release();
    uint64_t v15 = &qword_2689348C8;
    uint64_t v16 = (void *)v0;
    goto LABEL_11;
  }
  uint64_t v9 = OUTLINED_FUNCTION_14_0();
  v10(v9);
  OUTLINED_FUNCTION_16_0();
  v11();
  char v12 = sub_2378AB838();
  swift_release();
  uint64_t v13 = *(void (**)(void))(v4 + 8);
  OUTLINED_FUNCTION_11_1();
  v13();
  OUTLINED_FUNCTION_11_1();
  v13();
  return (v12 & 1) != 0;
}

uint64_t sub_2378AD1B8()
{
  uint64_t v2 = sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_40_0();
  uint64_t v8 = v6 - v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_37_0();
  if (v28[3])
  {
    sub_2378C90C0();
    if (OUTLINED_FUNCTION_28_0())
    {
      swift_retain();
      sub_2378C9160();
      swift_release();
      if (v28[0]
        && (uint64_t v11 = sub_2378AE214(1u), swift_release(), v11)
        && (sub_2378B1344(), char v13 = v12, swift_bridgeObjectRelease(), (v13 & 1) != 0))
      {
        if (qword_268934168 != -1) {
          swift_once();
        }
        OUTLINED_FUNCTION_8_3(v2, (uint64_t)qword_268936078);
        OUTLINED_FUNCTION_3();
        v14();
        uint64_t v15 = sub_2378C9270();
        os_log_type_t v16 = sub_2378C9430();
        if (OUTLINED_FUNCTION_39_0(v16))
        {
          uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_29();
          *(_WORD *)uint64_t v17 = 0;
          _os_log_impl(&dword_237899000, v15, (os_log_type_t)v0, "SystemCommandsIntent isLock | found lock identifier", v17, 2u);
          OUTLINED_FUNCTION_12();
          swift_release();
        }
        else
        {

          swift_release();
        }
        uint64_t v22 = 1;
        uint64_t v8 = v1;
      }
      else
      {
        if (qword_268934168 != -1) {
          swift_once();
        }
        OUTLINED_FUNCTION_8_3(v2, (uint64_t)qword_268936078);
        OUTLINED_FUNCTION_3();
        v23();
        uint64_t v24 = sub_2378C9270();
        os_log_type_t v25 = sub_2378C9430();
        if (OUTLINED_FUNCTION_38_0(v25))
        {
          uint64_t v26 = (uint8_t *)OUTLINED_FUNCTION_29();
          *(_WORD *)uint64_t v26 = 0;
          _os_log_impl(&dword_237899000, v24, (os_log_type_t)v1, "SystemCommandsIntent isLock | lock identifier not found", v26, 2u);
          OUTLINED_FUNCTION_12();
          swift_release();
        }
        else
        {

          swift_release();
        }
        uint64_t v22 = 0;
        uint64_t v8 = v0;
      }
      goto LABEL_22;
    }
  }
  else
  {
    sub_2378B1740((uint64_t)v28, &qword_2689348D0);
  }
  if (qword_268934168 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_8_3(v2, (uint64_t)qword_268936078);
  OUTLINED_FUNCTION_3();
  v18();
  uint64_t v19 = sub_2378C9270();
  os_log_type_t v20 = sub_2378C9430();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)OUTLINED_FUNCTION_29();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_237899000, v19, v20, "SystemCommandsIntent isLock | task is not UsoTask_enable_common_Setting", v21, 2u);
    OUTLINED_FUNCTION_12();
  }

  uint64_t v22 = 0;
LABEL_22:
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  return v22;
}

void sub_2378AD564()
{
  OUTLINED_FUNCTION_10_1();
  uint64_t v2 = sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_13_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v46 - v8;
  uint64_t v10 = sub_2378C9000();
  OUTLINED_FUNCTION_2();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_27();
  uint64_t v16 = v15 - v14;
  type metadata accessor for SystemCommandsIntent();
  sub_2378C9080();
  if (v54[3])
  {
    sub_2378C90C0();
    if (OUTLINED_FUNCTION_5_4())
    {
      uint64_t v17 = v53;
      swift_retain();
      sub_2378C9160();
      swift_release();
      if (!v54[0]) {
        goto LABEL_25;
      }
      uint64_t v0 = sub_2378C9040();
      swift_release();
      if (!v0) {
        goto LABEL_25;
      }
      os_log_type_t v48 = v9;
      uint64_t v49 = v1;
      uint64_t v18 = *(void *)(v0 + 16);
      if (v18)
      {
        v46[1] = v17;
        v46[2] = v4;
        uint64_t v47 = v2;
        uint64_t v20 = *(void *)(v12 + 16);
        uint64_t v19 = v12 + 16;
        unint64_t v21 = v0 + ((*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64));
        uint64_t v50 = *(void *)(v19 + 56);
        uint64_t v51 = v20;
        uint64_t v52 = v19;
        uint64_t v22 = (void (**)(uint64_t, uint64_t))(v19 - 8);
        v46[0] = v0;
        swift_bridgeObjectRetain();
        uint64_t v23 = (char *)MEMORY[0x263F8EE78];
        do
        {
          OUTLINED_FUNCTION_3();
          v24();
          uint64_t v25 = sub_2378C8FE0();
          uint64_t v27 = v26;
          (*v22)(v16, v10);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v23 = sub_2378B1798(0, *((void *)v23 + 2) + 1, 1, (uint64_t)v23);
          }
          unint64_t v29 = *((void *)v23 + 2);
          unint64_t v28 = *((void *)v23 + 3);
          if (v29 >= v28 >> 1) {
            uint64_t v23 = sub_2378B1798((char *)(v28 > 1), v29 + 1, 1, (uint64_t)v23);
          }
          *((void *)v23 + 2) = v29 + 1;
          uint64_t v30 = &v23[16 * v29];
          *((void *)v30 + 4) = v25;
          *((void *)v30 + 5) = v27;
          v21 += v50;
          --v18;
        }
        while (v18);
        LOBYTE(v0) = v46[0];
        swift_bridgeObjectRelease();
        uint64_t v2 = v47;
      }
      else
      {
        uint64_t v23 = (char *)MEMORY[0x263F8EE78];
      }
      swift_bridgeObjectRelease();
      char v35 = sub_2378B1598(0x6B636F6C6E75, 0xE600000000000000, v23);
      swift_bridgeObjectRelease();
      if (v35)
      {
        if (qword_268934168 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v2, (uint64_t)qword_268936078);
        OUTLINED_FUNCTION_25_0();
        OUTLINED_FUNCTION_3();
        v36();
        uint64_t v37 = sub_2378C9270();
        os_log_type_t v38 = sub_2378C9430();
        if (OUTLINED_FUNCTION_24_0(v38))
        {
          uint64_t v39 = (_WORD *)OUTLINED_FUNCTION_29();
          OUTLINED_FUNCTION_35_0(v39);
          OUTLINED_FUNCTION_7_3(&dword_237899000, v40, v41, "SystemCommandsIntent isUnlock | does not have required userEntity");
          OUTLINED_FUNCTION_12();
          swift_release();

          goto LABEL_30;
        }
      }
      else
      {
LABEL_25:
        if (qword_268934168 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v2, (uint64_t)qword_268936078);
        OUTLINED_FUNCTION_25_0();
        OUTLINED_FUNCTION_3();
        v42();
        uint64_t v37 = sub_2378C9270();
        os_log_type_t v43 = sub_2378C9430();
        if (OUTLINED_FUNCTION_24_0(v43))
        {
          os_log_type_t v44 = (_WORD *)OUTLINED_FUNCTION_29();
          OUTLINED_FUNCTION_48_0(v44);
          OUTLINED_FUNCTION_45_0(&dword_237899000, v37, (os_log_type_t)v0, "SystemCommandsIntent isUnlock | unlock identifier not found");
          OUTLINED_FUNCTION_12();
          swift_release();

          goto LABEL_30;
        }
      }

      swift_release();
      goto LABEL_30;
    }
  }
  else
  {
    sub_2378B1740((uint64_t)v54, &qword_2689348D0);
  }
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v2, (uint64_t)qword_268936078);
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_3();
  v31();
  uint64_t v32 = sub_2378C9270();
  os_log_type_t v33 = sub_2378C9430();
  if (OUTLINED_FUNCTION_39_0(v33))
  {
    os_log_type_t v34 = (_WORD *)OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_48_0(v34);
    OUTLINED_FUNCTION_45_0(&dword_237899000, v32, (os_log_type_t)v1, "SystemCommandsIntent isUnlock | task is not UsoTask_enable_common_Setting");
    OUTLINED_FUNCTION_12();
  }

LABEL_30:
  OUTLINED_FUNCTION_11_1();
  v45();
  OUTLINED_FUNCTION_9_0();
}

void sub_2378ADA7C()
{
  OUTLINED_FUNCTION_10_1();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348F8);
  uint64_t v2 = OUTLINED_FUNCTION_42(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_27();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3_3();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v53 - v12;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v53 - v15;
  type metadata accessor for SystemCommandsIntent();
  sub_2378C9080();
  if (v61[3])
  {
    sub_2378C9100();
    if (swift_dynamicCast())
    {
      uint64_t v56 = v0;
      uint64_t v17 = v60;
      if (qword_268934168 != -1) {
        swift_once();
      }
      uint64_t v18 = __swift_project_value_buffer(v6, (uint64_t)qword_268936078);
      uint64_t v19 = *(uint8_t **)(v8 + 16);
      uint64_t v57 = v18;
      uint64_t v58 = v19;
      os_log_type_t v59 = (void (*)(void))(v8 + 16);
      OUTLINED_FUNCTION_3();
      v20();
      swift_retain_n();
      unint64_t v21 = sub_2378C9270();
      os_log_type_t v22 = sub_2378C9430();
      if (os_log_type_enabled(v21, v22))
      {
        OUTLINED_FUNCTION_30_0();
        uint64_t v54 = v5;
        uint64_t v23 = OUTLINED_FUNCTION_29_0();
        os_log_type_t v60 = v17;
        v61[0] = v23;
        uint64_t v55 = v8;
        *(_DWORD *)uint64_t v17 = 136315138;
        v53[2] = v17 + 4;
        swift_retain();
        uint64_t v24 = sub_2378C92F0();
        os_log_type_t v60 = (uint8_t *)sub_2378A1964(v24, v25, v61);
        uint64_t v8 = v55;
        sub_2378C94B0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237899000, v21, v22, "SystemCommandsIntent isQueryFor | parse: %s", v17, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_12();
        uint64_t v5 = v54;
        OUTLINED_FUNCTION_12();
      }
      else
      {

        swift_release_n();
      }
      uint64_t v31 = *(void (**)(void))(v8 + 8);
      OUTLINED_FUNCTION_30();
      v31();
      swift_retain();
      sub_2378C9090();
      swift_release();
      if (v61[0] && (uint64_t v32 = sub_2378AE214(0), swift_release(), v32))
      {
        sub_2378AE16C(v32, MEMORY[0x263F72710], v5);
        swift_bridgeObjectRelease();
        uint64_t v33 = sub_2378C9000();
        int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v5, 1, v33);
        v53[1] = v17;
        if (EnumTagSinglePayload == 1)
        {
          sub_2378B1740(v5, &qword_2689348F8);
          uint64_t v35 = 0;
          uint64_t v36 = 0;
        }
        else
        {
          uint64_t v35 = sub_2378C8FE0();
          uint64_t v36 = v43;
          OUTLINED_FUNCTION_42_0();
          (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v5, v33);
        }
        OUTLINED_FUNCTION_3();
        v45();
        swift_bridgeObjectRetain_n();
        uint64_t v46 = sub_2378C9270();
        os_log_type_t v47 = sub_2378C9430();
        if (os_log_type_enabled(v46, v47))
        {
          os_log_type_t v48 = (uint8_t *)OUTLINED_FUNCTION_30_0();
          uint64_t v49 = swift_slowAlloc();
          os_log_type_t v59 = v31;
          os_log_type_t v60 = (uint8_t *)v49;
          *(_DWORD *)os_log_type_t v48 = 136315138;
          uint64_t v58 = v48 + 4;
          v61[0] = v35;
          v61[1] = v36;
          swift_bridgeObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_268934900);
          uint64_t v50 = sub_2378C92F0();
          uint64_t v55 = v8;
          v61[0] = sub_2378A1964(v50, v51, (uint64_t *)&v60);
          sub_2378C94B0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_237899000, v46, v47, "SystemCommandsIntent isQueryFor | found systemCategory identifier: %s", v48, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_12();
          swift_release();

          OUTLINED_FUNCTION_30();
          v52();
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_release();
          OUTLINED_FUNCTION_30();
          v31();
        }
      }
      else
      {
        OUTLINED_FUNCTION_3();
        v37();
        os_log_type_t v38 = (void *)sub_2378C9270();
        os_log_type_t v39 = sub_2378C9430();
        if (OUTLINED_FUNCTION_24_0(v39))
        {
          uint64_t v40 = (_WORD *)OUTLINED_FUNCTION_29();
          OUTLINED_FUNCTION_35_0(v40);
          OUTLINED_FUNCTION_7_3(&dword_237899000, v41, v42, "SystemCommandsIntent isQueryFor | systemCategory identifier not found");
          OUTLINED_FUNCTION_12();
          swift_release();
        }
        else
        {

          swift_release();
        }
        ((void (*)(char *, uint64_t))v31)(v13, v6);
      }
      goto LABEL_22;
    }
  }
  else
  {
    sub_2378B1740((uint64_t)v61, &qword_2689348D0);
  }
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v6, (uint64_t)qword_268936078);
  OUTLINED_FUNCTION_3();
  v26();
  uint64_t v27 = sub_2378C9270();
  os_log_type_t v28 = sub_2378C9430();
  if (OUTLINED_FUNCTION_24_0(v28))
  {
    unint64_t v29 = (_WORD *)OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_48_0(v29);
    OUTLINED_FUNCTION_45_0(&dword_237899000, v27, (os_log_type_t)v16, "SystemCommandsIntent isQueryFor | task is not UsoTask_summarise_common_Setting");
    OUTLINED_FUNCTION_12();
  }

  OUTLINED_FUNCTION_21_0();
  v30();
LABEL_22:
  OUTLINED_FUNCTION_9_0();
}

uint64_t sub_2378AE154@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2378AE16C(a1, MEMORY[0x263F71570], a2);
}

uint64_t sub_2378AE16C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = a2(0);
  if (v5)
  {
    OUTLINED_FUNCTION_42_0();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v7 + 16))(a3, a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), v6);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a3, v8, 1, v6);
}

uint64_t sub_2378AE214(unsigned __int8 a1)
{
  uint64_t v2 = sub_2378C9000();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v27 - v7;
  uint64_t v9 = sub_2378C9040();
  if (!v9) {
    return 0;
  }
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v35 = *(void *)(v9 + 16);
  uint64_t v36 = MEMORY[0x263F8EE78];
  if (v35)
  {
    unint64_t v11 = 0;
    unint64_t v29 = (void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v30 = (void (**)(char *, char *, uint64_t))(v3 + 32);
    unint64_t v32 = (unint64_t)"7SystemControlCATs";
    uint64_t v33 = v3 + 16;
    uint64_t v31 = a1;
    os_log_type_t v28 = v6;
    uint64_t v34 = v9;
    while (2)
    {
      if (v11 >= *(void *)(v9 + 16))
      {
        __break(1u);
        JUMPOUT(0x2378AE6A0);
      }
      unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      uint64_t v13 = *(void *)(v3 + 72);
      unint64_t v14 = v11 + 1;
      (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v8, v9 + v12 + v13 * v11, v2);
      uint64_t v15 = sub_2378C8FF0();
      unint64_t v17 = v32 | 0x8000000000000000;
      unint64_t v18 = 0xD000000000000010;
      switch(v31)
      {
        case 1:
          unint64_t v17 = 0xEF65747562697274;
          unint64_t v18 = 0x74416D6574737973;
          if (v16) {
            goto LABEL_34;
          }
          goto LABEL_47;
        case 2:
          unint64_t v17 = 0xED0000746375646FLL;
          unint64_t v18 = 0x7250726577736E61;
          if (!v16) {
            goto LABEL_47;
          }
          goto LABEL_34;
        case 3:
          unint64_t v17 = 0xE500000000000000;
          unint64_t v18 = 0x656E6F6870;
          if (!v16) {
            goto LABEL_47;
          }
          goto LABEL_34;
        case 4:
          unint64_t v17 = 0xE600000000000000;
          unint64_t v18 = 0x656E6F687069;
          if (!v16) {
            goto LABEL_47;
          }
          goto LABEL_34;
        case 5:
          unint64_t v17 = 0xE400000000000000;
          unint64_t v18 = 1684107369;
          if (!v16) {
            goto LABEL_47;
          }
          goto LABEL_34;
        case 6:
          unint64_t v17 = 0xE600000000000000;
          unint64_t v18 = 0x656369766564;
          if (!v16) {
            goto LABEL_47;
          }
          goto LABEL_34;
        case 7:
          unint64_t v17 = 0xE700000000000000;
          unint64_t v18 = 0x746375646F7270;
          if (!v16) {
            goto LABEL_47;
          }
          goto LABEL_34;
        case 8:
          unint64_t v17 = 0xE600000000000000;
          unint64_t v18 = 0x6E6565726373;
          if (!v16) {
            goto LABEL_47;
          }
          goto LABEL_34;
        case 9:
          unint64_t v17 = 0xE400000000000000;
          unint64_t v18 = 1801678700;
          if (!v16) {
            goto LABEL_47;
          }
          goto LABEL_34;
        case 10:
          unint64_t v17 = 0xE600000000000000;
          unint64_t v18 = 0x6B636F6C6E75;
          if (!v16) {
            goto LABEL_47;
          }
          goto LABEL_34;
        case 11:
          unint64_t v17 = 0xE400000000000000;
          unint64_t v18 = 1701667182;
          if (!v16) {
            goto LABEL_47;
          }
          goto LABEL_34;
        case 12:
          unint64_t v17 = 0xE500000000000000;
          unint64_t v18 = 0x73656D616ELL;
          if (!v16) {
            goto LABEL_47;
          }
          goto LABEL_34;
        case 13:
          unint64_t v17 = 0xE500000000000000;
          unint64_t v18 = 0x7265776F70;
          goto LABEL_33;
        case 14:
          unint64_t v17 = 0xE800000000000000;
          unint64_t v18 = 0x6E776F6474756873;
          if (!v16) {
            goto LABEL_47;
          }
          goto LABEL_34;
        case 15:
LABEL_33:
          if (v16) {
            goto LABEL_34;
          }
          goto LABEL_47;
        default:
          unint64_t v17 = 0xEE0079726F676574;
          unint64_t v18 = 0x61436D6574737973;
          if (!v16)
          {
LABEL_47:
            swift_bridgeObjectRelease();
LABEL_48:
            (*v29)(v8, v2);
            goto LABEL_49;
          }
LABEL_34:
          if (v15 == v18 && v16 == v17)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            char v20 = sub_2378C95A0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v20 & 1) == 0) {
              goto LABEL_48;
            }
          }
          unint64_t v21 = *v30;
          (*v30)(v6, v8, v2);
          uint64_t v22 = v36;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2378B2404(0, *(void *)(v22 + 16) + 1, 1);
            uint64_t v22 = v36;
          }
          unint64_t v24 = *(void *)(v22 + 16);
          unint64_t v23 = *(void *)(v22 + 24);
          if (v24 >= v23 >> 1)
          {
            sub_2378B2404(v23 > 1, v24 + 1, 1);
            uint64_t v22 = v36;
          }
          *(void *)(v22 + 16) = v24 + 1;
          unint64_t v25 = v22 + v12 + v24 * v13;
          uint64_t v6 = v28;
          v21((char *)v25, v28, v2);
          uint64_t v36 = v22;
LABEL_49:
          unint64_t v11 = v14;
          uint64_t v9 = v34;
          if (v35 != v14) {
            continue;
          }
          uint64_t v10 = v36;
          break;
      }
      break;
    }
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2378AE6E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689348E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2378AE748(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2378AE790()
{
  uint64_t v0 = sub_2378C9280();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v4 = sub_2378C9150();
  if (!v4) {
    goto LABEL_12;
  }
  unint64_t v5 = v4;
  uint64_t v6 = v4 & 0xFFFFFFFFFFFFFF8;
  if (!(v4 >> 62))
  {
    uint64_t result = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_4;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  uint64_t result = sub_2378C9560();
  if (!result) {
    goto LABEL_11;
  }
LABEL_4:
  if ((v5 & 0xC000000000000001) != 0)
  {
    MEMORY[0x237E23F90](0, v5);
    goto LABEL_7;
  }
  if (*(void *)(v6 + 16))
  {
    swift_retain();
LABEL_7:
    swift_bridgeObjectRelease();
    sub_2378C9010();
    swift_release();
    if (v15[1])
    {
      uint64_t v8 = sub_2378C9040();
      swift_release();
      if (v8)
      {
        sub_2378B1344();
        char v10 = v9;
        swift_bridgeObjectRelease();
        return v10 & 1;
      }
    }
LABEL_12:
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer(v0, (uint64_t)qword_268936078);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v11, v0);
    unint64_t v12 = sub_2378C9270();
    os_log_type_t v13 = sub_2378C9430();
    if (os_log_type_enabled(v12, v13))
    {
      unint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v14 = 0;
      _os_log_impl(&dword_237899000, v12, v13, "SystemCommandsIntent isTurnOffDevice | no identifiers found", v14, 2u);
      MEMORY[0x237E24570](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    char v10 = 0;
    return v10 & 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_2378AEA04(int64_t a1)
{
  uint64_t v2 = sub_2378C9280();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v114 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  char v118 = (char *)&v114 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v119 = (char *)&v114 - v9;
  uint64_t v129 = sub_2378C9060();
  v121 = *(void (***)(char *, uint64_t))(v129 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v129);
  v128 = (char *)&v114 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v127 = (char *)&v114 - v12;
  uint64_t v13 = sub_2378C9000();
  uint64_t v134 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v126 = (char *)&v114 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v130 = (char *)&v114 - v21;
  if (!a1)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v53 = __swift_project_value_buffer(v2, (uint64_t)qword_268936078);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v53, v2);
    uint64_t v54 = sub_2378C9270();
    os_log_type_t v55 = sub_2378C9440();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v56 = 0;
      _os_log_impl(&dword_237899000, v54, v55, "SystemCommandsIntent isHomeAutomationParse | No UserEntities found", v56, 2u);
      MEMORY[0x237E24570](v56, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  uint64_t v114 = v20;
  uint64_t v115 = v19;
  uint64_t v133 = v18;
  if ((unint64_t)a1 >> 62) {
    goto LABEL_118;
  }
  uint64_t v22 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v116 = v3;
    uint64_t v117 = v2;
    if (v22) {
      break;
    }
    swift_bridgeObjectRelease();
    unint64_t v24 = (char *)MEMORY[0x263F8EE78];
LABEL_67:
    uint64_t v57 = *((void *)v24 + 2);
    if (!v57)
    {
      uint64_t v59 = MEMORY[0x263F8EE78];
LABEL_90:
      swift_bridgeObjectRelease();
      unint64_t v72 = *(void *)(v59 + 16);
      if (v72)
      {
        uint64_t v73 = *(void (**)(void, void, void))(v134 + 16);
        unint64_t v74 = v59 + ((*(unsigned __int8 *)(v134 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v134 + 80));
        LODWORD(v123) = *MEMORY[0x263F728D8];
        unint64_t v75 = v121++;
        os_log_type_t v122 = (void (**)(char *, void, uint64_t))(v75 + 13);
        v134 += 16;
        uint64_t v120 = *(void *)(v134 + 56);
        uint64_t v76 = v133;
        uint64_t v77 = v130;
        uint64_t v124 = (void (**)(char *, uint64_t))(v134 - 8);
        uint64_t v125 = v73;
        uint64_t v78 = v127;
        int64_t v79 = v121;
        while (1)
        {
          unint64_t v131 = v72;
          v73(v77, v74, v76);
          sub_2378C8FD0();
          uint64_t v81 = v128;
          uint64_t v80 = v129;
          (*v122)(v128, v123, v129);
          LODWORD(v132) = MEMORY[0x237E23AF0](v78, v81);
          uint64_t v82 = v76;
          uint64_t v83 = *v79;
          uint64_t v84 = v81;
          uint64_t v73 = v125;
          (*v79)(v84, v80);
          v83(v78, v80);
          uint64_t v76 = v82;
          uint64_t v85 = v126;
          v73(v126, v77, v82);
          if (v132) {
            break;
          }
          sub_2378C8FF0();
          int v86 = sub_2378B1660();
          char v87 = *v124;
          (*v124)(v85, v76);
          if (v86 != 10) {
            goto LABEL_103;
          }
          uint64_t v77 = v130;
          v87(v130, v76);
          v74 += v120;
          unint64_t v72 = v131 - 1;
          if (v131 == 1) {
            goto LABEL_95;
          }
        }
        char v87 = *v124;
        (*v124)(v85, v76);
LABEL_103:
        swift_bridgeObjectRelease();
        uint64_t v98 = v116;
        uint64_t v97 = v117;
        uint64_t v99 = v119;
        uint64_t v100 = v130;
        if (qword_268934168 != -1) {
          swift_once();
        }
        uint64_t v101 = __swift_project_value_buffer(v97, (uint64_t)qword_268936078);
        (*(void (**)(char *, uint64_t, uint64_t))(v98 + 16))(v99, v101, v97);
        uint64_t v102 = v115;
        uint64_t v103 = v100;
        uint64_t v104 = v133;
        uint64_t v105 = v125;
        v125(v115, v103, v133);
        uint64_t v106 = sub_2378C9270();
        os_log_type_t v107 = sub_2378C9440();
        int v108 = v107;
        if (os_log_type_enabled(v106, v107))
        {
          uint64_t v109 = swift_slowAlloc();
          LODWORD(v131) = v108;
          uint64_t v110 = (uint8_t *)v109;
          uint64_t v132 = swift_slowAlloc();
          uint64_t v136 = v132;
          *(_DWORD *)uint64_t v110 = 136315138;
          uint64_t v129 = (uint64_t)(v110 + 4);
          v105(v114, (uint64_t)v102, v104);
          uint64_t v111 = sub_2378C92F0();
          uint64_t v135 = sub_2378A1964(v111, v112, &v136);
          sub_2378C94B0();
          swift_bridgeObjectRelease();
          v87(v102, v104);
          _os_log_impl(&dword_237899000, v106, (os_log_type_t)v131, "SystemCommandsIntent isHomeAutomationParse | Found HA identifier: %s", v110, 0xCu);
          uint64_t v95 = 1;
          uint64_t v113 = v132;
          swift_arrayDestroy();
          MEMORY[0x237E24570](v113, -1, -1);
          MEMORY[0x237E24570](v110, -1, -1);

          (*(void (**)(char *, uint64_t))(v98 + 8))(v119, v117);
          v87(v130, v104);
        }
        else
        {

          v87(v102, v104);
          (*(void (**)(char *, uint64_t))(v98 + 8))(v119, v97);
          v87(v130, v104);
          return 1;
        }
        return v95;
      }
LABEL_95:
      swift_bridgeObjectRelease();
      uint64_t v89 = v116;
      uint64_t v88 = v117;
      uint64_t v90 = v118;
      if (qword_268934168 != -1) {
        swift_once();
      }
      uint64_t v91 = __swift_project_value_buffer(v88, (uint64_t)qword_268936078);
      (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v90, v91, v88);
      uint64_t v92 = sub_2378C9270();
      os_log_type_t v93 = sub_2378C9440();
      if (os_log_type_enabled(v92, v93))
      {
        os_log_type_t v94 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v94 = 0;
        _os_log_impl(&dword_237899000, v92, v93, "SystemCommandsIntent isHomeAutomationParse | No HA identifiers found, parse is not HomeAutomation", v94, 2u);
        MEMORY[0x237E24570](v94, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v89 + 8))(v90, v88);
      return 0;
    }
    swift_bridgeObjectRetain();
    uint64_t v58 = 0;
    uint64_t v59 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v60 = *(void *)&v24[8 * v58 + 32];
      uint64_t v61 = *(void *)(v60 + 16);
      a1 = *(void *)(v59 + 16);
      int64_t v62 = a1 + v61;
      if (__OFADD__(a1, v61)) {
        break;
      }
      swift_bridgeObjectRetain();
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v62 > *(void *)(v59 + 24) >> 1)
      {
        if (a1 <= v62) {
          int64_t v64 = a1 + v61;
        }
        else {
          int64_t v64 = a1;
        }
        uint64_t v59 = sub_2378B1888(isUniquelyReferenced_nonNull_native, v64, 1, v59);
      }
      if (*(void *)(v60 + 16))
      {
        uint64_t v65 = *(void *)(v59 + 16);
        if ((*(void *)(v59 + 24) >> 1) - v65 < v61) {
          goto LABEL_115;
        }
        unint64_t v66 = (*(unsigned __int8 *)(v134 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v134 + 80);
        uint64_t v67 = *(void *)(v134 + 72);
        unint64_t v68 = v59 + v66 + v67 * v65;
        if (v60 + v66 < v68 + v67 * v61 && v68 < v60 + v66 + v67 * v61) {
          goto LABEL_119;
        }
        swift_arrayInitWithCopy();
        if (v61)
        {
          uint64_t v70 = *(void *)(v59 + 16);
          BOOL v25 = __OFADD__(v70, v61);
          uint64_t v71 = v70 + v61;
          if (v25) {
            goto LABEL_116;
          }
          *(void *)(v59 + 16) = v71;
        }
      }
      else if (v61)
      {
        goto LABEL_113;
      }
      swift_bridgeObjectRelease();
      if (v57 == ++v58)
      {
        swift_bridgeObjectRelease();
        goto LABEL_90;
      }
    }
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
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_2378C9560();
  }
  uint64_t v3 = 0;
  unint64_t v23 = a1 & 0xC000000000000001;
  unint64_t v24 = (char *)MEMORY[0x263F8EE78];
  uint64_t v123 = v22;
  uint64_t v124 = (void (**)(char *, uint64_t))a1;
  unint64_t v131 = a1 & 0xC000000000000001;
  uint64_t v125 = (void (*)(void, void, void))(a1 + 32);
  while (1)
  {
    uint64_t v132 = (uint64_t)v24;
    if (v23) {
      MEMORY[0x237E23F90](v3, a1);
    }
    else {
      swift_retain();
    }
    BOOL v25 = __OFADD__(v3++, 1);
    if (v25) {
      goto LABEL_114;
    }
    sub_2378C9010();
    if (!v136)
    {
      swift_release();
      goto LABEL_28;
    }
    sub_2378C8FC0();
    swift_release();
    uint64_t v26 = sub_2378C9190();
    swift_release();
    if (*(void *)(v26 + 16))
    {
      unint64_t v27 = sub_2378B22A8(0x73656D616ELL, 0xE500000000000000);
      if (v28) {
        break;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
LABEL_28:
    unint64_t v24 = (char *)v132;
LABEL_29:
    if (v3 == v22)
    {
      swift_bridgeObjectRelease();
      goto LABEL_67;
    }
  }
  unint64_t v29 = *(void *)(*(void *)(v26 + 56) + 8 * v27);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_2378C9560();
    if (!v30) {
      goto LABEL_32;
    }
LABEL_15:
    if (v30 < 1) {
      goto LABEL_117;
    }
    uint64_t v31 = 0;
    uint64_t v2 = MEMORY[0x263F8EE78];
    do
    {
      if ((v29 & 0xC000000000000001) != 0) {
        MEMORY[0x237E23F90](v31, v29);
      }
      else {
        swift_retain();
      }
      uint64_t v32 = sub_2378C9180();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v2 = (uint64_t)sub_2378B1AB4(0, *(void *)(v2 + 16) + 1, 1, v2);
      }
      unint64_t v34 = *(void *)(v2 + 16);
      unint64_t v33 = *(void *)(v2 + 24);
      if (v34 >= v33 >> 1) {
        uint64_t v2 = (uint64_t)sub_2378B1AB4((char *)(v33 > 1), v34 + 1, 1, v2);
      }
      ++v31;
      *(void *)(v2 + 16) = v34 + 1;
      *(void *)(v2 + 8 * v34 + 32) = v32;
    }
    while (v30 != v31);
  }
  else
  {
    uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v30) {
      goto LABEL_15;
    }
LABEL_32:
    uint64_t v2 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease_n();
  uint64_t v35 = *(void *)(v2 + 16);
  if (!v35)
  {
    swift_release();
    uint64_t v37 = MEMORY[0x263F8EE78];
LABEL_56:
    swift_bridgeObjectRelease();
    unint64_t v24 = (char *)v132;
    char v50 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = v123;
    a1 = (int64_t)v124;
    if ((v50 & 1) == 0) {
      unint64_t v24 = sub_2378B1AB4(0, *((void *)v24 + 2) + 1, 1, (uint64_t)v24);
    }
    unint64_t v23 = v131;
    unint64_t v52 = *((void *)v24 + 2);
    unint64_t v51 = *((void *)v24 + 3);
    if (v52 >= v51 >> 1) {
      unint64_t v24 = sub_2378B1AB4((char *)(v51 > 1), v52 + 1, 1, (uint64_t)v24);
    }
    *((void *)v24 + 2) = v52 + 1;
    *(void *)&v24[8 * v52 + 32] = v37;
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  uint64_t v36 = 0;
  uint64_t v37 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v38 = *(void *)(v2 + 8 * v36 + 32);
    uint64_t v39 = *(void *)(v38 + 16);
    a1 = *(void *)(v37 + 16);
    int64_t v40 = a1 + v39;
    if (__OFADD__(a1, v39))
    {
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
      goto LABEL_112;
    }
    swift_bridgeObjectRetain();
    int v41 = swift_isUniquelyReferenced_nonNull_native();
    if (!v41 || v40 > *(void *)(v37 + 24) >> 1)
    {
      if (a1 <= v40) {
        int64_t v42 = a1 + v39;
      }
      else {
        int64_t v42 = a1;
      }
      uint64_t v37 = sub_2378B1888(v41, v42, 1, v37);
    }
    if (*(void *)(v38 + 16)) {
      break;
    }
    if (v39) {
      goto LABEL_109;
    }
LABEL_53:
    ++v36;
    swift_bridgeObjectRelease();
    if (v35 == v36)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_56;
    }
  }
  uint64_t v43 = *(void *)(v37 + 16);
  if ((*(void *)(v37 + 24) >> 1) - v43 < v39) {
    goto LABEL_110;
  }
  unint64_t v44 = (*(unsigned __int8 *)(v134 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v134 + 80);
  uint64_t v45 = *(void *)(v134 + 72);
  unint64_t v46 = v37 + v44 + v45 * v43;
  if (v38 + v44 >= v46 + v45 * v39 || v46 >= v38 + v44 + v45 * v39)
  {
    swift_arrayInitWithCopy();
    if (v39)
    {
      uint64_t v48 = *(void *)(v37 + 16);
      BOOL v25 = __OFADD__(v48, v39);
      uint64_t v49 = v48 + v39;
      if (v25) {
        goto LABEL_111;
      }
      *(void *)(v37 + 16) = v49;
    }
    goto LABEL_53;
  }
LABEL_119:
  uint64_t result = sub_2378C9570();
  __break(1u);
  return result;
}

uint64_t sub_2378AF82C(int64_t a1)
{
  uint64_t v2 = sub_2378C9280();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v114 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  char v118 = (char *)&v114 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v119 = (char *)&v114 - v9;
  uint64_t v129 = sub_2378C9060();
  v121 = *(void (***)(char *, uint64_t))(v129 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v129);
  v128 = (char *)&v114 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v127 = (char *)&v114 - v12;
  uint64_t v13 = sub_2378C9000();
  uint64_t v134 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v126 = (char *)&v114 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v130 = (char *)&v114 - v21;
  if (!a1)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v53 = __swift_project_value_buffer(v2, (uint64_t)qword_268936078);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v53, v2);
    uint64_t v54 = sub_2378C9270();
    os_log_type_t v55 = sub_2378C9440();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v56 = 0;
      _os_log_impl(&dword_237899000, v54, v55, "SystemCommandsIntent isMediaPlayerParse | No UserEntities found", v56, 2u);
      MEMORY[0x237E24570](v56, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  uint64_t v114 = v20;
  uint64_t v115 = v19;
  uint64_t v133 = v18;
  if ((unint64_t)a1 >> 62) {
    goto LABEL_118;
  }
  uint64_t v22 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v116 = v3;
    uint64_t v117 = v2;
    if (v22) {
      break;
    }
    swift_bridgeObjectRelease();
    unint64_t v24 = (char *)MEMORY[0x263F8EE78];
LABEL_67:
    uint64_t v57 = *((void *)v24 + 2);
    if (!v57)
    {
      uint64_t v59 = MEMORY[0x263F8EE78];
LABEL_90:
      swift_bridgeObjectRelease();
      unint64_t v72 = *(void *)(v59 + 16);
      if (v72)
      {
        uint64_t v73 = *(void (**)(void, void, void))(v134 + 16);
        unint64_t v74 = v59 + ((*(unsigned __int8 *)(v134 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v134 + 80));
        LODWORD(v123) = *MEMORY[0x263F728D8];
        unint64_t v75 = v121++;
        os_log_type_t v122 = (void (**)(char *, void, uint64_t))(v75 + 13);
        v134 += 16;
        uint64_t v120 = *(void *)(v134 + 56);
        uint64_t v76 = v133;
        uint64_t v77 = v130;
        uint64_t v124 = (void (**)(char *, uint64_t))(v134 - 8);
        uint64_t v125 = v73;
        uint64_t v78 = v127;
        int64_t v79 = v121;
        while (1)
        {
          unint64_t v131 = v72;
          v73(v77, v74, v76);
          sub_2378C8FD0();
          uint64_t v81 = v128;
          uint64_t v80 = v129;
          (*v122)(v128, v123, v129);
          LODWORD(v132) = MEMORY[0x237E23AF0](v78, v81);
          uint64_t v82 = v76;
          uint64_t v83 = *v79;
          uint64_t v84 = v81;
          uint64_t v73 = v125;
          (*v79)(v84, v80);
          v83(v78, v80);
          uint64_t v76 = v82;
          uint64_t v85 = v126;
          v73(v126, v77, v82);
          if (v132) {
            break;
          }
          sub_2378C8FF0();
          int v86 = sub_2378B16AC();
          char v87 = *v124;
          (*v124)(v85, v76);
          if (v86 != 8) {
            goto LABEL_103;
          }
          uint64_t v77 = v130;
          v87(v130, v76);
          v74 += v120;
          unint64_t v72 = v131 - 1;
          if (v131 == 1) {
            goto LABEL_95;
          }
        }
        char v87 = *v124;
        (*v124)(v85, v76);
LABEL_103:
        swift_bridgeObjectRelease();
        uint64_t v98 = v116;
        uint64_t v97 = v117;
        uint64_t v99 = v119;
        uint64_t v100 = v130;
        if (qword_268934168 != -1) {
          swift_once();
        }
        uint64_t v101 = __swift_project_value_buffer(v97, (uint64_t)qword_268936078);
        (*(void (**)(char *, uint64_t, uint64_t))(v98 + 16))(v99, v101, v97);
        uint64_t v102 = v115;
        uint64_t v103 = v100;
        uint64_t v104 = v133;
        uint64_t v105 = v125;
        v125(v115, v103, v133);
        uint64_t v106 = sub_2378C9270();
        os_log_type_t v107 = sub_2378C9440();
        int v108 = v107;
        if (os_log_type_enabled(v106, v107))
        {
          uint64_t v109 = swift_slowAlloc();
          LODWORD(v131) = v108;
          uint64_t v110 = (uint8_t *)v109;
          uint64_t v132 = swift_slowAlloc();
          uint64_t v136 = v132;
          *(_DWORD *)uint64_t v110 = 136315138;
          uint64_t v129 = (uint64_t)(v110 + 4);
          v105(v114, (uint64_t)v102, v104);
          uint64_t v111 = sub_2378C92F0();
          uint64_t v135 = sub_2378A1964(v111, v112, &v136);
          sub_2378C94B0();
          swift_bridgeObjectRelease();
          v87(v102, v104);
          _os_log_impl(&dword_237899000, v106, (os_log_type_t)v131, "SystemCommandsIntent isMediaPlayerParse | Found MP identifier: %s", v110, 0xCu);
          uint64_t v95 = 1;
          uint64_t v113 = v132;
          swift_arrayDestroy();
          MEMORY[0x237E24570](v113, -1, -1);
          MEMORY[0x237E24570](v110, -1, -1);

          (*(void (**)(char *, uint64_t))(v98 + 8))(v119, v117);
          v87(v130, v104);
        }
        else
        {

          v87(v102, v104);
          (*(void (**)(char *, uint64_t))(v98 + 8))(v119, v97);
          v87(v130, v104);
          return 1;
        }
        return v95;
      }
LABEL_95:
      swift_bridgeObjectRelease();
      uint64_t v89 = v116;
      uint64_t v88 = v117;
      uint64_t v90 = v118;
      if (qword_268934168 != -1) {
        swift_once();
      }
      uint64_t v91 = __swift_project_value_buffer(v88, (uint64_t)qword_268936078);
      (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v90, v91, v88);
      uint64_t v92 = sub_2378C9270();
      os_log_type_t v93 = sub_2378C9440();
      if (os_log_type_enabled(v92, v93))
      {
        os_log_type_t v94 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v94 = 0;
        _os_log_impl(&dword_237899000, v92, v93, "SystemCommandsIntent isMediaPlayerParse | No MP identifiers found, parse is not MediaPlayer", v94, 2u);
        MEMORY[0x237E24570](v94, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v89 + 8))(v90, v88);
      return 0;
    }
    swift_bridgeObjectRetain();
    uint64_t v58 = 0;
    uint64_t v59 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v60 = *(void *)&v24[8 * v58 + 32];
      uint64_t v61 = *(void *)(v60 + 16);
      a1 = *(void *)(v59 + 16);
      int64_t v62 = a1 + v61;
      if (__OFADD__(a1, v61)) {
        break;
      }
      swift_bridgeObjectRetain();
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v62 > *(void *)(v59 + 24) >> 1)
      {
        if (a1 <= v62) {
          int64_t v64 = a1 + v61;
        }
        else {
          int64_t v64 = a1;
        }
        uint64_t v59 = sub_2378B1888(isUniquelyReferenced_nonNull_native, v64, 1, v59);
      }
      if (*(void *)(v60 + 16))
      {
        uint64_t v65 = *(void *)(v59 + 16);
        if ((*(void *)(v59 + 24) >> 1) - v65 < v61) {
          goto LABEL_115;
        }
        unint64_t v66 = (*(unsigned __int8 *)(v134 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v134 + 80);
        uint64_t v67 = *(void *)(v134 + 72);
        unint64_t v68 = v59 + v66 + v67 * v65;
        if (v60 + v66 < v68 + v67 * v61 && v68 < v60 + v66 + v67 * v61) {
          goto LABEL_119;
        }
        swift_arrayInitWithCopy();
        if (v61)
        {
          uint64_t v70 = *(void *)(v59 + 16);
          BOOL v25 = __OFADD__(v70, v61);
          uint64_t v71 = v70 + v61;
          if (v25) {
            goto LABEL_116;
          }
          *(void *)(v59 + 16) = v71;
        }
      }
      else if (v61)
      {
        goto LABEL_113;
      }
      swift_bridgeObjectRelease();
      if (v57 == ++v58)
      {
        swift_bridgeObjectRelease();
        goto LABEL_90;
      }
    }
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
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_2378C9560();
  }
  uint64_t v3 = 0;
  unint64_t v23 = a1 & 0xC000000000000001;
  unint64_t v24 = (char *)MEMORY[0x263F8EE78];
  uint64_t v123 = v22;
  uint64_t v124 = (void (**)(char *, uint64_t))a1;
  unint64_t v131 = a1 & 0xC000000000000001;
  uint64_t v125 = (void (*)(void, void, void))(a1 + 32);
  while (1)
  {
    uint64_t v132 = (uint64_t)v24;
    if (v23) {
      MEMORY[0x237E23F90](v3, a1);
    }
    else {
      swift_retain();
    }
    BOOL v25 = __OFADD__(v3++, 1);
    if (v25) {
      goto LABEL_114;
    }
    sub_2378C9010();
    if (!v136)
    {
      swift_release();
      goto LABEL_28;
    }
    sub_2378C8FC0();
    swift_release();
    uint64_t v26 = sub_2378C9190();
    swift_release();
    if (*(void *)(v26 + 16))
    {
      unint64_t v27 = sub_2378B22A8(0x73656D616ELL, 0xE500000000000000);
      if (v28) {
        break;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
LABEL_28:
    unint64_t v24 = (char *)v132;
LABEL_29:
    if (v3 == v22)
    {
      swift_bridgeObjectRelease();
      goto LABEL_67;
    }
  }
  unint64_t v29 = *(void *)(*(void *)(v26 + 56) + 8 * v27);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_2378C9560();
    if (!v30) {
      goto LABEL_32;
    }
LABEL_15:
    if (v30 < 1) {
      goto LABEL_117;
    }
    uint64_t v31 = 0;
    uint64_t v2 = MEMORY[0x263F8EE78];
    do
    {
      if ((v29 & 0xC000000000000001) != 0) {
        MEMORY[0x237E23F90](v31, v29);
      }
      else {
        swift_retain();
      }
      uint64_t v32 = sub_2378C9180();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v2 = (uint64_t)sub_2378B1AB4(0, *(void *)(v2 + 16) + 1, 1, v2);
      }
      unint64_t v34 = *(void *)(v2 + 16);
      unint64_t v33 = *(void *)(v2 + 24);
      if (v34 >= v33 >> 1) {
        uint64_t v2 = (uint64_t)sub_2378B1AB4((char *)(v33 > 1), v34 + 1, 1, v2);
      }
      ++v31;
      *(void *)(v2 + 16) = v34 + 1;
      *(void *)(v2 + 8 * v34 + 32) = v32;
    }
    while (v30 != v31);
  }
  else
  {
    uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v30) {
      goto LABEL_15;
    }
LABEL_32:
    uint64_t v2 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease_n();
  uint64_t v35 = *(void *)(v2 + 16);
  if (!v35)
  {
    swift_release();
    uint64_t v37 = MEMORY[0x263F8EE78];
LABEL_56:
    swift_bridgeObjectRelease();
    unint64_t v24 = (char *)v132;
    char v50 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = v123;
    a1 = (int64_t)v124;
    if ((v50 & 1) == 0) {
      unint64_t v24 = sub_2378B1AB4(0, *((void *)v24 + 2) + 1, 1, (uint64_t)v24);
    }
    unint64_t v23 = v131;
    unint64_t v52 = *((void *)v24 + 2);
    unint64_t v51 = *((void *)v24 + 3);
    if (v52 >= v51 >> 1) {
      unint64_t v24 = sub_2378B1AB4((char *)(v51 > 1), v52 + 1, 1, (uint64_t)v24);
    }
    *((void *)v24 + 2) = v52 + 1;
    *(void *)&v24[8 * v52 + 32] = v37;
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  uint64_t v36 = 0;
  uint64_t v37 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v38 = *(void *)(v2 + 8 * v36 + 32);
    uint64_t v39 = *(void *)(v38 + 16);
    a1 = *(void *)(v37 + 16);
    int64_t v40 = a1 + v39;
    if (__OFADD__(a1, v39))
    {
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
      goto LABEL_112;
    }
    swift_bridgeObjectRetain();
    int v41 = swift_isUniquelyReferenced_nonNull_native();
    if (!v41 || v40 > *(void *)(v37 + 24) >> 1)
    {
      if (a1 <= v40) {
        int64_t v42 = a1 + v39;
      }
      else {
        int64_t v42 = a1;
      }
      uint64_t v37 = sub_2378B1888(v41, v42, 1, v37);
    }
    if (*(void *)(v38 + 16)) {
      break;
    }
    if (v39) {
      goto LABEL_109;
    }
LABEL_53:
    ++v36;
    swift_bridgeObjectRelease();
    if (v35 == v36)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_56;
    }
  }
  uint64_t v43 = *(void *)(v37 + 16);
  if ((*(void *)(v37 + 24) >> 1) - v43 < v39) {
    goto LABEL_110;
  }
  unint64_t v44 = (*(unsigned __int8 *)(v134 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v134 + 80);
  uint64_t v45 = *(void *)(v134 + 72);
  unint64_t v46 = v37 + v44 + v45 * v43;
  if (v38 + v44 >= v46 + v45 * v39 || v46 >= v38 + v44 + v45 * v39)
  {
    swift_arrayInitWithCopy();
    if (v39)
    {
      uint64_t v48 = *(void *)(v37 + 16);
      BOOL v25 = __OFADD__(v48, v39);
      uint64_t v49 = v48 + v39;
      if (v25) {
        goto LABEL_111;
      }
      *(void *)(v37 + 16) = v49;
    }
    goto LABEL_53;
  }
LABEL_119:
  uint64_t result = sub_2378C9570();
  __break(1u);
  return result;
}

uint64_t sub_2378B0654(int64_t a1)
{
  uint64_t v2 = sub_2378C9280();
  uint64_t v103 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v97 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v101 = (char *)&v97 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (uint64_t)&v97 - v8;
  uint64_t v10 = sub_2378C9000();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (uint64_t)&v97 - v16;
  if (!a1)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v43 = __swift_project_value_buffer(v2, (uint64_t)qword_268936078);
    (*(void (**)(char *, uint64_t, uint64_t))(v103 + 16))(v5, v43, v2);
    unint64_t v44 = sub_2378C9270();
    os_log_type_t v45 = sub_2378C9440();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = v2;
      os_log_type_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v47 = 0;
      _os_log_impl(&dword_237899000, v44, v45, "SystemCommandsIntent isSettingsParse | No UserEntities found", v47, 2u);
      uint64_t v48 = v47;
      uint64_t v2 = v46;
      MEMORY[0x237E24570](v48, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v103 + 8))(v5, v2);
    return 0;
  }
  uint64_t v97 = v15;
  uint64_t v98 = v14;
  if ((unint64_t)a1 >> 62) {
    goto LABEL_117;
  }
  uint64_t v18 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v99 = v9;
    uint64_t v100 = v2;
    uint64_t v110 = v10;
    uint64_t v104 = v17;
    if (v18) {
      break;
    }
    swift_bridgeObjectRelease();
    uint64_t v19 = (char *)MEMORY[0x263F8EE78];
LABEL_68:
    uint64_t v49 = v19;
    uint64_t v50 = *((void *)v19 + 2);
    if (!v50)
    {
      uint64_t v2 = MEMORY[0x263F8EE78];
LABEL_91:
      swift_bridgeObjectRelease();
      uint64_t v63 = *(void *)(v2 + 16);
      if (v63)
      {
        unint64_t v66 = *(void (**)(void, void, void))(v11 + 16);
        uint64_t v65 = v11 + 16;
        int64_t v64 = v66;
        unint64_t v67 = v2 + ((*(unsigned __int8 *)(v65 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 64));
        uint64_t v109 = v65 - 8;
        uint64_t v68 = *(void *)(v65 + 56);
        uint64_t v69 = v10;
        while (1)
        {
          uint64_t v70 = v64;
          v64(v17, v67, v69);
          sub_2378C8FF0();
          uint64_t v71 = sub_2378C9580();
          swift_bridgeObjectRelease();
          if (!v71) {
            break;
          }
          (*(void (**)(uint64_t, uint64_t))v109)(v17, v69);
          v67 += v68;
          --v63;
          int64_t v64 = v70;
          if (!v63) {
            goto LABEL_95;
          }
        }
        swift_bridgeObjectRelease();
        if (qword_268934168 != -1) {
          swift_once();
        }
        uint64_t v81 = v100;
        uint64_t v82 = __swift_project_value_buffer(v100, (uint64_t)qword_268936078);
        uint64_t v83 = v103;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v103 + 16))(v99, v82, v81);
        uint64_t v84 = v98;
        uint64_t v85 = v104;
        uint64_t v86 = v110;
        v70(v98, v104, v110);
        char v87 = sub_2378C9270();
        os_log_type_t v88 = sub_2378C9440();
        if (os_log_type_enabled(v87, v88))
        {
          uint64_t v89 = (uint8_t *)swift_slowAlloc();
          uint64_t v108 = swift_slowAlloc();
          uint64_t v112 = v108;
          *(_DWORD *)uint64_t v89 = 136315138;
          os_log_type_t v107 = v89 + 4;
          v70(v97, v84, v86);
          uint64_t v90 = sub_2378C92F0();
          uint64_t v91 = v86;
          uint64_t v111 = sub_2378A1964(v90, v92, &v112);
          sub_2378C94B0();
          swift_bridgeObjectRelease();
          os_log_type_t v93 = *(void (**)(uint64_t, uint64_t))v109;
          (*(void (**)(uint64_t, uint64_t))v109)(v84, v86);
          os_log_type_t v94 = v89;
          _os_log_impl(&dword_237899000, v87, v88, "SystemCommandsIntent isSettingsParse | Found MP identifier: %s", v89, 0xCu);
          uint64_t v79 = 1;
          uint64_t v95 = v108;
          swift_arrayDestroy();
          MEMORY[0x237E24570](v95, -1, -1);
          MEMORY[0x237E24570](v94, -1, -1);

          (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v99, v100);
          v93(v104, v91);
        }
        else
        {

          uint64_t v96 = *(void (**)(uint64_t, uint64_t))v109;
          (*(void (**)(uint64_t, uint64_t))v109)(v84, v86);
          (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v99, v81);
          v96(v85, v86);
          return 1;
        }
        return v79;
      }
LABEL_95:
      swift_bridgeObjectRelease();
      uint64_t v72 = v100;
      uint64_t v73 = v101;
      uint64_t v74 = v103;
      if (qword_268934168 != -1) {
        swift_once();
      }
      uint64_t v75 = __swift_project_value_buffer(v72, (uint64_t)qword_268936078);
      (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v73, v75, v72);
      uint64_t v76 = sub_2378C9270();
      os_log_type_t v77 = sub_2378C9440();
      if (os_log_type_enabled(v76, v77))
      {
        uint64_t v78 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v78 = 0;
        _os_log_impl(&dword_237899000, v76, v77, "SystemCommandsIntent isMediaPlayerParse | No MP identifiers found, parse is not MediaPlayer", v78, 2u);
        MEMORY[0x237E24570](v78, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v103 + 8))(v73, v72);
      return 0;
    }
    uint64_t v9 = (uint64_t)v49;
    swift_bridgeObjectRetain();
    uint64_t v17 = 0;
    uint64_t v2 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v51 = *(void *)(v9 + 8 * v17 + 32);
      uint64_t v52 = *(void *)(v51 + 16);
      a1 = *(void *)(v2 + 16);
      int64_t v53 = a1 + v52;
      if (__OFADD__(a1, v52)) {
        break;
      }
      swift_bridgeObjectRetain();
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v53 > *(void *)(v2 + 24) >> 1)
      {
        if (a1 <= v53) {
          int64_t v55 = a1 + v52;
        }
        else {
          int64_t v55 = a1;
        }
        uint64_t v2 = sub_2378B1888(isUniquelyReferenced_nonNull_native, v55, 1, v2);
      }
      if (*(void *)(v51 + 16))
      {
        uint64_t v56 = *(void *)(v2 + 16);
        if ((*(void *)(v2 + 24) >> 1) - v56 < v52) {
          goto LABEL_114;
        }
        unint64_t v57 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
        uint64_t v58 = *(void *)(v11 + 72);
        unint64_t v59 = v2 + v57 + v58 * v56;
        if (v51 + v57 < v59 + v58 * v52 && v59 < v51 + v57 + v58 * v52) {
          goto LABEL_118;
        }
        swift_arrayInitWithCopy();
        if (v52)
        {
          uint64_t v61 = *(void *)(v2 + 16);
          BOOL v20 = __OFADD__(v61, v52);
          uint64_t v62 = v61 + v52;
          if (v20) {
            goto LABEL_115;
          }
          *(void *)(v2 + 16) = v62;
        }
      }
      else if (v52)
      {
        goto LABEL_112;
      }
      swift_bridgeObjectRelease();
      if (v50 == ++v17)
      {
        swift_bridgeObjectRelease();
        uint64_t v17 = v104;
        goto LABEL_91;
      }
    }
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
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_2378C9560();
  }
  uint64_t v2 = 0;
  uint64_t v108 = a1 & 0xC000000000000001;
  int64_t v106 = a1 + 32;
  uint64_t v19 = (char *)MEMORY[0x263F8EE78];
  int64_t v102 = a1;
  uint64_t v109 = v11;
  os_log_type_t v107 = (uint8_t *)v18;
  while (1)
  {
    if (v108) {
      MEMORY[0x237E23F90](v2, a1);
    }
    else {
      swift_retain();
    }
    BOOL v20 = __OFADD__(v2++, 1);
    if (v20) {
      goto LABEL_113;
    }
    sub_2378C9010();
    if (v112) {
      break;
    }
    swift_release();
LABEL_59:
    if (v2 == v18)
    {
      swift_bridgeObjectRelease();
      goto LABEL_68;
    }
  }
  sub_2378C8FC0();
  swift_release();
  uint64_t v21 = sub_2378C9190();
  swift_release();
  if (!*(void *)(v21 + 16) || (unint64_t v22 = sub_2378B22A8(0x73656D616ELL, 0xE500000000000000), (v23 & 1) == 0))
  {
    swift_release();
    swift_bridgeObjectRelease();
LABEL_58:
    uint64_t v18 = (uint64_t)v107;
    goto LABEL_59;
  }
  unint64_t v24 = *(void *)(*(void *)(v21 + 56) + 8 * v22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_2378C9560();
  }
  else
  {
    uint64_t v11 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v105 = v19;
  if (v11)
  {
    if (v11 < 1) {
      goto LABEL_116;
    }
    uint64_t v25 = 0;
    uint64_t v17 = MEMORY[0x263F8EE78];
    do
    {
      if ((v24 & 0xC000000000000001) != 0) {
        MEMORY[0x237E23F90](v25, v24);
      }
      else {
        swift_retain();
      }
      uint64_t v26 = sub_2378C9180();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v17 = (uint64_t)sub_2378B1AB4(0, *(void *)(v17 + 16) + 1, 1, v17);
      }
      uint64_t v9 = *(void *)(v17 + 16);
      unint64_t v27 = *(void *)(v17 + 24);
      if (v9 >= v27 >> 1) {
        uint64_t v17 = (uint64_t)sub_2378B1AB4((char *)(v27 > 1), v9 + 1, 1, v17);
      }
      ++v25;
      *(void *)(v17 + 16) = v9 + 1;
      *(void *)(v17 + 8 * v9 + 32) = v26;
    }
    while (v11 != v25);
  }
  else
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease_n();
  uint64_t v10 = *(void *)(v17 + 16);
  if (!v10)
  {
    swift_release();
    uint64_t v28 = MEMORY[0x263F8EE78];
LABEL_53:
    swift_bridgeObjectRelease();
    uint64_t v19 = v105;
    char v40 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = v109;
    uint64_t v10 = v110;
    if ((v40 & 1) == 0) {
      uint64_t v19 = sub_2378B1AB4(0, *((void *)v19 + 2) + 1, 1, (uint64_t)v19);
    }
    uint64_t v17 = v104;
    unint64_t v42 = *((void *)v19 + 2);
    unint64_t v41 = *((void *)v19 + 3);
    if (v42 >= v41 >> 1) {
      uint64_t v19 = sub_2378B1AB4((char *)(v41 > 1), v42 + 1, 1, (uint64_t)v19);
    }
    *((void *)v19 + 2) = v42 + 1;
    *(void *)&v19[8 * v42 + 32] = v28;
    a1 = v102;
    goto LABEL_58;
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = 0;
  uint64_t v28 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v29 = *(void *)(v17 + 8 * v11 + 32);
    uint64_t v30 = *(void *)(v29 + 16);
    a1 = *(void *)(v28 + 16);
    uint64_t v9 = a1 + v30;
    if (__OFADD__(a1, v30))
    {
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
      goto LABEL_111;
    }
    swift_bridgeObjectRetain();
    int v31 = swift_isUniquelyReferenced_nonNull_native();
    if (!v31 || v9 > *(void *)(v28 + 24) >> 1)
    {
      if (a1 <= v9) {
        int64_t v32 = a1 + v30;
      }
      else {
        int64_t v32 = a1;
      }
      uint64_t v28 = sub_2378B1888(v31, v32, 1, v28);
    }
    if (*(void *)(v29 + 16)) {
      break;
    }
    if (v30) {
      goto LABEL_108;
    }
LABEL_50:
    ++v11;
    swift_bridgeObjectRelease();
    if (v10 == v11)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_53;
    }
  }
  uint64_t v33 = *(void *)(v28 + 16);
  if ((*(void *)(v28 + 24) >> 1) - v33 < v30) {
    goto LABEL_109;
  }
  unint64_t v34 = (*(unsigned __int8 *)(v109 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80);
  uint64_t v35 = *(void *)(v109 + 72);
  unint64_t v36 = v28 + v34 + v35 * v33;
  if (v29 + v34 >= v36 + v35 * v30 || v36 >= v29 + v34 + v35 * v30)
  {
    swift_arrayInitWithCopy();
    if (v30)
    {
      uint64_t v38 = *(void *)(v28 + 16);
      BOOL v20 = __OFADD__(v38, v30);
      uint64_t v39 = v38 + v30;
      if (v20) {
        goto LABEL_110;
      }
      *(void *)(v28 + 16) = v39;
    }
    goto LABEL_50;
  }
LABEL_118:
  uint64_t result = sub_2378C9570();
  __break(1u);
  return result;
}

uint64_t sub_2378B12D0()
{
  sub_2378C9160();
  char v0 = v4;
  if (v4)
  {
    uint64_t v1 = sub_2378AE214(0);
    swift_release();
    if (v1)
    {
      sub_2378B1344();
      char v0 = v2;
      swift_bridgeObjectRelease();
    }
    else
    {
      char v0 = 0;
    }
  }
  return v0 & 1;
}

void sub_2378B1344()
{
  OUTLINED_FUNCTION_10_1();
  uint64_t v1 = v0;
  char v3 = v2;
  uint64_t v4 = sub_2378C9000();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_27();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = *(void *)(v1 + 16);
  if (v11)
  {
    char v33 = v3;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    uint64_t v12 = v6 + 16;
    uint64_t v14 = v1 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    uint64_t v34 = *(void *)(v12 + 56);
    uint64_t v35 = v13;
    uint64_t v15 = (void (**)(uint64_t, uint64_t))(v12 - 8);
    swift_bridgeObjectRetain();
    uint64_t v16 = (char *)MEMORY[0x263F8EE78];
    do
    {
      v35(v10, v14, v4);
      uint64_t v17 = sub_2378C8FE0();
      uint64_t v19 = v18;
      (*v15)(v10, v4);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v16 = sub_2378B1798(0, *((void *)v16 + 2) + 1, 1, (uint64_t)v16);
      }
      unint64_t v21 = *((void *)v16 + 2);
      unint64_t v20 = *((void *)v16 + 3);
      if (v21 >= v20 >> 1) {
        uint64_t v16 = sub_2378B1798((char *)(v20 > 1), v21 + 1, 1, (uint64_t)v16);
      }
      *((void *)v16 + 2) = v21 + 1;
      unint64_t v22 = &v16[16 * v21];
      *((void *)v22 + 4) = v17;
      *((void *)v22 + 5) = v19;
      v14 += v34;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    char v3 = v33;
  }
  else
  {
    uint64_t v16 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v23 = sub_2378B2D50(v3);
  uint64_t v25 = v24;
  uint64_t v26 = *((void *)v16 + 2);
  if (!v26
    || ((unint64_t v27 = v23, *((void *)v16 + 4) == v23) ? (v28 = *((void *)v16 + 5) == v24) : (v28 = 0),
        v28 || (sub_2378C95A0() & 1) != 0 || v26 == 1))
  {
LABEL_26:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_0();
  }
  else
  {
    uint64_t v29 = v16 + 56;
    uint64_t v30 = 1;
    while (1)
    {
      uint64_t v31 = v30 + 1;
      if (__OFADD__(v30, 1)) {
        break;
      }
      if ((*(v29 - 1) != v27 || *v29 != v25) && (sub_2378C95A0() & 1) == 0)
      {
        v29 += 2;
        ++v30;
        if (v31 != v26) {
          continue;
        }
      }
      goto LABEL_26;
    }
    __break(1u);
  }
}

uint64_t sub_2378B1598(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_2378C95A0();
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
    if (v12 || (sub_2378C95A0() & 1) != 0) {
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

uint64_t sub_2378B1660()
{
  unint64_t v0 = sub_2378C9580();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA) {
    return 10;
  }
  else {
    return v0;
  }
}

uint64_t sub_2378B16AC()
{
  unint64_t v0 = sub_2378C9580();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

BOOL sub_2378B16F8()
{
  uint64_t v0 = sub_2378C9580();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_2378B1740(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_42_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

char *sub_2378B1798(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934910);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v12 = v10 + 32;
  if (v5)
  {
    sub_2378B1F14((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2378B1BA4(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_2378B1888(char a1, int64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934908);
  uint64_t v10 = *(void *)(sub_2378C9000() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = sub_2378C9550();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2378C9000() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_2378B1FA8(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2378B1C9C(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

char *sub_2378B1AB4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934928);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_2378B20D8((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2378B1DFC(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_2378B1BA4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_2378C9570();
  __break(1u);
  return result;
}

uint64_t sub_2378B1C9C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_2378C9000() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = sub_2378C9570();
  __break(1u);
  return result;
}

uint64_t sub_2378B1DFC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268934930);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_2378C9570();
  __break(1u);
  return result;
}

char *sub_2378B1F14(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2378C9570();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_2378B1FA8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_2378C9570();
    __break(1u);
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  if (a3 < a1 || (uint64_t result = sub_2378C9000(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = sub_2378C9000();
    return MEMORY[0x270FA01D8](a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  return result;
}

char *sub_2378B20D8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2378C9570();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_2378B216C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(sub_2378C9000() - 8) + 72) * a2, v6 = a3 + v5, v7 = a1 + v5, v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = sub_2378C9570();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

unint64_t sub_2378B2284(unint64_t result, char a2, uint64_t a3)
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

unint64_t sub_2378B22A8(uint64_t a1, uint64_t a2)
{
  sub_2378C95D0();
  sub_2378C9310();
  uint64_t v4 = sub_2378C95F0();
  return sub_2378B2320(a1, a2, v4);
}

unint64_t sub_2378B2320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2378C95A0() & 1) == 0)
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
      while (!v14 && (sub_2378C95A0() & 1) == 0);
    }
  }
  return v6;
}

size_t sub_2378B2404(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_2378B2424(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_2378B2424(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934908);
  uint64_t v10 = *(void *)(sub_2378C9000() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_2378C9000() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_2378B1FA8(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2378B216C(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t OUTLINED_FUNCTION_4_4(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_8_3(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(a1, a2);
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return sub_2378C9120();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_0(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return type metadata accessor for SystemCommandsIntent();
}

BOOL OUTLINED_FUNCTION_24_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_26_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_32_0(uint64_t a1)
{
  *(void *)(v1 - 120) = a1;
  return sub_2378C94B0();
}

uint64_t OUTLINED_FUNCTION_34_0(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(v2, a2);
}

_WORD *OUTLINED_FUNCTION_35_0(_WORD *result)
{
  *size_t result = 0;
  return result;
}

void OUTLINED_FUNCTION_36_0(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return sub_2378C9080();
}

BOOL OUTLINED_FUNCTION_38_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_39_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_43_0(float a1)
{
  *uint64_t v2 = a1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return sub_2378C9280();
}

void OUTLINED_FUNCTION_45_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

_WORD *OUTLINED_FUNCTION_48_0(_WORD *result)
{
  *size_t result = 0;
  return result;
}

uint64_t *SystemCommandsFeatureFlags.shared.unsafeMutableAddressor()
{
  if (qword_268934158 != -1) {
    swift_once();
  }
  return &static SystemCommandsFeatureFlags.shared;
}

const char *sub_2378B29C4()
{
  return "SiriSystemCommands";
}

const char *sub_2378B29D8(char a1)
{
  if (a1) {
    return "ScreenRecording";
  }
  else {
    return "NLX";
  }
}

BOOL sub_2378B2A04(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2378B2A14()
{
  return sub_2378C95E0();
}

uint64_t sub_2378B2A3C()
{
  return sub_2378C95F0();
}

BOOL sub_2378B2A84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2378B2A04(*a1, *a2);
}

uint64_t sub_2378B2A90()
{
  return sub_2378B2A3C();
}

uint64_t sub_2378B2A98()
{
  return sub_2378B2A14();
}

const char *sub_2378B2AA0()
{
  return sub_2378B29C4();
}

const char *sub_2378B2AA8()
{
  return sub_2378B29D8(*v0);
}

uint64_t sub_2378B2AB0()
{
  type metadata accessor for SystemCommandsFeatureFlags();
  uint64_t result = swift_initStaticObject();
  static SystemCommandsFeatureFlags.shared = result;
  return result;
}

uint64_t static SystemCommandsFeatureFlags.shared.getter()
{
  type metadata accessor for SystemCommandsFeatureFlags();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for SystemCommandsFeatureFlags()
{
  return self;
}

uint64_t sub_2378B2B30()
{
  return sub_2378B2B40(0);
}

uint64_t sub_2378B2B38()
{
  return sub_2378B2B40(1);
}

uint64_t sub_2378B2B40(char a1)
{
  uint64_t v5 = &type metadata for SystemCommandsFeatures;
  unint64_t v6 = sub_2378B2BB0();
  v4[0] = a1;
  char v2 = sub_2378C8E90();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2 & 1;
}

uint64_t SystemCommandsFeatureFlags.deinit()
{
  return v0;
}

uint64_t SystemCommandsFeatureFlags.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

unint64_t sub_2378B2BB0()
{
  unint64_t result = qword_268934938;
  if (!qword_268934938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934938);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SystemCommandsFeatures(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2378B2CC8);
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

ValueMetadata *type metadata accessor for SystemCommandsFeatures()
{
  return &type metadata for SystemCommandsFeatures;
}

unint64_t sub_2378B2D04()
{
  unint64_t result = qword_268934940;
  if (!qword_268934940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934940);
  }
  return result;
}

unint64_t sub_2378B2D50(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x74416D6574737973;
      break;
    case 2:
      unint64_t result = 0x7250726577736E61;
      break;
    case 3:
      unint64_t result = 0x656E6F6870;
      break;
    case 4:
      unint64_t result = 0x656E6F687069;
      break;
    case 5:
      unint64_t result = 1684107369;
      break;
    case 6:
      unint64_t result = 0x656369766564;
      break;
    case 7:
      unint64_t result = 0x746375646F7270;
      break;
    case 8:
      unint64_t result = 0x6E6565726373;
      break;
    case 9:
      unint64_t result = 1801678700;
      break;
    case 10:
      unint64_t result = 0x6B636F6C6E75;
      break;
    case 11:
      unint64_t result = 1701667182;
      break;
    case 12:
      unint64_t result = 0x73656D616ELL;
      break;
    case 13:
      unint64_t result = 0x7265776F70;
      break;
    case 14:
      unint64_t result = 0x6E776F6474756873;
      break;
    case 15:
      return result;
    default:
      unint64_t result = 0x61436D6574737973;
      break;
  }
  return result;
}

uint64_t SCSystemQueryFlow.__allocating_init(systemCategory:sharedObjects:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  SCSystemQueryFlow.init(systemCategory:sharedObjects:)(a1, a2, a3);
  return v6;
}

uint64_t sub_2378B2F80(char a1)
{
  if (a1) {
    return 0x646C697562;
  }
  else {
    return 0x6E6F6973726576;
  }
}

uint64_t SCSystemQueryFlow.init(systemCategory:sharedObjects:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  sub_2378A0150(a3 + 40, v3 + 32);
  sub_2378A0150(a3 + 80, (uint64_t)v6);
  sub_2378A0AE0(a3);
  sub_2378A0B34(v6, v3 + 72);
  return v3;
}

uint64_t SCSystemQueryFlow.on(input:)()
{
  return 1;
}

uint64_t SCSystemQueryFlow.execute()()
{
  OUTLINED_FUNCTION_41();
  v1[26] = v2;
  v1[27] = v0;
  sub_2378C8C00();
  v1[28] = swift_task_alloc();
  uint64_t v3 = sub_2378C8DB0();
  v1[29] = v3;
  OUTLINED_FUNCTION_0(v3);
  v1[30] = v4;
  v1[31] = swift_task_alloc();
  uint64_t v5 = sub_2378C9280();
  v1[32] = v5;
  OUTLINED_FUNCTION_0(v5);
  v1[33] = v6;
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  sub_2378C9260();
  v1[38] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2378B3168, 0, 0);
}

uint64_t sub_2378B3168()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  if (v2 == 0x6E6F6973726576 && v3 == 0xE700000000000000) {
    goto LABEL_7;
  }
  if (sub_2378C95A0())
  {
    uint64_t v1 = v0[27];
LABEL_7:
    type metadata accessor for SystemQueryCATPatternsExecutor(0);
    sub_2378C91C0();
    sub_2378A0150(v1 + 32, (uint64_t)(v0 + 12));
    sub_2378C91A0();
    sub_2378A1400((uint64_t)(v0 + 12));
    sub_2378C91B0();
    swift_release();
    sub_2378C9250();
    uint64_t v5 = sub_2378C91F0();
    v0[39] = v5;
    unint64_t v23 = (char *)&dword_268934970 + dword_268934970;
    swift_retain();
    uint64_t v6 = (void *)swift_task_alloc();
    v0[40] = v6;
    *uint64_t v6 = v0;
    uint64_t v7 = sub_2378B3530;
LABEL_14:
    v6[1] = v7;
    uint64_t v11 = v0[27];
    return ((uint64_t (*)(void, uint64_t, uint64_t))v23)(0, v5, v11);
  }
  BOOL v8 = v2 == 0x646C697562 && v3 == 0xE500000000000000;
  if (v8 || (uint64_t v9 = sub_2378C95A0(), (v9 & 1) != 0))
  {
    uint64_t v10 = v0[27];
    type metadata accessor for SystemQueryCATPatternsExecutor(0);
    sub_2378C91C0();
    sub_2378A0150(v10 + 32, (uint64_t)(v0 + 2));
    sub_2378C91A0();
    sub_2378A1400((uint64_t)(v0 + 2));
    sub_2378C91B0();
    swift_release();
    sub_2378C9250();
    uint64_t v5 = sub_2378C91F0();
    v0[43] = v5;
    unint64_t v23 = (char *)&dword_268934980 + dword_268934980;
    swift_retain();
    uint64_t v6 = (void *)swift_task_alloc();
    v0[44] = v6;
    *uint64_t v6 = v0;
    uint64_t v7 = sub_2378B3828;
    goto LABEL_14;
  }
  if (qword_268934168 != -1) {
    uint64_t v9 = swift_once();
  }
  uint64_t v13 = OUTLINED_FUNCTION_3_4(v9, (uint64_t)qword_268936078);
  v14(v13);
  uint64_t v15 = (void *)sub_2378C9270();
  os_log_type_t v16 = sub_2378C9450();
  if (OUTLINED_FUNCTION_20_1(v16))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_10_0(&dword_237899000, v17, v18, "SCSystemQueryFlow execute | invalid systemCategory");
    OUTLINED_FUNCTION_12();
  }
  uint64_t v19 = v0[35];
  uint64_t v20 = v0[32];
  uint64_t v21 = v0[33];

  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
  sub_2378C8CD0();
  OUTLINED_FUNCTION_1_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v22();
}

uint64_t sub_2378B3530()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 328) = v5;
  *(void *)(v3 + 336) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = sub_2378B3B20;
  }
  else
  {
    swift_release();
    uint64_t v6 = sub_2378B3620;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_2378B3620(uint64_t a1)
{
  if (qword_268934168 != -1) {
    a1 = swift_once();
  }
  uint64_t v2 = *(_WORD **)(v1 + 264);
  uint64_t v3 = OUTLINED_FUNCTION_3_4(a1, (uint64_t)qword_268936078);
  v4(v3);
  sub_2378C9270();
  os_log_type_t v5 = sub_2378C9440();
  if (OUTLINED_FUNCTION_20_1(v5))
  {
    uint64_t v2 = (_WORD *)swift_slowAlloc();
    *uint64_t v2 = 0;
    OUTLINED_FUNCTION_10_0(&dword_237899000, v6, v7, "SCSystemQueryFlow execute | QueryVersion pattern successfully executed");
    OUTLINED_FUNCTION_12();
  }
  OUTLINED_FUNCTION_13_1();
  uint64_t v8 = OUTLINED_FUNCTION_18_0();
  v9(v8);
  sub_2378C8BF0();
  sub_2378C8DA0();
  sub_2378A0150((uint64_t)(v2 + 36), v1 + 56);
  sub_2378C8D20();
  OUTLINED_FUNCTION_8_4();
  sub_2378C8D10();
  sub_2378C8A60();
  OUTLINED_FUNCTION_8_4();
  *(void *)(v1 + 200) = sub_2378C8A50();
  OUTLINED_FUNCTION_24_1();
  swift_release();
  sub_2378C8CC0();
  swift_release();

  uint64_t v10 = OUTLINED_FUNCTION_15_1();
  v11(v10);
  OUTLINED_FUNCTION_1_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v12();
}

uint64_t sub_2378B3828()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 360) = v5;
  *(void *)(v3 + 368) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = sub_2378B3D3C;
  }
  else
  {
    swift_release();
    uint64_t v6 = sub_2378B3918;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_2378B3918(uint64_t a1)
{
  if (qword_268934168 != -1) {
    a1 = swift_once();
  }
  uint64_t v2 = *(_WORD **)(v1 + 264);
  uint64_t v3 = OUTLINED_FUNCTION_3_4(a1, (uint64_t)qword_268936078);
  v4(v3);
  sub_2378C9270();
  os_log_type_t v5 = sub_2378C9440();
  if (OUTLINED_FUNCTION_20_1(v5))
  {
    uint64_t v2 = (_WORD *)swift_slowAlloc();
    *uint64_t v2 = 0;
    OUTLINED_FUNCTION_10_0(&dword_237899000, v6, v7, "SCSystemQueryFlow execute | QueryBuild pattern successfully executed");
    OUTLINED_FUNCTION_12();
  }
  OUTLINED_FUNCTION_13_1();
  uint64_t v8 = OUTLINED_FUNCTION_18_0();
  v9(v8);
  sub_2378C8BF0();
  sub_2378C8DA0();
  sub_2378A0150((uint64_t)(v2 + 36), v1 + 136);
  sub_2378C8D20();
  OUTLINED_FUNCTION_8_4();
  sub_2378C8D10();
  sub_2378C8A60();
  OUTLINED_FUNCTION_8_4();
  *(void *)(v1 + 176) = sub_2378C8A50();
  OUTLINED_FUNCTION_24_1();
  swift_release();
  sub_2378C8CC0();
  swift_release();

  uint64_t v10 = OUTLINED_FUNCTION_15_1();
  v11(v10);
  OUTLINED_FUNCTION_1_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v12();
}

uint64_t sub_2378B3B20()
{
  uint64_t v37 = v0;
  uint64_t v1 = (void *)v0[42];
  swift_release();
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[32], (uint64_t)qword_268936078);
  uint64_t v2 = OUTLINED_FUNCTION_10_2();
  v3(v2);
  id v4 = v1;
  id v5 = v1;
  uint64_t v6 = sub_2378C9270();
  os_log_type_t v7 = sub_2378C9450();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[33];
  uint64_t v9 = v0[34];
  uint64_t v11 = v0[32];
  if (v8)
  {
    OUTLINED_FUNCTION_9_1();
    uint64_t v36 = OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_11_2(v36, v12, v13, v14, v15, v16, v17, v18, 4.8149e-34, v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934C90);
    uint64_t v19 = sub_2378C92F0();
    uint64_t v21 = sub_2378A1964(v19, v20, &v36);
    OUTLINED_FUNCTION_16_1(v21, v22, v23, v24, v25, v26, v27, v28, v34, v35);
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_22_0(&dword_237899000, v29, v30, "SCSystemQueryFlow execute | error: %s");
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    (*(void (**)(uint64_t))(v10 + 8))(v9);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  sub_2378C8CD0();

  OUTLINED_FUNCTION_1_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v31();
}

uint64_t sub_2378B3D3C()
{
  uint64_t v37 = v0;
  uint64_t v1 = (void *)v0[46];
  swift_release();
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[32], (uint64_t)qword_268936078);
  uint64_t v2 = OUTLINED_FUNCTION_10_2();
  v3(v2);
  id v4 = v1;
  id v5 = v1;
  uint64_t v6 = sub_2378C9270();
  os_log_type_t v7 = sub_2378C9450();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[33];
  uint64_t v9 = v0[34];
  uint64_t v11 = v0[32];
  if (v8)
  {
    OUTLINED_FUNCTION_9_1();
    uint64_t v36 = OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_11_2(v36, v12, v13, v14, v15, v16, v17, v18, 4.8149e-34, v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934C90);
    uint64_t v19 = sub_2378C92F0();
    uint64_t v21 = sub_2378A1964(v19, v20, &v36);
    OUTLINED_FUNCTION_16_1(v21, v22, v23, v24, v25, v26, v27, v28, v34, v35);
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_22_0(&dword_237899000, v29, v30, "SCSystemQueryFlow execute | error: %s");
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    (*(void (**)(uint64_t))(v10 + 8))(v9);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  sub_2378C8CD0();

  OUTLINED_FUNCTION_1_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v31();
}

uint64_t SCSystemQueryFlow.execute(completion:)()
{
  return sub_2378C8A90();
}

uint64_t sub_2378B3FB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  os_log_type_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(self, sel_processInfo);
  objc_msgSend(v8, sel_operatingSystemVersion);
  uint64_t v9 = v25;
  unint64_t v10 = v26;
  uint64_t v11 = v27;

  uint64_t v25 = v9;
  uint64_t v23 = sub_2378C9590();
  unint64_t v24 = v12;
  uint64_t v25 = 46;
  unint64_t v26 = 0xE100000000000000;
  uint64_t v22 = v10;
  sub_2378C9590();
  sub_2378C9330();
  swift_bridgeObjectRelease();
  sub_2378C9330();
  swift_bridgeObjectRelease();
  if (v11)
  {
    uint64_t v25 = 46;
    unint64_t v26 = 0xE100000000000000;
    uint64_t v22 = v11;
    sub_2378C9590();
    sub_2378C9330();
    swift_bridgeObjectRelease();
    sub_2378C9330();
    swift_bridgeObjectRelease();
  }
  if (qword_268934168 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v2, (uint64_t)qword_268936078);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v13, v2);
  uint64_t v15 = v23;
  unint64_t v14 = v24;
  swift_bridgeObjectRetain_n();
  int v16 = sub_2378C9270();
  os_log_type_t v17 = sub_2378C9430();
  if (os_log_type_enabled(v16, v17))
  {
    int v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = OUTLINED_FUNCTION_63();
    v21[1] = a1;
    uint64_t v25 = v19;
    v21[0] = v2;
    *(_DWORD *)int v18 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_2378A1964(v15, v14, &v25);
    sub_2378C94B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_237899000, v16, v17, "SCSystemQueryFlow getVersion | version number is %s", v18, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    (*(void (**)(char *, void))(v4 + 8))(v7, v21[0]);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  }
  swift_beginAccess();
  return sub_2378C9210();
}

uint64_t sub_2378B4318@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v4 = v3;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v48 - v9;
  id v11 = objc_msgSend(self, sel_processInfo);
  id v12 = objc_msgSend(v11, sel_operatingSystemVersionString);

  uint64_t v13 = sub_2378C92E0();
  unint64_t v15 = v14;

  v56[0] = 32;
  v56[1] = 0xE100000000000000;
  int64_t v55 = v56;
  unint64_t v16 = sub_2378B4EAC(sub_2378B4FE0, (uint64_t)v54, v13, v15);
  if (v17)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v41 = __swift_project_value_buffer(v2, (uint64_t)qword_268936078);
    v4[2](v8, v41, v2);
    swift_bridgeObjectRetain();
    unint64_t v42 = sub_2378C9270();
    os_log_type_t v43 = sub_2378C9430();
    if (os_log_type_enabled(v42, v43))
    {
      unint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = OUTLINED_FUNCTION_63();
      int64_t v53 = (char *)v4;
      v56[0] = v45;
      uint64_t v52 = v2;
      *(_DWORD *)unint64_t v44 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_2378A1964(v13, v15, v56);
      OUTLINED_FUNCTION_21_1(v46);
      sub_2378C94B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237899000, v42, v43, "SCSystemQueryFlow getBuild | operatingSystemVersionString is in an unexpected format: %s", v44, 0xCu);
      OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_12();

      (*((void (**)(char *, uint64_t))v53 + 1))(v8, v52);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v4[1])(v8, v2);
    }
  }
  else
  {
    sub_2378B4840(v16, v13, v15);
    uint64_t v18 = OUTLINED_FUNCTION_6_4();
    sub_2378B48E4(v18, v19);
    unint64_t v20 = OUTLINED_FUNCTION_6_4();
    unint64_t v23 = sub_2378B49A0(v20, v21, v22);
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v30 = __swift_project_value_buffer(v2, (uint64_t)qword_268936078);
    v4[2](v10, v30, v2);
    swift_bridgeObjectRetain_n();
    int64_t v53 = v10;
    uint64_t v31 = sub_2378C9270();
    os_log_type_t v32 = sub_2378C9430();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v51 = v27;
      uint64_t v33 = swift_slowAlloc();
      uint64_t v52 = v25;
      uint64_t v34 = (uint8_t *)v33;
      uint64_t v49 = OUTLINED_FUNCTION_63();
      v56[0] = v49;
      uint64_t v50 = a1;
      *(_DWORD *)uint64_t v34 = 136315138;
      uint64_t v48 = v34 + 4;
      swift_bridgeObjectRetain();
      unint64_t v35 = v23;
      uint64_t v36 = MEMORY[0x237E23DA0](v23, v52, v51, v29);
      unint64_t v38 = v37;
      swift_bridgeObjectRelease();
      uint64_t v39 = v36;
      unint64_t v23 = v35;
      uint64_t v40 = sub_2378A1964(v39, v38, v56);
      OUTLINED_FUNCTION_21_1(v40);
      sub_2378C94B0();
      swift_bridgeObjectRelease_n();
      uint64_t v27 = v51;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237899000, v31, v32, "SCSystemQueryFlow getBuild | build number is %s", v34, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_12();
      uint64_t v25 = v52;
      OUTLINED_FUNCTION_12();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    ((void (*)(char *, uint64_t))v4[1])(v53, v2);
    MEMORY[0x237E23DA0](v23, v25, v27, v29);
    swift_bridgeObjectRelease();
  }
  return sub_2378C9210();
}

unint64_t sub_2378B4840(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 < result >> 14)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_2378C9360();
    swift_bridgeObjectRelease();
    return v4;
  }
  return result;
}

uint64_t sub_2378B48E4(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t result = sub_2378C9490();
    if (v3) {
      unint64_t v4 = a2;
    }
    else {
      unint64_t v4 = result;
    }
    if (v4 >> 14 >= a2 >> 14)
    {
      uint64_t v5 = sub_2378C94A0();
      swift_bridgeObjectRelease();
      return v5;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_2378B49A0(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t result = sub_2378C9490();
    if (v4) {
      unint64_t result = a3;
    }
    if (a3 >> 14 >= result >> 14)
    {
      uint64_t v5 = sub_2378C94A0();
      swift_bridgeObjectRelease();
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t SCSystemQueryFlow.deinit()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  return v0;
}

uint64_t SCSystemQueryFlow.__deallocating_deinit()
{
  SCSystemQueryFlow.deinit();
  return MEMORY[0x270FA0228](v0, 112, 7);
}

uint64_t sub_2378B4ABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2378B4B6C;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_2378B4B6C()
{
  OUTLINED_FUNCTION_41();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_4();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_1();
  *char v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_2378B4C3C()
{
  return SCSystemQueryFlow.execute(completion:)();
}

uint64_t sub_2378B4C60()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378B4CFC;
  return SCSystemQueryFlow.execute()();
}

uint64_t sub_2378B4CFC()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v3();
}

uint64_t sub_2378B4DC0(uint64_t a1, uint64_t a2)
{
  uint64_t Flow = type metadata accessor for SCSystemQueryFlow();
  return MEMORY[0x270F66CE8](Flow, a2);
}

uint64_t type metadata accessor for SCSystemQueryFlow()
{
  return self;
}

unint64_t sub_2378B4E1C()
{
  unint64_t result = qword_268934748;
  if (!qword_268934748)
  {
    type metadata accessor for SCSystemQueryFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934748);
  }
  return result;
}

uint64_t sub_2378B4E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_2378C95A0() & 1;
  }
}

unint64_t sub_2378B4EAC(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v5 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5) {
    return 0;
  }
  while (1)
  {
    unint64_t v7 = sub_2378C9320();
    v12[0] = sub_2378C9350();
    v12[1] = v8;
    char v9 = a1(v12);
    if (v4) {
      break;
    }
    char v10 = v9;
    swift_bridgeObjectRelease();
    if (v10) {
      return v7;
    }
    if (v7 < 0x4000) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_2378B4FB4(uint64_t *a1, uint64_t *a2)
{
  return sub_2378B4E68(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_2378B4FE0(uint64_t *a1)
{
  return sub_2378B4FB4(a1, *(uint64_t **)(v1 + 16)) & 1;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(v2, a2);
  return v3;
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return v0;
}

id OUTLINED_FUNCTION_11_2(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, float a9, uint64_t a10)
{
  *id v11 = a9;
  *id v12 = v10;
  return v10;
}

void OUTLINED_FUNCTION_13_1()
{
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  *a10 = a1;
  return sub_2378C94B0();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_20_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_21_1(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

void OUTLINED_FUNCTION_22_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return sub_2378C8A70();
}

uint64_t type metadata accessor for SystemQueryCATPatternsExecutor(uint64_t a1)
{
  return sub_2378B6288(a1, (uint64_t *)&unk_268934960);
}

uint64_t sub_2378B5230()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2378B5270()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
  uint64_t v3 = OUTLINED_FUNCTION_42(v2);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  os_log_type_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v23 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934718);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2378CA700;
  uint64_t v10 = (uint64_t *)(v9 + 48);
  *(void *)(v9 + 32) = 0x646C697562;
  *(void *)(v9 + 40) = 0xE500000000000000;
  sub_2378B6208(v1, (uint64_t)v8, &qword_268934978);
  uint64_t v11 = sub_2378C9220();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v11) == 1)
  {
    sub_2378B1740((uint64_t)v8, &qword_268934978);
    *(_OWORD *)uint64_t v10 = 0u;
    *(_OWORD *)(v9 + 64) = 0u;
  }
  else
  {
    *(void *)(v9 + 72) = v11;
    __swift_allocate_boxed_opaque_existential_1(v10);
    OUTLINED_FUNCTION_42_0();
    (*(void (**)(void))(v12 + 32))();
  }
  OUTLINED_FUNCTION_4_5();
  *(void *)(v9 + 80) = v13;
  *(void *)(v9 + 88) = v14;
  QueryBuildParameters = (int *)type metadata accessor for SystemQueryQueryBuildParameters(0);
  uint64_t v16 = *(void *)(v1 + QueryBuildParameters[5]);
  if (v16)
  {
    uint64_t v17 = sub_2378C9240();
    uint64_t v18 = v16;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    *(void *)(v9 + 104) = 0;
    *(void *)(v9 + 112) = 0;
  }
  *(void *)(v9 + 96) = v18;
  *(void *)(v9 + 120) = v17;
  *(void *)(v9 + 128) = 0xD000000000000017;
  *(void *)(v9 + 136) = 0x80000002378CB7F0;
  *(unsigned char *)(v9 + 144) = *(unsigned char *)(v1 + QueryBuildParameters[6]);
  OUTLINED_FUNCTION_11_3();
  *(void *)(v9 + 168) = v20;
  *(void *)(v9 + 176) = v19;
  *(void *)(v9 + 184) = 0xE700000000000000;
  sub_2378B6208(v1 + QueryBuildParameters[7], (uint64_t)v6, &qword_268934978);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v11) == 1)
  {
    swift_retain();
    sub_2378B1740((uint64_t)v6, &qword_268934978);
    *(_OWORD *)(v9 + 192) = 0u;
    *(_OWORD *)(v9 + 208) = 0u;
  }
  else
  {
    *(void *)(v9 + 216) = v11;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v9 + 192));
    OUTLINED_FUNCTION_42_0();
    (*(void (**)(void))(v21 + 32))();
    swift_retain();
  }
  return v9;
}

uint64_t sub_2378B54FC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
  uint64_t v2 = OUTLINED_FUNCTION_42(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_27();
  uint64_t v5 = v4 - v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934718);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2378CA710;
  OUTLINED_FUNCTION_4_5();
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v9;
  uint64_t v10 = *v0;
  if (*v0)
  {
    uint64_t v11 = sub_2378C9240();
    uint64_t v12 = v10;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    *(void *)(v6 + 56) = 0;
    *(void *)(v6 + 64) = 0;
  }
  *(void *)(v6 + 48) = v12;
  *(void *)(v6 + 72) = v11;
  *(void *)(v6 + 80) = 0xD000000000000017;
  *(void *)(v6 + 88) = 0x80000002378CB7F0;
  *(unsigned char *)(v6 + 96) = *((unsigned char *)v0 + 8);
  OUTLINED_FUNCTION_11_3();
  *(void *)(v6 + 120) = v14;
  *(void *)(v6 + 128) = v13;
  *(void *)(v6 + 136) = 0xE700000000000000;
  uint64_t QueryVersionParameters = type metadata accessor for SystemQueryQueryVersionParameters(0);
  sub_2378B6208((uint64_t)v0 + *(int *)(QueryVersionParameters + 24), v5, &qword_268934978);
  uint64_t v16 = sub_2378C9220();
  if (__swift_getEnumTagSinglePayload(v5, 1, v16) == 1)
  {
    swift_retain();
    sub_2378B1740(v5, &qword_268934978);
    *(_OWORD *)(v6 + 144) = 0u;
    *(_OWORD *)(v6 + 160) = 0u;
  }
  else
  {
    *(void *)(v6 + 168) = v16;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v6 + 144));
    OUTLINED_FUNCTION_42_0();
    (*(void (**)(void))(v17 + 32))();
    swift_retain();
  }
  return v6;
}

uint64_t sub_2378B56B0(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a2;
  *(void *)(v3 + 64) = a3;
  *(unsigned char *)(v3 + 128) = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
  OUTLINED_FUNCTION_42(v4);
  *(void *)(v3 + 72) = OUTLINED_FUNCTION_31();
  uint64_t QueryBuildParameters = type metadata accessor for SystemQueryQueryBuildParameters(0);
  *(void *)(v3 + 80) = QueryBuildParameters;
  OUTLINED_FUNCTION_42(QueryBuildParameters);
  *(void *)(v3 + 88) = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_2378B575C()
{
  uint64_t v2 = *(int **)(v0 + 80);
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  char v5 = *(unsigned char *)(v0 + 128);
  uint64_t v6 = sub_2378C9220();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v6);
  uint64_t v7 = v1 + v2[7];
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v6);
  uint64_t v8 = v2[5];
  *(void *)(v1 + v8) = 0;
  *(unsigned char *)(v1 + v2[6]) = v5;
  sub_2378B3FB4(v4);
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v6);
  sub_2378B61A0(v4, v7);
  sub_2378B4318(v4);
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v6);
  sub_2378B61A0(v4, v1);
  sub_2378C9240();
  sub_2378A0150(v3 + 32, v0 + 16);
  uint64_t v9 = sub_2378C9230();
  swift_release();
  *(void *)(v1 + v8) = v9;
  uint64_t v10 = sub_2378B5270();
  *(void *)(v0 + 96) = v10;
  uint64_t v11 = (void *)OUTLINED_FUNCTION_14_2();
  *(void *)(v0 + 104) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_2378B591C;
  return v13(0xD000000000000016, 0x80000002378CBBF0, v10);
}

uint64_t sub_2378B591C()
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_3_1();
  *char v5 = v4;
  uint64_t v6 = *v2;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v7 = v6;
  *(void *)(v4 + 112) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v4 + 120) = v1;
  }
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2378B5A34()
{
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_8_5();
  sub_2378B62BC(v0, (void (*)(void))type metadata accessor for SystemQueryQueryBuildParameters);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = OUTLINED_FUNCTION_7_4();
  return v2(v1);
}

uint64_t sub_2378B5AC4()
{
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_8_5();
  sub_2378B62BC(v0, (void (*)(void))type metadata accessor for SystemQueryQueryBuildParameters);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return v2();
}

uint64_t sub_2378B5B5C(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 56) = a2;
  *(void *)(v3 + 64) = a3;
  *(unsigned char *)(v3 + 128) = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
  OUTLINED_FUNCTION_42(v4);
  *(void *)(v3 + 72) = OUTLINED_FUNCTION_31();
  uint64_t QueryVersionParameters = type metadata accessor for SystemQueryQueryVersionParameters(0);
  *(void *)(v3 + 80) = QueryVersionParameters;
  OUTLINED_FUNCTION_42(QueryVersionParameters);
  *(void *)(v3 + 88) = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_2378B5C08()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 72);
  char v4 = *(unsigned char *)(v0 + 128);
  uint64_t v5 = v1 + *(int *)(*(void *)(v0 + 80) + 24);
  uint64_t v6 = sub_2378C9220();
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v6);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = v4;
  sub_2378B3FB4(v3);
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v6);
  sub_2378B61A0(v3, v5);
  sub_2378C9240();
  sub_2378A0150(v2 + 32, v0 + 16);
  uint64_t v7 = sub_2378C9230();
  swift_release();
  *(void *)uint64_t v1 = v7;
  uint64_t v8 = sub_2378B54FC();
  *(void *)(v0 + 96) = v8;
  uint64_t v9 = (void *)OUTLINED_FUNCTION_14_2();
  *(void *)(v0 + 104) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_2378B5D7C;
  return v11(0xD000000000000018, 0x80000002378CBBD0, v8);
}

uint64_t sub_2378B5D7C()
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  uint64_t v6 = *v2;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v7 = v6;
  *(void *)(v4 + 112) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v4 + 120) = v1;
  }
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2378B5E94()
{
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_8_5();
  sub_2378B62BC(v0, (void (*)(void))type metadata accessor for SystemQueryQueryVersionParameters);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = OUTLINED_FUNCTION_7_4();
  return v2(v1);
}

uint64_t sub_2378B5F24()
{
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_8_5();
  sub_2378B62BC(v0, (void (*)(void))type metadata accessor for SystemQueryQueryVersionParameters);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return v2();
}

uint64_t sub_2378B5FBC(uint64_t a1, uint64_t a2)
{
  return sub_2378B6010(a1, a2);
}

uint64_t sub_2378B6010(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2378C9260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_27();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934880);
  uint64_t v10 = OUTLINED_FUNCTION_42(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_27();
  sub_2378B6208(a1, v12 - v11, (uint64_t *)&unk_268934880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
  uint64_t v13 = sub_2378C91D0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_2378B1740(a1, (uint64_t *)&unk_268934880);
  return v13;
}

uint64_t sub_2378B6178()
{
  return type metadata accessor for SystemQueryCATPatternsExecutor(0);
}

uint64_t type metadata accessor for SystemQueryQueryVersionParameters(uint64_t a1)
{
  return sub_2378B6288(a1, (uint64_t *)&unk_2689349A0);
}

uint64_t sub_2378B61A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2378B6208(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_42_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for SystemQueryQueryBuildParameters(uint64_t a1)
{
  return sub_2378B6288(a1, (uint64_t *)&unk_268934988);
}

uint64_t sub_2378B6288(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2378B62BC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_42_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t *sub_2378B6318(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2378C9220();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v10 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
    uint64_t v11 = a3[7];
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v7))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v12, v13, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_2378B64E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2378C9220();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t result = __swift_getEnumTagSinglePayload(v5, 1, v4);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v7(v5, v4);
  }
  return result;
}

char *sub_2378B65D4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2378C9220();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  a1[v8] = a2[v8];
  uint64_t v9 = a3[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v10, v11, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v6);
  }
  return a1;
}

char *sub_2378B6750(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2378C9220();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  swift_retain();
  swift_release();
  a1[a3[6]] = a2[a3[6]];
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (!v14)
  {
    uint64_t v16 = *(void *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v12, v13, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v12, v13, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
  return a1;
}

char *sub_2378B69E4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2378C9220();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  a1[v8] = a2[v8];
  uint64_t v9 = a3[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v10, v11, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v6);
  }
  return a1;
}

char *sub_2378B6B5C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2378C9220();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  swift_release();
  uint64_t v11 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (!v14)
  {
    uint64_t v16 = *(void *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v12, v13, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v12, v13, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
  return a1;
}

uint64_t sub_2378B6DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2378B6DF8);
}

uint64_t sub_2378B6DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
  OUTLINED_FUNCTION_20_0();
  if (*(_DWORD *)(v7 + 84) != a2) {
    return OUTLINED_FUNCTION_3_5(*(void *)(a1 + *(int *)(a3 + 20)));
  }
  return __swift_getEnumTagSinglePayload(a1, a2, v6);
}

uint64_t sub_2378B6E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2378B6E90);
}

void sub_2378B6E90(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
  OUTLINED_FUNCTION_20_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
}

void sub_2378B6F1C()
{
  sub_2378B6FBC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2378B6FBC()
{
  if (!qword_268934998)
  {
    sub_2378C9220();
    unint64_t v0 = sub_2378C9480();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268934998);
    }
  }
}

uint64_t sub_2378B7014(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_2378C9220();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
      memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
    }
  }
  return v5;
}

uint64_t sub_2378B7150(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_2378C9220();
  uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_2378B71EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = sub_2378C9220();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_2378B72DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_2378C9220();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t sub_2378B745C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = sub_2378C9220();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_2378B753C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_2378C9220();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 40))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t sub_2378B76B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2378B76C8);
}

uint64_t sub_2378B76C8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646) {
    return OUTLINED_FUNCTION_3_5(*a1);
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
  uint64_t v8 = (uint64_t)a1 + *(int *)(a3 + 24);
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t sub_2378B7748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2378B775C);
}

void *sub_2378B775C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934978);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 24);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_2378B77E0()
{
  sub_2378B6FBC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t OUTLINED_FUNCTION_3_5@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  int v1 = a1 - 1;
  if (v1 < 0) {
    int v1 = -1;
  }
  return (v1 + 1);
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return *(void *)(v0 + 120);
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return swift_task_alloc();
}

uint64_t SharedObjects.init(aceServiceInvoker:deviceState:outputPublisher:)@<X0>(long long *a1@<X0>, long long *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  sub_2378A0B34(a1, a4);
  sub_2378A0B34(a2, a4 + 40);
  return sub_2378A0B34(a3, a4 + 80);
}

uint64_t initializeBufferWithCopyOfBuffer for SharedObjects(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SharedObjects(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 80);
}

_OWORD *initializeWithCopy for SharedObjects(_OWORD *a1, _OWORD *a2)
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
  return a1;
}

uint64_t *assignWithCopy for SharedObjects(uint64_t *a1, uint64_t *a2)
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
        int v11 = *(uint64_t (**)(void))(v10 + 24);
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

void *__swift_memcpy120_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x78uLL);
}

uint64_t assignWithTake for SharedObjects(uint64_t a1, uint64_t a2)
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
  return a1;
}

uint64_t getEnumTagSinglePayload for SharedObjects(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 120))
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

uint64_t storeEnumTagSinglePayload for SharedObjects(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SharedObjects()
{
  return &type metadata for SharedObjects;
}

uint64_t sub_2378B7E88()
{
  sub_2378B7FE0();
  uint64_t result = sub_2378C9470();
  qword_268936070 = result;
  return result;
}

uint64_t sub_2378B7EF0()
{
  uint64_t v0 = sub_2378C9280();
  __swift_allocate_value_buffer(v0, qword_268936078);
  __swift_project_value_buffer(v0, (uint64_t)qword_268936078);
  if (qword_268934160 != -1) {
    swift_once();
  }
  id v1 = (id)qword_268936070;
  return sub_2378C9290();
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

unint64_t sub_2378B7FE0()
{
  unint64_t result = qword_2689349B0;
  if (!qword_2689349B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2689349B0);
  }
  return result;
}

uint64_t SCScreenshotFlow.on(input:)()
{
  return 1;
}

uint64_t SCScreenshotFlow.execute()()
{
  OUTLINED_FUNCTION_41();
  v1[26] = v2;
  v1[27] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689349C0);
  v1[28] = swift_task_alloc();
  uint64_t v3 = sub_2378C8C10();
  v1[29] = v3;
  OUTLINED_FUNCTION_0(v3);
  v1[30] = v4;
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  uint64_t v5 = sub_2378C9280();
  v1[33] = v5;
  OUTLINED_FUNCTION_0(v5);
  v1[34] = v6;
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2378B8150()
{
  uint64_t v52 = v0;
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  char v1 = sub_2378C8BC0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  if (v1)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v2 = v0[36];
    uint64_t v3 = v0[33];
    uint64_t v4 = v0[34];
    uint64_t v5 = __swift_project_value_buffer(v3, (uint64_t)qword_268936078);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
    uint64_t v6 = sub_2378C9270();
    os_log_type_t v7 = sub_2378C9430();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_237899000, v6, v7, "SCScreenshotFlow execute | cannot screenshot on watchOS", v8, 2u);
      OUTLINED_FUNCTION_12();
    }
    uint64_t v9 = v0[36];
    uint64_t v10 = v0[33];
    uint64_t v11 = v0[34];

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    swift_retain();
    sub_2378C8D90();
    sub_2378C89D0();
    swift_allocObject();
    v0[25] = sub_2378C89C0();
    sub_2378C8CB0();
    swift_release();
    OUTLINED_FUNCTION_5_5();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4_2();
    return v12();
  }
  else
  {
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64868]), sel_init);
    v0[38] = v14;
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v15 = v0[37];
    uint64_t v16 = v0[33];
    uint64_t v17 = v0[34];
    uint64_t v18 = __swift_project_value_buffer(v16, (uint64_t)qword_268936078);
    v0[39] = v18;
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    v0[40] = v19;
    v0[41] = (v17 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v19(v15, v18, v16);
    id v20 = v14;
    uint64_t v21 = sub_2378C9270();
    os_log_type_t v22 = sub_2378C9430();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v24 = v0[37];
    uint64_t v25 = v0[33];
    uint64_t v26 = v0[34];
    id v50 = v20;
    if (v23)
    {
      uint64_t v49 = v0[33];
      uint64_t v48 = v0[37];
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315138;
      id v28 = v20;
      id v29 = objc_msgSend(v28, sel_description);
      uint64_t v30 = sub_2378C92E0();
      unint64_t v32 = v31;

      v0[24] = sub_2378A1964(v30, v32, v51);
      sub_2378C94B0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_237899000, v21, v22, "SCScreenshotFlow execute | submitting command: %s", v27, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_12();

      uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
      v33(v48, v49);
    }
    else
    {

      uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
      v33(v24, v25);
    }
    v0[42] = v33;
    uint64_t v34 = v0[32];
    uint64_t v35 = v0[29];
    uint64_t v36 = v0[30];
    uint64_t v37 = v0[28];
    sub_2378C8AF0();
    __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
    uint64_t v38 = *MEMORY[0x263F6F9F0];
    uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 104);
    v0[43] = v39;
    v0[44] = (v36 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v39(v34, v38, v35);
    v0[45] = sub_2378C8B60();
    uint64_t v40 = *MEMORY[0x263F6F748];
    uint64_t v41 = sub_2378C8B10();
    v0[46] = v41;
    uint64_t v42 = *(void *)(v41 - 8);
    os_log_type_t v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 104);
    v0[47] = v43;
    v0[48] = (v42 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v43(v37, v40, v41);
    __swift_storeEnumTagSinglePayload(v37, 0, 1, v41);
    OUTLINED_FUNCTION_6_5();
    sub_2378C8B50();
    sub_2378C8B00();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
    sub_2378C8B70();
    uint64_t v45 = v0[15];
    uint64_t v44 = v0[16];
    __swift_project_boxed_opaque_existential_1(v0 + 12, v45);
    uint64_t v46 = (void *)swift_task_alloc();
    v0[49] = v46;
    unint64_t v47 = sub_2378B8FA4();
    *uint64_t v46 = v0;
    v46[1] = sub_2378B8784;
    return MEMORY[0x270F67CE0](v50, v45, v47, v44);
  }
}

uint64_t sub_2378B8784()
{
  OUTLINED_FUNCTION_41();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 400) = v0;
  swift_task_dealloc();
  if (!v0) {

  }
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2378B886C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  sub_2378C8CD0();
  OUTLINED_FUNCTION_5_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v1();
}

uint64_t sub_2378B8918()
{
  uint64_t v34 = v0;
  char v1 = *(void **)(v0 + 400);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 320);
  uint64_t v3 = *(void *)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v5 = *(void *)(v0 + 264);

  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  v2(v4, v3, v5);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2378C9270();
  os_log_type_t v9 = sub_2378C9450();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = *(void **)(v0 + 400);
    uint64_t v31 = *(void *)(v0 + 280);
    unint64_t v32 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
    uint64_t v30 = *(void *)(v0 + 264);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v33 = v12;
    *(void *)(v0 + 176) = v10;
    id v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934C90);
    uint64_t v14 = sub_2378C92F0();
    *(void *)(v0 + 184) = sub_2378A1964(v14, v15, &v33);
    sub_2378C94B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237899000, v8, v9, "SCScreenshotFlow execute | error: %s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    v32(v31, v30);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 400);
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
    uint64_t v18 = *(void *)(v0 + 280);
    uint64_t v19 = *(void *)(v0 + 264);

    v17(v18, v19);
  }
  id v20 = *(void **)(v0 + 400);
  uint64_t v21 = *(void (**)(uint64_t, void, uint64_t))(v0 + 376);
  uint64_t v22 = *(void *)(v0 + 368);
  BOOL v23 = *(void (**)(uint64_t, void, uint64_t))(v0 + 344);
  uint64_t v24 = *(void *)(v0 + 248);
  uint64_t v26 = *(void *)(v0 + 224);
  uint64_t v25 = *(void *)(v0 + 232);
  sub_2378C8AF0();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 136), *(void *)(v0 + 160));
  v23(v24, *MEMORY[0x263F6F9E0], v25);
  v21(v26, *MEMORY[0x263F6F6C8], v22);
  __swift_storeEnumTagSinglePayload(v26, 0, 1, v22);
  *(void *)(swift_allocObject() + 16) = v20;
  id v27 = v20;
  OUTLINED_FUNCTION_6_5();
  sub_2378C8B50();
  sub_2378C8B00();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  sub_2378C8CD0();
  OUTLINED_FUNCTION_5_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v28();
}

uint64_t sub_2378B8C8C()
{
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378B8DD0();
}

uint64_t sub_2378B8D24(int a1, id a2)
{
  id v2 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934C90);
  sub_2378C92F0();
  return sub_2378C8B40();
}

uint64_t SCScreenshotFlow.execute(completion:)()
{
  return sub_2378C8A90();
}

uint64_t sub_2378B8DD0()
{
  OUTLINED_FUNCTION_41();
  v0[22] = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934320);
  v0[23] = swift_task_alloc();
  uint64_t v2 = sub_2378C8D30();
  v0[24] = v2;
  OUTLINED_FUNCTION_0(v2);
  v0[25] = v3;
  v0[26] = swift_task_alloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t SCScreenshotFlow.deinit()
{
  return v0;
}

uint64_t SCScreenshotFlow.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_2378B8EAC()
{
  return SCScreenshotFlow.execute(completion:)();
}

uint64_t sub_2378B8ED0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return SCScreenshotFlow.execute()();
}

uint64_t sub_2378B8F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SCScreenshotFlow();
  return MEMORY[0x270F66CE8](v3, a2);
}

unint64_t sub_2378B8FA4()
{
  unint64_t result = qword_2689349C8;
  if (!qword_2689349C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_2689349C8);
  }
  return result;
}

uint64_t sub_2378B8FE4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2378B901C(int a1)
{
  return sub_2378B8D24(a1, *(id *)(v1 + 16));
}

uint64_t sub_2378B9024()
{
  OUTLINED_FUNCTION_41();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378B8C8C();
}

uint64_t type metadata accessor for SCScreenshotFlow()
{
  return self;
}

unint64_t sub_2378B90E0()
{
  unint64_t result = qword_268934760;
  if (!qword_268934760)
  {
    type metadata accessor for SCScreenshotFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934760);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return swift_task_dealloc();
}

uint64_t SCTakePhotoFlow.__allocating_init(captureType:)(char a1)
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = a1;
  return result;
}

uint64_t SCTakePhotoFlow.init(captureType:)(char a1)
{
  *(unsigned char *)(v1 + 16) = a1;
  return v1;
}

uint64_t SCTakePhotoFlow.on(input:)()
{
  return 1;
}

uint64_t SCTakePhotoFlow.execute()()
{
  OUTLINED_FUNCTION_41();
  v1[29] = v2;
  v1[30] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689349C0);
  v1[31] = swift_task_alloc();
  uint64_t v3 = sub_2378C8C10();
  v1[32] = v3;
  OUTLINED_FUNCTION_0(v3);
  v1[33] = v4;
  v1[34] = OUTLINED_FUNCTION_9();
  v1[35] = swift_task_alloc();
  uint64_t v5 = sub_2378C9280();
  v1[36] = v5;
  OUTLINED_FUNCTION_0(v5);
  v1[37] = v6;
  v1[38] = OUTLINED_FUNCTION_9();
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  v1[41] = swift_task_alloc();
  v1[42] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934880);
  v1[43] = OUTLINED_FUNCTION_9();
  v1[44] = swift_task_alloc();
  v1[45] = swift_task_alloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2378B9310()
{
  unint64_t v67 = v0;
  uint64_t v1 = v0[45];
  uint64_t v2 = sub_2378C8960();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  LOBYTE(v1) = sub_2378C8BC0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  if ((v1 & 1) == 0)
  {
    sub_2378C8950();
    sub_2378BA148(v0[44], v0[45]);
    id v13 = objc_msgSend(self, sel_defaultWorkspace);
    if (v13)
    {
      uint64_t v17 = v13;
      uint64_t v18 = v0[43];
      sub_2378A327C(v0[45], v18);
      if (__swift_getEnumTagSinglePayload(v18, 1, v2) == 1)
      {
        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v20 = v0[43];
        uint64_t v19 = (void *)sub_2378C8940();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v20, v2);
      }
      unsigned int v21 = objc_msgSend(v17, sel_openSensitiveURL_withOptions_, v19, 0);

      if (v21)
      {
        if (qword_268934168 != -1) {
          swift_once();
        }
        uint64_t v22 = v0[41];
        uint64_t v24 = v0[36];
        uint64_t v23 = v0[37];
        uint64_t v25 = __swift_project_value_buffer(v24, (uint64_t)qword_268936078);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v25, v24);
        uint64_t v26 = sub_2378C9270();
        os_log_type_t v27 = sub_2378C9430();
        if (os_log_type_enabled(v26, v27))
        {
          uint64_t v29 = v0[44];
          uint64_t v28 = v0[45];
          uint64_t v63 = v0[37];
          uint64_t v64 = v0[36];
          uint64_t v65 = v0[41];
          uint64_t v30 = (uint8_t *)swift_slowAlloc();
          v66[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v30 = 136315138;
          swift_beginAccess();
          sub_2378A327C(v28, v29);
          uint64_t v31 = sub_2378C92F0();
          v0[27] = sub_2378A1964(v31, v32, v66);
          sub_2378C94B0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_237899000, v26, v27, "SCTakePhotoFlow execute | URL was successfully opened %s", v30, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_12();

          (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v65, v64);
        }
        else
        {
          uint64_t v57 = v0[41];
          uint64_t v58 = v0[36];
          uint64_t v59 = v0[37];

          (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v57, v58);
        }
        uint64_t v60 = v0[45];
        sub_2378C8CD0();
        uint64_t v12 = v60;
        goto LABEL_25;
      }
      if (qword_268934168 != -1) {
        swift_once();
      }
      uint64_t v33 = v0[37];
      v0[46] = __swift_project_value_buffer(v0[36], (uint64_t)qword_268936078);
      v0[47] = *(void *)(v33 + 16);
      v0[48] = (v33 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      uint64_t v34 = OUTLINED_FUNCTION_10_4();
      v35(v34);
      uint64_t v36 = sub_2378C9270();
      os_log_type_t v37 = sub_2378C9430();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_237899000, v36, v37, "SCTakePhotoFlow execute | fallback using SAAppsLaunchApp", v38, 2u);
        OUTLINED_FUNCTION_12();
      }
      uint64_t v39 = v0[40];
      uint64_t v40 = v0[36];
      uint64_t v41 = v0[37];
      uint64_t v42 = v0[35];
      uint64_t v44 = v0[32];
      uint64_t v43 = v0[33];
      uint64_t v45 = v0[31];

      uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
      v0[49] = v46;
      v0[50] = (v41 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v46(v39, v40);
      id v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F647B0]), sel_init);
      v0[51] = v47;
      sub_2378BA458(0xD000000000000010, 0x80000002378CBCD0, v47);
      sub_2378C8AF0();
      __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
      uint64_t v48 = *MEMORY[0x263F6F9F0];
      uint64_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 104);
      v0[52] = v49;
      v0[53] = (v43 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
      v49(v42, v48, v44);
      v0[54] = sub_2378C8B60();
      uint64_t v50 = *MEMORY[0x263F6F748];
      uint64_t v51 = sub_2378C8B10();
      v0[55] = v51;
      uint64_t v52 = *(void *)(v51 - 8);
      uint64_t v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 104);
      v0[56] = v53;
      v0[57] = (v52 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
      v53(v45, v50, v51);
      __swift_storeEnumTagSinglePayload(v45, 0, 1, v51);
      OUTLINED_FUNCTION_7_5();
      sub_2378C8B50();
      sub_2378C8B00();
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
      sub_2378C8B70();
      uint64_t v55 = v0[15];
      uint64_t v54 = v0[16];
      __swift_project_boxed_opaque_existential_1(v0 + 12, v55);
      uint64_t v56 = (void *)swift_task_alloc();
      v0[58] = v56;
      unint64_t v15 = sub_2378B8FA4();
      *uint64_t v56 = v0;
      v56[1] = sub_2378B9BD8;
      id v13 = v47;
      uint64_t v14 = v55;
      uint64_t v16 = v54;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270F67CE0](v13, v14, v15, v16);
  }
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[36], (uint64_t)qword_268936078);
  uint64_t v3 = OUTLINED_FUNCTION_10_4();
  v4(v3);
  uint64_t v5 = sub_2378C9270();
  os_log_type_t v6 = sub_2378C9430();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_237899000, v5, v6, "SCTakePhotoFlow execute | cannot take photo on watchOS", v7, 2u);
    OUTLINED_FUNCTION_12();
  }
  uint64_t v8 = v0[45];
  uint64_t v9 = v0[39];
  uint64_t v10 = v0[36];
  uint64_t v11 = v0[37];

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  swift_retain();
  sub_2378C8D90();
  sub_2378C89D0();
  swift_allocObject();
  v0[28] = sub_2378C89C0();
  sub_2378C8CB0();
  swift_release();
  uint64_t v12 = v8;
LABEL_25:
  sub_2378A6E7C(v12, (uint64_t *)&unk_268934880);
  OUTLINED_FUNCTION_2_1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v61();
}

uint64_t sub_2378B9BD8()
{
  OUTLINED_FUNCTION_41();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 472) = v0;
  swift_task_dealloc();
  if (!v0) {

  }
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2378B9CC0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  uint64_t v1 = *(void *)(v0 + 360);
  sub_2378C8CD0();
  sub_2378A6E7C(v1, (uint64_t *)&unk_268934880);
  OUTLINED_FUNCTION_2_1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v2();
}

uint64_t sub_2378B9DB0()
{
  uint64_t v35 = v0;
  uint64_t v1 = *(void **)(v0 + 472);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 304);
  uint64_t v5 = *(void *)(v0 + 288);

  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  v2(v4, v3, v5);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2378C9270();
  os_log_type_t v9 = sub_2378C9450();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = *(void **)(v0 + 472);
    uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    uint64_t v31 = *(void *)(v0 + 288);
    uint64_t v32 = *(void *)(v0 + 304);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v34 = v12;
    *(void *)(v0 + 208) = v10;
    id v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934C90);
    uint64_t v14 = sub_2378C92F0();
    *(void *)(v0 + 200) = sub_2378A1964(v14, v15, &v34);
    sub_2378C94B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237899000, v8, v9, "SCTakePhotoFlow execute | error: %s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    v33(v32, v31);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 472);
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    uint64_t v18 = *(void *)(v0 + 304);
    uint64_t v19 = *(void *)(v0 + 288);

    v17(v18, v19);
  }
  uint64_t v20 = *(void **)(v0 + 472);
  unsigned int v21 = *(void (**)(uint64_t, void, uint64_t))(v0 + 448);
  uint64_t v22 = *(void *)(v0 + 440);
  uint64_t v23 = *(void (**)(uint64_t, void, uint64_t))(v0 + 416);
  uint64_t v24 = *(void *)(v0 + 272);
  uint64_t v26 = *(void *)(v0 + 248);
  uint64_t v25 = *(void *)(v0 + 256);
  sub_2378C8AF0();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 136), *(void *)(v0 + 160));
  v23(v24, *MEMORY[0x263F6F9E0], v25);
  v21(v26, *MEMORY[0x263F6F6C8], v22);
  __swift_storeEnumTagSinglePayload(v26, 0, 1, v22);
  *(void *)(swift_allocObject() + 16) = v20;
  id v27 = v20;
  OUTLINED_FUNCTION_7_5();
  sub_2378C8B50();
  sub_2378C8B00();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  uint64_t v28 = *(void *)(v0 + 360);
  sub_2378C8CD0();
  sub_2378A6E7C(v28, (uint64_t *)&unk_268934880);
  OUTLINED_FUNCTION_2_1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v29();
}

uint64_t sub_2378BA148(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2378BA1B0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378B8DD0();
}

uint64_t SCTakePhotoFlow.execute(completion:)()
{
  return sub_2378C8A90();
}

SiriSystemCommandsIntents::CaptureType __swiftcall SCTakePhotoFlow.fetchCaptureType()()
{
  return *(unsigned char *)(v0 + 16);
}

uint64_t SCTakePhotoFlow.deinit()
{
  return v0;
}

uint64_t SCTakePhotoFlow.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 17, 7);
}

uint64_t sub_2378BA2C4()
{
  return SCTakePhotoFlow.execute(completion:)();
}

uint64_t sub_2378BA2E8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return SCTakePhotoFlow.execute()();
}

uint64_t sub_2378BA384(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SCTakePhotoFlow();
  return MEMORY[0x270F66CE8](v3, a2);
}

BOOL static CaptureType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t CaptureType.hash(into:)()
{
  return sub_2378C95E0();
}

uint64_t CaptureType.hashValue.getter()
{
  return sub_2378C95F0();
}

BOOL sub_2378BA43C(char *a1, char *a2)
{
  return static CaptureType.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_2378BA448()
{
  return CaptureType.hashValue.getter();
}

uint64_t sub_2378BA450()
{
  return CaptureType.hash(into:)();
}

void sub_2378BA458(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_2378C92D0();
  objc_msgSend(a3, sel_setLaunchId_, v4);
}

uint64_t sub_2378BA4B0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2378BA4E8()
{
  OUTLINED_FUNCTION_41();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378BA1B0();
}

uint64_t type metadata accessor for SCTakePhotoFlow()
{
  return self;
}

unint64_t sub_2378BA5A4()
{
  unint64_t result = qword_268934790;
  if (!qword_268934790)
  {
    type metadata accessor for SCTakePhotoFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934790);
  }
  return result;
}

unint64_t sub_2378BA5F4()
{
  unint64_t result = qword_268934A20;
  if (!qword_268934A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268934A20);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CaptureType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x2378BA70CLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CaptureType()
{
  return &type metadata for CaptureType;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return v0;
}

uint64_t SCLockFlow.on(input:)()
{
  return 1;
}

uint64_t SCLockFlow.execute()()
{
  OUTLINED_FUNCTION_41();
  v1[26] = v2;
  v1[27] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689349C0);
  v1[28] = swift_task_alloc();
  uint64_t v3 = sub_2378C8C10();
  v1[29] = v3;
  OUTLINED_FUNCTION_0(v3);
  v1[30] = v4;
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  uint64_t v5 = sub_2378C9280();
  v1[33] = v5;
  OUTLINED_FUNCTION_0(v5);
  v1[34] = v6;
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2378BA8CC()
{
  uint64_t v52 = v0;
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  char v1 = sub_2378C8BC0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  if (v1)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v2 = v0[36];
    uint64_t v3 = v0[33];
    uint64_t v4 = v0[34];
    uint64_t v5 = __swift_project_value_buffer(v3, (uint64_t)qword_268936078);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
    uint64_t v6 = sub_2378C9270();
    os_log_type_t v7 = sub_2378C9430();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_237899000, v6, v7, "SCLockFlow execute | cannot lock device on watchOS", v8, 2u);
      OUTLINED_FUNCTION_12();
    }
    uint64_t v9 = v0[36];
    uint64_t v10 = v0[33];
    uint64_t v11 = v0[34];

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    swift_retain();
    sub_2378C8D90();
    sub_2378C89D0();
    swift_allocObject();
    v0[25] = sub_2378C89C0();
    sub_2378C8CB0();
    swift_release();
    OUTLINED_FUNCTION_5_5();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4_2();
    return v12();
  }
  else
  {
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64850]), sel_init);
    v0[38] = v14;
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v15 = v0[37];
    uint64_t v16 = v0[33];
    uint64_t v17 = v0[34];
    uint64_t v18 = __swift_project_value_buffer(v16, (uint64_t)qword_268936078);
    v0[39] = v18;
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    v0[40] = v19;
    v0[41] = (v17 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v19(v15, v18, v16);
    id v20 = v14;
    unsigned int v21 = sub_2378C9270();
    os_log_type_t v22 = sub_2378C9430();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v24 = v0[37];
    uint64_t v25 = v0[33];
    uint64_t v26 = v0[34];
    id v50 = v20;
    if (v23)
    {
      uint64_t v49 = v0[33];
      uint64_t v48 = v0[37];
      id v27 = (uint8_t *)swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)id v27 = 136315138;
      id v28 = v20;
      id v29 = objc_msgSend(v28, sel_description);
      uint64_t v30 = sub_2378C92E0();
      unint64_t v32 = v31;

      v0[24] = sub_2378A1964(v30, v32, v51);
      sub_2378C94B0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_237899000, v21, v22, "SCLockFlow execute | submitting command: %s", v27, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_12();

      uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
      v33(v48, v49);
    }
    else
    {

      uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
      v33(v24, v25);
    }
    v0[42] = v33;
    uint64_t v34 = v0[32];
    uint64_t v35 = v0[29];
    uint64_t v36 = v0[30];
    uint64_t v37 = v0[28];
    sub_2378C8AF0();
    __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
    uint64_t v38 = *MEMORY[0x263F6F9F0];
    uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 104);
    v0[43] = v39;
    v0[44] = (v36 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v39(v34, v38, v35);
    v0[45] = sub_2378C8B60();
    uint64_t v40 = *MEMORY[0x263F6F748];
    uint64_t v41 = sub_2378C8B10();
    v0[46] = v41;
    uint64_t v42 = *(void *)(v41 - 8);
    uint64_t v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 104);
    v0[47] = v43;
    v0[48] = (v42 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v43(v37, v40, v41);
    __swift_storeEnumTagSinglePayload(v37, 0, 1, v41);
    sub_2378C8B50();
    sub_2378C8B00();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
    sub_2378C8B70();
    uint64_t v45 = v0[15];
    uint64_t v44 = v0[16];
    __swift_project_boxed_opaque_existential_1(v0 + 12, v45);
    uint64_t v46 = (void *)swift_task_alloc();
    v0[49] = v46;
    unint64_t v47 = sub_2378B8FA4();
    *uint64_t v46 = v0;
    v46[1] = sub_2378BAF08;
    return MEMORY[0x270F67CE0](v50, v45, v47, v44);
  }
}

uint64_t sub_2378BAF08()
{
  OUTLINED_FUNCTION_41();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 400) = v0;
  swift_task_dealloc();
  if (!v0) {

  }
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2378BAFF0()
{
  uint64_t v34 = v0;
  char v1 = *(void **)(v0 + 400);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 320);
  uint64_t v3 = *(void *)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v5 = *(void *)(v0 + 264);

  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  v2(v4, v3, v5);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2378C9270();
  os_log_type_t v9 = sub_2378C9450();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = *(void **)(v0 + 400);
    uint64_t v31 = *(void *)(v0 + 280);
    unint64_t v32 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
    uint64_t v30 = *(void *)(v0 + 264);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v33 = v12;
    *(void *)(v0 + 176) = v10;
    id v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934C90);
    uint64_t v14 = sub_2378C92F0();
    *(void *)(v0 + 184) = sub_2378A1964(v14, v15, &v33);
    sub_2378C94B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237899000, v8, v9, "SCLockFlow execute | error: %s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    v32(v31, v30);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 400);
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
    uint64_t v18 = *(void *)(v0 + 280);
    uint64_t v19 = *(void *)(v0 + 264);

    v17(v18, v19);
  }
  id v20 = *(void **)(v0 + 400);
  unsigned int v21 = *(void (**)(uint64_t, void, uint64_t))(v0 + 376);
  uint64_t v22 = *(void *)(v0 + 368);
  BOOL v23 = *(void (**)(uint64_t, void, uint64_t))(v0 + 344);
  uint64_t v24 = *(void *)(v0 + 248);
  uint64_t v26 = *(void *)(v0 + 224);
  uint64_t v25 = *(void *)(v0 + 232);
  sub_2378C8AF0();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 136), *(void *)(v0 + 160));
  v23(v24, *MEMORY[0x263F6F9E0], v25);
  v21(v26, *MEMORY[0x263F6F6C8], v22);
  __swift_storeEnumTagSinglePayload(v26, 0, 1, v22);
  *(void *)(swift_allocObject() + 16) = v20;
  id v27 = v20;
  sub_2378C8B50();
  sub_2378C8B00();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  sub_2378C8CD0();
  OUTLINED_FUNCTION_5_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v28();
}

uint64_t sub_2378BB36C()
{
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378B8DD0();
}

uint64_t SCLockFlow.execute(completion:)()
{
  return sub_2378C8A90();
}

uint64_t SCLockFlow.deinit()
{
  return v0;
}

uint64_t SCLockFlow.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_2378BB478()
{
  return SCLockFlow.execute(completion:)();
}

uint64_t sub_2378BB49C()
{
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return SCLockFlow.execute()();
}

uint64_t sub_2378BB538(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SCLockFlow();
  return MEMORY[0x270F66CE8](v3, a2);
}

uint64_t sub_2378BB570()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2378BB5A8()
{
  OUTLINED_FUNCTION_41();
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378BB36C();
}

uint64_t type metadata accessor for SCLockFlow()
{
  return self;
}

unint64_t sub_2378BB664()
{
  unint64_t result = qword_268934758;
  if (!qword_268934758)
  {
    type metadata accessor for SCLockFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934758);
  }
  return result;
}

uint64_t SCStartScreenRecordingFlow.__allocating_init(confirmationRequired:)(char a1)
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 0;
  *(unsigned char *)(result + 17) = a1;
  *(void *)(result + 24) = sub_2378BB720;
  *(void *)(result + 32) = 0;
  return result;
}

uint64_t SCStartScreenRecordingFlow.init(confirmationRequired:)(char a1)
{
  *(unsigned char *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 17) = a1;
  *(void *)(v1 + 24) = sub_2378BB720;
  *(void *)(v1 + 32) = 0;
  return v1;
}

uint64_t sub_2378BB720()
{
  return sub_2378BB73C();
}

uint64_t sub_2378BB73C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268934AF0);
  uint64_t v0 = sub_2378C8A40();
  OUTLINED_FUNCTION_0(v0);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2378C9C30;
  sub_2378C8A30();
  uint64_t v1 = sub_2378C8980();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t SCStartScreenRecordingFlow.on(input:)()
{
  return 1;
}

uint64_t SCStartScreenRecordingFlow.execute()()
{
  OUTLINED_FUNCTION_41();
  v1[35] = v2;
  v1[36] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689349C0);
  OUTLINED_FUNCTION_42(v3);
  v1[37] = OUTLINED_FUNCTION_31();
  uint64_t v4 = sub_2378C8C10();
  v1[38] = v4;
  OUTLINED_FUNCTION_0(v4);
  v1[39] = v5;
  v1[40] = OUTLINED_FUNCTION_31();
  uint64_t v6 = sub_2378C9280();
  v1[41] = v6;
  OUTLINED_FUNCTION_0(v6);
  v1[42] = v7;
  v1[43] = swift_task_alloc();
  v1[44] = swift_task_alloc();
  v1[45] = swift_task_alloc();
  v1[46] = swift_task_alloc();
  v1[47] = swift_task_alloc();
  v1[48] = swift_task_alloc();
  v1[49] = swift_task_alloc();
  v1[50] = swift_task_alloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2378BB920()
{
  uint64_t v115 = v0;
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  OUTLINED_FUNCTION_8_2();
  char v1 = sub_2378C8BD0();
  uint64_t v2 = __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v1)
  {
    if (qword_268934168 != -1) {
      uint64_t v2 = swift_once();
    }
    uint64_t v3 = OUTLINED_FUNCTION_7_6(v2, (uint64_t)qword_268936078);
    v4(v3);
    uint64_t v5 = (void *)sub_2378C9270();
    os_log_type_t v6 = sub_2378C9430();
    if (OUTLINED_FUNCTION_24_0(v6))
    {
      *(_WORD *)OUTLINED_FUNCTION_29() = 0;
      OUTLINED_FUNCTION_12_0(&dword_237899000, v7, v8, "SCStartScreenRecordingFlow execute | cannot screen record in Carplay");
      OUTLINED_FUNCTION_12();
    }
    uint64_t v9 = *(void *)(v0 + 288);

    uint64_t v10 = OUTLINED_FUNCTION_33_0();
    v11(v10);
    *(unsigned char *)(v9 + 16) = 7;
    swift_retain();
    sub_2378C8D90();
    sub_2378C89D0();
    OUTLINED_FUNCTION_32_1();
    *(void *)(v0 + 256) = sub_2378C89C0();
LABEL_13:
    sub_2378C8CB0();
LABEL_14:
    swift_release();
    goto LABEL_15;
  }
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), *(void *)(v0 + 80));
  OUTLINED_FUNCTION_8_2();
  char v12 = sub_2378C8BC0();
  uint64_t v13 = __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  if (v12)
  {
    if (qword_268934168 != -1) {
      uint64_t v13 = swift_once();
    }
    uint64_t v14 = OUTLINED_FUNCTION_7_6(v13, (uint64_t)qword_268936078);
    v15(v14);
    uint64_t v16 = (void *)sub_2378C9270();
    os_log_type_t v17 = sub_2378C9430();
    if (OUTLINED_FUNCTION_24_0(v17))
    {
      *(_WORD *)OUTLINED_FUNCTION_29() = 0;
      OUTLINED_FUNCTION_12_0(&dword_237899000, v18, v19, "SCStartScreenRecordingFlow execute | cannot screen record on watchOS");
      OUTLINED_FUNCTION_12();
    }
    uint64_t v20 = *(void *)(v0 + 288);

    uint64_t v21 = OUTLINED_FUNCTION_33_0();
    v22(v21);
    *(unsigned char *)(v20 + 16) = 7;
    swift_retain();
    sub_2378C8D90();
    sub_2378C89D0();
    OUTLINED_FUNCTION_32_1();
    *(void *)(v0 + 272) = sub_2378C89C0();
    goto LABEL_13;
  }
  uint64_t v25 = *(void *)(v0 + 288);
  int v26 = *(unsigned __int8 *)(v25 + 16);
  if (v26 == 4)
  {
    id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64858]), sel_init);
    *(void *)(v0 + 424) = v40;
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v41 = *(void *)(v0 + 376);
    uint64_t v42 = *(void *)(v0 + 328);
    uint64_t v43 = *(void *)(v0 + 336);
    uint64_t v44 = __swift_project_value_buffer(v42, (uint64_t)qword_268936078);
    *(void *)(v0 + 432) = v44;
    uint64_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16);
    *(void *)(v0 + 440) = v45;
    *(void *)(v0 + 448) = (v43 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v45(v41, v44, v42);
    id v46 = v40;
    unint64_t v47 = sub_2378C9270();
    os_log_type_t v48 = sub_2378C9430();
    BOOL v49 = os_log_type_enabled(v47, v48);
    uint64_t v50 = *(void *)(v0 + 376);
    uint64_t v51 = *(void *)(v0 + 328);
    uint64_t v52 = *(void *)(v0 + 336);
    if (v49)
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      v114[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v53 = 136315138;
      id v54 = v46;
      uint64_t v112 = v51;
      id v55 = objc_msgSend(v54, sel_description);
      uint64_t v56 = sub_2378C92E0();
      uint64_t v111 = v50;
      unint64_t v58 = v57;

      *(void *)(v0 + 224) = sub_2378A1964(v56, v58, v114);
      sub_2378C94B0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237899000, v47, v48, "SCStartScreenRecordingFlow execute | submitting command: %s", v53, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_12();

      uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
      v59(v111, v112);
    }
    else
    {

      uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
      uint64_t v80 = OUTLINED_FUNCTION_8_2();
      v59(v80, v81);
    }
    *(void *)(v0 + 456) = v59;
    uint64_t v83 = *(void *)(v0 + 312);
    uint64_t v82 = *(void *)(v0 + 320);
    uint64_t v85 = *(void *)(v0 + 296);
    uint64_t v84 = *(void *)(v0 + 304);
    sub_2378C8AF0();
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 176), *(void *)(v0 + 200));
    *(void *)(v0 + 464) = sub_2378C8B60();
    uint64_t v86 = *MEMORY[0x263F6F9F0];
    char v87 = *(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 104);
    *(void *)(v0 + 472) = v87;
    *(void *)(v0 + 480) = (v83 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v87(v82, v86, v84);
    uint64_t v88 = *MEMORY[0x263F6F748];
    uint64_t v89 = sub_2378C8B10();
    *(void *)(v0 + 488) = v89;
    OUTLINED_FUNCTION_19();
    uint64_t v91 = *(void (**)(uint64_t, uint64_t, uint64_t))(v90 + 104);
    *(void *)(v0 + 496) = v91;
    *(void *)(v0 + 504) = (v90 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v91(v85, v88, v89);
    __swift_storeEnumTagSinglePayload(v85, 0, 1, v89);
    sub_2378C8B50();
    sub_2378C8B00();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 176);
    sub_2378C8B70();
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 136), *(void *)(v0 + 160));
    unint64_t v92 = (void *)swift_task_alloc();
    *(void *)(v0 + 512) = v92;
    sub_2378B8FA4();
    *unint64_t v92 = v0;
    v92[1] = sub_2378BC9C8;
    OUTLINED_FUNCTION_15_2();
    return MEMORY[0x270F67CE0](v93, v94, v95, v96);
  }
  else if (v26 == 2)
  {
    if (*(unsigned char *)(v25 + 17) == 1)
    {
      if (qword_268934168 != -1) {
        uint64_t v13 = swift_once();
      }
      uint64_t v60 = OUTLINED_FUNCTION_7_6(v13, (uint64_t)qword_268936078);
      v61(v60);
      uint64_t v62 = (void *)sub_2378C9270();
      os_log_type_t v63 = sub_2378C9430();
      if (OUTLINED_FUNCTION_24_0(v63))
      {
        *(_WORD *)OUTLINED_FUNCTION_29() = 0;
        OUTLINED_FUNCTION_12_0(&dword_237899000, v64, v65, "SCStartScreenRecordingFlow execute | prompting for confirmation");
        OUTLINED_FUNCTION_12();
      }

      OUTLINED_FUNCTION_14_3();
      v66();
      *(unsigned char *)(v25 + 16) = 3;
      sub_2378C8E40();
      type metadata accessor for SCSystemCommandsYesNoStrategy();
      swift_allocObject();
      sub_23789B154((uint64_t)v114, 2);
      sub_2378C8D90();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268934A78);
      swift_allocObject();
      sub_2378BF048(qword_2689341C8, 255, (void (*)(uint64_t))type metadata accessor for SCSystemCommandsYesNoStrategy);
      *(void *)(v0 + 264) = sub_2378C8A10();
      sub_2378BEBE0();
      swift_retain();
      sub_2378C8CA0();
      swift_release();
      goto LABEL_14;
    }
    if (qword_268934168 != -1) {
      uint64_t v13 = swift_once();
    }
    uint64_t v98 = OUTLINED_FUNCTION_3_4(v13, (uint64_t)qword_268936078);
    v99(v98);
    uint64_t v100 = (void *)sub_2378C9270();
    os_log_type_t v101 = sub_2378C9430();
    if (OUTLINED_FUNCTION_20_1(v101))
    {
      int64_t v102 = (_WORD *)OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_28(v102);
      OUTLINED_FUNCTION_10_0(&dword_237899000, v103, v104, "SCStartScreenRecordingFlow execute | confirmation is not required, proceeding to next flow");
      OUTLINED_FUNCTION_12();
    }

    uint64_t v105 = OUTLINED_FUNCTION_12_2();
    v106(v105);
    *(unsigned char *)(v25 + 16) = 4;
    swift_task_alloc();
    OUTLINED_FUNCTION_24_2();
    *(void *)(v0 + 416) = v107;
    *os_log_type_t v107 = v108;
    v107[1] = sub_2378BC7E4;
    OUTLINED_FUNCTION_15_2();
    return SCStartScreenRecordingFlow.execute()(v109);
  }
  else
  {
    if (*(unsigned char *)(v25 + 16))
    {
      if (qword_268934168 != -1) {
        swift_once();
      }
      uint64_t v67 = *(void *)(v0 + 368);
      uint64_t v68 = *(void *)(v0 + 328);
      uint64_t v69 = *(void *)(v0 + 336);
      uint64_t v70 = __swift_project_value_buffer(v68, (uint64_t)qword_268936078);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 16))(v67, v70, v68);
      swift_retain_n();
      uint64_t v71 = sub_2378C9270();
      os_log_type_t v72 = sub_2378C9430();
      BOOL v73 = os_log_type_enabled(v71, v72);
      uint64_t v74 = *(void *)(v0 + 368);
      uint64_t v76 = *(void *)(v0 + 328);
      uint64_t v75 = *(void *)(v0 + 336);
      if (v73)
      {
        uint64_t v113 = *(void *)(v0 + 368);
        os_log_type_t v77 = (uint8_t *)swift_slowAlloc();
        v114[0] = swift_slowAlloc();
        *(_DWORD *)os_log_type_t v77 = 136315138;
        *(unsigned char *)(v0 + 528) = *(unsigned char *)(v25 + 16);
        uint64_t v78 = sub_2378C92F0();
        *(void *)(v0 + 216) = sub_2378A1964(v78, v79, v114);
        sub_2378C94B0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237899000, v71, v72, "SCStartScreenRecordingFlow execute | flow completed with state: %s", v77, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_12();

        (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v113, v76);
      }
      else
      {

        swift_release_n();
        (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v74, v76);
      }
      sub_2378C8CD0();
LABEL_15:
      OUTLINED_FUNCTION_8_6();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_15_2();
      __asm { BRAA            X1, X16 }
    }
    if (qword_268934168 != -1) {
      uint64_t v13 = swift_once();
    }
    uint64_t v27 = OUTLINED_FUNCTION_3_4(v13, (uint64_t)qword_268936078);
    v28(v27);
    id v29 = (void *)sub_2378C9270();
    os_log_type_t v30 = sub_2378C9430();
    if (OUTLINED_FUNCTION_20_1(v30))
    {
      uint64_t v31 = (_WORD *)OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_28(v31);
      OUTLINED_FUNCTION_10_0(&dword_237899000, v32, v33, "SCStartScreenRecordingFlow execute | checking if device unlock is required");
      OUTLINED_FUNCTION_12();
    }

    uint64_t v34 = OUTLINED_FUNCTION_12_2();
    v35(v34);
    swift_task_alloc();
    OUTLINED_FUNCTION_24_2();
    *(void *)(v0 + 408) = v36;
    *uint64_t v36 = v37;
    v36[1] = sub_2378BC600;
    OUTLINED_FUNCTION_15_2();
    return sub_2378BD984();
  }
}

uint64_t sub_2378BC600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_10_5();
  uint64_t v14 = *v13;
  OUTLINED_FUNCTION_34();
  *unint64_t v15 = v14;
  swift_task_dealloc();
  OUTLINED_FUNCTION_36_1();
  uint64_t v25 = *(void *)(v12 + 320);
  OUTLINED_FUNCTION_36_1();
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
  OUTLINED_FUNCTION_28_1();
  return v17(v16, v17, v18, v19, v20, v21, v22, v23, v25, a10, a11, a12);
}

uint64_t sub_2378BC7E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_10_5();
  uint64_t v14 = *v13;
  OUTLINED_FUNCTION_34();
  *unint64_t v15 = v14;
  swift_task_dealloc();
  OUTLINED_FUNCTION_36_1();
  uint64_t v25 = *(void *)(v12 + 320);
  OUTLINED_FUNCTION_36_1();
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
  OUTLINED_FUNCTION_28_1();
  return v17(v16, v17, v18, v19, v20, v21, v22, v23, v25, a10, a11, a12);
}

uint64_t sub_2378BC9C8()
{
  OUTLINED_FUNCTION_41();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_51();
  *uint64_t v5 = v4;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v7 = v6;
  *(void *)(v8 + 520) = v0;
  swift_task_dealloc();
  if (!v0) {

  }
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2378BCAA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_30_1();

  __swift_destroy_boxed_opaque_existential_1(v12 + 136);
  sub_2378C8CD0();
  OUTLINED_FUNCTION_8_6();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_28_1();
  return v14(v13, v14, v15, v16, v17, v18, v19, v20, a9, a10, a11, a12);
}

uint64_t sub_2378BCB70()
{
  uint64_t v33 = v0;
  char v1 = *(void **)(v0 + 520);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 432);
  uint64_t v4 = *(void *)(v0 + 344);
  uint64_t v5 = *(void *)(v0 + 328);

  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  v2(v4, v3, v5);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2378C9270();
  os_log_type_t v9 = sub_2378C9450();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = *(void **)(v0 + 520);
    uint64_t v30 = *(void *)(v0 + 344);
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v0 + 456);
    uint64_t v29 = *(void *)(v0 + 328);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    v32[0] = v12;
    *(void *)(v0 + 240) = v10;
    id v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934C90);
    uint64_t v14 = sub_2378C92F0();
    *(void *)(v0 + 248) = sub_2378A1964(v14, v15, v32);
    sub_2378C94B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237899000, v8, v9, "SCStartScreenRecordingFlow execute | unable to start recording: %s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    v31(v30, v29);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 520);
    uint64_t v17 = *(void (**)(uint64_t))(v0 + 456);

    uint64_t v18 = OUTLINED_FUNCTION_8_2();
    v17(v18);
  }
  id v28 = *(id *)(v0 + 520);
  uint64_t v19 = *(void (**)(uint64_t, void, uint64_t))(v0 + 496);
  uint64_t v20 = *(void *)(v0 + 488);
  uint64_t v21 = *(void (**)(uint64_t, void, uint64_t))(v0 + 472);
  uint64_t v22 = *(void *)(v0 + 320);
  uint64_t v24 = *(void *)(v0 + 296);
  uint64_t v23 = *(void *)(v0 + 304);
  *(unsigned char *)(*(void *)(v0 + 288) + 16) = 7;
  sub_2378C8AF0();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
  v21(v22, *MEMORY[0x263F6F9E0], v23);
  v19(v24, *MEMORY[0x263F6F6C8], v20);
  __swift_storeEnumTagSinglePayload(v24, 0, 1, v20);
  *(void *)(swift_allocObject() + 16) = v28;
  id v25 = v28;
  sub_2378C8B50();
  sub_2378C8B00();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_retain();
  sub_2378C8D90();
  sub_2378C89D0();
  OUTLINED_FUNCTION_32_1();
  *(void *)(v0 + 232) = sub_2378C89C0();
  sub_2378C8CB0();

  swift_release();
  OUTLINED_FUNCTION_8_6();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v26();
}

uint64_t sub_2378BCF9C()
{
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A946C;
  return sub_2378BE158();
}

uint64_t sub_2378BD034()
{
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378BE158();
}

uint64_t sub_2378BD0CC()
{
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A946C;
  return sub_2378BE508();
}

uint64_t SCStartScreenRecordingFlow.execute(completion:)()
{
  type metadata accessor for SCStartScreenRecordingFlow();
  sub_2378BF048(&qword_268934788, v0, (void (*)(uint64_t))type metadata accessor for SCStartScreenRecordingFlow);
  return sub_2378C8A90();
}

uint64_t sub_2378BD1F0(uint64_t a1)
{
  uint64_t v79 = a1;
  uint64_t v1 = sub_2378C8D70();
  OUTLINED_FUNCTION_2();
  uint64_t v77 = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_27();
  uint64_t v71 = v5 - v4;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934AD8);
  OUTLINED_FUNCTION_19();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_10();
  uint64_t v73 = v7;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v65[-v9];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934310);
  uint64_t v12 = OUTLINED_FUNCTION_42(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_10();
  uint64_t v70 = v13;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v14);
  uint64_t v74 = &v65[-v15];
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v16);
  uint64_t v75 = &v65[-v17];
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v18);
  os_log_type_t v72 = &v65[-v19];
  OUTLINED_FUNCTION_11();
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = &v65[-v22];
  MEMORY[0x270FA5388](v21);
  id v25 = &v65[-v24];
  uint64_t v26 = sub_2378C8DD0();
  OUTLINED_FUNCTION_2();
  uint64_t v28 = v27;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_27();
  uint64_t v32 = v31 - v30;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934AE0);
  OUTLINED_FUNCTION_2();
  uint64_t v35 = v34;
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_27();
  uint64_t v39 = v38 - v37;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v38 - v37, v79, v33);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v35 + 88))(v39, v33) != *MEMORY[0x263F6FA10])
  {
    *(unsigned char *)(v78 + 16) = 6;
    OUTLINED_FUNCTION_14_3();
    return v45();
  }
  (*(void (**)(uint64_t, uint64_t))(v35 + 96))(v39, v33);
  uint64_t v68 = v28;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v32, v39, v26);
  uint64_t v79 = v32;
  sub_2378C8DC0();
  uint64_t v40 = v77;
  uint64_t v41 = *(void (**)(unsigned char *, void, uint64_t))(v77 + 104);
  v41(v23, *MEMORY[0x263F6FC98], v1);
  __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v1);
  uint64_t v42 = v76;
  uint64_t v43 = (uint64_t)&v10[*(int *)(v76 + 48)];
  sub_2378BEF8C((uint64_t)v25, (uint64_t)v10);
  sub_2378BEF8C((uint64_t)v23, v43);
  OUTLINED_FUNCTION_9_2((uint64_t)v10);
  uint64_t v69 = v26;
  uint64_t v67 = v41;
  if (v48)
  {
    sub_2378BEFF4((uint64_t)v23, &qword_268934310);
    sub_2378BEFF4((uint64_t)v25, &qword_268934310);
    OUTLINED_FUNCTION_9_2(v43);
    if (v48)
    {
      sub_2378BEFF4((uint64_t)v10, &qword_268934310);
      uint64_t v44 = v78;
LABEL_21:
      OUTLINED_FUNCTION_14_3();
      uint64_t result = v60();
      *(unsigned char *)(v44 + 16) = 4;
      return result;
    }
    goto LABEL_11;
  }
  unint64_t v47 = v72;
  sub_2378BEF8C((uint64_t)v10, (uint64_t)v72);
  OUTLINED_FUNCTION_9_2(v43);
  if (v48)
  {
    sub_2378BEFF4((uint64_t)v23, &qword_268934310);
    sub_2378BEFF4((uint64_t)v25, &qword_268934310);
    (*(void (**)(unsigned char *, uint64_t))(v40 + 8))(v47, v1);
LABEL_11:
    sub_2378BEFF4((uint64_t)v10, &qword_268934AD8);
    goto LABEL_12;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v71, v43, v1);
  sub_2378BF048(&qword_268934AE8, 255, MEMORY[0x263F6FCA0]);
  int v66 = sub_2378C92C0();
  uint64_t v59 = *(void (**)(void))(v40 + 8);
  OUTLINED_FUNCTION_14_3();
  v59();
  sub_2378BEFF4((uint64_t)v23, &qword_268934310);
  sub_2378BEFF4((uint64_t)v25, &qword_268934310);
  OUTLINED_FUNCTION_14_3();
  v59();
  sub_2378BEFF4((uint64_t)v10, &qword_268934310);
  uint64_t v44 = v78;
  if (v66) {
    goto LABEL_21;
  }
LABEL_12:
  BOOL v49 = v75;
  sub_2378C8DC0();
  uint64_t v50 = v74;
  v67(v74, *MEMORY[0x263F6FC90], v1);
  __swift_storeEnumTagSinglePayload((uint64_t)v50, 0, 1, v1);
  uint64_t v51 = v73;
  uint64_t v52 = v73 + *(int *)(v42 + 48);
  sub_2378BEF8C((uint64_t)v49, v73);
  sub_2378BEF8C((uint64_t)v50, v52);
  OUTLINED_FUNCTION_9_2(v51);
  if (v48)
  {
    sub_2378BEFF4((uint64_t)v50, &qword_268934310);
    sub_2378BEFF4((uint64_t)v49, &qword_268934310);
    OUTLINED_FUNCTION_14_3();
    v53();
    OUTLINED_FUNCTION_9_2(v52);
    if (!v48) {
      return sub_2378BEFF4(v51, &qword_268934AD8);
    }
    uint64_t result = sub_2378BEFF4(v51, &qword_268934310);
LABEL_23:
    *(unsigned char *)(v78 + 16) = 5;
    return result;
  }
  uint64_t v54 = v70;
  sub_2378BEF8C(v51, v70);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v52, 1, v1);
  uint64_t v56 = v77;
  unint64_t v57 = (void (**)(uint64_t, uint64_t))(v77 + 8);
  if (EnumTagSinglePayload == 1)
  {
    sub_2378BEFF4((uint64_t)v74, &qword_268934310);
    sub_2378BEFF4((uint64_t)v75, &qword_268934310);
    OUTLINED_FUNCTION_14_3();
    v58();
    (*v57)(v54, v1);
    return sub_2378BEFF4(v51, &qword_268934AD8);
  }
  uint64_t v61 = v71;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 32))(v71, v52, v1);
  sub_2378BF048(&qword_268934AE8, 255, MEMORY[0x263F6FCA0]);
  char v62 = sub_2378C92C0();
  os_log_type_t v63 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
  v63(v61, v1);
  sub_2378BEFF4((uint64_t)v74, &qword_268934310);
  sub_2378BEFF4((uint64_t)v75, &qword_268934310);
  OUTLINED_FUNCTION_14_3();
  v64();
  v63(v54, v1);
  uint64_t result = sub_2378BEFF4(v51, &qword_268934310);
  if (v62) {
    goto LABEL_23;
  }
  return result;
}

uint64_t sub_2378BD984()
{
  OUTLINED_FUNCTION_41();
  v1[3] = v2;
  v1[4] = v0;
  uint64_t v3 = sub_2378C9280();
  v1[5] = v3;
  OUTLINED_FUNCTION_0(v3);
  v1[6] = v4;
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2378BDA28()
{
  uint64_t v1 = sub_2378BE07C();
  if (v1)
  {
    if (qword_268934168 != -1) {
      uint64_t v1 = swift_once();
    }
    uint64_t v2 = OUTLINED_FUNCTION_3_4(v1, (uint64_t)qword_268936078);
    v3(v2);
    uint64_t v4 = (void *)sub_2378C9270();
    os_log_type_t v5 = sub_2378C9430();
    if (OUTLINED_FUNCTION_20_1(v5))
    {
      uint64_t v6 = (_WORD *)OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_28(v6);
      OUTLINED_FUNCTION_10_0(&dword_237899000, v7, v8, "SCStartScreenRecordingFlow handleUnlockCheck | unlock is required, waiting for device to be unlocked");
      OUTLINED_FUNCTION_12();
    }
    uint64_t v9 = v0[8];
    uint64_t v10 = v0[5];
    uint64_t v11 = v0[6];
    uint64_t v12 = v0[4];

    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    *(unsigned char *)(v12 + 16) = 1;
    v0[2] = (*(uint64_t (**)(uint64_t))(v12 + 24))(v13);
    sub_2378C8A20();
    swift_retain();
    sub_2378C8CA0();
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4_2();
    return v14();
  }
  else
  {
    if (qword_268934168 != -1) {
      uint64_t v1 = swift_once();
    }
    uint64_t v16 = OUTLINED_FUNCTION_3_4(v1, (uint64_t)qword_268936078);
    v17(v16);
    uint64_t v18 = (void *)sub_2378C9270();
    os_log_type_t v19 = sub_2378C9430();
    if (OUTLINED_FUNCTION_20_1(v19))
    {
      uint64_t v20 = (_WORD *)OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_28(v20);
      OUTLINED_FUNCTION_10_0(&dword_237899000, v21, v22, "SCStartScreenRecordingFlow handleUnlockCheck | unlock is not required, proceeding to next flow");
      OUTLINED_FUNCTION_12();
    }
    uint64_t v23 = v0[4];

    uint64_t v24 = OUTLINED_FUNCTION_12_2();
    v25(v24);
    *(unsigned char *)(v23 + 16) = 2;
    swift_task_alloc();
    OUTLINED_FUNCTION_24_2();
    v0[9] = v26;
    *uint64_t v26 = v27;
    v26[1] = sub_2378BDCBC;
    uint64_t v28 = v0[3];
    return SCStartScreenRecordingFlow.execute()(v28);
  }
}

uint64_t sub_2378BDCBC()
{
  OUTLINED_FUNCTION_41();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_34();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_2378BDDDC(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = sub_2378C9280();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v19 - v9;
  if (*a1 == 1)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer(v4, (uint64_t)qword_268936078);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v11, v4);
    uint64_t v12 = sub_2378C9270();
    os_log_type_t v13 = sub_2378C9430();
    if (!os_log_type_enabled(v12, v13))
    {
      char v15 = 7;
      goto LABEL_13;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_237899000, v12, v13, "SCStartScreenRecordingFlow processDeviceUnlockResult | unable to unlock device due to error", v14, 2u);
    char v15 = 7;
  }
  else
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v4, (uint64_t)qword_268936078);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v16, v4);
    uint64_t v12 = sub_2378C9270();
    os_log_type_t v17 = sub_2378C9430();
    char v15 = 2;
    if (!os_log_type_enabled(v12, v17))
    {
      uint64_t v10 = v8;
      goto LABEL_13;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_237899000, v12, v17, "SCStartScreenRecordingFlow processDeviceUnlockResult | unlocked device, authenticated", v14, 2u);
    uint64_t v10 = v8;
  }
  MEMORY[0x237E24570](v14, -1, -1);
LABEL_13:

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  *(unsigned char *)(a2 + 16) = v15;
  return result;
}

BOOL sub_2378BE07C()
{
  uint64_t v0 = sub_2378C8D60();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_27();
  uint64_t v6 = v5 - v4;
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  sub_2378C8D50();
  char v7 = sub_2378C8B80();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return (v7 & 1) == 0;
}

uint64_t sub_2378BE158()
{
  OUTLINED_FUNCTION_41();
  v0[22] = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934320);
  OUTLINED_FUNCTION_42(v2);
  v0[23] = OUTLINED_FUNCTION_31();
  uint64_t v3 = sub_2378C8D30();
  v0[24] = v3;
  OUTLINED_FUNCTION_0(v3);
  v0[25] = v4;
  v0[26] = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2378BE208()
{
  OUTLINED_FUNCTION_41();
  sub_2378C8E40();
  swift_task_alloc();
  OUTLINED_FUNCTION_24_2();
  *(void *)(v0 + 216) = v1;
  void *v1 = v2;
  v1[1] = sub_2378BE2A8;
  uint64_t v3 = *(void *)(v0 + 208);
  return MEMORY[0x270F67A20](v3, v0 + 16);
}

uint64_t sub_2378BE2A8()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_51();
  *uint64_t v3 = v2;
  uint64_t v4 = v2 + 16;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v6 = v5;
  *(void *)(v7 + 224) = v0;
  swift_task_dealloc();
  sub_2378BEFF4(v4, &qword_268934810);
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2378BE394()
{
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v10 = *(void *)(v0 + 192);
  uint64_t v4 = *(uint64_t **)(v0 + 176);
  sub_2378C8E40();
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
  sub_2378C8B90();
  uint64_t v5 = sub_2378C8D00();
  uint64_t v6 = OUTLINED_FUNCTION_11_0(v5);
  *(_OWORD *)(v0 + 152) = 0u;
  *(void *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  uint64_t v7 = MEMORY[0x263F6FFF0];
  v4[3] = v6;
  v4[4] = v7;
  __swift_allocate_boxed_opaque_existential_1(v4);
  OUTLINED_FUNCTION_39_1();
  sub_2378BEFF4(v0 + 136, &qword_268934338);
  sub_2378BEFF4(v3, (uint64_t *)&unk_268934320);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v10);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_2378BE508()
{
  OUTLINED_FUNCTION_41();
  v0[22] = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934320);
  OUTLINED_FUNCTION_42(v2);
  v0[23] = OUTLINED_FUNCTION_31();
  uint64_t v3 = sub_2378C8D30();
  v0[24] = v3;
  OUTLINED_FUNCTION_0(v3);
  v0[25] = v4;
  v0[26] = OUTLINED_FUNCTION_31();
  uint64_t v5 = sub_2378C9260();
  OUTLINED_FUNCTION_42(v5);
  v0[27] = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_2378BE5D8()
{
  type metadata accessor for ScreenRecordingCATs();
  sub_2378C9250();
  sub_2378C91C0();
  sub_2378C8E40();
  sub_2378C91A0();
  sub_2378BEFF4(v0 + 16, &qword_268934810);
  sub_2378C91B0();
  swift_release();
  *(void *)(v0 + 224) = sub_2378C91F0();
  swift_task_alloc();
  OUTLINED_FUNCTION_24_2();
  *(void *)(v0 + 232) = v1;
  void *v1 = v2;
  v1[1] = sub_2378BE6E4;
  return sub_2378BFE5C();
}

uint64_t sub_2378BE6E4()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_51();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 240) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2378BE7BC()
{
  uint64_t v2 = *(uint64_t **)(v0 + 176);
  uint64_t v1 = *(void *)(v0 + 184);
  sub_2378C8E40();
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
  sub_2378C8B90();
  uint64_t v3 = sub_2378C8D00();
  uint64_t v4 = OUTLINED_FUNCTION_11_0(v3);
  *(_OWORD *)(v0 + 152) = 0u;
  *(void *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  uint64_t v5 = MEMORY[0x263F6FFF0];
  v2[3] = v4;
  v2[4] = v5;
  __swift_allocate_boxed_opaque_existential_1(v2);
  OUTLINED_FUNCTION_39_1();
  swift_release();
  sub_2378BEFF4(v0 + 136, &qword_268934338);
  sub_2378BEFF4(v1, (uint64_t *)&unk_268934320);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  OUTLINED_FUNCTION_14_3();
  v7(v6);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_2378BE944()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v0();
}

uint64_t SCStartScreenRecordingFlow.deinit()
{
  swift_release();
  return v0;
}

uint64_t SCStartScreenRecordingFlow.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_2378BEA24()
{
  return SCStartScreenRecordingFlow.execute(completion:)();
}

uint64_t sub_2378BEA48()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return SCStartScreenRecordingFlow.execute()();
}

uint64_t sub_2378BEAE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SCStartScreenRecordingFlow();
  return MEMORY[0x270F66CE8](v3, a2);
}

uint64_t sub_2378BEB1C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2378BEB54()
{
  OUTLINED_FUNCTION_41();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_25_1(v0);
  void *v1 = v2;
  v1[1] = sub_2378A946C;
  OUTLINED_FUNCTION_31_0();
  return sub_2378BD0CC();
}

unint64_t sub_2378BEBE0()
{
  unint64_t result = qword_268934A80;
  if (!qword_268934A80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268934A78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268934A80);
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

uint64_t sub_2378BEC7C()
{
  OUTLINED_FUNCTION_41();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_25_1(v0);
  void *v1 = v2;
  v1[1] = sub_2378A6320;
  OUTLINED_FUNCTION_31_0();
  return sub_2378BD034();
}

uint64_t sub_2378BED04()
{
  OUTLINED_FUNCTION_41();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_25_1(v0);
  void *v1 = v2;
  v1[1] = sub_2378A946C;
  OUTLINED_FUNCTION_31_0();
  return sub_2378BCF9C();
}

uint64_t type metadata accessor for SCStartScreenRecordingFlow()
{
  return self;
}

uint64_t getEnumTagSinglePayload for SCStartScreenRecordingFlow.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SCStartScreenRecordingFlow.State(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x2378BEF04);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SCStartScreenRecordingFlow.State()
{
  return &type metadata for SCStartScreenRecordingFlow.State;
}

unint64_t sub_2378BEF40()
{
  unint64_t result = qword_268934AD0;
  if (!qword_268934AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934AD0);
  }
  return result;
}

uint64_t sub_2378BEF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934310);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2378BEFF4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_19();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_2378BF048(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2378BF090(unsigned char *a1)
{
  return sub_2378BDDDC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_7_6(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(v3, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25_1(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return sub_2378C8C90();
}

uint64_t SCGuestModeFlow.on(input:)()
{
  return 1;
}

uint64_t SCGuestModeFlow.execute()()
{
  OUTLINED_FUNCTION_41();
  v1[4] = v2;
  v1[5] = v0;
  uint64_t v3 = sub_2378C9280();
  v1[6] = v3;
  OUTLINED_FUNCTION_0(v3);
  v1[7] = v4;
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2378BF2CC, 0, 0);
}

uint64_t sub_2378BF2CC()
{
  uint64_t v21 = v0;
  if (qword_268934168 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_268936078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain();
  uint64_t v5 = sub_2378C9270();
  os_log_type_t v6 = sub_2378C9430();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = v0[7];
  uint64_t v9 = v0[8];
  uint64_t v11 = v0[5];
  uint64_t v10 = v0[6];
  if (v7)
  {
    uint64_t v19 = v0[8];
    uint64_t v18 = v0[6];
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v20[0] = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v14 = *(void *)(v11 + 16);
    unint64_t v15 = *(void *)(v11 + 24);
    swift_bridgeObjectRetain();
    v0[3] = sub_2378A1964(v14, v15, v20);
    sub_2378C94B0();
    swift_bridgeObjectRelease();
    swift_release();
    _os_log_impl(&dword_237899000, v5, v6, "#GUM %s execute | guest mode is only on visionOS", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237E24570](v13, -1, -1);
    MEMORY[0x237E24570](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v19, v18);
  }
  else
  {
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  }
  swift_retain();
  sub_2378C8D90();
  sub_2378C89D0();
  swift_allocObject();
  v0[2] = sub_2378C89C0();
  sub_2378C8CB0();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v16();
}

uint64_t sub_2378BF57C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378BF708();
}

uint64_t sub_2378BF614()
{
  OUTLINED_FUNCTION_41();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378BF57C();
}

uint64_t SCGuestModeFlow.execute(completion:)()
{
  return sub_2378C8A90();
}

uint64_t sub_2378BF708()
{
  OUTLINED_FUNCTION_41();
  v0[22] = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934320);
  v0[23] = swift_task_alloc();
  uint64_t v2 = sub_2378C8D30();
  v0[24] = v2;
  OUTLINED_FUNCTION_0(v2);
  v0[25] = v3;
  v0[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2378BF7D0, 0, 0);
}

uint64_t sub_2378BF7D0()
{
  OUTLINED_FUNCTION_41();
  sub_2378C8E40();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v1;
  void *v1 = v0;
  v1[1] = sub_2378BF874;
  uint64_t v2 = *(void *)(v0 + 208);
  return MEMORY[0x270F67A20](v2, v0 + 16);
}

uint64_t sub_2378BF874()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v2 + 16;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 224) = v0;
  swift_task_dealloc();
  sub_2378A6E7C(v3, &qword_268934810);
  if (v0) {
    BOOL v7 = sub_2378A67C0;
  }
  else {
    BOOL v7 = sub_2378A6628;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t SCGuestModeFlow.deinit()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  return v0;
}

uint64_t SCGuestModeFlow.__deallocating_deinit()
{
  SCGuestModeFlow.deinit();
  return MEMORY[0x270FA0228](v0, 120, 7);
}

uint64_t sub_2378BF9D0()
{
  return SCGuestModeFlow.execute(completion:)();
}

uint64_t sub_2378BF9F4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return SCGuestModeFlow.execute()();
}

uint64_t sub_2378BFA90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SCGuestModeFlow();
  return MEMORY[0x270F66CE8](v3, a2);
}

BOOL static RequestType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t RequestType.hash(into:)()
{
  return sub_2378C95E0();
}

uint64_t RequestType.hashValue.getter()
{
  return sub_2378C95F0();
}

BOOL sub_2378BFB48(char *a1, char *a2)
{
  return static RequestType.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_2378BFB54()
{
  return RequestType.hashValue.getter();
}

uint64_t sub_2378BFB5C()
{
  return RequestType.hash(into:)();
}

uint64_t type metadata accessor for SCGuestModeFlow()
{
  return self;
}

unint64_t sub_2378BFB88()
{
  unint64_t result = qword_268934B10[0];
  if (!qword_268934B10[0])
  {
    type metadata accessor for SCGuestModeFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268934B10);
  }
  return result;
}

unint64_t sub_2378BFBD8()
{
  unint64_t result = qword_268934B28;
  if (!qword_268934B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268934B28);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RequestType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for RequestType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x2378BFD78);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RequestType()
{
  return &type metadata for RequestType;
}

uint64_t type metadata accessor for ScreenRecordingCATs()
{
  uint64_t result = qword_268934B38;
  if (!qword_268934B38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2378BFDF8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2378BFE38()
{
  return MEMORY[0x270F64EB8](0xD000000000000035);
}

uint64_t sub_2378BFE5C()
{
  OUTLINED_FUNCTION_10_3();
  uint64_t v0 = OUTLINED_FUNCTION_1_0();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_25_1(v0);
  void *v1 = v2;
  v1[1] = sub_2378A3344;
  OUTLINED_FUNCTION_3_6();
  uint64_t v3 = OUTLINED_FUNCTION_2_2();
  return v4(v3);
}

uint64_t sub_2378BFEFC()
{
  OUTLINED_FUNCTION_10_3();
  uint64_t v1 = v0;
  uint64_t v2 = OUTLINED_FUNCTION_1_0();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_25_1(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_2378A3344;
  OUTLINED_FUNCTION_3_6();
  return v6(v1, 0xD00000000000002FLL);
}

uint64_t sub_2378BFFAC()
{
  OUTLINED_FUNCTION_10_3();
  uint64_t v0 = OUTLINED_FUNCTION_1_0();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_25_1(v0);
  void *v1 = v2;
  v1[1] = sub_2378A3344;
  OUTLINED_FUNCTION_3_6();
  uint64_t v3 = OUTLINED_FUNCTION_2_2();
  return v4(v3);
}

uint64_t sub_2378C004C()
{
  OUTLINED_FUNCTION_10_3();
  uint64_t v1 = v0;
  uint64_t v2 = OUTLINED_FUNCTION_1_0();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_25_1(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_2378A2ED4;
  OUTLINED_FUNCTION_3_6();
  return v6(v1, 0xD000000000000029);
}

uint64_t sub_2378C00FC()
{
  OUTLINED_FUNCTION_10_3();
  uint64_t v0 = OUTLINED_FUNCTION_1_0();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_25_1(v0);
  void *v1 = v2;
  v1[1] = sub_2378A3344;
  OUTLINED_FUNCTION_3_6();
  uint64_t v3 = OUTLINED_FUNCTION_2_2();
  return v4(v3);
}

uint64_t sub_2378C019C(uint64_t a1, uint64_t a2)
{
  return sub_2378C01F0(a1, a2);
}

uint64_t sub_2378C01F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2378C9260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934880);
  MEMORY[0x270FA5388](v8 - 8);
  sub_2378A327C(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v10 = sub_2378C91D0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_2378A32E4(a1);
  return v10;
}

uint64_t sub_2378C0358()
{
  return type metadata accessor for ScreenRecordingCATs();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return v0;
}

id sub_2378C0384(uint64_t a1)
{
  return sub_2378C03A8(a1);
}

id sub_2378C03A8(uint64_t a1)
{
  return objc_msgSend(v1, sel_shutdownWithOptions_, a1);
}

uint64_t sub_2378C03BC()
{
  return sub_2378BB73C();
}

uint64_t SCRestartShutdownFlow.on(input:)()
{
  return 1;
}

uint64_t SCRestartShutdownFlow.execute()()
{
  OUTLINED_FUNCTION_41();
  v1[15] = v2;
  v1[16] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689349C0);
  OUTLINED_FUNCTION_42(v3);
  v1[17] = OUTLINED_FUNCTION_31();
  uint64_t v4 = sub_2378C8C10();
  v1[18] = v4;
  OUTLINED_FUNCTION_0(v4);
  v1[19] = v5;
  v1[20] = OUTLINED_FUNCTION_31();
  uint64_t v6 = sub_2378C9280();
  v1[21] = v6;
  OUTLINED_FUNCTION_0(v6);
  v1[22] = v7;
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2378C04FC()
{
  uint64_t v70 = v0;
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  OUTLINED_FUNCTION_8_2();
  char v1 = sub_2378C8BD0();
  uint64_t v2 = __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v1)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v4 = *(void *)(v0 + 176);
    uint64_t v3 = *(void *)(v0 + 184);
    uint64_t v5 = *(void *)(v0 + 168);
    uint64_t v6 = __swift_project_value_buffer(v5, (uint64_t)qword_268936078);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
    uint64_t v7 = sub_2378C9270();
    os_log_type_t v8 = sub_2378C9430();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)OUTLINED_FUNCTION_29();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_237899000, v7, v8, "SCRestartShutdownFlow execute | cannot shutdown in Carplay", v9, 2u);
      OUTLINED_FUNCTION_12();
    }
    uint64_t v10 = *(void *)(v0 + 128);

    uint64_t v11 = OUTLINED_FUNCTION_8_2();
    v12(v11);
    *(unsigned char *)(v10 + 16) = 7;
    swift_retain();
    sub_2378C8D90();
    sub_2378C89D0();
    swift_allocObject();
    *(void *)(v0 + 112) = sub_2378C89C0();
    sub_2378C8CB0();
LABEL_26:
    swift_release();
LABEL_35:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4_2();
    return v67();
  }
  uint64_t v13 = *(void *)(v0 + 128);
  int v14 = *(unsigned __int8 *)(v13 + 16);
  if (v14 == 4)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v26 = *(void *)(v0 + 200);
    uint64_t v28 = *(void *)(v0 + 168);
    uint64_t v27 = *(void *)(v0 + 176);
    uint64_t v29 = __swift_project_value_buffer(v28, (uint64_t)qword_268936078);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v26, v29, v28);
    swift_retain();
    uint64_t v30 = sub_2378C9270();
    os_log_type_t v31 = sub_2378C9430();
    BOOL v32 = os_log_type_enabled(v30, v31);
    uint64_t v33 = *(void *)(v0 + 128);
    if (v32)
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 67109120;
      *(_DWORD *)(v0 + 232) = *(unsigned __int8 *)(v33 + 17);
      sub_2378C94B0();
      swift_release();
      _os_log_impl(&dword_237899000, v30, v31, "SCRestartShutdownFlow execute | isShutdownOnly: %{BOOL}d", v34, 8u);
      OUTLINED_FUNCTION_12();
    }
    else
    {
      swift_release();
    }

    uint64_t v60 = *(void *)(v0 + 152);
    uint64_t v61 = *(void *)(v0 + 160);
    uint64_t v62 = *(void *)(v0 + 136);
    uint64_t v63 = *(void *)(v0 + 144);
    (*(void (**)(void, void))(*(void *)(v0 + 176) + 8))(*(void *)(v0 + 200), *(void *)(v0 + 168));
    sub_2378C1164(40000000000000000, 0);
    sub_2378C8AF0();
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), *(void *)(v0 + 80));
    (*(void (**)(uint64_t, void, uint64_t))(v60 + 104))(v61, *MEMORY[0x263F6F9F0], v63);
    sub_2378C8B60();
    uint64_t v64 = *MEMORY[0x263F6F748];
    uint64_t v65 = sub_2378C8B10();
    OUTLINED_FUNCTION_19();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 104))(v62, v64, v65);
    __swift_storeEnumTagSinglePayload(v62, 0, 1, v65);
    OUTLINED_FUNCTION_14_4();
    sub_2378C8B50();
    sub_2378C8B00();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    goto LABEL_34;
  }
  if (v14 == 2)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v35 = *(void *)(v0 + 208);
    uint64_t v36 = *(void *)(v0 + 168);
    uint64_t v37 = *(void *)(v0 + 176);
    uint64_t v38 = __swift_project_value_buffer(v36, (uint64_t)qword_268936078);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v35, v38, v36);
    uint64_t v39 = sub_2378C9270();
    os_log_type_t v40 = sub_2378C9430();
    if (OUTLINED_FUNCTION_20_1(v40))
    {
      uint64_t v41 = (uint8_t *)OUTLINED_FUNCTION_29();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_237899000, v39, (os_log_type_t)v36, "SCRestartShutdownFlow execute | prompting for confirmation", v41, 2u);
      OUTLINED_FUNCTION_12();
    }
    uint64_t v42 = *(void *)(v0 + 208);
    uint64_t v43 = *(void *)(v0 + 168);
    uint64_t v44 = *(void *)(v0 + 176);
    uint64_t v45 = *(void *)(v0 + 128);

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v42, v43);
    *(unsigned char *)(v13 + 16) = 3;
    sub_2378C8E40();
    char v46 = *(unsigned char *)(v45 + 17);
    type metadata accessor for SCSystemCommandsYesNoStrategy();
    swift_allocObject();
    sub_23789B154((uint64_t)v69, v46);
    sub_2378C8D90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934A78);
    swift_allocObject();
    sub_2378C407C(qword_2689341C8, 255, (void (*)(uint64_t))type metadata accessor for SCSystemCommandsYesNoStrategy);
    *(void *)(v0 + 104) = sub_2378C8A10();
    sub_2378BEBE0();
    swift_retain();
    sub_2378C8CA0();
    swift_release();
    goto LABEL_26;
  }
  if (*(unsigned char *)(v13 + 16))
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v47 = *(void *)(v0 + 192);
    uint64_t v48 = *(void *)(v0 + 168);
    uint64_t v49 = *(void *)(v0 + 176);
    uint64_t v50 = __swift_project_value_buffer(v48, (uint64_t)qword_268936078);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v47, v50, v48);
    swift_retain_n();
    uint64_t v51 = sub_2378C9270();
    os_log_type_t v52 = sub_2378C9430();
    BOOL v53 = os_log_type_enabled(v51, v52);
    uint64_t v54 = *(void *)(v0 + 192);
    uint64_t v56 = *(void *)(v0 + 168);
    uint64_t v55 = *(void *)(v0 + 176);
    if (v53)
    {
      uint64_t v68 = *(void *)(v0 + 192);
      unint64_t v57 = (uint8_t *)swift_slowAlloc();
      v69[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v57 = 136315138;
      *(unsigned char *)(v0 + 236) = *(unsigned char *)(v13 + 16);
      uint64_t v58 = sub_2378C92F0();
      *(void *)(v0 + 96) = sub_2378A1964(v58, v59, v69);
      sub_2378C94B0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237899000, v51, v52, "SCRestartShutdownFlow execute | flow completed with state: %s", v57, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_12();

      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v68, v56);
    }
    else
    {

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v54, v56);
    }
LABEL_34:
    sub_2378C8CD0();
    goto LABEL_35;
  }
  if (qword_268934168 != -1) {
    uint64_t v2 = swift_once();
  }
  uint64_t v15 = OUTLINED_FUNCTION_3_4(v2, (uint64_t)qword_268936078);
  v16(v15);
  os_log_type_t v17 = (void *)sub_2378C9270();
  os_log_type_t v18 = sub_2378C9430();
  if (OUTLINED_FUNCTION_20_1(v18))
  {
    uint64_t v19 = (_WORD *)OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_28(v19);
    OUTLINED_FUNCTION_10_0(&dword_237899000, v20, v21, "SCRestartShutdownFlow execute | checking if device unlock is required");
    OUTLINED_FUNCTION_12();
  }

  uint64_t v22 = OUTLINED_FUNCTION_12_2();
  v23(v22);
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_2378C0E9C;
  return sub_2378C251C();
}

uint64_t sub_2378C0E9C()
{
  OUTLINED_FUNCTION_11_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_34();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_2378C1040()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378C2F04();
}

uint64_t SCRestartShutdownFlow.execute(completion:)()
{
  type metadata accessor for SCRestartShutdownFlow();
  sub_2378C407C(&qword_268934778, v0, (void (*)(uint64_t))type metadata accessor for SCRestartShutdownFlow);
  return sub_2378C8A90();
}

uint64_t sub_2378C1164(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934CC0);
  uint64_t v8 = OUTLINED_FUNCTION_42(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_5_3();
  uint64_t v9 = sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_27();
  uint64_t v15 = v14 - v13;
  sub_2378C3DE4();
  id v16 = sub_2378C14B8();
  objc_msgSend(v16, sel_setRebootType_, (*(unsigned char *)(v4 + 17) & 1) == 0);
  objc_msgSend(v16, sel_setSource_, 1);
  if (qword_268934168 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v9, (uint64_t)qword_268936078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v15, v17, v9);
  os_log_type_t v18 = v16;
  uint64_t v19 = sub_2378C9270();
  os_log_type_t v20 = sub_2378C9430();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v30 = a2;
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = v4;
    uint64_t v22 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 138412290;
    uint64_t v29 = a1;
    uint64_t v23 = v18;
    sub_2378C94B0();
    *uint64_t v22 = v18;

    a1 = v29;
    _os_log_impl(&dword_237899000, v19, v20, "SCRestartShutdownFlow execute | submitting shutdown command with: %@", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934BC8);
    swift_arrayDestroy();
    uint64_t v4 = v31;
    OUTLINED_FUNCTION_12();
    a2 = v30;
    OUTLINED_FUNCTION_12();
  }
  else
  {

    uint64_t v19 = v18;
  }

  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_39();
  v24();
  sub_2378C93D0();
  uint64_t v25 = sub_2378C93F0();
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v25);
  uint64_t v26 = (void *)swift_allocObject();
  v26[2] = 0;
  v26[3] = 0;
  v26[4] = a1;
  v26[5] = a2;
  v26[6] = v4;
  v26[7] = v18;
  uint64_t v27 = v18;
  swift_retain();
  sub_2378C1ABC(v3, (uint64_t)&unk_268934BC0, (uint64_t)v26);
  swift_release();

  return sub_2378BEFF4(v3, &qword_268934CC0);
}

id sub_2378C14B8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_2378C92D0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithReason_, v1);

  return v2;
}

uint64_t sub_2378C152C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  uint64_t v8 = sub_2378C9280();
  v7[6] = v8;
  v7[7] = *(void *)(v8 - 8);
  v7[8] = swift_task_alloc();
  uint64_t v9 = sub_2378C9530();
  v7[9] = v9;
  v7[10] = *(void *)(v9 - 8);
  v7[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2378C164C, 0, 0);
}

uint64_t sub_2378C164C()
{
  OUTLINED_FUNCTION_7_0();
  sub_2378C9620();
  if (sub_2378C9610())
  {
    sub_2378C9520();
    uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_268934BE0 + dword_268934BE0);
    uint64_t v1 = (void *)swift_task_alloc();
    v0[12] = v1;
    void *v1 = v0;
    v1[1] = sub_2378C1820;
    uint64_t v3 = v0[2];
    uint64_t v2 = v0[3];
    return v17(v3, v2, 0, 0, 1);
  }
  else
  {
    uint64_t v5 = OUTLINED_FUNCTION_10_6();
    uint64_t v7 = v6(v5);
    if (qword_268934168 != -1) {
      uint64_t v7 = swift_once();
    }
    uint64_t v8 = OUTLINED_FUNCTION_3_4(v7, (uint64_t)qword_268936078);
    v9(v8);
    uint64_t v10 = (void *)sub_2378C9270();
    os_log_type_t v11 = sub_2378C9430();
    if (OUTLINED_FUNCTION_20_1(v11))
    {
      uint64_t v12 = (_WORD *)OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_28(v12);
      OUTLINED_FUNCTION_10_0(&dword_237899000, v13, v14, "SCRestartShutdownFlow execute | submitted command");
      OUTLINED_FUNCTION_12();
    }

    OUTLINED_FUNCTION_17_1();
    v15();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4_2();
    return v16();
  }
}

uint64_t sub_2378C1820()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0) {

  }
  OUTLINED_FUNCTION_17_1();
  v4();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2378C19A0()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v0 = OUTLINED_FUNCTION_10_6();
  uint64_t v2 = v1(v0);
  if (qword_268934168 != -1) {
    uint64_t v2 = swift_once();
  }
  uint64_t v3 = OUTLINED_FUNCTION_3_4(v2, (uint64_t)qword_268936078);
  v4(v3);
  uint64_t v5 = (void *)sub_2378C9270();
  os_log_type_t v6 = sub_2378C9430();
  if (OUTLINED_FUNCTION_20_1(v6))
  {
    uint64_t v7 = (_WORD *)OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_28(v7);
    OUTLINED_FUNCTION_10_0(&dword_237899000, v8, v9, "SCRestartShutdownFlow execute | submitted command");
    OUTLINED_FUNCTION_12();
  }

  OUTLINED_FUNCTION_17_1();
  v10();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v11();
}

uint64_t sub_2378C1ABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2378C343C(a1, 0, 0, 0, 1, 0, 0);
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2378C93C0();
    swift_unknownObjectRelease();
  }
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2378C1BCC(uint64_t a1)
{
  uint64_t v97 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689349C0);
  uint64_t v2 = OUTLINED_FUNCTION_42(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_16_2();
  uint64_t v87 = v3;
  sub_2378C8C10();
  OUTLINED_FUNCTION_2();
  uint64_t v84 = v5;
  uint64_t v85 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_16_2();
  uint64_t v86 = v6;
  uint64_t v7 = sub_2378C8D70();
  OUTLINED_FUNCTION_2();
  uint64_t v95 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_16_2();
  uint64_t v89 = v10;
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934AD8);
  OUTLINED_FUNCTION_19();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_10();
  uint64_t v91 = v12;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = &v79[-v14];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934310);
  uint64_t v17 = OUTLINED_FUNCTION_42(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_10();
  uint64_t v88 = v18;
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v19);
  unint64_t v92 = &v79[-v20];
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v21);
  uint64_t v93 = &v79[-v22];
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v23);
  uint64_t v90 = &v79[-v24];
  OUTLINED_FUNCTION_11();
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v28 = &v79[-v27];
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = &v79[-v29];
  uint64_t v31 = sub_2378C8DD0();
  OUTLINED_FUNCTION_2();
  uint64_t v33 = v32;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_27();
  uint64_t v37 = v36 - v35;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934AE0);
  OUTLINED_FUNCTION_2();
  uint64_t v40 = v39;
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_27();
  uint64_t v44 = v43 - v42;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v43 - v42, v97, v38);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v40 + 88))(v44, v38) != *MEMORY[0x263F6FA10])
  {
    *(unsigned char *)(v96 + 16) = 6;
    return (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 8))(v44, v38);
  }
  (*(void (**)(uint64_t, uint64_t))(v40 + 96))(v44, v38);
  uint64_t v97 = v33;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32))(v37, v44, v31);
  uint64_t v45 = v37;
  sub_2378C8DC0();
  uint64_t v46 = *MEMORY[0x263F6FC98];
  uint64_t v82 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v95 + 104);
  v82(v28, v46, v7);
  OUTLINED_FUNCTION_28_2();
  uint64_t v48 = (uint64_t)&v15[v47];
  sub_2378C4020((uint64_t)v30, (uint64_t)v15, &qword_268934310);
  sub_2378C4020((uint64_t)v28, v48, &qword_268934310);
  OUTLINED_FUNCTION_7_7((uint64_t)v15);
  uint64_t v49 = v31;
  if (v55)
  {
    sub_2378BEFF4((uint64_t)v28, &qword_268934310);
    sub_2378BEFF4((uint64_t)v30, &qword_268934310);
    OUTLINED_FUNCTION_7_7(v48);
    uint64_t v50 = v45;
    if (v55)
    {
      sub_2378BEFF4((uint64_t)v15, &qword_268934310);
      uint64_t v51 = v96;
      uint64_t v52 = v97;
LABEL_22:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v52 + 8))(v50, v49);
      *(unsigned char *)(v51 + 16) = 4;
      return result;
    }
    goto LABEL_11;
  }
  uint64_t v81 = v30;
  uint64_t v54 = v90;
  sub_2378C4020((uint64_t)v15, (uint64_t)v90, &qword_268934310);
  OUTLINED_FUNCTION_7_7(v48);
  if (v55)
  {
    sub_2378BEFF4((uint64_t)v28, &qword_268934310);
    sub_2378BEFF4((uint64_t)v81, &qword_268934310);
    (*(void (**)(unsigned char *, uint64_t))(v95 + 8))(v54, v7);
    uint64_t v50 = v45;
LABEL_11:
    sub_2378BEFF4((uint64_t)v15, &qword_268934AD8);
    uint64_t v51 = v96;
    uint64_t v52 = v97;
    goto LABEL_12;
  }
  uint64_t v68 = v95;
  uint64_t v69 = v89;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v95 + 32))(v89, v48, v7);
  sub_2378C407C(&qword_268934AE8, 255, MEMORY[0x263F6FCA0]);
  int v80 = sub_2378C92C0();
  uint64_t v83 = v49;
  uint64_t v70 = *(void (**)(uint64_t, uint64_t))(v68 + 8);
  v70(v69, v7);
  sub_2378BEFF4((uint64_t)v28, &qword_268934310);
  sub_2378BEFF4((uint64_t)v81, &qword_268934310);
  v70((uint64_t)v54, v7);
  uint64_t v49 = v83;
  sub_2378BEFF4((uint64_t)v15, &qword_268934310);
  uint64_t v51 = v96;
  uint64_t v52 = v97;
  uint64_t v50 = v45;
  if (v80) {
    goto LABEL_22;
  }
LABEL_12:
  uint64_t v83 = v49;
  uint64_t v56 = v93;
  sub_2378C8DC0();
  unint64_t v57 = v92;
  v82(v92, *MEMORY[0x263F6FC90], v7);
  OUTLINED_FUNCTION_28_2();
  uint64_t v58 = v91;
  uint64_t v60 = v91 + v59;
  sub_2378C4020((uint64_t)v56, v91, &qword_268934310);
  uint64_t v61 = OUTLINED_FUNCTION_29_1();
  sub_2378C4020(v61, v62, &qword_268934310);
  OUTLINED_FUNCTION_7_7(v58);
  if (v55)
  {
    sub_2378BEFF4((uint64_t)v57, &qword_268934310);
    sub_2378BEFF4((uint64_t)v56, &qword_268934310);
    OUTLINED_FUNCTION_7_7(v60);
    if (v55)
    {
      sub_2378BEFF4(v58, &qword_268934310);
LABEL_24:
      *(unsigned char *)(v51 + 16) = 5;
      sub_2378C8AF0();
      __swift_project_boxed_opaque_existential_1(v98, v98[3]);
      (*(void (**)(uint64_t, void, uint64_t))(v84 + 104))(v86, *MEMORY[0x263F6F9E8], v85);
      sub_2378C8B60();
      uint64_t v74 = v50;
      uint64_t v75 = *MEMORY[0x263F6F6F0];
      uint64_t v76 = sub_2378C8B10();
      OUTLINED_FUNCTION_19();
      uint64_t v78 = v87;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 104))(v87, v75, v76);
      __swift_storeEnumTagSinglePayload(v78, 0, 1, v76);
      OUTLINED_FUNCTION_14_4();
      sub_2378C8B50();
      sub_2378C8B00();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v74, v83);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
    }
    goto LABEL_20;
  }
  uint64_t v63 = v88;
  sub_2378C4020(v58, v88, &qword_268934310);
  OUTLINED_FUNCTION_7_7(v60);
  uint64_t v65 = v95;
  if (v64)
  {
    uint64_t v66 = OUTLINED_FUNCTION_29_1();
    sub_2378BEFF4(v66, v67);
    sub_2378BEFF4((uint64_t)v56, &qword_268934310);
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v63, v7);
LABEL_20:
    sub_2378BEFF4(v58, &qword_268934AD8);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v52 + 8))(v50, v83);
  }
  uint64_t v71 = OUTLINED_FUNCTION_29_1();
  v72(v71);
  sub_2378C407C(&qword_268934AE8, 255, MEMORY[0x263F6FCA0]);
  LODWORD(v97) = sub_2378C92C0();
  uint64_t v73 = *(void (**)(void))(v65 + 8);
  OUTLINED_FUNCTION_39();
  v73();
  sub_2378BEFF4((uint64_t)v92, &qword_268934310);
  sub_2378BEFF4((uint64_t)v93, &qword_268934310);
  OUTLINED_FUNCTION_39();
  v73();
  sub_2378BEFF4(v58, &qword_268934310);
  if (v97) {
    goto LABEL_24;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v52 + 8))(v50, v83);
}

uint64_t sub_2378C24E0()
{
  return sub_2378C8B40();
}

uint64_t sub_2378C251C()
{
  OUTLINED_FUNCTION_41();
  v1[3] = v2;
  v1[4] = v0;
  uint64_t v3 = sub_2378C9280();
  v1[5] = v3;
  OUTLINED_FUNCTION_0(v3);
  v1[6] = v4;
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2378C25C0()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = sub_2378C2E34();
  if (v1)
  {
    if (qword_268934168 != -1) {
      uint64_t v1 = swift_once();
    }
    uint64_t v2 = OUTLINED_FUNCTION_3_4(v1, (uint64_t)qword_268936078);
    v3(v2);
    uint64_t v4 = (void *)sub_2378C9270();
    os_log_type_t v5 = sub_2378C9430();
    if (OUTLINED_FUNCTION_20_1(v5))
    {
      uint64_t v6 = (_WORD *)OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_28(v6);
      OUTLINED_FUNCTION_10_0(&dword_237899000, v7, v8, "SCRestartShutdownFlow handleUnlockCheck | unlock is required, waiting for device to be unlocked");
      OUTLINED_FUNCTION_12();
    }
    uint64_t v9 = v0[4];

    OUTLINED_FUNCTION_39();
    uint64_t v11 = v10();
    *(unsigned char *)(v9 + 16) = 1;
    v0[2] = (*(uint64_t (**)(uint64_t))(v9 + 24))(v11);
    sub_2378C8A20();
    swift_retain();
    sub_2378C8CA0();
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4_2();
    return v12();
  }
  else
  {
    if (qword_268934168 != -1) {
      uint64_t v1 = swift_once();
    }
    uint64_t v14 = OUTLINED_FUNCTION_3_4(v1, (uint64_t)qword_268936078);
    v15(v14);
    uint64_t v16 = (void *)sub_2378C9270();
    os_log_type_t v17 = sub_2378C9430();
    if (OUTLINED_FUNCTION_20_1(v17))
    {
      uint64_t v18 = (_WORD *)OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_28(v18);
      OUTLINED_FUNCTION_10_0(&dword_237899000, v19, v20, "SCRestartShutdownFlow handleUnlockCheck | unlock is not required, proceeding to next flow");
      OUTLINED_FUNCTION_12();
    }
    uint64_t v21 = v0[4];

    uint64_t v22 = OUTLINED_FUNCTION_12_2();
    v23(v22);
    *(unsigned char *)(v21 + 16) = 2;
    uint64_t v24 = (void *)swift_task_alloc();
    v0[9] = v24;
    *uint64_t v24 = v0;
    v24[1] = sub_2378C2850;
    uint64_t v25 = v0[3];
    return SCRestartShutdownFlow.execute()(v25);
  }
}

uint64_t sub_2378C2850()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_11_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_34();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_2378C294C(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689349C0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v33[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2378C8C10();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v33[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2378C9280();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v33[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  os_log_type_t v17 = (char *)&v33[-1] - v16;
  if (*a1 == 1)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v11, (uint64_t)qword_268936078);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v17, v18, v11);
    uint64_t v19 = sub_2378C9270();
    os_log_type_t v20 = sub_2378C9430();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = a2;
      uint64_t v22 = v7;
      uint64_t v23 = v21;
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_237899000, v19, v20, "SCRestartShutdownFlow processDeviceUnlockResult | unable to unlock device due to error", v21, 2u);
      uint64_t v24 = v23;
      uint64_t v7 = v22;
      a2 = v32;
      MEMORY[0x237E24570](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
    *(unsigned char *)(a2 + 16) = 7;
    sub_2378C8AF0();
    __swift_project_boxed_opaque_existential_1(v33, v33[3]);
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F6F9E0], v7);
    sub_2378C8B60();
    uint64_t v25 = *MEMORY[0x263F6F6C8];
    uint64_t v26 = sub_2378C8B10();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104))(v6, v25, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v26);
    sub_2378C8B50();
    sub_2378C8B00();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  }
  else
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v28 = __swift_project_value_buffer(v11, (uint64_t)qword_268936078);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v28, v11);
    uint64_t v29 = sub_2378C9270();
    os_log_type_t v30 = sub_2378C9430();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl(&dword_237899000, v29, v30, "SCRestartShutdownFlow processDeviceUnlockResult | unlocked device, authenticated", v31, 2u);
      MEMORY[0x237E24570](v31, -1, -1);
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    *(unsigned char *)(a2 + 16) = 2;
  }
  return result;
}

uint64_t sub_2378C2DF8()
{
  return sub_2378C8B40();
}

BOOL sub_2378C2E34()
{
  sub_2378C8D60();
  OUTLINED_FUNCTION_2();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_5_3();
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_2378C8D50();
  char v1 = sub_2378C8B80();
  OUTLINED_FUNCTION_17_1();
  v2();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return (v1 & 1) == 0;
}

uint64_t sub_2378C2F04()
{
  OUTLINED_FUNCTION_41();
  v0[22] = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934320);
  OUTLINED_FUNCTION_42(v2);
  v0[23] = OUTLINED_FUNCTION_31();
  uint64_t v3 = sub_2378C8D30();
  v0[24] = v3;
  OUTLINED_FUNCTION_0(v3);
  v0[25] = v4;
  v0[26] = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2378C2FB4()
{
  OUTLINED_FUNCTION_41();
  sub_2378C8E40();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v1;
  void *v1 = v0;
  v1[1] = sub_2378C3058;
  uint64_t v2 = *(void *)(v0 + 208);
  return MEMORY[0x270F67A20](v2, v0 + 16);
}

uint64_t sub_2378C3058()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v2 + 16;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 224) = v0;
  swift_task_dealloc();
  sub_2378BEFF4(v3, &qword_268934810);
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2378C314C()
{
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(uint64_t **)(v0 + 176);
  sub_2378C8E40();
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
  sub_2378C8B90();
  uint64_t v3 = sub_2378C8D00();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v3);
  uint64_t v4 = sub_2378C8E80();
  *(_OWORD *)(v0 + 152) = 0u;
  *(void *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  uint64_t v5 = MEMORY[0x263F6FFF0];
  v2[3] = v4;
  v2[4] = v5;
  __swift_allocate_boxed_opaque_existential_1(v2);
  sub_2378C8C90();
  sub_2378BEFF4(v0 + 136, &qword_268934338);
  sub_2378BEFF4(v1, (uint64_t *)&unk_268934320);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  OUTLINED_FUNCTION_17_1();
  v7(v6);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_35();
  return v8();
}

uint64_t SCRestartShutdownFlow.deinit()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return v0;
}

uint64_t SCRestartShutdownFlow.__deallocating_deinit()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t sub_2378C3344()
{
  return SCRestartShutdownFlow.execute(completion:)();
}

uint64_t sub_2378C3368()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A946C;
  return SCRestartShutdownFlow.execute()();
}

uint64_t sub_2378C3404(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SCRestartShutdownFlow();
  return MEMORY[0x270F66CE8](v3, a2);
}

uint64_t sub_2378C343C(uint64_t a1, char a2, char a3, char a4, char a5, char a6, char a7)
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934CC0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2378C4020(a1, (uint64_t)v16, &qword_268934CC0);
  uint64_t v17 = sub_2378C93F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
  {
    sub_2378BEFF4((uint64_t)v16, &qword_268934CC0);
    uint64_t result = 0;
    if ((a2 & 1) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unsigned __int8 v19 = sub_2378C93E0();
    (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
    uint64_t result = v19;
    if ((a2 & 1) == 0)
    {
LABEL_3:
      if (a3) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  result |= 0x100uLL;
  if (a3)
  {
LABEL_4:
    result |= 0x400uLL;
    if ((a4 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  if ((a4 & 1) == 0)
  {
LABEL_5:
    if ((a5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  result |= 0x800uLL;
  if (a5) {
LABEL_6:
  }
    result |= 0x1000uLL;
LABEL_7:
  if (a6) {
    result |= 0x2000uLL;
  }
  if (a7) {
    return result | 0x4000;
  }
  return result;
}

uint64_t sub_2378C35AC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2378C3688;
  return v6(a1);
}

uint64_t sub_2378C3688()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_34();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_35();
  return v3();
}

uint64_t sub_2378C3748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_2378C9510();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_2378C384C, 0, 0);
}

uint64_t sub_2378C384C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_2378C9530();
  uint64_t v5 = sub_2378C407C(&qword_268934BE8, 255, MEMORY[0x263F8F710]);
  OUTLINED_FUNCTION_8_2();
  sub_2378C95B0();
  sub_2378C407C((unint64_t *)&unk_268934BF0, 255, MEMORY[0x263F8F6D8]);
  sub_2378C9540();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_2378C39F0;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_2378C39F0()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v2;
  uint64_t v5 = *(void (**)(uint64_t))(v4 + 96);
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v7 = v6;
  *(void *)(v3 + 120) = v0;
  swift_task_dealloc();
  uint64_t v8 = OUTLINED_FUNCTION_8_2();
  v5(v8);
  if (v0)
  {
    OUTLINED_FUNCTION_46();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_35();
    return v12();
  }
}

uint64_t sub_2378C3B6C()
{
  OUTLINED_FUNCTION_41();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v0();
}

uint64_t sub_2378C3BD4()
{
  OUTLINED_FUNCTION_41();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_25_1(v0);
  void *v1 = v2;
  v1[1] = sub_2378A6320;
  return sub_2378C1040();
}

uint64_t type metadata accessor for SCRestartShutdownFlow()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for SCRestartShutdownFlow.State(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x2378C3D54);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SCRestartShutdownFlow.State()
{
  return &type metadata for SCRestartShutdownFlow.State;
}

unint64_t sub_2378C3D90()
{
  unint64_t result = qword_268934BA8;
  if (!qword_268934BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934BA8);
  }
  return result;
}

uint64_t sub_2378C3DDC(unsigned char *a1)
{
  return sub_2378C294C(a1, v1);
}

unint64_t sub_2378C3DE4()
{
  unint64_t result = qword_268934BB0;
  if (!qword_268934BB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_268934BB0);
  }
  return result;
}

uint64_t sub_2378C3E24()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2378C3E6C(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v7 = v1[7];
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = (void *)OUTLINED_FUNCTION_25_1(v9);
  *uint64_t v10 = v11;
  v10[1] = sub_2378A6320;
  return sub_2378C152C(a1, v3, v4, v5, v6, v8, v7);
}

uint64_t sub_2378C3F38()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2378C3F70(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_25_1(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_2378A946C;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268934BD0 + dword_268934BD0);
  return v7(a1, v3);
}

uint64_t sub_2378C4020(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_19();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_2378C407C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7_7(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_10_6()
{
  uint64_t v1 = *(void *)(v0 + 40);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 32) + 40), *(void *)(*(void *)(v0 + 32) + 64));
  return v1;
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_29_1()
{
  return v0;
}

uint64_t sub_2378C41C4(uint64_t a1, void *a2)
{
  return sub_2378C4360(a1, a2, "SCAppIntentConnectionDelegate got LNConfirmationRequest: %@", 1);
}

uint64_t sub_2378C4248(uint64_t a1, void *a2)
{
  return sub_2378C4360(a1, a2, "SCAppIntentConnectionDelegate got LNActionConfirmationRequest: %@", 3);
}

uint64_t sub_2378C42CC(uint64_t a1, void *a2)
{
  return sub_2378C4360(a1, a2, "SCAppIntentConnectionDelegate got LNDisambiguationRequest: %@", 2);
}

uint64_t sub_2378C4350(uint64_t a1, void *a2)
{
  return sub_2378C4360(a1, a2, "SCAppIntentConnectionDelegate got LNNeedsValueRequest: %@", 0);
}

uint64_t sub_2378C4360(uint64_t a1, void *a2, const char *a3, char a4)
{
  uint64_t v34 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934C98);
  OUTLINED_FUNCTION_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_3_7();
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v13, (uint64_t)qword_268936078);
  uint64_t v35 = v15;
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_3();
  v17();
  id v18 = a2;
  unsigned __int8 v19 = sub_2378C9270();
  os_log_type_t v20 = sub_2378C9440();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v33 = v7;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v31 = v12;
    uint64_t v22 = (uint8_t *)v21;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v32 = v9;
    uint64_t v28 = (void *)v23;
    uint64_t v29 = v13;
    *(_DWORD *)uint64_t v22 = 138412290;
    id v36 = v18;
    id v24 = v18;
    uint64_t v30 = v4;
    id v25 = v24;
    uint64_t v7 = v33;
    uint64_t v13 = v29;
    sub_2378C94B0();
    *uint64_t v28 = v18;

    _os_log_impl(&dword_237899000, v19, v20, v34, v22, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934BC8);
    swift_arrayDestroy();
    uint64_t v9 = v32;
    OUTLINED_FUNCTION_12();
    uint64_t v12 = v31;
    OUTLINED_FUNCTION_12();
  }
  else
  {
  }
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v4, v13);
  id v36 = v18;
  char v37 = a4;
  id v26 = v18;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934CA0);
  sub_2378C9400();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v7);
}

void sub_2378C46AC(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v59 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934CA0);
  OUTLINED_FUNCTION_2();
  uint64_t v60 = v6;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934C98);
  OUTLINED_FUNCTION_2();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_2();
  uint64_t v16 = v15;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  os_log_type_t v20 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v51 - v21;
  if (!a3)
  {
    uint64_t v35 = v59;
    uint64_t v53 = v3;
    uint64_t v54 = v9;
    uint64_t v55 = v12;
    uint64_t v56 = v10;
    if (qword_268934168 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v14, (uint64_t)qword_268936078);
    OUTLINED_FUNCTION_3();
    v36();
    char v37 = v35;
    uint64_t v38 = sub_2378C9270();
    os_log_type_t v39 = sub_2378C9440();
    BOOL v40 = os_log_type_enabled(v38, v39);
    uint64_t v52 = v37;
    if (v40)
    {
      uint64_t v57 = v14;
      uint64_t v58 = v5;
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 138412290;
      if (!v35)
      {
LABEL_17:
        __break(1u);
        return;
      }
      uint64_t v62 = v37;
      uint64_t v42 = v37;
      sub_2378C94B0();
      uint64_t v35 = v59;
      *uint64_t v51 = v59;

      _os_log_impl(&dword_237899000, v38, v39, "SCAppIntentConnectionDelegate finished with result: %@", v41, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268934BC8);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_12();
      uint64_t v14 = v57;
      uint64_t v5 = v58;
    }
    else
    {

      uint64_t v38 = v37;
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v14);
    uint64_t v44 = v54;
    OUTLINED_FUNCTION_3();
    v45();
    uint64_t v46 = (uint64_t)v35;
    uint64_t v48 = v55;
    uint64_t v47 = v56;
    uint64_t v49 = v53;
    if (v46)
    {
      uint64_t v62 = v46;
      char v63 = 5;
      uint64_t v50 = v52;
      sub_2378C9400();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v44, v5);
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v47);
      uint64_t v62 = 0;
      sub_2378C9410();
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v23 = a3;
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v14, (uint64_t)qword_268936078);
  uint64_t v24 = v16;
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_3();
  v25();
  id v26 = a3;
  uint64_t v27 = a3;
  uint64_t v28 = sub_2378C9270();
  os_log_type_t v29 = sub_2378C9440();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v57 = v14;
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v58 = v5;
    uint64_t v61 = (uint64_t)a3;
    uint64_t v62 = v31;
    *(_DWORD *)uint64_t v30 = 136315138;
    uint64_t v32 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934C90);
    uint64_t v33 = sub_2378C92F0();
    uint64_t v61 = sub_2378A1964(v33, v34, (uint64_t *)&v62);
    sub_2378C94B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237899000, v28, v29, "SCAppIntentConnectionDelegate finished with error: %s", v30, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v57);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v14);
  }
  uint64_t v62 = a3;
  uint64_t v43 = a3;
  sub_2378C9410();
}

uint64_t sub_2378C4CD8()
{
  OUTLINED_FUNCTION_41();
  uint64_t v1 = sub_2378C9280();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2378C4D90, 0, 0);
}

uint64_t sub_2378C4D90()
{
  OUTLINED_FUNCTION_10_3();
  if (qword_268934168 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_268936078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_2378C9270();
  os_log_type_t v6 = sub_2378C9440();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_237899000, v5, v6, "SCAppIntentConnectionDelegate executorEnvironmentForViewSnippet", v7, 2u);
    OUTLINED_FUNCTION_12();
  }
  uint64_t v9 = v0[3];
  uint64_t v8 = v0[4];
  uint64_t v10 = v0[2];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11(0);
}

uint64_t sub_2378C4F68(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_2378C5020;
  return sub_2378C4CD8();
}

uint64_t sub_2378C5020()
{
  OUTLINED_FUNCTION_10_3();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_4();
  uint64_t v4 = (void (**)(void, void))v3[4];
  uint64_t v5 = (void *)v3[3];
  id v6 = (void *)v3[2];
  uint64_t v7 = *v0;
  OUTLINED_FUNCTION_34();
  *uint64_t v8 = v7;
  swift_task_dealloc();

  ((void (**)(void, void *))v4)[2](v4, v2);
  _Block_release(v4);

  OUTLINED_FUNCTION_4_2();
  return v9();
}

uint64_t sub_2378C5150(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934CC0);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2378C93F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  long long v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  void v9[4] = &unk_268934CD0;
  v9[5] = v8;
  sub_2378C5BDC((uint64_t)v6, (uint64_t)&unk_268934CE0, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_2378C5254()
{
  uint64_t v1 = sub_2378C9280();
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3_7();
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_268936078);
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_3();
  v5();
  id v6 = sub_2378C9270();
  os_log_type_t v7 = sub_2378C9440();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_237899000, v6, v7, "SCAppIntentConnectionDelegate shouldRunShowOutputAction return false", v8, 2u);
    OUTLINED_FUNCTION_12();
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return 0;
}

uint64_t sub_2378C53F4(uint64_t a1, void *a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934C98);
  OUTLINED_FUNCTION_2();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_2();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3_7();
  if (qword_268934168 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v9, (uint64_t)qword_268936078);
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_3();
  v13();
  uint64_t v14 = sub_2378C9270();
  os_log_type_t v15 = sub_2378C9440();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_237899000, v14, v15, "SCAppIntentConnectionDelegate needsContinueInAppWith request", v16, 2u);
    OUTLINED_FUNCTION_12();
  }

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v9);
  id v17 = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934CA0);
  sub_2378C9400();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v3, v5);
}

void sub_2378C567C()
{
}

id sub_2378C56BC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SCAppIntentConnectionDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2378C5778()
{
  return type metadata accessor for SCAppIntentConnectionDelegate();
}

uint64_t type metadata accessor for SCAppIntentConnectionDelegate()
{
  uint64_t result = qword_268934C70;
  if (!qword_268934C70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2378C57C8()
{
  sub_2378C5864();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2378C5864()
{
  if (!qword_268934C88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268934C90);
    unint64_t v0 = sub_2378C9420();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268934C88);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for LinkConnectionEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v5 = v3;
  return a1;
}

void destroy for LinkConnectionEvent(id *a1)
{
}

uint64_t assignWithCopy for LinkConnectionEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for LinkConnectionEvent(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for LinkConnectionEvent(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFB && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 5) {
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

uint64_t storeEnumTagSinglePayload for LinkConnectionEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2378C5A24(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2378C5A2C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LinkConnectionEvent()
{
  return &type metadata for LinkConnectionEvent;
}

uint64_t sub_2378C5A44(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  char v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *char v4 = v3;
  v4[1] = sub_2378A946C;
  return v6();
}

uint64_t sub_2378C5B10(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_2378A946C;
  return v7();
}

uint64_t sub_2378C5BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2378C93F0();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_2378C6284(a1);
  }
  else
  {
    sub_2378C93E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2378C93C0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2378C5D44(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2378C5E20;
  return v6(a1);
}

uint64_t sub_2378C5E20()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_34();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v3();
}

uint64_t sub_2378C5EE4(uint64_t (*a1)(void))
{
  return a1();
}

void sub_2378C5F0C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_2378C94B0();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_2378C5FC4()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2378C600C()
{
  OUTLINED_FUNCTION_10_3();
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = (void *)v0[3];
  uint64_t v3 = (void *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_9_3(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_2378A6320;
  uint64_t v7 = (uint64_t (*)(void *, void *, void *))((char *)&dword_268934CB0 + dword_268934CB0);
  return v7(v1, v2, v3);
}

uint64_t sub_2378C60BC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_9_3(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_2378A946C;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268934CC8 + dword_268934CC8);
  return v7(v1, v2, v3);
}

uint64_t objectdestroy_8Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2378C61BC(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_9_3(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_2378A946C;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268934CD8 + dword_268934CD8);
  return v9(a1, v3, v4, v5);
}

uint64_t sub_2378C6284(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268934CC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2378C62E4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2378C631C()
{
  OUTLINED_FUNCTION_10_3();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_9_3(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_2378A6320;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268934CE8 + dword_268934CE8);
  return v7(v2, v3);
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return sub_2378C9280();
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_3(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t SCStopScreenRecordingFlow.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 0;
  return result;
}

uint64_t SCStopScreenRecordingFlow.init()()
{
  uint64_t result = v0;
  *(unsigned char *)(v0 + 16) = 0;
  return result;
}

uint64_t SCStopScreenRecordingFlow.on(input:)()
{
  return 1;
}

uint64_t SCStopScreenRecordingFlow.execute()()
{
  OUTLINED_FUNCTION_41();
  v1[35] = v2;
  v1[36] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689349C0);
  OUTLINED_FUNCTION_42(v3);
  v1[37] = OUTLINED_FUNCTION_31();
  uint64_t v4 = sub_2378C8C10();
  v1[38] = v4;
  OUTLINED_FUNCTION_0(v4);
  v1[39] = v5;
  v1[40] = OUTLINED_FUNCTION_31();
  uint64_t v6 = sub_2378C9280();
  v1[41] = v6;
  OUTLINED_FUNCTION_0(v6);
  v1[42] = v7;
  v1[43] = swift_task_alloc();
  v1[44] = swift_task_alloc();
  v1[45] = swift_task_alloc();
  v1[46] = swift_task_alloc();
  v1[47] = swift_task_alloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2378C6580()
{
  uint64_t v67 = v0;
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  char v1 = sub_2378C8BD0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v1)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(*(void *)(v0 + 328), (uint64_t)qword_268936078);
    uint64_t v2 = OUTLINED_FUNCTION_10_2();
    v3(v2);
    uint64_t v4 = sub_2378C9270();
    os_log_type_t v5 = sub_2378C9430();
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_12_0(&dword_237899000, v6, v7, "SCStopScreenRecordingFlow execute | cannot stop recording in Carplay");
      OUTLINED_FUNCTION_12();
    }
    uint64_t v8 = *(void *)(v0 + 288);

    uint64_t v9 = OUTLINED_FUNCTION_33_0();
    v10(v9);
    *(unsigned char *)(v8 + 16) = 2;
    swift_retain();
    sub_2378C8D90();
    sub_2378C89D0();
    OUTLINED_FUNCTION_32_1();
    *(void *)(v0 + 248) = sub_2378C89C0();
LABEL_13:
    sub_2378C8CB0();
    swift_release();
LABEL_14:
    OUTLINED_FUNCTION_7_9();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4_2();
    return v21();
  }
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), *(void *)(v0 + 80));
  char v11 = sub_2378C8BC0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  if (v11)
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(*(void *)(v0 + 328), (uint64_t)qword_268936078);
    uint64_t v12 = OUTLINED_FUNCTION_10_2();
    v13(v12);
    uint64_t v14 = sub_2378C9270();
    os_log_type_t v15 = sub_2378C9430();
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_12_0(&dword_237899000, v16, v17, "SCStopScreenRecordingFlow execute | cannot stop recording on watchOS");
      OUTLINED_FUNCTION_12();
    }
    uint64_t v18 = *(void *)(v0 + 288);

    uint64_t v19 = OUTLINED_FUNCTION_33_0();
    v20(v19);
    *(unsigned char *)(v18 + 16) = 2;
    swift_retain();
    sub_2378C8D90();
    sub_2378C89D0();
    OUTLINED_FUNCTION_32_1();
    *(void *)(v0 + 272) = sub_2378C89C0();
    goto LABEL_13;
  }
  uint64_t v23 = *(void *)(v0 + 288);
  if (*(unsigned char *)(v23 + 16))
  {
    if (qword_268934168 != -1) {
      swift_once();
    }
    uint64_t v24 = *(void *)(v0 + 368);
    uint64_t v25 = *(void *)(v0 + 328);
    uint64_t v26 = *(void *)(v0 + 336);
    uint64_t v27 = __swift_project_value_buffer(v25, (uint64_t)qword_268936078);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, v27, v25);
    swift_retain_n();
    uint64_t v28 = sub_2378C9270();
    os_log_type_t v29 = sub_2378C9430();
    BOOL v30 = os_log_type_enabled(v28, v29);
    uint64_t v31 = *(void *)(v0 + 368);
    uint64_t v32 = *(void *)(v0 + 328);
    uint64_t v33 = *(void *)(v0 + 336);
    if (v30)
    {
      uint64_t v63 = *(void *)(v0 + 368);
      unint64_t v34 = (uint8_t *)swift_slowAlloc();
      v66[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v34 = 136315138;
      *(unsigned char *)(v0 + 440) = *(unsigned char *)(v23 + 16);
      uint64_t v35 = sub_2378C92F0();
      *(void *)(v0 + 216) = sub_2378A1964(v35, v36, v66);
      sub_2378C94B0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237899000, v28, v29, "SCStopScreenRecordingFlow execute | flow completed with state: %s", v34, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_12();

      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v63, v32);
    }
    else
    {

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v31, v32);
    }
    sub_2378C8CD0();
    goto LABEL_14;
  }
  id v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64860]), sel_init);
  *(void *)(v0 + 384) = v37;
  if (qword_268934168 != -1) {
    swift_once();
  }
  uint64_t v38 = *(void *)(v0 + 376);
  uint64_t v39 = *(void *)(v0 + 328);
  uint64_t v40 = *(void *)(v0 + 336);
  uint64_t v41 = __swift_project_value_buffer(v39, (uint64_t)qword_268936078);
  *(void *)(v0 + 392) = v41;
  uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16);
  *(void *)(v0 + 400) = v42;
  *(void *)(v0 + 408) = (v40 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v42(v38, v41, v39);
  id v43 = v37;
  uint64_t v44 = sub_2378C9270();
  os_log_type_t v45 = sub_2378C9430();
  BOOL v46 = os_log_type_enabled(v44, v45);
  uint64_t v47 = *(void *)(v0 + 376);
  uint64_t v48 = *(void *)(v0 + 328);
  uint64_t v49 = *(void *)(v0 + 336);
  if (v46)
  {
    uint64_t v64 = *(void *)(v0 + 328);
    uint64_t v62 = *(void *)(v0 + 376);
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    v66[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v50 = 136315138;
    id v51 = v43;
    os_log_type_t type = v45;
    id v52 = objc_msgSend(v51, sel_description);
    uint64_t v53 = sub_2378C92E0();
    id v65 = v43;
    unint64_t v55 = v54;

    *(void *)(v0 + 264) = sub_2378A1964(v53, v55, v66);
    sub_2378C94B0();

    id v43 = v65;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237899000, v44, type, "SCStopScreenRecordingFlow execute | submitting command: %s", v50, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
    v56(v62, v64);
  }
  else
  {

    uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
    v56(v47, v48);
  }
  *(void *)(v0 + 416) = v56;
  sub_2378C8B70();
  uint64_t v57 = *(void *)(v0 + 200);
  uint64_t v58 = *(void *)(v0 + 208);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 176), v57);
  uint64_t v59 = (void *)swift_task_alloc();
  *(void *)(v0 + 424) = v59;
  unint64_t v60 = sub_2378B8FA4();
  void *v59 = v0;
  v59[1] = sub_2378C6D94;
  return MEMORY[0x270F67CE0](v43, v57, v60, v58);
}

uint64_t sub_2378C6D94()
{
  OUTLINED_FUNCTION_41();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1();
  *os_log_type_t v5 = v4;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v7 = v6;
  *(void *)(v8 + 432) = v0;
  swift_task_dealloc();
  if (!v0) {

  }
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2378C6E78()
{
  uint64_t v10 = (void *)v0[48];
  uint64_t v2 = v0[39];
  uint64_t v1 = v0[40];
  uint64_t v4 = v0[37];
  uint64_t v3 = v0[38];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 22));
  sub_2378C8AF0();
  __swift_project_boxed_opaque_existential_1(v0 + 12, v0[15]);
  sub_2378C8B60();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F6F9F0], v3);
  uint64_t v5 = *MEMORY[0x263F6F748];
  uint64_t v6 = sub_2378C8B10();
  OUTLINED_FUNCTION_19();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 104))(v4, v5, v6);
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v6);
  sub_2378C8B50();
  sub_2378C8B00();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 12));
  swift_retain();
  sub_2378C8D90();
  sub_2378C89D0();
  swift_allocObject();
  v0[32] = sub_2378C89C0();
  sub_2378C8CB0();

  swift_release();
  OUTLINED_FUNCTION_7_9();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v8();
}

uint64_t sub_2378C70D0()
{
  uint64_t v35 = v0;
  uint64_t v1 = *(void **)(v0 + 432);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 400);
  uint64_t v3 = *(void *)(v0 + 392);
  uint64_t v4 = *(void *)(v0 + 344);
  uint64_t v5 = *(void *)(v0 + 328);

  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  v2(v4, v3, v5);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2378C9270();
  os_log_type_t v9 = sub_2378C9450();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = *(void **)(v0 + 432);
    uint64_t v32 = *(void *)(v0 + 344);
    uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v0 + 416);
    uint64_t v31 = *(void *)(v0 + 328);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    v34[0] = v12;
    *(void *)(v0 + 232) = v10;
    id v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268934C90);
    uint64_t v14 = sub_2378C92F0();
    *(void *)(v0 + 240) = sub_2378A1964(v14, v15, v34);
    sub_2378C94B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237899000, v8, v9, "SCStopScreenRecordingFlow execute | unable to stop recording: %s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();

    v33(v32, v31);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 432);
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 416);
    uint64_t v18 = *(void *)(v0 + 344);
    uint64_t v19 = *(void *)(v0 + 328);

    v17(v18, v19);
  }
  os_log_type_t v20 = *(void **)(v0 + 432);
  uint64_t v22 = *(void *)(v0 + 312);
  uint64_t v21 = *(void *)(v0 + 320);
  uint64_t v24 = *(void *)(v0 + 296);
  uint64_t v23 = *(void *)(v0 + 304);
  *(unsigned char *)(*(void *)(v0 + 288) + 16) = 2;
  sub_2378C8AF0();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 136), *(void *)(v0 + 160));
  sub_2378C8B60();
  (*(void (**)(uint64_t, void, uint64_t))(v22 + 104))(v21, *MEMORY[0x263F6F9E0], v23);
  uint64_t v25 = *MEMORY[0x263F6F6C8];
  uint64_t v26 = sub_2378C8B10();
  OUTLINED_FUNCTION_19();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 104))(v24, v25, v26);
  __swift_storeEnumTagSinglePayload(v24, 0, 1, v26);
  *(void *)(swift_allocObject() + 16) = v20;
  id v28 = v20;
  sub_2378C8B50();
  sub_2378C8B00();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  swift_retain();
  sub_2378C8D90();
  sub_2378C89D0();
  OUTLINED_FUNCTION_32_1();
  *(void *)(v0 + 224) = sub_2378C89C0();
  sub_2378C8CB0();

  swift_release();
  OUTLINED_FUNCTION_7_9();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_2();
  return v29();
}

uint64_t sub_2378C7500()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A946C;
  return sub_2378C77BC();
}

uint64_t sub_2378C7598()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return sub_2378C77BC();
}

uint64_t sub_2378C7630()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A946C;
  return sub_2378C7F54();
}

uint64_t sub_2378C76C8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A946C;
  return sub_2378C7B7C();
}

uint64_t SCStopScreenRecordingFlow.execute(completion:)()
{
  return sub_2378C8A90();
}

uint64_t sub_2378C77BC()
{
  OUTLINED_FUNCTION_41();
  v0[22] = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934320);
  OUTLINED_FUNCTION_42(v2);
  v0[23] = OUTLINED_FUNCTION_31();
  uint64_t v3 = sub_2378C8D30();
  v0[24] = v3;
  OUTLINED_FUNCTION_0(v3);
  v0[25] = v4;
  v0[26] = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2378C786C()
{
  OUTLINED_FUNCTION_41();
  sub_2378C8E40();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v1;
  void *v1 = v0;
  v1[1] = sub_2378C7910;
  uint64_t v2 = *(void *)(v0 + 208);
  return MEMORY[0x270F67A20](v2, v0 + 16);
}

uint64_t sub_2378C7910()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1();
  *uint64_t v3 = v2;
  uint64_t v4 = v2 + 16;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v6 = v5;
  *(void *)(v7 + 224) = v0;
  swift_task_dealloc();
  sub_2378BEFF4(v4, &qword_268934810);
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2378C7A00()
{
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v10 = *(void *)(v0 + 192);
  uint64_t v4 = *(uint64_t **)(v0 + 176);
  sub_2378C8E40();
  sub_2378C8E40();
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
  sub_2378C8B90();
  uint64_t v5 = sub_2378C8D00();
  uint64_t v6 = OUTLINED_FUNCTION_11_0(v5);
  *(_OWORD *)(v0 + 152) = 0u;
  *(void *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  uint64_t v7 = MEMORY[0x263F6FFF0];
  v4[3] = v6;
  void v4[4] = v7;
  __swift_allocate_boxed_opaque_existential_1(v4);
  sub_2378C8C90();
  sub_2378BEFF4(v0 + 136, &qword_268934338);
  sub_2378BEFF4(v3, (uint64_t *)&unk_268934320);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v10);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_35();
  return v8();
}

uint64_t sub_2378C7B7C()
{
  OUTLINED_FUNCTION_41();
  v0[22] = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934320);
  OUTLINED_FUNCTION_42(v2);
  v0[23] = OUTLINED_FUNCTION_31();
  uint64_t v3 = sub_2378C8D30();
  v0[24] = v3;
  OUTLINED_FUNCTION_0(v3);
  v0[25] = v4;
  v0[26] = OUTLINED_FUNCTION_31();
  uint64_t v5 = sub_2378C9260();
  OUTLINED_FUNCTION_42(v5);
  v0[27] = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_2378C7C4C()
{
  type metadata accessor for ScreenRecordingCATs();
  sub_2378C9250();
  sub_2378C91C0();
  sub_2378C8E40();
  sub_2378C91A0();
  sub_2378BEFF4(v0 + 16, &qword_268934810);
  sub_2378C91B0();
  swift_release();
  *(void *)(v0 + 224) = sub_2378C91F0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v1;
  void *v1 = v0;
  v1[1] = sub_2378C7D5C;
  return sub_2378C004C();
}

uint64_t sub_2378C7D5C()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 240) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2378C7E38()
{
  OUTLINED_FUNCTION_6_7();
  sub_2378C8E40();
  OUTLINED_FUNCTION_18_1();
  uint64_t v5 = sub_2378C8D00();
  OUTLINED_FUNCTION_11_0(v5);
  OUTLINED_FUNCTION_19_1();
  uint64_t v6 = MEMORY[0x263F6FFF0];
  v4[3] = v7;
  void v4[4] = v6;
  __swift_allocate_boxed_opaque_existential_1(v4);
  OUTLINED_FUNCTION_12_3();
  sub_2378C8C90();
  swift_release();
  sub_2378BEFF4(v1, &qword_268934338);
  sub_2378BEFF4(v0, (uint64_t *)&unk_268934320);
  __swift_destroy_boxed_opaque_existential_1(v3);
  uint64_t v8 = OUTLINED_FUNCTION_20_2();
  v9(v8);
  __swift_destroy_boxed_opaque_existential_1(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_35();
  return v10();
}

uint64_t sub_2378C7F54()
{
  OUTLINED_FUNCTION_41();
  v0[22] = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268934320);
  OUTLINED_FUNCTION_42(v2);
  v0[23] = OUTLINED_FUNCTION_31();
  uint64_t v3 = sub_2378C8D30();
  v0[24] = v3;
  OUTLINED_FUNCTION_0(v3);
  v0[25] = v4;
  v0[26] = OUTLINED_FUNCTION_31();
  uint64_t v5 = sub_2378C9260();
  OUTLINED_FUNCTION_42(v5);
  v0[27] = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_2378C8024()
{
  type metadata accessor for ScreenRecordingCATs();
  sub_2378C9250();
  sub_2378C91C0();
  sub_2378C8E40();
  sub_2378C91A0();
  sub_2378BEFF4(v0 + 16, &qword_268934810);
  sub_2378C91B0();
  swift_release();
  *(void *)(v0 + 224) = sub_2378C91F0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v1;
  void *v1 = v0;
  v1[1] = sub_2378C8134;
  return sub_2378C00FC();
}

uint64_t sub_2378C8134()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_34();
  *uint64_t v5 = v4;
  *(void *)(v6 + 240) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_46();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2378C8210()
{
  OUTLINED_FUNCTION_6_7();
  sub_2378C8E40();
  OUTLINED_FUNCTION_18_1();
  uint64_t v5 = sub_2378C8D00();
  OUTLINED_FUNCTION_11_0(v5);
  OUTLINED_FUNCTION_19_1();
  uint64_t v6 = MEMORY[0x263F6FFF0];
  v4[3] = v7;
  void v4[4] = v6;
  __swift_allocate_boxed_opaque_existential_1(v4);
  OUTLINED_FUNCTION_12_3();
  sub_2378C8C70();
  swift_release();
  sub_2378BEFF4(v1, &qword_268934338);
  sub_2378BEFF4(v0, (uint64_t *)&unk_268934320);
  __swift_destroy_boxed_opaque_existential_1(v3);
  uint64_t v8 = OUTLINED_FUNCTION_20_2();
  v9(v8);
  __swift_destroy_boxed_opaque_existential_1(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_35();
  return v10();
}

uint64_t SCStopScreenRecordingFlow.deinit()
{
  return v0;
}

uint64_t SCStopScreenRecordingFlow.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 17, 7);
}

uint64_t sub_2378C8344()
{
  return SCStopScreenRecordingFlow.execute(completion:)();
}

uint64_t sub_2378C8368()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2378A6320;
  return SCStopScreenRecordingFlow.execute()();
}

uint64_t sub_2378C8404(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SCStopScreenRecordingFlow();
  return MEMORY[0x270F66CE8](v3, a2);
}

uint64_t sub_2378C843C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2378C8474()
{
  OUTLINED_FUNCTION_41();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_25_1(v0);
  void *v1 = v2;
  v1[1] = sub_2378A946C;
  OUTLINED_FUNCTION_31_0();
  return sub_2378C76C8();
}

uint64_t sub_2378C84FC()
{
  OUTLINED_FUNCTION_41();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_25_1(v0);
  void *v1 = v2;
  v1[1] = sub_2378A946C;
  OUTLINED_FUNCTION_31_0();
  return sub_2378C7630();
}

uint64_t sub_2378C8584()
{
  OUTLINED_FUNCTION_41();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_25_1(v0);
  void *v1 = v2;
  v1[1] = sub_2378A6320;
  OUTLINED_FUNCTION_31_0();
  return sub_2378C7598();
}

uint64_t sub_2378C860C()
{
  OUTLINED_FUNCTION_41();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_25_1(v0);
  void *v1 = v2;
  v1[1] = sub_2378A946C;
  OUTLINED_FUNCTION_31_0();
  return sub_2378C7500();
}

uint64_t type metadata accessor for SCStopScreenRecordingFlow()
{
  return self;
}

unint64_t sub_2378C86B8()
{
  unint64_t result = qword_268934780;
  if (!qword_268934780)
  {
    type metadata accessor for SCStopScreenRecordingFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934780);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SCStopScreenRecordingFlow.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x2378C87D0);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SCStopScreenRecordingFlow.State()
{
  return &type metadata for SCStopScreenRecordingFlow.State;
}

unint64_t sub_2378C880C()
{
  unint64_t result = qword_268934D70;
  if (!qword_268934D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268934D70);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return sub_2378C8E40();
}

uint64_t OUTLINED_FUNCTION_7_9()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  __swift_project_boxed_opaque_existential_1(v1, *(void *)(v0 + 120));
  return sub_2378C8B90();
}

double OUTLINED_FUNCTION_19_1()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 152) = 0u;
  *(void *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return v0;
}

uint64_t sub_2378C8940()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2378C8950()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2378C8960()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2378C8970()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_2378C8980()
{
  return MEMORY[0x270F66328]();
}

uint64_t sub_2378C89C0()
{
  return MEMORY[0x270F663D8]();
}

uint64_t sub_2378C89D0()
{
  return MEMORY[0x270F663E0]();
}

uint64_t sub_2378C8A10()
{
  return MEMORY[0x270F66710]();
}

uint64_t sub_2378C8A20()
{
  return MEMORY[0x270F668B8]();
}

uint64_t sub_2378C8A30()
{
  return MEMORY[0x270F66998]();
}

uint64_t sub_2378C8A40()
{
  return MEMORY[0x270F669B0]();
}

uint64_t sub_2378C8A50()
{
  return MEMORY[0x270F669D0]();
}

uint64_t sub_2378C8A60()
{
  return MEMORY[0x270F669D8]();
}

uint64_t sub_2378C8A70()
{
  return MEMORY[0x270F66A00]();
}

uint64_t sub_2378C8A80()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_2378C8A90()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_2378C8AA0()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_2378C8AD0()
{
  return MEMORY[0x270F66CF8]();
}

uint64_t sub_2378C8AE0()
{
  return MEMORY[0x270F66D18]();
}

uint64_t sub_2378C8AF0()
{
  return MEMORY[0x270F66DA0]();
}

uint64_t sub_2378C8B00()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_2378C8B10()
{
  return MEMORY[0x270F66E28]();
}

uint64_t sub_2378C8B20()
{
  return MEMORY[0x270F66F50]();
}

uint64_t sub_2378C8B30()
{
  return MEMORY[0x270F66F60]();
}

uint64_t sub_2378C8B40()
{
  return MEMORY[0x270F67010]();
}

uint64_t sub_2378C8B50()
{
  return MEMORY[0x270F67030]();
}

uint64_t sub_2378C8B60()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_2378C8B70()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_2378C8B80()
{
  return MEMORY[0x270F671D8]();
}

uint64_t sub_2378C8B90()
{
  return MEMORY[0x270F671E8]();
}

uint64_t sub_2378C8BA0()
{
  return MEMORY[0x270F67210]();
}

uint64_t sub_2378C8BB0()
{
  return MEMORY[0x270F67220]();
}

uint64_t sub_2378C8BC0()
{
  return MEMORY[0x270F67228]();
}

uint64_t sub_2378C8BD0()
{
  return MEMORY[0x270F67238]();
}

uint64_t sub_2378C8BF0()
{
  return MEMORY[0x270F672E8]();
}

uint64_t sub_2378C8C00()
{
  return MEMORY[0x270F67340]();
}

uint64_t sub_2378C8C10()
{
  return MEMORY[0x270F673A8]();
}

uint64_t sub_2378C8C20()
{
  return MEMORY[0x270F673C8]();
}

uint64_t sub_2378C8C30()
{
  return MEMORY[0x270F67500]();
}

uint64_t sub_2378C8C40()
{
  return MEMORY[0x270F67508]();
}

uint64_t sub_2378C8C50()
{
  return MEMORY[0x270F67510]();
}

uint64_t sub_2378C8C60()
{
  return MEMORY[0x270F67660]();
}

uint64_t sub_2378C8C70()
{
  return MEMORY[0x270F67678]();
}

uint64_t sub_2378C8C90()
{
  return MEMORY[0x270F676C0]();
}

uint64_t sub_2378C8CA0()
{
  return MEMORY[0x270F676E0]();
}

uint64_t sub_2378C8CB0()
{
  return MEMORY[0x270F67718]();
}

uint64_t sub_2378C8CC0()
{
  return MEMORY[0x270F67720]();
}

uint64_t sub_2378C8CD0()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_2378C8D00()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_2378C8D10()
{
  return MEMORY[0x270F67888]();
}

uint64_t sub_2378C8D20()
{
  return MEMORY[0x270F67890]();
}

uint64_t sub_2378C8D30()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_2378C8D50()
{
  return MEMORY[0x270F67B08]();
}

uint64_t sub_2378C8D60()
{
  return MEMORY[0x270F67B18]();
}

uint64_t sub_2378C8D70()
{
  return MEMORY[0x270F67BC0]();
}

uint64_t sub_2378C8D90()
{
  return MEMORY[0x270F67D58]();
}

uint64_t sub_2378C8DA0()
{
  return MEMORY[0x270F67E40]();
}

uint64_t sub_2378C8DB0()
{
  return MEMORY[0x270F67F18]();
}

uint64_t sub_2378C8DC0()
{
  return MEMORY[0x270F681A8]();
}

uint64_t sub_2378C8DD0()
{
  return MEMORY[0x270F681B0]();
}

uint64_t sub_2378C8DE0()
{
  return MEMORY[0x270F681B8]();
}

uint64_t sub_2378C8DF0()
{
  return MEMORY[0x270F68220]();
}

uint64_t sub_2378C8E00()
{
  return MEMORY[0x270F68230]();
}

uint64_t sub_2378C8E10()
{
  return MEMORY[0x270F68258]();
}

uint64_t sub_2378C8E20()
{
  return MEMORY[0x270F68268]();
}

uint64_t sub_2378C8E30()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_2378C8E40()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_2378C8E50()
{
  return MEMORY[0x270F68368]();
}

uint64_t sub_2378C8E60()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_2378C8E70()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_2378C8E80()
{
  return MEMORY[0x270F683B8]();
}

uint64_t sub_2378C8E90()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2378C8EA0()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_2378C8EB0()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_2378C8EC0()
{
  return MEMORY[0x270F6A718]();
}

uint64_t sub_2378C8ED0()
{
  return MEMORY[0x270F6A720]();
}

uint64_t sub_2378C8EE0()
{
  return MEMORY[0x270F6A728]();
}

uint64_t sub_2378C8EF0()
{
  return MEMORY[0x270F6A768]();
}

uint64_t sub_2378C8F00()
{
  return MEMORY[0x270F6A770]();
}

uint64_t sub_2378C8F10()
{
  return MEMORY[0x270F6A788]();
}

uint64_t sub_2378C8F20()
{
  return MEMORY[0x270F6A7E8]();
}

uint64_t sub_2378C8F30()
{
  return MEMORY[0x270F6A860]();
}

uint64_t sub_2378C8F40()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_2378C8F60()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t sub_2378C8F70()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_2378C8F80()
{
  return MEMORY[0x270F6AF70]();
}

uint64_t sub_2378C8F90()
{
  return MEMORY[0x270F6AF78]();
}

uint64_t sub_2378C8FA0()
{
  return MEMORY[0x270F6BB18]();
}

uint64_t sub_2378C8FB0()
{
  return MEMORY[0x270F6C0D8]();
}

uint64_t sub_2378C8FC0()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_2378C8FD0()
{
  return MEMORY[0x270F6C988]();
}

uint64_t sub_2378C8FE0()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_2378C8FF0()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_2378C9000()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_2378C9010()
{
  return MEMORY[0x270F6CCB0]();
}

uint64_t sub_2378C9020()
{
  return MEMORY[0x270F6CD28]();
}

uint64_t sub_2378C9030()
{
  return MEMORY[0x270F6CD40]();
}

uint64_t sub_2378C9040()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t sub_2378C9050()
{
  return MEMORY[0x270F6CE08]();
}

uint64_t sub_2378C9060()
{
  return MEMORY[0x270F6CE18]();
}

uint64_t sub_2378C9070()
{
  return MEMORY[0x270F6D1D0]();
}

uint64_t sub_2378C9080()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_2378C9090()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_2378C90A0()
{
  return MEMORY[0x270F6D828]();
}

uint64_t sub_2378C90B0()
{
  return MEMORY[0x270F6D990]();
}

uint64_t sub_2378C90C0()
{
  return MEMORY[0x270F6DA48]();
}

uint64_t sub_2378C90D0()
{
  return MEMORY[0x270F6DCA8]();
}

uint64_t sub_2378C90E0()
{
  return MEMORY[0x270F6DCB8]();
}

uint64_t sub_2378C90F0()
{
  return MEMORY[0x270F6DCF8]();
}

uint64_t sub_2378C9100()
{
  return MEMORY[0x270F6E1D0]();
}

uint64_t sub_2378C9110()
{
  return MEMORY[0x270F6E2B8]();
}

uint64_t sub_2378C9120()
{
  return MEMORY[0x270F6E2C0]();
}

uint64_t sub_2378C9130()
{
  return MEMORY[0x270F6E3B8]();
}

uint64_t sub_2378C9140()
{
  return MEMORY[0x270F6E408]();
}

uint64_t sub_2378C9150()
{
  return MEMORY[0x270F6E410]();
}

uint64_t sub_2378C9160()
{
  return MEMORY[0x270F6E420]();
}

uint64_t sub_2378C9170()
{
  return MEMORY[0x270F6E708]();
}

uint64_t sub_2378C9180()
{
  return MEMORY[0x270F6F420]();
}

uint64_t sub_2378C9190()
{
  return MEMORY[0x270F6F4B0]();
}

uint64_t sub_2378C91A0()
{
  return MEMORY[0x270F64E38]();
}

uint64_t sub_2378C91B0()
{
  return MEMORY[0x270F64E80]();
}

uint64_t sub_2378C91C0()
{
  return MEMORY[0x270F64EA0]();
}

uint64_t sub_2378C91D0()
{
  return MEMORY[0x270F64EA8]();
}

uint64_t sub_2378C91F0()
{
  return MEMORY[0x270F64EC0]();
}

uint64_t sub_2378C9200()
{
  return MEMORY[0x270F64EC8]();
}

uint64_t sub_2378C9210()
{
  return MEMORY[0x270F64FA0]();
}

uint64_t sub_2378C9220()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_2378C9230()
{
  return MEMORY[0x270F64FF8]();
}

uint64_t sub_2378C9240()
{
  return MEMORY[0x270F650C8]();
}

uint64_t sub_2378C9250()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_2378C9260()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_2378C9270()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2378C9280()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2378C9290()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_2378C92A0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2378C92B0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_2378C92C0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2378C92D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2378C92E0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2378C92F0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2378C9300()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2378C9310()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2378C9320()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_2378C9330()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2378C9340()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2378C9350()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2378C9360()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2378C9370()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2378C9380()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2378C9390()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2378C93A0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2378C93B0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2378C93C0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2378C93D0()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_2378C93E0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2378C93F0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2378C9400()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_2378C9410()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_2378C9420()
{
  return MEMORY[0x270FA20E8]();
}

uint64_t sub_2378C9430()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2378C9440()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2378C9450()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2378C9460()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2378C9470()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_2378C9480()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2378C9490()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_2378C94A0()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_2378C94B0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2378C94C0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2378C94D0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2378C94E0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2378C94F0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2378C9500()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2378C9510()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_2378C9520()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_2378C9530()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_2378C9540()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_2378C9550()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2378C9560()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2378C9570()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2378C9580()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2378C9590()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2378C95A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2378C95B0()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_2378C95D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2378C95E0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2378C95F0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2378C9600()
{
  return MEMORY[0x270F651A0]();
}

uint64_t sub_2378C9610()
{
  return MEMORY[0x270F9FFA8]();
}

uint64_t sub_2378C9620()
{
  return MEMORY[0x270F9FFE0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}